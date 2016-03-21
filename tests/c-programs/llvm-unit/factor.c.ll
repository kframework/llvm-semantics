; ModuleID = './factor.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@plane = internal global [50 x i8] zeroinitializer, align 16
@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @fill() #0 {
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %99, %0
  %2 = load i32, i32* %i, align 4
  %3 = icmp ult i32 %2, 50
  br i1 %3, label %4, label %102

; <label>:4                                       ; preds = %1
  %5 = load i32, i32* %i, align 4
  %6 = zext i32 %5 to i64
  %7 = getelementptr inbounds [50 x i8], [50 x i8]* @plane, i32 0, i64 %6
  store i8 0, i8* %7, align 1
  %8 = load i32, i32* %i, align 4
  %9 = urem i32 %8, 17
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %19

; <label>:11                                      ; preds = %4
  %12 = load i32, i32* %i, align 4
  %13 = zext i32 %12 to i64
  %14 = getelementptr inbounds [50 x i8], [50 x i8]* @plane, i32 0, i64 %13
  %15 = load i8, i8* %14, align 1
  %16 = sext i8 %15 to i32
  %17 = or i32 %16, 128
  %18 = trunc i32 %17 to i8
  store i8 %18, i8* %14, align 1
  br label %19

; <label>:19                                      ; preds = %11, %4
  %20 = load i32, i32* %i, align 4
  %21 = urem i32 %20, 13
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %31

; <label>:23                                      ; preds = %19
  %24 = load i32, i32* %i, align 4
  %25 = zext i32 %24 to i64
  %26 = getelementptr inbounds [50 x i8], [50 x i8]* @plane, i32 0, i64 %25
  %27 = load i8, i8* %26, align 1
  %28 = sext i8 %27 to i32
  %29 = or i32 %28, 64
  %30 = trunc i32 %29 to i8
  store i8 %30, i8* %26, align 1
  br label %31

; <label>:31                                      ; preds = %23, %19
  %32 = load i32, i32* %i, align 4
  %33 = urem i32 %32, 11
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %43

; <label>:35                                      ; preds = %31
  %36 = load i32, i32* %i, align 4
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds [50 x i8], [50 x i8]* @plane, i32 0, i64 %37
  %39 = load i8, i8* %38, align 1
  %40 = sext i8 %39 to i32
  %41 = or i32 %40, 32
  %42 = trunc i32 %41 to i8
  store i8 %42, i8* %38, align 1
  br label %43

; <label>:43                                      ; preds = %35, %31
  %44 = load i32, i32* %i, align 4
  %45 = urem i32 %44, 7
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %47, label %55

; <label>:47                                      ; preds = %43
  %48 = load i32, i32* %i, align 4
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds [50 x i8], [50 x i8]* @plane, i32 0, i64 %49
  %51 = load i8, i8* %50, align 1
  %52 = sext i8 %51 to i32
  %53 = or i32 %52, 16
  %54 = trunc i32 %53 to i8
  store i8 %54, i8* %50, align 1
  br label %55

; <label>:55                                      ; preds = %47, %43
  %56 = load i32, i32* %i, align 4
  %57 = urem i32 %56, 5
  %58 = icmp eq i32 %57, 0
  br i1 %58, label %59, label %67

; <label>:59                                      ; preds = %55
  %60 = load i32, i32* %i, align 4
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds [50 x i8], [50 x i8]* @plane, i32 0, i64 %61
  %63 = load i8, i8* %62, align 1
  %64 = sext i8 %63 to i32
  %65 = or i32 %64, 8
  %66 = trunc i32 %65 to i8
  store i8 %66, i8* %62, align 1
  br label %67

; <label>:67                                      ; preds = %59, %55
  %68 = load i32, i32* %i, align 4
  %69 = urem i32 %68, 3
  %70 = icmp eq i32 %69, 0
  br i1 %70, label %71, label %79

; <label>:71                                      ; preds = %67
  %72 = load i32, i32* %i, align 4
  %73 = zext i32 %72 to i64
  %74 = getelementptr inbounds [50 x i8], [50 x i8]* @plane, i32 0, i64 %73
  %75 = load i8, i8* %74, align 1
  %76 = sext i8 %75 to i32
  %77 = or i32 %76, 4
  %78 = trunc i32 %77 to i8
  store i8 %78, i8* %74, align 1
  br label %79

; <label>:79                                      ; preds = %71, %67
  %80 = load i32, i32* %i, align 4
  %81 = urem i32 %80, 2
  %82 = icmp eq i32 %81, 0
  br i1 %82, label %83, label %91

; <label>:83                                      ; preds = %79
  %84 = load i32, i32* %i, align 4
  %85 = zext i32 %84 to i64
  %86 = getelementptr inbounds [50 x i8], [50 x i8]* @plane, i32 0, i64 %85
  %87 = load i8, i8* %86, align 1
  %88 = sext i8 %87 to i32
  %89 = or i32 %88, 2
  %90 = trunc i32 %89 to i8
  store i8 %90, i8* %86, align 1
  br label %91

; <label>:91                                      ; preds = %83, %79
  %92 = load i32, i32* %i, align 4
  %93 = zext i32 %92 to i64
  %94 = getelementptr inbounds [50 x i8], [50 x i8]* @plane, i32 0, i64 %93
  %95 = load i8, i8* %94, align 1
  %96 = sext i8 %95 to i32
  %97 = or i32 %96, 1
  %98 = trunc i32 %97 to i8
  store i8 %98, i8* %94, align 1
  br label %99

; <label>:99                                      ; preds = %91
  %100 = load i32, i32* %i, align 4
  %101 = add i32 %100, 1
  store i32 %101, i32* %i, align 4
  br label %1

; <label>:102                                     ; preds = %1
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  call void @fill()
  store i32 0, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %19, %0
  %5 = load i32, i32* %i, align 4
  %6 = icmp ult i32 %5, 50
  br i1 %6, label %7, label %22

; <label>:7                                       ; preds = %4
  %8 = load i32, i32* %i, align 4
  %9 = zext i32 %8 to i64
  %10 = getelementptr inbounds [50 x i8], [50 x i8]* @plane, i32 0, i64 %9
  %11 = load i8, i8* %10, align 1
  %12 = sext i8 %11 to i32
  %13 = and i32 %12, 16
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %18

; <label>:15                                      ; preds = %7
  %16 = load i32, i32* %i, align 4
  %17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %16)
  br label %18

; <label>:18                                      ; preds = %15, %7
  br label %19

; <label>:19                                      ; preds = %18
  %20 = load i32, i32* %i, align 4
  %21 = add i32 %20, 1
  store i32 %21, i32* %i, align 4
  br label %4

; <label>:22                                      ; preds = %4
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
