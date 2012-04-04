; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20090207-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo(i32 %i) nounwind uwtable readnone {
entry:
  %a = alloca [32 x i32], align 16
  %arrayidx = getelementptr inbounds [32 x i32]* %a, i64 0, i64 1
  store i32 3, i32* %arrayidx, align 4, !tbaa !0
  %arrayidx1 = getelementptr inbounds [32 x i32]* %a, i64 0, i64 0
  store i32 1, i32* %arrayidx1, align 16, !tbaa !0
  %idxprom = sext i32 %i to i64
  %arrayidx2 = getelementptr inbounds [32 x i32]* %a, i64 0, i64 %idxprom
  store i32 2, i32* %arrayidx2, align 4, !tbaa !0
  %0 = load i32* %arrayidx1, align 16, !tbaa !0
  ret i32 %0
}

define i32 @main() nounwind uwtable {
if.end:
  ret i32 0
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
