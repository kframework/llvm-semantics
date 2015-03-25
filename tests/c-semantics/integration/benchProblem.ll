; ModuleID = './benchProblem.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"%d %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %n = alloca i32, align 4
  %i = alloca i32, align 4
  %xl = alloca x86_fp80, align 16
  %h = alloca x86_fp80, align 16
  %h2 = alloca x86_fp80, align 16
  %y0 = alloca x86_fp80, align 16
  %x0 = alloca x86_fp80, align 16
  %xd = alloca x86_fp80, align 16
  %rho = alloca x86_fp80, align 16
  %g = alloca x86_fp80, align 16
  %d = alloca x86_fp80, align 16
  %e = alloca x86_fp80, align 16
  %e0 = alloca x86_fp80, align 16
  %f0 = alloca x86_fp80, align 16
  %b = alloca [20 x double], align 16
  %x = alloca [20 x double], align 16
  %y = alloca [20 x double], align 16
  %w = alloca [20 x double], align 16
  %u = alloca [20 x double], align 16
  store i32 0, i32* %1
  store i32 20, i32* %n, align 4
  store x86_fp80 0xK4000C000000000000000, x86_fp80* %xl, align 16
  %2 = load x86_fp80* %xl, align 16
  %3 = load i32* %n, align 4
  %4 = add nsw i32 %3, 1
  %5 = sitofp i32 %4 to x86_fp80
  %6 = fdiv x86_fp80 %2, %5
  store x86_fp80 %6, x86_fp80* %h, align 16
  %7 = load x86_fp80* %h, align 16
  %8 = load x86_fp80* %h, align 16
  %9 = fmul x86_fp80 %7, %8
  store x86_fp80 %9, x86_fp80* %h2, align 16
  %10 = call double @pow(double 3.000000e-02, double 3.000000e+00) #4
  %11 = fmul double 1.000000e+09, %10
  %12 = fmul double %11, 2.000000e-01
  %13 = fdiv double %12, 3.000000e+00
  %14 = fpext double %13 to x86_fp80
  store x86_fp80 %14, x86_fp80* %y0, align 16
  store x86_fp80 0xK3FFD8000000000000000, x86_fp80* %x0, align 16
  store x86_fp80 0xK4000C000000000000000, x86_fp80* %rho, align 16
  store x86_fp80 0xK40029CCCCCCCCCCCD000, x86_fp80* %g, align 16
  store x86_fp80 0xK4006C800000000000000, x86_fp80* %f0, align 16
  store x86_fp80 0xK40008000000000000000, x86_fp80* %d, align 16
  store x86_fp80 0xKBFFF8000000000000000, x86_fp80* %e, align 16
  %15 = call double @exp(double 1.000000e+00) #4
  %16 = fdiv double 1.000000e+00, %15
  %17 = fpext double %16 to x86_fp80
  store x86_fp80 %17, x86_fp80* %e0, align 16
  %18 = load x86_fp80* %d, align 16
  %19 = fptrunc x86_fp80 %18 to double
  %20 = getelementptr inbounds [20 x double]* %w, i32 0, i64 0
  store double %19, double* %20, align 8
  %21 = load x86_fp80* %e, align 16
  %22 = load x86_fp80* %d, align 16
  %23 = fdiv x86_fp80 %21, %22
  %24 = fptrunc x86_fp80 %23 to double
  %25 = getelementptr inbounds [20 x double]* %u, i32 0, i64 0
  store double %24, double* %25, align 8
  store i32 1, i32* %i, align 4
  br label %26

; <label>:26                                      ; preds = %56, %0
  %27 = load i32* %i, align 4
  %28 = load i32* %n, align 4
  %29 = icmp slt i32 %27, %28
  br i1 %29, label %30, label %59

; <label>:30                                      ; preds = %26
  %31 = load x86_fp80* %d, align 16
  %32 = load x86_fp80* %e, align 16
  %33 = load i32* %i, align 4
  %34 = sub nsw i32 %33, 1
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [20 x double]* %u, i32 0, i64 %35
  %37 = load double* %36, align 8
  %38 = fpext double %37 to x86_fp80
  %39 = fmul x86_fp80 %32, %38
  %40 = fsub x86_fp80 %31, %39
  %41 = fptrunc x86_fp80 %40 to double
  %42 = load i32* %i, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [20 x double]* %w, i32 0, i64 %43
  store double %41, double* %44, align 8
  %45 = load x86_fp80* %e, align 16
  %46 = load i32* %i, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [20 x double]* %w, i32 0, i64 %47
  %49 = load double* %48, align 8
  %50 = fpext double %49 to x86_fp80
  %51 = fdiv x86_fp80 %45, %50
  %52 = fptrunc x86_fp80 %51 to double
  %53 = load i32* %i, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [20 x double]* %u, i32 0, i64 %54
  store double %52, double* %55, align 8
  br label %56

