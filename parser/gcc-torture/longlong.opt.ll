; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/longlong.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@b = common global [32 x i64] zeroinitializer, align 16
@r = global i64* getelementptr inbounds ([32 x i64]* @b, i64 0, i64 0), align 8
@pars = common global i64 0, align 8

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %shr = lshr i64 %__dev, 8
  %and = and i64 %shr, 4095
  %shr2 = lshr i64 %__dev, 32
  %and3 = and i64 %shr2, 4294963200
  %or = or i64 %and, %and3
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %and = and i64 %__dev, 255
  %shr = lshr i64 %__dev, 12
  %and2 = and i64 %shr, 4294967040
  %or = or i64 %and2, %and
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable readnone inlinehint {
entry:
  %and = and i32 %__minor, 255
  %and2 = shl i32 %__major, 8
  %shl = and i32 %and2, 1048320
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %and4 = and i32 %__minor, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl nuw nsw i64 %conv5, 12
  %and9 = and i32 %__major, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl nuw i64 %conv10, 32
  %or7 = or i64 %shl6, %shl11
  %or12 = or i64 %or7, %conv
  ret i64 %or12
}

define void @alpha_ep_extbl_i_eq_0() nounwind uwtable {
entry:
  %tmp = load i64* @pars, align 8
  %tmp7.tr = trunc i64 %tmp to i32
  %conv12 = and i32 %tmp7.tr, 31
  %tmp15 = load i64** @r, align 8
  %cmp = icmp eq i32 %conv12, 31
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %shr = lshr i64 %tmp, 27
  %conv = and i64 %shr, 31
  %arrayidx20 = getelementptr inbounds i64* %tmp15, i64 %conv
  %shr3 = lshr i64 %tmp, 5
  %tmp21 = load i64* %arrayidx20, align 8
  %conv6 = and i64 %shr3, 31
  %and22 = shl i64 %tmp21, 3
  %arrayidx = getelementptr inbounds i64* %tmp15, i64 %conv6
  %shl = and i64 %and22, 56
  %tmp16 = load i64* %arrayidx, align 8
  %shr23 = lshr i64 %tmp16, %shl
  %and24 = and i64 %shr23, 255
  %idxprom29 = zext i32 %conv12 to i64
  %arrayidx31 = getelementptr inbounds i64* %tmp15, i64 %idxprom29
  store i64 %and24, i64* %arrayidx31, align 8
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  ret void
}

define i32 @main() noreturn nounwind uwtable {
alpha_ep_extbl_i_eq_0.exit:
  store i64 3160194, i64* getelementptr inbounds ([32 x i64]* @b, i64 0, i64 17), align 8
  store i64 6003104017374052362, i64* getelementptr inbounds ([32 x i64]* @b, i64 0, i64 2), align 16
  store i64 2281701442, i64* @pars, align 8
  %tmp15.i = load i64** @r, align 8
  %arrayidx20.i = getelementptr inbounds i64* %tmp15.i, i64 17
  %tmp21.i = load i64* %arrayidx20.i, align 8
  %and22.i = shl i64 %tmp21.i, 3
  %arrayidx.i = getelementptr inbounds i64* %tmp15.i, i64 2
  %shl.i = and i64 %and22.i, 56
  %tmp16.i = load i64* %arrayidx.i, align 8
  %shr23.i = lshr i64 %tmp16.i, %shl.i
  %and24.i = and i64 %shr23.i, 255
  store i64 %and24.i, i64* %arrayidx.i, align 8
  %tmp = load i64* getelementptr inbounds ([32 x i64]* @b, i64 0, i64 2), align 16
  %cmp = icmp eq i64 %tmp, 77
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %alpha_ep_extbl_i_eq_0.exit
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %alpha_ep_extbl_i_eq_0.exit
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
