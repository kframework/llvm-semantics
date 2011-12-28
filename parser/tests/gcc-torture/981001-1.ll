; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/981001-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@flg = global i64 0, align 8

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

define i64 @sub(i32 %n) nounwind uwtable {
entry:
  %retval = alloca i64, align 8
  %n.addr = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %cmp = icmp sge i32 %tmp, 2
  br i1 %cmp, label %if.then, label %if.else30

if.then:                                          ; preds = %entry
  %tmp1 = load i32* %n.addr, align 4
  %rem = srem i32 %tmp1, 2
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then3, label %if.else

if.then3:                                         ; preds = %if.then
  %tmp4 = load i32* %n.addr, align 4
  %div = sdiv i32 %tmp4, 2
  %call = call i64 @sub(i32 %div)
  %conv = trunc i64 %call to i32
  store i32 %conv, i32* %a, align 4
  %tmp5 = load i32* %a, align 4
  %conv6 = sext i32 %tmp5 to i64
  %tmp7 = load i32* %n.addr, align 4
  %div8 = sdiv i32 %tmp7, 2
  %sub = sub nsw i32 %div8, 1
  %call9 = call i64 @sub(i32 %sub)
  %mul = mul nsw i64 2, %call9
  %add = add nsw i64 %conv6, %mul
  %tmp10 = load i32* %a, align 4
  %conv11 = sext i32 %tmp10 to i64
  %mul12 = mul nsw i64 %add, %conv11
  store i64 %mul12, i64* %retval
  br label %return

if.else:                                          ; preds = %if.then
  %tmp13 = load i32* %n.addr, align 4
  %div14 = sdiv i32 %tmp13, 2
  %add15 = add nsw i32 %div14, 1
  %call16 = call i64 @sub(i32 %add15)
  %conv17 = trunc i64 %call16 to i32
  store i32 %conv17, i32* %a, align 4
  %tmp18 = load i32* %n.addr, align 4
  %div19 = sdiv i32 %tmp18, 2
  %call20 = call i64 @sub(i32 %div19)
  %conv21 = trunc i64 %call20 to i32
  store i32 %conv21, i32* %b, align 4
  %tmp22 = load i32* %a, align 4
  %tmp23 = load i32* %a, align 4
  %mul24 = mul nsw i32 %tmp22, %tmp23
  %tmp25 = load i32* %b, align 4
  %tmp26 = load i32* %b, align 4
  %mul27 = mul nsw i32 %tmp25, %tmp26
  %add28 = add nsw i32 %mul24, %mul27
  %conv29 = sext i32 %add28 to i64
  store i64 %conv29, i64* %retval
  br label %return

if.else30:                                        ; preds = %entry
  %tmp31 = load i32* %n.addr, align 4
  %conv32 = sext i32 %tmp31 to i64
  store i64 %conv32, i64* %retval
  br label %return

return:                                           ; preds = %if.else30, %if.else, %if.then3
  %0 = load i64* %retval
  ret i64 %0
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i64 @sub(i32 30)
  %cmp = icmp ne i64 %call, 832040
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %tmp = load i64* @flg, align 8
  %or = or i64 %tmp, 256
  store i64 %or, i64* @flg, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %tmp1 = load i64* @flg, align 8
  %tobool = icmp ne i64 %tmp1, 0
  br i1 %tobool, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end3:                                          ; preds = %if.end
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
