; ModuleID = './sse.expandfft.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@x = common global [2048 x float] zeroinitializer, align 16
@z = common global [2048 x float] zeroinitializer, align 16
@w = common global [1024 x float] zeroinitializer, align 16
@y = common global [2048 x float] zeroinitializer, align 16
@.str = private unnamed_addr constant [29 x i8] c" for n=%d, fwd/bck error=%e\0A\00", align 1
@.str.1 = private unnamed_addr constant [11 x i8] c" for n=%d\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%g  \00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %first = alloca i32, align 4
  %i = alloca i32, align 4
  %icase = alloca i32, align 4
  %it = alloca i32, align 4
  %n = alloca i32, align 4
  %error = alloca double, align 8
  %fnm1 = alloca float, align 4
  %seed = alloca float, align 4
  %sign = alloca float, align 4
  %z0 = alloca float, align 4
  %z1 = alloca float, align 4
  %t1 = alloca float, align 4
  %ln2 = alloca float, align 4
  %mflops = alloca float, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %1
  store i32 1, i32* %first, align 4
  store float 3.310000e+02, float* %seed, align 4
  store i32 0, i32* %icase, align 4
  br label %2

; <label>:2                                       ; preds = %188, %0
  %3 = load i32, i32* %icase, align 4
  %4 = icmp slt i32 %3, 2
  br i1 %4, label %5, label %191

; <label>:5                                       ; preds = %2
  %6 = load i32, i32* %first, align 4
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %37

; <label>:8                                       ; preds = %5
  store i32 0, i32* %i, align 4
  br label %9

; <label>:9                                       ; preds = %33, %8
  %10 = load i32, i32* %i, align 4
  %11 = icmp slt i32 %10, 2048
  br i1 %11, label %12, label %36

; <label>:12                                      ; preds = %9
  %13 = call float @ggl(float* %seed)
  store float %13, float* %z0, align 4
  %14 = call float @ggl(float* %seed)
  store float %14, float* %z1, align 4
  %15 = load float, float* %z0, align 4
  %16 = load i32, i32* %i, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [2048 x float], [2048 x float]* @x, i32 0, i64 %17
  store float %15, float* %18, align 4
  %19 = load float, float* %z0, align 4
  %20 = load i32, i32* %i, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [2048 x float], [2048 x float]* @z, i32 0, i64 %21
  store float %19, float* %22, align 4
  %23 = load float, float* %z1, align 4
  %24 = load i32, i32* %i, align 4
  %25 = add nsw i32 %24, 1
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [2048 x float], [2048 x float]* @x, i32 0, i64 %26
  store float %23, float* %27, align 4
  %28 = load float, float* %z1, align 4
  %29 = load i32, i32* %i, align 4
  %30 = add nsw i32 %29, 1
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [2048 x float], [2048 x float]* @z, i32 0, i64 %31
  store float %28, float* %32, align 4
  br label %33

; <label>:33                                      ; preds = %12
  %34 = load i32, i32* %i, align 4
  %35 = add nsw i32 %34, 2
  store i32 %35, i32* %i, align 4
  br label %9

; <label>:36                                      ; preds = %9
  br label %64

; <label>:37                                      ; preds = %5
  store i32 0, i32* %i, align 4
  br label %38

; <label>:38                                      ; preds = %60, %37
  %39 = load i32, i32* %i, align 4
  %40 = icmp slt i32 %39, 2048
  br i1 %40, label %41, label %63

; <label>:41                                      ; preds = %38
  store float 0.000000e+00, float* %z0, align 4
  store float 0.000000e+00, float* %z1, align 4
  %42 = load float, float* %z0, align 4
  %43 = load i32, i32* %i, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [2048 x float], [2048 x float]* @x, i32 0, i64 %44
  store float %42, float* %45, align 4
  %46 = load float, float* %z0, align 4
  %47 = load i32, i32* %i, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [2048 x float], [2048 x float]* @z, i32 0, i64 %48
  store float %46, float* %49, align 4
  %50 = load float, float* %z1, align 4
  %51 = load i32, i32* %i, align 4
  %52 = add nsw i32 %51, 1
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [2048 x float], [2048 x float]* @x, i32 0, i64 %53
  store float %50, float* %54, align 4
  %55 = load float, float* %z1, align 4
  %56 = load i32, i32* %i, align 4
  %57 = add nsw i32 %56, 1
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [2048 x float], [2048 x float]* @z, i32 0, i64 %58
  store float %55, float* %59, align 4
  br label %60

; <label>:60                                      ; preds = %41
  %61 = load i32, i32* %i, align 4
  %62 = add nsw i32 %61, 2
  store i32 %62, i32* %i, align 4
  br label %38

; <label>:63                                      ; preds = %38
  br label %64

; <label>:64                                      ; preds = %63, %36
  store i32 1024, i32* %n, align 4
  %65 = load i32, i32* %n, align 4
  call void (i32, float*, ...) bitcast (void (i32, [2 x float]*)* @cffti to void (i32, float*, ...)*)(i32 %65, float* getelementptr inbounds ([1024 x float], [1024 x float]* @w, i32 0, i32 0))
  %66 = load i32, i32* %first, align 4
  %67 = icmp ne i32 %66, 0
  br i1 %67, label %68, label %149

; <label>:68                                      ; preds = %64
  store float 1.000000e+00, float* %sign, align 4
  %69 = load i32, i32* %n, align 4
  %70 = load float, float* %sign, align 4
  %71 = fpext float %70 to double
  call void (i32, float*, float*, float*, double, ...) bitcast (void (i32, [2 x float]*, [2 x float]*, [2 x float]*, double)* @cfft2 to void (i32, float*, float*, float*, double, ...)*)(i32 %69, float* getelementptr inbounds ([2048 x float], [2048 x float]* @x, i32 0, i32 0), float* getelementptr inbounds ([2048 x float], [2048 x float]* @y, i32 0, i32 0), float* getelementptr inbounds ([1024 x float], [1024 x float]* @w, i32 0, i32 0), double %71)
  store float -1.000000e+00, float* %sign, align 4
  %72 = load i32, i32* %n, align 4
  %73 = load float, float* %sign, align 4
  %74 = fpext float %73 to double
  call void (i32, float*, float*, float*, double, ...) bitcast (void (i32, [2 x float]*, [2 x float]*, [2 x float]*, double)* @cfft2 to void (i32, float*, float*, float*, double, ...)*)(i32 %72, float* getelementptr inbounds ([2048 x float], [2048 x float]* @y, i32 0, i32 0), float* getelementptr inbounds ([2048 x float], [2048 x float]* @x, i32 0, i32 0), float* getelementptr inbounds ([1024 x float], [1024 x float]* @w, i32 0, i32 0), double %74)
  %75 = load i32, i32* %n, align 4
  %76 = sitofp i32 %75 to float
  %77 = fpext float %76 to double
  %78 = fdiv double 1.000000e+00, %77
  %79 = fptrunc double %78 to float
  store float %79, float* %fnm1, align 4
  store double 0.000000e+00, double* %error, align 8
  store i32 0, i32* %i, align 4
  br label %80

; <label>:80                                      ; preds = %138, %68
  %81 = load i32, i32* %i, align 4
  %82 = icmp slt i32 %81, 2048
  br i1 %82, label %83, label %141

; <label>:83                                      ; preds = %80
  %84 = load i32, i32* %i, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [2048 x float], [2048 x float]* @z, i32 0, i64 %85
  %87 = load float, float* %86, align 4
  %88 = load float, float* %fnm1, align 4
  %89 = load i32, i32* %i, align 4
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds [2048 x float], [2048 x float]* @x, i32 0, i64 %90
  %92 = load float, float* %91, align 4
  %93 = fmul float %88, %92
  %94 = fsub float %87, %93
  %95 = load i32, i32* %i, align 4
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds [2048 x float], [2048 x float]* @z, i32 0, i64 %96
  %98 = load float, float* %97, align 4
  %99 = load float, float* %fnm1, align 4
  %100 = load i32, i32* %i, align 4
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds [2048 x float], [2048 x float]* @x, i32 0, i64 %101
  %103 = load float, float* %102, align 4
  %104 = fmul float %99, %103
  %105 = fsub float %98, %104
  %106 = fmul float %94, %105
  %107 = load i32, i32* %i, align 4
  %108 = add nsw i32 %107, 1
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds [2048 x float], [2048 x float]* @z, i32 0, i64 %109
  %111 = load float, float* %110, align 4
  %112 = load float, float* %fnm1, align 4
  %113 = load i32, i32* %i, align 4
  %114 = add nsw i32 %113, 1
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds [2048 x float], [2048 x float]* @x, i32 0, i64 %115
  %117 = load float, float* %116, align 4
  %118 = fmul float %112, %117
  %119 = fsub float %111, %118
  %120 = load i32, i32* %i, align 4
  %121 = add nsw i32 %120, 1
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds [2048 x float], [2048 x float]* @z, i32 0, i64 %122
  %124 = load float, float* %123, align 4
  %125 = load float, float* %fnm1, align 4
  %126 = load i32, i32* %i, align 4
  %127 = add nsw i32 %126, 1
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds [2048 x float], [2048 x float]* @x, i32 0, i64 %128
  %130 = load float, float* %129, align 4
  %131 = fmul float %125, %130
  %132 = fsub float %124, %131
  %133 = fmul float %119, %132
  %134 = fadd float %106, %133
  %135 = fpext float %134 to double
  %136 = load double, double* %error, align 8
  %137 = fadd double %136, %135
  store double %137, double* %error, align 8
  br label %138

; <label>:138                                     ; preds = %83
  %139 = load i32, i32* %i, align 4
  %140 = add nsw i32 %139, 2
  store i32 %140, i32* %i, align 4
  br label %80

; <label>:141                                     ; preds = %80
  %142 = load float, float* %fnm1, align 4
  %143 = fpext float %142 to double
  %144 = load double, double* %error, align 8
  %145 = fmul double %143, %144
  %146 = call double @sqrt(double %145) #3
  store double %146, double* %error, align 8
  %147 = load double, double* %error, align 8
  %148 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str, i32 0, i32 0), i32 1024, double %147)
  store i32 0, i32* %first, align 4
  br label %187

; <label>:149                                     ; preds = %64
  store i32 0, i32* %j, align 4
  store i32 0, i32* %it, align 4
  br label %150

; <label>:150                                     ; preds = %160, %149
  %151 = load i32, i32* %it, align 4
  %152 = icmp slt i32 %151, 20000
  br i1 %152, label %153, label %163

