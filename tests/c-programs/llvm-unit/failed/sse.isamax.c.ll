; ModuleID = './sse.isamax.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [21 x i8] c" maximum index = %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [21 x i8] c" maximum value = %e\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca [20 x float], align 16
  %i = alloca i32, align 4
  %im = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %14, %0
  %3 = load i32, i32* %i, align 4
  %4 = icmp slt i32 %3, 20
  br i1 %4, label %5, label %17

; <label>:5                                       ; preds = %2
  %6 = load i32, i32* %i, align 4
  %7 = sitofp i32 %6 to float
  %8 = fpext float %7 to double
  %9 = fadd double -2.000000e+00, %8
  %10 = fptrunc double %9 to float
  %11 = load i32, i32* %i, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [20 x float], [20 x float]* %x, i32 0, i64 %12
  store float %10, float* %13, align 4
  br label %14

; <label>:14                                      ; preds = %5
  %15 = load i32, i32* %i, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, i32* %i, align 4
  br label %2

; <label>:17                                      ; preds = %2
  %18 = getelementptr inbounds [20 x float], [20 x float]* %x, i32 0, i64 7
  store float 3.300000e+01, float* %18, align 4
  %19 = getelementptr inbounds [20 x float], [20 x float]* %x, i32 0, i32 0
  %20 = call i32 @isamax0(i32 20, float* %19)
  store i32 %20, i32* %im, align 4
  %21 = load i32, i32* %im, align 4
  %22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i32 0, i32 0), i32 %21)
  %23 = load i32, i32* %im, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [20 x float], [20 x float]* %x, i32 0, i64 %24
  %26 = load float, float* %25, align 4
  %27 = fpext float %26 to double
  %28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.1, i32 0, i32 0), double %27)
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @isamax0(i32 %n, float* %x) #0 {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %5 = alloca <4 x float>, align 16
  %6 = alloca float, align 4
  %7 = alloca <4 x float>, align 16
  %8 = alloca float, align 4
  %9 = alloca float, align 4
  %10 = alloca <4 x float>, align 16
  %11 = alloca float, align 4
  %12 = alloca float*, align 8
  %13 = alloca float*, align 8
  %14 = alloca <4 x float>, align 16
  %15 = alloca <4 x float>, align 16
  %16 = alloca <4 x float>, align 16
  %17 = alloca <4 x float>, align 16
  %18 = alloca <4 x float>, align 16
  %19 = alloca <4 x float>, align 16
  %20 = alloca <4 x float>, align 16
  %21 = alloca <4 x float>, align 16
  %22 = alloca <4 x float>, align 16
  %23 = alloca <4 x float>, align 16
  %24 = alloca <4 x float>, align 16
  %25 = alloca <4 x float>, align 16
  %26 = alloca <4 x float>, align 16
  %27 = alloca <4 x float>, align 16
  %28 = alloca <4 x float>, align 16
  %29 = alloca float*, align 8
  %30 = alloca <4 x float>, align 16
  %31 = alloca <4 x float>, align 16
  %32 = alloca <4 x float>, align 16
  %33 = alloca <4 x float>, align 16
  %34 = alloca <4 x float>, align 16
  %35 = alloca <4 x float>, align 16
  %36 = alloca <4 x float>, align 16
  %37 = alloca <4 x float>, align 16
  %38 = alloca <4 x float>, align 16
  %39 = alloca <4 x float>, align 16
  %40 = alloca <4 x float>, align 16
  %41 = alloca <4 x float>, align 16
  %42 = alloca <4 x float>, align 16
  %43 = alloca float*, align 8
  %44 = alloca <4 x float>, align 16
  %45 = alloca float*, align 8
  %46 = alloca <4 x float>, align 16
  %47 = alloca float, align 4
  %48 = alloca float, align 4
  %49 = alloca float, align 4
  %50 = alloca float, align 4
  %51 = alloca <4 x float>, align 16
  %52 = alloca i32, align 4
  %53 = alloca i32, align 4
  %54 = alloca float*, align 8
  %bbig = alloca float, align 4
  %ebig = alloca float, align 4
  %bres = alloca float, align 4
  %xp = alloca float*, align 8
  %eres = alloca i32, align 4
  %i = alloca i32, align 4
  %ibbig = alloca i32, align 4
  %iebig = alloca i32, align 4
  %align = alloca i32, align 4
  %nsegs = alloca i32, align 4
  %mb = alloca i32, align 4
  %nn = alloca i32, align 4
  %offset4 = alloca <4 x float>, align 16
  %V0 = alloca <4 x float>, align 16
  %V1 = alloca <4 x float>, align 16
  %V2 = alloca <4 x float>, align 16
  %V3 = alloca <4 x float>, align 16
  %V6 = alloca <4 x float>, align 16
  %V7 = alloca <4 x float>, align 16
  %xbig = alloca [8 x float], align 16
  %indx = alloca [8 x float], align 16
  store i32 %n, i32* %53, align 4
  store float* %x, float** %54, align 8
  %55 = load i32, i32* %53, align 4
  %56 = icmp slt i32 %55, 12
  br i1 %56, label %57, label %89

