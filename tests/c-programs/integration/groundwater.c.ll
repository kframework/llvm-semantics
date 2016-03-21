; ModuleID = './groundwater.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"%d %d %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %nx = alloca i32, align 4
  %ny = alloca i32, align 4
  %istep = alloca i32, align 4
  %pi = alloca double, align 8
  %a0 = alloca double, align 8
  %b0 = alloca double, align 8
  %h0 = alloca double, align 8
  %ch = alloca double, align 8
  %sx = alloca double, align 8
  %sy = alloca double, align 8
  %hx = alloca double, align 8
  %hy = alloca double, align 8
  %p = alloca double, align 8
  %x = alloca double, align 8
  %y = alloca double, align 8
  %phi = alloca [6 x [3 x double]], align 16
  %ck = alloca [6 x [3 x double]], align 16
  %sn = alloca [6 x [3 x double]], align 16
  store i32 0, i32* %1
  store i32 6, i32* %nx, align 4
  store i32 3, i32* %ny, align 4
  %2 = call double @atan(double 1.000000e+00) #3
  %3 = fmul double 4.000000e+00, %2
  store double %3, double* %pi, align 8
  store double 1.000000e+00, double* %a0, align 8
  store double -4.000000e-02, double* %b0, align 8
  store double 2.000000e+02, double* %h0, align 8
  store double -2.000000e+01, double* %ch, align 8
  store double 1.000000e+03, double* %sx, align 8
  store double 5.000000e+02, double* %sy, align 8
  %4 = load double, double* %sx, align 8
  %5 = load i32, i32* %nx, align 4
  %6 = sub nsw i32 %5, 1
  %7 = sitofp i32 %6 to double
  %8 = fdiv double %4, %7
  store double %8, double* %hx, align 8
  %9 = load double, double* %sy, align 8
  %10 = load i32, i32* %ny, align 4
  %11 = sub nsw i32 %10, 1
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %9, %12
  store double %13, double* %hy, align 8
  store double 5.000000e-01, double* %p, align 8
  store i32 0, i32* %i, align 4
  br label %14

; <label>:14                                      ; preds = %73, %0
  %15 = load i32, i32* %i, align 4
  %16 = load i32, i32* %nx, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %76

; <label>:18                                      ; preds = %14
  %19 = load i32, i32* %i, align 4
  %20 = sitofp i32 %19 to double
  %21 = load double, double* %hx, align 8
  %22 = fmul double %20, %21
  store double %22, double* %x, align 8
  store i32 0, i32* %j, align 4
  br label %23

; <label>:23                                      ; preds = %69, %18
  %24 = load i32, i32* %j, align 4
  %25 = load i32, i32* %ny, align 4
  %26 = icmp slt i32 %24, %25
  br i1 %26, label %27, label %72

; <label>:27                                      ; preds = %23
  %28 = load i32, i32* %j, align 4
  %29 = sitofp i32 %28 to double
  %30 = load double, double* %hy, align 8
  %31 = fmul double %29, %30
  store double %31, double* %y, align 8
  %32 = load double, double* %a0, align 8
  %33 = load double, double* %b0, align 8
  %34 = load double, double* %y, align 8
  %35 = fmul double %33, %34
  %36 = fadd double %32, %35
  %37 = load i32, i32* %j, align 4
  %38 = sext i32 %37 to i64
  %39 = load i32, i32* %i, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [6 x [3 x double]], [6 x [3 x double]]* %ck, i32 0, i64 %40
  %42 = getelementptr inbounds [3 x double], [3 x double]* %41, i32 0, i64 %38
  store double %36, double* %42, align 8
  %43 = load double, double* %h0, align 8
  %44 = load double, double* %ch, align 8
  %45 = load double, double* %pi, align 8
  %46 = load double, double* %x, align 8
  %47 = fmul double %45, %46
  %48 = load double, double* %sx, align 8
  %49 = fdiv double %47, %48
  %50 = call double @cos(double %49) #3
  %51 = fmul double %44, %50
  %52 = load double, double* %y, align 8
  %53 = fmul double %51, %52
  %54 = load double, double* %sy, align 8
  %55 = fdiv double %53, %54
  %56 = fadd double %43, %55
  %57 = load i32, i32* %j, align 4
  %58 = sext i32 %57 to i64
  %59 = load i32, i32* %i, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [6 x [3 x double]], [6 x [3 x double]]* %phi, i32 0, i64 %60
  %62 = getelementptr inbounds [3 x double], [3 x double]* %61, i32 0, i64 %58
  store double %56, double* %62, align 8
  %63 = load i32, i32* %j, align 4
  %64 = sext i32 %63 to i64
  %65 = load i32, i32* %i, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [6 x [3 x double]], [6 x [3 x double]]* %sn, i32 0, i64 %66
  %68 = getelementptr inbounds [3 x double], [3 x double]* %67, i32 0, i64 %64
  store double 0.000000e+00, double* %68, align 8
  br label %69