; <label>:153                                     ; preds = %150
  store float 1.000000e+00, float* %sign, align 4
  %154 = load i32, i32* %n, align 4
  %155 = load float, float* %sign, align 4
  %156 = fpext float %155 to double
  call void (i32, float*, float*, float*, double, ...) bitcast (void (i32, [2 x float]*, [2 x float]*, [2 x float]*, double)* @cfft2 to void (i32, float*, float*, float*, double, ...)*)(i32 %154, float* getelementptr inbounds ([2048 x float], [2048 x float]* @x, i32 0, i32 0), float* getelementptr inbounds ([2048 x float], [2048 x float]* @y, i32 0, i32 0), float* getelementptr inbounds ([1024 x float], [1024 x float]* @w, i32 0, i32 0), double %156)
  store float -1.000000e+00, float* %sign, align 4
  %157 = load i32, i32* %n, align 4
  %158 = load float, float* %sign, align 4
  %159 = fpext float %158 to double
  call void (i32, float*, float*, float*, double, ...) bitcast (void (i32, [2 x float]*, [2 x float]*, [2 x float]*, double)* @cfft2 to void (i32, float*, float*, float*, double, ...)*)(i32 %157, float* getelementptr inbounds ([2048 x float], [2048 x float]* @y, i32 0, i32 0), float* getelementptr inbounds ([2048 x float], [2048 x float]* @x, i32 0, i32 0), float* getelementptr inbounds ([1024 x float], [1024 x float]* @w, i32 0, i32 0), double %159)
  br label %160

; <label>:160                                     ; preds = %153
  %161 = load i32, i32* %it, align 4
  %162 = add nsw i32 %161, 1
  store i32 %162, i32* %it, align 4
  br label %150

; <label>:163                                     ; preds = %150
  %164 = load i32, i32* %n, align 4
  %165 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 %164)
  store i32 0, i32* %i, align 4
  br label %166

; <label>:166                                     ; preds = %183, %163
  %167 = load i32, i32* %i, align 4
  %168 = icmp slt i32 %167, 1024
  br i1 %168, label %169, label %186

; <label>:169                                     ; preds = %166
  %170 = load i32, i32* %i, align 4
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds [1024 x float], [1024 x float]* @w, i32 0, i64 %171
  %173 = load float, float* %172, align 4
  %174 = fpext float %173 to double
  %175 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), double %174)
  %176 = load i32, i32* %j, align 4
  %177 = add i32 %176, 1
  store i32 %177, i32* %j, align 4
  %178 = load i32, i32* %j, align 4
  %179 = icmp eq i32 %178, 4
  br i1 %179, label %180, label %182

; <label>:180                                     ; preds = %169
  %181 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  store i32 0, i32* %j, align 4
  br label %182

; <label>:182                                     ; preds = %180, %169
  br label %183

; <label>:183                                     ; preds = %182
  %184 = load i32, i32* %i, align 4
  %185 = add nsw i32 %184, 1
  store i32 %185, i32* %i, align 4
  br label %166

; <label>:186                                     ; preds = %166
  br label %187

; <label>:187                                     ; preds = %186, %141
  br label %188

; <label>:188                                     ; preds = %187
  %189 = load i32, i32* %icase, align 4
  %190 = add nsw i32 %189, 1
  store i32 %190, i32* %icase, align 4
  br label %2

; <label>:191                                     ; preds = %2
  ret i32 0
}

; Function Attrs: nounwind
declare double @sqrt(double) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @cfft2(i32 %n, [2 x float]* %x, [2 x float]* %y, [2 x float]* %w, double) #0 {
  %2 = alloca float*, align 8
  %3 = alloca float*, align 8
  %4 = alloca float*, align 8
  %5 = alloca <4 x float>, align 16
  %6 = alloca <4 x float>, align 16
  %7 = alloca float*, align 8
  %8 = alloca <4 x float>, align 16
  %9 = alloca <4 x float>, align 16
  %10 = alloca <4 x float>, align 16
  %11 = alloca <4 x float>, align 16
  %12 = alloca <4 x float>, align 16
  %13 = alloca <4 x float>, align 16
  %14 = alloca <4 x float>, align 16
  %15 = alloca <4 x float>, align 16
  %16 = alloca <4 x float>, align 16
  %17 = alloca float*, align 8
  %18 = alloca <4 x float>, align 16
  %19 = alloca float*, align 8
  %20 = alloca float*, align 8
  %21 = alloca float*, align 8
  %22 = alloca float*, align 8
  %23 = alloca <4 x float>, align 16
  %24 = alloca <4 x float>, align 16
  %25 = alloca float*, align 8
  %26 = alloca <4 x float>, align 16
  %27 = alloca <4 x float>, align 16
  %28 = alloca <4 x float>, align 16
  %29 = alloca <4 x float>, align 16
  %30 = alloca <4 x float>, align 16
  %31 = alloca <4 x float>, align 16
  %32 = alloca <4 x float>, align 16
  %33 = alloca <4 x float>, align 16
  %34 = alloca <4 x float>, align 16
  %35 = alloca float*, align 8
  %36 = alloca <4 x float>, align 16
  %37 = alloca float*, align 8
  %38 = alloca float*, align 8
  %39 = alloca <4 x float>, align 16
  %40 = alloca <4 x float>, align 16
  %41 = alloca float*, align 8
  %42 = alloca <4 x float>, align 16
  %43 = alloca <4 x float>, align 16
  %44 = alloca <4 x float>, align 16
  %45 = alloca <4 x float>, align 16
  %46 = alloca <4 x float>, align 16
  %47 = alloca <4 x float>, align 16
  %48 = alloca <4 x float>, align 16
  %49 = alloca <4 x float>, align 16
  %50 = alloca <4 x float>, align 16
  %51 = alloca float*, align 8
  %52 = alloca <4 x float>, align 16
  %53 = alloca float*, align 8
  %54 = alloca float*, align 8
  %55 = alloca <4 x float>, align 16
  %56 = alloca <4 x float>, align 16
  %57 = alloca float*, align 8
  %58 = alloca <4 x float>, align 16
  %59 = alloca <4 x float>, align 16
  %60 = alloca <4 x float>, align 16
  %61 = alloca float*, align 8
  %62 = alloca <4 x float>, align 16
  %63 = alloca float*, align 8
  %64 = alloca float*, align 8
  %65 = alloca <4 x float>, align 16
  %66 = alloca <4 x float>, align 16
  %67 = alloca float*, align 8
  %68 = alloca <4 x float>, align 16
  %69 = alloca <4 x float>, align 16
  %70 = alloca <4 x float>, align 16
  %71 = alloca float*, align 8
  %72 = alloca <4 x float>, align 16
  %73 = alloca float*, align 8
  %74 = alloca i32, align 4
  %75 = alloca [2 x float]*, align 8
  %76 = alloca [2 x float]*, align 8
  %77 = alloca [2 x float]*, align 8
  %78 = alloca float, align 4
  %jb = alloca i32, align 4
  %jc = alloca i32, align 4
  %jw = alloca i32, align 4
  %k = alloca i32, align 4
  %k2 = alloca i32, align 4
  %lj = alloca i32, align 4
  %m = alloca i32, align 4
  %j = alloca i32, align 4
  %mj = alloca i32, align 4
  %mj2 = alloca i32, align 4
  %pass = alloca i32, align 4
  %tgle = alloca i32, align 4
  %a = alloca [2 x float]*, align 8
  %b = alloca [2 x float]*, align 8
  %c = alloca [2 x float]*, align 8
  %d = alloca [2 x float]*, align 8
  %aa = alloca [2 x float]*, align 8
  %bb = alloca [2 x float]*, align 8
  %cb = alloca [2 x float]*, align 8
  %dd = alloca [2 x float]*, align 8
  %rp = alloca float, align 4
  %up = alloca float, align 4
  %wr = alloca [4 x float], align 16
  %wu = alloca [4 x float], align 16
  %V0 = alloca <4 x float>, align 16
  %V1 = alloca <4 x float>, align 16
  %V2 = alloca <4 x float>, align 16
  %V3 = alloca <4 x float>, align 16
  %V4 = alloca <4 x float>, align 16
  %V5 = alloca <4 x float>, align 16
  %V6 = alloca <4 x float>, align 16
  %V7 = alloca <4 x float>, align 16
  %V8 = alloca <4 x float>, align 16
  %V9 = alloca <4 x float>, align 16
  %V10 = alloca <4 x float>, align 16
  %V11 = alloca <4 x float>, align 16
  %V12 = alloca <4 x float>, align 16
  %V13 = alloca <4 x float>, align 16
  %V14 = alloca <4 x float>, align 16
  %V15 = alloca <4 x float>, align 16
  %__a = alloca <4 x float>, align 16
  %__b = alloca <4 x float>, align 16
  %79 = alloca <4 x float>, align 16
  %__a1 = alloca <4 x float>, align 16
  %__b2 = alloca <4 x float>, align 16
  %80 = alloca <4 x float>, align 16
  %__a3 = alloca <4 x float>, align 16
  %__b4 = alloca <4 x float>, align 16
  %81 = alloca <4 x float>, align 16
  %sign = fptrunc double %0 to float
  store i32 %n, i32* %74, align 4
  store [2 x float]* %x, [2 x float]** %75, align 8
  store [2 x float]* %y, [2 x float]** %76, align 8
  store [2 x float]* %w, [2 x float]** %77, align 8
  store float %sign, float* %78, align 4
  %82 = load i32, i32* %74, align 4
  %83 = icmp sle i32 %82, 1
  br i1 %83, label %84, label %99

; <label>:84                                      ; preds = %1
  %85 = load [2 x float]*, [2 x float]** %75, align 8
  %86 = getelementptr inbounds [2 x float], [2 x float]* %85, i64 0
  %87 = getelementptr inbounds [2 x float], [2 x float]* %86, i32 0, i64 0
  %88 = load float, float* %87, align 4
  %89 = load [2 x float]*, [2 x float]** %76, align 8
  %90 = getelementptr inbounds [2 x float], [2 x float]* %89, i64 0
  %91 = getelementptr inbounds [2 x float], [2 x float]* %90, i32 0, i64 0
  store float %88, float* %91, align 4
  %92 = load [2 x float]*, [2 x float]** %75, align 8
  %93 = getelementptr inbounds [2 x float], [2 x float]* %92, i64 0
  %94 = getelementptr inbounds [2 x float], [2 x float]* %93, i32 0, i64 1
  %95 = load float, float* %94, align 4
  %96 = load [2 x float]*, [2 x float]** %76, align 8
  %97 = getelementptr inbounds [2 x float], [2 x float]* %96, i64 0
  %98 = getelementptr inbounds [2 x float], [2 x float]* %97, i32 0, i64 1
  store float %95, float* %98, align 4
  br label %886