; <label>:56                                      ; preds = %30
  %57 = load i32* %i, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, i32* %i, align 4
  br label %26

; <label>:59                                      ; preds = %26
  store i32 0, i32* %i, align 4
  br label %60

; <label>:60                                      ; preds = %129, %59
  %61 = load i32* %i, align 4
  %62 = load i32* %n, align 4
  %63 = icmp slt i32 %61, %62
  br i1 %63, label %64, label %132

; <label>:64                                      ; preds = %60
  %65 = load x86_fp80* %h, align 16
  %66 = load i32* %i, align 4
  %67 = add nsw i32 %66, 1
  %68 = sitofp i32 %67 to x86_fp80
  %69 = fmul x86_fp80 %65, %68
  store x86_fp80 %69, x86_fp80* %xd, align 16
  %70 = load x86_fp80* %h2, align 16
  %71 = fsub x86_fp80 0xK80000000000000000000, %70
  %72 = load x86_fp80* %rho, align 16
  %73 = fmul x86_fp80 %71, %72
  %74 = load x86_fp80* %g, align 16
  %75 = fmul x86_fp80 %73, %74
  %76 = fptrunc x86_fp80 %75 to double
  %77 = load i32* %i, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [20 x double]* %b, i32 0, i64 %78
  store double %76, double* %79, align 8
  %80 = load x86_fp80* %xd, align 16
  %81 = load x86_fp80* %xl, align 16
  %82 = fdiv x86_fp80 %81, 0xK40008000000000000000
  %83 = fsub x86_fp80 %80, %82
  %84 = fptrunc x86_fp80 %83 to double
  %85 = call double @fabs(double %84) #5
  %86 = fpext double %85 to x86_fp80
  %87 = load x86_fp80* %x0, align 16
  %88 = fcmp olt x86_fp80 %86, %87
  br i1 %88, label %89, label %117

; <label>:89                                      ; preds = %64
  %90 = load i32* %i, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [20 x double]* %b, i32 0, i64 %91
  %93 = load double* %92, align 8
  %94 = fpext double %93 to x86_fp80
  %95 = load x86_fp80* %h2, align 16
  %96 = load x86_fp80* %f0, align 16
  %97 = fmul x86_fp80 %95, %96
  %98 = load x86_fp80* %xd, align 16
  %99 = load x86_fp80* %xl, align 16
  %100 = fdiv x86_fp80 %99, 0xK40008000000000000000
  %101 = fsub x86_fp80 %98, %100
  %102 = load x86_fp80* %x0, align 16
  %103 = fdiv x86_fp80 %101, %102
  %104 = fptrunc x86_fp80 %103 to double
  %105 = call double @pow(double %104, double 2.000000e+00) #4
  %106 = fsub double -0.000000e+00, %105
  %107 = call double @exp(double %106) #4
  %108 = fpext double %107 to x86_fp80
  %109 = load x86_fp80* %e0, align 16
  %110 = fsub x86_fp80 %108, %109
  %111 = fmul x86_fp80 %97, %110
  %112 = fsub x86_fp80 %94, %111
  %113 = fptrunc x86_fp80 %112 to double
  %114 = load i32* %i, align 4
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds [20 x double]* %b, i32 0, i64 %115
  store double %113, double* %116, align 8
  br label %117

; <label>:117                                     ; preds = %89, %64
  %118 = load i32* %i, align 4
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds [20 x double]* %b, i32 0, i64 %119
  %121 = load double* %120, align 8
  %122 = fpext double %121 to x86_fp80
  %123 = load x86_fp80* %y0, align 16
  %124 = fdiv x86_fp80 %122, %123
  %125 = fptrunc x86_fp80 %124 to double
  %126 = load i32* %i, align 4
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds [20 x double]* %b, i32 0, i64 %127
  store double %125, double* %128, align 8
  br label %129

; <label>:129                                     ; preds = %117
  %130 = load i32* %i, align 4
  %131 = add nsw i32 %130, 1
  store i32 %131, i32* %i, align 4
  br label %60

; <label>:132                                     ; preds = %60
  %133 = getelementptr inbounds [20 x double]* %b, i32 0, i64 0
  %134 = load double* %133, align 8
  %135 = getelementptr inbounds [20 x double]* %w, i32 0, i64 0
  %136 = load double* %135, align 8
  %137 = fdiv double %134, %136
  %138 = getelementptr inbounds [20 x double]* %y, i32 0, i64 0
  store double %137, double* %138, align 8
  store i32 1, i32* %i, align 4
  br label %139

