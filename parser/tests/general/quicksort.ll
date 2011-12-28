; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/quicksort.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"ERROR\00", align 1
@.str1 = private unnamed_addr constant [8 x i8] c"SUCCESS\00", align 1

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp, 8
  %and = and i64 %shr, 4095
  %tmp1 = load i64* %__dev.addr, align 8
  %shr2 = lshr i64 %tmp1, 32
  %conv = trunc i64 %shr2 to i32
  %and3 = and i32 %conv, -4096
  %conv4 = zext i32 %and3 to i64
  %or = or i64 %and, %conv4
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %and = and i64 %tmp, 255
  %tmp1 = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp1, 12
  %conv = trunc i64 %shr to i32
  %and2 = and i32 %conv, -256
  %conv3 = zext i32 %and2 to i64
  %or = or i64 %and, %conv3
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable inlinehint {
entry:
  %__major.addr = alloca i32, align 4
  %__minor.addr = alloca i32, align 4
  store i32 %__major, i32* %__major.addr, align 4
  store i32 %__minor, i32* %__minor.addr, align 4
  %tmp = load i32* %__minor.addr, align 4
  %and = and i32 %tmp, 255
  %tmp1 = load i32* %__major.addr, align 4
  %and2 = and i32 %tmp1, 4095
  %shl = shl i32 %and2, 8
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %tmp3 = load i32* %__minor.addr, align 4
  %and4 = and i32 %tmp3, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl i64 %conv5, 12
  %or7 = or i64 %conv, %shl6
  %tmp8 = load i32* %__major.addr, align 4
  %and9 = and i32 %tmp8, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl i64 %conv10, 32
  %or12 = or i64 %or7, %shl11
  ret i64 %or12
}

define void @insertion_sort(i8* %base, i64 %num_elements, i64 %element_size, i32 (i8*, i8*)* %comparer) nounwind uwtable {
entry:
  %base.addr = alloca i8*, align 8
  %num_elements.addr = alloca i64, align 8
  %element_size.addr = alloca i64, align 8
  %comparer.addr = alloca i32 (i8*, i8*)*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i8* %base, i8** %base.addr, align 8
  store i64 %num_elements, i64* %num_elements.addr, align 8
  store i64 %element_size, i64* %element_size.addr, align 8
  store i32 (i8*, i8*)* %comparer, i32 (i8*, i8*)** %comparer.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc23, %entry
  %tmp = load i32* %i, align 4
  %conv = sext i32 %tmp to i64
  %tmp1 = load i64* %num_elements.addr, align 8
  %cmp = icmp ult i64 %conv, %tmp1
  br i1 %cmp, label %for.body, label %for.end25

for.body:                                         ; preds = %for.cond
  %tmp4 = load i32* %i, align 4
  %sub = sub nsw i32 %tmp4, 1
  store i32 %sub, i32* %j, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc, %for.body
  %tmp6 = load i32* %j, align 4
  %cmp7 = icmp sge i32 %tmp6, 0
  br i1 %cmp7, label %for.body9, label %for.end

for.body9:                                        ; preds = %for.cond5
  %tmp10 = load i8** %base.addr, align 8
  %tmp11 = load i64* %element_size.addr, align 8
  %tmp12 = load i32* %j, align 4
  %tmp13 = load i32* %j, align 4
  %add = add nsw i32 %tmp13, 1
  %tmp14 = load i32 (i8*, i8*)** %comparer.addr, align 8
  %call = call i32 @compare_elements_helper(i8* %tmp10, i64 %tmp11, i32 %tmp12, i32 %add, i32 (i8*, i8*)* %tmp14)
  %cmp15 = icmp slt i32 %call, 0
  br i1 %cmp15, label %if.then, label %if.end

if.then:                                          ; preds = %for.body9
  br label %for.end

if.end:                                           ; preds = %for.body9
  %tmp17 = load i8** %base.addr, align 8
  %tmp18 = load i64* %element_size.addr, align 8
  %tmp19 = load i32* %j, align 4
  %tmp20 = load i32* %j, align 4
  %add21 = add nsw i32 %tmp20, 1
  call void @exchange_elements_helper(i8* %tmp17, i64 %tmp18, i32 %tmp19, i32 %add21)
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp22 = load i32* %j, align 4
  %dec = add nsw i32 %tmp22, -1
  store i32 %dec, i32* %j, align 4
  br label %for.cond5

for.end:                                          ; preds = %if.then, %for.cond5
  br label %for.inc23

for.inc23:                                        ; preds = %for.end
  %tmp24 = load i32* %i, align 4
  %inc = add nsw i32 %tmp24, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end25:                                        ; preds = %for.cond
  ret void
}

