; ModuleID = './gaussianElimination.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@main.b = private unnamed_addr constant [3 x double] [double 2.000000e+02, double 0.000000e+00, double 0.000000e+00], align 16
@main.a = private unnamed_addr constant [3 x [3 x double]] [[3 x double] [double 1.000000e+02, double 1.000000e+02, double 1.000000e+02], [3 x double] [double -1.000000e+02, double 3.000000e+02, double -1.000000e+02], [3 x double] [double -1.000000e+02, double -1.000000e+02, double 3.000000e+02]], align 16
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [36 x i8] c"The matrix dimension is too large.\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca [3 x double], align 16
  %b = alloca [3 x double], align 16
  %a = alloca [3 x [3 x double]], align 16
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  %indx = alloca [3 x i32], align 4
  store i32 0, i32* %1
  %2 = bitcast [3 x double]* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast ([3 x double]* @main.b to i8*), i64 24, i32 16, i1 false)
  %3 = bitcast [3 x [3 x double]]* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* bitcast ([3 x [3 x double]]* @main.a to i8*), i64 72, i32 16, i1 false)
  store i32 3, i32* %n, align 4
  %4 = getelementptr inbounds [3 x [3 x double]], [3 x [3 x double]]* %a, i32 0, i32 0
  %5 = load i32, i32* %n, align 4
  %6 = getelementptr inbounds [3 x double], [3 x double]* %b, i32 0, i32 0
  %7 = getelementptr inbounds [3 x double], [3 x double]* %x, i32 0, i32 0
  %8 = getelementptr inbounds [3 x i32], [3 x i32]* %indx, i32 0, i32 0
  call void @legs([3 x double]* %4, i32 %5, double* %6, double* %7, i32* %8)
  store i32 0, i32* %i, align 4
  br label %9

; <label>:9                                       ; preds = %21, %0
  %10 = load i32, i32* %i, align 4
  %11 = load i32, i32* %n, align 4
  %12 = icmp slt i32 %10, %11
  br i1 %12, label %13, label %24

; <label>:13                                      ; preds = %9
  %14 = load i32, i32* %i, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [3 x double], [3 x double]* %x, i32 0, i64 %15
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, 1.000000e+04
  %19 = fptosi double %18 to i32
  %20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %19)
  br label %21

; <label>:21                                      ; preds = %13
  %22 = load i32, i32* %i, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* %i, align 4
  br label %9

; <label>:24                                      ; preds = %9
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @legs([3 x double]* %a, i32 %n, double* %b, double* %x, i32* %indx) #0 {
  %1 = alloca [3 x double]*, align 8
  %2 = alloca i32, align 4
  %3 = alloca double*, align 8
  %4 = alloca double*, align 8
  %5 = alloca i32*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store [3 x double]* %a, [3 x double]** %1, align 8
  store i32 %n, i32* %2, align 4
  store double* %b, double** %3, align 8
  store double* %x, double** %4, align 8
  store i32* %indx, i32** %5, align 8
  %6 = load [3 x double]*, [3 x double]** %1, align 8
  %7 = load i32, i32* %2, align 4
  %8 = load i32*, i32** %5, align 8
  call void @elgs([3 x double]* %6, i32 %7, i32* %8)
  store i32 0, i32* %i, align 4
  br label %9

; <label>:9                                       ; preds = %66, %0
  %10 = load i32, i32* %i, align 4
  %11 = load i32, i32* %2, align 4
  %12 = sub nsw i32 %11, 1
  %13 = icmp slt i32 %10, %12
  br i1 %13, label %14, label %69

; <label>:14                                      ; preds = %9
  %15 = load i32, i32* %i, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, i32* %j, align 4
  br label %17

; <label>:17                                      ; preds = %62, %14
  %18 = load i32, i32* %j, align 4
  %19 = load i32, i32* %2, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %65

