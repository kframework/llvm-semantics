; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/challenge03.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.s = type { [2 x i8] }
%union.anon = type { [2 x %struct.s] }

@u = global %union.anon { [2 x %struct.s] [%struct.s { [2 x i8] c"\01\02" }, %struct.s { [2 x i8] c"\03\04" }] }, align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %p = alloca i8*, align 8
  store i32 0, i32* %retval
  store i8* getelementptr inbounds (%union.anon* @u, i32 0, i32 0, i32 0, i32 0, i32 0), i8** %p, align 8
  %tmp = load i8** %p, align 8
  %arrayidx = getelementptr inbounds i8* %tmp, i64 0
  %tmp1 = load i8* %arrayidx
  %conv = sext i8 %tmp1 to i32
  %tmp2 = load i8** %p, align 8
  %arrayidx3 = getelementptr inbounds i8* %tmp2, i64 1
  %tmp4 = load i8* %arrayidx3
  %conv5 = sext i8 %tmp4 to i32
  %add = add nsw i32 %conv, %conv5
  %tmp6 = load i8** %p, align 8
  %arrayidx7 = getelementptr inbounds i8* %tmp6, i64 2
  %tmp8 = load i8* %arrayidx7
  %conv9 = sext i8 %tmp8 to i32
  %add10 = add nsw i32 %add, %conv9
  %tmp11 = load i8** %p, align 8
  %arrayidx12 = getelementptr inbounds i8* %tmp11, i64 3
  %tmp13 = load i8* %arrayidx12
  %conv14 = sext i8 %tmp13 to i32
  %add15 = add nsw i32 %add10, %conv14
  ret i32 %add15
}