; <label>:99                                      ; preds = %1
  %100 = load i32, i32* %74, align 4
  %101 = sitofp i32 %100 to float
  %102 = fpext float %101 to double
  %103 = call double @log(double %102) #3
  %104 = call double @log(double 1.990000e+00) #3
  %105 = fdiv double %103, %104
  %106 = fptosi double %105 to i32
  store i32 %106, i32* %m, align 4
  store i32 1, i32* %mj, align 4
  store i32 2, i32* %mj2, align 4
  %107 = load i32, i32* %74, align 4
  %108 = sdiv i32 %107, 2
  store i32 %108, i32* %lj, align 4
  %109 = load [2 x float]*, [2 x float]** %75, align 8
  %110 = getelementptr inbounds [2 x float], [2 x float]* %109, i64 0
  %111 = getelementptr inbounds [2 x float], [2 x float]* %110, i32 0, i64 0
  %112 = bitcast float* %111 to i8*
  %113 = bitcast i8* %112 to [2 x float]*
  store [2 x float]* %113, [2 x float]** %a, align 8
  %114 = load i32, i32* %74, align 4
  %115 = sdiv i32 %114, 2
  %116 = sext i32 %115 to i64
  %117 = load [2 x float]*, [2 x float]** %75, align 8
  %118 = getelementptr inbounds [2 x float], [2 x float]* %117, i64 %116
  %119 = getelementptr inbounds [2 x float], [2 x float]* %118, i32 0, i64 0
  %120 = bitcast float* %119 to i8*
  %121 = bitcast i8* %120 to [2 x float]*
  store [2 x float]* %121, [2 x float]** %b, align 8
  %122 = load [2 x float]*, [2 x float]** %76, align 8
  %123 = getelementptr inbounds [2 x float], [2 x float]* %122, i64 0
  %124 = getelementptr inbounds [2 x float], [2 x float]* %123, i32 0, i64 0
  %125 = bitcast float* %124 to i8*
  %126 = bitcast i8* %125 to [2 x float]*
  store [2 x float]* %126, [2 x float]** %c, align 8
  %127 = load [2 x float]*, [2 x float]** %76, align 8
  %128 = getelementptr inbounds [2 x float], [2 x float]* %127, i64 1
  %129 = getelementptr inbounds [2 x float], [2 x float]* %128, i32 0, i64 0
  %130 = bitcast float* %129 to i8*
  %131 = bitcast i8* %130 to [2 x float]*
  store [2 x float]* %131, [2 x float]** %d, align 8
  store i32 0, i32* %j, align 4
  br label %132

; <label>:132                                     ; preds = %267, %99
  %133 = load i32, i32* %j, align 4
  %134 = load i32, i32* %lj, align 4
  %135 = icmp slt i32 %133, %134
  br i1 %135, label %136, label %270

; <label>:136                                     ; preds = %132
  %137 = load i32, i32* %j, align 4
  %138 = load i32, i32* %mj2, align 4
  %139 = mul nsw i32 %137, %138
  store i32 %139, i32* %jc, align 4
  %140 = load i32, i32* %j, align 4
  %141 = sext i32 %140 to i64
  %142 = load [2 x float]*, [2 x float]** %77, align 8
  %143 = getelementptr inbounds [2 x float], [2 x float]* %142, i64 %141
  %144 = getelementptr inbounds [2 x float], [2 x float]* %143, i32 0, i64 0
  %145 = load float, float* %144, align 4
  store float %145, float* %rp, align 4
  %146 = load i32, i32* %j, align 4
  %147 = sext i32 %146 to i64
  %148 = load [2 x float]*, [2 x float]** %77, align 8
  %149 = getelementptr inbounds [2 x float], [2 x float]* %148, i64 %147
  %150 = getelementptr inbounds [2 x float], [2 x float]* %149, i32 0, i64 1
  %151 = load float, float* %150, align 4
  store float %151, float* %up, align 4
  %152 = load float, float* %78, align 4
  %153 = fpext float %152 to double
  %154 = fcmp olt double %153, 0.000000e+00
  br i1 %154, label %155, label %158

; <label>:155                                     ; preds = %136
  %156 = load float, float* %up, align 4
  %157 = fsub float -0.000000e+00, %156
  store float %157, float* %up, align 4
  br label %158

; <label>:158                                     ; preds = %155, %136
  %159 = load float, float* %rp, align 4
  %160 = load i32, i32* %j, align 4
  %161 = sext i32 %160 to i64
  %162 = load [2 x float]*, [2 x float]** %a, align 8
  %163 = getelementptr inbounds [2 x float], [2 x float]* %162, i64 %161
  %164 = getelementptr inbounds [2 x float], [2 x float]* %163, i32 0, i64 0
  %165 = load float, float* %164, align 4
  %166 = load i32, i32* %j, align 4
  %167 = sext i32 %166 to i64
  %168 = load [2 x float]*, [2 x float]** %b, align 8
  %169 = getelementptr inbounds [2 x float], [2 x float]* %168, i64 %167
  %170 = getelementptr inbounds [2 x float], [2 x float]* %169, i32 0, i64 0
  %171 = load float, float* %170, align 4
  %172 = fsub float %165, %171
  %173 = fmul float %159, %172
  %174 = load float, float* %up, align 4
  %175 = load i32, i32* %j, align 4
  %176 = sext i32 %175 to i64
  %177 = load [2 x float]*, [2 x float]** %a, align 8
  %178 = getelementptr inbounds [2 x float], [2 x float]* %177, i64 %176
  %179 = getelementptr inbounds [2 x float], [2 x float]* %178, i32 0, i64 1
  %180 = load float, float* %179, align 4
  %181 = load i32, i32* %j, align 4
  %182 = sext i32 %181 to i64
  %183 = load [2 x float]*, [2 x float]** %b, align 8
  %184 = getelementptr inbounds [2 x float], [2 x float]* %183, i64 %182
  %185 = getelementptr inbounds [2 x float], [2 x float]* %184, i32 0, i64 1
  %186 = load float, float* %185, align 4
  %187 = fsub float %180, %186
  %188 = fmul float %174, %187
  %189 = fsub float %173, %188
  %190 = load i32, i32* %jc, align 4
  %191 = sext i32 %190 to i64
  %192 = load [2 x float]*, [2 x float]** %d, align 8
  %193 = getelementptr inbounds [2 x float], [2 x float]* %192, i64 %191
  %194 = getelementptr inbounds [2 x float], [2 x float]* %193, i32 0, i64 0
  store float %189, float* %194, align 4
  %195 = load float, float* %up, align 4
  %196 = load i32, i32* %j, align 4
  %197 = sext i32 %196 to i64
  %198 = load [2 x float]*, [2 x float]** %a, align 8
  %199 = getelementptr inbounds [2 x float], [2 x float]* %198, i64 %197
  %200 = getelementptr inbounds [2 x float], [2 x float]* %199, i32 0, i64 0
  %201 = load float, float* %200, align 4
  %202 = load i32, i32* %j, align 4
  %203 = sext i32 %202 to i64
  %204 = load [2 x float]*, [2 x float]** %b, align 8
  %205 = getelementptr inbounds [2 x float], [2 x float]* %204, i64 %203
  %206 = getelementptr inbounds [2 x float], [2 x float]* %205, i32 0, i64 0
  %207 = load float, float* %206, align 4
  %208 = fsub float %201, %207
  %209 = fmul float %195, %208
  %210 = load float, float* %rp, align 4
  %211 = load i32, i32* %j, align 4
  %212 = sext i32 %211 to i64
  %213 = load [2 x float]*, [2 x float]** %a, align 8
  %214 = getelementptr inbounds [2 x float], [2 x float]* %213, i64 %212
  %215 = getelementptr inbounds [2 x float], [2 x float]* %214, i32 0, i64 1
  %216 = load float, float* %215, align 4
  %217 = load i32, i32* %j, align 4
  %218 = sext i32 %217 to i64
  %219 = load [2 x float]*, [2 x float]** %b, align 8
  %220 = getelementptr inbounds [2 x float], [2 x float]* %219, i64 %218
  %221 = getelementptr inbounds [2 x float], [2 x float]* %220, i32 0, i64 1
  %222 = load float, float* %221, align 4
  %223 = fsub float %216, %222
  %224 = fmul float %210, %223
  %225 = fadd float %209, %224
  %226 = load i32, i32* %jc, align 4
  %227 = sext i32 %226 to i64
  %228 = load [2 x float]*, [2 x float]** %d, align 8
  %229 = getelementptr inbounds [2 x float], [2 x float]* %228, i64 %227
  %230 = getelementptr inbounds [2 x float], [2 x float]* %229, i32 0, i64 1
  store float %225, float* %230, align 4
  %231 = load i32, i32* %j, align 4
  %232 = sext i32 %231 to i64
  %233 = load [2 x float]*, [2 x float]** %a, align 8
  %234 = getelementptr inbounds [2 x float], [2 x float]* %233, i64 %232
  %235 = getelementptr inbounds [2 x float], [2 x float]* %234, i32 0, i64 0
  %236 = load float, float* %235, align 4
  %237 = load i32, i32* %j, align 4
  %238 = sext i32 %237 to i64
  %239 = load [2 x float]*, [2 x float]** %b, align 8
  %240 = getelementptr inbounds [2 x float], [2 x float]* %239, i64 %238
  %241 = getelementptr inbounds [2 x float], [2 x float]* %240, i32 0, i64 0
  %242 = load float, float* %241, align 4
  %243 = fadd float %236, %242
  %244 = load i32, i32* %jc, align 4
  %245 = sext i32 %244 to i64
  %246 = load [2 x float]*, [2 x float]** %c, align 8
  %247 = getelementptr inbounds [2 x float], [2 x float]* %246, i64 %245
  %248 = getelementptr inbounds [2 x float], [2 x float]* %247, i32 0, i64 0
  store float %243, float* %248, align 4
  %249 = load i32, i32* %j, align 4
  %250 = sext i32 %249 to i64
  %251 = load [2 x float]*, [2 x float]** %a, align 8
  %252 = getelementptr inbounds [2 x float], [2 x float]* %251, i64 %250
  %253 = getelementptr inbounds [2 x float], [2 x float]* %252, i32 0, i64 1
  %254 = load float, float* %253, align 4
  %255 = load i32, i32* %j, align 4
  %256 = sext i32 %255 to i64
  %257 = load [2 x float]*, [2 x float]** %b, align 8
  %258 = getelementptr inbounds [2 x float], [2 x float]* %257, i64 %256
  %259 = getelementptr inbounds [2 x float], [2 x float]* %258, i32 0, i64 1
  %260 = load float, float* %259, align 4
  %261 = fadd float %254, %260
  %262 = load i32, i32* %jc, align 4
  %263 = sext i32 %262 to i64
  %264 = load [2 x float]*, [2 x float]** %c, align 8
  %265 = getelementptr inbounds [2 x float], [2 x float]* %264, i64 %263
  %266 = getelementptr inbounds [2 x float], [2 x float]* %265, i32 0, i64 1
  store float %261, float* %266, align 4
  br label %267

; <label>:267                                     ; preds = %158
  %268 = load i32, i32* %j, align 4
  %269 = add nsw i32 %268, 1
  store i32 %269, i32* %j, align 4
  br label %132

