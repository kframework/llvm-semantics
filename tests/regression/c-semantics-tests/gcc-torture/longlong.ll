; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/longlong.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@b = common global [32 x i64] zeroinitializer, align 16
@r = global i64* getelementptr inbounds ([32 x i64]* @b, i32 0, i32 0), align 8
@pars = common global i64 0, align 8

define void @alpha_ep_extbl_i_eq_0() nounwind uwtable {
entry:
  %rb = alloca i32, align 4
  %ra = alloca i32, align 4
  %rc = alloca i32, align 4
  %temp = alloca i64, align 8
  %0 = load i64* @pars, align 8
  %shr = lshr i64 %0, 27
  %and = and i64 %shr, 31
  %conv = trunc i64 %and to i32
  store i32 %conv, i32* %rb, align 4
  %1 = load i64* @pars, align 8
  %conv1 = trunc i64 %1 to i32
  %shr2 = lshr i32 %conv1, 5
  %conv3 = zext i32 %shr2 to i64
  %and4 = and i64 %conv3, 31
  %conv5 = trunc i64 %and4 to i32
  store i32 %conv5, i32* %ra, align 4
  %2 = load i64* @pars, align 8
  %conv6 = trunc i64 %2 to i32
  %shr7 = lshr i32 %conv6, 0
  %conv8 = zext i32 %shr7 to i64
  %and9 = and i64 %conv8, 31
  %conv10 = trunc i64 %and9 to i32
  store i32 %conv10, i32* %rc, align 4
  %3 = load i32* %ra, align 4
  %idxprom = zext i32 %3 to i64
  %4 = load i64** @r, align 8
  %arrayidx = getelementptr inbounds i64* %4, i64 %idxprom
  %5 = load i64* %arrayidx, align 8
  %6 = load i32* %rb, align 4
  %idxprom11 = zext i32 %6 to i64
  %7 = load i64** @r, align 8
  %arrayidx12 = getelementptr inbounds i64* %7, i64 %idxprom11
  %8 = load i64* %arrayidx12, align 8
  %and13 = and i64 %8, 7
  %shl = shl i64 %and13, 3
  %shr14 = lshr i64 %5, %shl
  %and15 = and i64 %shr14, 255
  store i64 %and15, i64* %temp, align 8
  %9 = load i32* %rc, align 4
  %cmp = icmp ne i32 %9, 31
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %10 = load i64* %temp, align 8
  %11 = load i32* %rc, align 4
  %idxprom17 = zext i32 %11 to i64
  %12 = load i64** @r, align 8
  %arrayidx18 = getelementptr inbounds i64* %12, i64 %idxprom17
  store i64 %10, i64* %arrayidx18, align 8
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
  %0 = load i64* getelementptr inbounds ([32 x i64]* @b, i32 0, i64 2), align 8
  %cmp = icmp ne i64 %0, 77
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %1 = load i32* %retval
  ret i32 %1
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
