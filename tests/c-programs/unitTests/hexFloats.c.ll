; ModuleID = './hexFloats.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x1 = alloca x86_fp80, align 16
  %x2 = alloca x86_fp80, align 16
  %x3 = alloca x86_fp80, align 16
  %x4 = alloca x86_fp80, align 16
  %x5 = alloca x86_fp80, align 16
  %x6 = alloca x86_fp80, align 16
  %x7 = alloca x86_fp80, align 16
  %x8 = alloca x86_fp80, align 16
  store i32 0, i32* %1
  store x86_fp80 0xK40098055E6891A000000, x86_fp80* %x1, align 16
  store x86_fp80 0xK40098000000000000000, x86_fp80* %x2, align 16
  store x86_fp80 0xK400AFF80000000000000, x86_fp80* %x3, align 16
  store x86_fp80 0xK400EABCABD0000000000, x86_fp80* %x4, align 16
  store x86_fp80 0xK40098000000000000000, x86_fp80* %x5, align 16
  store x86_fp80 0xK4008D5E6891A00000000, x86_fp80* %x6, align 16
  store x86_fp80 0xK4009ABCD123400000000, x86_fp80* %x7, align 16
  store x86_fp80 0xK3FFC8800000000000000, x86_fp80* %x8, align 16
  %2 = load x86_fp80, x86_fp80* %x1, align 16
  %3 = fmul x86_fp80 0xK4005C800000000000000, %2
  %4 = fptosi x86_fp80 %3 to i32
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %4)
  %6 = load x86_fp80, x86_fp80* %x2, align 16
  %7 = fmul x86_fp80 0xK4005C800000000000000, %6
  %8 = fptosi x86_fp80 %7 to i32
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %8)
  %10 = load x86_fp80, x86_fp80* %x3, align 16
  %11 = fmul x86_fp80 0xK4005C800000000000000, %10
  %12 = fptosi x86_fp80 %11 to i32
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %12)
  %14 = load x86_fp80, x86_fp80* %x4, align 16
  %15 = fmul x86_fp80 0xK4005C800000000000000, %14
  %16 = fptosi x86_fp80 %15 to i32
  %17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %16)
  %18 = load x86_fp80, x86_fp80* %x5, align 16
  %19 = fmul x86_fp80 0xK4005C800000000000000, %18
  %20 = fptosi x86_fp80 %19 to i32
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %20)
  %22 = load x86_fp80, x86_fp80* %x6, align 16
  %23 = fmul x86_fp80 0xK4005C800000000000000, %22
  %24 = fptosi x86_fp80 %23 to i32
  %25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %24)
  %26 = load x86_fp80, x86_fp80* %x7, align 16
  %27 = fmul x86_fp80 0xK4005C800000000000000, %26
  %28 = fptosi x86_fp80 %27 to i32
  %29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %28)
  %30 = load x86_fp80, x86_fp80* %x8, align 16
  %31 = fmul x86_fp80 0xK4005C800000000000000, %30
  %32 = fptosi x86_fp80 %31 to i32
  %33 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %32)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
