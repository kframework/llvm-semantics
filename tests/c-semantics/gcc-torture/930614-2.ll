; ModuleID = './930614-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %x = alloca [8 x [2 x [8 x [2 x float]]]], align 16
  store i32 0, i32* %1
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %82, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %85

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  store i32 %6, i32* %j, align 4
  br label %7

; <label>:7                                       ; preds = %78, %5
  %8 = load i32* %j, align 4
  %9 = icmp slt i32 %8, 8
  br i1 %9, label %10, label %81

; <label>:10                                      ; preds = %7
  store i32 0, i32* %k, align 4
  br label %11

; <label>:11                                      ; preds = %74, %10
  %12 = load i32* %k, align 4
  %13 = icmp slt i32 %12, 2
  br i1 %13, label %14, label %77

; <label>:14                                      ; preds = %11
  store i32 0, i32* %l, align 4
  br label %15

; <label>:15                                      ; preds = %70, %14
  %16 = load i32* %l, align 4
  %17 = icmp slt i32 %16, 2
  br i1 %17, label %18, label %73

; <label>:18                                      ; preds = %15
  %19 = load i32* %i, align 4
  %20 = load i32* %j, align 4
  %21 = icmp eq i32 %19, %20
  br i1 %21, label %22, label %39

; <label>:22                                      ; preds = %18
  %23 = load i32* %k, align 4
  %24 = load i32* %l, align 4
  %25 = icmp eq i32 %23, %24
  br i1 %25, label %26, label %39

; <label>:26                                      ; preds = %22
  %27 = load i32* %l, align 4
  %28 = sext i32 %27 to i64
  %29 = load i32* %j, align 4
  %30 = sext i32 %29 to i64
  %31 = load i32* %k, align 4
  %32 = sext i32 %31 to i64
  %33 = load i32* %i, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [8 x [2 x [8 x [2 x float]]]]* %x, i32 0, i64 %34
  %36 = getelementptr inbounds [2 x [8 x [2 x float]]]* %35, i32 0, i64 %32
  %37 = getelementptr inbounds [8 x [2 x float]]* %36, i32 0, i64 %30
  %38 = getelementptr inbounds [2 x float]* %37, i32 0, i64 %28
  store float 0x3FE99999A0000000, float* %38, align 4
  br label %52

; <label>:39                                      ; preds = %22, %18
  %40 = load i32* %l, align 4
  %41 = sext i32 %40 to i64
  %42 = load i32* %j, align 4
  %43 = sext i32 %42 to i64
  %44 = load i32* %k, align 4
  %45 = sext i32 %44 to i64
  %46 = load i32* %i, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [8 x [2 x [8 x [2 x float]]]]* %x, i32 0, i64 %47
  %49 = getelementptr inbounds [2 x [8 x [2 x float]]]* %48, i32 0, i64 %45
  %50 = getelementptr inbounds [8 x [2 x float]]* %49, i32 0, i64 %43
  %51 = getelementptr inbounds [2 x float]* %50, i32 0, i64 %41
  store float 0x3FE99999A0000000, float* %51, align 4
  br label %52

; <label>:52                                      ; preds = %39, %26
  %53 = load i32* %l, align 4
  %54 = sext i32 %53 to i64
  %55 = load i32* %j, align 4
  %56 = sext i32 %55 to i64
  %57 = load i32* %k, align 4
  %58 = sext i32 %57 to i64
  %59 = load i32* %i, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [8 x [2 x [8 x [2 x float]]]]* %x, i32 0, i64 %60
  %62 = getelementptr inbounds [2 x [8 x [2 x float]]]* %61, i32 0, i64 %58
  %63 = getelementptr inbounds [8 x [2 x float]]* %62, i32 0, i64 %56
  %64 = getelementptr inbounds [2 x float]* %63, i32 0, i64 %54
  %65 = load float* %64, align 4
  %66 = fpext float %65 to double
  %67 = fcmp olt double %66, 0.000000e+00
  br i1 %67, label %68, label %69

; <label>:68                                      ; preds = %52
  call void @abort() #2
  unreachable

; <label>:69                                      ; preds = %52
  br label %70

; <label>:70                                      ; preds = %69
  %71 = load i32* %l, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, i32* %l, align 4
  br label %15

; <label>:73                                      ; preds = %15
  br label %74

; <label>:74                                      ; preds = %73
  %75 = load i32* %k, align 4
  %76 = add nsw i32 %75, 1
  store i32 %76, i32* %k, align 4
  br label %11

; <label>:77                                      ; preds = %11
  br label %78

; <label>:78                                      ; preds = %77
  %79 = load i32* %j, align 4
  %80 = add nsw i32 %79, 1
  store i32 %80, i32* %j, align 4
  br label %7

; <label>:81                                      ; preds = %7
  br label %82

; <label>:82                                      ; preds = %81
  %83 = load i32* %i, align 4
  %84 = add nsw i32 %83, 1
  store i32 %84, i32* %i, align 4
  br label %2

; <label>:85                                      ; preds = %2
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %87 = load i32* %1
  ret i32 %87
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
