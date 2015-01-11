; ModuleID = './trial-division.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@primes = common global i16* null, align 8
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str1 = private unnamed_addr constant [8 x i8] c"------\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @trial_division_sqrt(i32 %n) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %sqrt_n = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %n, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = uitofp i32 %3 to double
  %5 = call double @sqrt(double %4) #3
  %6 = fptoui double %5 to i32
  store i32 %6, i32* %sqrt_n, align 4
  store i32 2, i32* %x, align 4
  br label %7

; <label>:7                                       ; preds = %19, %0
  %8 = load i32* %x, align 4
  %9 = load i32* %sqrt_n, align 4
  %10 = icmp ule i32 %8, %9
  br i1 %10, label %11, label %22

; <label>:11                                      ; preds = %7
  %12 = load i32* %2, align 4
  %13 = load i32* %x, align 4
  %14 = urem i32 %12, %13
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %18

; <label>:16                                      ; preds = %11
  %17 = load i32* %x, align 4
  store i32 %17, i32* %1
  br label %23

; <label>:18                                      ; preds = %11
  br label %19

; <label>:19                                      ; preds = %18
  %20 = load i32* %x, align 4
  %21 = add i32 %20, 1
  store i32 %21, i32* %x, align 4
  br label %7

; <label>:22                                      ; preds = %7
  store i32 0, i32* %1
  br label %23

; <label>:23                                      ; preds = %22, %16
  %24 = load i32* %1
  ret i32 %24
}

; Function Attrs: nounwind
declare double @sqrt(double) #1

; Function Attrs: nounwind uwtable
define i32 @trial_division_squaring(i32 %n) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %x = alloca i32, align 4
  %x_squared = alloca i32, align 4
  store i32 %n, i32* %2, align 4
  store i32 2, i32* %x, align 4
  store i32 4, i32* %x_squared, align 4
  br label %3

; <label>:3                                       ; preds = %23, %0
  %4 = load i32* %x_squared, align 4
  %5 = load i32* %x, align 4
  %6 = mul i32 2, %5
  %7 = sub i32 %6, 1
  %8 = icmp ugt i32 %4, %7
  br i1 %8, label %9, label %13

; <label>:9                                       ; preds = %3
  %10 = load i32* %x_squared, align 4
  %11 = load i32* %2, align 4
  %12 = icmp ule i32 %10, %11
  br label %13

; <label>:13                                      ; preds = %9, %3
  %14 = phi i1 [ false, %3 ], [ %12, %9 ]
  br i1 %14, label %15, label %31

; <label>:15                                      ; preds = %13
  %16 = load i32* %2, align 4
  %17 = load i32* %x, align 4
  %18 = urem i32 %16, %17
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %22

; <label>:20                                      ; preds = %15
  %21 = load i32* %x, align 4
  store i32 %21, i32* %1
  br label %32

; <label>:22                                      ; preds = %15
  br label %23

; <label>:23                                      ; preds = %22
  %24 = load i32* %x, align 4
  %25 = add i32 %24, 1
  store i32 %25, i32* %x, align 4
  %26 = load i32* %x, align 4
  %27 = mul i32 2, %26
  %28 = sub i32 %27, 1
  %29 = load i32* %x_squared, align 4
  %30 = add i32 %29, %28
  store i32 %30, i32* %x_squared, align 4
  br label %3

; <label>:31                                      ; preds = %13
  store i32 0, i32* %1
  br label %32

; <label>:32                                      ; preds = %31, %20
  %33 = load i32* %1
  ret i32 %33
}

; Function Attrs: nounwind uwtable
define i32 @trial_division_odd(i32 %n) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %sqrt_n = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %n, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = uitofp i32 %3 to double
  %5 = call double @sqrt(double %4) #3
  %6 = fptoui double %5 to i32
  store i32 %6, i32* %sqrt_n, align 4
  %7 = load i32* %2, align 4
  %8 = urem i32 %7, 2
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %0
  store i32 2, i32* %1
  br label %28

; <label>:11                                      ; preds = %0
  store i32 3, i32* %x, align 4
  br label %12

; <label>:12                                      ; preds = %24, %11
  %13 = load i32* %x, align 4
  %14 = load i32* %sqrt_n, align 4
  %15 = icmp ule i32 %13, %14
  br i1 %15, label %16, label %27

