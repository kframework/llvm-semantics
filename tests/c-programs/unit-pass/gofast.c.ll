; ModuleID = './gofast.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@fail_count = global i32 0, align 4
@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [17 x i8] c"Test failed: %s\0A\00", align 1
@.str.1 = private unnamed_addr constant [11 x i8] c"fp_add 1+1\00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"fp_sub 3-2\00", align 1
@.str.3 = private unnamed_addr constant [11 x i8] c"fp_mul 2*3\00", align 1
@.str.4 = private unnamed_addr constant [11 x i8] c"fp_div 3/2\00", align 1
@.str.5 = private unnamed_addr constant [9 x i8] c"fp_neg 1\00", align 1
@.str.6 = private unnamed_addr constant [11 x i8] c"dp_add 1+1\00", align 1
@.str.7 = private unnamed_addr constant [11 x i8] c"dp_sub 3-2\00", align 1
@.str.8 = private unnamed_addr constant [11 x i8] c"dp_mul 2*3\00", align 1
@.str.9 = private unnamed_addr constant [11 x i8] c"dp_div 3/2\00", align 1
@.str.10 = private unnamed_addr constant [9 x i8] c"dp_neg 1\00", align 1
@.str.11 = private unnamed_addr constant [13 x i8] c"fp_to_dp 1.5\00", align 1
@.str.12 = private unnamed_addr constant [13 x i8] c"dp_to_fp 1.5\00", align 1
@.str.13 = private unnamed_addr constant [12 x i8] c"floatsisf 1\00", align 1
@.str.14 = private unnamed_addr constant [12 x i8] c"floatsidf 1\00", align 1
@.str.15 = private unnamed_addr constant [13 x i8] c"fixsfsi 1.42\00", align 1
@.str.16 = private unnamed_addr constant [16 x i8] c"fixunssfsi 1.42\00", align 1
@.str.17 = private unnamed_addr constant [13 x i8] c"fixdfsi 1.42\00", align 1
@.str.18 = private unnamed_addr constant [16 x i8] c"fixunsdfsi 1.42\00", align 1
@.str.19 = private unnamed_addr constant [11 x i8] c"eqsf2 1==1\00", align 1
@.str.20 = private unnamed_addr constant [11 x i8] c"eqsf2 1==2\00", align 1
@.str.21 = private unnamed_addr constant [11 x i8] c"nesf2 1!=1\00", align 1
@.str.22 = private unnamed_addr constant [10 x i8] c"gtsf2 2>1\00", align 1
@.str.23 = private unnamed_addr constant [10 x i8] c"gtsf2 1>1\00", align 1
@.str.24 = private unnamed_addr constant [10 x i8] c"gtsf2 0>1\00", align 1
@.str.25 = private unnamed_addr constant [11 x i8] c"gesf2 2>=1\00", align 1
@.str.26 = private unnamed_addr constant [11 x i8] c"gesf2 1>=1\00", align 1
@.str.27 = private unnamed_addr constant [11 x i8] c"gesf2 0>=1\00", align 1
@.str.28 = private unnamed_addr constant [10 x i8] c"ltsf2 1<2\00", align 1
@.str.29 = private unnamed_addr constant [10 x i8] c"ltsf2 1<1\00", align 1
@.str.30 = private unnamed_addr constant [10 x i8] c"ltsf2 1<0\00", align 1
@.str.31 = private unnamed_addr constant [11 x i8] c"lesf2 1<=2\00", align 1
@.str.32 = private unnamed_addr constant [11 x i8] c"lesf2 1<=1\00", align 1
@.str.33 = private unnamed_addr constant [11 x i8] c"lesf2 1<=0\00", align 1

; Function Attrs: nounwind uwtable
define float @fp_add(float %a, float %b) #0 {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  store float %a, float* %1, align 4
  store float %b, float* %2, align 4
  %3 = load float, float* %1, align 4
  %4 = load float, float* %2, align 4
  %5 = fadd float %3, %4
  ret float %5
}

; Function Attrs: nounwind uwtable
define float @fp_sub(float %a, float %b) #0 {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  store float %a, float* %1, align 4
  store float %b, float* %2, align 4
  %3 = load float, float* %1, align 4
  %4 = load float, float* %2, align 4
  %5 = fsub float %3, %4
  ret float %5
}

