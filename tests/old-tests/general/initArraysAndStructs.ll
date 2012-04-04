; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/initArraysAndStructs.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { i32, i32 }

@.str = private unnamed_addr constant [40 x i8] c"[4].a=%d, [4].b=%d, [5].a=%d, [5].b=%d\0A\00", align 1
@.str1 = private unnamed_addr constant [29 x i8] c"sizeof(s)/sizeof(s[0]) = %d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %s = alloca [6 x %struct.anon], align 16
  store i32 0, i32* %retval
  %tmp = bitcast [6 x %struct.anon]* %s to i8*
  call void @llvm.memset.p0i8.i64(i8* %tmp, i8 0, i64 48, i32 16, i1 false)
  %0 = bitcast i8* %tmp to [6 x %struct.anon]*
  %1 = getelementptr [6 x %struct.anon]* %0, i32 0, i32 4
  %2 = getelementptr %struct.anon* %1, i32 0, i32 0
  store i32 5, i32* %2
  %3 = getelementptr %struct.anon* %1, i32 0, i32 1
  store i32 6, i32* %3
  %4 = getelementptr [6 x %struct.anon]* %0, i32 0, i32 5
  %5 = getelementptr %struct.anon* %4, i32 0, i32 1
  store i32 8, i32* %5
  %arrayidx = getelementptr inbounds [6 x %struct.anon]* %s, i32 0, i64 4
  %b = getelementptr inbounds %struct.anon* %arrayidx, i32 0, i32 1
  %tmp1 = load i32* %b, align 4
  %arrayidx2 = getelementptr inbounds [6 x %struct.anon]* %s, i32 0, i64 5
  %a = getelementptr inbounds %struct.anon* %arrayidx2, i32 0, i32 0
  store i32 %tmp1, i32* %a, align 4
  %arrayidx3 = getelementptr inbounds [6 x %struct.anon]* %s, i32 0, i64 4
  %a4 = getelementptr inbounds %struct.anon* %arrayidx3, i32 0, i32 0
  %tmp5 = load i32* %a4, align 4
  %arrayidx6 = getelementptr inbounds [6 x %struct.anon]* %s, i32 0, i64 4
  %b7 = getelementptr inbounds %struct.anon* %arrayidx6, i32 0, i32 1
  %tmp8 = load i32* %b7, align 4
  %arrayidx9 = getelementptr inbounds [6 x %struct.anon]* %s, i32 0, i64 5
  %a10 = getelementptr inbounds %struct.anon* %arrayidx9, i32 0, i32 0
  %tmp11 = load i32* %a10, align 4
  %arrayidx12 = getelementptr inbounds [6 x %struct.anon]* %s, i32 0, i64 5
  %b13 = getelementptr inbounds %struct.anon* %arrayidx12, i32 0, i32 1
  %tmp14 = load i32* %b13, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([40 x i8]* @.str, i32 0, i32 0), i32 %tmp5, i32 %tmp8, i32 %tmp11, i32 %tmp14)
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str1, i32 0, i32 0), i64 6)
  ret i32 0
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare i32 @printf(i8*, ...)
