; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/regstack-1.c'
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

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %tmp = load x86_fp80* @C, align 16
  %tmp1 = load x86_fp80* @U, align 16
  %add = fadd x86_fp80 %tmp, %tmp1
  %tmp2 = load x86_fp80* @Y2, align 16
  %mul = fmul x86_fp80 %add, %tmp2
  store x86_fp80 %mul, x86_fp80* @X, align 16
  %tmp3 = load x86_fp80* @C, align 16
  %tmp4 = load x86_fp80* @U, align 16
  %sub = fsub x86_fp80 %tmp3, %tmp4
  %tmp5 = load x86_fp80* @U, align 16
  %sub6 = fsub x86_fp80 %sub, %tmp5
  store x86_fp80 %sub6, x86_fp80* @Y, align 16
  %tmp7 = load x86_fp80* @C, align 16
  %tmp8 = load x86_fp80* @U, align 16
  %add9 = fadd x86_fp80 %tmp7, %tmp8
  %tmp10 = load x86_fp80* @U, align 16
  %add11 = fadd x86_fp80 %add9, %tmp10
  store x86_fp80 %add11, x86_fp80* @Z, align 16
  %tmp12 = load x86_fp80* @C, align 16
  %tmp13 = load x86_fp80* @U, align 16
  %sub14 = fsub x86_fp80 %tmp12, %tmp13
  %tmp15 = load x86_fp80* @Y1, align 16
  %mul16 = fmul x86_fp80 %sub14, %tmp15
  store x86_fp80 %mul16, x86_fp80* @T, align 16
  %tmp17 = load x86_fp80* @X, align 16
  %tmp18 = load x86_fp80* @Z, align 16
  %tmp19 = load x86_fp80* @U, align 16
  %add20 = fadd x86_fp80 %tmp18, %tmp19
  %sub21 = fsub x86_fp80 %tmp17, %add20
  store x86_fp80 %sub21, x86_fp80* @X, align 16
  %tmp22 = load x86_fp80* @Y, align 16
  %tmp23 = load x86_fp80* @Y1, align 16
  %mul24 = fmul x86_fp80 %tmp22, %tmp23
  store x86_fp80 %mul24, x86_fp80* @R, align 16
  %tmp25 = load x86_fp80* @Z, align 16
  %tmp26 = load x86_fp80* @Y2, align 16
  %mul27 = fmul x86_fp80 %tmp25, %tmp26
  store x86_fp80 %mul27, x86_fp80* @S, align 16
  %tmp28 = load x86_fp80* @T, align 16
  %tmp29 = load x86_fp80* @Y, align 16
  %sub30 = fsub x86_fp80 %tmp28, %tmp29
  store x86_fp80 %sub30, x86_fp80* @T, align 16
  %tmp31 = load x86_fp80* @U, align 16
  %tmp32 = load x86_fp80* @Y, align 16
  %sub33 = fsub x86_fp80 %tmp31, %tmp32
  %tmp34 = load x86_fp80* @R, align 16
  %add35 = fadd x86_fp80 %sub33, %tmp34
  store x86_fp80 %add35, x86_fp80* @Y, align 16
  %tmp36 = load x86_fp80* @S, align 16
  %tmp37 = load x86_fp80* @Z, align 16
  %tmp38 = load x86_fp80* @U, align 16
  %add39 = fadd x86_fp80 %tmp37, %tmp38
  %tmp40 = load x86_fp80* @U, align 16
  %add41 = fadd x86_fp80 %add39, %tmp40
  %sub42 = fsub x86_fp80 %tmp36, %add41
  store x86_fp80 %sub42, x86_fp80* @Z, align 16
  %tmp43 = load x86_fp80* @Y2, align 16
  %tmp44 = load x86_fp80* @U, align 16
  %add45 = fadd x86_fp80 %tmp43, %tmp44
  %tmp46 = load x86_fp80* @Y1, align 16
  %mul47 = fmul x86_fp80 %add45, %tmp46
  store x86_fp80 %mul47, x86_fp80* @R, align 16
  %tmp48 = load x86_fp80* @Y2, align 16
  %tmp49 = load x86_fp80* @Y1, align 16
  %mul50 = fmul x86_fp80 %tmp48, %tmp49
  store x86_fp80 %mul50, x86_fp80* @Y1, align 16
  %tmp51 = load x86_fp80* @R, align 16
  %tmp52 = load x86_fp80* @Y2, align 16
  %sub53 = fsub x86_fp80 %tmp51, %tmp52
  store x86_fp80 %sub53, x86_fp80* @R, align 16
  %tmp54 = load x86_fp80* @Y1, align 16
  %sub55 = fsub x86_fp80 %tmp54, 0xK3FFE8000000000000000
  store x86_fp80 %sub55, x86_fp80* @Y1, align 16
  %tmp56 = load x86_fp80* @Z, align 16
  %cmp = fcmp une x86_fp80 %tmp56, 0xK40058800000000000000
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp57 = load x86_fp80* @Y, align 16
  %cmp58 = fcmp une x86_fp80 %tmp57, 0xK4004C400000000000000
  br i1 %cmp58, label %if.then, label %lor.lhs.false59

lor.lhs.false59:                                  ; preds = %lor.lhs.false
  %tmp60 = load x86_fp80* @X, align 16
  %cmp61 = fcmp une x86_fp80 %tmp60, 0xK4004E800000000000000
  br i1 %cmp61, label %if.then, label %lor.lhs.false62

lor.lhs.false62:                                  ; preds = %lor.lhs.false59
  %tmp63 = load x86_fp80* @Y1, align 16
  %cmp64 = fcmp une x86_fp80 %tmp63, 0xK4006BA80000000000000
  br i1 %cmp64, label %if.then, label %lor.lhs.false65

lor.lhs.false65:                                  ; preds = %lor.lhs.false62
  %tmp66 = load x86_fp80* @R, align 16
  %cmp67 = fcmp une x86_fp80 %tmp66, 0xK4006C100000000000000
  br i1 %cmp67, label %if.then, label %lor.lhs.false68

lor.lhs.false68:                                  ; preds = %lor.lhs.false65
  %tmp69 = load x86_fp80* @S, align 16
  %cmp70 = fcmp une x86_fp80 %tmp69, 0xK40059A00000000000000
  br i1 %cmp70, label %if.then, label %lor.lhs.false71

lor.lhs.false71:                                  ; preds = %lor.lhs.false68
  %tmp72 = load x86_fp80* @T, align 16
  %cmp73 = fcmp une x86_fp80 %tmp72, 0xK40058200000000000000
  br i1 %cmp73, label %if.then, label %lor.lhs.false74

lor.lhs.false74:                                  ; preds = %lor.lhs.false71
  %tmp75 = load x86_fp80* @Y2, align 16
  %cmp76 = fcmp une x86_fp80 %tmp75, 0xK4002B000000000000000
  br i1 %cmp76, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false74, %lor.lhs.false71, %lor.lhs.false68, %lor.lhs.false65, %lor.lhs.false62, %lor.lhs.false59, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false74
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
