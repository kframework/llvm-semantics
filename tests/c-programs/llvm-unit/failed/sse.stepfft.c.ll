; ModuleID = './sse.stepfft.c'
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
  %seed = alloca float, align 4
  %error = alloca float, align 4
  %fnm1 = alloca float, align 4
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

; <label>:2                                       ; preds = %189, %0
  %3 = load i32, i32* %icase, align 4
  %4 = icmp slt i32 %3, 2
  br i1 %4, label %5, label %192

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
  br i1 %67, label %68, label %150

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
  store float 0.000000e+00, float* %error, align 4
  store i32 0, i32* %i, align 4
  br label %80

; <label>:80                                      ; preds = %137, %68
  %81 = load i32, i32* %i, align 4
  %82 = icmp slt i32 %81, 2048
  br i1 %82, label %83, label %140

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
  %135 = load float, float* %error, align 4
  %136 = fadd float %135, %134
  store float %136, float* %error, align 4
  br label %137

; <label>:137                                     ; preds = %83
  %138 = load i32, i32* %i, align 4
  %139 = add nsw i32 %138, 2
  store i32 %139, i32* %i, align 4
  br label %80

; <label>:140                                     ; preds = %80
  %141 = load float, float* %fnm1, align 4
  %142 = load float, float* %error, align 4
  %143 = fmul float %141, %142
  %144 = fpext float %143 to double
  %145 = call double @sqrt(double %144) #3
  %146 = fptrunc double %145 to float
  store float %146, float* %error, align 4
  %147 = load float, float* %error, align 4
  %148 = fpext float %147 to double
  %149 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str, i32 0, i32 0), i32 1024, double %148)
  store i32 0, i32* %first, align 4
  br label %188

; <label>:150                                     ; preds = %64
  store i32 0, i32* %j, align 4
  store i32 0, i32* %it, align 4
  br label %151

; <label>:151                                     ; preds = %161, %150
  %152 = load i32, i32* %it, align 4
  %153 = icmp slt i32 %152, 20000
  br i1 %153, label %154, label %164

; <label>:154                                     ; preds = %151
  store float 1.000000e+00, float* %sign, align 4
  %155 = load i32, i32* %n, align 4
  %156 = load float, float* %sign, align 4
  %157 = fpext float %156 to double
  call void (i32, float*, float*, float*, double, ...) bitcast (void (i32, [2 x float]*, [2 x float]*, [2 x float]*, double)* @cfft2 to void (i32, float*, float*, float*, double, ...)*)(i32 %155, float* getelementptr inbounds ([2048 x float], [2048 x float]* @x, i32 0, i32 0), float* getelementptr inbounds ([2048 x float], [2048 x float]* @y, i32 0, i32 0), float* getelementptr inbounds ([1024 x float], [1024 x float]* @w, i32 0, i32 0), double %157)
  store float -1.000000e+00, float* %sign, align 4
  %158 = load i32, i32* %n, align 4
  %159 = load float, float* %sign, align 4
  %160 = fpext float %159 to double
  call void (i32, float*, float*, float*, double, ...) bitcast (void (i32, [2 x float]*, [2 x float]*, [2 x float]*, double)* @cfft2 to void (i32, float*, float*, float*, double, ...)*)(i32 %158, float* getelementptr inbounds ([2048 x float], [2048 x float]* @y, i32 0, i32 0), float* getelementptr inbounds ([2048 x float], [2048 x float]* @x, i32 0, i32 0), float* getelementptr inbounds ([1024 x float], [1024 x float]* @w, i32 0, i32 0), double %160)
  br label %161

; <label>:161                                     ; preds = %154
  %162 = load i32, i32* %it, align 4
  %163 = add nsw i32 %162, 1
  store i32 %163, i32* %it, align 4
  br label %151

; <label>:164                                     ; preds = %151
  %165 = load i32, i32* %n, align 4
  %166 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 %165)
  store i32 0, i32* %i, align 4
  br label %167

; <label>:167                                     ; preds = %184, %164
  %168 = load i32, i32* %i, align 4
  %169 = icmp slt i32 %168, 1024
  br i1 %169, label %170, label %187

; <label>:170                                     ; preds = %167
  %171 = load i32, i32* %i, align 4
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds [1024 x float], [1024 x float]* @w, i32 0, i64 %172
  %174 = load float, float* %173, align 4
  %175 = fpext float %174 to double
  %176 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), double %175)
  %177 = load i32, i32* %j, align 4
  %178 = add i32 %177, 1
  store i32 %178, i32* %j, align 4
  %179 = load i32, i32* %j, align 4
  %180 = icmp eq i32 %179, 4
  br i1 %180, label %181, label %183

; <label>:181                                     ; preds = %170
  %182 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  store i32 0, i32* %j, align 4
  br label %183

; <label>:183                                     ; preds = %181, %170
  br label %184

; <label>:184                                     ; preds = %183
  %185 = load i32, i32* %i, align 4
  %186 = add nsw i32 %185, 1
  store i32 %186, i32* %i, align 4
  br label %167