; <label>:69                                      ; preds = %27
  %70 = load i32, i32* %j, align 4
  %71 = add nsw i32 %70, 1
  store i32 %71, i32* %j, align 4
  br label %23

; <label>:72                                      ; preds = %23
  br label %73

; <label>:73                                      ; preds = %72
  %74 = load i32, i32* %i, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, i32* %i, align 4
  br label %14

; <label>:76                                      ; preds = %14
  store i32 0, i32* %istep, align 4
  br label %77

; <label>:77                                      ; preds = %141, %76
  %78 = load i32, i32* %istep, align 4
  %79 = icmp slt i32 %78, 2
  br i1 %79, label %80, label %144

; <label>:80                                      ; preds = %77
  store i32 0, i32* %j, align 4
  br label %81

; <label>:81                                      ; preds = %129, %80
  %82 = load i32, i32* %j, align 4
  %83 = load i32, i32* %ny, align 4
  %84 = icmp slt i32 %82, %83
  br i1 %84, label %85, label %132

; <label>:85                                      ; preds = %81
  %86 = load i32, i32* %j, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds [6 x [3 x double]], [6 x [3 x double]]* %phi, i32 0, i64 1
  %89 = getelementptr inbounds [3 x double], [3 x double]* %88, i32 0, i64 %87
  %90 = load double, double* %89, align 8
  %91 = fmul double 4.000000e+00, %90
  %92 = load i32, i32* %j, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds [6 x [3 x double]], [6 x [3 x double]]* %phi, i32 0, i64 2
  %95 = getelementptr inbounds [3 x double], [3 x double]* %94, i32 0, i64 %93
  %96 = load double, double* %95, align 8
  %97 = fsub double %91, %96
  %98 = fdiv double %97, 3.000000e+00
  %99 = load i32, i32* %j, align 4
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds [6 x [3 x double]], [6 x [3 x double]]* %phi, i32 0, i64 0
  %102 = getelementptr inbounds [3 x double], [3 x double]* %101, i32 0, i64 %100
  store double %98, double* %102, align 8
  %103 = load i32, i32* %j, align 4
  %104 = sext i32 %103 to i64
  %105 = load i32, i32* %nx, align 4
  %106 = sub nsw i32 %105, 2
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds [6 x [3 x double]], [6 x [3 x double]]* %phi, i32 0, i64 %107
  %109 = getelementptr inbounds [3 x double], [3 x double]* %108, i32 0, i64 %104
  %110 = load double, double* %109, align 8
  %111 = fmul double 4.000000e+00, %110
  %112 = load i32, i32* %j, align 4
  %113 = sext i32 %112 to i64
  %114 = load i32, i32* %nx, align 4
  %115 = sub nsw i32 %114, 3
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds [6 x [3 x double]], [6 x [3 x double]]* %phi, i32 0, i64 %116
  %118 = getelementptr inbounds [3 x double], [3 x double]* %117, i32 0, i64 %113
  %119 = load double, double* %118, align 8
  %120 = fsub double %111, %119
  %121 = fdiv double %120, 3.000000e+00
  %122 = load i32, i32* %j, align 4
  %123 = sext i32 %122 to i64
  %124 = load i32, i32* %nx, align 4
  %125 = sub nsw i32 %124, 1
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds [6 x [3 x double]], [6 x [3 x double]]* %phi, i32 0, i64 %126
  %128 = getelementptr inbounds [3 x double], [3 x double]* %127, i32 0, i64 %123
  store double %121, double* %128, align 8
  br label %129