; <label>:270                                     ; preds = %132
  %271 = load i32, i32* %74, align 4
  %272 = icmp eq i32 %271, 2
  br i1 %272, label %273, label %274

; <label>:273                                     ; preds = %270
  br label %886

; <label>:274                                     ; preds = %270
  store i32 2, i32* %mj, align 4
  store i32 4, i32* %mj2, align 4
  %275 = load i32, i32* %74, align 4
  %276 = sdiv i32 %275, 4
  store i32 %276, i32* %lj, align 4
  %277 = load [2 x float]*, [2 x float]** %76, align 8
  %278 = getelementptr inbounds [2 x float], [2 x float]* %277, i64 0
  %279 = getelementptr inbounds [2 x float], [2 x float]* %278, i32 0, i64 0
  %280 = bitcast float* %279 to i8*
  %281 = bitcast i8* %280 to [2 x float]*
  store [2 x float]* %281, [2 x float]** %a, align 8
  %282 = load i32, i32* %74, align 4
  %283 = sdiv i32 %282, 2
  %284 = sext i32 %283 to i64
  %285 = load [2 x float]*, [2 x float]** %76, align 8
  %286 = getelementptr inbounds [2 x float], [2 x float]* %285, i64 %284
  %287 = getelementptr inbounds [2 x float], [2 x float]* %286, i32 0, i64 0
  %288 = bitcast float* %287 to i8*
  %289 = bitcast i8* %288 to [2 x float]*
  store [2 x float]* %289, [2 x float]** %b, align 8
  %290 = load [2 x float]*, [2 x float]** %75, align 8
  %291 = getelementptr inbounds [2 x float], [2 x float]* %290, i64 0
  %292 = getelementptr inbounds [2 x float], [2 x float]* %291, i32 0, i64 0
  %293 = bitcast float* %292 to i8*
  %294 = bitcast i8* %293 to [2 x float]*
  store [2 x float]* %294, [2 x float]** %c, align 8
  %295 = load i32, i32* %mj, align 4
  %296 = sext i32 %295 to i64
  %297 = load [2 x float]*, [2 x float]** %75, align 8
  %298 = getelementptr inbounds [2 x float], [2 x float]* %297, i64 %296
  %299 = getelementptr inbounds [2 x float], [2 x float]* %298, i32 0, i64 0
  %300 = bitcast float* %299 to i8*
  %301 = bitcast i8* %300 to [2 x float]*
  store [2 x float]* %301, [2 x float]** %d, align 8
  %302 = load i32, i32* %74, align 4
  %303 = icmp eq i32 %302, 4
  br i1 %303, label %304, label %317

; <label>:304                                     ; preds = %274
  %305 = load [2 x float]*, [2 x float]** %76, align 8
  %306 = getelementptr inbounds [2 x float], [2 x float]* %305, i64 0
  %307 = getelementptr inbounds [2 x float], [2 x float]* %306, i32 0, i64 0
  %308 = bitcast float* %307 to i8*
  %309 = bitcast i8* %308 to [2 x float]*
  store [2 x float]* %309, [2 x float]** %c, align 8
  %310 = load i32, i32* %mj, align 4
  %311 = sext i32 %310 to i64
  %312 = load [2 x float]*, [2 x float]** %76, align 8
  %313 = getelementptr inbounds [2 x float], [2 x float]* %312, i64 %311
  %314 = getelementptr inbounds [2 x float], [2 x float]* %313, i32 0, i64 0
  %315 = bitcast float* %314 to i8*
  %316 = bitcast i8* %315 to [2 x float]*
  store [2 x float]* %316, [2 x float]** %d, align 8
  br label %317

; <label>:317                                     ; preds = %304, %274
  store i32 0, i32* %j, align 4
  br label %318

; <label>:318                                     ; preds = %439, %317
  %319 = load i32, i32* %j, align 4
  %320 = load i32, i32* %lj, align 4
  %321 = icmp slt i32 %319, %320
  br i1 %321, label %322, label %442

; <label>:322                                     ; preds = %318
  %323 = load i32, i32* %j, align 4
  %324 = load i32, i32* %mj, align 4
  %325 = mul nsw i32 %323, %324
  store i32 %325, i32* %jw, align 4
  %326 = load i32, i32* %j, align 4
  %327 = load i32, i32* %mj2, align 4
  %328 = mul nsw i32 %326, %327
  store i32 %328, i32* %jc, align 4
  %329 = load i32, i32* %jw, align 4
  %330 = sext i32 %329 to i64
  %331 = load [2 x float]*, [2 x float]** %77, align 8
  %332 = getelementptr inbounds [2 x float], [2 x float]* %331, i64 %330
  %333 = getelementptr inbounds [2 x float], [2 x float]* %332, i32 0, i64 0
  %334 = load float, float* %333, align 4
  store float %334, float* %rp, align 4
  %335 = load i32, i32* %jw, align 4
  %336 = sext i32 %335 to i64
  %337 = load [2 x float]*, [2 x float]** %77, align 8
  %338 = getelementptr inbounds [2 x float], [2 x float]* %337, i64 %336
  %339 = getelementptr inbounds [2 x float], [2 x float]* %338, i32 0, i64 1
  %340 = load float, float* %339, align 4
  store float %340, float* %up, align 4
  %341 = load float, float* %78, align 4
  %342 = fpext float %341 to double
  %343 = fcmp olt double %342, 0.000000e+00
  br i1 %343, label %344, label %347

; <label>:344                                     ; preds = %322
  %345 = load float, float* %up, align 4
  %346 = fsub float -0.000000e+00, %345
  store float %346, float* %up, align 4
  br label %347

; <label>:347                                     ; preds = %344, %322
  %348 = load float, float* %rp, align 4
  %349 = getelementptr inbounds [4 x float], [4 x float]* %wr, i32 0, i64 0
  store float %348, float* %349, align 4
  %350 = load float, float* %rp, align 4
  %351 = getelementptr inbounds [4 x float], [4 x float]* %wr, i32 0, i64 1
  store float %350, float* %351, align 4
  %352 = load float, float* %rp, align 4
  %353 = getelementptr inbounds [4 x float], [4 x float]* %wr, i32 0, i64 2
  store float %352, float* %353, align 4
  %354 = load float, float* %rp, align 4
  %355 = getelementptr inbounds [4 x float], [4 x float]* %wr, i32 0, i64 3
  store float %354, float* %355, align 4
  %356 = load float, float* %up, align 4
  %357 = fsub float -0.000000e+00, %356
  %358 = getelementptr inbounds [4 x float], [4 x float]* %wu, i32 0, i64 0
  store float %357, float* %358, align 4
  %359 = load float, float* %up, align 4
  %360 = getelementptr inbounds [4 x float], [4 x float]* %wu, i32 0, i64 1
  store float %359, float* %360, align 4
  %361 = load float, float* %up, align 4
  %362 = fsub float -0.000000e+00, %361
  %363 = getelementptr inbounds [4 x float], [4 x float]* %wu, i32 0, i64 2
  store float %362, float* %363, align 4
  %364 = load float, float* %up, align 4
  %365 = getelementptr inbounds [4 x float], [4 x float]* %wu, i32 0, i64 3
  store float %364, float* %365, align 4
  %366 = getelementptr inbounds [4 x float], [4 x float]* %wr, i32 0, i32 0
  store float* %366, float** %73, align 8
  %367 = load float*, float** %73, align 8
  %368 = bitcast float* %367 to <4 x float>*
  %369 = load <4 x float>, <4 x float>* %368, align 16
  store <4 x float> %369, <4 x float>* %V6, align 16
  %370 = getelementptr inbounds [4 x float], [4 x float]* %wu, i32 0, i32 0
  store float* %370, float** %2, align 8
  %371 = load float*, float** %2, align 8
  %372 = bitcast float* %371 to <4 x float>*
  %373 = load <4 x float>, <4 x float>* %372, align 16
  store <4 x float> %373, <4 x float>* %V7, align 16
  %374 = load i32, i32* %jw, align 4
  %375 = sext i32 %374 to i64
  %376 = load [2 x float]*, [2 x float]** %a, align 8
  %377 = getelementptr inbounds [2 x float], [2 x float]* %376, i64 %375
  %378 = getelementptr inbounds [2 x float], [2 x float]* %377, i32 0, i64 0
  store float* %378, float** %3, align 8
  %379 = load float*, float** %3, align 8
  %380 = bitcast float* %379 to <4 x float>*
  %381 = load <4 x float>, <4 x float>* %380, align 16
  store <4 x float> %381, <4 x float>* %V0, align 16
  %382 = load i32, i32* %jw, align 4
  %383 = sext i32 %382 to i64
  %384 = load [2 x float]*, [2 x float]** %b, align 8
  %385 = getelementptr inbounds [2 x float], [2 x float]* %384, i64 %383
  %386 = getelementptr inbounds [2 x float], [2 x float]* %385, i32 0, i64 0
  store float* %386, float** %4, align 8
  %387 = load float*, float** %4, align 8
  %388 = bitcast float* %387 to <4 x float>*
  %389 = load <4 x float>, <4 x float>* %388, align 16
  store <4 x float> %389, <4 x float>* %V1, align 16
  %390 = load <4 x float>, <4 x float>* %V0, align 16
  %391 = load <4 x float>, <4 x float>* %V1, align 16
  store <4 x float> %390, <4 x float>* %5, align 16
  store <4 x float> %391, <4 x float>* %6, align 16
  %392 = load <4 x float>, <4 x float>* %5, align 16
  %393 = load <4 x float>, <4 x float>* %6, align 16
  %394 = fadd <4 x float> %392, %393
  store <4 x float> %394, <4 x float>* %V2, align 16
  %395 = load i32, i32* %jc, align 4
  %396 = sext i32 %395 to i64
  %397 = load [2 x float]*, [2 x float]** %c, align 8
  %398 = getelementptr inbounds [2 x float], [2 x float]* %397, i64 %396
  %399 = getelementptr inbounds [2 x float], [2 x float]* %398, i32 0, i64 0
  %400 = load <4 x float>, <4 x float>* %V2, align 16
  store float* %399, float** %7, align 8
  store <4 x float> %400, <4 x float>* %8, align 16
  %401 = load <4 x float>, <4 x float>* %8, align 16
  %402 = load float*, float** %7, align 8
  %403 = bitcast float* %402 to <4 x float>*
  store <4 x float> %401, <4 x float>* %403, align 16
  %404 = load <4 x float>, <4 x float>* %V0, align 16
  %405 = load <4 x float>, <4 x float>* %V1, align 16
  store <4 x float> %404, <4 x float>* %9, align 16
  store <4 x float> %405, <4 x float>* %10, align 16
  %406 = load <4 x float>, <4 x float>* %9, align 16
  %407 = load <4 x float>, <4 x float>* %10, align 16
  %408 = fsub <4 x float> %406, %407
  store <4 x float> %408, <4 x float>* %V3, align 16
  %409 = load <4 x float>, <4 x float>* %V3, align 16
  store <4 x float> %409, <4 x float>* %__a, align 16
  %410 = load <4 x float>, <4 x float>* %V3, align 16
  store <4 x float> %410, <4 x float>* %__b, align 16
  %411 = load <4 x float>, <4 x float>* %__a, align 16
  %412 = load <4 x float>, <4 x float>* %__b, align 16
  %413 = shufflevector <4 x float> %411, <4 x float> %412, <4 x i32> <i32 1, i32 0, i32 7, i32 6>
  store <4 x float> %413, <4 x float>* %79
  %414 = load <4 x float>, <4 x float>* %79
  store <4 x float> %414, <4 x float>* %V4, align 16
  %415 = load <4 x float>, <4 x float>* %V6, align 16
  %416 = load <4 x float>, <4 x float>* %V3, align 16
  store <4 x float> %415, <4 x float>* %11, align 16
  store <4 x float> %416, <4 x float>* %12, align 16
  %417 = load <4 x float>, <4 x float>* %11, align 16
  %418 = load <4 x float>, <4 x float>* %12, align 16
  %419 = fmul <4 x float> %417, %418
  store <4 x float> %419, <4 x float>* %V0, align 16
  %420 = load <4 x float>, <4 x float>* %V7, align 16
  %421 = load <4 x float>, <4 x float>* %V4, align 16
  store <4 x float> %420, <4 x float>* %13, align 16
  store <4 x float> %421, <4 x float>* %14, align 16
  %422 = load <4 x float>, <4 x float>* %13, align 16
  %423 = load <4 x float>, <4 x float>* %14, align 16
  %424 = fmul <4 x float> %422, %423
  store <4 x float> %424, <4 x float>* %V1, align 16
  %425 = load <4 x float>, <4 x float>* %V0, align 16
  %426 = load <4 x float>, <4 x float>* %V1, align 16
  store <4 x float> %425, <4 x float>* %15, align 16
  store <4 x float> %426, <4 x float>* %16, align 16
  %427 = load <4 x float>, <4 x float>* %15, align 16
  %428 = load <4 x float>, <4 x float>* %16, align 16
  %429 = fadd <4 x float> %427, %428
  store <4 x float> %429, <4 x float>* %V2, align 16
  %430 = load i32, i32* %jc, align 4
  %431 = sext i32 %430 to i64
  %432 = load [2 x float]*, [2 x float]** %d, align 8
  %433 = getelementptr inbounds [2 x float], [2 x float]* %432, i64 %431
  %434 = getelementptr inbounds [2 x float], [2 x float]* %433, i32 0, i64 0
  %435 = load <4 x float>, <4 x float>* %V2, align 16
  store float* %434, float** %17, align 8
  store <4 x float> %435, <4 x float>* %18, align 16
  %436 = load <4 x float>, <4 x float>* %18, align 16
  %437 = load float*, float** %17, align 8
  %438 = bitcast float* %437 to <4 x float>*
  store <4 x float> %436, <4 x float>* %438, align 16
  br label %439