; <label>:187                                     ; preds = %167
  br label %188

; <label>:188                                     ; preds = %187, %140
  br label %189

; <label>:189                                     ; preds = %188
  %190 = load i32, i32* %icase, align 4
  %191 = add nsw i32 %190, 1
  store i32 %191, i32* %icase, align 4
  br label %2

; <label>:192                                     ; preds = %2
  ret i32 0
}

; Function Attrs: nounwind
declare double @sqrt(double) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @cfft2(i32 %n, [2 x float]* %x, [2 x float]* %y, [2 x float]* %w, double) #0 {
  %2 = alloca i32, align 4
  %3 = alloca [2 x float]*, align 8
  %4 = alloca [2 x float]*, align 8
  %5 = alloca [2 x float]*, align 8
  %6 = alloca float, align 4
  %jb = alloca i32, align 4
  %m = alloca i32, align 4
  %j = alloca i32, align 4
  %mj = alloca i32, align 4
  %tgle = alloca i32, align 4
  %sign = fptrunc double %0 to float
  store i32 %n, i32* %2, align 4
  store [2 x float]* %x, [2 x float]** %3, align 8
  store [2 x float]* %y, [2 x float]** %4, align 8
  store [2 x float]* %w, [2 x float]** %5, align 8
  store float %sign, float* %6, align 4
  %7 = load i32, i32* %2, align 4
  %8 = sitofp i32 %7 to float
  %9 = fpext float %8 to double
  %10 = call double @log(double %9) #3
  %11 = call double @log(double 1.990000e+00) #3
  %12 = fdiv double %10, %11
  %13 = fptosi double %12 to i32
  store i32 %13, i32* %m, align 4
  store i32 1, i32* %mj, align 4
  store i32 1, i32* %tgle, align 4
  %14 = load i32, i32* %2, align 4
  %15 = load i32, i32* %mj, align 4
  %16 = load [2 x float]*, [2 x float]** %3, align 8
  %17 = getelementptr inbounds [2 x float], [2 x float]* %16, i64 0
  %18 = getelementptr inbounds [2 x float], [2 x float]* %17, i32 0, i64 0
  %19 = load i32, i32* %2, align 4
  %20 = sdiv i32 %19, 2
  %21 = sext i32 %20 to i64
  %22 = load [2 x float]*, [2 x float]** %3, align 8
  %23 = getelementptr inbounds [2 x float], [2 x float]* %22, i64 %21
  %24 = getelementptr inbounds [2 x float], [2 x float]* %23, i32 0, i64 0
  %25 = load [2 x float]*, [2 x float]** %4, align 8
  %26 = getelementptr inbounds [2 x float], [2 x float]* %25, i64 0
  %27 = getelementptr inbounds [2 x float], [2 x float]* %26, i32 0, i64 0
  %28 = load i32, i32* %mj, align 4
  %29 = sext i32 %28 to i64
  %30 = load [2 x float]*, [2 x float]** %4, align 8
  %31 = getelementptr inbounds [2 x float], [2 x float]* %30, i64 %29
  %32 = getelementptr inbounds [2 x float], [2 x float]* %31, i32 0, i64 0
  %33 = load [2 x float]*, [2 x float]** %5, align 8
  %34 = load float, float* %6, align 4
  %35 = fpext float %34 to double
  call void (i32, i32, float*, float*, float*, float*, [2 x float]*, double, ...) bitcast (void (i32, i32, [2 x float]*, [2 x float]*, [2 x float]*, [2 x float]*, [2 x float]*, double)* @step to void (i32, i32, float*, float*, float*, float*, [2 x float]*, double, ...)*)(i32 %14, i32 %15, float* %18, float* %24, float* %27, float* %32, [2 x float]* %33, double %35)
  store i32 0, i32* %j, align 4
  br label %36

; <label>:36                                      ; preds = %93, %1
  %37 = load i32, i32* %j, align 4
  %38 = load i32, i32* %m, align 4
  %39 = sub nsw i32 %38, 2
  %40 = icmp slt i32 %37, %39
  br i1 %40, label %41, label %96

; <label>:41                                      ; preds = %36
  %42 = load i32, i32* %mj, align 4
  %43 = mul nsw i32 %42, 2
  store i32 %43, i32* %mj, align 4
  %44 = load i32, i32* %tgle, align 4
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %46, label %69

