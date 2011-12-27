; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20020307-1.c'
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

define void @f3(i64 %j) nounwind uwtable {
entry:
  %j.addr = alloca i64, align 8
  store i64 %j, i64* %j.addr, align 8
  %tmp = load i64* %j.addr, align 8
  %and = and i64 %tmp, 7
  %cmp = icmp uge i64 %and, 6
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define void @f4(i64 %j) nounwind uwtable {
entry:
  %j.addr = alloca i64, align 8
  store i64 %j, i64* %j.addr, align 8
  %tmp = load i64* %j.addr, align 8
  %and = and i64 %tmp, 15
  %cmp = icmp uge i64 %and, 10
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f5(i64 %j) nounwind uwtable {
entry:
  %j.addr = alloca i64, align 8
  store i64 %j, i64* %j.addr, align 8
  %tmp = load i64* %j.addr, align 8
  %and = and i64 %tmp, 31
  %cmp = icmp uge i64 %and, 18
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f6(i64 %j) nounwind uwtable {
entry:
  %j.addr = alloca i64, align 8
  store i64 %j, i64* %j.addr, align 8
  %tmp = load i64* %j.addr, align 8
  %and = and i64 %tmp, 63
  %cmp = icmp uge i64 %and, 34
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f7(i64 %j) nounwind uwtable {
entry:
  %j.addr = alloca i64, align 8
  store i64 %j, i64* %j.addr, align 8
  %tmp = load i64* %j.addr, align 8
  %and = and i64 %tmp, 127
  %cmp = icmp uge i64 %and, 66
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f8(i64 %j) nounwind uwtable {
entry:
  %j.addr = alloca i64, align 8
  store i64 %j, i64* %j.addr, align 8
  %tmp = load i64* %j.addr, align 8
  %and = and i64 %tmp, 255
  %cmp = icmp uge i64 %and, 130
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f9(i64 %j) nounwind uwtable {
entry:
  %j.addr = alloca i64, align 8
  store i64 %j, i64* %j.addr, align 8
  %tmp = load i64* %j.addr, align 8
  %and = and i64 %tmp, 511
  %cmp = icmp uge i64 %and, 258
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f10(i64 %j) nounwind uwtable {
entry:
  %j.addr = alloca i64, align 8
  store i64 %j, i64* %j.addr, align 8
  %tmp = load i64* %j.addr, align 8
  %and = and i64 %tmp, 1023
  %cmp = icmp uge i64 %and, 514
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f11(i64 %j) nounwind uwtable {
entry:
  %j.addr = alloca i64, align 8
  store i64 %j, i64* %j.addr, align 8
  %tmp = load i64* %j.addr, align 8
  %and = and i64 %tmp, 2047
  %cmp = icmp uge i64 %and, 1026
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f12(i64 %j) nounwind uwtable {
entry:
  %j.addr = alloca i64, align 8
  store i64 %j, i64* %j.addr, align 8
  %tmp = load i64* %j.addr, align 8
  %and = and i64 %tmp, 4095
  %cmp = icmp uge i64 %and, 2050
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f13(i64 %j) nounwind uwtable {
entry:
  %j.addr = alloca i64, align 8
  store i64 %j, i64* %j.addr, align 8
  %tmp = load i64* %j.addr, align 8
  %and = and i64 %tmp, 8191
  %cmp = icmp uge i64 %and, 4098
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f14(i64 %j) nounwind uwtable {
entry:
  %j.addr = alloca i64, align 8
  store i64 %j, i64* %j.addr, align 8
  %tmp = load i64* %j.addr, align 8
  %and = and i64 %tmp, 16383
  %cmp = icmp uge i64 %and, 8194
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f15(i64 %j) nounwind uwtable {
entry:
  %j.addr = alloca i64, align 8
  store i64 %j, i64* %j.addr, align 8
  %tmp = load i64* %j.addr, align 8
  %and = and i64 %tmp, 32767
  %cmp = icmp uge i64 %and, 16386
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f16(i64 %j) nounwind uwtable {
entry:
  %j.addr = alloca i64, align 8
  store i64 %j, i64* %j.addr, align 8
  %tmp = load i64* %j.addr, align 8
  %and = and i64 %tmp, 65535
  %cmp = icmp uge i64 %and, 32770
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f17(i64 %j) nounwind uwtable {
entry:
  %j.addr = alloca i64, align 8
  store i64 %j, i64* %j.addr, align 8
  %tmp = load i64* %j.addr, align 8
  %and = and i64 %tmp, 131071
  %cmp = icmp uge i64 %and, 65538
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f18(i64 %j) nounwind uwtable {
entry:
  %j.addr = alloca i64, align 8
  store i64 %j, i64* %j.addr, align 8
  %tmp = load i64* %j.addr, align 8
  %and = and i64 %tmp, 262143
  %cmp = icmp uge i64 %and, 131074
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f19(i64 %j) nounwind uwtable {
entry:
  %j.addr = alloca i64, align 8
  store i64 %j, i64* %j.addr, align 8
  %tmp = load i64* %j.addr, align 8
  %and = and i64 %tmp, 524287
  %cmp = icmp uge i64 %and, 262146
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f20(i64 %j) nounwind uwtable {
entry:
  %j.addr = alloca i64, align 8
  store i64 %j, i64* %j.addr, align 8
  %tmp = load i64* %j.addr, align 8
  %and = and i64 %tmp, 1048575
  %cmp = icmp uge i64 %and, 524290
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f21(i64 %j) nounwind uwtable {
entry:
  %j.addr = alloca i64, align 8
  store i64 %j, i64* %j.addr, align 8
  %tmp = load i64* %j.addr, align 8
  %and = and i64 %tmp, 2097151
  %cmp = icmp uge i64 %and, 1048578
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f22(i64 %j) nounwind uwtable {
entry:
  %j.addr = alloca i64, align 8
  store i64 %j, i64* %j.addr, align 8
  %tmp = load i64* %j.addr, align 8
  %and = and i64 %tmp, 4194303
  %cmp = icmp uge i64 %and, 2097154
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f23(i64 %j) nounwind uwtable {
entry:
  %j.addr = alloca i64, align 8
  store i64 %j, i64* %j.addr, align 8
  %tmp = load i64* %j.addr, align 8
  %and = and i64 %tmp, 8388607
  %cmp = icmp uge i64 %and, 4194306
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f24(i64 %j) nounwind uwtable {
entry:
  %j.addr = alloca i64, align 8
  store i64 %j, i64* %j.addr, align 8
  %tmp = load i64* %j.addr, align 8
  %and = and i64 %tmp, 16777215
  %cmp = icmp uge i64 %and, 8388610
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f25(i64 %j) nounwind uwtable {
entry:
  %j.addr = alloca i64, align 8
  store i64 %j, i64* %j.addr, align 8
  %tmp = load i64* %j.addr, align 8
  %and = and i64 %tmp, 33554431
  %cmp = icmp uge i64 %and, 16777218
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f26(i64 %j) nounwind uwtable {
entry:
  %j.addr = alloca i64, align 8
  store i64 %j, i64* %j.addr, align 8
  %tmp = load i64* %j.addr, align 8
  %and = and i64 %tmp, 67108863
  %cmp = icmp uge i64 %and, 33554434
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f27(i64 %j) nounwind uwtable {
entry:
  %j.addr = alloca i64, align 8
  store i64 %j, i64* %j.addr, align 8
  %tmp = load i64* %j.addr, align 8
  %and = and i64 %tmp, 134217727
  %cmp = icmp uge i64 %and, 67108866
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f28(i64 %j) nounwind uwtable {
entry:
  %j.addr = alloca i64, align 8
  store i64 %j, i64* %j.addr, align 8
  %tmp = load i64* %j.addr, align 8
  %and = and i64 %tmp, 268435455
  %cmp = icmp uge i64 %and, 134217730
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f29(i64 %j) nounwind uwtable {
entry:
  %j.addr = alloca i64, align 8
  store i64 %j, i64* %j.addr, align 8
  %tmp = load i64* %j.addr, align 8
  %and = and i64 %tmp, 536870911
  %cmp = icmp uge i64 %and, 268435458
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f30(i64 %j) nounwind uwtable {
entry:
  %j.addr = alloca i64, align 8
  store i64 %j, i64* %j.addr, align 8
  %tmp = load i64* %j.addr, align 8
  %and = and i64 %tmp, 1073741823
  %cmp = icmp uge i64 %and, 536870914
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f31(i64 %j) nounwind uwtable {
entry:
  %j.addr = alloca i64, align 8
  store i64 %j, i64* %j.addr, align 8
  %tmp = load i64* %j.addr, align 8
  %and = and i64 %tmp, 2147483647
  %cmp = icmp uge i64 %and, 1073741826
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @f3(i64 0)
  call void @f4(i64 0)
  call void @f5(i64 0)
  call void @f6(i64 0)
  call void @f7(i64 0)
  call void @f8(i64 0)
  call void @f9(i64 0)
  call void @f10(i64 0)
  call void @f11(i64 0)
  call void @f12(i64 0)
  call void @f13(i64 0)
  call void @f14(i64 0)
  call void @f15(i64 0)
  call void @f16(i64 0)
  call void @f17(i64 0)
  call void @f18(i64 0)
  call void @f19(i64 0)
  call void @f20(i64 0)
  call void @f21(i64 0)
  call void @f22(i64 0)
  call void @f23(i64 0)
  call void @f24(i64 0)
  call void @f25(i64 0)
  call void @f26(i64 0)
  call void @f27(i64 0)
  call void @f28(i64 0)
  call void @f29(i64 0)
  call void @f30(i64 0)
  call void @f31(i64 0)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
