; ModuleID = '/home/david/src/c-semantics/tests/unitTests/hexFloats.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x1 = alloca x86_fp80, align 16
  %x2 = alloca x86_fp80, align 16
  %x3 = alloca x86_fp80, align 16
  %x4 = alloca x86_fp80, align 16
  %x5 = alloca x86_fp80, align 16
  %x6 = alloca x86_fp80, align 16
  %x7 = alloca x86_fp80, align 16
  %x8 = alloca x86_fp80, align 16
  store i32 0, i32* %retval
  store x86_fp80 0xK40098055E6891A000000, x86_fp80* %x1, align 16
  store x86_fp80 0xK40098000000000000000, x86_fp80* %x2, align 16
  store x86_fp80 0xK400AFF80000000000000, x86_fp80* %x3, align 16
  store x86_fp80 0xK400EABCABD0000000000, x86_fp80* %x4, align 16
  store x86_fp80 0xK40098000000000000000, x86_fp80* %x5, align 16
  store x86_fp80 0xK4008D5E6891A00000000, x86_fp80* %x6, align 16
  store x86_fp80 0xK4009ABCD123400000000, x86_fp80* %x7, align 16
  store x86_fp80 0xK3FFC8800000000000000, x86_fp80* %x8, align 16
  %0 = load x86_fp80* %x1, align 16
  %mul = fmul x86_fp80 0xK4005C800000000000000, %0
  %conv = fptosi x86_fp80 %mul to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %1 = load x86_fp80* %x2, align 16
  %mul1 = fmul x86_fp80 0xK4005C800000000000000, %1
  %conv2 = fptosi x86_fp80 %mul1 to i32
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %conv2)
  %2 = load x86_fp80* %x3, align 16
  %mul4 = fmul x86_fp80 0xK4005C800000000000000, %2
  %conv5 = fptosi x86_fp80 %mul4 to i32
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %conv5)
  %3 = load x86_fp80* %x4, align 16
  %mul7 = fmul x86_fp80 0xK4005C800000000000000, %3
  %conv8 = fptosi x86_fp80 %mul7 to i32
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %conv8)
  %4 = load x86_fp80* %x5, align 16
  %mul10 = fmul x86_fp80 0xK4005C800000000000000, %4
  %conv11 = fptosi x86_fp80 %mul10 to i32
  %call12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %conv11)
  %5 = load x86_fp80* %x6, align 16
  %mul13 = fmul x86_fp80 0xK4005C800000000000000, %5
  %conv14 = fptosi x86_fp80 %mul13 to i32
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %conv14)
  %6 = load x86_fp80* %x7, align 16
  %mul16 = fmul x86_fp80 0xK4005C800000000000000, %6
  %conv17 = fptosi x86_fp80 %mul16 to i32
  %call18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %conv17)
  %7 = load x86_fp80* %x8, align 16
  %mul19 = fmul x86_fp80 0xK4005C800000000000000, %7
  %conv20 = fptosi x86_fp80 %mul19 to i32
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %conv20)
  ret i32 0
}

declare i32 @printf(i8*, ...)