; Function Attrs: nounwind uwtable
define float @fp_mul(float %a, float %b) #0 {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  store float %a, float* %1, align 4
  store float %b, float* %2, align 4
  %3 = load float, float* %1, align 4
  %4 = load float, float* %2, align 4
  %5 = fmul float %3, %4
  ret float %5
}

; Function Attrs: nounwind uwtable
define float @fp_div(float %a, float %b) #0 {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  store float %a, float* %1, align 4
  store float %b, float* %2, align 4
  %3 = load float, float* %1, align 4
  %4 = load float, float* %2, align 4
  %5 = fdiv float %3, %4
  ret float %5
}

; Function Attrs: nounwind uwtable
define float @fp_neg(float %a) #0 {
  %1 = alloca float, align 4
  store float %a, float* %1, align 4
  %2 = load float, float* %1, align 4
  %3 = fsub float -0.000000e+00, %2
  ret float %3
}

; Function Attrs: nounwind uwtable
define double @dp_add(double %a, double %b) #0 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  store double %a, double* %1, align 8
  store double %b, double* %2, align 8
  %3 = load double, double* %1, align 8
  %4 = load double, double* %2, align 8
  %5 = fadd double %3, %4
  ret double %5
}

; Function Attrs: nounwind uwtable
define double @dp_sub(double %a, double %b) #0 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  store double %a, double* %1, align 8
  store double %b, double* %2, align 8
  %3 = load double, double* %1, align 8
  %4 = load double, double* %2, align 8
  %5 = fsub double %3, %4
  ret double %5
}

; Function Attrs: nounwind uwtable
define double @dp_mul(double %a, double %b) #0 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  store double %a, double* %1, align 8
  store double %b, double* %2, align 8
  %3 = load double, double* %1, align 8
  %4 = load double, double* %2, align 8
  %5 = fmul double %3, %4
  ret double %5
}

; Function Attrs: nounwind uwtable
define double @dp_div(double %a, double %b) #0 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  store double %a, double* %1, align 8
  store double %b, double* %2, align 8
  %3 = load double, double* %1, align 8
  %4 = load double, double* %2, align 8
  %5 = fdiv double %3, %4
  ret double %5
}

; Function Attrs: nounwind uwtable
define double @dp_neg(double %a) #0 {
  %1 = alloca double, align 8
  store double %a, double* %1, align 8
  %2 = load double, double* %1, align 8
  %3 = fsub double -0.000000e+00, %2
  ret double %3
}

; Function Attrs: nounwind uwtable
define double @fp_to_dp(float %f) #0 {
  %1 = alloca float, align 4
  store float %f, float* %1, align 4
  %2 = load float, float* %1, align 4
  %3 = fpext float %2 to double
  ret double %3
}

; Function Attrs: nounwind uwtable
define float @dp_to_fp(double %d) #0 {
  %1 = alloca double, align 8
  store double %d, double* %1, align 8
  %2 = load double, double* %1, align 8
  %3 = fptrunc double %2 to float
  ret float %3
}

