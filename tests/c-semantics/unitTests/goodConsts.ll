; ModuleID = './goodConsts.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@main.a = internal constant [2 x i32] [i32 7, i32 1], align 4
@.str = private unnamed_addr constant [16 x i8] c"/tmp/fileXXXXXX\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %w = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %2 = alloca [7 x float], align 4
  %3 = alloca [16 x i8], align 1
  %p = alloca i32*, align 8
  %q = alloca i32*, align 8
  %r = alloca i32*, align 8
  store i32 0, i32* %1
  store i32 3, i32* %w, align 4
  store i32 5, i32* %x, align 4
  store i32 6, i32* %y, align 4
  %4 = getelementptr inbounds [7 x float]* %2, i64 0, i64 0
  store float 1.000000e+00, float* %4
  %5 = getelementptr inbounds float* %4, i64 1
  store float 1.000000e+01, float* %5
  %6 = getelementptr inbounds float* %5, i64 1
  store float 1.000000e+02, float* %6
  %7 = getelementptr inbounds float* %6, i64 1
  store float 1.000000e+03, float* %7
  %8 = getelementptr inbounds float* %7, i64 1
  store float 1.000000e+04, float* %8
  %9 = getelementptr inbounds float* %8, i64 1
  store float 1.000000e+05, float* %9
  %10 = getelementptr inbounds float* %9, i64 1
  store float 1.000000e+06, float* %10
  %11 = getelementptr inbounds [7 x float]* %2, i32 0, i64 3
  %12 = load float* %11, align 4
  %13 = bitcast [16 x i8]* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i64 16, i32 1, i1 false)
  %14 = getelementptr inbounds [16 x i8]* %3, i32 0, i32 0
  store i32* %x, i32** %p, align 8
  store i32* %y, i32** %p, align 8
  store i32* %w, i32** %q, align 8
  %15 = load i32** %q, align 8
  store i32 8, i32* %15, align 4
  store i32* getelementptr inbounds ([2 x i32]* @main.a, i32 0, i64 0), i32** %r, align 8
  %16 = load i32* getelementptr inbounds ([2 x i32]* @main.a, i32 0, i64 1), align 4
  %17 = add nsw i32 11, %16
  %18 = load i32** %p, align 8
  %19 = load i32* %18, align 4
  %20 = add nsw i32 %17, %19
  %21 = load i32** %q, align 8
  %22 = load i32* %21, align 4
  %23 = add nsw i32 %20, %22
  %24 = load i32** %r, align 8
  %25 = load i32* %24, align 4
  %26 = add nsw i32 %23, %25
  ret i32 %26
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