; <label>:21                                      ; preds = %17
  %22 = load i32, i32* %j, align 4
  %23 = sext i32 %22 to i64
  %24 = load i32*, i32** %5, align 8
  %25 = getelementptr inbounds i32, i32* %24, i64 %23
  %26 = load i32, i32* %25, align 4
  %27 = sext i32 %26 to i64
  %28 = load double*, double** %3, align 8
  %29 = getelementptr inbounds double, double* %28, i64 %27
  %30 = load double, double* %29, align 8
  %31 = load i32, i32* %i, align 4
  %32 = sext i32 %31 to i64
  %33 = load i32, i32* %j, align 4
  %34 = sext i32 %33 to i64
  %35 = load i32*, i32** %5, align 8
  %36 = getelementptr inbounds i32, i32* %35, i64 %34
  %37 = load i32, i32* %36, align 4
  %38 = sext i32 %37 to i64
  %39 = load [3 x double]*, [3 x double]** %1, align 8
  %40 = getelementptr inbounds [3 x double], [3 x double]* %39, i64 %38
  %41 = getelementptr inbounds [3 x double], [3 x double]* %40, i32 0, i64 %32
  %42 = load double, double* %41, align 8
  %43 = load i32, i32* %i, align 4
  %44 = sext i32 %43 to i64
  %45 = load i32*, i32** %5, align 8
  %46 = getelementptr inbounds i32, i32* %45, i64 %44
  %47 = load i32, i32* %46, align 4
  %48 = sext i32 %47 to i64
  %49 = load double*, double** %3, align 8
  %50 = getelementptr inbounds double, double* %49, i64 %48
  %51 = load double, double* %50, align 8
  %52 = fmul double %42, %51
  %53 = fsub double %30, %52
  %54 = load i32, i32* %j, align 4
  %55 = sext i32 %54 to i64
  %56 = load i32*, i32** %5, align 8
  %57 = getelementptr inbounds i32, i32* %56, i64 %55
  %58 = load i32, i32* %57, align 4
  %59 = sext i32 %58 to i64
  %60 = load double*, double** %3, align 8
  %61 = getelementptr inbounds double, double* %60, i64 %59
  store double %53, double* %61, align 8
  br label %62

; <label>:62                                      ; preds = %21
  %63 = load i32, i32* %j, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, i32* %j, align 4
  br label %17

; <label>:65                                      ; preds = %17
  br label %66

; <label>:66                                      ; preds = %65
  %67 = load i32, i32* %i, align 4
  %68 = add nsw i32 %67, 1
  store i32 %68, i32* %i, align 4
  br label %9

; <label>:69                                      ; preds = %9
  %70 = load i32, i32* %2, align 4
  %71 = sub nsw i32 %70, 1
  %72 = sext i32 %71 to i64
  %73 = load i32*, i32** %5, align 8
  %74 = getelementptr inbounds i32, i32* %73, i64 %72
  %75 = load i32, i32* %74, align 4
  %76 = sext i32 %75 to i64
  %77 = load double*, double** %3, align 8
  %78 = getelementptr inbounds double, double* %77, i64 %76
  %79 = load double, double* %78, align 8
  %80 = load i32, i32* %2, align 4
  %81 = sub nsw i32 %80, 1
  %82 = sext i32 %81 to i64
  %83 = load i32, i32* %2, align 4
  %84 = sub nsw i32 %83, 1
  %85 = sext i32 %84 to i64
  %86 = load i32*, i32** %5, align 8
  %87 = getelementptr inbounds i32, i32* %86, i64 %85
  %88 = load i32, i32* %87, align 4
  %89 = sext i32 %88 to i64
  %90 = load [3 x double]*, [3 x double]** %1, align 8
  %91 = getelementptr inbounds [3 x double], [3 x double]* %90, i64 %89
  %92 = getelementptr inbounds [3 x double], [3 x double]* %91, i32 0, i64 %82
  %93 = load double, double* %92, align 8
  %94 = fdiv double %79, %93
  %95 = load i32, i32* %2, align 4
  %96 = sub nsw i32 %95, 1
  %97 = sext i32 %96 to i64
  %98 = load double*, double** %4, align 8
  %99 = getelementptr inbounds double, double* %98, i64 %97
  store double %94, double* %99, align 8
  %100 = load i32, i32* %2, align 4
  %101 = sub nsw i32 %100, 2
  store i32 %101, i32* %i, align 4
  br label %102