; <label>:46                                      ; preds = %41
  %47 = load i32, i32* %2, align 4
  %48 = load i32, i32* %mj, align 4
  %49 = load [2 x float]*, [2 x float]** %4, align 8
  %50 = getelementptr inbounds [2 x float], [2 x float]* %49, i64 0
  %51 = getelementptr inbounds [2 x float], [2 x float]* %50, i32 0, i64 0
  %52 = load i32, i32* %2, align 4
  %53 = sdiv i32 %52, 2
  %54 = sext i32 %53 to i64
  %55 = load [2 x float]*, [2 x float]** %4, align 8
  %56 = getelementptr inbounds [2 x float], [2 x float]* %55, i64 %54
  %57 = getelementptr inbounds [2 x float], [2 x float]* %56, i32 0, i64 0
  %58 = load [2 x float]*, [2 x float]** %3, align 8
  %59 = getelementptr inbounds [2 x float], [2 x float]* %58, i64 0
  %60 = getelementptr inbounds [2 x float], [2 x float]* %59, i32 0, i64 0
  %61 = load i32, i32* %mj, align 4
  %62 = sext i32 %61 to i64
  %63 = load [2 x float]*, [2 x float]** %3, align 8
  %64 = getelementptr inbounds [2 x float], [2 x float]* %63, i64 %62
  %65 = getelementptr inbounds [2 x float], [2 x float]* %64, i32 0, i64 0
  %66 = load [2 x float]*, [2 x float]** %5, align 8
  %67 = load float, float* %6, align 4
  %68 = fpext float %67 to double
  call void (i32, i32, float*, float*, float*, float*, [2 x float]*, double, ...) bitcast (void (i32, i32, [2 x float]*, [2 x float]*, [2 x float]*, [2 x float]*, [2 x float]*, double)* @step to void (i32, i32, float*, float*, float*, float*, [2 x float]*, double, ...)*)(i32 %47, i32 %48, float* %51, float* %57, float* %60, float* %65, [2 x float]* %66, double %68)
  store i32 0, i32* %tgle, align 4
  br label %92

; <label>:69                                      ; preds = %41
  %70 = load i32, i32* %2, align 4
  %71 = load i32, i32* %mj, align 4
  %72 = load [2 x float]*, [2 x float]** %3, align 8
  %73 = getelementptr inbounds [2 x float], [2 x float]* %72, i64 0
  %74 = getelementptr inbounds [2 x float], [2 x float]* %73, i32 0, i64 0
  %75 = load i32, i32* %2, align 4
  %76 = sdiv i32 %75, 2
  %77 = sext i32 %76 to i64
  %78 = load [2 x float]*, [2 x float]** %3, align 8
  %79 = getelementptr inbounds [2 x float], [2 x float]* %78, i64 %77
  %80 = getelementptr inbounds [2 x float], [2 x float]* %79, i32 0, i64 0
  %81 = load [2 x float]*, [2 x float]** %4, align 8
  %82 = getelementptr inbounds [2 x float], [2 x float]* %81, i64 0
  %83 = getelementptr inbounds [2 x float], [2 x float]* %82, i32 0, i64 0
  %84 = load i32, i32* %mj, align 4
  %85 = sext i32 %84 to i64
  %86 = load [2 x float]*, [2 x float]** %4, align 8
  %87 = getelementptr inbounds [2 x float], [2 x float]* %86, i64 %85
  %88 = getelementptr inbounds [2 x float], [2 x float]* %87, i32 0, i64 0
  %89 = load [2 x float]*, [2 x float]** %5, align 8
  %90 = load float, float* %6, align 4
  %91 = fpext float %90 to double
  call void (i32, i32, float*, float*, float*, float*, [2 x float]*, double, ...) bitcast (void (i32, i32, [2 x float]*, [2 x float]*, [2 x float]*, [2 x float]*, [2 x float]*, double)* @step to void (i32, i32, float*, float*, float*, float*, [2 x float]*, double, ...)*)(i32 %70, i32 %71, float* %74, float* %80, float* %83, float* %88, [2 x float]* %89, double %91)
  store i32 1, i32* %tgle, align 4
  br label %92

; <label>:92                                      ; preds = %69, %46
  br label %93

; <label>:93                                      ; preds = %92
  %94 = load i32, i32* %j, align 4
  %95 = add nsw i32 %94, 1
  store i32 %95, i32* %j, align 4
  br label %36

; <label>:96                                      ; preds = %36
  %97 = load i32, i32* %tgle, align 4
  %98 = icmp ne i32 %97, 0
  br i1 %98, label %99, label %103

; <label>:99                                      ; preds = %96
  %100 = load i32, i32* %2, align 4
  %101 = load [2 x float]*, [2 x float]** %4, align 8
  %102 = load [2 x float]*, [2 x float]** %3, align 8
  call void @ccopy(i32 %100, [2 x float]* %101, [2 x float]* %102)
  br label %103

