; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/930718-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.rtx_def = type { i8, [3 x i8] }

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

define void @f2() nounwind uwtable {
entry:
  call void @abort() noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %foo = alloca %struct.rtx_def, align 4
  %bar = alloca %struct.rtx_def*, align 8
  store i32 0, i32* %retval
  %0 = bitcast %struct.rtx_def* %foo to i32*
  %1 = load i32* %0, align 4
  %2 = and i32 %1, -2
  %3 = or i32 %2, 1
  store i32 %3, i32* %0, align 4
  %4 = bitcast %struct.rtx_def* %foo to i32*
  %5 = load i32* %4, align 4
  %6 = and i32 %5, -3
  store i32 %6, i32* %4, align 4
  %call = call %struct.rtx_def* (...)* bitcast (%struct.rtx_def* (%struct.rtx_def*)* @f to %struct.rtx_def* (...)*)(%struct.rtx_def* %foo)
  store %struct.rtx_def* %call, %struct.rtx_def** %bar, align 8
  %tmp = load %struct.rtx_def** %bar, align 8
  %cmp = icmp ne %struct.rtx_def* %tmp, %foo
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load %struct.rtx_def** %bar, align 8
  %7 = bitcast %struct.rtx_def* %tmp1 to i32*
  %8 = load i32* %7, align 4
  %9 = lshr i32 %8, 1
  %bf.clear = and i32 %9, 1
  %10 = shl i32 %bf.clear, 31
  %bf.val.sext = ashr i32 %10, 31
  %cmp2 = icmp ne i32 %bf.val.sext, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %11 = load i32* %retval
  ret i32 %11
}

define internal %struct.rtx_def* @f(%struct.rtx_def* %orig) nounwind uwtable {
entry:
  %retval = alloca %struct.rtx_def*, align 8
  %orig.addr = alloca %struct.rtx_def*, align 8
  store %struct.rtx_def* %orig, %struct.rtx_def** %orig.addr, align 8
  %tmp = load %struct.rtx_def** %orig.addr, align 8
  %0 = bitcast %struct.rtx_def* %tmp to i32*
  %1 = load i32* %0, align 4
  %bf.clear = and i32 %1, 1
  %2 = shl i32 %bf.clear, 31
  %bf.val.sext = ashr i32 %2, 31
  %tobool = icmp ne i32 %bf.val.sext, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load %struct.rtx_def** %orig.addr, align 8
  %3 = bitcast %struct.rtx_def* %tmp1 to i32*
  %4 = load i32* %3, align 4
  %5 = lshr i32 %4, 1
  %bf.clear2 = and i32 %5, 1
  %6 = shl i32 %bf.clear2, 31
  %bf.val.sext3 = ashr i32 %6, 31
  %tobool4 = icmp ne i32 %bf.val.sext3, 0
  br i1 %tobool4, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  %tmp5 = load %struct.rtx_def** %orig.addr, align 8
  store %struct.rtx_def* %tmp5, %struct.rtx_def** %retval
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %tmp6 = load %struct.rtx_def** %orig.addr, align 8
  %7 = bitcast %struct.rtx_def* %tmp6 to i32*
  %8 = load i32* %7, align 4
  %9 = and i32 %8, -3
  %10 = or i32 %9, 2
  store i32 %10, i32* %7, align 4
  %tmp7 = load %struct.rtx_def** %orig.addr, align 8
  store %struct.rtx_def* %tmp7, %struct.rtx_def** %retval
  br label %return

return:                                           ; preds = %if.end, %if.then
  %11 = load %struct.rtx_def** %retval
  ret %struct.rtx_def* %11
}

declare void @exit(i32) noreturn nounwind
