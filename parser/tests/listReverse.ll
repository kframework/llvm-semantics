; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/listReverse.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d,\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

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

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %head = alloca i32*, align 8
  %curr = alloca i32*, align 8
  %sum1 = alloca i32, align 4
  %first = alloca i32, align 4
  %last = alloca i32, align 4
  %sum2 = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call noalias i8* @malloc(i64 12) nounwind
  %0 = bitcast i8* %call to i32*
  store i32* %0, i32** %head, align 8
  %tmp = load i32** %head, align 8
  store i32 20, i32* %tmp
  %tmp1 = load i32** %head, align 8
  %add.ptr = getelementptr inbounds i32* %tmp1, i64 1
  %1 = bitcast i32* %add.ptr to i32**
  store i32* null, i32** %1
  %tmp2 = load i32** %head, align 8
  %call3 = call i32* @listAppend(i32* %tmp2, i32 25)
  %tmp4 = load i32** %head, align 8
  %call5 = call i32* @listAppend(i32* %tmp4, i32 15)
  %tmp6 = load i32** %head, align 8
  %call7 = call i32* @listAppend(i32* %tmp6, i32 30)
  %tmp8 = load i32** %head, align 8
  %call9 = call i32* @listAppend(i32* %tmp8, i32 10)
  %tmp10 = load i32** %head, align 8
  %call11 = call i32* @listAppend(i32* %tmp10, i32 35)
  %tmp13 = load i32** %head, align 8
  store i32* %tmp13, i32** %curr, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %tmp14 = load i32** %curr, align 8
  %cmp = icmp ne i32* %tmp14, null
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp15 = load i32** %curr, align 8
  %tmp16 = load i32* %tmp15
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp16)
  %tmp18 = load i32** %curr, align 8
  %add.ptr19 = getelementptr inbounds i32* %tmp18, i64 1
  %2 = bitcast i32* %add.ptr19 to i32**
  %tmp20 = load i32** %2
  store i32* %tmp20, i32** %curr, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0))
  %tmp23 = load i32** %head, align 8
  %call24 = call i32 @listSum(i32* %tmp23)
  store i32 %call24, i32* %sum1, align 4
  %tmp26 = load i32** %head, align 8
  %tmp27 = load i32* %tmp26
  store i32 %tmp27, i32* %first, align 4
  %tmp28 = load i32** %head, align 8
  %call29 = call i32* @listReverse(i32* %tmp28)
  store i32* %call29, i32** %head, align 8
  %tmp30 = load i32** %head, align 8
  store i32* %tmp30, i32** %curr, align 8
  br label %while.cond31

while.cond31:                                     ; preds = %while.body34, %while.end
  %tmp32 = load i32** %curr, align 8
  %cmp33 = icmp ne i32* %tmp32, null
  br i1 %cmp33, label %while.body34, label %while.end41

while.body34:                                     ; preds = %while.cond31
  %tmp35 = load i32** %curr, align 8
  %tmp36 = load i32* %tmp35
  %call37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp36)
  %tmp38 = load i32** %curr, align 8
  %add.ptr39 = getelementptr inbounds i32* %tmp38, i64 1
  %3 = bitcast i32* %add.ptr39 to i32**
  %tmp40 = load i32** %3
  store i32* %tmp40, i32** %curr, align 8
  br label %while.cond31

while.end41:                                      ; preds = %while.cond31
  %call42 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0))
  %tmp44 = load i32** %head, align 8
  %tmp45 = load i32* %tmp44
  store i32 %tmp45, i32* %last, align 4
  %tmp47 = load i32** %head, align 8
  %call48 = call i32 @listSum(i32* %tmp47)
  store i32 %call48, i32* %sum2, align 4
  %tmp49 = load i32* %sum1, align 4
  %tmp50 = load i32* %sum2, align 4
  %sub = sub nsw i32 %tmp49, %tmp50
  %tmp51 = load i32* %last, align 4
  %tmp52 = load i32* %first, align 4
  %sub53 = sub nsw i32 %tmp51, %tmp52
  %add = add nsw i32 %sub, %sub53
  ret i32 %add
}

declare noalias i8* @malloc(i64) nounwind

