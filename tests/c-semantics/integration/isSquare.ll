; ModuleID = './isSquare.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"5: %d\0A\00", align 1
@.str1 = private unnamed_addr constant [7 x i8] c"8: %d\0A\00", align 1
@.str2 = private unnamed_addr constant [8 x i8] c"16: %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @PerfectSquare(i32 %n) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %h = alloca i32, align 4
  %t = alloca i32, align 4
  store i32 %n, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = and i32 %3, 15
  store i32 %4, i32* %h, align 4
  %5 = load i32* %h, align 4
  %6 = icmp sgt i32 %5, 9
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  store i32 0, i32* %1
  br label %40

; <label>:8                                       ; preds = %0
  %9 = load i32* %h, align 4
  %10 = icmp ne i32 %9, 2
  br i1 %10, label %11, label %39

; <label>:11                                      ; preds = %8
  %12 = load i32* %h, align 4
  %13 = icmp ne i32 %12, 3
  br i1 %13, label %14, label %39

; <label>:14                                      ; preds = %11
  %15 = load i32* %h, align 4
  %16 = icmp ne i32 %15, 5
  br i1 %16, label %17, label %39

; <label>:17                                      ; preds = %14
  %18 = load i32* %h, align 4
  %19 = icmp ne i32 %18, 6
  br i1 %19, label %20, label %39

; <label>:20                                      ; preds = %17
  %21 = load i32* %h, align 4
  %22 = icmp ne i32 %21, 7
  br i1 %22, label %23, label %39

; <label>:23                                      ; preds = %20
  %24 = load i32* %h, align 4
  %25 = icmp ne i32 %24, 8
  br i1 %25, label %26, label %39

; <label>:26                                      ; preds = %23
  %27 = load i32* %2, align 4
  %28 = sitofp i32 %27 to double
  %29 = call double @sqrt(double %28) #4
  %30 = fadd double %29, 5.000000e-01
  %31 = call double @floor(double %30) #5
  %32 = fptosi double %31 to i32
  store i32 %32, i32* %t, align 4
  %33 = load i32* %t, align 4
  %34 = load i32* %t, align 4
  %35 = mul nsw i32 %33, %34
  %36 = load i32* %2, align 4
  %37 = icmp eq i32 %35, %36
  %38 = zext i1 %37 to i32
  store i32 %38, i32* %1
  br label %40

; <label>:39                                      ; preds = %23, %20, %17, %14, %11, %8
  store i32 0, i32* %1
  br label %40

; <label>:40                                      ; preds = %39, %26, %7
  %41 = load i32* %1
  ret i32 %41
}

; Function Attrs: nounwind readnone
declare double @floor(double) #1

; Function Attrs: nounwind
declare double @sqrt(double) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @PerfectSquare(i32 5)
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str, i32 0, i32 0), i32 %2)
  %4 = call i32 @PerfectSquare(i32 8)
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str1, i32 0, i32 0), i32 %4)
  %6 = call i32 @PerfectSquare(i32 16)
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str2, i32 0, i32 0), i32 %6)
  ret i32 0
}

declare i32 @printf(i8*, ...) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
