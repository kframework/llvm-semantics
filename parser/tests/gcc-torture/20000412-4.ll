; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20000412-4.c'
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

define void @f(i32 %i, i32 %j, i32 %radius, i32 %width, i32 %N) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %j.addr = alloca i32, align 4
  %radius.addr = alloca i32, align 4
  %width.addr = alloca i32, align 4
  %N.addr = alloca i32, align 4
  %diff = alloca i32, align 4
  %lowk = alloca i32, align 4
  %k = alloca i32, align 4
  %idx = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  store i32 %j, i32* %j.addr, align 4
  store i32 %radius, i32* %radius.addr, align 4
  store i32 %width, i32* %width.addr, align 4
  store i32 %N, i32* %N.addr, align 4
  %tmp = load i32* %i.addr, align 4
  %tmp1 = load i32* %radius.addr, align 4
  %sub = sub nsw i32 %tmp, %tmp1
  store i32 %sub, i32* %diff, align 4
  %tmp3 = load i32* %diff, align 4
  %cmp = icmp sgt i32 %tmp3, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp4 = load i32* %diff, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %tmp4, %cond.true ], [ 0, %cond.false ]
  store i32 %cond, i32* %lowk, align 4
  %tmp6 = load i32* %lowk, align 4
  store i32 %tmp6, i32* %k, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %cond.end
  %tmp7 = load i32* %k, align 4
  %cmp8 = icmp sle i32 %tmp7, 2
  br i1 %cmp8, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp10 = load i32* %k, align 4
  %tmp11 = load i32* %i.addr, align 4
  %sub12 = sub nsw i32 %tmp10, %tmp11
  %tmp13 = load i32* %radius.addr, align 4
  %add = add nsw i32 %sub12, %tmp13
  %tmp14 = load i32* %width.addr, align 4
  %mul = mul nsw i32 %add, %tmp14
  %tmp15 = load i32* %j.addr, align 4
  %sub16 = sub nsw i32 %mul, %tmp15
  %tmp17 = load i32* %radius.addr, align 4
  %add18 = add nsw i32 %sub16, %tmp17
  store i32 %add18, i32* %idx, align 4
  %tmp19 = load i32* %idx, align 4
  %cmp20 = icmp slt i32 %tmp19, 0
  br i1 %cmp20, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp21 = load i32* %k, align 4
  %inc = add nsw i32 %tmp21, 1
  store i32 %inc, i32* %k, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp22 = load i32* %lowk, align 4
  store i32 %tmp22, i32* %k, align 4
  br label %for.cond23

for.cond23:                                       ; preds = %for.inc27, %for.end
  %tmp24 = load i32* %k, align 4
  %cmp25 = icmp sle i32 %tmp24, 2
  br i1 %cmp25, label %for.body26, label %for.end30

for.body26:                                       ; preds = %for.cond23
  br label %for.inc27

for.inc27:                                        ; preds = %for.body26
  %tmp28 = load i32* %k, align 4
  %inc29 = add nsw i32 %tmp28, 1
  store i32 %inc29, i32* %k, align 4
  br label %for.cond23

for.end30:                                        ; preds = %for.cond23
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %exc_rad = alloca i32, align 4
  %N = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 2, i32* %exc_rad, align 4
  store i32 8, i32* %N, align 4
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %tmp2 = load i32* %exc_rad, align 4
  %tmp3 = load i32* %exc_rad, align 4
  %mul = mul nsw i32 2, %tmp3
  %add = add nsw i32 %mul, 1
  %tmp4 = load i32* %N, align 4
  call void @f(i32 %tmp1, i32 1, i32 %tmp2, i32 %add, i32 %tmp4)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp5 = load i32* %i, align 4
  %inc = add nsw i32 %tmp5, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