; <label>:102                                     ; preds = %180, %69
  %103 = load i32, i32* %i, align 4
  %104 = icmp sge i32 %103, 0
  br i1 %104, label %105, label %183

; <label>:105                                     ; preds = %102
  %106 = load i32, i32* %i, align 4
  %107 = sext i32 %106 to i64
  %108 = load i32*, i32** %5, align 8
  %109 = getelementptr inbounds i32, i32* %108, i64 %107
  %110 = load i32, i32* %109, align 4
  %111 = sext i32 %110 to i64
  %112 = load double*, double** %3, align 8
  %113 = getelementptr inbounds double, double* %112, i64 %111
  %114 = load double, double* %113, align 8
  %115 = load i32, i32* %i, align 4
  %116 = sext i32 %115 to i64
  %117 = load double*, double** %4, align 8
  %118 = getelementptr inbounds double, double* %117, i64 %116
  store double %114, double* %118, align 8
  %119 = load i32, i32* %i, align 4
  %120 = add nsw i32 %119, 1
  store i32 %120, i32* %j, align 4
  br label %121

; <label>:121                                     ; preds = %154, %105
  %122 = load i32, i32* %j, align 4
  %123 = load i32, i32* %2, align 4
  %124 = icmp slt i32 %122, %123
  br i1 %124, label %125, label %157

; <label>:125                                     ; preds = %121
  %126 = load i32, i32* %i, align 4
  %127 = sext i32 %126 to i64
  %128 = load double*, double** %4, align 8
  %129 = getelementptr inbounds double, double* %128, i64 %127
  %130 = load double, double* %129, align 8
  %131 = load i32, i32* %j, align 4
  %132 = sext i32 %131 to i64
  %133 = load i32, i32* %i, align 4
  %134 = sext i32 %133 to i64
  %135 = load i32*, i32** %5, align 8
  %136 = getelementptr inbounds i32, i32* %135, i64 %134
  %137 = load i32, i32* %136, align 4
  %138 = sext i32 %137 to i64
  %139 = load [3 x double]*, [3 x double]** %1, align 8
  %140 = getelementptr inbounds [3 x double], [3 x double]* %139, i64 %138
  %141 = getelementptr inbounds [3 x double], [3 x double]* %140, i32 0, i64 %132
  %142 = load double, double* %141, align 8
  %143 = load i32, i32* %j, align 4
  %144 = sext i32 %143 to i64
  %145 = load double*, double** %4, align 8
  %146 = getelementptr inbounds double, double* %145, i64 %144
  %147 = load double, double* %146, align 8
  %148 = fmul double %142, %147
  %149 = fsub double %130, %148
  %150 = load i32, i32* %i, align 4
  %151 = sext i32 %150 to i64
  %152 = load double*, double** %4, align 8
  %153 = getelementptr inbounds double, double* %152, i64 %151
  store double %149, double* %153, align 8
  br label %154

; <label>:154                                     ; preds = %125
  %155 = load i32, i32* %j, align 4
  %156 = add nsw i32 %155, 1
  store i32 %156, i32* %j, align 4
  br label %121

