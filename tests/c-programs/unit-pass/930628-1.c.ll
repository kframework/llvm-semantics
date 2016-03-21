; ModuleID = './930628-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { [3 x i32], [1 x [2 x double]] }

; Function Attrs: nounwind uwtable
define void @f(double* %x, double* %y) #0 {
  %1 = alloca double*, align 8
  %2 = alloca double*, align 8
  store double* %x, double** %1, align 8
  store double* %y, double** %2, align 8
  %3 = load double*, double** %1, align 8
  %4 = load double*, double** %2, align 8
  %5 = icmp eq double* %3, %4
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:7                                       ; preds = %0
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %tp = alloca [4 x [2 x %struct.anon]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %ki = alloca i32, align 4
  %kj = alloca i32, align 4
  %mi = alloca i32, align 4
  %mj = alloca i32, align 4
  %bdm = alloca [4 x [2 x [4 x [2 x float]]]], align 16
  store i32 0, i32* %1
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %103, %0
  %3 = load i32, i32* %i, align 4
  %4 = icmp slt i32 %3, 4
  br i1 %4, label %5, label %106

; <label>:5                                       ; preds = %2
  %6 = load i32, i32* %i, align 4
  store i32 %6, i32* %j, align 4
  br label %7

; <label>:7                                       ; preds = %99, %5
  %8 = load i32, i32* %j, align 4
  %9 = icmp slt i32 %8, 4
  br i1 %9, label %10, label %102

; <label>:10                                      ; preds = %7
  store i32 0, i32* %ki, align 4
  br label %11

; <label>:11                                      ; preds = %95, %10
  %12 = load i32, i32* %ki, align 4
  %13 = icmp slt i32 %12, 2
  br i1 %13, label %14, label %98

; <label>:14                                      ; preds = %11
  store i32 0, i32* %kj, align 4
  br label %15

; <label>:15                                      ; preds = %91, %14
  %16 = load i32, i32* %kj, align 4
  %17 = icmp slt i32 %16, 2
  br i1 %17, label %18, label %94

; <label>:18                                      ; preds = %15
  %19 = load i32, i32* %j, align 4
  %20 = load i32, i32* %i, align 4
  %21 = icmp eq i32 %19, %20
  br i1 %21, label %22, label %39

; <label>:22                                      ; preds = %18
  %23 = load i32, i32* %ki, align 4
  %24 = load i32, i32* %kj, align 4
  %25 = icmp eq i32 %23, %24
  br i1 %25, label %26, label %39

; <label>:26                                      ; preds = %22
  %27 = load i32, i32* %kj, align 4
  %28 = sext i32 %27 to i64
  %29 = load i32, i32* %j, align 4
  %30 = sext i32 %29 to i64
  %31 = load i32, i32* %ki, align 4
  %32 = sext i32 %31 to i64
  %33 = load i32, i32* %i, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [4 x [2 x [4 x [2 x float]]]], [4 x [2 x [4 x [2 x float]]]]* %bdm, i32 0, i64 %34
  %36 = getelementptr inbounds [2 x [4 x [2 x float]]], [2 x [4 x [2 x float]]]* %35, i32 0, i64 %32
  %37 = getelementptr inbounds [4 x [2 x float]], [4 x [2 x float]]* %36, i32 0, i64 %30
  %38 = getelementptr inbounds [2 x float], [2 x float]* %37, i32 0, i64 %28
  store float 1.000000e+03, float* %38, align 4
  br label %90

; <label>:39                                      ; preds = %22, %18
  store i32 0, i32* %mi, align 4
  br label %40

; <label>:40                                      ; preds = %74, %39
  %41 = load i32, i32* %mi, align 4
  %42 = icmp slt i32 %41, 1
  br i1 %42, label %43, label %77

; <label>:43                                      ; preds = %40
  store i32 0, i32* %mj, align 4
  br label %44

; <label>:44                                      ; preds = %70, %43
  %45 = load i32, i32* %mj, align 4
  %46 = icmp slt i32 %45, 1
  br i1 %46, label %47, label %73

; <label>:47                                      ; preds = %44
  %48 = load i32, i32* %mi, align 4
  %49 = sext i32 %48 to i64
  %50 = load i32, i32* %ki, align 4
  %51 = sext i32 %50 to i64
  %52 = load i32, i32* %i, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [4 x [2 x %struct.anon]], [4 x [2 x %struct.anon]]* %tp, i32 0, i64 %53
  %55 = getelementptr inbounds [2 x %struct.anon], [2 x %struct.anon]* %54, i32 0, i64 %51
  %56 = getelementptr inbounds %struct.anon, %struct.anon* %55, i32 0, i32 1
  %57 = getelementptr inbounds [1 x [2 x double]], [1 x [2 x double]]* %56, i32 0, i64 %49
  %58 = getelementptr inbounds [2 x double], [2 x double]* %57, i32 0, i32 0
  %59 = load i32, i32* %mj, align 4
  %60 = sext i32 %59 to i64
  %61 = load i32, i32* %kj, align 4
  %62 = sext i32 %61 to i64
  %63 = load i32, i32* %j, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [4 x [2 x %struct.anon]], [4 x [2 x %struct.anon]]* %tp, i32 0, i64 %64
  %66 = getelementptr inbounds [2 x %struct.anon], [2 x %struct.anon]* %65, i32 0, i64 %62
  %67 = getelementptr inbounds %struct.anon, %struct.anon* %66, i32 0, i32 1
  %68 = getelementptr inbounds [1 x [2 x double]], [1 x [2 x double]]* %67, i32 0, i64 %60
  %69 = getelementptr inbounds [2 x double], [2 x double]* %68, i32 0, i32 0
  call void @f(double* %58, double* %69)
  br label %70

; <label>:70                                      ; preds = %47
  %71 = load i32, i32* %mj, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, i32* %mj, align 4
  br label %44

; <label>:73                                      ; preds = %44
  br label %74

; <label>:74                                      ; preds = %73
  %75 = load i32, i32* %mi, align 4
  %76 = add nsw i32 %75, 1
  store i32 %76, i32* %mi, align 4
  br label %40

; <label>:77                                      ; preds = %40
  %78 = load i32, i32* %kj, align 4
  %79 = sext i32 %78 to i64
  %80 = load i32, i32* %j, align 4
  %81 = sext i32 %80 to i64
  %82 = load i32, i32* %ki, align 4
  %83 = sext i32 %82 to i64
  %84 = load i32, i32* %i, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [4 x [2 x [4 x [2 x float]]]], [4 x [2 x [4 x [2 x float]]]]* %bdm, i32 0, i64 %85
  %87 = getelementptr inbounds [2 x [4 x [2 x float]]], [2 x [4 x [2 x float]]]* %86, i32 0, i64 %83
  %88 = getelementptr inbounds [4 x [2 x float]], [4 x [2 x float]]* %87, i32 0, i64 %81
  %89 = getelementptr inbounds [2 x float], [2 x float]* %88, i32 0, i64 %79
  store float 1.000000e+03, float* %89, align 4
  br label %90

; <label>:90                                      ; preds = %77, %26
  br label %91

; <label>:91                                      ; preds = %90
  %92 = load i32, i32* %kj, align 4
  %93 = add nsw i32 %92, 1
  store i32 %93, i32* %kj, align 4
  br label %15

; <label>:94                                      ; preds = %15
  br label %95

; <label>:95                                      ; preds = %94
  %96 = load i32, i32* %ki, align 4
  %97 = add nsw i32 %96, 1
  store i32 %97, i32* %ki, align 4
  br label %11

; <label>:98                                      ; preds = %11
  br label %99

; <label>:99                                      ; preds = %98
  %100 = load i32, i32* %j, align 4
  %101 = add nsw i32 %100, 1
  store i32 %101, i32* %j, align 4
  br label %7

; <label>:102                                     ; preds = %7
  br label %103

; <label>:103                                     ; preds = %102
  %104 = load i32, i32* %i, align 4
  %105 = add nsw i32 %104, 1
  store i32 %105, i32* %i, align 4
  br label %2

; <label>:106                                     ; preds = %2
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %108 = load i32, i32* %1
  ret i32 %108
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