; <label>:439                                     ; preds = %347
  %440 = load i32, i32* %j, align 4
  %441 = add nsw i32 %440, 1
  store i32 %441, i32* %j, align 4
  br label %318

; <label>:442                                     ; preds = %318
  %443 = load i32, i32* %74, align 4
  %444 = icmp eq i32 %443, 4
  br i1 %444, label %445, label %446

; <label>:445                                     ; preds = %442
  br label %886

; <label>:446                                     ; preds = %442
  %447 = load i32, i32* %mj, align 4
  %448 = mul nsw i32 %447, 2
  store i32 %448, i32* %mj, align 4
  %449 = load i32, i32* %mj, align 4
  %450 = mul nsw i32 2, %449
  store i32 %450, i32* %mj2, align 4
  %451 = load i32, i32* %74, align 4
  %452 = load i32, i32* %mj2, align 4
  %453 = sdiv i32 %451, %452
  store i32 %453, i32* %lj, align 4
  store i32 0, i32* %tgle, align 4
  store i32 2, i32* %pass, align 4
  br label %454

; <label>:454                                     ; preds = %739, %446
  %455 = load i32, i32* %pass, align 4
  %456 = load i32, i32* %m, align 4
  %457 = sub nsw i32 %456, 1
  %458 = icmp slt i32 %455, %457
  br i1 %458, label %459, label %742

; <label>:459                                     ; preds = %454
  %460 = load i32, i32* %tgle, align 4
  %461 = icmp ne i32 %460, 0
  br i1 %461, label %462, label %488

; <label>:462                                     ; preds = %459
  %463 = load [2 x float]*, [2 x float]** %76, align 8
  %464 = getelementptr inbounds [2 x float], [2 x float]* %463, i64 0
  %465 = getelementptr inbounds [2 x float], [2 x float]* %464, i32 0, i64 0
  %466 = bitcast float* %465 to i8*
  %467 = bitcast i8* %466 to [2 x float]*
  store [2 x float]* %467, [2 x float]** %a, align 8
  %468 = load i32, i32* %74, align 4
  %469 = sdiv i32 %468, 2
  %470 = sext i32 %469 to i64
  %471 = load [2 x float]*, [2 x float]** %76, align 8
  %472 = getelementptr inbounds [2 x float], [2 x float]* %471, i64 %470
  %473 = getelementptr inbounds [2 x float], [2 x float]* %472, i32 0, i64 0
  %474 = bitcast float* %473 to i8*
  %475 = bitcast i8* %474 to [2 x float]*
  store [2 x float]* %475, [2 x float]** %b, align 8
  %476 = load [2 x float]*, [2 x float]** %75, align 8
  %477 = getelementptr inbounds [2 x float], [2 x float]* %476, i64 0
  %478 = getelementptr inbounds [2 x float], [2 x float]* %477, i32 0, i64 0
  %479 = bitcast float* %478 to i8*
  %480 = bitcast i8* %479 to [2 x float]*
  store [2 x float]* %480, [2 x float]** %c, align 8
  %481 = load i32, i32* %mj, align 4
  %482 = sext i32 %481 to i64
  %483 = load [2 x float]*, [2 x float]** %75, align 8
  %484 = getelementptr inbounds [2 x float], [2 x float]* %483, i64 %482
  %485 = getelementptr inbounds [2 x float], [2 x float]* %484, i32 0, i64 0
  %486 = bitcast float* %485 to i8*
  %487 = bitcast i8* %486 to [2 x float]*
  store [2 x float]* %487, [2 x float]** %d, align 8
  store i32 0, i32* %tgle, align 4
  br label %514

; <label>:488                                     ; preds = %459
  %489 = load [2 x float]*, [2 x float]** %75, align 8
  %490 = getelementptr inbounds [2 x float], [2 x float]* %489, i64 0
  %491 = getelementptr inbounds [2 x float], [2 x float]* %490, i32 0, i64 0
  %492 = bitcast float* %491 to i8*
  %493 = bitcast i8* %492 to [2 x float]*
  store [2 x float]* %493, [2 x float]** %a, align 8
  %494 = load i32, i32* %74, align 4
  %495 = sdiv i32 %494, 2
  %496 = sext i32 %495 to i64
  %497 = load [2 x float]*, [2 x float]** %75, align 8
  %498 = getelementptr inbounds [2 x float], [2 x float]* %497, i64 %496
  %499 = getelementptr inbounds [2 x float], [2 x float]* %498, i32 0, i64 0
  %500 = bitcast float* %499 to i8*
  %501 = bitcast i8* %500 to [2 x float]*
  store [2 x float]* %501, [2 x float]** %b, align 8
  %502 = load [2 x float]*, [2 x float]** %76, align 8
  %503 = getelementptr inbounds [2 x float], [2 x float]* %502, i64 0
  %504 = getelementptr inbounds [2 x float], [2 x float]* %503, i32 0, i64 0
  %505 = bitcast float* %504 to i8*
  %506 = bitcast i8* %505 to [2 x float]*
  store [2 x float]* %506, [2 x float]** %c, align 8
  %507 = load i32, i32* %mj, align 4
  %508 = sext i32 %507 to i64
  %509 = load [2 x float]*, [2 x float]** %76, align 8
  %510 = getelementptr inbounds [2 x float], [2 x float]* %509, i64 %508
  %511 = getelementptr inbounds [2 x float], [2 x float]* %510, i32 0, i64 0
  %512 = bitcast float* %511 to i8*
  %513 = bitcast i8* %512 to [2 x float]*
  store [2 x float]* %513, [2 x float]** %d, align 8
  store i32 1, i32* %tgle, align 4
  br label %514

; <label>:514                                     ; preds = %488, %462
  store i32 0, i32* %j, align 4
  br label %515

; <label>:515                                     ; preds = %728, %514
  %516 = load i32, i32* %j, align 4
  %517 = load i32, i32* %lj, align 4
  %518 = icmp slt i32 %516, %517
  br i1 %518, label %519, label %731

; <label>:519                                     ; preds = %515
  %520 = load i32, i32* %j, align 4
  %521 = load i32, i32* %mj, align 4
  %522 = mul nsw i32 %520, %521
  store i32 %522, i32* %jw, align 4
  %523 = load i32, i32* %j, align 4
  %524 = load i32, i32* %mj2, align 4
  %525 = mul nsw i32 %523, %524
  store i32 %525, i32* %jc, align 4
  %526 = load i32, i32* %jw, align 4
  %527 = sext i32 %526 to i64
  %528 = load [2 x float]*, [2 x float]** %77, align 8
  %529 = getelementptr inbounds [2 x float], [2 x float]* %528, i64 %527
  %530 = getelementptr inbounds [2 x float], [2 x float]* %529, i32 0, i64 0
  %531 = load float, float* %530, align 4
  store float %531, float* %rp, align 4
  %532 = load i32, i32* %jw, align 4
  %533 = sext i32 %532 to i64
  %534 = load [2 x float]*, [2 x float]** %77, align 8
  %535 = getelementptr inbounds [2 x float], [2 x float]* %534, i64 %533
  %536 = getelementptr inbounds [2 x float], [2 x float]* %535, i32 0, i64 1
  %537 = load float, float* %536, align 4
  store float %537, float* %up, align 4
  %538 = load float, float* %78, align 4
  %539 = fpext float %538 to double
  %540 = fcmp olt double %539, 0.000000e+00
  br i1 %540, label %541, label %544

; <label>:541                                     ; preds = %519
  %542 = load float, float* %up, align 4
  %543 = fsub float -0.000000e+00, %542
  store float %543, float* %up, align 4
  br label %544

