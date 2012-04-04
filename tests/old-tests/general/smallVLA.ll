; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/smallVLA.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %saved_stack = alloca i8*
  %j = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc20, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 10
  br i1 %cmp, label %for.body, label %for.end23

for.body:                                         ; preds = %for.cond
  %0 = call i8* @llvm.stacksave()
  store i8* %0, i8** %saved_stack
  %tmp1 = load i32* %i, align 4
  %inc = add nsw i32 %tmp1, 1
  store i32 %inc, i32* %i, align 4
  %tmp2 = zext i32 %inc to i64
  %1 = mul i64 4, %tmp2
  %vla = alloca i8, i64 %1, align 16
  %tmp3 = bitcast i8* %vla to i32*
  store i32 0, i32* %j, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc, %for.body
  %tmp6 = load i32* %j, align 4
  %tmp7 = load i32* %i, align 4
  %cmp8 = icmp slt i32 %tmp6, %tmp7
  br i1 %cmp8, label %for.body9, label %for.end

for.body9:                                        ; preds = %for.cond5
  %tmp10 = load i32* %j, align 4
  %tmp11 = load i32* %j, align 4
  %idxprom = sext i32 %tmp11 to i64
  %arrayidx = getelementptr inbounds i32* %tmp3, i64 %idxprom
  store i32 %tmp10, i32* %arrayidx
  %tmp12 = load i32* %j, align 4
  %idxprom13 = sext i32 %tmp12 to i64
  %arrayidx14 = getelementptr inbounds i32* %tmp3, i64 %idxprom13
  %tmp15 = load i32* %arrayidx14
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0), i32 %tmp15)
  br label %for.inc

for.inc:                                          ; preds = %for.body9
  %tmp16 = load i32* %j, align 4
  %inc17 = add nsw i32 %tmp16, 1
  store i32 %inc17, i32* %j, align 4
  br label %for.cond5

for.end:                                          ; preds = %for.cond5
  %call18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0))
  %tmp19 = load i8** %saved_stack
  call void @llvm.stackrestore(i8* %tmp19)
  br label %for.inc20

for.inc20:                                        ; preds = %for.end
  %tmp21 = load i32* %i, align 4
  %inc22 = add nsw i32 %tmp21, 1
  store i32 %inc22, i32* %i, align 4
  br label %for.cond

for.end23:                                        ; preds = %for.cond
  ret i32 0
}

declare i8* @llvm.stacksave() nounwind

declare i32 @printf(i8*, ...)

declare void @llvm.stackrestore(i8*) nounwind