; <label>:129                                     ; preds = %85
  %130 = load i32, i32* %j, align 4
  %131 = add nsw i32 %130, 1
  store i32 %131, i32* %j, align 4
  br label %81

; <label>:132                                     ; preds = %81
  %133 = getelementptr inbounds [6 x [3 x double]], [6 x [3 x double]]* %phi, i32 0, i32 0
  %134 = getelementptr inbounds [6 x [3 x double]], [6 x [3 x double]]* %ck, i32 0, i32 0
  %135 = getelementptr inbounds [6 x [3 x double]], [6 x [3 x double]]* %sn, i32 0, i32 0
  %136 = load i32, i32* %nx, align 4
  %137 = load i32, i32* %ny, align 4
  %138 = load double, double* %p, align 8
  %139 = load double, double* %hx, align 8
  %140 = load double, double* %hy, align 8
  call void @rx2d([3 x double]* %133, [3 x double]* %134, [3 x double]* %135, i32 %136, i32 %137, double %138, double %139, double %140)
  br label %141

; <label>:141                                     ; preds = %132
  %142 = load i32, i32* %istep, align 4
  %143 = add nsw i32 %142, 1
  store i32 %143, i32* %istep, align 4
  br label %77

; <label>:144                                     ; preds = %77
  store i32 0, i32* %i, align 4
  br label %145

; <label>:145                                     ; preds = %183, %144
  %146 = load i32, i32* %i, align 4
  %147 = load i32, i32* %nx, align 4
  %148 = icmp slt i32 %146, %147
  br i1 %148, label %149, label %186

; <label>:149                                     ; preds = %145
  %150 = load i32, i32* %i, align 4
  %151 = sitofp i32 %150 to double
  %152 = load double, double* %hx, align 8
  %153 = fmul double %151, %152
  store double %153, double* %x, align 8
  store i32 0, i32* %j, align 4
  br label %154

; <label>:154                                     ; preds = %179, %149
  %155 = load i32, i32* %j, align 4
  %156 = load i32, i32* %ny, align 4
  %157 = icmp slt i32 %155, %156
  br i1 %157, label %158, label %182

; <label>:158                                     ; preds = %154
  %159 = load i32, i32* %j, align 4
  %160 = sitofp i32 %159 to double
  %161 = load double, double* %hy, align 8
  %162 = fmul double %160, %161
  store double %162, double* %y, align 8
  %163 = load double, double* %x, align 8
  %164 = fmul double %163, 1.000000e+01
  %165 = fptosi double %164 to i32
  %166 = load double, double* %y, align 8
  %167 = fmul double %166, 1.000000e+01
  %168 = fptosi double %167 to i32
  %169 = load i32, i32* %j, align 4
  %170 = sext i32 %169 to i64
  %171 = load i32, i32* %i, align 4
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds [6 x [3 x double]], [6 x [3 x double]]* %phi, i32 0, i64 %172
  %174 = getelementptr inbounds [3 x double], [3 x double]* %173, i32 0, i64 %170
  %175 = load double, double* %174, align 8
  %176 = fptosi double %175 to i32
  %177 = mul nsw i32 %176, 10
  %178 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 %165, i32 %168, i32 %177)
  br label %179

; <label>:179                                     ; preds = %158
  %180 = load i32, i32* %j, align 4
  %181 = add nsw i32 %180, 1
  store i32 %181, i32* %j, align 4
  br label %154

; <label>:182                                     ; preds = %154
  br label %183

; <label>:183                                     ; preds = %182
  %184 = load i32, i32* %i, align 4
  %185 = add nsw i32 %184, 1
  store i32 %185, i32* %i, align 4
  br label %145

; <label>:186                                     ; preds = %145
  ret i32 0
}

; Function Attrs: nounwind
declare double @atan(double) #1

