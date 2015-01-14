; ModuleID = './pendulum.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@q = constant double 5.000000e-01, align 8
@b = constant double 9.000000e-01, align 8
@w = constant double 0x3FE5555555555555, align 8
@.str = private unnamed_addr constant [7 x i8] c"%d %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  %m = alloca i32, align 4
  %l = alloca i32, align 4
  %np = alloca i32, align 4
  %pi = alloca double, align 8
  %h = alloca double, align 8
  %t = alloca double, align 8
  %dk11 = alloca double, align 8
  %dk21 = alloca double, align 8
  %dk12 = alloca double, align 8
  %dk22 = alloca double, align 8
  %dk13 = alloca double, align 8
  %dk23 = alloca double, align 8
  %dk14 = alloca double, align 8
  %dk24 = alloca double, align 8
  %y1 = alloca double, align 8
  %y2 = alloca double, align 8
  %y = alloca [2 x [60 x double]], align 16
  store i32 0, i32* %1
  store i32 60, i32* %n, align 4
  store i32 14, i32* %m, align 4
  store i32 10, i32* %l, align 4
  %2 = call double @atan(double 1.000000e+00) #3
  %3 = fmul double 4.000000e+00, %2
  store double %3, double* %pi, align 8
  %4 = load double* %pi, align 8
  %5 = fmul double 3.000000e+00, %4
  %6 = load i32* %m, align 4
  %7 = sitofp i32 %6 to double
  %8 = fdiv double %5, %7
  store double %8, double* %h, align 8
  %9 = getelementptr inbounds [2 x [60 x double]]* %y, i32 0, i64 0
  %10 = getelementptr inbounds [60 x double]* %9, i32 0, i64 0
  store double 0.000000e+00, double* %10, align 8
  %11 = getelementptr inbounds [2 x [60 x double]]* %y, i32 0, i64 1
  %12 = getelementptr inbounds [60 x double]* %11, i32 0, i64 0
  store double 2.000000e+00, double* %12, align 8
  store i32 0, i32* %i, align 4
  br label %13

; <label>:13                                      ; preds = %219, %0
  %14 = load i32* %i, align 4
  %15 = load i32* %n, align 4
  %16 = sub nsw i32 %15, 1
  %17 = icmp slt i32 %14, %16
  br i1 %17, label %18, label %222

