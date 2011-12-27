; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/900409-1.c'
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

define i64 @f1(i64 %a) nounwind uwtable {
entry:
  %a.addr = alloca i64, align 8
  store i64 %a, i64* %a.addr, align 8
  %tmp = load i64* %a.addr, align 8
  %and = and i64 %tmp, 4278190080
  ret i64 %and
}

define i64 @f2(i64 %a) nounwind uwtable {
entry:
  %a.addr = alloca i64, align 8
  store i64 %a, i64* %a.addr, align 8
  %tmp = load i64* %a.addr, align 8
  %and = and i64 %tmp, -4278190081
  ret i64 %and
}

define i64 @f3(i64 %a) nounwind uwtable {
entry:
  %a.addr = alloca i64, align 8
  store i64 %a, i64* %a.addr, align 8
  %tmp = load i64* %a.addr, align 8
  %and = and i64 %tmp, 255
  ret i64 %and
}

define i64 @f4(i64 %a) nounwind uwtable {
entry:
  %a.addr = alloca i64, align 8
  store i64 %a, i64* %a.addr, align 8
  %tmp = load i64* %a.addr, align 8
  %and = and i64 %tmp, -256
  ret i64 %and
}

define i64 @f5(i64 %a) nounwind uwtable {
entry:
  %a.addr = alloca i64, align 8
  store i64 %a, i64* %a.addr, align 8
  %tmp = load i64* %a.addr, align 8
  %and = and i64 %tmp, 65535
  ret i64 %and
}

define i64 @f6(i64 %a) nounwind uwtable {
entry:
  %a.addr = alloca i64, align 8
  store i64 %a, i64* %a.addr, align 8
  %tmp = load i64* %a.addr, align 8
  %and = and i64 %tmp, -65536
  ret i64 %and
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca i64, align 8
  store i32 0, i32* %retval
  store i64 2309737967, i64* %a, align 8
  %tmp = load i64* %a, align 8
  %call = call i64 @f1(i64 %tmp)
  %cmp = icmp ne i64 %call, 2298478592
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load i64* %a, align 8
  %call2 = call i64 @f2(i64 %tmp1)
  %cmp3 = icmp ne i64 %call2, 11259375
  br i1 %cmp3, label %if.then, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %lor.lhs.false
  %tmp5 = load i64* %a, align 8
  %call6 = call i64 @f3(i64 %tmp5)
  %cmp7 = icmp ne i64 %call6, 239
  br i1 %cmp7, label %if.then, label %lor.lhs.false8

lor.lhs.false8:                                   ; preds = %lor.lhs.false4
  %tmp9 = load i64* %a, align 8
  %call10 = call i64 @f4(i64 %tmp9)
  %cmp11 = icmp ne i64 %call10, 2309737728
  br i1 %cmp11, label %if.then, label %lor.lhs.false12

lor.lhs.false12:                                  ; preds = %lor.lhs.false8
  %tmp13 = load i64* %a, align 8
  %call14 = call i64 @f5(i64 %tmp13)
  %cmp15 = icmp ne i64 %call14, 52719
  br i1 %cmp15, label %if.then, label %lor.lhs.false16

lor.lhs.false16:                                  ; preds = %lor.lhs.false12
  %tmp17 = load i64* %a, align 8
  %call18 = call i64 @f6(i64 %tmp17)
  %cmp19 = icmp ne i64 %call18, 2309685248
  br i1 %cmp19, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false16, %lor.lhs.false12, %lor.lhs.false8, %lor.lhs.false4, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false16
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