; <label>:544                                     ; preds = %541, %519
  %545 = load float, float* %rp, align 4
  %546 = getelementptr inbounds [4 x float], [4 x float]* %wr, i32 0, i64 0
  store float %545, float* %546, align 4
  %547 = load float, float* %rp, align 4
  %548 = getelementptr inbounds [4 x float], [4 x float]* %wr, i32 0, i64 1
  store float %547, float* %548, align 4
  %549 = load float, float* %rp, align 4
  %550 = getelementptr inbounds [4 x float], [4 x float]* %wr, i32 0, i64 2
  store float %549, float* %550, align 4
  %551 = load float, float* %rp, align 4
  %552 = getelementptr inbounds [4 x float], [4 x float]* %wr, i32 0, i64 3
  store float %551, float* %552, align 4
  %553 = load float, float* %up, align 4
  %554 = fsub float -0.000000e+00, %553
  %555 = getelementptr inbounds [4 x float], [4 x float]* %wu, i32 0, i64 0
  store float %554, float* %555, align 4
  %556 = load float, float* %up, align 4
  %557 = getelementptr inbounds [4 x float], [4 x float]* %wu, i32 0, i64 1
  store float %556, float* %557, align 4
  %558 = load float, float* %up, align 4
  %559 = fsub float -0.000000e+00, %558
  %560 = getelementptr inbounds [4 x float], [4 x float]* %wu, i32 0, i64 2
  store float %559, float* %560, align 4
  %561 = load float, float* %up, align 4
  %562 = getelementptr inbounds [4 x float], [4 x float]* %wu, i32 0, i64 3
  store float %561, float* %562, align 4
  %563 = getelementptr inbounds [4 x float], [4 x float]* %wr, i32 0, i32 0
  store float* %563, float** %19, align 8
  %564 = load float*, float** %19, align 8
  %565 = bitcast float* %564 to <4 x float>*
  %566 = load <4 x float>, <4 x float>* %565, align 16
  store <4 x float> %566, <4 x float>* %V6, align 16
  %567 = getelementptr inbounds [4 x float], [4 x float]* %wu, i32 0, i32 0
  store float* %567, float** %20, align 8
  %568 = load float*, float** %20, align 8
  %569 = bitcast float* %568 to <4 x float>*
  %570 = load <4 x float>, <4 x float>* %569, align 16
  store <4 x float> %570, <4 x float>* %V7, align 16
  store i32 0, i32* %k, align 4
  br label %571

; <label>:571                                     ; preds = %724, %544
  %572 = load i32, i32* %k, align 4
  %573 = load i32, i32* %mj, align 4
  %574 = icmp slt i32 %572, %573
  br i1 %574, label %575, label %727

; <label>:575                                     ; preds = %571
  %576 = load i32, i32* %k, align 4
  %577 = add nsw i32 %576, 2
  store i32 %577, i32* %k2, align 4
  %578 = load i32, i32* %jw, align 4
  %579 = load i32, i32* %k, align 4
  %580 = add nsw i32 %578, %579
  %581 = sext i32 %580 to i64
  %582 = load [2 x float]*, [2 x float]** %a, align 8
  %583 = getelementptr inbounds [2 x float], [2 x float]* %582, i64 %581
  %584 = getelementptr inbounds [2 x float], [2 x float]* %583, i32 0, i64 0
  store float* %584, float** %21, align 8
  %585 = load float*, float** %21, align 8
  %586 = bitcast float* %585 to <4 x float>*
  %587 = load <4 x float>, <4 x float>* %586, align 16
  store <4 x float> %587, <4 x float>* %V0, align 16
  %588 = load i32, i32* %jw, align 4
  %589 = load i32, i32* %k, align 4
  %590 = add nsw i32 %588, %589
  %591 = sext i32 %590 to i64
  %592 = load [2 x float]*, [2 x float]** %b, align 8
  %593 = getelementptr inbounds [2 x float], [2 x float]* %592, i64 %591
  %594 = getelementptr inbounds [2 x float], [2 x float]* %593, i32 0, i64 0
  store float* %594, float** %22, align 8
  %595 = load float*, float** %22, align 8
  %596 = bitcast float* %595 to <4 x float>*
  %597 = load <4 x float>, <4 x float>* %596, align 16
  store <4 x float> %597, <4 x float>* %V1, align 16
  %598 = load <4 x float>, <4 x float>* %V0, align 16
  %599 = load <4 x float>, <4 x float>* %V1, align 16
  store <4 x float> %598, <4 x float>* %23, align 16
  store <4 x float> %599, <4 x float>* %24, align 16
  %600 = load <4 x float>, <4 x float>* %23, align 16
  %601 = load <4 x float>, <4 x float>* %24, align 16
  %602 = fadd <4 x float> %600, %601
  store <4 x float> %602, <4 x float>* %V2, align 16
  %603 = load i32, i32* %jc, align 4
  %604 = load i32, i32* %k, align 4
  %605 = add nsw i32 %603, %604
  %606 = sext i32 %605 to i64
  %607 = load [2 x float]*, [2 x float]** %c, align 8
  %608 = getelementptr inbounds [2 x float], [2 x float]* %607, i64 %606
  %609 = getelementptr inbounds [2 x float], [2 x float]* %608, i32 0, i64 0
  %610 = load <4 x float>, <4 x float>* %V2, align 16
  store float* %609, float** %25, align 8
  store <4 x float> %610, <4 x float>* %26, align 16
  %611 = load <4 x float>, <4 x float>* %26, align 16
  %612 = load float*, float** %25, align 8
  %613 = bitcast float* %612 to <4 x float>*
  store <4 x float> %611, <4 x float>* %613, align 16
  %614 = load <4 x float>, <4 x float>* %V0, align 16
  %615 = load <4 x float>, <4 x float>* %V1, align 16
  store <4 x float> %614, <4 x float>* %27, align 16
  store <4 x float> %615, <4 x float>* %28, align 16
  %616 = load <4 x float>, <4 x float>* %27, align 16
  %617 = load <4 x float>, <4 x float>* %28, align 16
  %618 = fsub <4 x float> %616, %617
  store <4 x float> %618, <4 x float>* %V3, align 16
  %619 = load <4 x float>, <4 x float>* %V3, align 16
  store <4 x float> %619, <4 x float>* %__a1, align 16
  %620 = load <4 x float>, <4 x float>* %V3, align 16
  store <4 x float> %620, <4 x float>* %__b2, align 16
  %621 = load <4 x float>, <4 x float>* %__a1, align 16
  %622 = load <4 x float>, <4 x float>* %__b2, align 16
  %623 = shufflevector <4 x float> %621, <4 x float> %622, <4 x i32> <i32 1, i32 0, i32 7, i32 6>
  store <4 x float> %623, <4 x float>* %80
  %624 = load <4 x float>, <4 x float>* %80
  store <4 x float> %624, <4 x float>* %V4, align 16
  %625 = load <4 x float>, <4 x float>* %V6, align 16
  %626 = load <4 x float>, <4 x float>* %V3, align 16
  store <4 x float> %625, <4 x float>* %29, align 16
  store <4 x float> %626, <4 x float>* %30, align 16
  %627 = load <4 x float>, <4 x float>* %29, align 16
  %628 = load <4 x float>, <4 x float>* %30, align 16
  %629 = fmul <4 x float> %627, %628
  store <4 x float> %629, <4 x float>* %V0, align 16
  %630 = load <4 x float>, <4 x float>* %V7, align 16
  %631 = load <4 x float>, <4 x float>* %V4, align 16
  store <4 x float> %630, <4 x float>* %31, align 16
  store <4 x float> %631, <4 x float>* %32, align 16
  %632 = load <4 x float>, <4 x float>* %31, align 16
  %633 = load <4 x float>, <4 x float>* %32, align 16
  %634 = fmul <4 x float> %632, %633
  store <4 x float> %634, <4 x float>* %V1, align 16
  %635 = load <4 x float>, <4 x float>* %V0, align 16
  %636 = load <4 x float>, <4 x float>* %V1, align 16
  store <4 x float> %635, <4 x float>* %33, align 16
  store <4 x float> %636, <4 x float>* %34, align 16
  %637 = load <4 x float>, <4 x float>* %33, align 16
  %638 = load <4 x float>, <4 x float>* %34, align 16
  %639 = fadd <4 x float> %637, %638
  store <4 x float> %639, <4 x float>* %V2, align 16
  %640 = load i32, i32* %jc, align 4
  %641 = load i32, i32* %k, align 4
  %642 = add nsw i32 %640, %641
  %643 = sext i32 %642 to i64
  %644 = load [2 x float]*, [2 x float]** %d, align 8
  %645 = getelementptr inbounds [2 x float], [2 x float]* %644, i64 %643
  %646 = getelementptr inbounds [2 x float], [2 x float]* %645, i32 0, i64 0
  %647 = load <4 x float>, <4 x float>* %V2, align 16
  store float* %646, float** %35, align 8
  store <4 x float> %647, <4 x float>* %36, align 16
  %648 = load <4 x float>, <4 x float>* %36, align 16
  %649 = load float*, float** %35, align 8
  %650 = bitcast float* %649 to <4 x float>*
  store <4 x float> %648, <4 x float>* %650, align 16
  %651 = load i32, i32* %jw, align 4
  %652 = load i32, i32* %k2, align 4
  %653 = add nsw i32 %651, %652
  %654 = sext i32 %653 to i64
  %655 = load [2 x float]*, [2 x float]** %a, align 8
  %656 = getelementptr inbounds [2 x float], [2 x float]* %655, i64 %654
  %657 = getelementptr inbounds [2 x float], [2 x float]* %656, i32 0, i64 0
  store float* %657, float** %37, align 8
  %658 = load float*, float** %37, align 8
  %659 = bitcast float* %658 to <4 x float>*
  %660 = load <4 x float>, <4 x float>* %659, align 16
  store <4 x float> %660, <4 x float>* %V8, align 16
  %661 = load i32, i32* %jw, align 4
  %662 = load i32, i32* %k2, align 4
  %663 = add nsw i32 %661, %662
  %664 = sext i32 %663 to i64
  %665 = load [2 x float]*, [2 x float]** %b, align 8
  %666 = getelementptr inbounds [2 x float], [2 x float]* %665, i64 %664
  %667 = getelementptr inbounds [2 x float], [2 x float]* %666, i32 0, i64 0
  store float* %667, float** %38, align 8
  %668 = load float*, float** %38, align 8
  %669 = bitcast float* %668 to <4 x float>*
  %670 = load <4 x float>, <4 x float>* %669, align 16
  store <4 x float> %670, <4 x float>* %V9, align 16
  %671 = load <4 x float>, <4 x float>* %V8, align 16
  %672 = load <4 x float>, <4 x float>* %V9, align 16
  store <4 x float> %671, <4 x float>* %39, align 16
  store <4 x float> %672, <4 x float>* %40, align 16
  %673 = load <4 x float>, <4 x float>* %39, align 16
  %674 = load <4 x float>, <4 x float>* %40, align 16
  %675 = fadd <4 x float> %673, %674
  store <4 x float> %675, <4 x float>* %V10, align 16
  %676 = load i32, i32* %jc, align 4
  %677 = load i32, i32* %k2, align 4
  %678 = add nsw i32 %676, %677
  %679 = sext i32 %678 to i64
  %680 = load [2 x float]*, [2 x float]** %c, align 8
  %681 = getelementptr inbounds [2 x float], [2 x float]* %680, i64 %679
  %682 = getelementptr inbounds [2 x float], [2 x float]* %681, i32 0, i64 0
  %683 = load <4 x float>, <4 x float>* %V10, align 16
  store float* %682, float** %41, align 8
  store <4 x float> %683, <4 x float>* %42, align 16
  %684 = load <4 x float>, <4 x float>* %42, align 16
  %685 = load float*, float** %41, align 8
  %686 = bitcast float* %685 to <4 x float>*
  store <4 x float> %684, <4 x float>* %686, align 16
  %687 = load <4 x float>, <4 x float>* %V8, align 16
  %688 = load <4 x float>, <4 x float>* %V9, align 16
  store <4 x float> %687, <4 x float>* %43, align 16
  store <4 x float> %688, <4 x float>* %44, align 16
  %689 = load <4 x float>, <4 x float>* %43, align 16
  %690 = load <4 x float>, <4 x float>* %44, align 16
  %691 = fsub <4 x float> %689, %690
  store <4 x float> %691, <4 x float>* %V11, align 16
  %692 = load <4 x float>, <4 x float>* %V11, align 16
  store <4 x float> %692, <4 x float>* %__a3, align 16
  %693 = load <4 x float>, <4 x float>* %V11, align 16
  store <4 x float> %693, <4 x float>* %__b4, align 16
  %694 = load <4 x float>, <4 x float>* %__a3, align 16
  %695 = load <4 x float>, <4 x float>* %__b4, align 16
  %696 = shufflevector <4 x float> %694, <4 x float> %695, <4 x i32> <i32 1, i32 0, i32 7, i32 6>
  store <4 x float> %696, <4 x float>* %81
  %697 = load <4 x float>, <4 x float>* %81
  store <4 x float> %697, <4 x float>* %V12, align 16
  %698 = load <4 x float>, <4 x float>* %V6, align 16
  %699 = load <4 x float>, <4 x float>* %V11, align 16
  store <4 x float> %698, <4 x float>* %45, align 16
  store <4 x float> %699, <4 x float>* %46, align 16
  %700 = load <4 x float>, <4 x float>* %45, align 16
  %701 = load <4 x float>, <4 x float>* %46, align 16
  %702 = fmul <4 x float> %700, %701
  store <4 x float> %702, <4 x float>* %V8, align 16
  %703 = load <4 x float>, <4 x float>* %V7, align 16
  %704 = load <4 x float>, <4 x float>* %V12, align 16
  store <4 x float> %703, <4 x float>* %47, align 16
  store <4 x float> %704, <4 x float>* %48, align 16
  %705 = load <4 x float>, <4 x float>* %47, align 16
  %706 = load <4 x float>, <4 x float>* %48, align 16
  %707 = fmul <4 x float> %705, %706
  store <4 x float> %707, <4 x float>* %V9, align 16
  %708 = load <4 x float>, <4 x float>* %V8, align 16
  %709 = load <4 x float>, <4 x float>* %V9, align 16
  store <4 x float> %708, <4 x float>* %49, align 16
  store <4 x float> %709, <4 x float>* %50, align 16
  %710 = load <4 x float>, <4 x float>* %49, align 16
  %711 = load <4 x float>, <4 x float>* %50, align 16
  %712 = fadd <4 x float> %710, %711
  store <4 x float> %712, <4 x float>* %V10, align 16
  %713 = load i32, i32* %jc, align 4
  %714 = load i32, i32* %k2, align 4
  %715 = add nsw i32 %713, %714
  %716 = sext i32 %715 to i64
  %717 = load [2 x float]*, [2 x float]** %d, align 8
  %718 = getelementptr inbounds [2 x float], [2 x float]* %717, i64 %716
  %719 = getelementptr inbounds [2 x float], [2 x float]* %718, i32 0, i64 0
  %720 = load <4 x float>, <4 x float>* %V10, align 16
  store float* %719, float** %51, align 8
  store <4 x float> %720, <4 x float>* %52, align 16
  %721 = load <4 x float>, <4 x float>* %52, align 16
  %722 = load float*, float** %51, align 8
  %723 = bitcast float* %722 to <4 x float>*
  store <4 x float> %721, <4 x float>* %723, align 16
  br label %724