; <label>:18                                      ; preds = %13
  %19 = load double* %h, align 8
  %20 = load i32* %i, align 4
  %21 = add nsw i32 %20, 1
  %22 = sitofp i32 %21 to double
  %23 = fmul double %19, %22
  store double %23, double* %t, align 8
  %24 = load i32* %i, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [2 x [60 x double]]* %y, i32 0, i64 0
  %27 = getelementptr inbounds [60 x double]* %26, i32 0, i64 %25
  %28 = load double* %27, align 8
  store double %28, double* %y1, align 8
  %29 = load i32* %i, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [2 x [60 x double]]* %y, i32 0, i64 1
  %32 = getelementptr inbounds [60 x double]* %31, i32 0, i64 %30
  %33 = load double* %32, align 8
  store double %33, double* %y2, align 8
  %34 = load double* %h, align 8
  %35 = load double* %y2, align 8
  %36 = fmul double %34, %35
  store double %36, double* %dk11, align 8
  %37 = load double* %h, align 8
  %38 = load double* %y2, align 8
  %39 = fmul double -5.000000e-01, %38
  %40 = load double* %y1, align 8
  %41 = call double @sin(double %40) #3
  %42 = fsub double %39, %41
  %43 = load double* %t, align 8
  %44 = fmul double 0x3FE5555555555555, %43
  %45 = call double @cos(double %44) #3
  %46 = fmul double 9.000000e-01, %45
  %47 = fadd double %42, %46
  %48 = fmul double %37, %47
  store double %48, double* %dk21, align 8
  %49 = load double* %h, align 8
  %50 = load double* %y2, align 8
  %51 = load double* %dk21, align 8
  %52 = fdiv double %51, 2.000000e+00
  %53 = fadd double %50, %52
  %54 = fmul double %49, %53
  store double %54, double* %dk12, align 8
  %55 = load double* %h, align 8
  %56 = load double* %y2, align 8
  %57 = load double* %dk21, align 8
  %58 = fdiv double %57, 2.000000e+00
  %59 = fadd double %56, %58
  %60 = fmul double -5.000000e-01, %59
  %61 = load double* %y1, align 8
  %62 = load double* %dk11, align 8
  %63 = fdiv double %62, 2.000000e+00
  %64 = fadd double %61, %63
  %65 = call double @sin(double %64) #3
  %66 = fsub double %60, %65
  %67 = load double* %t, align 8
  %68 = load double* %h, align 8
  %69 = fdiv double %68, 2.000000e+00
  %70 = fadd double %67, %69
  %71 = fmul double 0x3FE5555555555555, %70
  %72 = call double @cos(double %71) #3
  %73 = fmul double 9.000000e-01, %72
  %74 = fadd double %66, %73
  %75 = fmul double %55, %74
  store double %75, double* %dk22, align 8
  %76 = load double* %h, align 8
  %77 = load double* %y2, align 8
  %78 = load double* %dk22, align 8
  %79 = fdiv double %78, 2.000000e+00
  %80 = fadd double %77, %79
  %81 = fmul double %76, %80
  store double %81, double* %dk13, align 8
  %82 = load double* %h, align 8
  %83 = load double* %y2, align 8
  %84 = load double* %dk22, align 8
  %85 = fdiv double %84, 2.000000e+00
  %86 = fadd double %83, %85
  %87 = fmul double -5.000000e-01, %86
  %88 = load double* %y1, align 8
  %89 = load double* %dk12, align 8
  %90 = fdiv double %89, 2.000000e+00
  %91 = fadd double %88, %90
  %92 = call double @sin(double %91) #3
  %93 = fsub double %87, %92
  %94 = load double* %t, align 8
  %95 = load double* %h, align 8
  %96 = fdiv double %95, 2.000000e+00
  %97 = fadd double %94, %96
  %98 = fmul double 0x3FE5555555555555, %97
  %99 = call double @cos(double %98) #3
  %100 = fmul double 9.000000e-01, %99
  %101 = fadd double %93, %100
  %102 = fmul double %82, %101
  store double %102, double* %dk23, align 8
  %103 = load double* %h, align 8
  %104 = load double* %y2, align 8
  %105 = load double* %dk23, align 8
  %106 = fadd double %104, %105
  %107 = fmul double %103, %106
  store double %107, double* %dk14, align 8
  %108 = load double* %h, align 8
  %109 = load double* %y2, align 8
  %110 = load double* %dk23, align 8
  %111 = fadd double %109, %110
  %112 = fmul double -5.000000e-01, %111
  %113 = load double* %y1, align 8
  %114 = load double* %dk13, align 8
  %115 = fadd double %113, %114
  %116 = call double @sin(double %115) #3
  %117 = fsub double %112, %116
  %118 = load double* %t, align 8
  %119 = load double* %h, align 8
  %120 = fadd double %118, %119
  %121 = fmul double 0x3FE5555555555555, %120
  %122 = call double @cos(double %121) #3
  %123 = fmul double 9.000000e-01, %122
  %124 = fadd double %117, %123
  %125 = fmul double %108, %124
  store double %125, double* %dk24, align 8
  %126 = load i32* %i, align 4
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds [2 x [60 x double]]* %y, i32 0, i64 0
  %129 = getelementptr inbounds [60 x double]* %128, i32 0, i64 %127
  %130 = load double* %129, align 8
  %131 = load double* %dk11, align 8
  %132 = load double* %dk12, align 8
  %133 = load double* %dk13, align 8
  %134 = fadd double %132, %133
  %135 = fmul double 2.000000e+00, %134
  %136 = fadd double %131, %135
  %137 = load double* %dk14, align 8
  %138 = fadd double %136, %137
  %139 = fdiv double %138, 6.000000e+00
  %140 = fadd double %130, %139
  %141 = load i32* %i, align 4
  %142 = add nsw i32 %141, 1
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds [2 x [60 x double]]* %y, i32 0, i64 0
  %145 = getelementptr inbounds [60 x double]* %144, i32 0, i64 %143
  store double %140, double* %145, align 8
  %146 = load i32* %i, align 4
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds [2 x [60 x double]]* %y, i32 0, i64 1
  %149 = getelementptr inbounds [60 x double]* %148, i32 0, i64 %147
  %150 = load double* %149, align 8
  %151 = load double* %dk21, align 8
  %152 = load double* %dk22, align 8
  %153 = load double* %dk23, align 8
  %154 = fadd double %152, %153
  %155 = fmul double 2.000000e+00, %154
  %156 = fadd double %151, %155
  %157 = load double* %dk24, align 8
  %158 = fadd double %156, %157
  %159 = fdiv double %158, 6.000000e+00
  %160 = fadd double %150, %159
  %161 = load i32* %i, align 4
  %162 = add nsw i32 %161, 1
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds [2 x [60 x double]]* %y, i32 0, i64 1
  %165 = getelementptr inbounds [60 x double]* %164, i32 0, i64 %163
  store double %160, double* %165, align 8
  %166 = load i32* %i, align 4
  %167 = add nsw i32 %166, 1
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds [2 x [60 x double]]* %y, i32 0, i64 0
  %170 = getelementptr inbounds [60 x double]* %169, i32 0, i64 %168
  %171 = load double* %170, align 8
  %172 = load double* %pi, align 8
  %173 = fmul double 2.000000e+00, %172
  %174 = fdiv double %171, %173
  %175 = fadd double %174, 5.000000e-01
  %176 = fptosi double %175 to i32
  store i32 %176, i32* %np, align 4
  %177 = load i32* %i, align 4
  %178 = add nsw i32 %177, 1
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds [2 x [60 x double]]* %y, i32 0, i64 0
  %181 = getelementptr inbounds [60 x double]* %180, i32 0, i64 %179
  %182 = load double* %181, align 8
  %183 = load double* %pi, align 8
  %184 = fmul double 2.000000e+00, %183
  %185 = load i32* %np, align 4
  %186 = sitofp i32 %185 to double
  %187 = fmul double %184, %186
  %188 = fsub double %182, %187
  %189 = load i32* %i, align 4
  %190 = add nsw i32 %189, 1
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds [2 x [60 x double]]* %y, i32 0, i64 0
  %193 = getelementptr inbounds [60 x double]* %192, i32 0, i64 %191
  store double %188, double* %193, align 8
  %194 = load i32* %i, align 4
  %195 = icmp eq i32 %194, 0
  br i1 %195, label %202, label %196