; <label>:57                                      ; preds = %0
  store i32 0, i32* %iebig, align 4
  store float 0.000000e+00, float* %bbig, align 4
  store i32 0, i32* %i, align 4
  br label %58

; <label>:58                                      ; preds = %84, %57
  %59 = load i32, i32* %i, align 4
  %60 = load i32, i32* %53, align 4
  %61 = icmp slt i32 %59, %60
  br i1 %61, label %62, label %87

; <label>:62                                      ; preds = %58
  %63 = load i32, i32* %i, align 4
  %64 = sext i32 %63 to i64
  %65 = load float*, float** %54, align 8
  %66 = getelementptr inbounds float, float* %65, i64 %64
  %67 = load float, float* %66, align 4
  %68 = fpext float %67 to double
  %69 = call double @fabs(double %68) #3
  %70 = load float, float* %bbig, align 4
  %71 = fpext float %70 to double
  %72 = fcmp ogt double %69, %71
  br i1 %72, label %73, label %83

; <label>:73                                      ; preds = %62
  %74 = load i32, i32* %i, align 4
  %75 = sext i32 %74 to i64
  %76 = load float*, float** %54, align 8
  %77 = getelementptr inbounds float, float* %76, i64 %75
  %78 = load float, float* %77, align 4
  %79 = fpext float %78 to double
  %80 = call double @fabs(double %79) #3
  %81 = fptrunc double %80 to float
  store float %81, float* %bbig, align 4
  %82 = load i32, i32* %i, align 4
  store i32 %82, i32* %iebig, align 4
  br label %83

; <label>:83                                      ; preds = %73, %62
  br label %84

; <label>:84                                      ; preds = %83
  %85 = load i32, i32* %i, align 4
  %86 = add nsw i32 %85, 1
  store i32 %86, i32* %i, align 4
  br label %58

; <label>:87                                      ; preds = %58
  %88 = load i32, i32* %iebig, align 4
  store i32 %88, i32* %52
  br label %411