; <label>:724                                     ; preds = %575
  %725 = load i32, i32* %k, align 4
  %726 = add nsw i32 %725, 4
  store i32 %726, i32* %k, align 4
  br label %571

; <label>:727                                     ; preds = %571
  br label %728

; <label>:728                                     ; preds = %727
  %729 = load i32, i32* %j, align 4
  %730 = add nsw i32 %729, 1
  store i32 %730, i32* %j, align 4
  br label %515

; <label>:731                                     ; preds = %515
  %732 = load i32, i32* %mj, align 4
  %733 = mul nsw i32 %732, 2
  store i32 %733, i32* %mj, align 4
  %734 = load i32, i32* %mj, align 4
  %735 = mul nsw i32 2, %734
  store i32 %735, i32* %mj2, align 4
  %736 = load i32, i32* %74, align 4
  %737 = load i32, i32* %mj2, align 4
  %738 = sdiv i32 %736, %737
  store i32 %738, i32* %lj, align 4
  br label %739

; <label>:739                                     ; preds = %731
  %740 = load i32, i32* %pass, align 4
  %741 = add nsw i32 %740, 1
  store i32 %741, i32* %pass, align 4
  br label %454

; <label>:742                                     ; preds = %454
  %743 = load [2 x float]*, [2 x float]** %76, align 8
  %744 = getelementptr inbounds [2 x float], [2 x float]* %743, i64 0
  %745 = getelementptr inbounds [2 x float], [2 x float]* %744, i32 0, i64 0
  %746 = bitcast float* %745 to i8*
  %747 = bitcast i8* %746 to [2 x float]*
  store [2 x float]* %747, [2 x float]** %c, align 8
  %748 = load i32, i32* %74, align 4
  %749 = sdiv i32 %748, 2
  %750 = sext i32 %749 to i64
  %751 = load [2 x float]*, [2 x float]** %76, align 8
  %752 = getelementptr inbounds [2 x float], [2 x float]* %751, i64 %750
  %753 = getelementptr inbounds [2 x float], [2 x float]* %752, i32 0, i64 0
  %754 = bitcast float* %753 to i8*
  %755 = bitcast i8* %754 to [2 x float]*
  store [2 x float]* %755, [2 x float]** %d, align 8
  %756 = load i32, i32* %tgle, align 4
  %757 = icmp ne i32 %756, 0
  br i1 %757, label %758, label %772

; <label>:758                                     ; preds = %742
  %759 = load [2 x float]*, [2 x float]** %76, align 8
  %760 = getelementptr inbounds [2 x float], [2 x float]* %759, i64 0
  %761 = getelementptr inbounds [2 x float], [2 x float]* %760, i32 0, i64 0
  %762 = bitcast float* %761 to i8*
  %763 = bitcast i8* %762 to [2 x float]*
  store [2 x float]* %763, [2 x float]** %a, align 8
  %764 = load i32, i32* %74, align 4
  %765 = sdiv i32 %764, 2
  %766 = sext i32 %765 to i64
  %767 = load [2 x float]*, [2 x float]** %76, align 8
  %768 = getelementptr inbounds [2 x float], [2 x float]* %767, i64 %766
  %769 = getelementptr inbounds [2 x float], [2 x float]* %768, i32 0, i64 0
  %770 = bitcast float* %769 to i8*
  %771 = bitcast i8* %770 to [2 x float]*
  store [2 x float]* %771, [2 x float]** %b, align 8
  br label %786

; <label>:772                                     ; preds = %742
  %773 = load [2 x float]*, [2 x float]** %75, align 8
  %774 = getelementptr inbounds [2 x float], [2 x float]* %773, i64 0
  %775 = getelementptr inbounds [2 x float], [2 x float]* %774, i32 0, i64 0
  %776 = bitcast float* %775 to i8*
  %777 = bitcast i8* %776 to [2 x float]*
  store [2 x float]* %777, [2 x float]** %a, align 8
  %778 = load i32, i32* %74, align 4
  %779 = sdiv i32 %778, 2
  %780 = sext i32 %779 to i64
  %781 = load [2 x float]*, [2 x float]** %75, align 8
  %782 = getelementptr inbounds [2 x float], [2 x float]* %781, i64 %780
  %783 = getelementptr inbounds [2 x float], [2 x float]* %782, i32 0, i64 0
  %784 = bitcast float* %783 to i8*
  %785 = bitcast i8* %784 to [2 x float]*
  store [2 x float]* %785, [2 x float]** %b, align 8
  br label %786

; <label>:786                                     ; preds = %772, %758
  store i32 0, i32* %k, align 4
  br label %787

; <label>:787                                     ; preds = %883, %786
  %788 = load i32, i32* %k, align 4
  %789 = load i32, i32* %74, align 4
  %790 = sdiv i32 %789, 2
  %791 = icmp slt i32 %788, %790
  br i1 %791, label %792, label %886

