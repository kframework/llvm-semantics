; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20060930-1.c'
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

define i32 @bar(i32 %a, i32 %b) nounwind uwtable noinline {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  %tmp = load i32* %b.addr, align 4
  %cmp = icmp ne i32 %tmp, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind

define void @foo(i32 %e, i32 %n) nounwind uwtable noinline {
entry:
  %e.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %bb2 = alloca i32, align 4
  %bb5 = alloca i32, align 4
  store i32 %e, i32* %e.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %e.addr, align 4
  %cmp = icmp sgt i32 %tmp, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %tmp1 = load i32* %e.addr, align 4
  %sub = sub nsw i32 0, %tmp1
  store i32 %sub, i32* %e.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %tmp2 = load i32* %i, align 4
  %tmp3 = load i32* %n.addr, align 4
  %cmp4 = icmp slt i32 %tmp2, %tmp3
  br i1 %cmp4, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp5 = load i32* %e.addr, align 4
  %cmp6 = icmp sge i32 %tmp5, 0
  br i1 %cmp6, label %if.then7, label %if.else

if.then7:                                         ; preds = %for.body
  store i32 0, i32* %bb2, align 4
  store i32 0, i32* %bb5, align 4
  br label %if.end11

if.else:                                          ; preds = %for.body
  %tmp8 = load i32* %e.addr, align 4
  %sub9 = sub nsw i32 0, %tmp8
  store i32 %sub9, i32* %bb5, align 4
  %tmp10 = load i32* %bb5, align 4
  store i32 %tmp10, i32* %bb2, align 4
  br label %if.end11

if.end11:                                         ; preds = %if.else, %if.then7
  %tmp12 = load i32* %bb5, align 4
  %tmp13 = load i32* %bb2, align 4
  %call = call i32 @bar(i32 %tmp12, i32 %tmp13)
  br label %for.inc

for.inc:                                          ; preds = %if.end11
  %tmp14 = load i32* %i, align 4
  %inc = add nsw i32 %tmp14, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @foo(i32 1, i32 1)
  ret i32 0
}