; <label>:157                                     ; preds = %121
  %158 = load i32, i32* %i, align 4
  %159 = sext i32 %158 to i64
  %160 = load double*, double** %4, align 8
  %161 = getelementptr inbounds double, double* %160, i64 %159
  %162 = load double, double* %161, align 8
  %163 = load i32, i32* %i, align 4
  %164 = sext i32 %163 to i64
  %165 = load i32, i32* %i, align 4
  %166 = sext i32 %165 to i64
  %167 = load i32*, i32** %5, align 8
  %168 = getelementptr inbounds i32, i32* %167, i64 %166
  %169 = load i32, i32* %168, align 4
  %170 = sext i32 %169 to i64
  %171 = load [3 x double]*, [3 x double]** %1, align 8
  %172 = getelementptr inbounds [3 x double], [3 x double]* %171, i64 %170
  %173 = getelementptr inbounds [3 x double], [3 x double]* %172, i32 0, i64 %164
  %174 = load double, double* %173, align 8
  %175 = fdiv double %162, %174
  %176 = load i32, i32* %i, align 4
  %177 = sext i32 %176 to i64
  %178 = load double*, double** %4, align 8
  %179 = getelementptr inbounds double, double* %178, i64 %177
  store double %175, double* %179, align 8
  br label %180

; <label>:180                                     ; preds = %157
  %181 = load i32, i32* %i, align 4
  %182 = add nsw i32 %181, -1
  store i32 %182, i32* %i, align 4
  br label %102

; <label>:183                                     ; preds = %102
  ret void
}

; Function Attrs: nounwind uwtable
define void @elgs([3 x double]* %a, i32 %n, i32* %indx) #0 {
  %1 = alloca [3 x double]*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %itmp = alloca i32, align 4
  %c1 = alloca double, align 8
  %pi = alloca double, align 8
  %pi1 = alloca double, align 8
  %pj = alloca double, align 8
  %c = alloca [3 x double], align 16
  store [3 x double]* %a, [3 x double]** %1, align 8
  store i32 %n, i32* %2, align 4
  store i32* %indx, i32** %3, align 8
  %4 = load i32, i32* %2, align 4
  %5 = icmp sgt i32 %4, 3
  br i1 %5, label %6, label %8

; <label>:6                                       ; preds = %0
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i32 0, i32 0))
  call void @exit(i32 1) #5
  unreachable

; <label>:8                                       ; preds = %0
  store i32 0, i32* %i, align 4
  br label %9

; <label>:9                                       ; preds = %19, %8
  %10 = load i32, i32* %i, align 4
  %11 = load i32, i32* %2, align 4
  %12 = icmp slt i32 %10, %11
  br i1 %12, label %13, label %22

; <label>:13                                      ; preds = %9
  %14 = load i32, i32* %i, align 4
  %15 = load i32, i32* %i, align 4
  %16 = sext i32 %15 to i64
  %17 = load i32*, i32** %3, align 8
  %18 = getelementptr inbounds i32, i32* %17, i64 %16
  store i32 %14, i32* %18, align 4
  br label %19

; <label>:19                                      ; preds = %13
  %20 = load i32, i32* %i, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %i, align 4
  br label %9

; <label>:22                                      ; preds = %9
  store i32 0, i32* %i, align 4
  br label %23

; <label>:23                                      ; preds = %63, %22
  %24 = load i32, i32* %i, align 4
  %25 = load i32, i32* %2, align 4
  %26 = icmp slt i32 %24, %25
  br i1 %26, label %27, label %66

; <label>:27                                      ; preds = %23
  store double 0.000000e+00, double* %c1, align 8
  store i32 0, i32* %j, align 4
  br label %28

; <label>:28                                      ; preds = %55, %27
  %29 = load i32, i32* %j, align 4
  %30 = load i32, i32* %2, align 4
  %31 = icmp slt i32 %29, %30
  br i1 %31, label %32, label %58

; <label>:32                                      ; preds = %28
  %33 = load i32, i32* %j, align 4
  %34 = sext i32 %33 to i64
  %35 = load i32, i32* %i, align 4
  %36 = sext i32 %35 to i64
  %37 = load [3 x double]*, [3 x double]** %1, align 8
  %38 = getelementptr inbounds [3 x double], [3 x double]* %37, i64 %36
  %39 = getelementptr inbounds [3 x double], [3 x double]* %38, i32 0, i64 %34
  %40 = load double, double* %39, align 8
  %41 = call double @fabs(double %40) #6
  %42 = load double, double* %c1, align 8
  %43 = fcmp ogt double %41, %42
  br i1 %43, label %44, label %54

