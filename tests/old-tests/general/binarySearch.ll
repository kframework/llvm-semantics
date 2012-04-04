; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/binarySearch.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [28 x i8] c"Couldn't find %d in array:\0A\00", align 1
@.str1 = private unnamed_addr constant [12 x i8] c"a[%d] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [28 x i8] c"present_val == a[found_at]\0A\00", align 1
@.str3 = private unnamed_addr constant [17 x i8] c"looking for %d, \00", align 1
@.str4 = private unnamed_addr constant [10 x i8] c"found %d\0A\00", align 1
@.str5 = private unnamed_addr constant [32 x i8] c"BUG present_val == a[found_at]\0A\00", align 1

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

define i32 @binary_search(i32* %a, i32 %low, i32 %high, i32 %target) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32*, align 8
  %low.addr = alloca i32, align 4
  %high.addr = alloca i32, align 4
  %target.addr = alloca i32, align 4
  %origLow = alloca i32, align 4
  %origHigh = alloca i32, align 4
  %middle = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %a, i32** %a.addr, align 8
  store i32 %low, i32* %low.addr, align 4
  store i32 %high, i32* %high.addr, align 4
  store i32 %target, i32* %target.addr, align 4
  %tmp = load i32* %low.addr, align 4
  store i32 %tmp, i32* %origLow, align 4
  %tmp2 = load i32* %high.addr, align 4
  store i32 %tmp2, i32* %origHigh, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end28, %entry
  %tmp3 = load i32* %low.addr, align 4
  %tmp4 = load i32* %high.addr, align 4
  %cmp = icmp sle i32 %tmp3, %tmp4
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp6 = load i32* %low.addr, align 4
  %tmp7 = load i32* %high.addr, align 4
  %tmp8 = load i32* %low.addr, align 4
  %sub = sub nsw i32 %tmp7, %tmp8
  %div = sdiv i32 %sub, 2
  %add = add nsw i32 %tmp6, %div
  store i32 %add, i32* %middle, align 4
  %tmp9 = load i32* %target.addr, align 4
  %tmp10 = load i32* %middle, align 4
  %idxprom = sext i32 %tmp10 to i64
  %tmp11 = load i32** %a.addr, align 8
  %arrayidx = getelementptr inbounds i32* %tmp11, i64 %idxprom
  %tmp12 = load i32* %arrayidx
  %cmp13 = icmp slt i32 %tmp9, %tmp12
  br i1 %cmp13, label %if.then, label %if.else

if.then:                                          ; preds = %while.body
  %tmp14 = load i32* %middle, align 4
  %sub15 = sub nsw i32 %tmp14, 1
  store i32 %sub15, i32* %high.addr, align 4
  br label %if.end28

if.else:                                          ; preds = %while.body
  %tmp16 = load i32* %target.addr, align 4
  %tmp17 = load i32* %middle, align 4
  %idxprom18 = sext i32 %tmp17 to i64
  %tmp19 = load i32** %a.addr, align 8
  %arrayidx20 = getelementptr inbounds i32* %tmp19, i64 %idxprom18
  %tmp21 = load i32* %arrayidx20
  %cmp22 = icmp sgt i32 %tmp16, %tmp21
  br i1 %cmp22, label %if.then23, label %if.else26

if.then23:                                        ; preds = %if.else
  %tmp24 = load i32* %middle, align 4
  %add25 = add nsw i32 %tmp24, 1
  store i32 %add25, i32* %low.addr, align 4
  br label %if.end

if.else26:                                        ; preds = %if.else
  %tmp27 = load i32* %middle, align 4
  store i32 %tmp27, i32* %retval
  br label %return

if.end:                                           ; preds = %if.then23
  br label %if.end28

if.end28:                                         ; preds = %if.end, %if.then
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %tmp29 = load i32* %target.addr, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str, i32 0, i32 0), i32 %tmp29)
  %tmp31 = load i32* %origLow, align 4
  store i32 %tmp31, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %while.end
  %tmp32 = load i32* %i, align 4
  %tmp33 = load i32* %origHigh, align 4
  %cmp34 = icmp slt i32 %tmp32, %tmp33
  br i1 %cmp34, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp35 = load i32* %i, align 4
  %tmp36 = load i32* %i, align 4
  %idxprom37 = sext i32 %tmp36 to i64
  %tmp38 = load i32** %a.addr, align 8
  %arrayidx39 = getelementptr inbounds i32* %tmp38, i64 %idxprom37
  %tmp40 = load i32* %arrayidx39
  %call41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str1, i32 0, i32 0), i32 %tmp35, i32 %tmp40)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp42 = load i32* %i, align 4
  %inc = add nsw i32 %tmp42, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 -1, i32* %retval
  br label %return