define internal i32 @compare_elements_helper(i8* %base, i64 %element_size, i32 %idx1, i32 %idx2, i32 (i8*, i8*)* %comparer) nounwind uwtable {
entry:
  %base.addr = alloca i8*, align 8
  %element_size.addr = alloca i64, align 8
  %idx1.addr = alloca i32, align 4
  %idx2.addr = alloca i32, align 4
  %comparer.addr = alloca i32 (i8*, i8*)*, align 8
  %base_bytes = alloca i8*, align 8
  store i8* %base, i8** %base.addr, align 8
  store i64 %element_size, i64* %element_size.addr, align 8
  store i32 %idx1, i32* %idx1.addr, align 4
  store i32 %idx2, i32* %idx2.addr, align 4
  store i32 (i8*, i8*)* %comparer, i32 (i8*, i8*)** %comparer.addr, align 8
  %tmp = load i8** %base.addr, align 8
  store i8* %tmp, i8** %base_bytes, align 8
  %tmp1 = load i32 (i8*, i8*)** %comparer.addr, align 8
  %tmp2 = load i32* %idx1.addr, align 4
  %conv = sext i32 %tmp2 to i64
  %tmp3 = load i64* %element_size.addr, align 8
  %mul = mul i64 %conv, %tmp3
  %tmp4 = load i8** %base_bytes, align 8
  %arrayidx = getelementptr inbounds i8* %tmp4, i64 %mul
  %tmp5 = load i32* %idx2.addr, align 4
  %conv6 = sext i32 %tmp5 to i64
  %tmp7 = load i64* %element_size.addr, align 8
  %mul8 = mul i64 %conv6, %tmp7
  %tmp9 = load i8** %base_bytes, align 8
  %arrayidx10 = getelementptr inbounds i8* %tmp9, i64 %mul8
  %call = call i32 %tmp1(i8* %arrayidx, i8* %arrayidx10)
  ret i32 %call
}