; <label>:103                                     ; preds = %99, %96
  %104 = load i32, i32* %2, align 4
  %105 = sdiv i32 %104, 2
  store i32 %105, i32* %mj, align 4
  %106 = load i32, i32* %2, align 4
  %107 = load i32, i32* %mj, align 4
  %108 = load [2 x float]*, [2 x float]** %3, align 8
  %109 = getelementptr inbounds [2 x float], [2 x float]* %108, i64 0
  %110 = getelementptr inbounds [2 x float], [2 x float]* %109, i32 0, i64 0
  %111 = load i32, i32* %2, align 4
  %112 = sdiv i32 %111, 2
  %113 = sext i32 %112 to i64
  %114 = load [2 x float]*, [2 x float]** %3, align 8
  %115 = getelementptr inbounds [2 x float], [2 x float]* %114, i64 %113
  %116 = getelementptr inbounds [2 x float], [2 x float]* %115, i32 0, i64 0
  %117 = load [2 x float]*, [2 x float]** %4, align 8
  %118 = getelementptr inbounds [2 x float], [2 x float]* %117, i64 0
  %119 = getelementptr inbounds [2 x float], [2 x float]* %118, i32 0, i64 0
  %120 = load i32, i32* %mj, align 4
  %121 = sext i32 %120 to i64
  %122 = load [2 x float]*, [2 x float]** %4, align 8
  %123 = getelementptr inbounds [2 x float], [2 x float]* %122, i64 %121
  %124 = getelementptr inbounds [2 x float], [2 x float]* %123, i32 0, i64 0
  %125 = load [2 x float]*, [2 x float]** %5, align 8
  %126 = load float, float* %6, align 4
  %127 = fpext float %126 to double
  call void (i32, i32, float*, float*, float*, float*, [2 x float]*, double, ...) bitcast (void (i32, i32, [2 x float]*, [2 x float]*, [2 x float]*, [2 x float]*, [2 x float]*, double)* @step to void (i32, i32, float*, float*, float*, float*, [2 x float]*, double, ...)*)(i32 %106, i32 %107, float* %110, float* %116, float* %119, float* %124, [2 x float]* %125, double %127)
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
define void @ccopy(i32 %n, [2 x float]* %x, [2 x float]* %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca [2 x float]*, align 8
  %3 = alloca [2 x float]*, align 8
  %i = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  store [2 x float]* %x, [2 x float]** %2, align 8
  store [2 x float]* %y, [2 x float]** %3, align 8
  store i32 0, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %31, %0
  %5 = load i32, i32* %i, align 4
  %6 = load i32, i32* %1, align 4
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %34

; <label>:8                                       ; preds = %4
  %9 = load i32, i32* %i, align 4
  %10 = sext i32 %9 to i64
  %11 = load [2 x float]*, [2 x float]** %2, align 8
  %12 = getelementptr inbounds [2 x float], [2 x float]* %11, i64 %10
  %13 = getelementptr inbounds [2 x float], [2 x float]* %12, i32 0, i64 0
  %14 = load float, float* %13, align 4
  %15 = load i32, i32* %i, align 4
  %16 = sext i32 %15 to i64
  %17 = load [2 x float]*, [2 x float]** %3, align 8
  %18 = getelementptr inbounds [2 x float], [2 x float]* %17, i64 %16
  %19 = getelementptr inbounds [2 x float], [2 x float]* %18, i32 0, i64 0
  store float %14, float* %19, align 4
  %20 = load i32, i32* %i, align 4
  %21 = sext i32 %20 to i64
  %22 = load [2 x float]*, [2 x float]** %2, align 8
  %23 = getelementptr inbounds [2 x float], [2 x float]* %22, i64 %21
  %24 = getelementptr inbounds [2 x float], [2 x float]* %23, i32 0, i64 1
  %25 = load float, float* %24, align 4
  %26 = load i32, i32* %i, align 4
  %27 = sext i32 %26 to i64
  %28 = load [2 x float]*, [2 x float]** %3, align 8
  %29 = getelementptr inbounds [2 x float], [2 x float]* %28, i64 %27
  %30 = getelementptr inbounds [2 x float], [2 x float]* %29, i32 0, i64 1
  store float %25, float* %30, align 4
  br label %31

; <label>:31                                      ; preds = %8
  %32 = load i32, i32* %i, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %i, align 4
  br label %4

; <label>:34                                      ; preds = %4
  ret void
}

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

; Function Attrs: nounwind uwtable
define void @step(i32 %n, i32 %mj, [2 x float]* %a, [2 x float]* %b, [2 x float]* %c, [2 x float]* %d, [2 x float]* %w, double) #0 {
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
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca [2 x float]*, align 8
  %23 = alloca [2 x float]*, align 8
  %24 = alloca [2 x float]*, align 8
  %25 = alloca [2 x float]*, align 8
  %26 = alloca [2 x float]*, align 8
  %27 = alloca float, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %jc = alloca i32, align 4
  %jw = alloca i32, align 4
  %l = alloca i32, align 4
  %lj = alloca i32, align 4
  %mj2 = alloca i32, align 4
  %mseg = alloca i32, align 4
  %rp = alloca float, align 4
  %up = alloca float, align 4
  %wr = alloca [4 x float], align 16
  %wu = alloca [4 x float], align 16
  %xmm0 = alloca <4 x float>, align 16
  %xmm1 = alloca <4 x float>, align 16
  %xmm2 = alloca <4 x float>, align 16
  %xmm3 = alloca <4 x float>, align 16
  %xmm4 = alloca <4 x float>, align 16
  %xmm5 = alloca <4 x float>, align 16
  %xmm6 = alloca <4 x float>, align 16
  %xmm7 = alloca <4 x float>, align 16
  %__a = alloca <4 x float>, align 16
  %__b = alloca <4 x float>, align 16
  %28 = alloca <4 x float>, align 16
  %sign = fptrunc double %0 to float
  store i32 %n, i32* %20, align 4
  store i32 %mj, i32* %21, align 4
  store [2 x float]* %a, [2 x float]** %22, align 8
  store [2 x float]* %b, [2 x float]** %23, align 8
  store [2 x float]* %c, [2 x float]** %24, align 8
  store [2 x float]* %d, [2 x float]** %25, align 8
  store [2 x float]* %w, [2 x float]** %26, align 8
  store float %sign, float* %27, align 4
  %29 = load i32, i32* %21, align 4
  %30 = mul nsw i32 2, %29
  store i32 %30, i32* %mj2, align 4
  %31 = load i32, i32* %20, align 4
  %32 = load i32, i32* %mj2, align 4
  %33 = sdiv i32 %31, %32
  store i32 %33, i32* %lj, align 4
  store i32 0, i32* %j, align 4
  br label %34

