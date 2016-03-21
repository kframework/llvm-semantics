; ModuleID = './20021120-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@gd = common global [32 x double] zeroinitializer, align 16
@gf = common global [32 x float] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define void @foo(i32 %n) #0 {
  %1 = alloca i32, align 4
  %d00 = alloca double, align 8
  %d10 = alloca double, align 8
  %d20 = alloca double, align 8
  %d30 = alloca double, align 8
  %d01 = alloca double, align 8
  %d11 = alloca double, align 8
  %d21 = alloca double, align 8
  %d31 = alloca double, align 8
  %d02 = alloca double, align 8
  %d12 = alloca double, align 8
  %d22 = alloca double, align 8
  %d32 = alloca double, align 8
  %d03 = alloca double, align 8
  %d13 = alloca double, align 8
  %d23 = alloca double, align 8
  %d33 = alloca double, align 8
  %d04 = alloca double, align 8
  %d14 = alloca double, align 8
  %d24 = alloca double, align 8
  %d34 = alloca double, align 8
  %d05 = alloca double, align 8
  %d15 = alloca double, align 8
  %d25 = alloca double, align 8
  %d35 = alloca double, align 8
  %d06 = alloca double, align 8
  %d16 = alloca double, align 8
  %d26 = alloca double, align 8
  %d36 = alloca double, align 8
  %d07 = alloca double, align 8
  %d17 = alloca double, align 8
  %d27 = alloca double, align 8
  %d37 = alloca double, align 8
  %f00 = alloca float, align 4
  %f10 = alloca float, align 4
  %f20 = alloca float, align 4
  %f30 = alloca float, align 4
  %f01 = alloca float, align 4
  %f11 = alloca float, align 4
  %f21 = alloca float, align 4
  %f31 = alloca float, align 4
  %f02 = alloca float, align 4
  %f12 = alloca float, align 4
  %f22 = alloca float, align 4
  %f32 = alloca float, align 4
  %f03 = alloca float, align 4
  %f13 = alloca float, align 4
  %f23 = alloca float, align 4
  %f33 = alloca float, align 4
  %f04 = alloca float, align 4
  %f14 = alloca float, align 4
  %f24 = alloca float, align 4
  %f34 = alloca float, align 4
  %f05 = alloca float, align 4
  %f15 = alloca float, align 4
  %f25 = alloca float, align 4
  %f35 = alloca float, align 4
  %f06 = alloca float, align 4
  %f16 = alloca float, align 4
  %f26 = alloca float, align 4
  %f36 = alloca float, align 4
  %f07 = alloca float, align 4
  %f17 = alloca float, align 4
  %f27 = alloca float, align 4
  %f37 = alloca float, align 4
  %pd = alloca double*, align 8
  %pf = alloca float*, align 8
  %i = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  store double* getelementptr inbounds ([32 x double], [32 x double]* @gd, i32 0, i32 0), double** %pd, align 8
  %2 = load double*, double** %pd, align 8
  %3 = getelementptr inbounds double, double* %2, i32 1
  store double* %3, double** %pd, align 8
  %4 = load volatile double, double* %2, align 8
  store double %4, double* %d00, align 8
  %5 = load double*, double** %pd, align 8
  %6 = getelementptr inbounds double, double* %5, i32 1
  store double* %6, double** %pd, align 8
  %7 = load volatile double, double* %5, align 8
  store double %7, double* %d10, align 8
  %8 = load double*, double** %pd, align 8
  %9 = getelementptr inbounds double, double* %8, i32 1
  store double* %9, double** %pd, align 8
  %10 = load volatile double, double* %8, align 8
  store double %10, double* %d20, align 8
  %11 = load double*, double** %pd, align 8
  %12 = getelementptr inbounds double, double* %11, i32 1
  store double* %12, double** %pd, align 8
  %13 = load volatile double, double* %11, align 8
  store double %13, double* %d30, align 8
  %14 = load double*, double** %pd, align 8
  %15 = getelementptr inbounds double, double* %14, i32 1
  store double* %15, double** %pd, align 8
  %16 = load volatile double, double* %14, align 8
  store double %16, double* %d01, align 8
  %17 = load double*, double** %pd, align 8
  %18 = getelementptr inbounds double, double* %17, i32 1
  store double* %18, double** %pd, align 8
  %19 = load volatile double, double* %17, align 8
  store double %19, double* %d11, align 8
  %20 = load double*, double** %pd, align 8
  %21 = getelementptr inbounds double, double* %20, i32 1
  store double* %21, double** %pd, align 8
  %22 = load volatile double, double* %20, align 8
  store double %22, double* %d21, align 8
  %23 = load double*, double** %pd, align 8
  %24 = getelementptr inbounds double, double* %23, i32 1
  store double* %24, double** %pd, align 8
  %25 = load volatile double, double* %23, align 8
  store double %25, double* %d31, align 8
  %26 = load double*, double** %pd, align 8
  %27 = getelementptr inbounds double, double* %26, i32 1
  store double* %27, double** %pd, align 8
  %28 = load volatile double, double* %26, align 8
  store double %28, double* %d02, align 8
  %29 = load double*, double** %pd, align 8
  %30 = getelementptr inbounds double, double* %29, i32 1
  store double* %30, double** %pd, align 8
  %31 = load volatile double, double* %29, align 8
  store double %31, double* %d12, align 8
  %32 = load double*, double** %pd, align 8
  %33 = getelementptr inbounds double, double* %32, i32 1
  store double* %33, double** %pd, align 8
  %34 = load volatile double, double* %32, align 8
  store double %34, double* %d22, align 8
  %35 = load double*, double** %pd, align 8
  %36 = getelementptr inbounds double, double* %35, i32 1
  store double* %36, double** %pd, align 8
  %37 = load volatile double, double* %35, align 8
  store double %37, double* %d32, align 8
  %38 = load double*, double** %pd, align 8
  %39 = getelementptr inbounds double, double* %38, i32 1
  store double* %39, double** %pd, align 8
  %40 = load volatile double, double* %38, align 8
  store double %40, double* %d03, align 8
  %41 = load double*, double** %pd, align 8
  %42 = getelementptr inbounds double, double* %41, i32 1
  store double* %42, double** %pd, align 8
  %43 = load volatile double, double* %41, align 8
  store double %43, double* %d13, align 8
  %44 = load double*, double** %pd, align 8
  %45 = getelementptr inbounds double, double* %44, i32 1
  store double* %45, double** %pd, align 8
  %46 = load volatile double, double* %44, align 8
  store double %46, double* %d23, align 8
  %47 = load double*, double** %pd, align 8
  %48 = getelementptr inbounds double, double* %47, i32 1
  store double* %48, double** %pd, align 8
  %49 = load volatile double, double* %47, align 8
  store double %49, double* %d33, align 8
  %50 = load double*, double** %pd, align 8
  %51 = getelementptr inbounds double, double* %50, i32 1
  store double* %51, double** %pd, align 8
  %52 = load volatile double, double* %50, align 8
  store double %52, double* %d04, align 8
  %53 = load double*, double** %pd, align 8
  %54 = getelementptr inbounds double, double* %53, i32 1
  store double* %54, double** %pd, align 8
  %55 = load volatile double, double* %53, align 8
  store double %55, double* %d14, align 8
  %56 = load double*, double** %pd, align 8
  %57 = getelementptr inbounds double, double* %56, i32 1
  store double* %57, double** %pd, align 8
  %58 = load volatile double, double* %56, align 8
  store double %58, double* %d24, align 8
  %59 = load double*, double** %pd, align 8
  %60 = getelementptr inbounds double, double* %59, i32 1
  store double* %60, double** %pd, align 8
  %61 = load volatile double, double* %59, align 8
  store double %61, double* %d34, align 8
  %62 = load double*, double** %pd, align 8
  %63 = getelementptr inbounds double, double* %62, i32 1
  store double* %63, double** %pd, align 8
  %64 = load volatile double, double* %62, align 8
  store double %64, double* %d05, align 8
  %65 = load double*, double** %pd, align 8
  %66 = getelementptr inbounds double, double* %65, i32 1
  store double* %66, double** %pd, align 8
  %67 = load volatile double, double* %65, align 8
  store double %67, double* %d15, align 8
  %68 = load double*, double** %pd, align 8
  %69 = getelementptr inbounds double, double* %68, i32 1
  store double* %69, double** %pd, align 8
  %70 = load volatile double, double* %68, align 8
  store double %70, double* %d25, align 8
  %71 = load double*, double** %pd, align 8
  %72 = getelementptr inbounds double, double* %71, i32 1
  store double* %72, double** %pd, align 8
  %73 = load volatile double, double* %71, align 8
  store double %73, double* %d35, align 8
  %74 = load double*, double** %pd, align 8
  %75 = getelementptr inbounds double, double* %74, i32 1
  store double* %75, double** %pd, align 8
  %76 = load volatile double, double* %74, align 8
  store double %76, double* %d06, align 8
  %77 = load double*, double** %pd, align 8
  %78 = getelementptr inbounds double, double* %77, i32 1
  store double* %78, double** %pd, align 8
  %79 = load volatile double, double* %77, align 8
  store double %79, double* %d16, align 8
  %80 = load double*, double** %pd, align 8
  %81 = getelementptr inbounds double, double* %80, i32 1
  store double* %81, double** %pd, align 8
  %82 = load volatile double, double* %80, align 8
  store double %82, double* %d26, align 8
  %83 = load double*, double** %pd, align 8
  %84 = getelementptr inbounds double, double* %83, i32 1
  store double* %84, double** %pd, align 8
  %85 = load volatile double, double* %83, align 8
  store double %85, double* %d36, align 8
  %86 = load double*, double** %pd, align 8
  %87 = getelementptr inbounds double, double* %86, i32 1
  store double* %87, double** %pd, align 8
  %88 = load volatile double, double* %86, align 8
  store double %88, double* %d07, align 8
  %89 = load double*, double** %pd, align 8
  %90 = getelementptr inbounds double, double* %89, i32 1
  store double* %90, double** %pd, align 8
  %91 = load volatile double, double* %89, align 8
  store double %91, double* %d17, align 8
  %92 = load double*, double** %pd, align 8
  %93 = getelementptr inbounds double, double* %92, i32 1
  store double* %93, double** %pd, align 8
  %94 = load volatile double, double* %92, align 8
  store double %94, double* %d27, align 8
  %95 = load double*, double** %pd, align 8
  %96 = getelementptr inbounds double, double* %95, i32 1
  store double* %96, double** %pd, align 8
  %97 = load volatile double, double* %95, align 8
  store double %97, double* %d37, align 8
  store i32 0, i32* %i, align 4
  br label %98

