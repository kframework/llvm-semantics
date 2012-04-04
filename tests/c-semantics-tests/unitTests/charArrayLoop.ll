; ModuleID = '/home/david/src/c-semantics/tests/unitTests/charArrayLoop.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca [2 x [5 x i8]], align 1
  %count = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %p = alloca i8*, align 8
  %i12 = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = bitcast [2 x [5 x i8]]* %a to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 10, i32 1, i1 false)
  store i32 0, i32* %count, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc7, %entry
  %1 = load i32* %i, align 4
  %cmp = icmp slt i32 %1, 2
  br i1 %cmp, label %for.body, label %for.end9

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32* %j, align 4
  %cmp2 = icmp slt i32 %2, 5
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %3 = load i32* %count, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %count, align 4
  %conv = trunc i32 %3 to i8
  %4 = load i32* %j, align 4
  %idxprom = sext i32 %4 to i64
  %5 = load i32* %i, align 4
  %idxprom4 = sext i32 %5 to i64
  %arrayidx = getelementptr inbounds [2 x [5 x i8]]* %a, i32 0, i64 %idxprom4
  %arrayidx5 = getelementptr inbounds [5 x i8]* %arrayidx, i32 0, i64 %idxprom
  store i8 %conv, i8* %arrayidx5, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %6 = load i32* %j, align 4
  %inc6 = add nsw i32 %6, 1
  store i32 %inc6, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc7

for.inc7:                                         ; preds = %for.end
  %7 = load i32* %i, align 4
  %inc8 = add nsw i32 %7, 1
  store i32 %inc8, i32* %i, align 4
  br label %for.cond

for.end9:                                         ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [2 x [5 x i8]]* %a, i32 0, i64 0
  %arrayidx11 = getelementptr inbounds [5 x i8]* %arrayidx10, i32 0, i64 0
  store i8* %arrayidx11, i8** %p, align 8
  store i32 0, i32* %i12, align 4
  br label %for.cond13

for.cond13:                                       ; preds = %for.inc18, %for.end9
  %8 = load i32* %i12, align 4
  %cmp14 = icmp slt i32 %8, 10
  br i1 %cmp14, label %for.body16, label %for.end20

for.body16:                                       ; preds = %for.cond13
  %9 = load i8** %p, align 8
  %10 = load i32* %i12, align 4
  %idx.ext = sext i32 %10 to i64
  %add.ptr = getelementptr inbounds i8* %9, i64 %idx.ext
  %11 = load i8* %add.ptr, align 1
  %conv17 = sext i8 %11 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %conv17)
  br label %for.inc18

for.inc18:                                        ; preds = %for.body16
  %12 = load i32* %i12, align 4
  %inc19 = add nsw i32 %12, 1
  store i32 %inc19, i32* %i12, align 4
  br label %for.cond13

for.end20:                                        ; preds = %for.cond13
  %13 = load i32* %retval
  ret i32 %13
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare i32 @printf(i8*, ...)