; <label>:34                                      ; preds = %285, %1
  %35 = load i32, i32* %j, align 4
  %36 = load i32, i32* %lj, align 4
  %37 = icmp slt i32 %35, %36
  br i1 %37, label %38, label %288

; <label>:38                                      ; preds = %34
  %39 = load i32, i32* %j, align 4
  %40 = load i32, i32* %21, align 4
  %41 = mul nsw i32 %39, %40
  store i32 %41, i32* %jw, align 4
  %42 = load i32, i32* %j, align 4
  %43 = load i32, i32* %mj2, align 4
  %44 = mul nsw i32 %42, %43
  store i32 %44, i32* %jc, align 4
  %45 = load i32, i32* %jw, align 4
  %46 = sext i32 %45 to i64
  %47 = load [2 x float]*, [2 x float]** %26, align 8
  %48 = getelementptr inbounds [2 x float], [2 x float]* %47, i64 %46
  %49 = getelementptr inbounds [2 x float], [2 x float]* %48, i32 0, i64 0
  %50 = load float, float* %49, align 4
  store float %50, float* %rp, align 4
  %51 = load i32, i32* %jw, align 4
  %52 = sext i32 %51 to i64
  %53 = load [2 x float]*, [2 x float]** %26, align 8
  %54 = getelementptr inbounds [2 x float], [2 x float]* %53, i64 %52
  %55 = getelementptr inbounds [2 x float], [2 x float]* %54, i32 0, i64 1
  %56 = load float, float* %55, align 4
  store float %56, float* %up, align 4
  %57 = load float, float* %27, align 4
  %58 = fpext float %57 to double
  %59 = fcmp olt double %58, 0.000000e+00
  br i1 %59, label %60, label %63

; <label>:60                                      ; preds = %38
  %61 = load float, float* %up, align 4
  %62 = fsub float -0.000000e+00, %61
  store float %62, float* %up, align 4
  br label %63

; <label>:63                                      ; preds = %60, %38
  %64 = load i32, i32* %21, align 4
  %65 = icmp slt i32 %64, 2
  br i1 %65, label %66, label %175

