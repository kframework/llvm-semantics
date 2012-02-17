; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20051215-1.c'
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

define i32 @foo(i32 %x, i32 %y, i32* %z) nounwind uwtable noinline {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  %z.addr = alloca i32*, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  store i32* %z, i32** %z.addr, align 8
  store i32 0, i32* %b, align 4
  store i32 0, i32* %a, align 4
  store i32 0, i32* %d, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc14, %entry
  %tmp = load i32* %d, align 4
  %tmp1 = load i32* %y.addr, align 4
  %cmp = icmp slt i32 %tmp, %tmp1
  br i1 %cmp, label %for.body, label %for.end17

for.body:                                         ; preds = %for.cond
  %tmp2 = load i32** %z.addr, align 8
  %tobool = icmp ne i32* %tmp2, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %tmp3 = load i32* %d, align 4
  %tmp4 = load i32** %z.addr, align 8
  %tmp5 = load i32* %tmp4
  %mul = mul nsw i32 %tmp3, %tmp5
  store i32 %mul, i32* %b, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  store i32 0, i32* %c, align 4
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc, %if.end
  %tmp7 = load i32* %c, align 4
  %tmp8 = load i32* %x.addr, align 4
  %cmp9 = icmp slt i32 %tmp7, %tmp8
  br i1 %cmp9, label %for.body10, label %for.end

for.body10:                                       ; preds = %for.cond6
  %tmp11 = load i32* %b, align 4
  %tmp12 = load i32* %a, align 4
  %add = add nsw i32 %tmp12, %tmp11
  store i32 %add, i32* %a, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body10
  %tmp13 = load i32* %c, align 4
  %inc = add nsw i32 %tmp13, 1
  store i32 %inc, i32* %c, align 4
  br label %for.cond6

for.end:                                          ; preds = %for.cond6
  br label %for.inc14

for.inc14:                                        ; preds = %for.end
  %tmp15 = load i32* %d, align 4
  %inc16 = add nsw i32 %tmp15, 1
  store i32 %inc16, i32* %d, align 4
  br label %for.cond

for.end17:                                        ; preds = %for.cond
  %tmp18 = load i32* %a, align 4
  ret i32 %tmp18
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @foo(i32 3, i32 2, i32* null)
  %cmp = icmp ne i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