; <label>:89                                      ; preds = %0
  store float 3.000000e+00, float* %47, align 4
  store float 2.000000e+00, float* %48, align 4
  store float 1.000000e+00, float* %49, align 4
  store float 0.000000e+00, float* %50, align 4
  %90 = load float, float* %50, align 4
  %91 = insertelement <4 x float> undef, float %90, i32 0
  %92 = load float, float* %49, align 4
  %93 = insertelement <4 x float> %91, float %92, i32 1
  %94 = load float, float* %48, align 4
  %95 = insertelement <4 x float> %93, float %94, i32 2
  %96 = load float, float* %47, align 4
  %97 = insertelement <4 x float> %95, float %96, i32 3
  store <4 x float> %97, <4 x float>* %51
  %98 = load <4 x float>, <4 x float>* %51
  store <4 x float> %98, <4 x float>* %V7, align 16
  store float 3.000000e+00, float* %1, align 4
  store float 2.000000e+00, float* %2, align 4
  store float 1.000000e+00, float* %3, align 4
  store float 0.000000e+00, float* %4, align 4
  %99 = load float, float* %4, align 4
  %100 = insertelement <4 x float> undef, float %99, i32 0
  %101 = load float, float* %3, align 4
  %102 = insertelement <4 x float> %100, float %101, i32 1
  %103 = load float, float* %2, align 4
  %104 = insertelement <4 x float> %102, float %103, i32 2
  %105 = load float, float* %1, align 4
  %106 = insertelement <4 x float> %104, float %105, i32 3
  store <4 x float> %106, <4 x float>* %5
  %107 = load <4 x float>, <4 x float>* %5
  store <4 x float> %107, <4 x float>* %V2, align 16
  store float -0.000000e+00, float* %8, align 4
  %108 = load float, float* %8, align 4
  store float %108, float* %6, align 4
  %109 = load float, float* %6, align 4
  %110 = insertelement <4 x float> undef, float %109, i32 0
  %111 = load float, float* %6, align 4
  %112 = insertelement <4 x float> %110, float %111, i32 1
  %113 = load float, float* %6, align 4
  %114 = insertelement <4 x float> %112, float %113, i32 2
  %115 = load float, float* %6, align 4
  %116 = insertelement <4 x float> %114, float %115, i32 3
  store <4 x float> %116, <4 x float>* %7
  %117 = load <4 x float>, <4 x float>* %7
  store <4 x float> %117, <4 x float>* %V6, align 16
  store float 4.000000e+00, float* %11, align 4
  %118 = load float, float* %11, align 4
  store float %118, float* %9, align 4
  %119 = load float, float* %9, align 4
  %120 = insertelement <4 x float> undef, float %119, i32 0
  %121 = load float, float* %9, align 4
  %122 = insertelement <4 x float> %120, float %121, i32 1
  %123 = load float, float* %9, align 4
  %124 = insertelement <4 x float> %122, float %123, i32 2
  %125 = load float, float* %9, align 4
  %126 = insertelement <4 x float> %124, float %125, i32 3
  store <4 x float> %126, <4 x float>* %10
  %127 = load <4 x float>, <4 x float>* %10
  store <4 x float> %127, <4 x float>* %offset4, align 16
  %128 = load float*, float** %54, align 8
  %129 = ptrtoint float* %128 to i32
  %130 = lshr i32 %129, 2
  %131 = and i32 %130, 3
  store i32 %131, i32* %align, align 4
  %132 = load i32, i32* %align, align 4
  %133 = icmp eq i32 %132, 1
  br i1 %133, label %134, label %166

; <label>:134                                     ; preds = %89
  %135 = load float*, float** %54, align 8
  %136 = getelementptr inbounds float, float* %135, i64 0
  %137 = load float, float* %136, align 4
  %138 = call float @fabsf(float %137) #3
  store float %138, float* %bbig, align 4
  store i32 0, i32* %ibbig, align 4
  store float 3.000000e+00, float* %bres, align 4
  %139 = load i32, i32* %53, align 4
  %140 = sub nsw i32 %139, 3
  store i32 %140, i32* %nn, align 4
  store i32 1, i32* %i, align 4
  br label %141

; <label>:141                                     ; preds = %162, %134
  %142 = load i32, i32* %i, align 4
  %143 = icmp slt i32 %142, 3
  br i1 %143, label %144, label %165

; <label>:144                                     ; preds = %141
  %145 = load i32, i32* %i, align 4
  %146 = sext i32 %145 to i64
  %147 = load float*, float** %54, align 8
  %148 = getelementptr inbounds float, float* %147, i64 %146
  %149 = load float, float* %148, align 4
  %150 = call float @fabsf(float %149) #3
  %151 = load float, float* %bbig, align 4
  %152 = fcmp ogt float %150, %151
  br i1 %152, label %153, label %161

; <label>:153                                     ; preds = %144
  %154 = load i32, i32* %i, align 4
  %155 = sext i32 %154 to i64
  %156 = load float*, float** %54, align 8
  %157 = getelementptr inbounds float, float* %156, i64 %155
  %158 = load float, float* %157, align 4
  %159 = call float @fabsf(float %158) #3
  store float %159, float* %bbig, align 4
  %160 = load i32, i32* %i, align 4
  store i32 %160, i32* %ibbig, align 4
  br label %161

; <label>:161                                     ; preds = %153, %144
  br label %162

