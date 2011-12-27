; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20031010-1.c'
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

define i64 @foo(i64 %ct, i64 %cf, i1 zeroext %p1, i1 zeroext %p2, i1 zeroext %p3) nounwind uwtable noinline {
entry:
  %ct.addr = alloca i64, align 8
  %cf.addr = alloca i64, align 8
  %p1.addr = alloca i8, align 1
  %p2.addr = alloca i8, align 1
  %p3.addr = alloca i8, align 1
  %diff = alloca i64, align 8
  %tmp12 = alloca i64, align 8
  store i64 %ct, i64* %ct.addr, align 8
  store i64 %cf, i64* %cf.addr, align 8
  %frombool = zext i1 %p1 to i8
  store i8 %frombool, i8* %p1.addr, align 1
  %frombool1 = zext i1 %p2 to i8
  store i8 %frombool1, i8* %p2.addr, align 1
  %frombool2 = zext i1 %p3 to i8
  store i8 %frombool2, i8* %p3.addr, align 1
  %tmp = load i64* %ct.addr, align 8
  %tmp3 = load i64* %cf.addr, align 8
  %sub = sub nsw i64 %tmp, %tmp3
  store i64 %sub, i64* %diff, align 8
  %tmp4 = load i8* %p1.addr, align 1
  %tobool = trunc i8 %tmp4 to i1
  br i1 %tobool, label %if.then, label %if.end21

if.then:                                          ; preds = %entry
  %tmp5 = load i8* %p2.addr, align 1
  %tobool6 = trunc i8 %tmp5 to i1
  br i1 %tobool6, label %if.then7, label %if.end19

if.then7:                                         ; preds = %if.then
  %tmp8 = load i8* %p3.addr, align 1
  %tobool9 = trunc i8 %tmp8 to i1
  br i1 %tobool9, label %if.then10, label %if.end

if.then10:                                        ; preds = %if.then7
  %tmp13 = load i64* %ct.addr, align 8
  store i64 %tmp13, i64* %tmp12, align 8
  %tmp14 = load i64* %cf.addr, align 8
  store i64 %tmp14, i64* %ct.addr, align 8
  %tmp15 = load i64* %tmp12, align 8
  store i64 %tmp15, i64* %cf.addr, align 8
  br label %if.end

if.end:                                           ; preds = %if.then10, %if.then7
  %tmp16 = load i64* %ct.addr, align 8
  %tmp17 = load i64* %cf.addr, align 8
  %sub18 = sub nsw i64 %tmp16, %tmp17
  store i64 %sub18, i64* %diff, align 8
  br label %if.end19

if.end19:                                         ; preds = %if.end, %if.then
  %tmp20 = load i64* %diff, align 8
  ret i64 %tmp20

if.end21:                                         ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i64 @foo(i64 2, i64 3, i1 zeroext true, i1 zeroext true, i1 zeroext true)
  %cmp = icmp eq i64 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}
