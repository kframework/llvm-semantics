; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr28403.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@global = common global i32 0, align 4

define i32 @foo(i32 %x1, i32 %x2, i32 %x3, i32 %x4, i32 %x5, i32 %x6, i32 %x7, i32 %x8) nounwind uwtable noinline {
entry:
  %add = add i32 %x2, %x1
  %add1 = add i32 %add, %x3
  %add2 = add i32 %add1, %x4
  %add3 = add i32 %add2, %x5
  %add4 = add i32 %add3, %x6
  %add5 = add i32 %add4, %x7
  %add6 = add i32 %add5, %x8
  store i32 %add6, i32* @global, align 4, !tbaa !0
  ret i32 0
}

define i64 @bar(i64 %x) nounwind uwtable noinline {
entry:
  %call = tail call i32 @foo(i32 1, i32 2, i32 1, i32 3, i32 1, i32 4, i32 1, i32 5)
  %0 = load i32* @global, align 4, !tbaa !0
  %sh_prom = zext i32 %0 to i64
  %shr = lshr i64 %x, %sh_prom
  ret i64 %shr
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %call = tail call i64 @bar(i64 81985529216486895)
  %cmp = icmp eq i64 %call, 312749974122
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
