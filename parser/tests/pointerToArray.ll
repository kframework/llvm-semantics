; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/pointerToArray.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@main.arr = internal unnamed_addr constant [3 x i32] [i32 1, i32 2, i32 3], align 4
@.str = private unnamed_addr constant [5 x i8] c"Bug\0A\00", align 1

define i32 @f([0 x i32]* %x, i32 %num) nounwind uwtable {
entry:
  %x.addr = alloca [0 x i32]*, align 8
  %num.addr = alloca i32, align 4
  %sum = alloca i32, align 4
  %i = alloca i32, align 4
  store [0 x i32]* %x, [0 x i32]** %x.addr, align 8
  store i32 %num, i32* %num.addr, align 4
  store i32 0, i32* %sum, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %tmp1 = load i32* %num.addr, align 4
  %cmp = icmp slt i32 %tmp, %tmp1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = load i32* %i, align 4
  %idxprom = sext i32 %tmp2 to i64
  %tmp3 = load [0 x i32]** %x.addr, align 8
  %arrayidx = getelementptr inbounds [0 x i32]* %tmp3, i32 0, i64 %idxprom
  %tmp4 = load i32* %arrayidx
  %tmp5 = load i32* %sum, align 4
  %add = add nsw i32 %tmp5, %tmp4
  store i32 %add, i32* %sum, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp6 = load i32* %i, align 4
  %inc = add nsw i32 %tmp6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp7 = load i32* %sum, align 4
  ret i32 %tmp7
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %arr = alloca [3 x i32], align 4
  %z = alloca [0 x i32]*, align 8
  store i32 0, i32* %retval
  %tmp = bitcast [3 x i32]* %arr to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast ([3 x i32]* @main.arr to i8*), i64 12, i32 4, i1 false)
  %0 = bitcast [3 x i32]* %arr to [0 x i32]*
  store [0 x i32]* %0, [0 x i32]** %z, align 8
  %tmp2 = load [0 x i32]** %z, align 8
  %call = call i32 @f([0 x i32]* %tmp2, i32 3)
  %cmp = icmp ne i32 %call, 6
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @printf(i8*, ...)
