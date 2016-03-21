; ModuleID = './pr36034-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@x = global [5 x [10 x double]] [[10 x double] [double 1.000000e+01, double 1.100000e+01, double 1.200000e+01, double 1.300000e+01, double 1.400000e+01, double 1.500000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00], [10 x double] [double 2.100000e+01, double 2.200000e+01, double 2.300000e+01, double 2.400000e+01, double 2.500000e+01, double 2.600000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00], [10 x double] [double 3.200000e+01, double 3.300000e+01, double 3.400000e+01, double 3.500000e+01, double 3.600000e+01, double 3.700000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00], [10 x double] [double 4.300000e+01, double 4.400000e+01, double 4.500000e+01, double 4.600000e+01, double 4.700000e+01, double 4.800000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00], [10 x double] [double 5.400000e+01, double 5.500000e+01, double 5.600000e+01, double 5.700000e+01, double 5.800000e+01, double 5.900000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00]], align 16
@tmp = common global [5 x [6 x double]] zeroinitializer, align 16

; Function Attrs: noinline nounwind uwtable
define void @test() #0 {
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %59, %0
  %2 = load i32, i32* %i, align 4
  %3 = icmp slt i32 %2, 5
  br i1 %3, label %4, label %62

; <label>:4                                       ; preds = %1
  %5 = load i32, i32* %i, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [5 x [10 x double]], [5 x [10 x double]]* @x, i32 0, i64 %6
  %8 = getelementptr inbounds [10 x double], [10 x double]* %7, i32 0, i64 0
  %9 = load double, double* %8, align 8
  %10 = load i32, i32* %i, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [5 x [6 x double]], [5 x [6 x double]]* @tmp, i32 0, i64 %11
  %13 = getelementptr inbounds [6 x double], [6 x double]* %12, i32 0, i64 0
  store double %9, double* %13, align 8
  %14 = load i32, i32* %i, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [5 x [10 x double]], [5 x [10 x double]]* @x, i32 0, i64 %15
  %17 = getelementptr inbounds [10 x double], [10 x double]* %16, i32 0, i64 1
  %18 = load double, double* %17, align 8
  %19 = load i32, i32* %i, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [5 x [6 x double]], [5 x [6 x double]]* @tmp, i32 0, i64 %20
  %22 = getelementptr inbounds [6 x double], [6 x double]* %21, i32 0, i64 1
  store double %18, double* %22, align 8
  %23 = load i32, i32* %i, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [5 x [10 x double]], [5 x [10 x double]]* @x, i32 0, i64 %24
  %26 = getelementptr inbounds [10 x double], [10 x double]* %25, i32 0, i64 2
  %27 = load double, double* %26, align 8
  %28 = load i32, i32* %i, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [5 x [6 x double]], [5 x [6 x double]]* @tmp, i32 0, i64 %29
  %31 = getelementptr inbounds [6 x double], [6 x double]* %30, i32 0, i64 2
  store double %27, double* %31, align 8
  %32 = load i32, i32* %i, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [5 x [10 x double]], [5 x [10 x double]]* @x, i32 0, i64 %33
  %35 = getelementptr inbounds [10 x double], [10 x double]* %34, i32 0, i64 3
  %36 = load double, double* %35, align 8
  %37 = load i32, i32* %i, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [5 x [6 x double]], [5 x [6 x double]]* @tmp, i32 0, i64 %38
  %40 = getelementptr inbounds [6 x double], [6 x double]* %39, i32 0, i64 3
  store double %36, double* %40, align 8
  %41 = load i32, i32* %i, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [5 x [10 x double]], [5 x [10 x double]]* @x, i32 0, i64 %42
  %44 = getelementptr inbounds [10 x double], [10 x double]* %43, i32 0, i64 4
  %45 = load double, double* %44, align 8
  %46 = load i32, i32* %i, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [5 x [6 x double]], [5 x [6 x double]]* @tmp, i32 0, i64 %47
  %49 = getelementptr inbounds [6 x double], [6 x double]* %48, i32 0, i64 4
  store double %45, double* %49, align 8
  %50 = load i32, i32* %i, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [5 x [10 x double]], [5 x [10 x double]]* @x, i32 0, i64 %51
  %53 = getelementptr inbounds [10 x double], [10 x double]* %52, i32 0, i64 5
  %54 = load double, double* %53, align 8
  %55 = load i32, i32* %i, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [5 x [6 x double]], [5 x [6 x double]]* @tmp, i32 0, i64 %56
  %58 = getelementptr inbounds [6 x double], [6 x double]* %57, i32 0, i64 5
  store double %54, double* %58, align 8
  br label %59

; <label>:59                                      ; preds = %4
  %60 = load i32, i32* %i, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, i32* %i, align 4
  br label %1

; <label>:62                                      ; preds = %1
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
  %10 = load i32, i32* %j, align 4
  %11 = sext i32 %10 to i64
  %12 = load i32, i32* %i, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [5 x [6 x double]], [5 x [6 x double]]* @tmp, i32 0, i64 %13
  %15 = getelementptr inbounds [6 x double], [6 x double]* %14, i32 0, i64 %11
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
