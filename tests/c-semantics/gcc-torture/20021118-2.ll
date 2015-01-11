; ModuleID = './20021118-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@main.f = private unnamed_addr constant [3 x float] [float 2.000000e+00, float 3.000000e+00, float 4.000000e+00], align 4

; Function Attrs: nounwind uwtable
define i32 @t1(float* %f, i32 %i, void (double)* %f1, void (float, float)* %f2) #0 {
  %1 = alloca float*, align 8
  %2 = alloca i32, align 4
  %3 = alloca void (double)*, align 8
  %4 = alloca void (float, float)*, align 8
  store float* %f, float** %1, align 8
  store i32 %i, i32* %2, align 4
  store void (double)* %f1, void (double)** %3, align 8
  store void (float, float)* %f2, void (float, float)** %4, align 8
  %5 = load void (double)** %3, align 8
  call void %5(double 3.000000e+00)
  %6 = load i32* %2, align 4
  %7 = add nsw i32 %6, 1
  %8 = sext i32 %7 to i64
  %9 = load float** %1, align 8
  %10 = getelementptr inbounds float* %9, i64 %8
  %11 = load float* %10, align 4
  %12 = load i32* %2, align 4
  %13 = sext i32 %12 to i64
  %14 = load float** %1, align 8
  %15 = getelementptr inbounds float* %14, i64 %13
  store float %11, float* %15, align 4
  %16 = load void (float, float)** %4, align 8
  call void %16(float 2.500000e+00, float 3.500000e+00)
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @t2(float* %f, i32 %i, void (double)* %f1, void (float, float)* %f2, void (float)* %f3) #0 {
  %1 = alloca float*, align 8
  %2 = alloca i32, align 4
  %3 = alloca void (double)*, align 8
  %4 = alloca void (float, float)*, align 8
  %5 = alloca void (float)*, align 8
  store float* %f, float** %1, align 8
  store i32 %i, i32* %2, align 4
  store void (double)* %f1, void (double)** %3, align 8
  store void (float, float)* %f2, void (float, float)** %4, align 8
  store void (float)* %f3, void (float)** %5, align 8
  %6 = load void (float)** %5, align 8
  call void %6(float 6.000000e+00)
  %7 = load void (double)** %3, align 8
  call void %7(double 3.000000e+00)
  %8 = load i32* %2, align 4
  %9 = add nsw i32 %8, 1
  %10 = sext i32 %9 to i64
  %11 = load float** %1, align 8
  %12 = getelementptr inbounds float* %11, i64 %10
  %13 = load float* %12, align 4
  %14 = load i32* %2, align 4
  %15 = sext i32 %14 to i64
  %16 = load float** %1, align 8
  %17 = getelementptr inbounds float* %16, i64 %15
  store float %13, float* %17, align 4
  %18 = load void (float, float)** %4, align 8
  call void %18(float 2.500000e+00, float 3.500000e+00)
  ret i32 0
}

; Function Attrs: nounwind uwtable
define void @f1(double %d) #0 {
  %1 = alloca double, align 8
  store double %d, double* %1, align 8
  %2 = load double* %1, align 8
  %3 = fcmp une double %2, 3.000000e+00
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:5                                       ; preds = %0
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define void @f2(float %f1, float %f2) #0 {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  store float %f1, float* %1, align 4
  store float %f2, float* %2, align 4
  %3 = load float* %1, align 4
  %4 = fcmp une float %3, 2.500000e+00
  br i1 %4, label %8, label %5

; <label>:5                                       ; preds = %0
  %6 = load float* %2, align 4
  %7 = fcmp une float %6, 3.500000e+00
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5, %0
  call void @abort() #3
  unreachable

; <label>:9                                       ; preds = %5
  ret void
}

; Function Attrs: nounwind uwtable
define void @f3(float %f) #0 {
  %1 = alloca float, align 4
  store float %f, float* %1, align 4
  %2 = load float* %1, align 4
  %3 = fcmp une float %2, 6.000000e+00
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:5                                       ; preds = %0
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %f = alloca [3 x float], align 4
  store i32 0, i32* %1
  %2 = bitcast [3 x float]* %f to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast ([3 x float]* @main.f to i8*), i64 12, i32 4, i1 false)
  %3 = getelementptr inbounds [3 x float]* %f, i32 0, i32 0
  %4 = call i32 @t1(float* %3, i32 0, void (double)* @f1, void (float, float)* @f2)
  %5 = getelementptr inbounds [3 x float]* %f, i32 0, i32 0
  %6 = call i32 @t2(float* %5, i32 1, void (double)* @f1, void (float, float)* @f2, void (float)* @f3)
  %7 = getelementptr inbounds [3 x float]* %f, i32 0, i64 0
  %8 = load float* %7, align 4
  %9 = fcmp une float %8, 3.000000e+00
  br i1 %9, label %10, label %15

; <label>:10                                      ; preds = %0
  %11 = getelementptr inbounds [3 x float]* %f, i32 0, i64 1
  %12 = load float* %11, align 4
  %13 = fcmp une float %12, 4.000000e+00
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %10
  call void @abort() #3
  unreachable

; <label>:15                                      ; preds = %10, %0
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %17 = load i32* %1
  ret i32 %17
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