; <label>:66                                      ; preds = %63
  %67 = load float, float* %rp, align 4
  %68 = load i32, i32* %jw, align 4
  %69 = sext i32 %68 to i64
  %70 = load [2 x float]*, [2 x float]** %22, align 8
  %71 = getelementptr inbounds [2 x float], [2 x float]* %70, i64 %69
  %72 = getelementptr inbounds [2 x float], [2 x float]* %71, i32 0, i64 0
  %73 = load float, float* %72, align 4
  %74 = load i32, i32* %jw, align 4
  %75 = sext i32 %74 to i64
  %76 = load [2 x float]*, [2 x float]** %23, align 8
  %77 = getelementptr inbounds [2 x float], [2 x float]* %76, i64 %75
  %78 = getelementptr inbounds [2 x float], [2 x float]* %77, i32 0, i64 0
  %79 = load float, float* %78, align 4
  %80 = fsub float %73, %79
  %81 = fmul float %67, %80
  %82 = load float, float* %up, align 4
  %83 = load i32, i32* %jw, align 4
  %84 = sext i32 %83 to i64
  %85 = load [2 x float]*, [2 x float]** %22, align 8
  %86 = getelementptr inbounds [2 x float], [2 x float]* %85, i64 %84
  %87 = getelementptr inbounds [2 x float], [2 x float]* %86, i32 0, i64 1
  %88 = load float, float* %87, align 4
  %89 = load i32, i32* %jw, align 4
  %90 = sext i32 %89 to i64
  %91 = load [2 x float]*, [2 x float]** %23, align 8
  %92 = getelementptr inbounds [2 x float], [2 x float]* %91, i64 %90
  %93 = getelementptr inbounds [2 x float], [2 x float]* %92, i32 0, i64 1
  %94 = load float, float* %93, align 4
  %95 = fsub float %88, %94
  %96 = fmul float %82, %95
  %97 = fsub float %81, %96
  %98 = load i32, i32* %jc, align 4
  %99 = sext i32 %98 to i64
  %100 = load [2 x float]*, [2 x float]** %25, align 8
  %101 = getelementptr inbounds [2 x float], [2 x float]* %100, i64 %99
  %102 = getelementptr inbounds [2 x float], [2 x float]* %101, i32 0, i64 0
  store float %97, float* %102, align 4
  %103 = load float, float* %up, align 4
  %104 = load i32, i32* %jw, align 4
  %105 = sext i32 %104 to i64
  %106 = load [2 x float]*, [2 x float]** %22, align 8
  %107 = getelementptr inbounds [2 x float], [2 x float]* %106, i64 %105
  %108 = getelementptr inbounds [2 x float], [2 x float]* %107, i32 0, i64 0
  %109 = load float, float* %108, align 4
  %110 = load i32, i32* %jw, align 4
  %111 = sext i32 %110 to i64
  %112 = load [2 x float]*, [2 x float]** %23, align 8
  %113 = getelementptr inbounds [2 x float], [2 x float]* %112, i64 %111
  %114 = getelementptr inbounds [2 x float], [2 x float]* %113, i32 0, i64 0
  %115 = load float, float* %114, align 4
  %116 = fsub float %109, %115
  %117 = fmul float %103, %116
  %118 = load float, float* %rp, align 4
  %119 = load i32, i32* %jw, align 4
  %120 = sext i32 %119 to i64
  %121 = load [2 x float]*, [2 x float]** %22, align 8
  %122 = getelementptr inbounds [2 x float], [2 x float]* %121, i64 %120
  %123 = getelementptr inbounds [2 x float], [2 x float]* %122, i32 0, i64 1
  %124 = load float, float* %123, align 4
  %125 = load i32, i32* %jw, align 4
  %126 = sext i32 %125 to i64
  %127 = load [2 x float]*, [2 x float]** %23, align 8
  %128 = getelementptr inbounds [2 x float], [2 x float]* %127, i64 %126
  %129 = getelementptr inbounds [2 x float], [2 x float]* %128, i32 0, i64 1
  %130 = load float, float* %129, align 4
  %131 = fsub float %124, %130
  %132 = fmul float %118, %131
  %133 = fadd float %117, %132
  %134 = load i32, i32* %jc, align 4
  %135 = sext i32 %134 to i64
  %136 = load [2 x float]*, [2 x float]** %25, align 8
  %137 = getelementptr inbounds [2 x float], [2 x float]* %136, i64 %135
  %138 = getelementptr inbounds [2 x float], [2 x float]* %137, i32 0, i64 1
  store float %133, float* %138, align 4
  %139 = load i32, i32* %jw, align 4
  %140 = sext i32 %139 to i64
  %141 = load [2 x float]*, [2 x float]** %22, align 8
  %142 = getelementptr inbounds [2 x float], [2 x float]* %141, i64 %140
  %143 = getelementptr inbounds [2 x float], [2 x float]* %142, i32 0, i64 0
  %144 = load float, float* %143, align 4
  %145 = load i32, i32* %jw, align 4
  %146 = sext i32 %145 to i64
  %147 = load [2 x float]*, [2 x float]** %23, align 8
  %148 = getelementptr inbounds [2 x float], [2 x float]* %147, i64 %146
  %149 = getelementptr inbounds [2 x float], [2 x float]* %148, i32 0, i64 0
  %150 = load float, float* %149, align 4
  %151 = fadd float %144, %150
  %152 = load i32, i32* %jc, align 4
  %153 = sext i32 %152 to i64
  %154 = load [2 x float]*, [2 x float]** %24, align 8
  %155 = getelementptr inbounds [2 x float], [2 x float]* %154, i64 %153
  %156 = getelementptr inbounds [2 x float], [2 x float]* %155, i32 0, i64 0
  store float %151, float* %156, align 4
  %157 = load i32, i32* %jw, align 4
  %158 = sext i32 %157 to i64
  %159 = load [2 x float]*, [2 x float]** %22, align 8
  %160 = getelementptr inbounds [2 x float], [2 x float]* %159, i64 %158
  %161 = getelementptr inbounds [2 x float], [2 x float]* %160, i32 0, i64 1
  %162 = load float, float* %161, align 4
  %163 = load i32, i32* %jw, align 4
  %164 = sext i32 %163 to i64
  %165 = load [2 x float]*, [2 x float]** %23, align 8
  %166 = getelementptr inbounds [2 x float], [2 x float]* %165, i64 %164
  %167 = getelementptr inbounds [2 x float], [2 x float]* %166, i32 0, i64 1
  %168 = load float, float* %167, align 4
  %169 = fadd float %162, %168
  %170 = load i32, i32* %jc, align 4
  %171 = sext i32 %170 to i64
  %172 = load [2 x float]*, [2 x float]** %24, align 8
  %173 = getelementptr inbounds [2 x float], [2 x float]* %172, i64 %171
  %174 = getelementptr inbounds [2 x float], [2 x float]* %173, i32 0, i64 1
  store float %169, float* %174, align 4
  br label %284

