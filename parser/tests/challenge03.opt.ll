; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/challenge03.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.s = type { [2 x i8] }
%union.anon = type { [2 x %struct.s] }

@u = global %union.anon { [2 x %struct.s] [%struct.s { [2 x i8] c"\01\02" }, %struct.s { [2 x i8] c"\03\04" }] }, align 1

define i32 @main() nounwind uwtable readonly {
entry:
  %tmp1 = load i8* getelementptr inbounds (%union.anon* @u, i64 0, i32 0, i64 0, i32 0, i64 0), align 1
  %conv = sext i8 %tmp1 to i32
  %tmp4 = load i8* getelementptr inbounds (%union.anon* @u, i64 0, i32 0, i64 0, i32 0, i64 1), align 1
  %conv5 = sext i8 %tmp4 to i32
  %tmp8 = load i8* getelementptr inbounds (%union.anon* @u, i64 0, i32 0, i64 1, i32 0, i64 0), align 1
  %conv9 = sext i8 %tmp8 to i32
  %tmp13 = load i8* getelementptr inbounds (%union.anon* @u, i64 0, i32 0, i64 1, i32 0, i64 1), align 1
  %conv14 = sext i8 %tmp13 to i32
  %add = add i32 %conv5, %conv
  %add10 = add i32 %add, %conv9
  %add15 = add i32 %add10, %conv14
  ret i32 %add15
}