; <label>:162                                     ; preds = %161
  %163 = load i32, i32* %i, align 4
  %164 = add nsw i32 %163, 1
  store i32 %164, i32* %i, align 4
  br label %141

; <label>:165                                     ; preds = %141
  br label %202

; <label>:166                                     ; preds = %89
  %167 = load i32, i32* %align, align 4
  %168 = icmp eq i32 %167, 2
  br i1 %168, label %169, label %188

; <label>:169                                     ; preds = %166
  %170 = load float*, float** %54, align 8
  %171 = getelementptr inbounds float, float* %170, i64 0
  %172 = load float, float* %171, align 4
  %173 = call float @fabsf(float %172) #3
  store float %173, float* %bbig, align 4
  store i32 0, i32* %ibbig, align 4
  store float 2.000000e+00, float* %bres, align 4
  %174 = load i32, i32* %53, align 4
  %175 = sub nsw i32 %174, 2
  store i32 %175, i32* %nn, align 4
  %176 = load float*, float** %54, align 8
  %177 = getelementptr inbounds float, float* %176, i64 1
  %178 = load float, float* %177, align 4
  %179 = call float @fabsf(float %178) #3
  %180 = load float, float* %bbig, align 4
  %181 = fcmp ogt float %179, %180
  br i1 %181, label %182, label %187

; <label>:182                                     ; preds = %169
  %183 = load float*, float** %54, align 8
  %184 = getelementptr inbounds float, float* %183, i64 1
  %185 = load float, float* %184, align 4
  %186 = call float @fabsf(float %185) #3
  store float %186, float* %bbig, align 4
  store i32 1, i32* %ibbig, align 4
  br label %187

; <label>:187                                     ; preds = %182, %169
  br label %201

; <label>:188                                     ; preds = %166
  %189 = load i32, i32* %align, align 4
  %190 = icmp eq i32 %189, 3
  br i1 %190, label %191, label %198

; <label>:191                                     ; preds = %188
  %192 = load float*, float** %54, align 8
  %193 = getelementptr inbounds float, float* %192, i64 0
  %194 = load float, float* %193, align 4
  %195 = call float @fabsf(float %194) #3
  store float %195, float* %bbig, align 4
  store i32 0, i32* %ibbig, align 4
  store float 1.000000e+00, float* %bres, align 4
  %196 = load i32, i32* %53, align 4
  %197 = sub nsw i32 %196, 1
  store i32 %197, i32* %nn, align 4
  br label %200

; <label>:198                                     ; preds = %188
  store float 0.000000e+00, float* %bbig, align 4
  store i32 0, i32* %ibbig, align 4
  %199 = load i32, i32* %53, align 4
  store i32 %199, i32* %nn, align 4
  store float 0.000000e+00, float* %bres, align 4
  br label %200

; <label>:200                                     ; preds = %198, %191
  br label %201

; <label>:201                                     ; preds = %200, %187
  br label %202

; <label>:202                                     ; preds = %201, %165
  %203 = load float*, float** %54, align 8
  %204 = load float, float* %bres, align 4
  %205 = fptosi float %204 to i32
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds float, float* %203, i64 %206
  store float* %207, float** %xp, align 8
  %208 = load i32, i32* %nn, align 4
  %209 = ashr i32 %208, 2
  %210 = sub nsw i32 %209, 2
  store i32 %210, i32* %nsegs, align 4
  %211 = load i32, i32* %nn, align 4
  %212 = load i32, i32* %nsegs, align 4
  %213 = add nsw i32 %212, 2
  %214 = mul nsw i32 4, %213
  %215 = sub nsw i32 %211, %214
  store i32 %215, i32* %eres, align 4
  %216 = load float*, float** %xp, align 8
  store float* %216, float** %12, align 8
  %217 = load float*, float** %12, align 8
  %218 = bitcast float* %217 to <4 x float>*
  %219 = load <4 x float>, <4 x float>* %218, align 16
  store <4 x float> %219, <4 x float>* %V0, align 16
  %220 = load float*, float** %xp, align 8
  %221 = getelementptr inbounds float, float* %220, i64 4
  store float* %221, float** %xp, align 8
  %222 = load float*, float** %xp, align 8
  store float* %222, float** %13, align 8
  %223 = load float*, float** %13, align 8
  %224 = bitcast float* %223 to <4 x float>*
  %225 = load <4 x float>, <4 x float>* %224, align 16
  store <4 x float> %225, <4 x float>* %V1, align 16
  %226 = load float*, float** %xp, align 8
  %227 = getelementptr inbounds float, float* %226, i64 4
  store float* %227, float** %xp, align 8
  %228 = load <4 x float>, <4 x float>* %V6, align 16
  %229 = load <4 x float>, <4 x float>* %V0, align 16
  store <4 x float> %228, <4 x float>* %14, align 16
  store <4 x float> %229, <4 x float>* %15, align 16
  %230 = load <4 x float>, <4 x float>* %14, align 16
  %231 = bitcast <4 x float> %230 to <4 x i32>
  %232 = xor <4 x i32> %231, <i32 -1, i32 -1, i32 -1, i32 -1>
  %233 = load <4 x float>, <4 x float>* %15, align 16
  %234 = bitcast <4 x float> %233 to <4 x i32>
  %235 = and <4 x i32> %232, %234
  %236 = bitcast <4 x i32> %235 to <4 x float>
  store <4 x float> %236, <4 x float>* %V0, align 16
  store i32 0, i32* %i, align 4
  br label %237