; <label>:44                                      ; preds = %32
  %45 = load i32, i32* %j, align 4
  %46 = sext i32 %45 to i64
  %47 = load i32, i32* %i, align 4
  %48 = sext i32 %47 to i64
  %49 = load [3 x double]*, [3 x double]** %1, align 8
  %50 = getelementptr inbounds [3 x double], [3 x double]* %49, i64 %48
  %51 = getelementptr inbounds [3 x double], [3 x double]* %50, i32 0, i64 %46
  %52 = load double, double* %51, align 8
  %53 = call double @fabs(double %52) #6
  store double %53, double* %c1, align 8
  br label %54

; <label>:54                                      ; preds = %44, %32
  br label %55

; <label>:55                                      ; preds = %54
  %56 = load i32, i32* %j, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, i32* %j, align 4
  br label %28

; <label>:58                                      ; preds = %28
  %59 = load double, double* %c1, align 8
  %60 = load i32, i32* %i, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [3 x double], [3 x double]* %c, i32 0, i64 %61
  store double %59, double* %62, align 8
  br label %63

; <label>:63                                      ; preds = %58
  %64 = load i32, i32* %i, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, i32* %i, align 4
  br label %23

; <label>:66                                      ; preds = %23
  store i32 0, i32* %j, align 4
  br label %67

; <label>:67                                      ; preds = %228, %66
  %68 = load i32, i32* %j, align 4
  %69 = load i32, i32* %2, align 4
  %70 = sub nsw i32 %69, 1
  %71 = icmp slt i32 %68, %70
  br i1 %71, label %72, label %231

; <label>:72                                      ; preds = %67
  store double 0.000000e+00, double* %pi1, align 8
  %73 = load i32, i32* %j, align 4
  store i32 %73, i32* %i, align 4
  br label %74

; <label>:74                                      ; preds = %108, %72
  %75 = load i32, i32* %i, align 4
  %76 = load i32, i32* %2, align 4
  %77 = icmp slt i32 %75, %76
  br i1 %77, label %78, label %111

; <label>:78                                      ; preds = %74
  %79 = load i32, i32* %j, align 4
  %80 = sext i32 %79 to i64
  %81 = load i32, i32* %i, align 4
  %82 = sext i32 %81 to i64
  %83 = load i32*, i32** %3, align 8
  %84 = getelementptr inbounds i32, i32* %83, i64 %82
  %85 = load i32, i32* %84, align 4
  %86 = sext i32 %85 to i64
  %87 = load [3 x double]*, [3 x double]** %1, align 8
  %88 = getelementptr inbounds [3 x double], [3 x double]* %87, i64 %86
  %89 = getelementptr inbounds [3 x double], [3 x double]* %88, i32 0, i64 %80
  %90 = load double, double* %89, align 8
  %91 = call double @fabs(double %90) #6
  %92 = load i32, i32* %i, align 4
  %93 = sext i32 %92 to i64
  %94 = load i32*, i32** %3, align 8
  %95 = getelementptr inbounds i32, i32* %94, i64 %93
  %96 = load i32, i32* %95, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds [3 x double], [3 x double]* %c, i32 0, i64 %97
  %99 = load double, double* %98, align 8
  %100 = fdiv double %91, %99
  store double %100, double* %pi, align 8
  %101 = load double, double* %pi, align 8
  %102 = load double, double* %pi1, align 8
  %103 = fcmp ogt double %101, %102
  br i1 %103, label %104, label %107

; <label>:104                                     ; preds = %78
  %105 = load double, double* %pi, align 8
  store double %105, double* %pi1, align 8
  %106 = load i32, i32* %i, align 4
  store i32 %106, i32* %k, align 4
  br label %107

