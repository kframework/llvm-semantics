; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/nestedLoop.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@sec26.y1 = internal unnamed_addr constant [4 x [3 x i32]] [[3 x i32] [i32 1, i32 3, i32 5], [3 x i32] [i32 2, i32 4, i32 6], [3 x i32] [i32 3, i32 5, i32 7], [3 x i32] zeroinitializer], align 16
@.str = private unnamed_addr constant [16 x i8] c"(i, j)=(%d, %d)\00", align 1

define i32 @sec26() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %y1 = alloca [4 x [3 x i32]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %tmp = bitcast [4 x [3 x i32]]* %y1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast ([4 x [3 x i32]]* @sec26.y1 to i8*), i64 48, i32 16, i1 false)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc24, %entry
  %tmp2 = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp2, 4
  br i1 %cmp, label %for.body, label %for.end27

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc, %for.body
  %tmp5 = load i32* %j, align 4
  %cmp6 = icmp slt i32 %tmp5, 3
  br i1 %cmp6, label %for.body7, label %for.end

for.body7:                                        ; preds = %for.cond4
  %tmp8 = load i32* %i, align 4
  %tmp9 = load i32* %j, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 %tmp8, i32 %tmp9)
  %tmp10 = load i32* %j, align 4
  %idxprom = sext i32 %tmp10 to i64
  %tmp11 = load i32* %i, align 4
  %idxprom12 = sext i32 %tmp11 to i64
  %arrayidx = getelementptr inbounds [4 x [3 x i32]]* %y1, i32 0, i64 %idxprom12
  %arrayidx13 = getelementptr inbounds [3 x i32]* %arrayidx, i32 0, i64 %idxprom
  %tmp14 = load i32* %arrayidx13, align 4
  %tmp15 = load i32* %j, align 4
  %idxprom16 = sext i32 %tmp15 to i64
  %tmp17 = load i32* %i, align 4
  %idxprom18 = sext i32 %tmp17 to i64
  %arrayidx19 = getelementptr inbounds [4 x [3 x i32]]* %y1, i32 0, i64 %idxprom18
  %arrayidx20 = getelementptr inbounds [3 x i32]* %arrayidx19, i32 0, i64 %idxprom16
  %tmp21 = load i32* %arrayidx20, align 4
  %cmp22 = icmp ne i32 %tmp14, %tmp21
  br i1 %cmp22, label %if.then, label %if.end

if.then:                                          ; preds = %for.body7
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %for.body7
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp23 = load i32* %j, align 4
  %add = add nsw i32 %tmp23, 1
  store i32 %add, i32* %j, align 4
  br label %for.cond4

for.end:                                          ; preds = %for.cond4
  br label %for.inc24

for.inc24:                                        ; preds = %for.end
  %tmp25 = load i32* %i, align 4
  %add26 = add nsw i32 %tmp25, 1
  store i32 %add26, i32* %i, align 4
  br label %for.cond

for.end27:                                        ; preds = %for.cond
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %for.end27, %if.then
  %0 = load i32* %retval
  ret i32 %0
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
