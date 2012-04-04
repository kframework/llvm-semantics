; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/hexFloats.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
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
  %tmp = load x86_fp80* %x1, align 16
  %mul = fmul x86_fp80 0xK4005C800000000000000, %tmp
  %conv = fptosi x86_fp80 %mul to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %tmp1 = load x86_fp80* %x2, align 16
  %mul2 = fmul x86_fp80 0xK4005C800000000000000, %tmp1
  %conv3 = fptosi x86_fp80 %mul2 to i32
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %conv3)
  %tmp5 = load x86_fp80* %x3, align 16
  %mul6 = fmul x86_fp80 0xK4005C800000000000000, %tmp5
  %conv7 = fptosi x86_fp80 %mul6 to i32
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %conv7)
  %tmp9 = load x86_fp80* %x4, align 16
  %mul10 = fmul x86_fp80 0xK4005C800000000000000, %tmp9
  %conv11 = fptosi x86_fp80 %mul10 to i32
  %call12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %conv11)
  %tmp13 = load x86_fp80* %x5, align 16
  %mul14 = fmul x86_fp80 0xK4005C800000000000000, %tmp13
  %conv15 = fptosi x86_fp80 %mul14 to i32
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %conv15)
  %tmp17 = load x86_fp80* %x6, align 16
  %mul18 = fmul x86_fp80 0xK4005C800000000000000, %tmp17
  %conv19 = fptosi x86_fp80 %mul18 to i32
  %call20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %conv19)
  %tmp21 = load x86_fp80* %x7, align 16
  %mul22 = fmul x86_fp80 0xK4005C800000000000000, %tmp21
  %conv23 = fptosi x86_fp80 %mul22 to i32
  %call24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %conv23)
  %tmp25 = load x86_fp80* %x8, align 16
  %mul26 = fmul x86_fp80 0xK4005C800000000000000, %tmp25
  %conv27 = fptosi x86_fp80 %mul26 to i32
  %call28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %conv27)
  ret i32 0
}

declare i32 @printf(i8*, ...)