define internal void @exchange_elements_helper(i8* %base, i64 %element_size, i32 %idx1, i32 %idx2) nounwind uwtable {
entry:
  %base.addr = alloca i8*, align 8
  %element_size.addr = alloca i64, align 8
  %idx1.addr = alloca i32, align 4
  %idx2.addr = alloca i32, align 4
  %base_bytes = alloca i8*, align 8
  %i = alloca i32, align 4
  %temp = alloca i8, align 1
  store i8* %base, i8** %base.addr, align 8
  store i64 %element_size, i64* %element_size.addr, align 8
  store i32 %idx1, i32* %idx1.addr, align 4
  store i32 %idx2, i32* %idx2.addr, align 4
  %tmp = load i8** %base.addr, align 8
  store i8* %tmp, i8** %base_bytes, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp2 = load i32* %i, align 4
  %conv = sext i32 %tmp2 to i64
  %tmp3 = load i64* %element_size.addr, align 8
  %cmp = icmp ult i64 %conv, %tmp3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp6 = load i32* %idx1.addr, align 4
  %conv7 = sext i32 %tmp6 to i64
  %tmp8 = load i64* %element_size.addr, align 8
  %mul = mul i64 %conv7, %tmp8
  %tmp9 = load i32* %i, align 4
  %conv10 = sext i32 %tmp9 to i64
  %add = add i64 %mul, %conv10
  %tmp11 = load i8** %base_bytes, align 8
  %arrayidx = getelementptr inbounds i8* %tmp11, i64 %add
  %tmp12 = load i8* %arrayidx
  store i8 %tmp12, i8* %temp, align 1
  %tmp13 = load i32* %idx2.addr, align 4
  %conv14 = sext i32 %tmp13 to i64
  %tmp15 = load i64* %element_size.addr, align 8
  %mul16 = mul i64 %conv14, %tmp15
  %tmp17 = load i32* %i, align 4
  %conv18 = sext i32 %tmp17 to i64
  %add19 = add i64 %mul16, %conv18
  %tmp20 = load i8** %base_bytes, align 8
  %arrayidx21 = getelementptr inbounds i8* %tmp20, i64 %add19
  %tmp22 = load i8* %arrayidx21
  %tmp23 = load i32* %idx1.addr, align 4
  %conv24 = sext i32 %tmp23 to i64
  %tmp25 = load i64* %element_size.addr, align 8
  %mul26 = mul i64 %conv24, %tmp25
  %tmp27 = load i32* %i, align 4
  %conv28 = sext i32 %tmp27 to i64
  %add29 = add i64 %mul26, %conv28
  %tmp30 = load i8** %base_bytes, align 8
  %arrayidx31 = getelementptr inbounds i8* %tmp30, i64 %add29
  store i8 %tmp22, i8* %arrayidx31
  %tmp32 = load i8* %temp, align 1
  %tmp33 = load i32* %idx2.addr, align 4
  %conv34 = sext i32 %tmp33 to i64
  %tmp35 = load i64* %element_size.addr, align 8
  %mul36 = mul i64 %conv34, %tmp35
  %tmp37 = load i32* %i, align 4
  %conv38 = sext i32 %tmp37 to i64
  %add39 = add i64 %mul36, %conv38
  %tmp40 = load i8** %base_bytes, align 8
  %arrayidx41 = getelementptr inbounds i8* %tmp40, i64 %add39
  store i8 %tmp32, i8* %arrayidx41
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp42 = load i32* %i, align 4
  %inc = add nsw i32 %tmp42, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

define i32 @partition(i8* %base, i64 %num_elements, i64 %element_size, i32 (i8*, i8*)* %comparer, i32 %pivotIndex) nounwind uwtable {
entry:
  %base.addr = alloca i8*, align 8
  %num_elements.addr = alloca i64, align 8
  %element_size.addr = alloca i64, align 8
  %comparer.addr = alloca i32 (i8*, i8*)*, align 8
  %pivotIndex.addr = alloca i32, align 4
  %low = alloca i32, align 4
  %high = alloca i32, align 4
  store i8* %base, i8** %base.addr, align 8
  store i64 %num_elements, i64* %num_elements.addr, align 8
  store i64 %element_size, i64* %element_size.addr, align 8
  store i32 (i8*, i8*)* %comparer, i32 (i8*, i8*)** %comparer.addr, align 8
  store i32 %pivotIndex, i32* %pivotIndex.addr, align 4
  store i32 0, i32* %low, align 4
  %tmp = load i64* %num_elements.addr, align 8
  %sub = sub i64 %tmp, 1
  %conv = trunc i64 %sub to i32
  store i32 %conv, i32* %high, align 4
  %tmp1 = load i8** %base.addr, align 8
  %tmp2 = load i64* %element_size.addr, align 8
  %tmp3 = load i64* %num_elements.addr, align 8
  %sub4 = sub i64 %tmp3, 1
  %conv5 = trunc i64 %sub4 to i32
  %tmp6 = load i32* %pivotIndex.addr, align 4
  call void @exchange_elements_helper(i8* %tmp1, i64 %tmp2, i32 %conv5, i32 %tmp6)
  br label %while.body

while.body:                                       ; preds = %entry, %if.end
  br label %while.cond7

while.cond7:                                      ; preds = %while.body22, %while.body
  %tmp8 = load i8** %base.addr, align 8
  %tmp9 = load i64* %element_size.addr, align 8
  %tmp10 = load i32* %low, align 4
  %tmp11 = load i64* %num_elements.addr, align 8
  %sub12 = sub i64 %tmp11, 1
  %conv13 = trunc i64 %sub12 to i32
  %tmp14 = load i32 (i8*, i8*)** %comparer.addr, align 8
  %call = call i32 @compare_elements_helper(i8* %tmp8, i64 %tmp9, i32 %tmp10, i32 %conv13, i32 (i8*, i8*)* %tmp14)
  %cmp = icmp slt i32 %call, 0
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond7
  %tmp16 = load i32* %low, align 4
  %conv17 = sext i32 %tmp16 to i64
  %tmp18 = load i64* %num_elements.addr, align 8
  %sub19 = sub i64 %tmp18, 1
  %cmp20 = icmp ult i64 %conv17, %sub19
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond7
  %0 = phi i1 [ false, %while.cond7 ], [ %cmp20, %land.rhs ]
  br i1 %0, label %while.body22, label %while.end

while.body22:                                     ; preds = %land.end
  %tmp23 = load i32* %low, align 4
  %inc = add nsw i32 %tmp23, 1
  store i32 %inc, i32* %low, align 4
  br label %while.cond7

while.end:                                        ; preds = %land.end
  br label %while.cond24

while.cond24:                                     ; preds = %while.body40, %while.end
  %tmp25 = load i8** %base.addr, align 8
  %tmp26 = load i64* %element_size.addr, align 8
  %tmp27 = load i32* %high, align 4
  %tmp28 = load i64* %num_elements.addr, align 8
  %sub29 = sub i64 %tmp28, 1
  %conv30 = trunc i64 %sub29 to i32
  %tmp31 = load i32 (i8*, i8*)** %comparer.addr, align 8
  %call32 = call i32 @compare_elements_helper(i8* %tmp25, i64 %tmp26, i32 %tmp27, i32 %conv30, i32 (i8*, i8*)* %tmp31)
  %cmp33 = icmp slt i32 %call32, 0
  br i1 %cmp33, label %land.end39, label %land.rhs35

land.rhs35:                                       ; preds = %while.cond24
  %tmp36 = load i32* %high, align 4
  %cmp37 = icmp sgt i32 %tmp36, 0
  br label %land.end39

land.end39:                                       ; preds = %land.rhs35, %while.cond24
  %1 = phi i1 [ false, %while.cond24 ], [ %cmp37, %land.rhs35 ]
  br i1 %1, label %while.body40, label %while.end42

while.body40:                                     ; preds = %land.end39
  %tmp41 = load i32* %high, align 4
  %dec = add nsw i32 %tmp41, -1
  store i32 %dec, i32* %high, align 4
  br label %while.cond24

while.end42:                                      ; preds = %land.end39
  %tmp43 = load i32* %low, align 4
  %tmp44 = load i32* %high, align 4
  %cmp45 = icmp sge i32 %tmp43, %tmp44
  br i1 %cmp45, label %if.then, label %if.end

if.then:                                          ; preds = %while.end42
  br label %while.end51

if.end:                                           ; preds = %while.end42
  %tmp47 = load i8** %base.addr, align 8
  %tmp48 = load i64* %element_size.addr, align 8
  %tmp49 = load i32* %low, align 4
  %tmp50 = load i32* %high, align 4
  call void @exchange_elements_helper(i8* %tmp47, i64 %tmp48, i32 %tmp49, i32 %tmp50)
  br label %while.body

while.end51:                                      ; preds = %if.then
  %tmp52 = load i8** %base.addr, align 8
  %tmp53 = load i64* %element_size.addr, align 8
  %tmp54 = load i32* %low, align 4
  %tmp55 = load i64* %num_elements.addr, align 8
  %sub56 = sub i64 %tmp55, 1
  %conv57 = trunc i64 %sub56 to i32
  call void @exchange_elements_helper(i8* %tmp52, i64 %tmp53, i32 %tmp54, i32 %conv57)
  %tmp58 = load i32* %low, align 4
  ret i32 %tmp58
}

define void @quicksort(i8* %base, i64 %num_elements, i64 %element_size, i32 (i8*, i8*)* %comparer) nounwind uwtable {
entry:
  %base.addr = alloca i8*, align 8
  %num_elements.addr = alloca i64, align 8
  %element_size.addr = alloca i64, align 8
  %comparer.addr = alloca i32 (i8*, i8*)*, align 8
  %pivotIndex = alloca i32, align 4
  store i8* %base, i8** %base.addr, align 8
  store i64 %num_elements, i64* %num_elements.addr, align 8
  store i64 %element_size, i64* %element_size.addr, align 8
  store i32 (i8*, i8*)* %comparer, i32 (i8*, i8*)** %comparer.addr, align 8
  %tmp = load i64* %num_elements.addr, align 8
  %cmp = icmp ult i64 %tmp, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %tmp1 = load i8** %base.addr, align 8
  %tmp2 = load i64* %num_elements.addr, align 8
  %tmp3 = load i64* %element_size.addr, align 8
  %tmp4 = load i32 (i8*, i8*)** %comparer.addr, align 8
  call void @insertion_sort(i8* %tmp1, i64 %tmp2, i64 %tmp3, i32 (i8*, i8*)* %tmp4)
  br label %return

if.end:                                           ; preds = %entry
  %call = call i32 @rand() nounwind
  %conv = sext i32 %call to i64
  %tmp5 = load i64* %num_elements.addr, align 8
  %rem = urem i64 %conv, %tmp5
  %conv6 = trunc i64 %rem to i32
  store i32 %conv6, i32* %pivotIndex, align 4
  %tmp7 = load i8** %base.addr, align 8
  %tmp8 = load i64* %num_elements.addr, align 8
  %tmp9 = load i64* %element_size.addr, align 8
  %tmp10 = load i32 (i8*, i8*)** %comparer.addr, align 8
  %tmp11 = load i32* %pivotIndex, align 4
  %call12 = call i32 @partition(i8* %tmp7, i64 %tmp8, i64 %tmp9, i32 (i8*, i8*)* %tmp10, i32 %tmp11)
  store i32 %call12, i32* %pivotIndex, align 4
  %tmp13 = load i8** %base.addr, align 8
  %tmp14 = load i32* %pivotIndex, align 4
  %conv15 = sext i32 %tmp14 to i64
  %tmp16 = load i64* %element_size.addr, align 8
  %tmp17 = load i32 (i8*, i8*)** %comparer.addr, align 8
  call void @quicksort(i8* %tmp13, i64 %conv15, i64 %tmp16, i32 (i8*, i8*)* %tmp17)
  %tmp18 = load i8** %base.addr, align 8
  %tmp19 = load i64* %element_size.addr, align 8
  %tmp20 = load i32* %pivotIndex, align 4
  %add = add nsw i32 %tmp20, 1
  %conv21 = sext i32 %add to i64
  %mul = mul i64 %tmp19, %conv21
  %add.ptr = getelementptr inbounds i8* %tmp18, i64 %mul
  %tmp22 = load i64* %num_elements.addr, align 8
  %tmp23 = load i32* %pivotIndex, align 4
  %add24 = add nsw i32 %tmp23, 1
  %conv25 = sext i32 %add24 to i64
  %sub = sub i64 %tmp22, %conv25
  %tmp26 = load i64* %element_size.addr, align 8
  %tmp27 = load i32 (i8*, i8*)** %comparer.addr, align 8
  call void @quicksort(i8* %add.ptr, i64 %sub, i64 %tmp26, i32 (i8*, i8*)* %tmp27)
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

declare i32 @rand() nounwind

define i32 @compare_int(i8* %left, i8* %right) nounwind uwtable {
entry:
  %left.addr = alloca i8*, align 8
  %right.addr = alloca i8*, align 8
  store i8* %left, i8** %left.addr, align 8
  store i8* %right, i8** %right.addr, align 8
  %tmp = load i8** %left.addr, align 8
  %0 = bitcast i8* %tmp to i32*
  %tmp1 = load i32* %0
  %tmp2 = load i8** %right.addr, align 8
  %1 = bitcast i8* %tmp2 to i32*
  %tmp3 = load i32* %1
  %sub = sub nsw i32 %tmp1, %tmp3
  ret i32 %sub
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %size = alloca i32, align 4
  %a = alloca i32*, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 8, i32* %size, align 4
  %tmp = load i32* %size, align 4
  %conv = sext i32 %tmp to i64
  %mul = mul i64 4, %conv
  %call = call noalias i8* @malloc(i64 %mul) nounwind
  %0 = bitcast i8* %call to i32*
  store i32* %0, i32** %a, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp2 = load i32* %i, align 4
  %tmp3 = load i32* %size, align 4
  %cmp = icmp slt i32 %tmp2, %tmp3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %call5 = call i32 @rand() nounwind
  %tmp6 = load i32* %size, align 4
  %rem = srem i32 %call5, %tmp6
  %tmp7 = load i32* %i, align 4
  %idxprom = sext i32 %tmp7 to i64
  %tmp8 = load i32** %a, align 8
  %arrayidx = getelementptr inbounds i32* %tmp8, i64 %idxprom
  store i32 %rem, i32* %arrayidx
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp9 = load i32* %i, align 4
  %inc = add nsw i32 %tmp9, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp10 = load i32** %a, align 8
  %1 = bitcast i32* %tmp10 to i8*
  %tmp11 = load i32* %size, align 4
  %conv12 = sext i32 %tmp11 to i64
  call void @quicksort(i8* %1, i64 %conv12, i64 4, i32 (i8*, i8*)* @compare_int)
  store i32 1, i32* %i, align 4
  br label %for.cond13

for.cond13:                                       ; preds = %for.inc32, %for.end
  %tmp14 = load i32* %i, align 4
  %tmp15 = load i32* %size, align 4
  %cmp16 = icmp slt i32 %tmp14, %tmp15
  br i1 %cmp16, label %for.body18, label %for.end35

for.body18:                                       ; preds = %for.cond13
  %tmp19 = load i32* %i, align 4
  %sub = sub nsw i32 %tmp19, 1
  %idxprom20 = sext i32 %sub to i64
  %tmp21 = load i32** %a, align 8
  %arrayidx22 = getelementptr inbounds i32* %tmp21, i64 %idxprom20
  %tmp23 = load i32* %arrayidx22
  %tmp24 = load i32* %i, align 4
  %idxprom25 = sext i32 %tmp24 to i64
  %tmp26 = load i32** %a, align 8
  %arrayidx27 = getelementptr inbounds i32* %tmp26, i64 %idxprom25
  %tmp28 = load i32* %arrayidx27
  %cmp29 = icmp sle i32 %tmp23, %tmp28
  br i1 %cmp29, label %if.end, label %if.then

if.then:                                          ; preds = %for.body18
  %call31 = call i32 @puts(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0))
  store i32 -1, i32* %retval
  br label %return

if.end:                                           ; preds = %for.body18
  br label %for.inc32

for.inc32:                                        ; preds = %if.end
  %tmp33 = load i32* %i, align 4
  %inc34 = add nsw i32 %tmp33, 1
  store i32 %inc34, i32* %i, align 4
  br label %for.cond13

for.end35:                                        ; preds = %for.cond13
  %call36 = call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0))
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %for.end35, %if.then
  %2 = load i32* %retval
  ret i32 %2
}

declare noalias i8* @malloc(i64) nounwind

declare i32 @puts(i8*)
