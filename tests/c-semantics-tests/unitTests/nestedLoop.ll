; ModuleID = '/home/david/src/c-semantics/tests/unitTests/nestedLoop.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@sec26.y1 = private unnamed_addr constant [4 x [3 x i32]] [[3 x i32] [i32 1, i32 3, i32 5], [3 x i32] [i32 2, i32 4, i32 6], [3 x i32] [i32 3, i32 5, i32 7], [3 x i32] zeroinitializer], align 16
@.str = private unnamed_addr constant [16 x i8] c"(i, j)=(%d, %d)\00", align 1

define i32 @sec26() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %y1 = alloca [4 x [3 x i32]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %0 = bitcast [4 x [3 x i32]]* %y1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([4 x [3 x i32]]* @sec26.y1 to i8*), i64 48, i32 16, i1 false)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc11, %entry
  %1 = load i32* %i, align 4
  %cmp = icmp slt i32 %1, 4
  br i1 %cmp, label %for.body, label %for.end13

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32* %j, align 4
  %cmp2 = icmp slt i32 %2, 3
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %3 = load i32* %i, align 4
  %4 = load i32* %j, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 %3, i32 %4)
  %5 = load i32* %j, align 4
  %idxprom = sext i32 %5 to i64
  %6 = load i32* %i, align 4
  %idxprom4 = sext i32 %6 to i64
  %arrayidx = getelementptr inbounds [4 x [3 x i32]]* %y1, i32 0, i64 %idxprom4
  %arrayidx5 = getelementptr inbounds [3 x i32]* %arrayidx, i32 0, i64 %idxprom
  %7 = load i32* %arrayidx5, align 4
  %8 = load i32* %j, align 4
  %idxprom6 = sext i32 %8 to i64
  %9 = load i32* %i, align 4
  %idxprom7 = sext i32 %9 to i64
  %arrayidx8 = getelementptr inbounds [4 x [3 x i32]]* %y1, i32 0, i64 %idxprom7
  %arrayidx9 = getelementptr inbounds [3 x i32]* %arrayidx8, i32 0, i64 %idxprom6
  %10 = load i32* %arrayidx9, align 4
  %cmp10 = icmp ne i32 %7, %10
  br i1 %cmp10, label %if.then, label %if.end

if.then:                                          ; preds = %for.body3
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %for.body3
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %11 = load i32* %j, align 4
  %add = add nsw i32 %11, 1
  store i32 %add, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc11

for.inc11:                                        ; preds = %for.end
  %12 = load i32* %i, align 4
  %add12 = add nsw i32 %12, 1
  store i32 %add12, i32* %i, align 4
  br label %for.cond

for.end13:                                        ; preds = %for.cond
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %for.end13, %if.then
  %13 = load i32* %retval
  ret i32 %13
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @printf(i8*, ...)

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @sec26()
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 26, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end, %if.then
  %0 = load i32* %retval
  ret i32 %0
}