; Function Attrs: nounwind uwtable
define i32 @eqsf2(float %a, float %b) #0 {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  store float %a, float* %1, align 4
  store float %b, float* %2, align 4
  %3 = load float, float* %1, align 4
  %4 = load float, float* %2, align 4
  %5 = fcmp oeq float %3, %4
  %6 = zext i1 %5 to i32
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define i32 @nesf2(float %a, float %b) #0 {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  store float %a, float* %1, align 4
  store float %b, float* %2, align 4
  %3 = load float, float* %1, align 4
  %4 = load float, float* %2, align 4
  %5 = fcmp une float %3, %4
  %6 = zext i1 %5 to i32
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define i32 @gtsf2(float %a, float %b) #0 {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  store float %a, float* %1, align 4
  store float %b, float* %2, align 4
  %3 = load float, float* %1, align 4
  %4 = load float, float* %2, align 4
  %5 = fcmp ogt float %3, %4
  %6 = zext i1 %5 to i32
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define i32 @gesf2(float %a, float %b) #0 {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  store float %a, float* %1, align 4
  store float %b, float* %2, align 4
  %3 = load float, float* %1, align 4
  %4 = load float, float* %2, align 4
  %5 = fcmp oge float %3, %4
  %6 = zext i1 %5 to i32
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define i32 @ltsf2(float %a, float %b) #0 {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  store float %a, float* %1, align 4
  store float %b, float* %2, align 4
  %3 = load float, float* %1, align 4
  %4 = load float, float* %2, align 4
  %5 = fcmp olt float %3, %4
  %6 = zext i1 %5 to i32
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define i32 @lesf2(float %a, float %b) #0 {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  store float %a, float* %1, align 4
  store float %b, float* %2, align 4
  %3 = load float, float* %1, align 4
  %4 = load float, float* %2, align 4
  %5 = fcmp ole float %3, %4
  %6 = zext i1 %5 to i32
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define i32 @eqdf2(double %a, double %b) #0 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  store double %a, double* %1, align 8
  store double %b, double* %2, align 8
  %3 = load double, double* %1, align 8
  %4 = load double, double* %2, align 8
  %5 = fcmp oeq double %3, %4
  %6 = zext i1 %5 to i32
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define i32 @nedf2(double %a, double %b) #0 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  store double %a, double* %1, align 8
  store double %b, double* %2, align 8
  %3 = load double, double* %1, align 8
  %4 = load double, double* %2, align 8
  %5 = fcmp une double %3, %4
  %6 = zext i1 %5 to i32
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define i32 @gtdf2(double %a, double %b) #0 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  store double %a, double* %1, align 8
  store double %b, double* %2, align 8
  %3 = load double, double* %1, align 8
  %4 = load double, double* %2, align 8
  %5 = fcmp ogt double %3, %4
  %6 = zext i1 %5 to i32
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define i32 @gedf2(double %a, double %b) #0 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  store double %a, double* %1, align 8
  store double %b, double* %2, align 8
  %3 = load double, double* %1, align 8
  %4 = load double, double* %2, align 8
  %5 = fcmp oge double %3, %4
  %6 = zext i1 %5 to i32
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define i32 @ltdf2(double %a, double %b) #0 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  store double %a, double* %1, align 8
  store double %b, double* %2, align 8
  %3 = load double, double* %1, align 8
  %4 = load double, double* %2, align 8
  %5 = fcmp olt double %3, %4
  %6 = zext i1 %5 to i32
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define i32 @ledf2(double %a, double %b) #0 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  store double %a, double* %1, align 8
  store double %b, double* %2, align 8
  %3 = load double, double* %1, align 8
  %4 = load double, double* %2, align 8
  %5 = fcmp ole double %3, %4
  %6 = zext i1 %5 to i32
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define float @floatsisf(i32 %i) #0 {
  %1 = alloca i32, align 4
  store i32 %i, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = sitofp i32 %2 to float
  ret float %3
}

; Function Attrs: nounwind uwtable
define double @floatsidf(i32 %i) #0 {
  %1 = alloca i32, align 4
  store i32 %i, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = sitofp i32 %2 to double
  ret double %3
}

; Function Attrs: nounwind uwtable
define i32 @fixsfsi(float %f) #0 {
  %1 = alloca float, align 4
  store float %f, float* %1, align 4
  %2 = load float, float* %1, align 4
  %3 = fptosi float %2 to i32
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @fixdfsi(double %d) #0 {
  %1 = alloca double, align 8
  store double %d, double* %1, align 8
  %2 = load double, double* %1, align 8
  %3 = fptosi double %2 to i32
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @fixunssfsi(float %f) #0 {
  %1 = alloca float, align 4
  store float %f, float* %1, align 4
  %2 = load float, float* %1, align 4
  %3 = fptoui float %2 to i32
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @fixunsdfsi(double %d) #0 {
  %1 = alloca double, align 8
  store double %d, double* %1, align 8
  %2 = load double, double* %1, align 8
  %3 = fptoui double %2 to i32
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @fail(i8* %msg) #0 {
  %1 = alloca i8*, align 8
  store i8* %msg, i8** %1, align 8
  %2 = load i32, i32* @fail_count, align 4
  %3 = add nsw i32 %2, 1
  store i32 %3, i32* @fail_count, align 4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = load i8*, i8** %1, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str, i32 0, i32 0), i8* %5)
  ret i32 0
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call float @fp_add(float 1.000000e+00, float 1.000000e+00)
  %3 = fcmp une float %2, 2.000000e+00
  br i1 %3, label %4, label %6