; <label>:196                                     ; preds = %18
  %197 = load i32* %i, align 4
  %198 = add nsw i32 %197, 1
  %199 = load i32* %l, align 4
  %200 = srem i32 %198, %199
  %201 = icmp eq i32 %200, 0
  br i1 %201, label %202, label %218

; <label>:202                                     ; preds = %196, %18
  %203 = load i32* %i, align 4
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds [2 x [60 x double]]* %y, i32 0, i64 0
  %206 = getelementptr inbounds [60 x double]* %205, i32 0, i64 %204
  %207 = load double* %206, align 8
  %208 = fmul double %207, 1.000000e+04
  %209 = fptosi double %208 to i32
  %210 = load i32* %i, align 4
  %211 = sext i32 %210 to i64
  %212 = getelementptr inbounds [2 x [60 x double]]* %y, i32 0, i64 1
  %213 = getelementptr inbounds [60 x double]* %212, i32 0, i64 %211
  %214 = load double* %213, align 8
  %215 = fmul double %214, 1.000000e+04
  %216 = fptosi double %215 to i32
  %217 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str, i32 0, i32 0), i32 %209, i32 %216)
  br label %218

; <label>:218                                     ; preds = %202, %196
  br label %219

; <label>:219                                     ; preds = %218
  %220 = load i32* %i, align 4
  %221 = add nsw i32 %220, 1
  store i32 %221, i32* %i, align 4
  br label %13

; <label>:222                                     ; preds = %13
  ret i32 0
}

; Function Attrs: nounwind
declare double @atan(double) #1

; Function Attrs: nounwind
declare double @sin(double) #1

; Function Attrs: nounwind
declare double @cos(double) #1

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
