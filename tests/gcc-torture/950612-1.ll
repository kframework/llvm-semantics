; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/950612-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

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

define i32 @f1(i32 %diff) nounwind uwtable {
entry:
  %diff.addr = alloca i32, align 4
  store i32 %diff, i32* %diff.addr, align 4
  %tmp = load i32* %diff.addr, align 4
  %cmp = icmp slt i32 %tmp, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp1 = load i32* %diff.addr, align 4
  %sub = sub nsw i32 0, %tmp1
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp2 = load i32* %diff.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub, %cond.true ], [ %tmp2, %cond.false ]
  ret i32 %cond
}

define i32 @f2(i32 %diff) nounwind uwtable {
entry:
  %diff.addr = alloca i32, align 4
  store i32 %diff, i32* %diff.addr, align 4
  %tmp = load i32* %diff.addr, align 4
  %cmp = icmp slt i32 %tmp, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp1 = load i32* %diff.addr, align 4
  %sub = sub i32 0, %tmp1
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp2 = load i32* %diff.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub, %cond.true ], [ %tmp2, %cond.false ]
  ret i32 %cond
}

define i64 @f3(i64 %diff) nounwind uwtable {
entry:
  %diff.addr = alloca i64, align 8
  store i64 %diff, i64* %diff.addr, align 8
  %tmp = load i64* %diff.addr, align 8
  %cmp = icmp slt i64 %tmp, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp1 = load i64* %diff.addr, align 8
  %sub = sub nsw i64 0, %tmp1
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp2 = load i64* %diff.addr, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %sub, %cond.true ], [ %tmp2, %cond.false ]
  ret i64 %cond
}

define i64 @f4(i64 %diff) nounwind uwtable {
entry:
  %diff.addr = alloca i64, align 8
  store i64 %diff, i64* %diff.addr, align 8
  %tmp = load i64* %diff.addr, align 8
  %cmp = icmp slt i64 %tmp, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp1 = load i64* %diff.addr, align 8
  %sub = sub i64 0, %tmp1
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp2 = load i64* %diff.addr, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %sub, %cond.true ], [ %tmp2, %cond.false ]
  ret i64 %cond
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp sle i32 %tmp, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %call = call i32 @f1(i32 %tmp1)
  %tmp2 = load i32* %i, align 4
  %cmp3 = icmp ne i32 %call, %tmp2
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.body
  %tmp4 = load i32* %i, align 4
  %sub = sub nsw i32 0, %tmp4
  %call5 = call i32 @f1(i32 %sub)
  %tmp6 = load i32* %i, align 4
  %cmp7 = icmp ne i32 %call5, %tmp6
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end9:                                          ; preds = %if.end
  %tmp10 = load i32* %i, align 4
  %call11 = call i32 @f2(i32 %tmp10)
  %tmp12 = load i32* %i, align 4
  %cmp13 = icmp ne i32 %call11, %tmp12
  br i1 %cmp13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.end9
  call void @abort() noreturn nounwind
  unreachable

if.end15:                                         ; preds = %if.end9
  %tmp16 = load i32* %i, align 4
  %sub17 = sub nsw i32 0, %tmp16
  %call18 = call i32 @f2(i32 %sub17)
  %tmp19 = load i32* %i, align 4
  %cmp20 = icmp ne i32 %call18, %tmp19
  br i1 %cmp20, label %if.then21, label %if.end22

if.then21:                                        ; preds = %if.end15
  call void @abort() noreturn nounwind
  unreachable

if.end22:                                         ; preds = %if.end15
  %tmp23 = load i32* %i, align 4
  %conv = sext i32 %tmp23 to i64
  %call24 = call i64 @f3(i64 %conv)
  %tmp25 = load i32* %i, align 4
  %conv26 = sext i32 %tmp25 to i64
  %cmp27 = icmp ne i64 %call24, %conv26
  br i1 %cmp27, label %if.then29, label %if.end30

if.then29:                                        ; preds = %if.end22
  call void @abort() noreturn nounwind
  unreachable

if.end30:                                         ; preds = %if.end22
  %tmp31 = load i32* %i, align 4
  %sub32 = sub nsw i32 0, %tmp31
  %conv33 = sext i32 %sub32 to i64
  %call34 = call i64 @f3(i64 %conv33)
  %tmp35 = load i32* %i, align 4
  %conv36 = sext i32 %tmp35 to i64
  %cmp37 = icmp ne i64 %call34, %conv36
  br i1 %cmp37, label %if.then39, label %if.end40

if.then39:                                        ; preds = %if.end30
  call void @abort() noreturn nounwind
  unreachable

if.end40:                                         ; preds = %if.end30
  %tmp41 = load i32* %i, align 4
  %conv42 = sext i32 %tmp41 to i64
  %call43 = call i64 @f4(i64 %conv42)
  %tmp44 = load i32* %i, align 4
  %conv45 = sext i32 %tmp44 to i64
  %cmp46 = icmp ne i64 %call43, %conv45
  br i1 %cmp46, label %if.then48, label %if.end49

if.then48:                                        ; preds = %if.end40
  call void @abort() noreturn nounwind
  unreachable

if.end49:                                         ; preds = %if.end40
  %tmp50 = load i32* %i, align 4
  %sub51 = sub nsw i32 0, %tmp50
  %conv52 = sext i32 %sub51 to i64
  %call53 = call i64 @f4(i64 %conv52)
  %tmp54 = load i32* %i, align 4
  %conv55 = sext i32 %tmp54 to i64
  %cmp56 = icmp ne i64 %call53, %conv55
  br i1 %cmp56, label %if.then58, label %if.end59

if.then58:                                        ; preds = %if.end49
  call void @abort() noreturn nounwind
  unreachable

if.end59:                                         ; preds = %if.end49
  br label %for.inc

for.inc:                                          ; preds = %if.end59
  %tmp60 = load i32* %i, align 4
  %inc = add nsw i32 %tmp60, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
