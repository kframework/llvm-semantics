; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/bubblesort.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@main.arr = internal unnamed_addr constant [7 x i32] [i32 -1, i32 2, i32 1, i32 3, i32 5, i32 -10, i32 -11], align 16
@.str = private unnamed_addr constant [23 x i8] c"array before sorting: \00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"array after bubblesort: \00", align 1
@.str2 = private unnamed_addr constant [4 x i8] c"%d \00", align 1

define void @bubble_sort(i8* %base, i64 %nmemb, i64 %size, i32 (i8*, i8*)* %compar) nounwind uwtable {
entry:
  %base.addr = alloca i8*, align 8
  %nmemb.addr = alloca i64, align 8
  %size.addr = alloca i64, align 8
  %compar.addr = alloca i32 (i8*, i8*)*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %pc = alloca i8*, align 8
  %pc_at_i = alloca i8*, align 8
  %pc_at_j = alloca i8*, align 8
  store i8* %base, i8** %base.addr, align 8
  store i64 %nmemb, i64* %nmemb.addr, align 8
  store i64 %size, i64* %size.addr, align 8
  store i32 (i8*, i8*)* %compar, i32 (i8*, i8*)** %compar.addr, align 8
  %tmp = load i8** %base.addr, align 8
  store i8* %tmp, i8** %pc, align 8
  %tmp3 = load i64* %nmemb.addr, align 8
  %sub = sub i64 %tmp3, 1
  %conv = trunc i64 %sub to i32
  store i32 %conv, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc32, %entry
  %tmp4 = load i32* %i, align 4
  %cmp = icmp sgt i32 %tmp4, 0
  br i1 %cmp, label %for.body, label %for.end34

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc, %for.body
  %tmp7 = load i32* %j, align 4
  %tmp8 = load i32* %i, align 4
  %cmp9 = icmp slt i32 %tmp7, %tmp8
  br i1 %cmp9, label %for.body11, label %for.end

for.body11:                                       ; preds = %for.cond6
  %tmp12 = load i8** %pc, align 8
  %tmp13 = load i32* %i, align 4
  %conv14 = sext i32 %tmp13 to i64
  %tmp15 = load i64* %size.addr, align 8
  %mul = mul i64 %conv14, %tmp15
  %add.ptr = getelementptr inbounds i8* %tmp12, i64 %mul
  store i8* %add.ptr, i8** %pc_at_i, align 8
  %tmp16 = load i8** %pc, align 8
  %tmp17 = load i32* %j, align 4
  %conv18 = sext i32 %tmp17 to i64
  %tmp19 = load i64* %size.addr, align 8
  %mul20 = mul i64 %conv18, %tmp19
  %add.ptr21 = getelementptr inbounds i8* %tmp16, i64 %mul20
  store i8* %add.ptr21, i8** %pc_at_j, align 8
  %tmp22 = load i32 (i8*, i8*)** %compar.addr, align 8
  %tmp23 = load i8** %pc_at_i, align 8
  %tmp24 = load i8** %pc_at_j, align 8
  %call = call i32 %tmp22(i8* %tmp23, i8* %tmp24)
  %cmp25 = icmp slt i32 %call, 0
  br i1 %cmp25, label %if.then, label %if.end

if.then:                                          ; preds = %for.body11
  %tmp27 = load i8** %base.addr, align 8
  %tmp28 = load i64* %size.addr, align 8
  %tmp29 = load i32* %i, align 4
  %tmp30 = load i32* %j, align 4
  call void @swap_fun(i8* %tmp27, i64 %tmp28, i32 %tmp29, i32 %tmp30)
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body11
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp31 = load i32* %j, align 4
  %inc = add nsw i32 %tmp31, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond6

for.end:                                          ; preds = %for.cond6
  br label %for.inc32

for.inc32:                                        ; preds = %for.end
  %tmp33 = load i32* %i, align 4
  %dec = add nsw i32 %tmp33, -1
  store i32 %dec, i32* %i, align 4
  br label %for.cond

for.end34:                                        ; preds = %for.cond
  ret void
}