; <label>:237                                     ; preds = %292, %202
  %238 = load i32, i32* %i, align 4
  %239 = load i32, i32* %nsegs, align 4
  %240 = icmp slt i32 %238, %239
  br i1 %240, label %241, label %295

; <label>:241                                     ; preds = %237
  %242 = load <4 x float>, <4 x float>* %V6, align 16
  %243 = load <4 x float>, <4 x float>* %V1, align 16
  store <4 x float> %242, <4 x float>* %16, align 16
  store <4 x float> %243, <4 x float>* %17, align 16
  %244 = load <4 x float>, <4 x float>* %16, align 16
  %245 = bitcast <4 x float> %244 to <4 x i32>
  %246 = xor <4 x i32> %245, <i32 -1, i32 -1, i32 -1, i32 -1>
  %247 = load <4 x float>, <4 x float>* %17, align 16
  %248 = bitcast <4 x float> %247 to <4 x i32>
  %249 = and <4 x i32> %246, %248
  %250 = bitcast <4 x i32> %249 to <4 x float>
  store <4 x float> %250, <4 x float>* %V1, align 16
  %251 = load <4 x float>, <4 x float>* %V1, align 16
  %252 = load <4 x float>, <4 x float>* %V0, align 16
  store <4 x float> %251, <4 x float>* %18, align 16
  store <4 x float> %252, <4 x float>* %19, align 16
  %253 = load <4 x float>, <4 x float>* %18, align 16
  %254 = load <4 x float>, <4 x float>* %19, align 16
  %255 = call <4 x float> @llvm.x86.sse.cmp.ps(<4 x float> %253, <4 x float> %254, i8 6) #4
  store <4 x float> %255, <4 x float>* %V3, align 16
  %256 = load <4 x float>, <4 x float>* %V3, align 16
  store <4 x float> %256, <4 x float>* %20, align 16
  %257 = load <4 x float>, <4 x float>* %20, align 16
  %258 = call i32 @llvm.x86.sse.movmsk.ps(<4 x float> %257) #4
  store i32 %258, i32* %mb, align 4
  %259 = load <4 x float>, <4 x float>* %V2, align 16
  %260 = load <4 x float>, <4 x float>* %offset4, align 16
  store <4 x float> %259, <4 x float>* %21, align 16
  store <4 x float> %260, <4 x float>* %22, align 16
  %261 = load <4 x float>, <4 x float>* %21, align 16
  %262 = load <4 x float>, <4 x float>* %22, align 16
  %263 = fadd <4 x float> %261, %262
  store <4 x float> %263, <4 x float>* %V2, align 16
  %264 = load i32, i32* %mb, align 4
  %265 = icmp sgt i32 %264, 0
  br i1 %265, label %266, label %285

