; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/regstack-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
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

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = load x86_fp80* @C, align 16
  %1 = load x86_fp80* @U, align 16
  %add = fadd x86_fp80 %0, %1
  %2 = load x86_fp80* @Y2, align 16
  %mul = fmul x86_fp80 %add, %2
  store x86_fp80 %mul, x86_fp80* @X, align 16
  %3 = load x86_fp80* @C, align 16
  %4 = load x86_fp80* @U, align 16
  %sub = fsub x86_fp80 %3, %4
  %5 = load x86_fp80* @U, align 16
  %sub1 = fsub x86_fp80 %sub, %5
  store x86_fp80 %sub1, x86_fp80* @Y, align 16
  %6 = load x86_fp80* @C, align 16
  %7 = load x86_fp80* @U, align 16
  %add2 = fadd x86_fp80 %6, %7
  %8 = load x86_fp80* @U, align 16
  %add3 = fadd x86_fp80 %add2, %8
  store x86_fp80 %add3, x86_fp80* @Z, align 16
  %9 = load x86_fp80* @C, align 16
  %10 = load x86_fp80* @U, align 16
  %sub4 = fsub x86_fp80 %9, %10
  %11 = load x86_fp80* @Y1, align 16
  %mul5 = fmul x86_fp80 %sub4, %11
  store x86_fp80 %mul5, x86_fp80* @T, align 16
  %12 = load x86_fp80* @X, align 16
  %13 = load x86_fp80* @Z, align 16
  %14 = load x86_fp80* @U, align 16
  %add6 = fadd x86_fp80 %13, %14
  %sub7 = fsub x86_fp80 %12, %add6
  store x86_fp80 %sub7, x86_fp80* @X, align 16
  %15 = load x86_fp80* @Y, align 16
  %16 = load x86_fp80* @Y1, align 16
  %mul8 = fmul x86_fp80 %15, %16
  store x86_fp80 %mul8, x86_fp80* @R, align 16
  %17 = load x86_fp80* @Z, align 16
  %18 = load x86_fp80* @Y2, align 16
  %mul9 = fmul x86_fp80 %17, %18
  store x86_fp80 %mul9, x86_fp80* @S, align 16
  %19 = load x86_fp80* @T, align 16
  %20 = load x86_fp80* @Y, align 16
  %sub10 = fsub x86_fp80 %19, %20
  store x86_fp80 %sub10, x86_fp80* @T, align 16
  %21 = load x86_fp80* @U, align 16
  %22 = load x86_fp80* @Y, align 16
  %sub11 = fsub x86_fp80 %21, %22
  %23 = load x86_fp80* @R, align 16
  %add12 = fadd x86_fp80 %sub11, %23
  store x86_fp80 %add12, x86_fp80* @Y, align 16
  %24 = load x86_fp80* @S, align 16
  %25 = load x86_fp80* @Z, align 16
  %26 = load x86_fp80* @U, align 16
  %add13 = fadd x86_fp80 %25, %26
  %27 = load x86_fp80* @U, align 16
  %add14 = fadd x86_fp80 %add13, %27
  %sub15 = fsub x86_fp80 %24, %add14
  store x86_fp80 %sub15, x86_fp80* @Z, align 16
  %28 = load x86_fp80* @Y2, align 16
  %29 = load x86_fp80* @U, align 16
  %add16 = fadd x86_fp80 %28, %29
  %30 = load x86_fp80* @Y1, align 16
  %mul17 = fmul x86_fp80 %add16, %30
  store x86_fp80 %mul17, x86_fp80* @R, align 16
  %31 = load x86_fp80* @Y2, align 16
  %32 = load x86_fp80* @Y1, align 16
  %mul18 = fmul x86_fp80 %31, %32
  store x86_fp80 %mul18, x86_fp80* @Y1, align 16
  %33 = load x86_fp80* @R, align 16
  %34 = load x86_fp80* @Y2, align 16
  %sub19 = fsub x86_fp80 %33, %34
  store x86_fp80 %sub19, x86_fp80* @R, align 16
  %35 = load x86_fp80* @Y1, align 16
  %sub20 = fsub x86_fp80 %35, 0xK3FFE8000000000000000
  store x86_fp80 %sub20, x86_fp80* @Y1, align 16
  %36 = load x86_fp80* @Z, align 16
  %cmp = fcmp une x86_fp80 %36, 0xK40058800000000000000
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %37 = load x86_fp80* @Y, align 16
  %cmp21 = fcmp une x86_fp80 %37, 0xK4004C400000000000000
  br i1 %cmp21, label %if.then, label %lor.lhs.false22

lor.lhs.false22:                                  ; preds = %lor.lhs.false
  %38 = load x86_fp80* @X, align 16
  %cmp23 = fcmp une x86_fp80 %38, 0xK4004E800000000000000
  br i1 %cmp23, label %if.then, label %lor.lhs.false24

lor.lhs.false24:                                  ; preds = %lor.lhs.false22
  %39 = load x86_fp80* @Y1, align 16
  %cmp25 = fcmp une x86_fp80 %39, 0xK4006BA80000000000000
  br i1 %cmp25, label %if.then, label %lor.lhs.false26

lor.lhs.false26:                                  ; preds = %lor.lhs.false24
  %40 = load x86_fp80* @R, align 16
  %cmp27 = fcmp une x86_fp80 %40, 0xK4006C100000000000000
  br i1 %cmp27, label %if.then, label %lor.lhs.false28

lor.lhs.false28:                                  ; preds = %lor.lhs.false26
  %41 = load x86_fp80* @S, align 16
  %cmp29 = fcmp une x86_fp80 %41, 0xK40059A00000000000000
  br i1 %cmp29, label %if.then, label %lor.lhs.false30

lor.lhs.false30:                                  ; preds = %lor.lhs.false28
  %42 = load x86_fp80* @T, align 16
  %cmp31 = fcmp une x86_fp80 %42, 0xK40058200000000000000
  br i1 %cmp31, label %if.then, label %lor.lhs.false32

lor.lhs.false32:                                  ; preds = %lor.lhs.false30
  %43 = load x86_fp80* @Y2, align 16
  %cmp33 = fcmp une x86_fp80 %43, 0xK4002B000000000000000
  br i1 %cmp33, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false32, %lor.lhs.false30, %lor.lhs.false28, %lor.lhs.false26, %lor.lhs.false24, %lor.lhs.false22, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false32
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %44 = load i32* %retval
  ret i32 %44
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
