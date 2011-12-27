; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/bigDeclsInLoop.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i32, [2 x i32], i8, %struct.anon, %struct.anon, i32 ()* }
%struct.anon = type { i32 }
%union.anon = type { i32 }

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %s = alloca [2 x %0], align 16
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 100
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = bitcast [2 x %0]* %s to i8*
  call void @llvm.memset.p0i8.i64(i8* %tmp2, i8 0, i64 64, i32 16, i1 false)
  %0 = bitcast i8* %tmp2 to [2 x %0]*
  %1 = getelementptr [2 x %0]* %0, i32 0, i32 0
  %2 = getelementptr %0* %1, i32 0, i32 0
  store i32 1, i32* %2
  %3 = getelementptr [2 x %0]* %0, i32 0, i32 1
  %4 = getelementptr %0* %3, i32 0, i32 0
  store i32 2, i32* %4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp3 = load i32* %i, align 4
  %inc = add nsw i32 %tmp3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind
