; ModuleID = '/home/david/src/c-semantics/tests/unitTests/challenge03.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.anon = type { [2 x %struct.s] }
%struct.s = type { [2 x i8] }

@u = global %union.anon { [2 x %struct.s] [%struct.s { [2 x i8] c"\01\02" }, %struct.s { [2 x i8] c"\03\04" }] }, align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %p = alloca i8*, align 8
  store i32 0, i32* %retval
  store i8* getelementptr inbounds (%union.anon* @u, i32 0, i32 0, i32 0, i32 0, i32 0), i8** %p, align 8
  %0 = load i8** %p, align 8
  %arrayidx = getelementptr inbounds i8* %0, i64 0
  %1 = load i8* %arrayidx, align 1
  %conv = sext i8 %1 to i32
  %2 = load i8** %p, align 8
  %arrayidx1 = getelementptr inbounds i8* %2, i64 1
  %3 = load i8* %arrayidx1, align 1
  %conv2 = sext i8 %3 to i32
  %add = add nsw i32 %conv, %conv2
  %4 = load i8** %p, align 8
  %arrayidx3 = getelementptr inbounds i8* %4, i64 2
  %5 = load i8* %arrayidx3, align 1
  %conv4 = sext i8 %5 to i32
  %add5 = add nsw i32 %add, %conv4
  %6 = load i8** %p, align 8
  %arrayidx6 = getelementptr inbounds i8* %6, i64 3
  %7 = load i8* %arrayidx6, align 1
  %conv7 = sext i8 %7 to i32
  %add8 = add nsw i32 %add5, %conv7
  ret i32 %add8
}