; Function Attrs: nounwind
declare double @cos(double) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @rx2d([3 x double]* %fn, [3 x double]* %dn, [3 x double]* %s, i32 %nx, i32 %ny, double %p, double %hx, double %hy) #0 {
  %1 = alloca [3 x double]*, align 8
  %2 = alloca [3 x double]*, align 8
  %3 = alloca [3 x double]*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  %8 = alloca double, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %hx2 = alloca double, align 8
  %a = alloca double, align 8
  %b = alloca double, align 8
  %q = alloca double, align 8
  %cip = alloca double, align 8
  %cim = alloca double, align 8
  %cjp = alloca double, align 8
  %cjm = alloca double, align 8
  store [3 x double]* %fn, [3 x double]** %1, align 8
  store [3 x double]* %dn, [3 x double]** %2, align 8
  store [3 x double]* %s, [3 x double]** %3, align 8
  store i32 %nx, i32* %4, align 4
  store i32 %ny, i32* %5, align 4
  store double %p, double* %6, align 8
  store double %hx, double* %7, align 8
  store double %hy, double* %8, align 8
  %9 = load double, double* %7, align 8
  %10 = load double, double* %7, align 8
  %11 = fmul double %9, %10
  store double %11, double* %hx2, align 8
  %12 = load double, double* %hx2, align 8
  %13 = load double, double* %8, align 8
  %14 = load double, double* %8, align 8
  %15 = fmul double %13, %14
  %16 = fdiv double %12, %15
  store double %16, double* %a, align 8
  %17 = load double, double* %a, align 8
  %18 = fadd double 1.000000e+00, %17
  %19 = fmul double 4.000000e+00, %18
  %20 = fdiv double 1.000000e+00, %19
  store double %20, double* %b, align 8
  %21 = load double, double* %6, align 8
  %22 = fsub double 1.000000e+00, %21
  store double %22, double* %q, align 8
  store i32 1, i32* %i, align 4
  br label %23

; <label>:23                                      ; preds = %205, %0
  %24 = load i32, i32* %i, align 4
  %25 = load i32, i32* %4, align 4
  %26 = sub nsw i32 %25, 1
  %27 = icmp slt i32 %24, %26
  br i1 %27, label %28, label %208

; <label>:28                                      ; preds = %23
  store i32 1, i32* %j, align 4
  br label %29

; <label>:29                                      ; preds = %201, %28
  %30 = load i32, i32* %j, align 4
  %31 = load i32, i32* %5, align 4
  %32 = sub nsw i32 %31, 1
  %33 = icmp slt i32 %30, %32
  br i1 %33, label %34, label %204