; <label>:792                                     ; preds = %787
  %793 = load i32, i32* %k, align 4
  %794 = add nsw i32 %793, 2
  store i32 %794, i32* %k2, align 4
  %795 = load i32, i32* %k, align 4
  %796 = sext i32 %795 to i64
  %797 = load [2 x float]*, [2 x float]** %a, align 8
  %798 = getelementptr inbounds [2 x float], [2 x float]* %797, i64 %796
  %799 = getelementptr inbounds [2 x float], [2 x float]* %798, i32 0, i64 0
  store float* %799, float** %53, align 8
  %800 = load float*, float** %53, align 8
  %801 = bitcast float* %800 to <4 x float>*
  %802 = load <4 x float>, <4 x float>* %801, align 16
  store <4 x float> %802, <4 x float>* %V0, align 16
  %803 = load i32, i32* %k, align 4
  %804 = sext i32 %803 to i64
  %805 = load [2 x float]*, [2 x float]** %b, align 8
  %806 = getelementptr inbounds [2 x float], [2 x float]* %805, i64 %804
  %807 = getelementptr inbounds [2 x float], [2 x float]* %806, i32 0, i64 0
  store float* %807, float** %54, align 8
  %808 = load float*, float** %54, align 8
  %809 = bitcast float* %808 to <4 x float>*
  %810 = load <4 x float>, <4 x float>* %809, align 16
  store <4 x float> %810, <4 x float>* %V1, align 16
  %811 = load <4 x float>, <4 x float>* %V0, align 16
  %812 = load <4 x float>, <4 x float>* %V1, align 16
  store <4 x float> %811, <4 x float>* %55, align 16
  store <4 x float> %812, <4 x float>* %56, align 16
  %813 = load <4 x float>, <4 x float>* %55, align 16
  %814 = load <4 x float>, <4 x float>* %56, align 16
  %815 = fadd <4 x float> %813, %814
  store <4 x float> %815, <4 x float>* %V2, align 16
  %816 = load i32, i32* %k, align 4
  %817 = sext i32 %816 to i64
  %818 = load [2 x float]*, [2 x float]** %c, align 8
  %819 = getelementptr inbounds [2 x float], [2 x float]* %818, i64 %817
  %820 = getelementptr inbounds [2 x float], [2 x float]* %819, i32 0, i64 0
  %821 = load <4 x float>, <4 x float>* %V2, align 16
  store float* %820, float** %57, align 8
  store <4 x float> %821, <4 x float>* %58, align 16
  %822 = load <4 x float>, <4 x float>* %58, align 16
  %823 = load float*, float** %57, align 8
  %824 = bitcast float* %823 to <4 x float>*
  store <4 x float> %822, <4 x float>* %824, align 16
  %825 = load <4 x float>, <4 x float>* %V0, align 16
  %826 = load <4 x float>, <4 x float>* %V1, align 16
  store <4 x float> %825, <4 x float>* %59, align 16
  store <4 x float> %826, <4 x float>* %60, align 16
  %827 = load <4 x float>, <4 x float>* %59, align 16
  %828 = load <4 x float>, <4 x float>* %60, align 16
  %829 = fsub <4 x float> %827, %828
  store <4 x float> %829, <4 x float>* %V3, align 16
  %830 = load i32, i32* %k, align 4
  %831 = sext i32 %830 to i64
  %832 = load [2 x float]*, [2 x float]** %d, align 8
  %833 = getelementptr inbounds [2 x float], [2 x float]* %832, i64 %831
  %834 = getelementptr inbounds [2 x float], [2 x float]* %833, i32 0, i64 0
  %835 = load <4 x float>, <4 x float>* %V3, align 16
  store float* %834, float** %61, align 8
  store <4 x float> %835, <4 x float>* %62, align 16
  %836 = load <4 x float>, <4 x float>* %62, align 16
  %837 = load float*, float** %61, align 8
  %838 = bitcast float* %837 to <4 x float>*
  store <4 x float> %836, <4 x float>* %838, align 16
  %839 = load i32, i32* %k2, align 4
  %840 = sext i32 %839 to i64
  %841 = load [2 x float]*, [2 x float]** %a, align 8
  %842 = getelementptr inbounds [2 x float], [2 x float]* %841, i64 %840
  %843 = getelementptr inbounds [2 x float], [2 x float]* %842, i32 0, i64 0
  store float* %843, float** %63, align 8
  %844 = load float*, float** %63, align 8
  %845 = bitcast float* %844 to <4 x float>*
  %846 = load <4 x float>, <4 x float>* %845, align 16
  store <4 x float> %846, <4 x float>* %V4, align 16
  %847 = load i32, i32* %k2, align 4
  %848 = sext i32 %847 to i64
  %849 = load [2 x float]*, [2 x float]** %b, align 8
  %850 = getelementptr inbounds [2 x float], [2 x float]* %849, i64 %848
  %851 = getelementptr inbounds [2 x float], [2 x float]* %850, i32 0, i64 0
  store float* %851, float** %64, align 8
  %852 = load float*, float** %64, align 8
  %853 = bitcast float* %852 to <4 x float>*
  %854 = load <4 x float>, <4 x float>* %853, align 16
  store <4 x float> %854, <4 x float>* %V5, align 16
  %855 = load <4 x float>, <4 x float>* %V4, align 16
  %856 = load <4 x float>, <4 x float>* %V5, align 16
  store <4 x float> %855, <4 x float>* %65, align 16
  store <4 x float> %856, <4 x float>* %66, align 16
  %857 = load <4 x float>, <4 x float>* %65, align 16
  %858 = load <4 x float>, <4 x float>* %66, align 16
  %859 = fadd <4 x float> %857, %858
  store <4 x float> %859, <4 x float>* %V6, align 16
  %860 = load i32, i32* %k2, align 4
  %861 = sext i32 %860 to i64
  %862 = load [2 x float]*, [2 x float]** %c, align 8
  %863 = getelementptr inbounds [2 x float], [2 x float]* %862, i64 %861
  %864 = getelementptr inbounds [2 x float], [2 x float]* %863, i32 0, i64 0
  %865 = load <4 x float>, <4 x float>* %V6, align 16
  store float* %864, float** %67, align 8
  store <4 x float> %865, <4 x float>* %68, align 16
  %866 = load <4 x float>, <4 x float>* %68, align 16
  %867 = load float*, float** %67, align 8
  %868 = bitcast float* %867 to <4 x float>*
  store <4 x float> %866, <4 x float>* %868, align 16
  %869 = load <4 x float>, <4 x float>* %V4, align 16
  %870 = load <4 x float>, <4 x float>* %V5, align 16
  store <4 x float> %869, <4 x float>* %69, align 16
  store <4 x float> %870, <4 x float>* %70, align 16
  %871 = load <4 x float>, <4 x float>* %69, align 16
  %872 = load <4 x float>, <4 x float>* %70, align 16
  %873 = fsub <4 x float> %871, %872
  store <4 x float> %873, <4 x float>* %V7, align 16
  %874 = load i32, i32* %k2, align 4
  %875 = sext i32 %874 to i64
  %876 = load [2 x float]*, [2 x float]** %d, align 8
  %877 = getelementptr inbounds [2 x float], [2 x float]* %876, i64 %875
  %878 = getelementptr inbounds [2 x float], [2 x float]* %877, i32 0, i64 0
  %879 = load <4 x float>, <4 x float>* %V7, align 16
  store float* %878, float** %71, align 8
  store <4 x float> %879, <4 x float>* %72, align 16
  %880 = load <4 x float>, <4 x float>* %72, align 16
  %881 = load float*, float** %71, align 8
  %882 = bitcast float* %881 to <4 x float>*
  store <4 x float> %880, <4 x float>* %882, align 16
  br label %883

; <label>:883                                     ; preds = %792
  %884 = load i32, i32* %k, align 4
  %885 = add nsw i32 %884, 4
  store i32 %885, i32* %k, align 4
  br label %787

; <label>:886                                     ; preds = %84, %273, %445, %787
  ret void
}

; Function Attrs: nounwind
declare double @log(double) #1

; Function Attrs: nounwind uwtable
define void @cffti(i32 %n, [2 x float]* %w) #0 {
  %1 = alloca i32, align 4
  %2 = alloca [2 x float]*, align 8
  %i = alloca i32, align 4
  %n2 = alloca i32, align 4
  %aw = alloca float, align 4
  %arg = alloca float, align 4
  %pi = alloca float, align 4
  store i32 %n, i32* %1, align 4
  store [2 x float]* %w, [2 x float]** %2, align 8
  store float 0x400921FB60000000, float* %pi, align 4
  %3 = load i32, i32* %1, align 4
  %4 = sdiv i32 %3, 2
  store i32 %4, i32* %n2, align 4
  %5 = load float, float* %pi, align 4
  %6 = fpext float %5 to double
  %7 = fmul double 2.000000e+00, %6
  %8 = load i32, i32* %1, align 4
  %9 = sitofp i32 %8 to float
  %10 = fpext float %9 to double
  %11 = fdiv double %7, %10
  %12 = fptrunc double %11 to float
  store float %12, float* %aw, align 4
  store i32 0, i32* %i, align 4
  br label %13

; <label>:13                                      ; preds = %40, %0
  %14 = load i32, i32* %i, align 4
  %15 = load i32, i32* %n2, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %43

; <label>:17                                      ; preds = %13
  %18 = load float, float* %aw, align 4
  %19 = load i32, i32* %i, align 4
  %20 = sitofp i32 %19 to float
  %21 = fmul float %18, %20
  store float %21, float* %arg, align 4
  %22 = load float, float* %arg, align 4
  %23 = fpext float %22 to double
  %24 = call double @cos(double %23) #3
  %25 = fptrunc double %24 to float
  %26 = load i32, i32* %i, align 4
  %27 = sext i32 %26 to i64
  %28 = load [2 x float]*, [2 x float]** %2, align 8
  %29 = getelementptr inbounds [2 x float], [2 x float]* %28, i64 %27
  %30 = getelementptr inbounds [2 x float], [2 x float]* %29, i32 0, i64 0
  store float %25, float* %30, align 4
  %31 = load float, float* %arg, align 4
  %32 = fpext float %31 to double
  %33 = call double @sin(double %32) #3
  %34 = fptrunc double %33 to float
  %35 = load i32, i32* %i, align 4
  %36 = sext i32 %35 to i64
  %37 = load [2 x float]*, [2 x float]** %2, align 8
  %38 = getelementptr inbounds [2 x float], [2 x float]* %37, i64 %36
  %39 = getelementptr inbounds [2 x float], [2 x float]* %38, i32 0, i64 1
  store float %34, float* %39, align 4
  br label %40

; <label>:40                                      ; preds = %17
  %41 = load i32, i32* %i, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, i32* %i, align 4
  br label %13

; <label>:43                                      ; preds = %13
  ret void
}

; Function Attrs: nounwind
declare double @cos(double) #1

; Function Attrs: nounwind
declare double @sin(double) #1

; Function Attrs: nounwind uwtable
define float @ggl(float* %ds) #0 {
  %1 = alloca float*, align 8
  %t = alloca double, align 8
  %d2 = alloca double, align 8
  store float* %ds, float** %1, align 8
  store double 0x41DFFFFFFFC00000, double* %d2, align 8
  %2 = load float*, float** %1, align 8
  %3 = load float, float* %2, align 4
  %4 = fpext float %3 to double
  store double %4, double* %t, align 8
  %5 = load double, double* %t, align 8
  %6 = fmul double 1.680700e+04, %5
  %7 = load double, double* %d2, align 8
  %8 = call double @fmod(double %6, double %7) #3
  store double %8, double* %t, align 8
  %9 = load double, double* %t, align 8
  %10 = fptrunc double %9 to float
  %11 = load float*, float** %1, align 8
  store float %10, float* %11, align 4
  %12 = load double, double* %t, align 8
  %13 = fsub double %12, 1.000000e+00
  %14 = load double, double* %d2, align 8
  %15 = fsub double %14, 1.000000e+00
  %16 = fdiv double %13, %15
  %17 = fptrunc double %16 to float
  ret float %17
}

; Function Attrs: nounwind
declare double @fmod(double, double) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
