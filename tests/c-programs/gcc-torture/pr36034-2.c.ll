; ModuleID = './pr36034-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@x = global [50 x double] [double 1.000000e+01, double 1.100000e+01, double 1.200000e+01, double 1.300000e+01, double 1.400000e+01, double 1.500000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double 2.100000e+01, double 2.200000e+01, double 2.300000e+01, double 2.400000e+01, double 2.500000e+01, double 2.600000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double 3.200000e+01, double 3.300000e+01, double 3.400000e+01, double 3.500000e+01, double 3.600000e+01, double 3.700000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double 4.300000e+01, double 4.400000e+01, double 4.500000e+01, double 4.600000e+01, double 4.700000e+01, double 4.800000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double 5.400000e+01, double 5.500000e+01, double 5.600000e+01, double 5.700000e+01, double 5.800000e+01, double 5.900000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00], align 16
@tmp = common global [30 x double] zeroinitializer, align 16

; Function Attrs: noinline nounwind uwtable
define void @test() #0 {
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %69, %0
  %2 = load i32, i32* %i, align 4
  %3 = icmp slt i32 %2, 5
  br i1 %3, label %4, label %72

; <label>:4                                       ; preds = %1
  %5 = load i32, i32* %i, align 4
  %6 = mul nsw i32 %5, 10
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [50 x double], [50 x double]* @x, i32 0, i64 %7
  %9 = load double, double* %8, align 8
  %10 = load i32, i32* %i, align 4
  %11 = mul nsw i32 %10, 6
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [30 x double], [30 x double]* @tmp, i32 0, i64 %12
  store double %9, double* %13, align 8
  %14 = load i32, i32* %i, align 4
  %15 = mul nsw i32 %14, 10
  %16 = add nsw i32 %15, 1
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [50 x double], [50 x double]* @x, i32 0, i64 %17
  %19 = load double, double* %18, align 8
  %20 = load i32, i32* %i, align 4
  %21 = mul nsw i32 %20, 6
  %22 = add nsw i32 %21, 1
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [30 x double], [30 x double]* @tmp, i32 0, i64 %23
  store double %19, double* %24, align 8
  %25 = load i32, i32* %i, align 4
  %26 = mul nsw i32 %25, 10
  %27 = add nsw i32 %26, 2
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [50 x double], [50 x double]* @x, i32 0, i64 %28
  %30 = load double, double* %29, align 8
  %31 = load i32, i32* %i, align 4
  %32 = mul nsw i32 %31, 6
  %33 = add nsw i32 %32, 2
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [30 x double], [30 x double]* @tmp, i32 0, i64 %34
  store double %30, double* %35, align 8
  %36 = load i32, i32* %i, align 4
  %37 = mul nsw i32 %36, 10
  %38 = add nsw i32 %37, 3
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [50 x double], [50 x double]* @x, i32 0, i64 %39
  %41 = load double, double* %40, align 8
  %42 = load i32, i32* %i, align 4
  %43 = mul nsw i32 %42, 6
  %44 = add nsw i32 %43, 3
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [30 x double], [30 x double]* @tmp, i32 0, i64 %45
  store double %41, double* %46, align 8
  %47 = load i32, i32* %i, align 4
  %48 = mul nsw i32 %47, 10
  %49 = add nsw i32 %48, 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [50 x double], [50 x double]* @x, i32 0, i64 %50
  %52 = load double, double* %51, align 8
  %53 = load i32, i32* %i, align 4
  %54 = mul nsw i32 %53, 6
  %55 = add nsw i32 %54, 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [30 x double], [30 x double]* @tmp, i32 0, i64 %56
  store double %52, double* %57, align 8
  %58 = load i32, i32* %i, align 4
  %59 = mul nsw i32 %58, 10
  %60 = add nsw i32 %59, 5
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [50 x double], [50 x double]* @x, i32 0, i64 %61
  %63 = load double, double* %62, align 8
  %64 = load i32, i32* %i, align 4
  %65 = mul nsw i32 %64, 6
  %66 = add nsw i32 %65, 5
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [30 x double], [30 x double]* @tmp, i32 0, i64 %67
  store double %63, double* %68, align 8
  br label %69

; <label>:69                                      ; preds = %4
  %70 = load i32, i32* %i, align 4
  %71 = add nsw i32 %70, 1
  store i32 %71, i32* %i, align 4
  br label %1

; <label>:72                                      ; preds = %1
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #1 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %1
  call void @test()
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %24, %0
  %3 = load i32, i32* %i, align 4
  %4 = icmp slt i32 %3, 5
  br i1 %4, label %5, label %27

; <label>:5                                       ; preds = %2
  store i32 0, i32* %j, align 4
  br label %6

; <label>:6                                       ; preds = %20, %5
  %7 = load i32, i32* %j, align 4
  %8 = icmp slt i32 %7, 6
  br i1 %8, label %9, label %23

; <label>:9                                       ; preds = %6
  %10 = load i32, i32* %i, align 4
  %11 = mul nsw i32 %10, 6
  %12 = load i32, i32* %j, align 4
  %13 = add nsw i32 %11, %12
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [30 x double], [30 x double]* @tmp, i32 0, i64 %14
  %16 = load double, double* %15, align 8
  %17 = fcmp oeq double %16, -1.000000e+00
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %9
  call void @abort() #3
  unreachable

; <label>:19                                      ; preds = %9
  br label %20

; <label>:20                                      ; preds = %19
  %21 = load i32, i32* %j, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, i32* %j, align 4
  br label %6

; <label>:23                                      ; preds = %6
  br label %24

; <label>:24                                      ; preds = %23
  %25 = load i32, i32* %i, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %i, align 4
  br label %2

; <label>:27                                      ; preds = %2
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