; <label>:107                                     ; preds = %104, %78
  br label %108

; <label>:108                                     ; preds = %107
  %109 = load i32, i32* %i, align 4
  %110 = add nsw i32 %109, 1
  store i32 %110, i32* %i, align 4
  br label %74

; <label>:111                                     ; preds = %74
  %112 = load i32, i32* %j, align 4
  %113 = sext i32 %112 to i64
  %114 = load i32*, i32** %3, align 8
  %115 = getelementptr inbounds i32, i32* %114, i64 %113
  %116 = load i32, i32* %115, align 4
  store i32 %116, i32* %itmp, align 4
  %117 = load i32, i32* %k, align 4
  %118 = sext i32 %117 to i64
  %119 = load i32*, i32** %3, align 8
  %120 = getelementptr inbounds i32, i32* %119, i64 %118
  %121 = load i32, i32* %120, align 4
  %122 = load i32, i32* %j, align 4
  %123 = sext i32 %122 to i64
  %124 = load i32*, i32** %3, align 8
  %125 = getelementptr inbounds i32, i32* %124, i64 %123
  store i32 %121, i32* %125, align 4
  %126 = load i32, i32* %itmp, align 4
  %127 = load i32, i32* %k, align 4
  %128 = sext i32 %127 to i64
  %129 = load i32*, i32** %3, align 8
  %130 = getelementptr inbounds i32, i32* %129, i64 %128
  store i32 %126, i32* %130, align 4
  %131 = load i32, i32* %j, align 4
  %132 = add nsw i32 %131, 1
  store i32 %132, i32* %i, align 4
  br label %133

; <label>:133                                     ; preds = %224, %111
  %134 = load i32, i32* %i, align 4
  %135 = load i32, i32* %2, align 4
  %136 = icmp slt i32 %134, %135
  br i1 %136, label %137, label %227

; <label>:137                                     ; preds = %133
  %138 = load i32, i32* %j, align 4
  %139 = sext i32 %138 to i64
  %140 = load i32, i32* %i, align 4
  %141 = sext i32 %140 to i64
  %142 = load i32*, i32** %3, align 8
  %143 = getelementptr inbounds i32, i32* %142, i64 %141
  %144 = load i32, i32* %143, align 4
  %145 = sext i32 %144 to i64
  %146 = load [3 x double]*, [3 x double]** %1, align 8
  %147 = getelementptr inbounds [3 x double], [3 x double]* %146, i64 %145
  %148 = getelementptr inbounds [3 x double], [3 x double]* %147, i32 0, i64 %139
  %149 = load double, double* %148, align 8
  %150 = load i32, i32* %j, align 4
  %151 = sext i32 %150 to i64
  %152 = load i32, i32* %j, align 4
  %153 = sext i32 %152 to i64
  %154 = load i32*, i32** %3, align 8
  %155 = getelementptr inbounds i32, i32* %154, i64 %153
  %156 = load i32, i32* %155, align 4
  %157 = sext i32 %156 to i64
  %158 = load [3 x double]*, [3 x double]** %1, align 8
  %159 = getelementptr inbounds [3 x double], [3 x double]* %158, i64 %157
  %160 = getelementptr inbounds [3 x double], [3 x double]* %159, i32 0, i64 %151
  %161 = load double, double* %160, align 8
  %162 = fdiv double %149, %161
  store double %162, double* %pj, align 8
  %163 = load double, double* %pj, align 8
  %164 = load i32, i32* %j, align 4
  %165 = sext i32 %164 to i64
  %166 = load i32, i32* %i, align 4
  %167 = sext i32 %166 to i64
  %168 = load i32*, i32** %3, align 8
  %169 = getelementptr inbounds i32, i32* %168, i64 %167
  %170 = load i32, i32* %169, align 4
  %171 = sext i32 %170 to i64
  %172 = load [3 x double]*, [3 x double]** %1, align 8
  %173 = getelementptr inbounds [3 x double], [3 x double]* %172, i64 %171
  %174 = getelementptr inbounds [3 x double], [3 x double]* %173, i32 0, i64 %165
  store double %163, double* %174, align 8
  %175 = load i32, i32* %j, align 4
  %176 = add nsw i32 %175, 1
  store i32 %176, i32* %k, align 4
  br label %177

