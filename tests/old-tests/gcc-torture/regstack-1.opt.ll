; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/regstack-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@C = global x86_fp80 0xK4001A000000000000000, align 16
@U = global x86_fp80 0xK3FFF8000000000000000, align 16
@Y2 = global x86_fp80 0xK4002B000000000000000, align 16
@Y1 = global x86_fp80 0xK40038800000000000000, align 16
@X = common global x86_fp80 0xK00000000000000000000, align 16
@Y = common global x86_fp80 0xK00000000000000000000, align 16
@Z = common global x86_fp80 0xK00000000000000000000, align 16
@T = common global x86_fp80 0xK00000000000000000000, align 16
@R = common global x86_fp80 0xK00000000000000000000, align 16
@S = common global x86_fp80 0xK00000000000000000000, align 16

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

define i32 @main() noreturn nounwind uwtable {
entry:
  %tmp = load x86_fp80* @C, align 16
  %tmp1 = load x86_fp80* @U, align 16
  %add = fadd x86_fp80 %tmp, %tmp1
  %tmp2 = load x86_fp80* @Y2, align 16
  %mul = fmul x86_fp80 %add, %tmp2
  %sub = fsub x86_fp80 %tmp, %tmp1
  %sub6 = fsub x86_fp80 %sub, %tmp1
  %add11 = fadd x86_fp80 %add, %tmp1
  %tmp15 = load x86_fp80* @Y1, align 16
  %mul16 = fmul x86_fp80 %sub, %tmp15
  %add20 = fadd x86_fp80 %add11, %tmp1
  %sub21 = fsub x86_fp80 %mul, %add20
  store x86_fp80 %sub21, x86_fp80* @X, align 16
  %mul24 = fmul x86_fp80 %sub6, %tmp15
  %mul27 = fmul x86_fp80 %add11, %tmp2
  store x86_fp80 %mul27, x86_fp80* @S, align 16
  %sub30 = fsub x86_fp80 %mul16, %sub6
  store x86_fp80 %sub30, x86_fp80* @T, align 16
  %sub33 = fsub x86_fp80 %tmp1, %sub6
  %add35 = fadd x86_fp80 %sub33, %mul24
  store x86_fp80 %add35, x86_fp80* @Y, align 16
  %add41 = fadd x86_fp80 %add20, %tmp1
  %sub42 = fsub x86_fp80 %mul27, %add41
  store x86_fp80 %sub42, x86_fp80* @Z, align 16
  %add45 = fadd x86_fp80 %tmp2, %tmp1
  %mul47 = fmul x86_fp80 %add45, %tmp15
  %mul50 = fmul x86_fp80 %tmp2, %tmp15
  %sub53 = fsub x86_fp80 %mul47, %tmp2
  store x86_fp80 %sub53, x86_fp80* @R, align 16
  %sub55 = fadd x86_fp80 %mul50, 0xKBFFE8000000000000000
  store x86_fp80 %sub55, x86_fp80* @Y1, align 16
  %cmp = fcmp une x86_fp80 %sub42, 0xK40058800000000000000
  %cmp58 = fcmp une x86_fp80 %add35, 0xK4004C400000000000000
  %or.cond = or i1 %cmp, %cmp58
  %cmp61 = fcmp une x86_fp80 %sub21, 0xK4004E800000000000000
  %or.cond1 = or i1 %or.cond, %cmp61
  %cmp64 = fcmp une x86_fp80 %sub55, 0xK4006BA80000000000000
  %or.cond2 = or i1 %or.cond1, %cmp64
  %cmp67 = fcmp une x86_fp80 %sub53, 0xK4006C100000000000000
  %or.cond3 = or i1 %or.cond2, %cmp67
  %cmp70 = fcmp une x86_fp80 %mul27, 0xK40059A00000000000000
  %or.cond4 = or i1 %or.cond3, %cmp70
  %cmp73 = fcmp une x86_fp80 %sub30, 0xK40058200000000000000
  %or.cond5 = or i1 %or.cond4, %cmp73
  %cmp76 = fcmp une x86_fp80 %tmp2, 0xK4002B000000000000000
  %or.cond6 = or i1 %or.cond5, %cmp76
  br i1 %or.cond6, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