; <label>:266                                     ; preds = %241
  %267 = load <4 x float>, <4 x float>* %V0, align 16
  %268 = load <4 x float>, <4 x float>* %V1, align 16
  store <4 x float> %267, <4 x float>* %23, align 16
  store <4 x float> %268, <4 x float>* %24, align 16
  %269 = load <4 x float>, <4 x float>* %23, align 16
  %270 = load <4 x float>, <4 x float>* %24, align 16
  %271 = call <4 x float> @llvm.x86.sse.max.ps(<4 x float> %269, <4 x float> %270) #4
  store <4 x float> %271, <4 x float>* %V0, align 16
  %272 = load <4 x float>, <4 x float>* %V2, align 16
  %273 = load <4 x float>, <4 x float>* %V3, align 16
  store <4 x float> %272, <4 x float>* %25, align 16
  store <4 x float> %273, <4 x float>* %26, align 16
  %274 = load <4 x float>, <4 x float>* %25, align 16
  %275 = bitcast <4 x float> %274 to <4 x i32>
  %276 = load <4 x float>, <4 x float>* %26, align 16
  %277 = bitcast <4 x float> %276 to <4 x i32>
  %278 = and <4 x i32> %275, %277
  %279 = bitcast <4 x i32> %278 to <4 x float>
  store <4 x float> %279, <4 x float>* %V3, align 16
  %280 = load <4 x float>, <4 x float>* %V7, align 16
  %281 = load <4 x float>, <4 x float>* %V3, align 16
  store <4 x float> %280, <4 x float>* %27, align 16
  store <4 x float> %281, <4 x float>* %28, align 16
  %282 = load <4 x float>, <4 x float>* %27, align 16
  %283 = load <4 x float>, <4 x float>* %28, align 16
  %284 = call <4 x float> @llvm.x86.sse.max.ps(<4 x float> %282, <4 x float> %283) #4
  store <4 x float> %284, <4 x float>* %V7, align 16
  br label %285

; <label>:285                                     ; preds = %266, %241
  %286 = load float*, float** %xp, align 8
  store float* %286, float** %29, align 8
  %287 = load float*, float** %29, align 8
  %288 = bitcast float* %287 to <4 x float>*
  %289 = load <4 x float>, <4 x float>* %288, align 16
  store <4 x float> %289, <4 x float>* %V1, align 16
  %290 = load float*, float** %xp, align 8
  %291 = getelementptr inbounds float, float* %290, i64 4
  store float* %291, float** %xp, align 8
  br label %292

; <label>:292                                     ; preds = %285
  %293 = load i32, i32* %i, align 4
  %294 = add nsw i32 %293, 1
  store i32 %294, i32* %i, align 4
  br label %237

; <label>:295                                     ; preds = %237
  %296 = load <4 x float>, <4 x float>* %V6, align 16
  %297 = load <4 x float>, <4 x float>* %V1, align 16
  store <4 x float> %296, <4 x float>* %30, align 16
  store <4 x float> %297, <4 x float>* %31, align 16
  %298 = load <4 x float>, <4 x float>* %30, align 16
  %299 = bitcast <4 x float> %298 to <4 x i32>
  %300 = xor <4 x i32> %299, <i32 -1, i32 -1, i32 -1, i32 -1>
  %301 = load <4 x float>, <4 x float>* %31, align 16
  %302 = bitcast <4 x float> %301 to <4 x i32>
  %303 = and <4 x i32> %300, %302
  %304 = bitcast <4 x i32> %303 to <4 x float>
  store <4 x float> %304, <4 x float>* %V1, align 16
  %305 = load <4 x float>, <4 x float>* %V1, align 16
  %306 = load <4 x float>, <4 x float>* %V0, align 16
  store <4 x float> %305, <4 x float>* %32, align 16
  store <4 x float> %306, <4 x float>* %33, align 16
  %307 = load <4 x float>, <4 x float>* %32, align 16
  %308 = load <4 x float>, <4 x float>* %33, align 16
  %309 = call <4 x float> @llvm.x86.sse.cmp.ps(<4 x float> %307, <4 x float> %308, i8 6) #4
  store <4 x float> %309, <4 x float>* %V3, align 16
  %310 = load <4 x float>, <4 x float>* %V3, align 16
  store <4 x float> %310, <4 x float>* %34, align 16
  %311 = load <4 x float>, <4 x float>* %34, align 16
  %312 = call i32 @llvm.x86.sse.movmsk.ps(<4 x float> %311) #4
  store i32 %312, i32* %mb, align 4
  %313 = load <4 x float>, <4 x float>* %V2, align 16
  %314 = load <4 x float>, <4 x float>* %offset4, align 16
  store <4 x float> %313, <4 x float>* %35, align 16
  store <4 x float> %314, <4 x float>* %36, align 16
  %315 = load <4 x float>, <4 x float>* %35, align 16
  %316 = load <4 x float>, <4 x float>* %36, align 16
  %317 = fadd <4 x float> %315, %316
  store <4 x float> %317, <4 x float>* %V2, align 16
  %318 = load i32, i32* %mb, align 4
  %319 = icmp sgt i32 %318, 0
  br i1 %319, label %320, label %339