; <label>:98                                      ; preds = %775, %0
  %99 = load i32, i32* %i, align 4
  %100 = load i32, i32* %1, align 4
  %101 = icmp slt i32 %99, %100
  br i1 %101, label %102, label %778

; <label>:102                                     ; preds = %98
  store float* getelementptr inbounds ([32 x float], [32 x float]* @gf, i32 0, i32 0), float** %pf, align 8
  %103 = load float*, float** %pf, align 8
  %104 = getelementptr inbounds float, float* %103, i32 1
  store float* %104, float** %pf, align 8
  %105 = load volatile float, float* %103, align 4
  store float %105, float* %f00, align 4
  %106 = load float*, float** %pf, align 8
  %107 = getelementptr inbounds float, float* %106, i32 1
  store float* %107, float** %pf, align 8
  %108 = load volatile float, float* %106, align 4
  store float %108, float* %f10, align 4
  %109 = load float*, float** %pf, align 8
  %110 = getelementptr inbounds float, float* %109, i32 1
  store float* %110, float** %pf, align 8
  %111 = load volatile float, float* %109, align 4
  store float %111, float* %f20, align 4
  %112 = load float*, float** %pf, align 8
  %113 = getelementptr inbounds float, float* %112, i32 1
  store float* %113, float** %pf, align 8
  %114 = load volatile float, float* %112, align 4
  store float %114, float* %f30, align 4
  %115 = load float*, float** %pf, align 8
  %116 = getelementptr inbounds float, float* %115, i32 1
  store float* %116, float** %pf, align 8
  %117 = load volatile float, float* %115, align 4
  store float %117, float* %f01, align 4
  %118 = load float*, float** %pf, align 8
  %119 = getelementptr inbounds float, float* %118, i32 1
  store float* %119, float** %pf, align 8
  %120 = load volatile float, float* %118, align 4
  store float %120, float* %f11, align 4
  %121 = load float*, float** %pf, align 8
  %122 = getelementptr inbounds float, float* %121, i32 1
  store float* %122, float** %pf, align 8
  %123 = load volatile float, float* %121, align 4
  store float %123, float* %f21, align 4
  %124 = load float*, float** %pf, align 8
  %125 = getelementptr inbounds float, float* %124, i32 1
  store float* %125, float** %pf, align 8
  %126 = load volatile float, float* %124, align 4
  store float %126, float* %f31, align 4
  %127 = load float*, float** %pf, align 8
  %128 = getelementptr inbounds float, float* %127, i32 1
  store float* %128, float** %pf, align 8
  %129 = load volatile float, float* %127, align 4
  store float %129, float* %f02, align 4
  %130 = load float*, float** %pf, align 8
  %131 = getelementptr inbounds float, float* %130, i32 1
  store float* %131, float** %pf, align 8
  %132 = load volatile float, float* %130, align 4
  store float %132, float* %f12, align 4
  %133 = load float*, float** %pf, align 8
  %134 = getelementptr inbounds float, float* %133, i32 1
  store float* %134, float** %pf, align 8
  %135 = load volatile float, float* %133, align 4
  store float %135, float* %f22, align 4
  %136 = load float*, float** %pf, align 8
  %137 = getelementptr inbounds float, float* %136, i32 1
  store float* %137, float** %pf, align 8
  %138 = load volatile float, float* %136, align 4
  store float %138, float* %f32, align 4
  %139 = load float*, float** %pf, align 8
  %140 = getelementptr inbounds float, float* %139, i32 1
  store float* %140, float** %pf, align 8
  %141 = load volatile float, float* %139, align 4
  store float %141, float* %f03, align 4
  %142 = load float*, float** %pf, align 8
  %143 = getelementptr inbounds float, float* %142, i32 1
  store float* %143, float** %pf, align 8
  %144 = load volatile float, float* %142, align 4
  store float %144, float* %f13, align 4
  %145 = load float*, float** %pf, align 8
  %146 = getelementptr inbounds float, float* %145, i32 1
  store float* %146, float** %pf, align 8
  %147 = load volatile float, float* %145, align 4
  store float %147, float* %f23, align 4
  %148 = load float*, float** %pf, align 8
  %149 = getelementptr inbounds float, float* %148, i32 1
  store float* %149, float** %pf, align 8
  %150 = load volatile float, float* %148, align 4
  store float %150, float* %f33, align 4
  %151 = load float*, float** %pf, align 8
  %152 = getelementptr inbounds float, float* %151, i32 1
  store float* %152, float** %pf, align 8
  %153 = load volatile float, float* %151, align 4
  store float %153, float* %f04, align 4
  %154 = load float*, float** %pf, align 8
  %155 = getelementptr inbounds float, float* %154, i32 1
  store float* %155, float** %pf, align 8
  %156 = load volatile float, float* %154, align 4
  store float %156, float* %f14, align 4
  %157 = load float*, float** %pf, align 8
  %158 = getelementptr inbounds float, float* %157, i32 1
  store float* %158, float** %pf, align 8
  %159 = load volatile float, float* %157, align 4
  store float %159, float* %f24, align 4
  %160 = load float*, float** %pf, align 8
  %161 = getelementptr inbounds float, float* %160, i32 1
  store float* %161, float** %pf, align 8
  %162 = load volatile float, float* %160, align 4
  store float %162, float* %f34, align 4
  %163 = load float*, float** %pf, align 8
  %164 = getelementptr inbounds float, float* %163, i32 1
  store float* %164, float** %pf, align 8
  %165 = load volatile float, float* %163, align 4
  store float %165, float* %f05, align 4
  %166 = load float*, float** %pf, align 8
  %167 = getelementptr inbounds float, float* %166, i32 1
  store float* %167, float** %pf, align 8
  %168 = load volatile float, float* %166, align 4
  store float %168, float* %f15, align 4
  %169 = load float*, float** %pf, align 8
  %170 = getelementptr inbounds float, float* %169, i32 1
  store float* %170, float** %pf, align 8
  %171 = load volatile float, float* %169, align 4
  store float %171, float* %f25, align 4
  %172 = load float*, float** %pf, align 8
  %173 = getelementptr inbounds float, float* %172, i32 1
  store float* %173, float** %pf, align 8
  %174 = load volatile float, float* %172, align 4
  store float %174, float* %f35, align 4
  %175 = load float*, float** %pf, align 8
  %176 = getelementptr inbounds float, float* %175, i32 1
  store float* %176, float** %pf, align 8
  %177 = load volatile float, float* %175, align 4
  store float %177, float* %f06, align 4
  %178 = load float*, float** %pf, align 8
  %179 = getelementptr inbounds float, float* %178, i32 1
  store float* %179, float** %pf, align 8
  %180 = load volatile float, float* %178, align 4
  store float %180, float* %f16, align 4
  %181 = load float*, float** %pf, align 8
  %182 = getelementptr inbounds float, float* %181, i32 1
  store float* %182, float** %pf, align 8
  %183 = load volatile float, float* %181, align 4
  store float %183, float* %f26, align 4
  %184 = load float*, float** %pf, align 8
  %185 = getelementptr inbounds float, float* %184, i32 1
  store float* %185, float** %pf, align 8
  %186 = load volatile float, float* %184, align 4
  store float %186, float* %f36, align 4
  %187 = load float*, float** %pf, align 8
  %188 = getelementptr inbounds float, float* %187, i32 1
  store float* %188, float** %pf, align 8
  %189 = load volatile float, float* %187, align 4
  store float %189, float* %f07, align 4
  %190 = load float*, float** %pf, align 8
  %191 = getelementptr inbounds float, float* %190, i32 1
  store float* %191, float** %pf, align 8
  %192 = load volatile float, float* %190, align 4
  store float %192, float* %f17, align 4
  %193 = load float*, float** %pf, align 8
  %194 = getelementptr inbounds float, float* %193, i32 1
  store float* %194, float** %pf, align 8
  %195 = load volatile float, float* %193, align 4
  store float %195, float* %f27, align 4
  %196 = load float*, float** %pf, align 8
  %197 = getelementptr inbounds float, float* %196, i32 1
  store float* %197, float** %pf, align 8
  %198 = load volatile float, float* %196, align 4
  store float %198, float* %f37, align 4
  store double* getelementptr inbounds ([32 x double], [32 x double]* @gd, i32 0, i32 0), double** %pd, align 8
  %199 = load double*, double** %pd, align 8
  %200 = getelementptr inbounds double, double* %199, i32 1
  store double* %200, double** %pd, align 8
  %201 = load volatile double, double* %199, align 8
  %202 = load double, double* %d00, align 8
  %203 = fadd double %202, %201
  store double %203, double* %d00, align 8
  %204 = load double*, double** %pd, align 8
  %205 = getelementptr inbounds double, double* %204, i32 1
  store double* %205, double** %pd, align 8
  %206 = load volatile double, double* %204, align 8
  %207 = load double, double* %d10, align 8
  %208 = fadd double %207, %206
  store double %208, double* %d10, align 8
  %209 = load double*, double** %pd, align 8
  %210 = getelementptr inbounds double, double* %209, i32 1
  store double* %210, double** %pd, align 8
  %211 = load volatile double, double* %209, align 8
  %212 = load double, double* %d20, align 8
  %213 = fadd double %212, %211
  store double %213, double* %d20, align 8
  %214 = load double*, double** %pd, align 8
  %215 = getelementptr inbounds double, double* %214, i32 1
  store double* %215, double** %pd, align 8
  %216 = load volatile double, double* %214, align 8
  %217 = load double, double* %d30, align 8
  %218 = fadd double %217, %216
  store double %218, double* %d30, align 8
  %219 = load double*, double** %pd, align 8
  %220 = getelementptr inbounds double, double* %219, i32 1
  store double* %220, double** %pd, align 8
  %221 = load volatile double, double* %219, align 8
  %222 = load double, double* %d01, align 8
  %223 = fadd double %222, %221
  store double %223, double* %d01, align 8
  %224 = load double*, double** %pd, align 8
  %225 = getelementptr inbounds double, double* %224, i32 1
  store double* %225, double** %pd, align 8
  %226 = load volatile double, double* %224, align 8
  %227 = load double, double* %d11, align 8
  %228 = fadd double %227, %226
  store double %228, double* %d11, align 8
  %229 = load double*, double** %pd, align 8
  %230 = getelementptr inbounds double, double* %229, i32 1
  store double* %230, double** %pd, align 8
  %231 = load volatile double, double* %229, align 8
  %232 = load double, double* %d21, align 8
  %233 = fadd double %232, %231
  store double %233, double* %d21, align 8
  %234 = load double*, double** %pd, align 8
  %235 = getelementptr inbounds double, double* %234, i32 1
  store double* %235, double** %pd, align 8
  %236 = load volatile double, double* %234, align 8
  %237 = load double, double* %d31, align 8
  %238 = fadd double %237, %236
  store double %238, double* %d31, align 8
  %239 = load double*, double** %pd, align 8
  %240 = getelementptr inbounds double, double* %239, i32 1
  store double* %240, double** %pd, align 8
  %241 = load volatile double, double* %239, align 8
  %242 = load double, double* %d02, align 8
  %243 = fadd double %242, %241
  store double %243, double* %d02, align 8
  %244 = load double*, double** %pd, align 8
  %245 = getelementptr inbounds double, double* %244, i32 1
  store double* %245, double** %pd, align 8
  %246 = load volatile double, double* %244, align 8
  %247 = load double, double* %d12, align 8
  %248 = fadd double %247, %246
  store double %248, double* %d12, align 8
  %249 = load double*, double** %pd, align 8
  %250 = getelementptr inbounds double, double* %249, i32 1
  store double* %250, double** %pd, align 8
  %251 = load volatile double, double* %249, align 8
  %252 = load double, double* %d22, align 8
  %253 = fadd double %252, %251
  store double %253, double* %d22, align 8
  %254 = load double*, double** %pd, align 8
  %255 = getelementptr inbounds double, double* %254, i32 1
  store double* %255, double** %pd, align 8
  %256 = load volatile double, double* %254, align 8
  %257 = load double, double* %d32, align 8
  %258 = fadd double %257, %256
  store double %258, double* %d32, align 8
  %259 = load double*, double** %pd, align 8
  %260 = getelementptr inbounds double, double* %259, i32 1
  store double* %260, double** %pd, align 8
  %261 = load volatile double, double* %259, align 8
  %262 = load double, double* %d03, align 8
  %263 = fadd double %262, %261
  store double %263, double* %d03, align 8
  %264 = load double*, double** %pd, align 8
  %265 = getelementptr inbounds double, double* %264, i32 1
  store double* %265, double** %pd, align 8
  %266 = load volatile double, double* %264, align 8
  %267 = load double, double* %d13, align 8
  %268 = fadd double %267, %266
  store double %268, double* %d13, align 8
  %269 = load double*, double** %pd, align 8
  %270 = getelementptr inbounds double, double* %269, i32 1
  store double* %270, double** %pd, align 8
  %271 = load volatile double, double* %269, align 8
  %272 = load double, double* %d23, align 8
  %273 = fadd double %272, %271
  store double %273, double* %d23, align 8
  %274 = load double*, double** %pd, align 8
  %275 = getelementptr inbounds double, double* %274, i32 1
  store double* %275, double** %pd, align 8
  %276 = load volatile double, double* %274, align 8
  %277 = load double, double* %d33, align 8
  %278 = fadd double %277, %276
  store double %278, double* %d33, align 8
  %279 = load double*, double** %pd, align 8
  %280 = getelementptr inbounds double, double* %279, i32 1
  store double* %280, double** %pd, align 8
  %281 = load volatile double, double* %279, align 8
  %282 = load double, double* %d04, align 8
  %283 = fadd double %282, %281
  store double %283, double* %d04, align 8
  %284 = load double*, double** %pd, align 8
  %285 = getelementptr inbounds double, double* %284, i32 1
  store double* %285, double** %pd, align 8
  %286 = load volatile double, double* %284, align 8
  %287 = load double, double* %d14, align 8
  %288 = fadd double %287, %286
  store double %288, double* %d14, align 8
  %289 = load double*, double** %pd, align 8
  %290 = getelementptr inbounds double, double* %289, i32 1
  store double* %290, double** %pd, align 8
  %291 = load volatile double, double* %289, align 8
  %292 = load double, double* %d24, align 8
  %293 = fadd double %292, %291
  store double %293, double* %d24, align 8
  %294 = load double*, double** %pd, align 8
  %295 = getelementptr inbounds double, double* %294, i32 1
  store double* %295, double** %pd, align 8
  %296 = load volatile double, double* %294, align 8
  %297 = load double, double* %d34, align 8
  %298 = fadd double %297, %296
  store double %298, double* %d34, align 8
  %299 = load double*, double** %pd, align 8
  %300 = getelementptr inbounds double, double* %299, i32 1
  store double* %300, double** %pd, align 8
  %301 = load volatile double, double* %299, align 8
  %302 = load double, double* %d05, align 8
  %303 = fadd double %302, %301
  store double %303, double* %d05, align 8
  %304 = load double*, double** %pd, align 8
  %305 = getelementptr inbounds double, double* %304, i32 1
  store double* %305, double** %pd, align 8
  %306 = load volatile double, double* %304, align 8
  %307 = load double, double* %d15, align 8
  %308 = fadd double %307, %306
  store double %308, double* %d15, align 8
  %309 = load double*, double** %pd, align 8
  %310 = getelementptr inbounds double, double* %309, i32 1
  store double* %310, double** %pd, align 8
  %311 = load volatile double, double* %309, align 8
  %312 = load double, double* %d25, align 8
  %313 = fadd double %312, %311
  store double %313, double* %d25, align 8
  %314 = load double*, double** %pd, align 8
  %315 = getelementptr inbounds double, double* %314, i32 1
  store double* %315, double** %pd, align 8
  %316 = load volatile double, double* %314, align 8
  %317 = load double, double* %d35, align 8
  %318 = fadd double %317, %316
  store double %318, double* %d35, align 8
  %319 = load double*, double** %pd, align 8
  %320 = getelementptr inbounds double, double* %319, i32 1
  store double* %320, double** %pd, align 8
  %321 = load volatile double, double* %319, align 8
  %322 = load double, double* %d06, align 8
  %323 = fadd double %322, %321
  store double %323, double* %d06, align 8
  %324 = load double*, double** %pd, align 8
  %325 = getelementptr inbounds double, double* %324, i32 1
  store double* %325, double** %pd, align 8
  %326 = load volatile double, double* %324, align 8
  %327 = load double, double* %d16, align 8
  %328 = fadd double %327, %326
  store double %328, double* %d16, align 8
  %329 = load double*, double** %pd, align 8
  %330 = getelementptr inbounds double, double* %329, i32 1
  store double* %330, double** %pd, align 8
  %331 = load volatile double, double* %329, align 8
  %332 = load double, double* %d26, align 8
  %333 = fadd double %332, %331
  store double %333, double* %d26, align 8
  %334 = load double*, double** %pd, align 8
  %335 = getelementptr inbounds double, double* %334, i32 1
  store double* %335, double** %pd, align 8
  %336 = load volatile double, double* %334, align 8
  %337 = load double, double* %d36, align 8
  %338 = fadd double %337, %336
  store double %338, double* %d36, align 8
  %339 = load double*, double** %pd, align 8
  %340 = getelementptr inbounds double, double* %339, i32 1
  store double* %340, double** %pd, align 8
  %341 = load volatile double, double* %339, align 8
  %342 = load double, double* %d07, align 8
  %343 = fadd double %342, %341
  store double %343, double* %d07, align 8
  %344 = load double*, double** %pd, align 8
  %345 = getelementptr inbounds double, double* %344, i32 1
  store double* %345, double** %pd, align 8
  %346 = load volatile double, double* %344, align 8
  %347 = load double, double* %d17, align 8
  %348 = fadd double %347, %346
  store double %348, double* %d17, align 8
  %349 = load double*, double** %pd, align 8
  %350 = getelementptr inbounds double, double* %349, i32 1
  store double* %350, double** %pd, align 8
  %351 = load volatile double, double* %349, align 8
  %352 = load double, double* %d27, align 8
  %353 = fadd double %352, %351
  store double %353, double* %d27, align 8
  %354 = load double*, double** %pd, align 8
  %355 = getelementptr inbounds double, double* %354, i32 1
  store double* %355, double** %pd, align 8
  %356 = load volatile double, double* %354, align 8
  %357 = load double, double* %d37, align 8
  %358 = fadd double %357, %356
  store double %358, double* %d37, align 8
  store double* getelementptr inbounds ([32 x double], [32 x double]* @gd, i32 0, i32 0), double** %pd, align 8
  %359 = load double*, double** %pd, align 8
  %360 = getelementptr inbounds double, double* %359, i32 1
  store double* %360, double** %pd, align 8
  %361 = load volatile double, double* %359, align 8
  %362 = load double, double* %d00, align 8
  %363 = fadd double %362, %361
  store double %363, double* %d00, align 8
  %364 = load double*, double** %pd, align 8
  %365 = getelementptr inbounds double, double* %364, i32 1
  store double* %365, double** %pd, align 8
  %366 = load volatile double, double* %364, align 8
  %367 = load double, double* %d10, align 8
  %368 = fadd double %367, %366
  store double %368, double* %d10, align 8
  %369 = load double*, double** %pd, align 8
  %370 = getelementptr inbounds double, double* %369, i32 1
  store double* %370, double** %pd, align 8
  %371 = load volatile double, double* %369, align 8
  %372 = load double, double* %d20, align 8
  %373 = fadd double %372, %371
  store double %373, double* %d20, align 8
  %374 = load double*, double** %pd, align 8
  %375 = getelementptr inbounds double, double* %374, i32 1
  store double* %375, double** %pd, align 8
  %376 = load volatile double, double* %374, align 8
  %377 = load double, double* %d30, align 8
  %378 = fadd double %377, %376
  store double %378, double* %d30, align 8
  %379 = load double*, double** %pd, align 8
  %380 = getelementptr inbounds double, double* %379, i32 1
  store double* %380, double** %pd, align 8
  %381 = load volatile double, double* %379, align 8
  %382 = load double, double* %d01, align 8
  %383 = fadd double %382, %381
  store double %383, double* %d01, align 8
  %384 = load double*, double** %pd, align 8
  %385 = getelementptr inbounds double, double* %384, i32 1
  store double* %385, double** %pd, align 8
  %386 = load volatile double, double* %384, align 8
  %387 = load double, double* %d11, align 8
  %388 = fadd double %387, %386
  store double %388, double* %d11, align 8
  %389 = load double*, double** %pd, align 8
  %390 = getelementptr inbounds double, double* %389, i32 1
  store double* %390, double** %pd, align 8
  %391 = load volatile double, double* %389, align 8
  %392 = load double, double* %d21, align 8
  %393 = fadd double %392, %391
  store double %393, double* %d21, align 8
  %394 = load double*, double** %pd, align 8
  %395 = getelementptr inbounds double, double* %394, i32 1
  store double* %395, double** %pd, align 8
  %396 = load volatile double, double* %394, align 8
  %397 = load double, double* %d31, align 8
  %398 = fadd double %397, %396
  store double %398, double* %d31, align 8
  %399 = load double*, double** %pd, align 8
  %400 = getelementptr inbounds double, double* %399, i32 1
  store double* %400, double** %pd, align 8
  %401 = load volatile double, double* %399, align 8
  %402 = load double, double* %d02, align 8
  %403 = fadd double %402, %401
  store double %403, double* %d02, align 8
  %404 = load double*, double** %pd, align 8
  %405 = getelementptr inbounds double, double* %404, i32 1
  store double* %405, double** %pd, align 8
  %406 = load volatile double, double* %404, align 8
  %407 = load double, double* %d12, align 8
  %408 = fadd double %407, %406
  store double %408, double* %d12, align 8
  %409 = load double*, double** %pd, align 8
  %410 = getelementptr inbounds double, double* %409, i32 1
  store double* %410, double** %pd, align 8
  %411 = load volatile double, double* %409, align 8
  %412 = load double, double* %d22, align 8
  %413 = fadd double %412, %411
  store double %413, double* %d22, align 8
  %414 = load double*, double** %pd, align 8
  %415 = getelementptr inbounds double, double* %414, i32 1
  store double* %415, double** %pd, align 8
  %416 = load volatile double, double* %414, align 8
  %417 = load double, double* %d32, align 8
  %418 = fadd double %417, %416
  store double %418, double* %d32, align 8
  %419 = load double*, double** %pd, align 8
  %420 = getelementptr inbounds double, double* %419, i32 1
  store double* %420, double** %pd, align 8
  %421 = load volatile double, double* %419, align 8
  %422 = load double, double* %d03, align 8
  %423 = fadd double %422, %421
  store double %423, double* %d03, align 8
  %424 = load double*, double** %pd, align 8
  %425 = getelementptr inbounds double, double* %424, i32 1
  store double* %425, double** %pd, align 8
  %426 = load volatile double, double* %424, align 8
  %427 = load double, double* %d13, align 8
  %428 = fadd double %427, %426
  store double %428, double* %d13, align 8
  %429 = load double*, double** %pd, align 8
  %430 = getelementptr inbounds double, double* %429, i32 1
  store double* %430, double** %pd, align 8
  %431 = load volatile double, double* %429, align 8
  %432 = load double, double* %d23, align 8
  %433 = fadd double %432, %431
  store double %433, double* %d23, align 8
  %434 = load double*, double** %pd, align 8
  %435 = getelementptr inbounds double, double* %434, i32 1
  store double* %435, double** %pd, align 8
  %436 = load volatile double, double* %434, align 8
  %437 = load double, double* %d33, align 8
  %438 = fadd double %437, %436
  store double %438, double* %d33, align 8
  %439 = load double*, double** %pd, align 8
  %440 = getelementptr inbounds double, double* %439, i32 1
  store double* %440, double** %pd, align 8
  %441 = load volatile double, double* %439, align 8
  %442 = load double, double* %d04, align 8
  %443 = fadd double %442, %441
  store double %443, double* %d04, align 8
  %444 = load double*, double** %pd, align 8
  %445 = getelementptr inbounds double, double* %444, i32 1
  store double* %445, double** %pd, align 8
  %446 = load volatile double, double* %444, align 8
  %447 = load double, double* %d14, align 8
  %448 = fadd double %447, %446
  store double %448, double* %d14, align 8
  %449 = load double*, double** %pd, align 8
  %450 = getelementptr inbounds double, double* %449, i32 1
  store double* %450, double** %pd, align 8
  %451 = load volatile double, double* %449, align 8
  %452 = load double, double* %d24, align 8
  %453 = fadd double %452, %451
  store double %453, double* %d24, align 8
  %454 = load double*, double** %pd, align 8
  %455 = getelementptr inbounds double, double* %454, i32 1
  store double* %455, double** %pd, align 8
  %456 = load volatile double, double* %454, align 8
  %457 = load double, double* %d34, align 8
  %458 = fadd double %457, %456
  store double %458, double* %d34, align 8
  %459 = load double*, double** %pd, align 8
  %460 = getelementptr inbounds double, double* %459, i32 1
  store double* %460, double** %pd, align 8
  %461 = load volatile double, double* %459, align 8
  %462 = load double, double* %d05, align 8
  %463 = fadd double %462, %461
  store double %463, double* %d05, align 8
  %464 = load double*, double** %pd, align 8
  %465 = getelementptr inbounds double, double* %464, i32 1
  store double* %465, double** %pd, align 8
  %466 = load volatile double, double* %464, align 8
  %467 = load double, double* %d15, align 8
  %468 = fadd double %467, %466
  store double %468, double* %d15, align 8
  %469 = load double*, double** %pd, align 8
  %470 = getelementptr inbounds double, double* %469, i32 1
  store double* %470, double** %pd, align 8
  %471 = load volatile double, double* %469, align 8
  %472 = load double, double* %d25, align 8
  %473 = fadd double %472, %471
  store double %473, double* %d25, align 8
  %474 = load double*, double** %pd, align 8
  %475 = getelementptr inbounds double, double* %474, i32 1
  store double* %475, double** %pd, align 8
  %476 = load volatile double, double* %474, align 8
  %477 = load double, double* %d35, align 8
  %478 = fadd double %477, %476
  store double %478, double* %d35, align 8
  %479 = load double*, double** %pd, align 8
  %480 = getelementptr inbounds double, double* %479, i32 1
  store double* %480, double** %pd, align 8
  %481 = load volatile double, double* %479, align 8
  %482 = load double, double* %d06, align 8
  %483 = fadd double %482, %481
  store double %483, double* %d06, align 8
  %484 = load double*, double** %pd, align 8
  %485 = getelementptr inbounds double, double* %484, i32 1
  store double* %485, double** %pd, align 8
  %486 = load volatile double, double* %484, align 8
  %487 = load double, double* %d16, align 8
  %488 = fadd double %487, %486
  store double %488, double* %d16, align 8
  %489 = load double*, double** %pd, align 8
  %490 = getelementptr inbounds double, double* %489, i32 1
  store double* %490, double** %pd, align 8
  %491 = load volatile double, double* %489, align 8
  %492 = load double, double* %d26, align 8
  %493 = fadd double %492, %491
  store double %493, double* %d26, align 8
  %494 = load double*, double** %pd, align 8
  %495 = getelementptr inbounds double, double* %494, i32 1
  store double* %495, double** %pd, align 8
  %496 = load volatile double, double* %494, align 8
  %497 = load double, double* %d36, align 8
  %498 = fadd double %497, %496
  store double %498, double* %d36, align 8
  %499 = load double*, double** %pd, align 8
  %500 = getelementptr inbounds double, double* %499, i32 1
  store double* %500, double** %pd, align 8
  %501 = load volatile double, double* %499, align 8
  %502 = load double, double* %d07, align 8
  %503 = fadd double %502, %501
  store double %503, double* %d07, align 8
  %504 = load double*, double** %pd, align 8
  %505 = getelementptr inbounds double, double* %504, i32 1
  store double* %505, double** %pd, align 8
  %506 = load volatile double, double* %504, align 8
  %507 = load double, double* %d17, align 8
  %508 = fadd double %507, %506
  store double %508, double* %d17, align 8
  %509 = load double*, double** %pd, align 8
  %510 = getelementptr inbounds double, double* %509, i32 1
  store double* %510, double** %pd, align 8
  %511 = load volatile double, double* %509, align 8
  %512 = load double, double* %d27, align 8
  %513 = fadd double %512, %511
  store double %513, double* %d27, align 8
  %514 = load double*, double** %pd, align 8
  %515 = getelementptr inbounds double, double* %514, i32 1
  store double* %515, double** %pd, align 8
  %516 = load volatile double, double* %514, align 8
  %517 = load double, double* %d37, align 8
  %518 = fadd double %517, %516
  store double %518, double* %d37, align 8
  store double* getelementptr inbounds ([32 x double], [32 x double]* @gd, i32 0, i32 0), double** %pd, align 8
  %519 = load double*, double** %pd, align 8
  %520 = getelementptr inbounds double, double* %519, i32 1
  store double* %520, double** %pd, align 8
  %521 = load volatile double, double* %519, align 8
  %522 = load double, double* %d00, align 8
  %523 = fadd double %522, %521
  store double %523, double* %d00, align 8
  %524 = load double*, double** %pd, align 8
  %525 = getelementptr inbounds double, double* %524, i32 1
  store double* %525, double** %pd, align 8
  %526 = load volatile double, double* %524, align 8
  %527 = load double, double* %d10, align 8
  %528 = fadd double %527, %526
  store double %528, double* %d10, align 8
  %529 = load double*, double** %pd, align 8
  %530 = getelementptr inbounds double, double* %529, i32 1
  store double* %530, double** %pd, align 8
  %531 = load volatile double, double* %529, align 8
  %532 = load double, double* %d20, align 8
  %533 = fadd double %532, %531
  store double %533, double* %d20, align 8
  %534 = load double*, double** %pd, align 8
  %535 = getelementptr inbounds double, double* %534, i32 1
  store double* %535, double** %pd, align 8
  %536 = load volatile double, double* %534, align 8
  %537 = load double, double* %d30, align 8
  %538 = fadd double %537, %536
  store double %538, double* %d30, align 8
  %539 = load double*, double** %pd, align 8
  %540 = getelementptr inbounds double, double* %539, i32 1
  store double* %540, double** %pd, align 8
  %541 = load volatile double, double* %539, align 8
  %542 = load double, double* %d01, align 8
  %543 = fadd double %542, %541
  store double %543, double* %d01, align 8
  %544 = load double*, double** %pd, align 8
  %545 = getelementptr inbounds double, double* %544, i32 1
  store double* %545, double** %pd, align 8
  %546 = load volatile double, double* %544, align 8
  %547 = load double, double* %d11, align 8
  %548 = fadd double %547, %546
  store double %548, double* %d11, align 8
  %549 = load double*, double** %pd, align 8
  %550 = getelementptr inbounds double, double* %549, i32 1
  store double* %550, double** %pd, align 8
  %551 = load volatile double, double* %549, align 8
  %552 = load double, double* %d21, align 8
  %553 = fadd double %552, %551
  store double %553, double* %d21, align 8
  %554 = load double*, double** %pd, align 8
  %555 = getelementptr inbounds double, double* %554, i32 1
  store double* %555, double** %pd, align 8
  %556 = load volatile double, double* %554, align 8
  %557 = load double, double* %d31, align 8
  %558 = fadd double %557, %556
  store double %558, double* %d31, align 8
  %559 = load double*, double** %pd, align 8
  %560 = getelementptr inbounds double, double* %559, i32 1
  store double* %560, double** %pd, align 8
  %561 = load volatile double, double* %559, align 8
  %562 = load double, double* %d02, align 8
  %563 = fadd double %562, %561
  store double %563, double* %d02, align 8
  %564 = load double*, double** %pd, align 8
  %565 = getelementptr inbounds double, double* %564, i32 1
  store double* %565, double** %pd, align 8
  %566 = load volatile double, double* %564, align 8
  %567 = load double, double* %d12, align 8
  %568 = fadd double %567, %566
  store double %568, double* %d12, align 8
  %569 = load double*, double** %pd, align 8
  %570 = getelementptr inbounds double, double* %569, i32 1
  store double* %570, double** %pd, align 8
  %571 = load volatile double, double* %569, align 8
  %572 = load double, double* %d22, align 8
  %573 = fadd double %572, %571
  store double %573, double* %d22, align 8
  %574 = load double*, double** %pd, align 8
  %575 = getelementptr inbounds double, double* %574, i32 1
  store double* %575, double** %pd, align 8
  %576 = load volatile double, double* %574, align 8
  %577 = load double, double* %d32, align 8
  %578 = fadd double %577, %576
  store double %578, double* %d32, align 8
  %579 = load double*, double** %pd, align 8
  %580 = getelementptr inbounds double, double* %579, i32 1
  store double* %580, double** %pd, align 8
  %581 = load volatile double, double* %579, align 8
  %582 = load double, double* %d03, align 8
  %583 = fadd double %582, %581
  store double %583, double* %d03, align 8
  %584 = load double*, double** %pd, align 8
  %585 = getelementptr inbounds double, double* %584, i32 1
  store double* %585, double** %pd, align 8
  %586 = load volatile double, double* %584, align 8
  %587 = load double, double* %d13, align 8
  %588 = fadd double %587, %586
  store double %588, double* %d13, align 8
  %589 = load double*, double** %pd, align 8
  %590 = getelementptr inbounds double, double* %589, i32 1
  store double* %590, double** %pd, align 8
  %591 = load volatile double, double* %589, align 8
  %592 = load double, double* %d23, align 8
  %593 = fadd double %592, %591
  store double %593, double* %d23, align 8
  %594 = load double*, double** %pd, align 8
  %595 = getelementptr inbounds double, double* %594, i32 1
  store double* %595, double** %pd, align 8
  %596 = load volatile double, double* %594, align 8
  %597 = load double, double* %d33, align 8
  %598 = fadd double %597, %596
  store double %598, double* %d33, align 8
  %599 = load double*, double** %pd, align 8
  %600 = getelementptr inbounds double, double* %599, i32 1
  store double* %600, double** %pd, align 8
  %601 = load volatile double, double* %599, align 8
  %602 = load double, double* %d04, align 8
  %603 = fadd double %602, %601
  store double %603, double* %d04, align 8
  %604 = load double*, double** %pd, align 8
  %605 = getelementptr inbounds double, double* %604, i32 1
  store double* %605, double** %pd, align 8
  %606 = load volatile double, double* %604, align 8
  %607 = load double, double* %d14, align 8
  %608 = fadd double %607, %606
  store double %608, double* %d14, align 8
  %609 = load double*, double** %pd, align 8
  %610 = getelementptr inbounds double, double* %609, i32 1
  store double* %610, double** %pd, align 8
  %611 = load volatile double, double* %609, align 8
  %612 = load double, double* %d24, align 8
  %613 = fadd double %612, %611
  store double %613, double* %d24, align 8
  %614 = load double*, double** %pd, align 8
  %615 = getelementptr inbounds double, double* %614, i32 1
  store double* %615, double** %pd, align 8
  %616 = load volatile double, double* %614, align 8
  %617 = load double, double* %d34, align 8
  %618 = fadd double %617, %616
  store double %618, double* %d34, align 8
  %619 = load double*, double** %pd, align 8
  %620 = getelementptr inbounds double, double* %619, i32 1
  store double* %620, double** %pd, align 8
  %621 = load volatile double, double* %619, align 8
  %622 = load double, double* %d05, align 8
  %623 = fadd double %622, %621
  store double %623, double* %d05, align 8
  %624 = load double*, double** %pd, align 8
  %625 = getelementptr inbounds double, double* %624, i32 1
  store double* %625, double** %pd, align 8
  %626 = load volatile double, double* %624, align 8
  %627 = load double, double* %d15, align 8
  %628 = fadd double %627, %626
  store double %628, double* %d15, align 8
  %629 = load double*, double** %pd, align 8
  %630 = getelementptr inbounds double, double* %629, i32 1
  store double* %630, double** %pd, align 8
  %631 = load volatile double, double* %629, align 8
  %632 = load double, double* %d25, align 8
  %633 = fadd double %632, %631
  store double %633, double* %d25, align 8
  %634 = load double*, double** %pd, align 8
  %635 = getelementptr inbounds double, double* %634, i32 1
  store double* %635, double** %pd, align 8
  %636 = load volatile double, double* %634, align 8
  %637 = load double, double* %d35, align 8
  %638 = fadd double %637, %636
  store double %638, double* %d35, align 8
  %639 = load double*, double** %pd, align 8
  %640 = getelementptr inbounds double, double* %639, i32 1
  store double* %640, double** %pd, align 8
  %641 = load volatile double, double* %639, align 8
  %642 = load double, double* %d06, align 8
  %643 = fadd double %642, %641
  store double %643, double* %d06, align 8
  %644 = load double*, double** %pd, align 8
  %645 = getelementptr inbounds double, double* %644, i32 1
  store double* %645, double** %pd, align 8
  %646 = load volatile double, double* %644, align 8
  %647 = load double, double* %d16, align 8
  %648 = fadd double %647, %646
  store double %648, double* %d16, align 8
  %649 = load double*, double** %pd, align 8
  %650 = getelementptr inbounds double, double* %649, i32 1
  store double* %650, double** %pd, align 8
  %651 = load volatile double, double* %649, align 8
  %652 = load double, double* %d26, align 8
  %653 = fadd double %652, %651
  store double %653, double* %d26, align 8
  %654 = load double*, double** %pd, align 8
  %655 = getelementptr inbounds double, double* %654, i32 1
  store double* %655, double** %pd, align 8
  %656 = load volatile double, double* %654, align 8
  %657 = load double, double* %d36, align 8
  %658 = fadd double %657, %656
  store double %658, double* %d36, align 8
  %659 = load double*, double** %pd, align 8
  %660 = getelementptr inbounds double, double* %659, i32 1
  store double* %660, double** %pd, align 8
  %661 = load volatile double, double* %659, align 8
  %662 = load double, double* %d07, align 8
  %663 = fadd double %662, %661
  store double %663, double* %d07, align 8
  %664 = load double*, double** %pd, align 8
  %665 = getelementptr inbounds double, double* %664, i32 1
  store double* %665, double** %pd, align 8
  %666 = load volatile double, double* %664, align 8
  %667 = load double, double* %d17, align 8
  %668 = fadd double %667, %666
  store double %668, double* %d17, align 8
  %669 = load double*, double** %pd, align 8
  %670 = getelementptr inbounds double, double* %669, i32 1
  store double* %670, double** %pd, align 8
  %671 = load volatile double, double* %669, align 8
  %672 = load double, double* %d27, align 8
  %673 = fadd double %672, %671
  store double %673, double* %d27, align 8
  %674 = load double*, double** %pd, align 8
  %675 = getelementptr inbounds double, double* %674, i32 1
  store double* %675, double** %pd, align 8
  %676 = load volatile double, double* %674, align 8
  %677 = load double, double* %d37, align 8
  %678 = fadd double %677, %676
  store double %678, double* %d37, align 8
  store float* getelementptr inbounds ([32 x float], [32 x float]* @gf, i32 0, i32 0), float** %pf, align 8
  %679 = load float, float* %f00, align 4
  %680 = load float*, float** %pf, align 8
  %681 = getelementptr inbounds float, float* %680, i32 1
  store float* %681, float** %pf, align 8
  store volatile float %679, float* %680, align 4
  %682 = load float, float* %f10, align 4
  %683 = load float*, float** %pf, align 8
  %684 = getelementptr inbounds float, float* %683, i32 1
  store float* %684, float** %pf, align 8
  store volatile float %682, float* %683, align 4
  %685 = load float, float* %f20, align 4
  %686 = load float*, float** %pf, align 8
  %687 = getelementptr inbounds float, float* %686, i32 1
  store float* %687, float** %pf, align 8
  store volatile float %685, float* %686, align 4
  %688 = load float, float* %f30, align 4
  %689 = load float*, float** %pf, align 8
  %690 = getelementptr inbounds float, float* %689, i32 1
  store float* %690, float** %pf, align 8
  store volatile float %688, float* %689, align 4
  %691 = load float, float* %f01, align 4
  %692 = load float*, float** %pf, align 8
  %693 = getelementptr inbounds float, float* %692, i32 1
  store float* %693, float** %pf, align 8
  store volatile float %691, float* %692, align 4
  %694 = load float, float* %f11, align 4
  %695 = load float*, float** %pf, align 8
  %696 = getelementptr inbounds float, float* %695, i32 1
  store float* %696, float** %pf, align 8
  store volatile float %694, float* %695, align 4
  %697 = load float, float* %f21, align 4
  %698 = load float*, float** %pf, align 8
  %699 = getelementptr inbounds float, float* %698, i32 1
  store float* %699, float** %pf, align 8
  store volatile float %697, float* %698, align 4
  %700 = load float, float* %f31, align 4
  %701 = load float*, float** %pf, align 8
  %702 = getelementptr inbounds float, float* %701, i32 1
  store float* %702, float** %pf, align 8
  store volatile float %700, float* %701, align 4
  %703 = load float, float* %f02, align 4
  %704 = load float*, float** %pf, align 8
  %705 = getelementptr inbounds float, float* %704, i32 1
  store float* %705, float** %pf, align 8
  store volatile float %703, float* %704, align 4
  %706 = load float, float* %f12, align 4
  %707 = load float*, float** %pf, align 8
  %708 = getelementptr inbounds float, float* %707, i32 1
  store float* %708, float** %pf, align 8
  store volatile float %706, float* %707, align 4
  %709 = load float, float* %f22, align 4
  %710 = load float*, float** %pf, align 8
  %711 = getelementptr inbounds float, float* %710, i32 1
  store float* %711, float** %pf, align 8
  store volatile float %709, float* %710, align 4
  %712 = load float, float* %f32, align 4
  %713 = load float*, float** %pf, align 8
  %714 = getelementptr inbounds float, float* %713, i32 1
  store float* %714, float** %pf, align 8
  store volatile float %712, float* %713, align 4
  %715 = load float, float* %f03, align 4
  %716 = load float*, float** %pf, align 8
  %717 = getelementptr inbounds float, float* %716, i32 1
  store float* %717, float** %pf, align 8
  store volatile float %715, float* %716, align 4
  %718 = load float, float* %f13, align 4
  %719 = load float*, float** %pf, align 8
  %720 = getelementptr inbounds float, float* %719, i32 1
  store float* %720, float** %pf, align 8
  store volatile float %718, float* %719, align 4
  %721 = load float, float* %f23, align 4
  %722 = load float*, float** %pf, align 8
  %723 = getelementptr inbounds float, float* %722, i32 1
  store float* %723, float** %pf, align 8
  store volatile float %721, float* %722, align 4
  %724 = load float, float* %f33, align 4
  %725 = load float*, float** %pf, align 8
  %726 = getelementptr inbounds float, float* %725, i32 1
  store float* %726, float** %pf, align 8
  store volatile float %724, float* %725, align 4
  %727 = load float, float* %f04, align 4
  %728 = load float*, float** %pf, align 8
  %729 = getelementptr inbounds float, float* %728, i32 1
  store float* %729, float** %pf, align 8
  store volatile float %727, float* %728, align 4
  %730 = load float, float* %f14, align 4
  %731 = load float*, float** %pf, align 8
  %732 = getelementptr inbounds float, float* %731, i32 1
  store float* %732, float** %pf, align 8
  store volatile float %730, float* %731, align 4
  %733 = load float, float* %f24, align 4
  %734 = load float*, float** %pf, align 8
  %735 = getelementptr inbounds float, float* %734, i32 1
  store float* %735, float** %pf, align 8
  store volatile float %733, float* %734, align 4
  %736 = load float, float* %f34, align 4
  %737 = load float*, float** %pf, align 8
  %738 = getelementptr inbounds float, float* %737, i32 1
  store float* %738, float** %pf, align 8
  store volatile float %736, float* %737, align 4
  %739 = load float, float* %f05, align 4
  %740 = load float*, float** %pf, align 8
  %741 = getelementptr inbounds float, float* %740, i32 1
  store float* %741, float** %pf, align 8
  store volatile float %739, float* %740, align 4
  %742 = load float, float* %f15, align 4
  %743 = load float*, float** %pf, align 8
  %744 = getelementptr inbounds float, float* %743, i32 1
  store float* %744, float** %pf, align 8
  store volatile float %742, float* %743, align 4
  %745 = load float, float* %f25, align 4
  %746 = load float*, float** %pf, align 8
  %747 = getelementptr inbounds float, float* %746, i32 1
  store float* %747, float** %pf, align 8
  store volatile float %745, float* %746, align 4
  %748 = load float, float* %f35, align 4
  %749 = load float*, float** %pf, align 8
  %750 = getelementptr inbounds float, float* %749, i32 1
  store float* %750, float** %pf, align 8
  store volatile float %748, float* %749, align 4
  %751 = load float, float* %f06, align 4
  %752 = load float*, float** %pf, align 8
  %753 = getelementptr inbounds float, float* %752, i32 1
  store float* %753, float** %pf, align 8
  store volatile float %751, float* %752, align 4
  %754 = load float, float* %f16, align 4
  %755 = load float*, float** %pf, align 8
  %756 = getelementptr inbounds float, float* %755, i32 1
  store float* %756, float** %pf, align 8
  store volatile float %754, float* %755, align 4
  %757 = load float, float* %f26, align 4
  %758 = load float*, float** %pf, align 8
  %759 = getelementptr inbounds float, float* %758, i32 1
  store float* %759, float** %pf, align 8
  store volatile float %757, float* %758, align 4
  %760 = load float, float* %f36, align 4
  %761 = load float*, float** %pf, align 8
  %762 = getelementptr inbounds float, float* %761, i32 1
  store float* %762, float** %pf, align 8
  store volatile float %760, float* %761, align 4
  %763 = load float, float* %f07, align 4
  %764 = load float*, float** %pf, align 8
  %765 = getelementptr inbounds float, float* %764, i32 1
  store float* %765, float** %pf, align 8
  store volatile float %763, float* %764, align 4
  %766 = load float, float* %f17, align 4
  %767 = load float*, float** %pf, align 8
  %768 = getelementptr inbounds float, float* %767, i32 1
  store float* %768, float** %pf, align 8
  store volatile float %766, float* %767, align 4
  %769 = load float, float* %f27, align 4
  %770 = load float*, float** %pf, align 8
  %771 = getelementptr inbounds float, float* %770, i32 1
  store float* %771, float** %pf, align 8
  store volatile float %769, float* %770, align 4
  %772 = load float, float* %f37, align 4
  %773 = load float*, float** %pf, align 8
  %774 = getelementptr inbounds float, float* %773, i32 1
  store float* %774, float** %pf, align 8
  store volatile float %772, float* %773, align 4
  br label %775

