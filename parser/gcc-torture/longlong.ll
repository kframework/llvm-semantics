; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/longlong.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@b = common global [32 x i64] zeroinitializer, align 16
@r = global i64* getelementptr inbounds ([32 x i64]* @b, i32 0, i32 0), align 8
@pars = common global i64 0, align 8

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

define void @alpha_ep_extbl_i_eq_0() nounwind uwtable {
entry:
  %rb = alloca i32, align 4
  %ra = alloca i32, align 4
  %rc = alloca i32, align 4
  %temp = alloca i64, align 8
  %tmp = load i64* @pars, align 8
  %shr = lshr i64 %tmp, 27
  %and = and i64 %shr, 31
  %conv = trunc i64 %and to i32
  store i32 %conv, i32* %rb, align 4
  %tmp1 = load i64* @pars, align 8
  %conv2 = trunc i64 %tmp1 to i32
  %shr3 = lshr i32 %conv2, 5
  %conv4 = zext i32 %shr3 to i64
  %and5 = and i64 %conv4, 31
  %conv6 = trunc i64 %and5 to i32
  store i32 %conv6, i32* %ra, align 4
  %tmp7 = load i64* @pars, align 8
  %conv8 = trunc i64 %tmp7 to i32
  %shr9 = lshr i32 %conv8, 0
  %conv10 = zext i32 %shr9 to i64
  %and11 = and i64 %conv10, 31
  %conv12 = trunc i64 %and11 to i32
  store i32 %conv12, i32* %rc, align 4
  %tmp14 = load i32* %ra, align 4
  %idxprom = zext i32 %tmp14 to i64
  %tmp15 = load i64** @r, align 8
  %arrayidx = getelementptr inbounds i64* %tmp15, i64 %idxprom
  %tmp16 = load i64* %arrayidx
  %tmp17 = load i32* %rb, align 4
  %idxprom18 = zext i32 %tmp17 to i64
  %tmp19 = load i64** @r, align 8
  %arrayidx20 = getelementptr inbounds i64* %tmp19, i64 %idxprom18
  %tmp21 = load i64* %arrayidx20
  %and22 = and i64 %tmp21, 7
  %shl = shl i64 %and22, 3
  %shr23 = lshr i64 %tmp16, %shl
  %and24 = and i64 %shr23, 255
  store i64 %and24, i64* %temp, align 8
  %tmp25 = load i32* %rc, align 4
  %cmp = icmp ne i32 %tmp25, 31
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %tmp27 = load i64* %temp, align 8
  %tmp28 = load i32* %rc, align 4
  %idxprom29 = zext i32 %tmp28 to i64
  %tmp30 = load i64** @r, align 8
  %arrayidx31 = getelementptr inbounds i64* %tmp30, i64 %idxprom29
  store i64 %tmp27, i64* %arrayidx31
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i64 3160194, i64* getelementptr inbounds ([32 x i64]* @b, i32 0, i64 17), align 8
  store i64 6003104017374052362, i64* getelementptr inbounds ([32 x i64]* @b, i32 0, i64 2), align 8
  store i64 2281701442, i64* @pars, align 8
  call void @alpha_ep_extbl_i_eq_0()
  %tmp = load i64* getelementptr inbounds ([32 x i64]* @b, i32 0, i64 2), align 8
  %cmp = icmp ne i64 %tmp, 77
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
