; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/950322-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i8* nocapture %a) nounwind uwtable readonly {
entry:
  %arrayidx = getelementptr inbounds i8* %a, i64 1
  %0 = load i8* %arrayidx, align 1, !tbaa !0
  %conv = zext i8 %0 to i32
  %1 = load i8* %a, align 1, !tbaa !0
  %conv2 = zext i8 %1 to i32
  %sub = sub nsw i32 %conv2, %conv
  %cmp = icmp slt i32 %sub, 0
  %sub4 = sub nsw i32 0, %sub
  %sub.lobit = lshr i32 %sub, 31
  %y.0 = select i1 %cmp, i32 %sub4, i32 %sub
  %add = add nsw i32 %y.0, %sub.lobit
  ret i32 %add
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