return:                                           ; preds = %for.end, %if.else26
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)

define void @insertion_sort(i32* %a, i32 %length) nounwind uwtable {
entry:
  %a.addr = alloca i32*, align 8
  %length.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %v = alloca i32, align 4
  store i32* %a, i32** %a.addr, align 8
  store i32 %length, i32* %length.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc35, %entry
  %tmp = load i32* %i, align 4
  %tmp1 = load i32* %length.addr, align 4
  %cmp = icmp slt i32 %tmp, %tmp1
  br i1 %cmp, label %for.body, label %for.end37

for.body:                                         ; preds = %for.cond
  %tmp4 = load i32* %i, align 4
  %idxprom = sext i32 %tmp4 to i64
  %tmp5 = load i32** %a.addr, align 8
  %arrayidx = getelementptr inbounds i32* %tmp5, i64 %idxprom
  %tmp6 = load i32* %arrayidx
  store i32 %tmp6, i32* %v, align 4
  %tmp7 = load i32* %i, align 4
  %sub = sub nsw i32 %tmp7, 1
  store i32 %sub, i32* %j, align 4
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc, %for.body
  %tmp9 = load i32* %j, align 4
  %cmp10 = icmp sge i32 %tmp9, 0
  br i1 %cmp10, label %for.body11, label %for.end

for.body11:                                       ; preds = %for.cond8
  %tmp12 = load i32* %j, align 4
  %idxprom13 = sext i32 %tmp12 to i64
  %tmp14 = load i32** %a.addr, align 8
  %arrayidx15 = getelementptr inbounds i32* %tmp14, i64 %idxprom13
  %tmp16 = load i32* %arrayidx15
  %tmp17 = load i32* %v, align 4
  %cmp18 = icmp sle i32 %tmp16, %tmp17
  br i1 %cmp18, label %if.then, label %if.end

if.then:                                          ; preds = %for.body11
  br label %for.end

if.end:                                           ; preds = %for.body11
  %tmp19 = load i32* %j, align 4
  %idxprom20 = sext i32 %tmp19 to i64
  %tmp21 = load i32** %a.addr, align 8
  %arrayidx22 = getelementptr inbounds i32* %tmp21, i64 %idxprom20
  %tmp23 = load i32* %arrayidx22
  %tmp24 = load i32* %j, align 4
  %add = add nsw i32 %tmp24, 1
  %idxprom25 = sext i32 %add to i64
  %tmp26 = load i32** %a.addr, align 8
  %arrayidx27 = getelementptr inbounds i32* %tmp26, i64 %idxprom25
  store i32 %tmp23, i32* %arrayidx27
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp28 = load i32* %j, align 4
  %dec = add nsw i32 %tmp28, -1
  store i32 %dec, i32* %j, align 4
  br label %for.cond8

for.end:                                          ; preds = %if.then, %for.cond8
  %tmp29 = load i32* %v, align 4
  %tmp30 = load i32* %j, align 4
  %add31 = add nsw i32 %tmp30, 1
  %idxprom32 = sext i32 %add31 to i64
  %tmp33 = load i32** %a.addr, align 8
  %arrayidx34 = getelementptr inbounds i32* %tmp33, i64 %idxprom32
  store i32 %tmp29, i32* %arrayidx34
  br label %for.inc35

for.inc35:                                        ; preds = %for.end
  %tmp36 = load i32* %i, align 4
  %inc = add nsw i32 %tmp36, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end37:                                        ; preds = %for.cond
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %num_elements = alloca i32, align 4
  %a = alloca i32*, align 8
  %i = alloca i32, align 4
  %present_val = alloca i32, align 4
  %found_at = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 15, i32* %num_elements, align 4
  %tmp = load i32* %num_elements, align 4
  %conv = sext i32 %tmp to i64
  %mul = mul i64 %conv, 4
  %call = call noalias i8* @malloc(i64 %mul) nounwind
  %0 = bitcast i8* %call to i32*
  store i32* %0, i32** %a, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp2 = load i32* %i, align 4
  %tmp3 = load i32* %num_elements, align 4
  %cmp = icmp slt i32 %tmp2, %tmp3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %do.body

do.body:                                          ; preds = %do.cond, %for.body
  %call5 = call i32 @rand() nounwind
  %tmp6 = load i32* %num_elements, align 4
  %rem = srem i32 %call5, %tmp6
  %tmp7 = load i32* %i, align 4
  %idxprom = sext i32 %tmp7 to i64
  %tmp8 = load i32** %a, align 8
  %arrayidx = getelementptr inbounds i32* %tmp8, i64 %idxprom
  store i32 %rem, i32* %arrayidx
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %tmp9 = load i32* %i, align 4
  %idxprom10 = sext i32 %tmp9 to i64
  %tmp11 = load i32** %a, align 8
  %arrayidx12 = getelementptr inbounds i32* %tmp11, i64 %idxprom10
  %tmp13 = load i32* %arrayidx12
  %tmp14 = load i32* %num_elements, align 4
  %div = sdiv i32 %tmp14, 7
  %cmp15 = icmp eq i32 %tmp13, %div
  br i1 %cmp15, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  br label %for.inc

for.inc:                                          ; preds = %do.end
  %tmp17 = load i32* %i, align 4
  %inc = add nsw i32 %tmp17, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp18 = load i32** %a, align 8
  %tmp19 = load i32* %num_elements, align 4
  call void @insertion_sort(i32* %tmp18, i32 %tmp19)
  store i32 0, i32* %i, align 4
  br label %for.cond20

for.cond20:                                       ; preds = %for.inc56, %for.end
  %tmp21 = load i32* %i, align 4
  %cmp22 = icmp slt i32 %tmp21, 10
  br i1 %cmp22, label %for.body24, label %for.end59

for.body24:                                       ; preds = %for.cond20
  %call26 = call i32 @rand() nounwind
  %tmp27 = load i32* %num_elements, align 4
  %rem28 = srem i32 %call26, %tmp27
  %idxprom29 = sext i32 %rem28 to i64
  %tmp30 = load i32** %a, align 8
  %arrayidx31 = getelementptr inbounds i32* %tmp30, i64 %idxprom29
  %tmp32 = load i32* %arrayidx31
  store i32 %tmp32, i32* %present_val, align 4
  %tmp34 = load i32** %a, align 8
  %tmp35 = load i32* %num_elements, align 4
  %sub = sub nsw i32 %tmp35, 1
  %tmp36 = load i32* %present_val, align 4
  %call37 = call i32 @binary_search(i32* %tmp34, i32 0, i32 %sub, i32 %tmp36)
  store i32 %call37, i32* %found_at, align 4
  %tmp38 = load i32* %present_val, align 4
  %tmp39 = load i32* %found_at, align 4
  %idxprom40 = sext i32 %tmp39 to i64
  %tmp41 = load i32** %a, align 8
  %arrayidx42 = getelementptr inbounds i32* %tmp41, i64 %idxprom40
  %tmp43 = load i32* %arrayidx42
  %cmp44 = icmp eq i32 %tmp38, %tmp43
  br i1 %cmp44, label %if.then, label %if.else

if.then:                                          ; preds = %for.body24
  %call46 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str2, i32 0, i32 0))
  br label %if.end

if.else:                                          ; preds = %for.body24
  %tmp47 = load i32* %present_val, align 4
  %call48 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str3, i32 0, i32 0), i32 %tmp47)
  %tmp49 = load i32* %found_at, align 4
  %idxprom50 = sext i32 %tmp49 to i64
  %tmp51 = load i32** %a, align 8
  %arrayidx52 = getelementptr inbounds i32* %tmp51, i64 %idxprom50
  %tmp53 = load i32* %arrayidx52
  %call54 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str4, i32 0, i32 0), i32 %tmp53)
  %call55 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str5, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc56

for.inc56:                                        ; preds = %if.end
  %tmp57 = load i32* %i, align 4
  %inc58 = add nsw i32 %tmp57, 1
  store i32 %inc58, i32* %i, align 4
  br label %for.cond20

for.end59:                                        ; preds = %for.cond20
  ret i32 0
}

declare noalias i8* @malloc(i64) nounwind

declare i32 @rand() nounwind
