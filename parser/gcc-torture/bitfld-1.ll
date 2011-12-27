; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/bitfld-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.x = type { i8, i8, [2 x i8] }

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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %bit = alloca %struct.x, align 4
  %u = alloca i32, align 4
  %i = alloca i32, align 4
  %unsigned_result = alloca i32, align 4
  %signed_result = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 44, i32* %unsigned_result, align 4
  store i32 -13, i32* %signed_result, align 4
  %0 = bitcast %struct.x* %bit to i32*
  %1 = load i32* %0, align 4
  %2 = and i32 %1, -16257
  %3 = or i32 %2, 7808
  store i32 %3, i32* %0, align 4
  store i32 61, i32* %u, align 4
  %4 = bitcast %struct.x* %bit to i32*
  %5 = load i32* %4, align 4
  %6 = and i32 %5, -128
  %7 = or i32 %6, 115
  store i32 %7, i32* %4, align 4
  store i32 -13, i32* %i, align 4
  %tmp = load i32* %i, align 4
  %tmp1 = load i32* %u, align 4
  %rem = urem i32 %tmp, %tmp1
  %tmp2 = load i32* %unsigned_result, align 4
  %cmp = icmp ne i32 %rem, %tmp2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %tmp3 = load i32* %i, align 4
  %tmp4 = load i32* %u, align 4
  %rem5 = urem i32 %tmp3, %tmp4
  %tmp6 = load i32* %unsigned_result, align 4
  %cmp7 = icmp ne i32 %rem5, %tmp6
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end9:                                          ; preds = %if.end
  %tmp10 = load i32* %i, align 4
  %8 = bitcast %struct.x* %bit to i32*
  %9 = load i32* %8, align 4
  %10 = lshr i32 %9, 7
  %bf.clear = and i32 %10, 127
  %rem11 = srem i32 %tmp10, %bf.clear
  %tmp12 = load i32* %signed_result, align 4
  %cmp13 = icmp ne i32 %rem11, %tmp12
  br i1 %cmp13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.end9
  call void @abort() noreturn nounwind
  unreachable

if.end15:                                         ; preds = %if.end9
  %11 = bitcast %struct.x* %bit to i32*
  %12 = load i32* %11, align 4
  %bf.clear16 = and i32 %12, 127
  %13 = shl i32 %bf.clear16, 25
  %bf.val.sext = ashr i32 %13, 25
  %14 = bitcast %struct.x* %bit to i32*
  %15 = load i32* %14, align 4
  %16 = lshr i32 %15, 7
  %bf.clear17 = and i32 %16, 127
  %rem18 = srem i32 %bf.val.sext, %bf.clear17
  %tmp19 = load i32* %signed_result, align 4
  %cmp20 = icmp ne i32 %rem18, %tmp19
  br i1 %cmp20, label %if.then21, label %if.end22

if.then21:                                        ; preds = %if.end15
  call void @abort() noreturn nounwind
  unreachable

if.end22:                                         ; preds = %if.end15
  %tmp23 = load i32* %i, align 4
  %17 = bitcast %struct.x* %bit to i32*
  %18 = load i32* %17, align 4
  %19 = lshr i32 %18, 7
  %bf.clear24 = and i32 %19, 127
  %rem25 = urem i32 %tmp23, %bf.clear24
  %tmp26 = load i32* %unsigned_result, align 4
  %cmp27 = icmp ne i32 %rem25, %tmp26
  br i1 %cmp27, label %if.then28, label %if.end29

if.then28:                                        ; preds = %if.end22
  call void @abort() noreturn nounwind
  unreachable

if.end29:                                         ; preds = %if.end22
  %20 = bitcast %struct.x* %bit to i32*
  %21 = load i32* %20, align 4
  %bf.clear30 = and i32 %21, 127
  %22 = shl i32 %bf.clear30, 25
  %bf.val.sext31 = ashr i32 %22, 25
  %23 = bitcast %struct.x* %bit to i32*
  %24 = load i32* %23, align 4
  %25 = lshr i32 %24, 7
  %bf.clear32 = and i32 %25, 127
  %rem33 = urem i32 %bf.val.sext31, %bf.clear32
  %tmp34 = load i32* %unsigned_result, align 4
  %cmp35 = icmp ne i32 %rem33, %tmp34
  br i1 %cmp35, label %if.then36, label %if.end37

if.then36:                                        ; preds = %if.end29
  call void @abort() noreturn nounwind
  unreachable

if.end37:                                         ; preds = %if.end29
  ret i32 0
}

declare void @abort() noreturn nounwind
