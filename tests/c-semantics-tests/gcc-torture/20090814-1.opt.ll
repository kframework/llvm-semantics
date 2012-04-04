; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20090814-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@i = common global i32 0, align 4
@a = common global [2 x i32] zeroinitializer, align 4

define i32 @bar(i32* nocapture %a) nounwind uwtable readonly noinline {
entry:
  %0 = load i32* %a, align 4, !tbaa !0
  ret i32 %0
}

define i32 @foo([2 x i32]* nocapture %a) nounwind uwtable readonly noinline {
entry:
  %0 = load i32* @i, align 4, !tbaa !0
  %idxprom = sext i32 %0 to i64
  %arrayidx = getelementptr inbounds [2 x i32]* %a, i64 0, i64 %idxprom
  %call = tail call i32 @bar(i32* %arrayidx)
  ret i32 %call
}

define i32 @main() nounwind uwtable {
entry:
  store i32 -1, i32* getelementptr inbounds ([2 x i32]* @a, i64 0, i64 0), align 4, !tbaa !0
  store i32 42, i32* getelementptr inbounds ([2 x i32]* @a, i64 0, i64 1), align 4, !tbaa !0
  store i32 1, i32* @i, align 4, !tbaa !0
  %call = tail call i32 @foo([2 x i32]* @a)
  %cmp = icmp eq i32 %call, 42
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
