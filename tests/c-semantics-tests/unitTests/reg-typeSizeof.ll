; ModuleID = '/home/david/src/c-semantics/tests/unitTests/reg-typeSizeof.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.qsortArgs = type { i32*, i32* }

@a = global [4 x i32] [i32 7, i32 5, i32 9, i32 10], align 16
@a1 = common global %struct.qsortArgs zeroinitializer, align 8
@.str = private unnamed_addr constant [4 x i8] c"%d;\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %.compoundliteral = alloca %struct.qsortArgs, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  %b = getelementptr inbounds %struct.qsortArgs* %.compoundliteral, i32 0, i32 0
  store i32* getelementptr inbounds ([4 x i32]* @a, i32 0, i32 0), i32** %b, align 8
  %e = getelementptr inbounds %struct.qsortArgs* %.compoundliteral, i32 0, i32 1
  store i32* getelementptr inbounds ([4 x i32]* @a, i64 1, i64 0), i32** %e, align 8
  %0 = bitcast %struct.qsortArgs* %.compoundliteral to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast (%struct.qsortArgs* @a1 to i8*), i8* %0, i64 16, i32 8, i1 false)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32* %i, align 4
  %conv = sext i32 %1 to i64
  %cmp = icmp ult i64 %conv, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds [4 x i32]* @a, i32 0, i64 %idxprom
  %3 = load i32* %arrayidx, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %3)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %4 = load i32* %i, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0))
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @printf(i8*, ...)