; <label>:175                                     ; preds = %63
  %176 = load float, float* %rp, align 4
  %177 = getelementptr inbounds [4 x float], [4 x float]* %wr, i32 0, i64 0
  store float %176, float* %177, align 4
  %178 = load float, float* %rp, align 4
  %179 = getelementptr inbounds [4 x float], [4 x float]* %wr, i32 0, i64 1
  store float %178, float* %179, align 4
  %180 = load float, float* %rp, align 4
  %181 = getelementptr inbounds [4 x float], [4 x float]* %wr, i32 0, i64 2
  store float %180, float* %181, align 4
  %182 = load float, float* %rp, align 4
  %183 = getelementptr inbounds [4 x float], [4 x float]* %wr, i32 0, i64 3
  store float %182, float* %183, align 4
  %184 = load float, float* %up, align 4
  %185 = fsub float -0.000000e+00, %184
  %186 = getelementptr inbounds [4 x float], [4 x float]* %wu, i32 0, i64 0
  store float %185, float* %186, align 4
  %187 = load float, float* %up, align 4
  %188 = getelementptr inbounds [4 x float], [4 x float]* %wu, i32 0, i64 1
  store float %187, float* %188, align 4
  %189 = load float, float* %up, align 4
  %190 = fsub float -0.000000e+00, %189
  %191 = getelementptr inbounds [4 x float], [4 x float]* %wu, i32 0, i64 2
  store float %190, float* %191, align 4
  %192 = load float, float* %up, align 4
  %193 = getelementptr inbounds [4 x float], [4 x float]* %wu, i32 0, i64 3
  store float %192, float* %193, align 4
  %194 = getelementptr inbounds [4 x float], [4 x float]* %wr, i32 0, i32 0
  store float* %194, float** %19, align 8
  %195 = load float*, float** %19, align 8
  %196 = bitcast float* %195 to <4 x float>*
  %197 = load <4 x float>, <4 x float>* %196, align 16
  store <4 x float> %197, <4 x float>* %xmm6, align 16
  %198 = getelementptr inbounds [4 x float], [4 x float]* %wu, i32 0, i32 0
  store float* %198, float** %2, align 8
  %199 = load float*, float** %2, align 8
  %200 = bitcast float* %199 to <4 x float>*
  %201 = load <4 x float>, <4 x float>* %200, align 16
  store <4 x float> %201, <4 x float>* %xmm7, align 16
  store i32 0, i32* %k, align 4
  br label %202

; <label>:202                                     ; preds = %280, %175
  %203 = load i32, i32* %k, align 4
  %204 = load i32, i32* %21, align 4
  %205 = icmp slt i32 %203, %204
  br i1 %205, label %206, label %283