; <label>:320                                     ; preds = %295
  %321 = load <4 x float>, <4 x float>* %V0, align 16
  %322 = load <4 x float>, <4 x float>* %V1, align 16
  store <4 x float> %321, <4 x float>* %37, align 16
  store <4 x float> %322, <4 x float>* %38, align 16
  %323 = load <4 x float>, <4 x float>* %37, align 16
  %324 = load <4 x float>, <4 x float>* %38, align 16
  %325 = call <4 x float> @llvm.x86.sse.max.ps(<4 x float> %323, <4 x float> %324) #4
  store <4 x float> %325, <4 x float>* %V0, align 16
  %326 = load <4 x float>, <4 x float>* %V2, align 16
  %327 = load <4 x float>, <4 x float>* %V3, align 16
  store <4 x float> %326, <4 x float>* %39, align 16
  store <4 x float> %327, <4 x float>* %40, align 16
  %328 = load <4 x float>, <4 x float>* %39, align 16
  %329 = bitcast <4 x float> %328 to <4 x i32>
  %330 = load <4 x float>, <4 x float>* %40, align 16
  %331 = bitcast <4 x float> %330 to <4 x i32>
  %332 = and <4 x i32> %329, %331
  %333 = bitcast <4 x i32> %332 to <4 x float>
  store <4 x float> %333, <4 x float>* %V3, align 16
  %334 = load <4 x float>, <4 x float>* %V7, align 16
  %335 = load <4 x float>, <4 x float>* %V3, align 16
  store <4 x float> %334, <4 x float>* %41, align 16
  store <4 x float> %335, <4 x float>* %42, align 16
  %336 = load <4 x float>, <4 x float>* %41, align 16
  %337 = load <4 x float>, <4 x float>* %42, align 16
  %338 = call <4 x float> @llvm.x86.sse.max.ps(<4 x float> %336, <4 x float> %337) #4
  store <4 x float> %338, <4 x float>* %V7, align 16
  br label %339

; <label>:339                                     ; preds = %320, %295
  %340 = getelementptr inbounds [8 x float], [8 x float]* %xbig, i32 0, i32 0
  %341 = load <4 x float>, <4 x float>* %V0, align 16
  store float* %340, float** %43, align 8
  store <4 x float> %341, <4 x float>* %44, align 16
  %342 = load <4 x float>, <4 x float>* %44, align 16
  %343 = load float*, float** %43, align 8
  %344 = bitcast float* %343 to <4 x float>*
  store <4 x float> %342, <4 x float>* %344, align 16
  %345 = getelementptr inbounds [8 x float], [8 x float]* %indx, i32 0, i32 0
  %346 = load <4 x float>, <4 x float>* %V7, align 16
  store float* %345, float** %45, align 8
  store <4 x float> %346, <4 x float>* %46, align 16
  %347 = load <4 x float>, <4 x float>* %46, align 16
  %348 = load float*, float** %45, align 8
  %349 = bitcast float* %348 to <4 x float>*
  store <4 x float> %347, <4 x float>* %349, align 16
  %350 = load i32, i32* %eres, align 4
  %351 = icmp sgt i32 %350, 0
  br i1 %351, label %352, label %378

; <label>:352                                     ; preds = %339
  store i32 0, i32* %i, align 4
  br label %353

; <label>:353                                     ; preds = %374, %352
  %354 = load i32, i32* %i, align 4
  %355 = load i32, i32* %eres, align 4
  %356 = icmp slt i32 %354, %355
  br i1 %356, label %357, label %377