define internal void @swap_fun(i8* %base, i64 %element_size, i32 %index1, i32 %index2) nounwind uwtable {
entry:
  %base.addr = alloca i8*, align 8
  %element_size.addr = alloca i64, align 8
  %index1.addr = alloca i32, align 4
  %index2.addr = alloca i32, align 4
  %pc = alloca i8*, align 8
  %tmp2 = alloca i8, align 1
  %i = alloca i32, align 4
  store i8* %base, i8** %base.addr, align 8
  store i64 %element_size, i64* %element_size.addr, align 8
  store i32 %index1, i32* %index1.addr, align 4
  store i32 %index2, i32* %index2.addr, align 4
  %tmp = load i8** %base.addr, align 8
  store i8* %tmp, i8** %pc, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp4 = load i32* %i, align 4
  %conv = sext i32 %tmp4 to i64
  %tmp5 = load i64* %element_size.addr, align 8
  %cmp = icmp ult i64 %conv, %tmp5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp7 = load i32* %index1.addr, align 4
  %conv8 = sext i32 %tmp7 to i64
  %tmp9 = load i64* %element_size.addr, align 8
  %mul = mul i64 %conv8, %tmp9
  %tmp10 = load i32* %i, align 4
  %conv11 = sext i32 %tmp10 to i64
  %add = add i64 %mul, %conv11
  %tmp12 = load i8** %pc, align 8
  %arrayidx = getelementptr inbounds i8* %tmp12, i64 %add
  %tmp13 = load i8* %arrayidx
  store i8 %tmp13, i8* %tmp2, align 1
  %tmp14 = load i32* %index2.addr, align 4
  %conv15 = sext i32 %tmp14 to i64
  %tmp16 = load i64* %element_size.addr, align 8
  %mul17 = mul i64 %conv15, %tmp16
  %tmp18 = load i32* %i, align 4
  %conv19 = sext i32 %tmp18 to i64
  %add20 = add i64 %mul17, %conv19
  %tmp21 = load i8** %pc, align 8
  %arrayidx22 = getelementptr inbounds i8* %tmp21, i64 %add20
  %tmp23 = load i8* %arrayidx22
  %tmp24 = load i32* %index1.addr, align 4
  %conv25 = sext i32 %tmp24 to i64
  %tmp26 = load i64* %element_size.addr, align 8
  %mul27 = mul i64 %conv25, %tmp26
  %tmp28 = load i32* %i, align 4
  %conv29 = sext i32 %tmp28 to i64
  %add30 = add i64 %mul27, %conv29
  %tmp31 = load i8** %pc, align 8
  %arrayidx32 = getelementptr inbounds i8* %tmp31, i64 %add30
  store i8 %tmp23, i8* %arrayidx32
  %tmp33 = load i8* %tmp2, align 1
  %tmp34 = load i32* %index2.addr, align 4
  %conv35 = sext i32 %tmp34 to i64
  %tmp36 = load i64* %element_size.addr, align 8
  %mul37 = mul i64 %conv35, %tmp36
  %tmp38 = load i32* %i, align 4
  %conv39 = sext i32 %tmp38 to i64
  %add40 = add i64 %mul37, %conv39
  %tmp41 = load i8** %pc, align 8
  %arrayidx42 = getelementptr inbounds i8* %tmp41, i64 %add40
  store i8 %tmp33, i8* %arrayidx42
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp43 = load i32* %i, align 4
  %inc = add nsw i32 %tmp43, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

define i32 @int_cmp_fun(i8* %v1, i8* %v2) nounwind uwtable {
entry:
  %v1.addr = alloca i8*, align 8
  %v2.addr = alloca i8*, align 8
  %i1 = alloca i32*, align 8
  %i2 = alloca i32*, align 8
  %result = alloca i32, align 4
  store i8* %v1, i8** %v1.addr, align 8
  store i8* %v2, i8** %v2.addr, align 8
  %tmp = load i8** %v1.addr, align 8
  %0 = bitcast i8* %tmp to i32*
  store i32* %0, i32** %i1, align 8
  %tmp2 = load i8** %v2.addr, align 8
  %1 = bitcast i8* %tmp2 to i32*
  store i32* %1, i32** %i2, align 8
  %tmp4 = load i32** %i1, align 8
  %tmp5 = load i32* %tmp4
  %tmp6 = load i32** %i2, align 8
  %tmp7 = load i32* %tmp6
  %cmp = icmp eq i32 %tmp5, %tmp7
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 0, i32* %result, align 4
  br label %if.end15

if.else:                                          ; preds = %entry
  %tmp8 = load i32** %i1, align 8
  %tmp9 = load i32* %tmp8
  %tmp10 = load i32** %i2, align 8
  %tmp11 = load i32* %tmp10
  %cmp12 = icmp slt i32 %tmp9, %tmp11
  br i1 %cmp12, label %if.then13, label %if.else14

if.then13:                                        ; preds = %if.else
  store i32 -1, i32* %result, align 4
  br label %if.end

if.else14:                                        ; preds = %if.else
  store i32 1, i32* %result, align 4
  br label %if.end

if.end:                                           ; preds = %if.else14, %if.then13
  br label %if.end15

if.end15:                                         ; preds = %if.end, %if.then
  %tmp16 = load i32* %result, align 4
  ret i32 %tmp16
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %arr = alloca [7 x i32], align 16
  store i32 0, i32* %retval
  %tmp = bitcast [7 x i32]* %arr to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast ([7 x i32]* @main.arr to i8*), i64 28, i32 16, i1 false)
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str, i32 0, i32 0))
  %arraydecay = getelementptr inbounds [7 x i32]* %arr, i32 0, i32 0
  call void @print_int_arr(i32* %arraydecay, i64 7)
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0))
  %arraydecay2 = getelementptr inbounds [7 x i32]* %arr, i32 0, i32 0
  %0 = bitcast i32* %arraydecay2 to i8*
  call void @bubble_sort(i8* %0, i64 7, i64 4, i32 (i8*, i8*)* @int_cmp_fun)
  %arraydecay3 = getelementptr inbounds [7 x i32]* %arr, i32 0, i32 0
  call void @print_int_arr(i32* %arraydecay3, i64 7)
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @printf(i8*, ...)

define internal void @print_int_arr(i32* %arr, i64 %size_of_arr) nounwind uwtable {
entry:
  %arr.addr = alloca i32*, align 8
  %size_of_arr.addr = alloca i64, align 8
  %i = alloca i32, align 4
  store i32* %arr, i32** %arr.addr, align 8
  store i64 %size_of_arr, i64* %size_of_arr.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %conv = sext i32 %tmp to i64
  %tmp1 = load i64* %size_of_arr.addr, align 8
  %cmp = icmp ult i64 %conv, %tmp1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp3 = load i32* %i, align 4
  %idxprom = sext i32 %tmp3 to i64
  %tmp4 = load i32** %arr.addr, align 8
  %arrayidx = getelementptr inbounds i32* %tmp4, i64 %idxprom
  %tmp5 = load i32* %arrayidx
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0), i32 %tmp5)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp6 = load i32* %i, align 4
  %inc = add nsw i32 %tmp6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call7 = call i32 @putchar(i32 10)
  ret void
}

declare i32 @putchar(i32)