; <label>:4                                       ; preds = %0
  %5 = call i32 @fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0))
  br label %6

; <label>:6                                       ; preds = %4, %0
  %7 = call float @fp_sub(float 3.000000e+00, float 2.000000e+00)
  %8 = fcmp une float %7, 1.000000e+00
  br i1 %8, label %9, label %11

; <label>:9                                       ; preds = %6
  %10 = call i32 @fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0))
  br label %11

; <label>:11                                      ; preds = %9, %6
  %12 = call float @fp_mul(float 2.000000e+00, float 3.000000e+00)
  %13 = fcmp une float %12, 6.000000e+00
  br i1 %13, label %14, label %16

; <label>:14                                      ; preds = %11
  %15 = call i32 @fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i32 0, i32 0))
  br label %16

; <label>:16                                      ; preds = %14, %11
  %17 = call float @fp_div(float 3.000000e+00, float 2.000000e+00)
  %18 = fpext float %17 to double
  %19 = fcmp une double %18, 1.500000e+00
  br i1 %19, label %20, label %22

; <label>:20                                      ; preds = %16
  %21 = call i32 @fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.4, i32 0, i32 0))
  br label %22

; <label>:22                                      ; preds = %20, %16
  %23 = call float @fp_neg(float 1.000000e+00)
  %24 = fcmp une float %23, -1.000000e+00
  br i1 %24, label %25, label %27

; <label>:25                                      ; preds = %22
  %26 = call i32 @fail(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.5, i32 0, i32 0))
  br label %27

; <label>:27                                      ; preds = %25, %22
  %28 = call double @dp_add(double 1.000000e+00, double 1.000000e+00)
  %29 = fcmp une double %28, 2.000000e+00
  br i1 %29, label %30, label %32

; <label>:30                                      ; preds = %27
  %31 = call i32 @fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.6, i32 0, i32 0))
  br label %32

; <label>:32                                      ; preds = %30, %27
  %33 = call double @dp_sub(double 3.000000e+00, double 2.000000e+00)
  %34 = fcmp une double %33, 1.000000e+00
  br i1 %34, label %35, label %37

; <label>:35                                      ; preds = %32
  %36 = call i32 @fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.7, i32 0, i32 0))
  br label %37

; <label>:37                                      ; preds = %35, %32
  %38 = call double @dp_mul(double 2.000000e+00, double 3.000000e+00)
  %39 = fcmp une double %38, 6.000000e+00
  br i1 %39, label %40, label %42

; <label>:40                                      ; preds = %37
  %41 = call i32 @fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.8, i32 0, i32 0))
  br label %42

; <label>:42                                      ; preds = %40, %37
  %43 = call double @dp_div(double 3.000000e+00, double 2.000000e+00)
  %44 = fcmp une double %43, 1.500000e+00
  br i1 %44, label %45, label %47

; <label>:45                                      ; preds = %42
  %46 = call i32 @fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.9, i32 0, i32 0))
  br label %47

; <label>:47                                      ; preds = %45, %42
  %48 = call double @dp_neg(double 1.000000e+00)
  %49 = fcmp une double %48, -1.000000e+00
  br i1 %49, label %50, label %52

; <label>:50                                      ; preds = %47
  %51 = call i32 @fail(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.10, i32 0, i32 0))
  br label %52

; <label>:52                                      ; preds = %50, %47
  %53 = call double @fp_to_dp(float 1.500000e+00)
  %54 = fcmp une double %53, 1.500000e+00
  br i1 %54, label %55, label %57

; <label>:55                                      ; preds = %52
  %56 = call i32 @fail(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.11, i32 0, i32 0))
  br label %57

; <label>:57                                      ; preds = %55, %52
  %58 = call float @dp_to_fp(double 1.500000e+00)
  %59 = fpext float %58 to double
  %60 = fcmp une double %59, 1.500000e+00
  br i1 %60, label %61, label %63