; <label>:139                                     ; preds = %162, %132
  %140 = load i32* %i, align 4
  %141 = load i32* %n, align 4
  %142 = icmp slt i32 %140, %141
  br i1 %142, label %143, label %165

; <label>:143                                     ; preds = %139
  %144 = load i32* %i, align 4
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds [20 x double]* %b, i32 0, i64 %145
  %147 = load double* %146, align 8
  %148 = load i32* %i, align 4
  %149 = sub nsw i32 %148, 1
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds [20 x double]* %y, i32 0, i64 %150
  %152 = load double* %151, align 8
  %153 = fadd double %147, %152
  %154 = load i32* %i, align 4
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds [20 x double]* %w, i32 0, i64 %155
  %157 = load double* %156, align 8
  %158 = fdiv double %153, %157
  %159 = load i32* %i, align 4
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds [20 x double]* %y, i32 0, i64 %160
  store double %158, double* %161, align 8
  br label %162

; <label>:162                                     ; preds = %143
  %163 = load i32* %i, align 4
  %164 = add nsw i32 %163, 1
  store i32 %164, i32* %i, align 4
  br label %139

; <label>:165                                     ; preds = %139
  %166 = load i32* %n, align 4
  %167 = sub nsw i32 %166, 1
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds [20 x double]* %y, i32 0, i64 %168
  %170 = load double* %169, align 8
  %171 = load i32* %n, align 4
  %172 = sub nsw i32 %171, 1
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds [20 x double]* %x, i32 0, i64 %173
  store double %170, double* %174, align 8
  %175 = load i32* %n, align 4
  %176 = sub nsw i32 %175, 2
  store i32 %176, i32* %i, align 4
  br label %177

; <label>:177                                     ; preds = %199, %165
  %178 = load i32* %i, align 4
  %179 = icmp sge i32 %178, 0
  br i1 %179, label %180, label %202

; <label>:180                                     ; preds = %177
  %181 = load i32* %i, align 4
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds [20 x double]* %y, i32 0, i64 %182
  %184 = load double* %183, align 8
  %185 = load i32* %i, align 4
  %186 = sext i32 %185 to i64
  %187 = getelementptr inbounds [20 x double]* %u, i32 0, i64 %186
  %188 = load double* %187, align 8
  %189 = load i32* %i, align 4
  %190 = add nsw i32 %189, 1
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds [20 x double]* %x, i32 0, i64 %191
  %193 = load double* %192, align 8
  %194 = fmul double %188, %193
  %195 = fsub double %184, %194
  %196 = load i32* %i, align 4
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds [20 x double]* %x, i32 0, i64 %197
  store double %195, double* %198, align 8
  br label %199

; <label>:199                                     ; preds = %180
  %200 = load i32* %i, align 4
  %201 = sub nsw i32 %200, 1
  store i32 %201, i32* %i, align 4
  br label %177

; <label>:202                                     ; preds = %177
  store i32 0, i32* %i, align 4
  br label %203

; <label>:203                                     ; preds = %223, %202
  %204 = load i32* %i, align 4
  %205 = load i32* %n, align 4
  %206 = icmp slt i32 %204, %205
  br i1 %206, label %207, label %226

; <label>:207                                     ; preds = %203
  %208 = load x86_fp80* %h, align 16
  %209 = load i32* %i, align 4
  %210 = add nsw i32 %209, 1
  %211 = sitofp i32 %210 to x86_fp80
  %212 = fmul x86_fp80 %208, %211
  %213 = fmul x86_fp80 %212, 0xK4008FA00000000000000
  %214 = fptosi x86_fp80 %213 to i32
  %215 = load i32* %i, align 4
  %216 = sext i32 %215 to i64
  %217 = getelementptr inbounds [20 x double]* %x, i32 0, i64 %216
  %218 = load double* %217, align 8
  %219 = fmul double 1.000000e+02, %218
  %220 = fmul double %219, 1.000000e+03
  %221 = fptosi double %220 to i32
  %222 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str, i32 0, i32 0), i32 %214, i32 %221)
  br label %223

; <label>:223                                     ; preds = %207
  %224 = load i32* %i, align 4
  %225 = add nsw i32 %224, 1
  store i32 %225, i32* %i, align 4
  br label %203

; <label>:226                                     ; preds = %203
  ret i32 0
}

; Function Attrs: nounwind
declare double @pow(double, double) #1

; Function Attrs: nounwind
declare double @exp(double) #1

; Function Attrs: nounwind readnone
declare double @fabs(double) #2

declare i32 @printf(i8*, ...) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