; <label>:775                                     ; preds = %102
  %776 = load i32, i32* %i, align 4
  %777 = add nsw i32 %776, 1
  store i32 %777, i32* %i, align 4
  br label %98

; <label>:778                                     ; preds = %98
  store double* getelementptr inbounds ([32 x double], [32 x double]* @gd, i32 0, i32 0), double** %pd, align 8
  %779 = load double, double* %d00, align 8
  %780 = load double*, double** %pd, align 8
  %781 = getelementptr inbounds double, double* %780, i32 1
  store double* %781, double** %pd, align 8
  store volatile double %779, double* %780, align 8
  %782 = load double, double* %d10, align 8
  %783 = load double*, double** %pd, align 8
  %784 = getelementptr inbounds double, double* %783, i32 1
  store double* %784, double** %pd, align 8
  store volatile double %782, double* %783, align 8
  %785 = load double, double* %d20, align 8
  %786 = load double*, double** %pd, align 8
  %787 = getelementptr inbounds double, double* %786, i32 1
  store double* %787, double** %pd, align 8
  store volatile double %785, double* %786, align 8
  %788 = load double, double* %d30, align 8
  %789 = load double*, double** %pd, align 8
  %790 = getelementptr inbounds double, double* %789, i32 1
  store double* %790, double** %pd, align 8
  store volatile double %788, double* %789, align 8
  %791 = load double, double* %d01, align 8
  %792 = load double*, double** %pd, align 8
  %793 = getelementptr inbounds double, double* %792, i32 1
  store double* %793, double** %pd, align 8
  store volatile double %791, double* %792, align 8
  %794 = load double, double* %d11, align 8
  %795 = load double*, double** %pd, align 8
  %796 = getelementptr inbounds double, double* %795, i32 1
  store double* %796, double** %pd, align 8
  store volatile double %794, double* %795, align 8
  %797 = load double, double* %d21, align 8
  %798 = load double*, double** %pd, align 8
  %799 = getelementptr inbounds double, double* %798, i32 1
  store double* %799, double** %pd, align 8
  store volatile double %797, double* %798, align 8
  %800 = load double, double* %d31, align 8
  %801 = load double*, double** %pd, align 8
  %802 = getelementptr inbounds double, double* %801, i32 1
  store double* %802, double** %pd, align 8
  store volatile double %800, double* %801, align 8
  %803 = load double, double* %d02, align 8
  %804 = load double*, double** %pd, align 8
  %805 = getelementptr inbounds double, double* %804, i32 1
  store double* %805, double** %pd, align 8
  store volatile double %803, double* %804, align 8
  %806 = load double, double* %d12, align 8
  %807 = load double*, double** %pd, align 8
  %808 = getelementptr inbounds double, double* %807, i32 1
  store double* %808, double** %pd, align 8
  store volatile double %806, double* %807, align 8
  %809 = load double, double* %d22, align 8
  %810 = load double*, double** %pd, align 8
  %811 = getelementptr inbounds double, double* %810, i32 1
  store double* %811, double** %pd, align 8
  store volatile double %809, double* %810, align 8
  %812 = load double, double* %d32, align 8
  %813 = load double*, double** %pd, align 8
  %814 = getelementptr inbounds double, double* %813, i32 1
  store double* %814, double** %pd, align 8
  store volatile double %812, double* %813, align 8
  %815 = load double, double* %d03, align 8
  %816 = load double*, double** %pd, align 8
  %817 = getelementptr inbounds double, double* %816, i32 1
  store double* %817, double** %pd, align 8
  store volatile double %815, double* %816, align 8
  %818 = load double, double* %d13, align 8
  %819 = load double*, double** %pd, align 8
  %820 = getelementptr inbounds double, double* %819, i32 1
  store double* %820, double** %pd, align 8
  store volatile double %818, double* %819, align 8
  %821 = load double, double* %d23, align 8
  %822 = load double*, double** %pd, align 8
  %823 = getelementptr inbounds double, double* %822, i32 1
  store double* %823, double** %pd, align 8
  store volatile double %821, double* %822, align 8
  %824 = load double, double* %d33, align 8
  %825 = load double*, double** %pd, align 8
  %826 = getelementptr inbounds double, double* %825, i32 1
  store double* %826, double** %pd, align 8
  store volatile double %824, double* %825, align 8
  %827 = load double, double* %d04, align 8
  %828 = load double*, double** %pd, align 8
  %829 = getelementptr inbounds double, double* %828, i32 1
  store double* %829, double** %pd, align 8
  store volatile double %827, double* %828, align 8
  %830 = load double, double* %d14, align 8
  %831 = load double*, double** %pd, align 8
  %832 = getelementptr inbounds double, double* %831, i32 1
  store double* %832, double** %pd, align 8
  store volatile double %830, double* %831, align 8
  %833 = load double, double* %d24, align 8
  %834 = load double*, double** %pd, align 8
  %835 = getelementptr inbounds double, double* %834, i32 1
  store double* %835, double** %pd, align 8
  store volatile double %833, double* %834, align 8
  %836 = load double, double* %d34, align 8
  %837 = load double*, double** %pd, align 8
  %838 = getelementptr inbounds double, double* %837, i32 1
  store double* %838, double** %pd, align 8
  store volatile double %836, double* %837, align 8
  %839 = load double, double* %d05, align 8
  %840 = load double*, double** %pd, align 8
  %841 = getelementptr inbounds double, double* %840, i32 1
  store double* %841, double** %pd, align 8
  store volatile double %839, double* %840, align 8
  %842 = load double, double* %d15, align 8
  %843 = load double*, double** %pd, align 8
  %844 = getelementptr inbounds double, double* %843, i32 1
  store double* %844, double** %pd, align 8
  store volatile double %842, double* %843, align 8
  %845 = load double, double* %d25, align 8
  %846 = load double*, double** %pd, align 8
  %847 = getelementptr inbounds double, double* %846, i32 1
  store double* %847, double** %pd, align 8
  store volatile double %845, double* %846, align 8
  %848 = load double, double* %d35, align 8
  %849 = load double*, double** %pd, align 8
  %850 = getelementptr inbounds double, double* %849, i32 1
  store double* %850, double** %pd, align 8
  store volatile double %848, double* %849, align 8
  %851 = load double, double* %d06, align 8
  %852 = load double*, double** %pd, align 8
  %853 = getelementptr inbounds double, double* %852, i32 1
  store double* %853, double** %pd, align 8
  store volatile double %851, double* %852, align 8
  %854 = load double, double* %d16, align 8
  %855 = load double*, double** %pd, align 8
  %856 = getelementptr inbounds double, double* %855, i32 1
  store double* %856, double** %pd, align 8
  store volatile double %854, double* %855, align 8
  %857 = load double, double* %d26, align 8
  %858 = load double*, double** %pd, align 8
  %859 = getelementptr inbounds double, double* %858, i32 1
  store double* %859, double** %pd, align 8
  store volatile double %857, double* %858, align 8
  %860 = load double, double* %d36, align 8
  %861 = load double*, double** %pd, align 8
  %862 = getelementptr inbounds double, double* %861, i32 1
  store double* %862, double** %pd, align 8
  store volatile double %860, double* %861, align 8
  %863 = load double, double* %d07, align 8
  %864 = load double*, double** %pd, align 8
  %865 = getelementptr inbounds double, double* %864, i32 1
  store double* %865, double** %pd, align 8
  store volatile double %863, double* %864, align 8
  %866 = load double, double* %d17, align 8
  %867 = load double*, double** %pd, align 8
  %868 = getelementptr inbounds double, double* %867, i32 1
  store double* %868, double** %pd, align 8
  store volatile double %866, double* %867, align 8
  %869 = load double, double* %d27, align 8
  %870 = load double*, double** %pd, align 8
  %871 = getelementptr inbounds double, double* %870, i32 1
  store double* %871, double** %pd, align 8
  store volatile double %869, double* %870, align 8
  %872 = load double, double* %d37, align 8
  %873 = load double*, double** %pd, align 8
  %874 = getelementptr inbounds double, double* %873, i32 1
  store double* %874, double** %pd, align 8
  store volatile double %872, double* %873, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %16, %0
  %3 = load i32, i32* %i, align 4
  %4 = icmp slt i32 %3, 32
  br i1 %4, label %5, label %19