; <label>:61                                      ; preds = %57
  %62 = call i32 @fail(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.12, i32 0, i32 0))
  br label %63

; <label>:63                                      ; preds = %61, %57
  %64 = call float @floatsisf(i32 1)
  %65 = fcmp une float %64, 1.000000e+00
  br i1 %65, label %66, label %68

; <label>:66                                      ; preds = %63
  %67 = call i32 @fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.13, i32 0, i32 0))
  br label %68

; <label>:68                                      ; preds = %66, %63
  %69 = call double @floatsidf(i32 1)
  %70 = fcmp une double %69, 1.000000e+00
  br i1 %70, label %71, label %73

; <label>:71                                      ; preds = %68
  %72 = call i32 @fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.14, i32 0, i32 0))
  br label %73

; <label>:73                                      ; preds = %71, %68
  %74 = call i32 @fixsfsi(float 0x3FF6B851E0000000)
  %75 = icmp ne i32 %74, 1
  br i1 %75, label %76, label %78

; <label>:76                                      ; preds = %73
  %77 = call i32 @fail(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.15, i32 0, i32 0))
  br label %78

; <label>:78                                      ; preds = %76, %73
  %79 = call i32 @fixunssfsi(float 0x3FF6B851E0000000)
  %80 = icmp ne i32 %79, 1
  br i1 %80, label %81, label %83

; <label>:81                                      ; preds = %78
  %82 = call i32 @fail(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.16, i32 0, i32 0))
  br label %83

; <label>:83                                      ; preds = %81, %78
  %84 = call i32 @fixdfsi(double 1.420000e+00)
  %85 = icmp ne i32 %84, 1
  br i1 %85, label %86, label %88

; <label>:86                                      ; preds = %83
  %87 = call i32 @fail(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.17, i32 0, i32 0))
  br label %88

; <label>:88                                      ; preds = %86, %83
  %89 = call i32 @fixunsdfsi(double 1.420000e+00)
  %90 = icmp ne i32 %89, 1
  br i1 %90, label %91, label %93

; <label>:91                                      ; preds = %88
  %92 = call i32 @fail(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.18, i32 0, i32 0))
  br label %93

; <label>:93                                      ; preds = %91, %88
  %94 = call i32 @eqsf2(float 1.000000e+00, float 1.000000e+00)
  %95 = icmp eq i32 %94, 0
  br i1 %95, label %96, label %98

; <label>:96                                      ; preds = %93
  %97 = call i32 @fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.19, i32 0, i32 0))
  br label %98

; <label>:98                                      ; preds = %96, %93
  %99 = call i32 @eqsf2(float 1.000000e+00, float 2.000000e+00)
  %100 = icmp ne i32 %99, 0
  br i1 %100, label %101, label %103

; <label>:101                                     ; preds = %98
  %102 = call i32 @fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.20, i32 0, i32 0))
  br label %103

; <label>:103                                     ; preds = %101, %98
  %104 = call i32 @nesf2(float 1.000000e+00, float 2.000000e+00)
  %105 = icmp eq i32 %104, 0
  br i1 %105, label %106, label %108

; <label>:106                                     ; preds = %103
  %107 = call i32 @fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.21, i32 0, i32 0))
  br label %108

; <label>:108                                     ; preds = %106, %103
  %109 = call i32 @nesf2(float 1.000000e+00, float 1.000000e+00)
  %110 = icmp ne i32 %109, 0
  br i1 %110, label %111, label %113

; <label>:111                                     ; preds = %108
  %112 = call i32 @fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.21, i32 0, i32 0))
  br label %113

; <label>:113                                     ; preds = %111, %108
  %114 = call i32 @gtsf2(float 2.000000e+00, float 1.000000e+00)
  %115 = icmp eq i32 %114, 0
  br i1 %115, label %116, label %118

; <label>:116                                     ; preds = %113
  %117 = call i32 @fail(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.22, i32 0, i32 0))
  br label %118

; <label>:118                                     ; preds = %116, %113
  %119 = call i32 @gtsf2(float 1.000000e+00, float 1.000000e+00)
  %120 = icmp ne i32 %119, 0
  br i1 %120, label %121, label %123