; <label>:16                                      ; preds = %12
  %17 = load i32* %2, align 4
  %18 = load i32* %x, align 4
  %19 = urem i32 %17, %18
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %23

; <label>:21                                      ; preds = %16
  %22 = load i32* %x, align 4
  store i32 %22, i32* %1
  br label %28

; <label>:23                                      ; preds = %16
  br label %24

; <label>:24                                      ; preds = %23
  %25 = load i32* %x, align 4
  %26 = add i32 %25, 2
  store i32 %26, i32* %x, align 4
  br label %12

; <label>:27                                      ; preds = %12
  store i32 0, i32* %1
  br label %28

; <label>:28                                      ; preds = %27, %21, %10
  %29 = load i32* %1
  ret i32 %29
}

; Function Attrs: nounwind uwtable
define void @generate_prime_list(i32 %max) #0 {
  %1 = alloca i32, align 4
  %is_not_prime = alloca i8*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %num_primes = alloca i32, align 4
  store i32 %max, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = add nsw i32 %2, 1
  %4 = sext i32 %3 to i64
  %5 = call noalias i8* @calloc(i64 %4, i64 1) #3
  store i8* %5, i8** %is_not_prime, align 8
  store i32 1, i32* %num_primes, align 4
  store i32 2, i32* %i, align 4
  br label %6

; <label>:6                                       ; preds = %38, %0
  %7 = load i32* %i, align 4
  %8 = load i32* %1, align 4
  %9 = icmp sle i32 %7, %8
  br i1 %9, label %10, label %41

; <label>:10                                      ; preds = %6
  %11 = load i32* %i, align 4
  %12 = sext i32 %11 to i64
  %13 = load i8** %is_not_prime, align 8
  %14 = getelementptr inbounds i8* %13, i64 %12
  %15 = load i8* %14, align 1
  %16 = icmp ne i8 %15, 0
  br i1 %16, label %37, label %17

; <label>:17                                      ; preds = %10
  %18 = load i32* %num_primes, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, i32* %num_primes, align 4
  %20 = load i32* %i, align 4
  %21 = load i32* %i, align 4
  %22 = add nsw i32 %20, %21
  store i32 %22, i32* %j, align 4
  br label %23

; <label>:23                                      ; preds = %32, %17
  %24 = load i32* %j, align 4
  %25 = load i32* %1, align 4
  %26 = icmp sle i32 %24, %25
  br i1 %26, label %27, label %36

; <label>:27                                      ; preds = %23
  %28 = load i32* %j, align 4
  %29 = sext i32 %28 to i64
  %30 = load i8** %is_not_prime, align 8
  %31 = getelementptr inbounds i8* %30, i64 %29
  store i8 1, i8* %31, align 1
  br label %32

; <label>:32                                      ; preds = %27
  %33 = load i32* %i, align 4
  %34 = load i32* %j, align 4
  %35 = add nsw i32 %34, %33
  store i32 %35, i32* %j, align 4
  br label %23

; <label>:36                                      ; preds = %23
  br label %37

; <label>:37                                      ; preds = %36, %10
  br label %38

; <label>:38                                      ; preds = %37
  %39 = load i32* %i, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, i32* %i, align 4
  br label %6

; <label>:41                                      ; preds = %6
  %42 = load i32* %num_primes, align 4
  %43 = add nsw i32 %42, 1
  %44 = sext i32 %43 to i64
  %45 = mul i64 2, %44
  %46 = call noalias i8* @malloc(i64 %45) #3
  %47 = bitcast i8* %46 to i16*
  store i16* %47, i16** @primes, align 8
  store i32 0, i32* %j, align 4
  store i32 2, i32* %i, align 4
  br label %48

; <label>:48                                      ; preds = %69, %41
  %49 = load i32* %i, align 4
  %50 = load i32* %1, align 4
  %51 = icmp sle i32 %49, %50
  br i1 %51, label %52, label %72

; <label>:52                                      ; preds = %48
  %53 = load i32* %i, align 4
  %54 = sext i32 %53 to i64
  %55 = load i8** %is_not_prime, align 8
  %56 = getelementptr inbounds i8* %55, i64 %54
  %57 = load i8* %56, align 1
  %58 = icmp ne i8 %57, 0
  br i1 %58, label %68, label %59