; <label>:5                                       ; preds = %2
  %6 = load i32, i32* %i, align 4
  %7 = sitofp i32 %6 to double
  %8 = load i32, i32* %i, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [32 x double], [32 x double]* @gd, i32 0, i64 %9
  store volatile double %7, double* %10, align 8
  %11 = load i32, i32* %i, align 4
  %12 = sitofp i32 %11 to float
  %13 = load i32, i32* %i, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [32 x float], [32 x float]* @gf, i32 0, i64 %14
  store volatile float %12, float* %15, align 4
  br label %16

; <label>:16                                      ; preds = %5
  %17 = load i32, i32* %i, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, i32* %i, align 4
  br label %2

; <label>:19                                      ; preds = %2
  call void @foo(i32 1)
  store i32 0, i32* %i, align 4
  br label %20

; <label>:20                                      ; preds = %42, %19
  %21 = load i32, i32* %i, align 4
  %22 = icmp slt i32 %21, 32
  br i1 %22, label %23, label %45

; <label>:23                                      ; preds = %20
  %24 = load i32, i32* %i, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [32 x double], [32 x double]* @gd, i32 0, i64 %25
  %27 = load volatile double, double* %26, align 8
  %28 = load i32, i32* %i, align 4
  %29 = mul nsw i32 %28, 4
  %30 = sitofp i32 %29 to double
  %31 = fcmp une double %27, %30
  br i1 %31, label %40, label %32

; <label>:32                                      ; preds = %23
  %33 = load i32, i32* %i, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [32 x float], [32 x float]* @gf, i32 0, i64 %34
  %36 = load volatile float, float* %35, align 4
  %37 = load i32, i32* %i, align 4
  %38 = sitofp i32 %37 to float
  %39 = fcmp une float %36, %38
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %32, %23
  call void @abort() #2
  unreachable

; <label>:41                                      ; preds = %32
  br label %42

; <label>:42                                      ; preds = %41
  %43 = load i32, i32* %i, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, i32* %i, align 4
  br label %20

; <label>:45                                      ; preds = %20
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %47 = load i32, i32* %1
  ret i32 %47
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
