; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20040805-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = global [2 x i32] [i32 2, i32 3], align 4

define i32 @main() noreturn nounwind uwtable {
entry:
  %call = tail call fastcc i32 @foo()
  %cmp = icmp eq i32 %call, 102
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

define internal fastcc i32 @foo() nounwind uwtable noinline {
entry:
  %0 = load i32* getelementptr inbounds ([2 x i32]* @a, i64 0, i64 0), align 4, !tbaa !0
  store i32 %0, i32* getelementptr inbounds ([2 x i32]* @a, i64 0, i64 1), align 4, !tbaa !0
  %call = tail call fastcc i32 @bar(i32 100)
  %call2 = tail call fastcc i32 @bar(i32 %0)
  %add = add nsw i32 %call2, %call
  ret i32 %add
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

define internal fastcc i32 @bar(i32 %x) nounwind uwtable noinline {
entry:
  %0 = load i32* getelementptr inbounds ([2 x i32]* @a, i64 0, i64 0), align 4, !tbaa !0
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* getelementptr inbounds ([2 x i32]* @a, i64 0, i64 0), align 4, !tbaa !0
  ret i32 %x
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