; <label>:177                                     ; preds = %220, %137
  %178 = load i32, i32* %k, align 4
  %179 = load i32, i32* %2, align 4
  %180 = icmp slt i32 %178, %179
  br i1 %180, label %181, label %223

; <label>:181                                     ; preds = %177
  %182 = load i32, i32* %k, align 4
  %183 = sext i32 %182 to i64
  %184 = load i32, i32* %i, align 4
  %185 = sext i32 %184 to i64
  %186 = load i32*, i32** %3, align 8
  %187 = getelementptr inbounds i32, i32* %186, i64 %185
  %188 = load i32, i32* %187, align 4
  %189 = sext i32 %188 to i64
  %190 = load [3 x double]*, [3 x double]** %1, align 8
  %191 = getelementptr inbounds [3 x double], [3 x double]* %190, i64 %189
  %192 = getelementptr inbounds [3 x double], [3 x double]* %191, i32 0, i64 %183
  %193 = load double, double* %192, align 8
  %194 = load double, double* %pj, align 8
  %195 = load i32, i32* %k, align 4
  %196 = sext i32 %195 to i64
  %197 = load i32, i32* %j, align 4
  %198 = sext i32 %197 to i64
  %199 = load i32*, i32** %3, align 8
  %200 = getelementptr inbounds i32, i32* %199, i64 %198
  %201 = load i32, i32* %200, align 4
  %202 = sext i32 %201 to i64
  %203 = load [3 x double]*, [3 x double]** %1, align 8
  %204 = getelementptr inbounds [3 x double], [3 x double]* %203, i64 %202
  %205 = getelementptr inbounds [3 x double], [3 x double]* %204, i32 0, i64 %196
  %206 = load double, double* %205, align 8
  %207 = fmul double %194, %206
  %208 = fsub double %193, %207
  %209 = load i32, i32* %k, align 4
  %210 = sext i32 %209 to i64
  %211 = load i32, i32* %i, align 4
  %212 = sext i32 %211 to i64
  %213 = load i32*, i32** %3, align 8
  %214 = getelementptr inbounds i32, i32* %213, i64 %212
  %215 = load i32, i32* %214, align 4
  %216 = sext i32 %215 to i64
  %217 = load [3 x double]*, [3 x double]** %1, align 8
  %218 = getelementptr inbounds [3 x double], [3 x double]* %217, i64 %216
  %219 = getelementptr inbounds [3 x double], [3 x double]* %218, i32 0, i64 %210
  store double %208, double* %219, align 8
  br label %220

; <label>:220                                     ; preds = %181
  %221 = load i32, i32* %k, align 4
  %222 = add nsw i32 %221, 1
  store i32 %222, i32* %k, align 4
  br label %177

; <label>:223                                     ; preds = %177
  br label %224

; <label>:224                                     ; preds = %223
  %225 = load i32, i32* %i, align 4
  %226 = add nsw i32 %225, 1
  store i32 %226, i32* %i, align 4
  br label %133

; <label>:227                                     ; preds = %133
  br label %228

; <label>:228                                     ; preds = %227
  %229 = load i32, i32* %j, align 4
  %230 = add nsw i32 %229, 1
  store i32 %230, i32* %j, align 4
  br label %67

; <label>:231                                     ; preds = %67
  ret void
}

; Function Attrs: noreturn
declare void @exit(i32) #3

; Function Attrs: nounwind readnone
declare double @fabs(double) #4

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn }
attributes #6 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