define i32* @listAppend(i32* %p, i32 %n) nounwind uwtable {
entry:
  %p.addr = alloca i32*, align 8
  %n.addr = alloca i32, align 4
  %x = alloca i32*, align 8
  %next = alloca i32*, align 8
  store i32* %p, i32** %p.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32** %p.addr, align 8
  %cmp = icmp ne i32* %tmp, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %tmp1 = load i32** %p.addr, align 8
  store i32* %tmp1, i32** %x, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then
  %tmp2 = load i32** %x, align 8
  %add.ptr = getelementptr inbounds i32* %tmp2, i64 1
  %0 = bitcast i32* %add.ptr to i32**
  %tmp3 = load i32** %0
  %cmp4 = icmp ne i32* %tmp3, null
  br i1 %cmp4, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp5 = load i32** %x, align 8
  %add.ptr6 = getelementptr inbounds i32* %tmp5, i64 1
  %1 = bitcast i32* %add.ptr6 to i32**
  %tmp7 = load i32** %1
  store i32* %tmp7, i32** %x, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %call = call noalias i8* @malloc(i64 12) nounwind
  %2 = bitcast i8* %call to i32*
  store i32* %2, i32** %next, align 8
  %tmp9 = load i32** %next, align 8
  %tmp10 = load i32** %x, align 8
  %add.ptr11 = getelementptr inbounds i32* %tmp10, i64 1
  %3 = bitcast i32* %add.ptr11 to i32**
  store i32* %tmp9, i32** %3
  %tmp12 = load i32* %n.addr, align 4
  %tmp13 = load i32** %next, align 8
  store i32 %tmp12, i32* %tmp13
  %tmp14 = load i32** %next, align 8
  %add.ptr15 = getelementptr inbounds i32* %tmp14, i64 1
  %4 = bitcast i32* %add.ptr15 to i32**
  store i32* null, i32** %4
  br label %if.end

if.end:                                           ; preds = %while.end, %entry
  %tmp16 = load i32** %p.addr, align 8
  ret i32* %tmp16
}

declare i32 @printf(i8*, ...)

define i32 @listSum(i32* %p) nounwind uwtable {
entry:
  %p.addr = alloca i32*, align 8
  %sum = alloca i32, align 4
  %x = alloca i32*, align 8
  store i32* %p, i32** %p.addr, align 8
  store i32 0, i32* %sum, align 4
  %tmp = load i32** %p.addr, align 8
  %cmp = icmp ne i32* %tmp, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %tmp1 = load i32** %p.addr, align 8
  store i32* %tmp1, i32** %x, align 8
  %tmp2 = load i32** %x, align 8
  %tmp3 = load i32* %tmp2
  %tmp4 = load i32* %sum, align 4
  %add = add nsw i32 %tmp4, %tmp3
  store i32 %add, i32* %sum, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then
  %tmp5 = load i32** %x, align 8
  %add.ptr = getelementptr inbounds i32* %tmp5, i64 1
  %0 = bitcast i32* %add.ptr to i32**
  %tmp6 = load i32** %0
  %cmp7 = icmp ne i32* %tmp6, null
  br i1 %cmp7, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp8 = load i32** %x, align 8
  %add.ptr9 = getelementptr inbounds i32* %tmp8, i64 1
  %1 = bitcast i32* %add.ptr9 to i32**
  %tmp10 = load i32** %1
  store i32* %tmp10, i32** %x, align 8
  %tmp11 = load i32** %x, align 8
  %tmp12 = load i32* %tmp11
  %tmp13 = load i32* %sum, align 4
  %add14 = add nsw i32 %tmp13, %tmp12
  store i32 %add14, i32* %sum, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  br label %if.end

if.end:                                           ; preds = %while.end, %entry
  %tmp15 = load i32* %sum, align 4
  ret i32 %tmp15
}

define i32* @listReverse(i32* %p) nounwind uwtable {
entry:
  %p.addr = alloca i32*, align 8
  %x = alloca i32*, align 8
  %tmp9 = alloca i32*, align 8
  store i32* %p, i32** %p.addr, align 8
  %tmp = load i32** %p.addr, align 8
  %cmp = icmp ne i32* %tmp, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %tmp2 = load i32** %p.addr, align 8
  %add.ptr = getelementptr inbounds i32* %tmp2, i64 1
  %0 = bitcast i32* %add.ptr to i32**
  %tmp3 = load i32** %0
  store i32* %tmp3, i32** %x, align 8
  %tmp4 = load i32** %p.addr, align 8
  %add.ptr5 = getelementptr inbounds i32* %tmp4, i64 1
  %1 = bitcast i32* %add.ptr5 to i32**
  store i32* null, i32** %1
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then
  %tmp6 = load i32** %x, align 8
  %cmp7 = icmp ne i32* %tmp6, null
  br i1 %cmp7, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp10 = load i32** %x, align 8
  %add.ptr11 = getelementptr inbounds i32* %tmp10, i64 1
  %2 = bitcast i32* %add.ptr11 to i32**
  %tmp12 = load i32** %2
  store i32* %tmp12, i32** %tmp9, align 8
  %tmp13 = load i32** %p.addr, align 8
  %tmp14 = load i32** %x, align 8
  %add.ptr15 = getelementptr inbounds i32* %tmp14, i64 1
  %3 = bitcast i32* %add.ptr15 to i32**
  store i32* %tmp13, i32** %3
  %tmp16 = load i32** %x, align 8
  store i32* %tmp16, i32** %p.addr, align 8
  %tmp17 = load i32** %tmp9, align 8
  store i32* %tmp17, i32** %x, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  br label %if.end

if.end:                                           ; preds = %while.end, %entry
  %tmp18 = load i32** %p.addr, align 8
  ret i32* %tmp18
}
