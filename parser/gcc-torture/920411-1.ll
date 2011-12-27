; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/920411-1.c'
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

define i64 @f(i8* %w) nounwind uwtable {
entry:
  %w.addr = alloca i8*, align 8
  %k = alloca i64, align 8
  %i = alloca i64, align 8
  %c = alloca i64, align 8
  %x = alloca i64, align 8
  %p = alloca i8*, align 8
  store i8* %w, i8** %w.addr, align 8
  store i64 0, i64* %c, align 8
  %0 = bitcast i64* %x to i8*
  store i8* %0, i8** %p, align 8
  store i64 0, i64* %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc14, %entry
  %tmp = load i64* %i, align 8
  %cmp = icmp slt i64 %tmp, 1
  br i1 %cmp, label %for.body, label %for.end17

for.body:                                         ; preds = %for.cond
  store i64 0, i64* %k, align 8
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %tmp2 = load i64* %k, align 8
  %cmp3 = icmp ult i64 %tmp2, 8
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond1
  %tmp5 = load i64* %k, align 8
  %tmp6 = load i8** %w.addr, align 8
  %arrayidx = getelementptr inbounds i8* %tmp6, i64 %tmp5
  %tmp7 = load i8* %arrayidx
  %tmp8 = load i64* %k, align 8
  %tmp9 = load i8** %p, align 8
  %arrayidx10 = getelementptr inbounds i8* %tmp9, i64 %tmp8
  store i8 %tmp7, i8* %arrayidx10
  br label %for.inc

for.inc:                                          ; preds = %for.body4
  %tmp11 = load i64* %k, align 8
  %inc = add nsw i64 %tmp11, 1
  store i64 %inc, i64* %k, align 8
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  %tmp12 = load i64* %x, align 8
  %tmp13 = load i64* %c, align 8
  %add = add nsw i64 %tmp13, %tmp12
  store i64 %add, i64* %c, align 8
  br label %for.inc14

for.inc14:                                        ; preds = %for.end
  %tmp15 = load i64* %i, align 8
  %inc16 = add nsw i64 %tmp15, 1
  store i64 %inc16, i64* %i, align 8
  br label %for.cond

for.end17:                                        ; preds = %for.cond
  %tmp18 = load i64* %c, align 8
  ret i64 %tmp18
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %a = alloca [8 x i8], align 1
  store i32 0, i32* %retval
  store i32 8, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %tmp = load i32* %i, align 4
  %dec = add nsw i32 %tmp, -1
  store i32 %dec, i32* %i, align 4
  %cmp = icmp sge i32 %dec, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [8 x i8]* %a, i32 0, i64 %idxprom
  store i8 32, i8* %arrayidx, align 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [8 x i8]* %a, i32 0, i32 0
  %call = call i64 (...)* bitcast (i64 (i8*)* @f to i64 (...)*)(i8* %arraydecay)
  %cmp2 = icmp ne i64 %call, 2314885530818453536
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.end
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
