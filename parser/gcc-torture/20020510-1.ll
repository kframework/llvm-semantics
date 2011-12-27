; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20020510-1.c'
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

define void @testc(i8 zeroext %c, i32 %ok) nounwind uwtable {
entry:
  %c.addr = alloca i8, align 1
  %ok.addr = alloca i32, align 4
  store i8 %c, i8* %c.addr, align 1
  store i32 %ok, i32* %ok.addr, align 4
  %tmp = load i8* %c.addr, align 1
  %conv = zext i8 %tmp to i32
  %cmp = icmp sge i32 %conv, 1
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %tmp2 = load i8* %c.addr, align 1
  %conv3 = zext i8 %tmp2 to i32
  %cmp4 = icmp sle i32 %conv3, 127
  br i1 %cmp4, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %tmp6 = load i32* %ok.addr, align 4
  %tobool = icmp ne i32 %tmp6, 0
  br i1 %tobool, label %if.end, label %if.then7

if.then7:                                         ; preds = %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  br label %if.end12

if.else:                                          ; preds = %land.lhs.true, %entry
  %tmp8 = load i32* %ok.addr, align 4
  %tobool9 = icmp ne i32 %tmp8, 0
  br i1 %tobool9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.else
  call void @abort() noreturn nounwind
  unreachable

if.end11:                                         ; preds = %if.else
  br label %if.end12

if.end12:                                         ; preds = %if.end11, %if.end
  ret void
}

declare void @abort() noreturn nounwind

define void @tests(i16 zeroext %s, i32 %ok) nounwind uwtable {
entry:
  %s.addr = alloca i16, align 2
  %ok.addr = alloca i32, align 4
  store i16 %s, i16* %s.addr, align 2
  store i32 %ok, i32* %ok.addr, align 4
  %tmp = load i16* %s.addr, align 2
  %conv = zext i16 %tmp to i32
  %cmp = icmp sge i32 %conv, 1
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %tmp2 = load i16* %s.addr, align 2
  %conv3 = zext i16 %tmp2 to i32
  %cmp4 = icmp sle i32 %conv3, 32767
  br i1 %cmp4, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %tmp6 = load i32* %ok.addr, align 4
  %tobool = icmp ne i32 %tmp6, 0
  br i1 %tobool, label %if.end, label %if.then7

if.then7:                                         ; preds = %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  br label %if.end12

if.else:                                          ; preds = %land.lhs.true, %entry
  %tmp8 = load i32* %ok.addr, align 4
  %tobool9 = icmp ne i32 %tmp8, 0
  br i1 %tobool9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.else
  call void @abort() noreturn nounwind
  unreachable

if.end11:                                         ; preds = %if.else
  br label %if.end12

if.end12:                                         ; preds = %if.end11, %if.end
  ret void
}

define void @testi(i32 %i, i32 %ok) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %ok.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  store i32 %ok, i32* %ok.addr, align 4
  %tmp = load i32* %i.addr, align 4
  %cmp = icmp uge i32 %tmp, 1
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %tmp1 = load i32* %i.addr, align 4
  %cmp2 = icmp ule i32 %tmp1, 2147483647
  br i1 %cmp2, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %tmp3 = load i32* %ok.addr, align 4
  %tobool = icmp ne i32 %tmp3, 0
  br i1 %tobool, label %if.end, label %if.then4

if.then4:                                         ; preds = %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  br label %if.end9

if.else:                                          ; preds = %land.lhs.true, %entry
  %tmp5 = load i32* %ok.addr, align 4
  %tobool6 = icmp ne i32 %tmp5, 0
  br i1 %tobool6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.else
  call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.else
  br label %if.end9

if.end9:                                          ; preds = %if.end8, %if.end
  ret void
}

define void @testl(i64 %l, i32 %ok) nounwind uwtable {
entry:
  %l.addr = alloca i64, align 8
  %ok.addr = alloca i32, align 4
  store i64 %l, i64* %l.addr, align 8
  store i32 %ok, i32* %ok.addr, align 4
  %tmp = load i64* %l.addr, align 8
  %cmp = icmp uge i64 %tmp, 1
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %tmp1 = load i64* %l.addr, align 8
  %cmp2 = icmp ule i64 %tmp1, 9223372036854775807
  br i1 %cmp2, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %tmp3 = load i32* %ok.addr, align 4
  %tobool = icmp ne i32 %tmp3, 0
  br i1 %tobool, label %if.end, label %if.then4

if.then4:                                         ; preds = %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  br label %if.end9

if.else:                                          ; preds = %land.lhs.true, %entry
  %tmp5 = load i32* %ok.addr, align 4
  %tobool6 = icmp ne i32 %tmp5, 0
  br i1 %tobool6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.else
  call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.else
  br label %if.end9

if.end9:                                          ; preds = %if.end8, %if.end
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @testc(i8 zeroext 0, i32 0)
  call void @testc(i8 zeroext 1, i32 1)
  call void @testc(i8 zeroext 127, i32 1)
  call void @testc(i8 zeroext -128, i32 0)
  call void @testc(i8 zeroext -1, i32 0)
  call void @tests(i16 zeroext 0, i32 0)
  call void @tests(i16 zeroext 1, i32 1)
  call void @tests(i16 zeroext 32767, i32 1)
  call void @tests(i16 zeroext -32768, i32 0)
  call void @tests(i16 zeroext -1, i32 0)
  call void @testi(i32 0, i32 0)
  call void @testi(i32 1, i32 1)
  call void @testi(i32 2147483647, i32 1)
  call void @testi(i32 -2147483648, i32 0)
  call void @testi(i32 -1, i32 0)
  call void @testl(i64 0, i32 0)
  call void @testl(i64 1, i32 1)
  call void @testl(i64 9223372036854775807, i32 1)
  call void @testl(i64 -9223372036854775808, i32 0)
  call void @testl(i64 -1, i32 0)
  ret i32 0
}