; <label>:206                                     ; preds = %202
  %207 = load i32, i32* %jw, align 4
  %208 = load i32, i32* %k, align 4
  %209 = add nsw i32 %207, %208
  %210 = sext i32 %209 to i64
  %211 = load [2 x float]*, [2 x float]** %22, align 8
  %212 = getelementptr inbounds [2 x float], [2 x float]* %211, i64 %210
  %213 = getelementptr inbounds [2 x float], [2 x float]* %212, i32 0, i64 0
  store float* %213, float** %3, align 8
  %214 = load float*, float** %3, align 8
  %215 = bitcast float* %214 to <4 x float>*
  %216 = load <4 x float>, <4 x float>* %215, align 16
  store <4 x float> %216, <4 x float>* %xmm0, align 16
  %217 = load i32, i32* %jw, align 4
  %218 = load i32, i32* %k, align 4
  %219 = add nsw i32 %217, %218
  %220 = sext i32 %219 to i64
  %221 = load [2 x float]*, [2 x float]** %23, align 8
  %222 = getelementptr inbounds [2 x float], [2 x float]* %221, i64 %220
  %223 = getelementptr inbounds [2 x float], [2 x float]* %222, i32 0, i64 0
  store float* %223, float** %4, align 8
  %224 = load float*, float** %4, align 8
  %225 = bitcast float* %224 to <4 x float>*
  %226 = load <4 x float>, <4 x float>* %225, align 16
  store <4 x float> %226, <4 x float>* %xmm1, align 16
  %227 = load <4 x float>, <4 x float>* %xmm0, align 16
  %228 = load <4 x float>, <4 x float>* %xmm1, align 16
  store <4 x float> %227, <4 x float>* %5, align 16
  store <4 x float> %228, <4 x float>* %6, align 16
  %229 = load <4 x float>, <4 x float>* %5, align 16
  %230 = load <4 x float>, <4 x float>* %6, align 16
  %231 = fadd <4 x float> %229, %230
  store <4 x float> %231, <4 x float>* %xmm2, align 16
  %232 = load i32, i32* %jc, align 4
  %233 = load i32, i32* %k, align 4
  %234 = add nsw i32 %232, %233
  %235 = sext i32 %234 to i64
  %236 = load [2 x float]*, [2 x float]** %24, align 8
  %237 = getelementptr inbounds [2 x float], [2 x float]* %236, i64 %235
  %238 = getelementptr inbounds [2 x float], [2 x float]* %237, i32 0, i64 0
  %239 = load <4 x float>, <4 x float>* %xmm2, align 16
  store float* %238, float** %7, align 8
  store <4 x float> %239, <4 x float>* %8, align 16
  %240 = load <4 x float>, <4 x float>* %8, align 16
  %241 = load float*, float** %7, align 8
  %242 = bitcast float* %241 to <4 x float>*
  store <4 x float> %240, <4 x float>* %242, align 16
  %243 = load <4 x float>, <4 x float>* %xmm0, align 16
  %244 = load <4 x float>, <4 x float>* %xmm1, align 16
  store <4 x float> %243, <4 x float>* %9, align 16
  store <4 x float> %244, <4 x float>* %10, align 16
  %245 = load <4 x float>, <4 x float>* %9, align 16
  %246 = load <4 x float>, <4 x float>* %10, align 16
  %247 = fsub <4 x float> %245, %246
  store <4 x float> %247, <4 x float>* %xmm3, align 16
  %248 = load <4 x float>, <4 x float>* %xmm3, align 16
  store <4 x float> %248, <4 x float>* %__a, align 16
  %249 = load <4 x float>, <4 x float>* %xmm3, align 16
  store <4 x float> %249, <4 x float>* %__b, align 16
  %250 = load <4 x float>, <4 x float>* %__a, align 16
  %251 = load <4 x float>, <4 x float>* %__b, align 16
  %252 = shufflevector <4 x float> %250, <4 x float> %251, <4 x i32> <i32 1, i32 0, i32 7, i32 6>
  store <4 x float> %252, <4 x float>* %28
  %253 = load <4 x float>, <4 x float>* %28
  store <4 x float> %253, <4 x float>* %xmm4, align 16
  %254 = load <4 x float>, <4 x float>* %xmm6, align 16
  %255 = load <4 x float>, <4 x float>* %xmm3, align 16
  store <4 x float> %254, <4 x float>* %11, align 16
  store <4 x float> %255, <4 x float>* %12, align 16
  %256 = load <4 x float>, <4 x float>* %11, align 16
  %257 = load <4 x float>, <4 x float>* %12, align 16
  %258 = fmul <4 x float> %256, %257
  store <4 x float> %258, <4 x float>* %xmm0, align 16
  %259 = load <4 x float>, <4 x float>* %xmm7, align 16
  %260 = load <4 x float>, <4 x float>* %xmm4, align 16
  store <4 x float> %259, <4 x float>* %13, align 16
  store <4 x float> %260, <4 x float>* %14, align 16
  %261 = load <4 x float>, <4 x float>* %13, align 16
  %262 = load <4 x float>, <4 x float>* %14, align 16
  %263 = fmul <4 x float> %261, %262
  store <4 x float> %263, <4 x float>* %xmm1, align 16
  %264 = load <4 x float>, <4 x float>* %xmm0, align 16
  %265 = load <4 x float>, <4 x float>* %xmm1, align 16
  store <4 x float> %264, <4 x float>* %15, align 16
  store <4 x float> %265, <4 x float>* %16, align 16
  %266 = load <4 x float>, <4 x float>* %15, align 16
  %267 = load <4 x float>, <4 x float>* %16, align 16
  %268 = fadd <4 x float> %266, %267
  store <4 x float> %268, <4 x float>* %xmm2, align 16
  %269 = load i32, i32* %jc, align 4
  %270 = load i32, i32* %k, align 4
  %271 = add nsw i32 %269, %270
  %272 = sext i32 %271 to i64
  %273 = load [2 x float]*, [2 x float]** %25, align 8
  %274 = getelementptr inbounds [2 x float], [2 x float]* %273, i64 %272
  %275 = getelementptr inbounds [2 x float], [2 x float]* %274, i32 0, i64 0
  %276 = load <4 x float>, <4 x float>* %xmm2, align 16
  store float* %275, float** %17, align 8
  store <4 x float> %276, <4 x float>* %18, align 16
  %277 = load <4 x float>, <4 x float>* %18, align 16
  %278 = load float*, float** %17, align 8
  %279 = bitcast float* %278 to <4 x float>*
  store <4 x float> %277, <4 x float>* %279, align 16
  br label %280

; <label>:280                                     ; preds = %206
  %281 = load i32, i32* %k, align 4
  %282 = add nsw i32 %281, 2
  store i32 %282, i32* %k, align 4
  br label %202

; <label>:283                                     ; preds = %202
  br label %284

; <label>:284                                     ; preds = %283, %66
  br label %285

; <label>:285                                     ; preds = %284
  %286 = load i32, i32* %j, align 4
  %287 = add nsw i32 %286, 1
  store i32 %287, i32* %j, align 4
  br label %34

; <label>:288                                     ; preds = %34
  ret void
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
