; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/multWithBreak.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@main.arr1 = internal unnamed_addr constant [6 x i32] [i32 1, i32 2, i32 3, i32 0, i32 4, i32 5], align 16
@main.arr2 = internal unnamed_addr constant [5 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5], align 16

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %product1 = alloca i32, align 4
  %product2 = alloca i32, align 4
  %arr1 = alloca [6 x i32], align 16
  %arr2 = alloca [5 x i32], align 16
  %i = alloca i32, align 4
  %i12 = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 1, i32* %product1, align 4
  store i32 1, i32* %product2, align 4
  %tmp = bitcast [6 x i32]* %arr1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast ([6 x i32]* @main.arr1 to i8*), i64 24, i32 16, i1 false)
  %tmp2 = bitcast [5 x i32]* %arr2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp2, i8* bitcast ([5 x i32]* @main.arr2 to i8*), i64 20, i32 16, i1 false)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp4 = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp4, 6
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp5 = load i32* %i, align 4
  %idxprom = sext i32 %tmp5 to i64
  %arrayidx = getelementptr inbounds [6 x i32]* %arr1, i32 0, i64 %idxprom
  %tmp6 = load i32* %arrayidx, align 4
  %tmp7 = load i32* %product1, align 4
  %mul = mul nsw i32 %tmp7, %tmp6
  store i32 %mul, i32* %product1, align 4
  %tmp8 = load i32* %product1, align 4
  %cmp9 = icmp eq i32 %tmp8, 0
  br i1 %cmp9, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  br label %for.end

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp10 = load i32* %i, align 4
  %inc = add nsw i32 %tmp10, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then, %for.cond
  store i32 0, i32* %i12, align 4
  br label %for.cond13

for.cond13:                                       ; preds = %for.inc23, %for.end
  %tmp14 = load i32* %i12, align 4
  %cmp15 = icmp slt i32 %tmp14, 5
  br i1 %cmp15, label %for.body16, label %for.end26

for.body16:                                       ; preds = %for.cond13
  %tmp17 = load i32* %i12, align 4
  %idxprom18 = sext i32 %tmp17 to i64
  %arrayidx19 = getelementptr inbounds [5 x i32]* %arr2, i32 0, i64 %idxprom18
  %tmp20 = load i32* %arrayidx19, align 4
  %tmp21 = load i32* %product2, align 4
  %mul22 = mul nsw i32 %tmp21, %tmp20
  store i32 %mul22, i32* %product2, align 4
  br label %for.inc23

for.inc23:                                        ; preds = %for.body16
  %tmp24 = load i32* %i12, align 4
  %inc25 = add nsw i32 %tmp24, 1
  store i32 %inc25, i32* %i12, align 4
  br label %for.cond13

for.end26:                                        ; preds = %for.cond13
  %tmp27 = load i32* %product1, align 4
  %tmp28 = load i32* %product2, align 4
  %add = add nsw i32 %tmp27, %tmp28
  ret i32 %add
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind
