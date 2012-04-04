; ModuleID = '/home/david/src/c-semantics/tests/unitTests/bigDeclsInLoop.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { i32, [2 x i32], i8, %struct.anon.0, %union.anon, i32 ()* }
%struct.anon.0 = type { i32 }
%union.anon = type { i32 }

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %s = alloca [2 x %struct.anon], align 16
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 100
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = bitcast [2 x %struct.anon]* %s to i8*
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 64, i32 16, i1 false)
  %2 = bitcast i8* %1 to [2 x %struct.anon]*
  %3 = getelementptr [2 x %struct.anon]* %2, i32 0, i32 0
  %4 = getelementptr %struct.anon* %3, i32 0, i32 0
  store i32 1, i32* %4
  %5 = getelementptr %struct.anon* %3, i32 0, i32 1
  %6 = getelementptr %struct.anon* %3, i32 0, i32 2
  %7 = getelementptr %struct.anon* %3, i32 0, i32 3
  %8 = getelementptr %struct.anon* %3, i32 0, i32 4
  %9 = getelementptr %struct.anon* %3, i32 0, i32 5
  %10 = getelementptr [2 x %struct.anon]* %2, i32 0, i32 1
  %11 = getelementptr %struct.anon* %10, i32 0, i32 0
  store i32 2, i32* %11
  %12 = getelementptr %struct.anon* %10, i32 0, i32 1
  %13 = getelementptr %struct.anon* %10, i32 0, i32 2
  %14 = getelementptr %struct.anon* %10, i32 0, i32 3
  %15 = getelementptr %struct.anon* %10, i32 0, i32 4
  %16 = getelementptr %struct.anon* %10, i32 0, i32 5
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %17 = load i32* %i, align 4
  %inc = add nsw i32 %17, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind
