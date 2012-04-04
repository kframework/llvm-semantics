; ModuleID = '/home/david/src/c-semantics/tests/unitTests/challenge03.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.anon = type { [2 x %struct.s] }
%struct.s = type { [2 x i8] }

@u = global %union.anon { [2 x %struct.s] [%struct.s { [2 x i8] c"\01\02" }, %struct.s { [2 x i8] c"\03\04" }] }, align 1

define i32 @main() nounwind uwtable readonly {
entry:
  %0 = load i8* getelementptr inbounds (%union.anon* @u, i64 0, i32 0, i64 0, i32 0, i64 0), align 1, !tbaa !0
  %conv = sext i8 %0 to i32
  %1 = load i8* getelementptr inbounds (%union.anon* @u, i64 0, i32 0, i64 0, i32 0, i64 1), align 1, !tbaa !0
  %conv2 = sext i8 %1 to i32
  %2 = load i8* getelementptr inbounds (%union.anon* @u, i64 0, i32 0, i64 1, i32 0, i64 0), align 1, !tbaa !0
  %conv4 = sext i8 %2 to i32
  %3 = load i8* getelementptr inbounds (%union.anon* @u, i64 0, i32 0, i64 1, i32 0, i64 1), align 1, !tbaa !0
  %conv7 = sext i8 %3 to i32
  %add = add i32 %conv2, %conv
  %add5 = add i32 %add, %conv4
  %add8 = add i32 %add5, %conv7
  ret i32 %add8
}

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