; <label>:121                                     ; preds = %118
  %122 = call i32 @fail(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.23, i32 0, i32 0))
  br label %123

; <label>:123                                     ; preds = %121, %118
  %124 = call i32 @gtsf2(float 0.000000e+00, float 1.000000e+00)
  %125 = icmp ne i32 %124, 0
  br i1 %125, label %126, label %128

; <label>:126                                     ; preds = %123
  %127 = call i32 @fail(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.24, i32 0, i32 0))
  br label %128

; <label>:128                                     ; preds = %126, %123
  %129 = call i32 @gesf2(float 2.000000e+00, float 1.000000e+00)
  %130 = icmp eq i32 %129, 0
  br i1 %130, label %131, label %133

; <label>:131                                     ; preds = %128
  %132 = call i32 @fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.25, i32 0, i32 0))
  br label %133

; <label>:133                                     ; preds = %131, %128
  %134 = call i32 @gesf2(float 1.000000e+00, float 1.000000e+00)
  %135 = icmp eq i32 %134, 0
  br i1 %135, label %136, label %138

; <label>:136                                     ; preds = %133
  %137 = call i32 @fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.26, i32 0, i32 0))
  br label %138

; <label>:138                                     ; preds = %136, %133
  %139 = call i32 @gesf2(float 0.000000e+00, float 1.000000e+00)
  %140 = icmp ne i32 %139, 0
  br i1 %140, label %141, label %143

; <label>:141                                     ; preds = %138
  %142 = call i32 @fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.27, i32 0, i32 0))
  br label %143

; <label>:143                                     ; preds = %141, %138
  %144 = call i32 @ltsf2(float 1.000000e+00, float 2.000000e+00)
  %145 = icmp eq i32 %144, 0
  br i1 %145, label %146, label %148

; <label>:146                                     ; preds = %143
  %147 = call i32 @fail(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.28, i32 0, i32 0))
  br label %148

; <label>:148                                     ; preds = %146, %143
  %149 = call i32 @ltsf2(float 1.000000e+00, float 1.000000e+00)
  %150 = icmp ne i32 %149, 0
  br i1 %150, label %151, label %153

; <label>:151                                     ; preds = %148
  %152 = call i32 @fail(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.29, i32 0, i32 0))
  br label %153

; <label>:153                                     ; preds = %151, %148
  %154 = call i32 @ltsf2(float 1.000000e+00, float 0.000000e+00)
  %155 = icmp ne i32 %154, 0
  br i1 %155, label %156, label %158

; <label>:156                                     ; preds = %153
  %157 = call i32 @fail(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30, i32 0, i32 0))
  br label %158

; <label>:158                                     ; preds = %156, %153
  %159 = call i32 @lesf2(float 1.000000e+00, float 2.000000e+00)
  %160 = icmp eq i32 %159, 0
  br i1 %160, label %161, label %163

; <label>:161                                     ; preds = %158
  %162 = call i32 @fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.31, i32 0, i32 0))
  br label %163

; <label>:163                                     ; preds = %161, %158
  %164 = call i32 @lesf2(float 1.000000e+00, float 1.000000e+00)
  %165 = icmp eq i32 %164, 0
  br i1 %165, label %166, label %168

; <label>:166                                     ; preds = %163
  %167 = call i32 @fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.32, i32 0, i32 0))
  br label %168

; <label>:168                                     ; preds = %166, %163
  %169 = call i32 @lesf2(float 1.000000e+00, float 0.000000e+00)
  %170 = icmp ne i32 %169, 0
  br i1 %170, label %171, label %173

; <label>:171                                     ; preds = %168
  %172 = call i32 @fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.33, i32 0, i32 0))
  br label %173

; <label>:173                                     ; preds = %171, %168
  %174 = load i32, i32* @fail_count, align 4
  %175 = icmp ne i32 %174, 0
  br i1 %175, label %176, label %177

; <label>:176                                     ; preds = %173
  call void @abort() #3
  unreachable

; <label>:177                                     ; preds = %173
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %179 = load i32, i32* %1
  ret i32 %179
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