; <label>:357                                     ; preds = %353
  %358 = load float*, float** %xp, align 8
  %359 = getelementptr inbounds float, float* %358, i32 1
  store float* %359, float** %xp, align 8
  %360 = load float, float* %358, align 4
  %361 = call float @fabsf(float %360) #3
  %362 = load i32, i32* %i, align 4
  %363 = add nsw i32 4, %362
  %364 = sext i32 %363 to i64
  %365 = getelementptr inbounds [8 x float], [8 x float]* %xbig, i32 0, i64 %364
  store float %361, float* %365, align 4
  %366 = load i32, i32* %nn, align 4
  %367 = load i32, i32* %i, align 4
  %368 = add nsw i32 %366, %367
  %369 = sitofp i32 %368 to float
  %370 = load i32, i32* %i, align 4
  %371 = add nsw i32 4, %370
  %372 = sext i32 %371 to i64
  %373 = getelementptr inbounds [8 x float], [8 x float]* %indx, i32 0, i64 %372
  store float %369, float* %373, align 4
  br label %374

; <label>:374                                     ; preds = %357
  %375 = load i32, i32* %i, align 4
  %376 = add nsw i32 %375, 1
  store i32 %376, i32* %i, align 4
  br label %353

; <label>:377                                     ; preds = %353
  br label %378

; <label>:378                                     ; preds = %377, %339
  %379 = load float, float* %bbig, align 4
  store float %379, float* %ebig, align 4
  %380 = load i32, i32* %ibbig, align 4
  store i32 %380, i32* %iebig, align 4
  store i32 0, i32* %i, align 4
  br label %381

; <label>:381                                     ; preds = %406, %378
  %382 = load i32, i32* %i, align 4
  %383 = load i32, i32* %eres, align 4
  %384 = add nsw i32 4, %383
  %385 = icmp slt i32 %382, %384
  br i1 %385, label %386, label %409

; <label>:386                                     ; preds = %381
  %387 = load i32, i32* %i, align 4
  %388 = sext i32 %387 to i64
  %389 = getelementptr inbounds [8 x float], [8 x float]* %xbig, i32 0, i64 %388
  %390 = load float, float* %389, align 4
  %391 = load float, float* %ebig, align 4
  %392 = fcmp ogt float %390, %391
  br i1 %392, label %393, label %405

; <label>:393                                     ; preds = %386
  %394 = load i32, i32* %i, align 4
  %395 = sext i32 %394 to i64
  %396 = getelementptr inbounds [8 x float], [8 x float]* %xbig, i32 0, i64 %395
  %397 = load float, float* %396, align 4
  store float %397, float* %ebig, align 4
  %398 = load i32, i32* %i, align 4
  %399 = sext i32 %398 to i64
  %400 = getelementptr inbounds [8 x float], [8 x float]* %indx, i32 0, i64 %399
  %401 = load float, float* %400, align 4
  %402 = load float, float* %bres, align 4
  %403 = fadd float %401, %402
  %404 = fptosi float %403 to i32
  store i32 %404, i32* %iebig, align 4
  br label %405

; <label>:405                                     ; preds = %393, %386
  br label %406

; <label>:406                                     ; preds = %405
  %407 = load i32, i32* %i, align 4
  %408 = add nsw i32 %407, 1
  store i32 %408, i32* %i, align 4
  br label %381

; <label>:409                                     ; preds = %381
  %410 = load i32, i32* %iebig, align 4
  store i32 %410, i32* %52
  br label %411

; <label>:411                                     ; preds = %409, %87
  %412 = load i32, i32* %52
  ret i32 %412
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind readnone
declare double @fabs(double) #2

; Function Attrs: nounwind readnone
declare float @fabsf(float) #2

; Function Attrs: nounwind readnone
declare <4 x float> @llvm.x86.sse.cmp.ps(<4 x float>, <4 x float>, i8) #3

; Function Attrs: nounwind readnone
declare i32 @llvm.x86.sse.movmsk.ps(<4 x float>) #3

; Function Attrs: nounwind readnone
declare <4 x float> @llvm.x86.sse.max.ps(<4 x float>, <4 x float>) #3

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