; <label>:34                                      ; preds = %29
  %35 = load double, double* %b, align 8
  %36 = load i32, i32* %j, align 4
  %37 = sext i32 %36 to i64
  %38 = load i32, i32* %i, align 4
  %39 = add nsw i32 %38, 1
  %40 = sext i32 %39 to i64
  %41 = load [3 x double]*, [3 x double]** %2, align 8
  %42 = getelementptr inbounds [3 x double], [3 x double]* %41, i64 %40
  %43 = getelementptr inbounds [3 x double], [3 x double]* %42, i32 0, i64 %37
  %44 = load double, double* %43, align 8
  %45 = load i32, i32* %j, align 4
  %46 = sext i32 %45 to i64
  %47 = load i32, i32* %i, align 4
  %48 = sext i32 %47 to i64
  %49 = load [3 x double]*, [3 x double]** %2, align 8
  %50 = getelementptr inbounds [3 x double], [3 x double]* %49, i64 %48
  %51 = getelementptr inbounds [3 x double], [3 x double]* %50, i32 0, i64 %46
  %52 = load double, double* %51, align 8
  %53 = fdiv double %44, %52
  %54 = fadd double %53, 1.000000e+00
  %55 = fmul double %35, %54
  store double %55, double* %cip, align 8
  %56 = load double, double* %b, align 8
  %57 = load i32, i32* %j, align 4
  %58 = sext i32 %57 to i64
  %59 = load i32, i32* %i, align 4
  %60 = sub nsw i32 %59, 1
  %61 = sext i32 %60 to i64
  %62 = load [3 x double]*, [3 x double]** %2, align 8
  %63 = getelementptr inbounds [3 x double], [3 x double]* %62, i64 %61
  %64 = getelementptr inbounds [3 x double], [3 x double]* %63, i32 0, i64 %58
  %65 = load double, double* %64, align 8
  %66 = load i32, i32* %j, align 4
  %67 = sext i32 %66 to i64
  %68 = load i32, i32* %i, align 4
  %69 = sext i32 %68 to i64
  %70 = load [3 x double]*, [3 x double]** %2, align 8
  %71 = getelementptr inbounds [3 x double], [3 x double]* %70, i64 %69
  %72 = getelementptr inbounds [3 x double], [3 x double]* %71, i32 0, i64 %67
  %73 = load double, double* %72, align 8
  %74 = fdiv double %65, %73
  %75 = fadd double %74, 1.000000e+00
  %76 = fmul double %56, %75
  store double %76, double* %cim, align 8
  %77 = load double, double* %a, align 8
  %78 = load double, double* %b, align 8
  %79 = fmul double %77, %78
  %80 = load i32, i32* %j, align 4
  %81 = add nsw i32 %80, 1
  %82 = sext i32 %81 to i64
  %83 = load i32, i32* %i, align 4
  %84 = sext i32 %83 to i64
  %85 = load [3 x double]*, [3 x double]** %2, align 8
  %86 = getelementptr inbounds [3 x double], [3 x double]* %85, i64 %84
  %87 = getelementptr inbounds [3 x double], [3 x double]* %86, i32 0, i64 %82
  %88 = load double, double* %87, align 8
  %89 = load i32, i32* %j, align 4
  %90 = sext i32 %89 to i64
  %91 = load i32, i32* %i, align 4
  %92 = sext i32 %91 to i64
  %93 = load [3 x double]*, [3 x double]** %2, align 8
  %94 = getelementptr inbounds [3 x double], [3 x double]* %93, i64 %92
  %95 = getelementptr inbounds [3 x double], [3 x double]* %94, i32 0, i64 %90
  %96 = load double, double* %95, align 8
  %97 = fdiv double %88, %96
  %98 = fadd double %97, 1.000000e+00
  %99 = fmul double %79, %98
  store double %99, double* %cjp, align 8
  %100 = load double, double* %a, align 8
  %101 = load double, double* %b, align 8
  %102 = fmul double %100, %101
  %103 = load i32, i32* %j, align 4
  %104 = sub nsw i32 %103, 1
  %105 = sext i32 %104 to i64
  %106 = load i32, i32* %i, align 4
  %107 = sext i32 %106 to i64
  %108 = load [3 x double]*, [3 x double]** %2, align 8
  %109 = getelementptr inbounds [3 x double], [3 x double]* %108, i64 %107
  %110 = getelementptr inbounds [3 x double], [3 x double]* %109, i32 0, i64 %105
  %111 = load double, double* %110, align 8
  %112 = load i32, i32* %j, align 4
  %113 = sext i32 %112 to i64
  %114 = load i32, i32* %i, align 4
  %115 = sext i32 %114 to i64
  %116 = load [3 x double]*, [3 x double]** %2, align 8
  %117 = getelementptr inbounds [3 x double], [3 x double]* %116, i64 %115
  %118 = getelementptr inbounds [3 x double], [3 x double]* %117, i32 0, i64 %113
  %119 = load double, double* %118, align 8
  %120 = fdiv double %111, %119
  %121 = fadd double %120, 1.000000e+00
  %122 = fmul double %102, %121
  store double %122, double* %cjm, align 8
  %123 = load double, double* %q, align 8
  %124 = load i32, i32* %j, align 4
  %125 = sext i32 %124 to i64
  %126 = load i32, i32* %i, align 4
  %127 = sext i32 %126 to i64
  %128 = load [3 x double]*, [3 x double]** %1, align 8
  %129 = getelementptr inbounds [3 x double], [3 x double]* %128, i64 %127
  %130 = getelementptr inbounds [3 x double], [3 x double]* %129, i32 0, i64 %125
  %131 = load double, double* %130, align 8
  %132 = fmul double %123, %131
  %133 = load double, double* %6, align 8
  %134 = load double, double* %cip, align 8
  %135 = load i32, i32* %j, align 4
  %136 = sext i32 %135 to i64
  %137 = load i32, i32* %i, align 4
  %138 = add nsw i32 %137, 1
  %139 = sext i32 %138 to i64
  %140 = load [3 x double]*, [3 x double]** %1, align 8
  %141 = getelementptr inbounds [3 x double], [3 x double]* %140, i64 %139
  %142 = getelementptr inbounds [3 x double], [3 x double]* %141, i32 0, i64 %136
  %143 = load double, double* %142, align 8
  %144 = fmul double %134, %143
  %145 = load double, double* %cim, align 8
  %146 = load i32, i32* %j, align 4
  %147 = sext i32 %146 to i64
  %148 = load i32, i32* %i, align 4
  %149 = sub nsw i32 %148, 1
  %150 = sext i32 %149 to i64
  %151 = load [3 x double]*, [3 x double]** %1, align 8
  %152 = getelementptr inbounds [3 x double], [3 x double]* %151, i64 %150
  %153 = getelementptr inbounds [3 x double], [3 x double]* %152, i32 0, i64 %147
  %154 = load double, double* %153, align 8
  %155 = fmul double %145, %154
  %156 = fadd double %144, %155
  %157 = load double, double* %cjp, align 8
  %158 = load i32, i32* %j, align 4
  %159 = add nsw i32 %158, 1
  %160 = sext i32 %159 to i64
  %161 = load i32, i32* %i, align 4
  %162 = sext i32 %161 to i64
  %163 = load [3 x double]*, [3 x double]** %1, align 8
  %164 = getelementptr inbounds [3 x double], [3 x double]* %163, i64 %162
  %165 = getelementptr inbounds [3 x double], [3 x double]* %164, i32 0, i64 %160
  %166 = load double, double* %165, align 8
  %167 = fmul double %157, %166
  %168 = fadd double %156, %167
  %169 = load double, double* %cjm, align 8
  %170 = load i32, i32* %j, align 4
  %171 = sub nsw i32 %170, 1
  %172 = sext i32 %171 to i64
  %173 = load i32, i32* %i, align 4
  %174 = sext i32 %173 to i64
  %175 = load [3 x double]*, [3 x double]** %1, align 8
  %176 = getelementptr inbounds [3 x double], [3 x double]* %175, i64 %174
  %177 = getelementptr inbounds [3 x double], [3 x double]* %176, i32 0, i64 %172
  %178 = load double, double* %177, align 8
  %179 = fmul double %169, %178
  %180 = fadd double %168, %179
  %181 = load double, double* %hx2, align 8
  %182 = load i32, i32* %j, align 4
  %183 = sext i32 %182 to i64
  %184 = load i32, i32* %i, align 4
  %185 = sext i32 %184 to i64
  %186 = load [3 x double]*, [3 x double]** %3, align 8
  %187 = getelementptr inbounds [3 x double], [3 x double]* %186, i64 %185
  %188 = getelementptr inbounds [3 x double], [3 x double]* %187, i32 0, i64 %183
  %189 = load double, double* %188, align 8
  %190 = fmul double %181, %189
  %191 = fadd double %180, %190
  %192 = fmul double %133, %191
  %193 = fadd double %132, %192
  %194 = load i32, i32* %j, align 4
  %195 = sext i32 %194 to i64
  %196 = load i32, i32* %i, align 4
  %197 = sext i32 %196 to i64
  %198 = load [3 x double]*, [3 x double]** %1, align 8
  %199 = getelementptr inbounds [3 x double], [3 x double]* %198, i64 %197
  %200 = getelementptr inbounds [3 x double], [3 x double]* %199, i32 0, i64 %195
  store double %193, double* %200, align 8
  br label %201

; <label>:201                                     ; preds = %34
  %202 = load i32, i32* %j, align 4
  %203 = add nsw i32 %202, 1
  store i32 %203, i32* %j, align 4
  br label %29

; <label>:204                                     ; preds = %29
  br label %205

; <label>:205                                     ; preds = %204
  %206 = load i32, i32* %i, align 4
  %207 = add nsw i32 %206, 1
  store i32 %207, i32* %i, align 4
  br label %23

; <label>:208                                     ; preds = %23
  ret void
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