; <label>:59                                      ; preds = %52
  %60 = load i32* %i, align 4
  %61 = trunc i32 %60 to i16
  %62 = load i32* %j, align 4
  %63 = sext i32 %62 to i64
  %64 = load i16** @primes, align 8
  %65 = getelementptr inbounds i16* %64, i64 %63
  store i16 %61, i16* %65, align 2
  %66 = load i32* %j, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, i32* %j, align 4
  br label %68

; <label>:68                                      ; preds = %59, %52
  br label %69

; <label>:69                                      ; preds = %68
  %70 = load i32* %i, align 4
  %71 = add nsw i32 %70, 1
  store i32 %71, i32* %i, align 4
  br label %48

; <label>:72                                      ; preds = %48
  %73 = load i32* %j, align 4
  %74 = sext i32 %73 to i64
  %75 = load i16** @primes, align 8
  %76 = getelementptr inbounds i16* %75, i64 %74
  store i16 0, i16* %76, align 2
  %77 = load i8** %is_not_prime, align 8
  call void @free(i8* %77) #3
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define i32 @trial_division_primes(i32 %n) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %sqrt_n = alloca i32, align 4
  %prime = alloca i16*, align 8
  store i32 %n, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = uitofp i32 %3 to double
  %5 = call double @sqrt(double %4) #3
  %6 = fptoui double %5 to i32
  store i32 %6, i32* %sqrt_n, align 4
  %7 = load i16** @primes, align 8
  store i16* %7, i16** %prime, align 8
  br label %8

; <label>:8                                       ; preds = %32, %0
  %9 = load i16** %prime, align 8
  %10 = load i16* %9, align 2
  %11 = zext i16 %10 to i32
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %19

; <label>:13                                      ; preds = %8
  %14 = load i16** %prime, align 8
  %15 = load i16* %14, align 2
  %16 = zext i16 %15 to i32
  %17 = load i32* %sqrt_n, align 4
  %18 = icmp ule i32 %16, %17
  br label %19

; <label>:19                                      ; preds = %13, %8
  %20 = phi i1 [ false, %8 ], [ %18, %13 ]
  br i1 %20, label %21, label %35

; <label>:21                                      ; preds = %19
  %22 = load i32* %2, align 4
  %23 = load i16** %prime, align 8
  %24 = load i16* %23, align 2
  %25 = zext i16 %24 to i32
  %26 = urem i32 %22, %25
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %32

; <label>:28                                      ; preds = %21
  %29 = load i16** %prime, align 8
  %30 = load i16* %29, align 2
  %31 = zext i16 %30 to i32
  store i32 %31, i32* %1
  br label %36

; <label>:32                                      ; preds = %21
  %33 = load i16** %prime, align 8
  %34 = getelementptr inbounds i16* %33, i32 1
  store i16* %34, i16** %prime, align 8
  br label %8

; <label>:35                                      ; preds = %19
  store i32 0, i32* %1
  br label %36

; <label>:36                                      ; preds = %35, %28
  %37 = load i32* %1
  ret i32 %37
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 0, i32* %1
  call void @generate_prime_list(i32 128)
  store i32 241333, i32* %n, align 4
  %2 = load i32* %n, align 4
  %3 = call i32 @trial_division_sqrt(i32 %2)
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %3)
  %5 = load i32* %n, align 4
  %6 = call i32 @trial_division_squaring(i32 %5)
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load i32* %n, align 4
  %9 = call i32 @trial_division_odd(i32 %8)
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %9)
  %11 = load i32* %n, align 4
  %12 = call i32 @trial_division_primes(i32 %11)
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %12)
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0))
  store i32 2144892013, i32* %n, align 4
  %15 = load i32* %n, align 4
  %16 = call i32 @trial_division_sqrt(i32 %15)
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %16)
  %18 = load i32* %n, align 4
  %19 = call i32 @trial_division_squaring(i32 %18)
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %19)
  %21 = load i32* %n, align 4
  %22 = call i32 @trial_division_odd(i32 %21)
  %23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %22)
  %24 = load i32* %n, align 4
  %25 = call i32 @trial_division_primes(i32 %24)
  %26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %25)
  ret i32 0
}

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
