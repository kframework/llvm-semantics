; ModuleID = './pr28982a.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@incs = common global [20 x i32] zeroinitializer, align 16
@ptrs = common global [20 x float*] zeroinitializer, align 16
@results = common global [20 x float] zeroinitializer, align 16
@input = common global [80 x float] zeroinitializer, align 16

; Function Attrs: noinline nounwind uwtable
define void @foo(i32 %n) #0 {
  %1 = alloca i32, align 4
  %inc0 = alloca i32, align 4
  %inc1 = alloca i32, align 4
  %inc2 = alloca i32, align 4
  %inc3 = alloca i32, align 4
  %inc4 = alloca i32, align 4
  %inc5 = alloca i32, align 4
  %inc6 = alloca i32, align 4
  %inc7 = alloca i32, align 4
  %inc8 = alloca i32, align 4
  %inc9 = alloca i32, align 4
  %inc10 = alloca i32, align 4
  %inc11 = alloca i32, align 4
  %inc12 = alloca i32, align 4
  %inc13 = alloca i32, align 4
  %inc14 = alloca i32, align 4
  %inc15 = alloca i32, align 4
  %inc16 = alloca i32, align 4
  %inc17 = alloca i32, align 4
  %inc18 = alloca i32, align 4
  %inc19 = alloca i32, align 4
  %ptr0 = alloca float*, align 8
  %result0 = alloca float, align 4
  %ptr1 = alloca float*, align 8
  %result1 = alloca float, align 4
  %ptr2 = alloca float*, align 8
  %result2 = alloca float, align 4
  %ptr3 = alloca float*, align 8
  %result3 = alloca float, align 4
  %ptr4 = alloca float*, align 8
  %result4 = alloca float, align 4
  %ptr5 = alloca float*, align 8
  %result5 = alloca float, align 4
  %ptr6 = alloca float*, align 8
  %result6 = alloca float, align 4
  %ptr7 = alloca float*, align 8
  %result7 = alloca float, align 4
  %ptr8 = alloca float*, align 8
  %result8 = alloca float, align 4
  %ptr9 = alloca float*, align 8
  %result9 = alloca float, align 4
  %ptr10 = alloca float*, align 8
  %result10 = alloca float, align 4
  %ptr11 = alloca float*, align 8
  %result11 = alloca float, align 4
  %ptr12 = alloca float*, align 8
  %result12 = alloca float, align 4
  %ptr13 = alloca float*, align 8
  %result13 = alloca float, align 4
  %ptr14 = alloca float*, align 8
  %result14 = alloca float, align 4
  %ptr15 = alloca float*, align 8
  %result15 = alloca float, align 4
  %ptr16 = alloca float*, align 8
  %result16 = alloca float, align 4
  %ptr17 = alloca float*, align 8
  %result17 = alloca float, align 4
  %ptr18 = alloca float*, align 8
  %result18 = alloca float, align 4
  %ptr19 = alloca float*, align 8
  %result19 = alloca float, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds ([20 x i32], [20 x i32]* @incs, i32 0, i64 0), align 4
  store i32 %2, i32* %inc0, align 4
  %3 = load i32, i32* getelementptr inbounds ([20 x i32], [20 x i32]* @incs, i32 0, i64 1), align 4
  store i32 %3, i32* %inc1, align 4
  %4 = load i32, i32* getelementptr inbounds ([20 x i32], [20 x i32]* @incs, i32 0, i64 2), align 4
  store i32 %4, i32* %inc2, align 4
  %5 = load i32, i32* getelementptr inbounds ([20 x i32], [20 x i32]* @incs, i32 0, i64 3), align 4
  store i32 %5, i32* %inc3, align 4
  %6 = load i32, i32* getelementptr inbounds ([20 x i32], [20 x i32]* @incs, i32 0, i64 4), align 4
  store i32 %6, i32* %inc4, align 4
  %7 = load i32, i32* getelementptr inbounds ([20 x i32], [20 x i32]* @incs, i32 0, i64 5), align 4
  store i32 %7, i32* %inc5, align 4
  %8 = load i32, i32* getelementptr inbounds ([20 x i32], [20 x i32]* @incs, i32 0, i64 6), align 4
  store i32 %8, i32* %inc6, align 4
  %9 = load i32, i32* getelementptr inbounds ([20 x i32], [20 x i32]* @incs, i32 0, i64 7), align 4
  store i32 %9, i32* %inc7, align 4
  %10 = load i32, i32* getelementptr inbounds ([20 x i32], [20 x i32]* @incs, i32 0, i64 8), align 4
  store i32 %10, i32* %inc8, align 4
  %11 = load i32, i32* getelementptr inbounds ([20 x i32], [20 x i32]* @incs, i32 0, i64 9), align 4
  store i32 %11, i32* %inc9, align 4
  %12 = load i32, i32* getelementptr inbounds ([20 x i32], [20 x i32]* @incs, i32 0, i64 10), align 4
  store i32 %12, i32* %inc10, align 4
  %13 = load i32, i32* getelementptr inbounds ([20 x i32], [20 x i32]* @incs, i32 0, i64 11), align 4
  store i32 %13, i32* %inc11, align 4
  %14 = load i32, i32* getelementptr inbounds ([20 x i32], [20 x i32]* @incs, i32 0, i64 12), align 4
  store i32 %14, i32* %inc12, align 4
  %15 = load i32, i32* getelementptr inbounds ([20 x i32], [20 x i32]* @incs, i32 0, i64 13), align 4
  store i32 %15, i32* %inc13, align 4
  %16 = load i32, i32* getelementptr inbounds ([20 x i32], [20 x i32]* @incs, i32 0, i64 14), align 4
  store i32 %16, i32* %inc14, align 4
  %17 = load i32, i32* getelementptr inbounds ([20 x i32], [20 x i32]* @incs, i32 0, i64 15), align 4
  store i32 %17, i32* %inc15, align 4
  %18 = load i32, i32* getelementptr inbounds ([20 x i32], [20 x i32]* @incs, i32 0, i64 16), align 4
  store i32 %18, i32* %inc16, align 4
  %19 = load i32, i32* getelementptr inbounds ([20 x i32], [20 x i32]* @incs, i32 0, i64 17), align 4
  store i32 %19, i32* %inc17, align 4
  %20 = load i32, i32* getelementptr inbounds ([20 x i32], [20 x i32]* @incs, i32 0, i64 18), align 4
  store i32 %20, i32* %inc18, align 4
  %21 = load i32, i32* getelementptr inbounds ([20 x i32], [20 x i32]* @incs, i32 0, i64 19), align 4
  store i32 %21, i32* %inc19, align 4
  %22 = load float*, float** getelementptr inbounds ([20 x float*], [20 x float*]* @ptrs, i32 0, i64 0), align 8
  store float* %22, float** %ptr0, align 8
  store float 0.000000e+00, float* %result0, align 4
  %23 = load float*, float** getelementptr inbounds ([20 x float*], [20 x float*]* @ptrs, i32 0, i64 1), align 8
  store float* %23, float** %ptr1, align 8
  store float 0.000000e+00, float* %result1, align 4
  %24 = load float*, float** getelementptr inbounds ([20 x float*], [20 x float*]* @ptrs, i32 0, i64 2), align 8
  store float* %24, float** %ptr2, align 8
  store float 0.000000e+00, float* %result2, align 4
  %25 = load float*, float** getelementptr inbounds ([20 x float*], [20 x float*]* @ptrs, i32 0, i64 3), align 8
  store float* %25, float** %ptr3, align 8
  store float 0.000000e+00, float* %result3, align 4
  %26 = load float*, float** getelementptr inbounds ([20 x float*], [20 x float*]* @ptrs, i32 0, i64 4), align 8
  store float* %26, float** %ptr4, align 8
  store float 0.000000e+00, float* %result4, align 4
  %27 = load float*, float** getelementptr inbounds ([20 x float*], [20 x float*]* @ptrs, i32 0, i64 5), align 8
  store float* %27, float** %ptr5, align 8
  store float 0.000000e+00, float* %result5, align 4
  %28 = load float*, float** getelementptr inbounds ([20 x float*], [20 x float*]* @ptrs, i32 0, i64 6), align 8
  store float* %28, float** %ptr6, align 8
  store float 0.000000e+00, float* %result6, align 4
  %29 = load float*, float** getelementptr inbounds ([20 x float*], [20 x float*]* @ptrs, i32 0, i64 7), align 8
  store float* %29, float** %ptr7, align 8
  store float 0.000000e+00, float* %result7, align 4
  %30 = load float*, float** getelementptr inbounds ([20 x float*], [20 x float*]* @ptrs, i32 0, i64 8), align 8
  store float* %30, float** %ptr8, align 8
  store float 0.000000e+00, float* %result8, align 4
  %31 = load float*, float** getelementptr inbounds ([20 x float*], [20 x float*]* @ptrs, i32 0, i64 9), align 8
  store float* %31, float** %ptr9, align 8
  store float 0.000000e+00, float* %result9, align 4
  %32 = load float*, float** getelementptr inbounds ([20 x float*], [20 x float*]* @ptrs, i32 0, i64 10), align 8
  store float* %32, float** %ptr10, align 8
  store float 0.000000e+00, float* %result10, align 4
  %33 = load float*, float** getelementptr inbounds ([20 x float*], [20 x float*]* @ptrs, i32 0, i64 11), align 8
  store float* %33, float** %ptr11, align 8
  store float 0.000000e+00, float* %result11, align 4
  %34 = load float*, float** getelementptr inbounds ([20 x float*], [20 x float*]* @ptrs, i32 0, i64 12), align 8
  store float* %34, float** %ptr12, align 8
  store float 0.000000e+00, float* %result12, align 4
  %35 = load float*, float** getelementptr inbounds ([20 x float*], [20 x float*]* @ptrs, i32 0, i64 13), align 8
  store float* %35, float** %ptr13, align 8
  store float 0.000000e+00, float* %result13, align 4
  %36 = load float*, float** getelementptr inbounds ([20 x float*], [20 x float*]* @ptrs, i32 0, i64 14), align 8
  store float* %36, float** %ptr14, align 8
  store float 0.000000e+00, float* %result14, align 4
  %37 = load float*, float** getelementptr inbounds ([20 x float*], [20 x float*]* @ptrs, i32 0, i64 15), align 8
  store float* %37, float** %ptr15, align 8
  store float 0.000000e+00, float* %result15, align 4
  %38 = load float*, float** getelementptr inbounds ([20 x float*], [20 x float*]* @ptrs, i32 0, i64 16), align 8
  store float* %38, float** %ptr16, align 8
  store float 0.000000e+00, float* %result16, align 4
  %39 = load float*, float** getelementptr inbounds ([20 x float*], [20 x float*]* @ptrs, i32 0, i64 17), align 8
  store float* %39, float** %ptr17, align 8
  store float 0.000000e+00, float* %result17, align 4
  %40 = load float*, float** getelementptr inbounds ([20 x float*], [20 x float*]* @ptrs, i32 0, i64 18), align 8
  store float* %40, float** %ptr18, align 8
  store float 0.000000e+00, float* %result18, align 4
  %41 = load float*, float** getelementptr inbounds ([20 x float*], [20 x float*]* @ptrs, i32 0, i64 19), align 8
  store float* %41, float** %ptr19, align 8
  store float 0.000000e+00, float* %result19, align 4
  br label %42

; <label>:42                                      ; preds = %46, %0
  %43 = load i32, i32* %1, align 4
  %44 = add nsw i32 %43, -1
  store i32 %44, i32* %1, align 4
  %45 = icmp ne i32 %43, 0
  br i1 %45, label %46, label %207

; <label>:46                                      ; preds = %42
  %47 = load float*, float** %ptr0, align 8
  %48 = load float, float* %47, align 4
  %49 = load float, float* %result0, align 4
  %50 = fadd float %49, %48
  store float %50, float* %result0, align 4
  %51 = load i32, i32* %inc0, align 4
  %52 = load float*, float** %ptr0, align 8
  %53 = sext i32 %51 to i64
  %54 = getelementptr inbounds float, float* %52, i64 %53
  store float* %54, float** %ptr0, align 8
  %55 = load float*, float** %ptr1, align 8
  %56 = load float, float* %55, align 4
  %57 = load float, float* %result1, align 4
  %58 = fadd float %57, %56
  store float %58, float* %result1, align 4
  %59 = load i32, i32* %inc1, align 4
  %60 = load float*, float** %ptr1, align 8
  %61 = sext i32 %59 to i64
  %62 = getelementptr inbounds float, float* %60, i64 %61
  store float* %62, float** %ptr1, align 8
  %63 = load float*, float** %ptr2, align 8
  %64 = load float, float* %63, align 4
  %65 = load float, float* %result2, align 4
  %66 = fadd float %65, %64
  store float %66, float* %result2, align 4
  %67 = load i32, i32* %inc2, align 4
  %68 = load float*, float** %ptr2, align 8
  %69 = sext i32 %67 to i64
  %70 = getelementptr inbounds float, float* %68, i64 %69
  store float* %70, float** %ptr2, align 8
  %71 = load float*, float** %ptr3, align 8
  %72 = load float, float* %71, align 4
  %73 = load float, float* %result3, align 4
  %74 = fadd float %73, %72
  store float %74, float* %result3, align 4
  %75 = load i32, i32* %inc3, align 4
  %76 = load float*, float** %ptr3, align 8
  %77 = sext i32 %75 to i64
  %78 = getelementptr inbounds float, float* %76, i64 %77
  store float* %78, float** %ptr3, align 8
  %79 = load float*, float** %ptr4, align 8
  %80 = load float, float* %79, align 4
  %81 = load float, float* %result4, align 4
  %82 = fadd float %81, %80
  store float %82, float* %result4, align 4
  %83 = load i32, i32* %inc4, align 4
  %84 = load float*, float** %ptr4, align 8
  %85 = sext i32 %83 to i64
  %86 = getelementptr inbounds float, float* %84, i64 %85
  store float* %86, float** %ptr4, align 8
  %87 = load float*, float** %ptr5, align 8
  %88 = load float, float* %87, align 4
  %89 = load float, float* %result5, align 4
  %90 = fadd float %89, %88
  store float %90, float* %result5, align 4
  %91 = load i32, i32* %inc5, align 4
  %92 = load float*, float** %ptr5, align 8
  %93 = sext i32 %91 to i64
  %94 = getelementptr inbounds float, float* %92, i64 %93
  store float* %94, float** %ptr5, align 8
  %95 = load float*, float** %ptr6, align 8
  %96 = load float, float* %95, align 4
  %97 = load float, float* %result6, align 4
  %98 = fadd float %97, %96
  store float %98, float* %result6, align 4
  %99 = load i32, i32* %inc6, align 4
  %100 = load float*, float** %ptr6, align 8
  %101 = sext i32 %99 to i64
  %102 = getelementptr inbounds float, float* %100, i64 %101
  store float* %102, float** %ptr6, align 8
  %103 = load float*, float** %ptr7, align 8
  %104 = load float, float* %103, align 4
  %105 = load float, float* %result7, align 4
  %106 = fadd float %105, %104
  store float %106, float* %result7, align 4
  %107 = load i32, i32* %inc7, align 4
  %108 = load float*, float** %ptr7, align 8
  %109 = sext i32 %107 to i64
  %110 = getelementptr inbounds float, float* %108, i64 %109
  store float* %110, float** %ptr7, align 8
  %111 = load float*, float** %ptr8, align 8
  %112 = load float, float* %111, align 4
  %113 = load float, float* %result8, align 4
  %114 = fadd float %113, %112
  store float %114, float* %result8, align 4
  %115 = load i32, i32* %inc8, align 4
  %116 = load float*, float** %ptr8, align 8
  %117 = sext i32 %115 to i64
  %118 = getelementptr inbounds float, float* %116, i64 %117
  store float* %118, float** %ptr8, align 8
  %119 = load float*, float** %ptr9, align 8
  %120 = load float, float* %119, align 4
  %121 = load float, float* %result9, align 4
  %122 = fadd float %121, %120
  store float %122, float* %result9, align 4
  %123 = load i32, i32* %inc9, align 4
  %124 = load float*, float** %ptr9, align 8
  %125 = sext i32 %123 to i64
  %126 = getelementptr inbounds float, float* %124, i64 %125
  store float* %126, float** %ptr9, align 8
  %127 = load float*, float** %ptr10, align 8
  %128 = load float, float* %127, align 4
  %129 = load float, float* %result10, align 4
  %130 = fadd float %129, %128
  store float %130, float* %result10, align 4
  %131 = load i32, i32* %inc10, align 4
  %132 = load float*, float** %ptr10, align 8
  %133 = sext i32 %131 to i64
  %134 = getelementptr inbounds float, float* %132, i64 %133
  store float* %134, float** %ptr10, align 8
  %135 = load float*, float** %ptr11, align 8
  %136 = load float, float* %135, align 4
  %137 = load float, float* %result11, align 4
  %138 = fadd float %137, %136
  store float %138, float* %result11, align 4
  %139 = load i32, i32* %inc11, align 4
  %140 = load float*, float** %ptr11, align 8
  %141 = sext i32 %139 to i64
  %142 = getelementptr inbounds float, float* %140, i64 %141
  store float* %142, float** %ptr11, align 8
  %143 = load float*, float** %ptr12, align 8
  %144 = load float, float* %143, align 4
  %145 = load float, float* %result12, align 4
  %146 = fadd float %145, %144
  store float %146, float* %result12, align 4
  %147 = load i32, i32* %inc12, align 4
  %148 = load float*, float** %ptr12, align 8
  %149 = sext i32 %147 to i64
  %150 = getelementptr inbounds float, float* %148, i64 %149
  store float* %150, float** %ptr12, align 8
  %151 = load float*, float** %ptr13, align 8
  %152 = load float, float* %151, align 4
  %153 = load float, float* %result13, align 4
  %154 = fadd float %153, %152
  store float %154, float* %result13, align 4
  %155 = load i32, i32* %inc13, align 4
  %156 = load float*, float** %ptr13, align 8
  %157 = sext i32 %155 to i64
  %158 = getelementptr inbounds float, float* %156, i64 %157
  store float* %158, float** %ptr13, align 8
  %159 = load float*, float** %ptr14, align 8
  %160 = load float, float* %159, align 4
  %161 = load float, float* %result14, align 4
  %162 = fadd float %161, %160
  store float %162, float* %result14, align 4
  %163 = load i32, i32* %inc14, align 4
  %164 = load float*, float** %ptr14, align 8
  %165 = sext i32 %163 to i64
  %166 = getelementptr inbounds float, float* %164, i64 %165
  store float* %166, float** %ptr14, align 8
  %167 = load float*, float** %ptr15, align 8
  %168 = load float, float* %167, align 4
  %169 = load float, float* %result15, align 4
  %170 = fadd float %169, %168
  store float %170, float* %result15, align 4
  %171 = load i32, i32* %inc15, align 4
  %172 = load float*, float** %ptr15, align 8
  %173 = sext i32 %171 to i64
  %174 = getelementptr inbounds float, float* %172, i64 %173
  store float* %174, float** %ptr15, align 8
  %175 = load float*, float** %ptr16, align 8
  %176 = load float, float* %175, align 4
  %177 = load float, float* %result16, align 4
  %178 = fadd float %177, %176
  store float %178, float* %result16, align 4
  %179 = load i32, i32* %inc16, align 4
  %180 = load float*, float** %ptr16, align 8
  %181 = sext i32 %179 to i64
  %182 = getelementptr inbounds float, float* %180, i64 %181
  store float* %182, float** %ptr16, align 8
  %183 = load float*, float** %ptr17, align 8
  %184 = load float, float* %183, align 4
  %185 = load float, float* %result17, align 4
  %186 = fadd float %185, %184
  store float %186, float* %result17, align 4
  %187 = load i32, i32* %inc17, align 4
  %188 = load float*, float** %ptr17, align 8
  %189 = sext i32 %187 to i64
  %190 = getelementptr inbounds float, float* %188, i64 %189
  store float* %190, float** %ptr17, align 8
  %191 = load float*, float** %ptr18, align 8
  %192 = load float, float* %191, align 4
  %193 = load float, float* %result18, align 4
  %194 = fadd float %193, %192
  store float %194, float* %result18, align 4
  %195 = load i32, i32* %inc18, align 4
  %196 = load float*, float** %ptr18, align 8
  %197 = sext i32 %195 to i64
  %198 = getelementptr inbounds float, float* %196, i64 %197
  store float* %198, float** %ptr18, align 8
  %199 = load float*, float** %ptr19, align 8
  %200 = load float, float* %199, align 4
  %201 = load float, float* %result19, align 4
  %202 = fadd float %201, %200
  store float %202, float* %result19, align 4
  %203 = load i32, i32* %inc19, align 4
  %204 = load float*, float** %ptr19, align 8
  %205 = sext i32 %203 to i64
  %206 = getelementptr inbounds float, float* %204, i64 %205
  store float* %206, float** %ptr19, align 8
  br label %42

; <label>:207                                     ; preds = %42
  %208 = load float, float* %result0, align 4
  store float %208, float* getelementptr inbounds ([20 x float], [20 x float]* @results, i32 0, i64 0), align 4
  %209 = load float, float* %result1, align 4
  store float %209, float* getelementptr inbounds ([20 x float], [20 x float]* @results, i32 0, i64 1), align 4
  %210 = load float, float* %result2, align 4
  store float %210, float* getelementptr inbounds ([20 x float], [20 x float]* @results, i32 0, i64 2), align 4
  %211 = load float, float* %result3, align 4
  store float %211, float* getelementptr inbounds ([20 x float], [20 x float]* @results, i32 0, i64 3), align 4
  %212 = load float, float* %result4, align 4
  store float %212, float* getelementptr inbounds ([20 x float], [20 x float]* @results, i32 0, i64 4), align 4
  %213 = load float, float* %result5, align 4
  store float %213, float* getelementptr inbounds ([20 x float], [20 x float]* @results, i32 0, i64 5), align 4
  %214 = load float, float* %result6, align 4
  store float %214, float* getelementptr inbounds ([20 x float], [20 x float]* @results, i32 0, i64 6), align 4
  %215 = load float, float* %result7, align 4
  store float %215, float* getelementptr inbounds ([20 x float], [20 x float]* @results, i32 0, i64 7), align 4
  %216 = load float, float* %result8, align 4
  store float %216, float* getelementptr inbounds ([20 x float], [20 x float]* @results, i32 0, i64 8), align 4
  %217 = load float, float* %result9, align 4
  store float %217, float* getelementptr inbounds ([20 x float], [20 x float]* @results, i32 0, i64 9), align 4
  %218 = load float, float* %result10, align 4
  store float %218, float* getelementptr inbounds ([20 x float], [20 x float]* @results, i32 0, i64 10), align 4
  %219 = load float, float* %result11, align 4
  store float %219, float* getelementptr inbounds ([20 x float], [20 x float]* @results, i32 0, i64 11), align 4
  %220 = load float, float* %result12, align 4
  store float %220, float* getelementptr inbounds ([20 x float], [20 x float]* @results, i32 0, i64 12), align 4
  %221 = load float, float* %result13, align 4
  store float %221, float* getelementptr inbounds ([20 x float], [20 x float]* @results, i32 0, i64 13), align 4
  %222 = load float, float* %result14, align 4
  store float %222, float* getelementptr inbounds ([20 x float], [20 x float]* @results, i32 0, i64 14), align 4
  %223 = load float, float* %result15, align 4
  store float %223, float* getelementptr inbounds ([20 x float], [20 x float]* @results, i32 0, i64 15), align 4
  %224 = load float, float* %result16, align 4
  store float %224, float* getelementptr inbounds ([20 x float], [20 x float]* @results, i32 0, i64 16), align 4
  %225 = load float, float* %result17, align 4
  store float %225, float* getelementptr inbounds ([20 x float], [20 x float]* @results, i32 0, i64 17), align 4
  %226 = load float, float* %result18, align 4
  store float %226, float* getelementptr inbounds ([20 x float], [20 x float]* @results, i32 0, i64 18), align 4
  %227 = load float, float* %result19, align 4
  store float %227, float* getelementptr inbounds ([20 x float], [20 x float]* @results, i32 0, i64 19), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #1 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %16, %0
  %3 = load i32, i32* %i, align 4
  %4 = icmp slt i32 %3, 20
  br i1 %4, label %5, label %19

; <label>:5                                       ; preds = %2
  %6 = load i32, i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds float, float* getelementptr inbounds ([80 x float], [80 x float]* @input, i32 0, i32 0), i64 %7
  %9 = load i32, i32* %i, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [20 x float*], [20 x float*]* @ptrs, i32 0, i64 %10
  store float* %8, float** %11, align 8
  %12 = load i32, i32* %i, align 4
  %13 = load i32, i32* %i, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [20 x i32], [20 x i32]* @incs, i32 0, i64 %14
  store i32 %12, i32* %15, align 4
  br label %16

; <label>:16                                      ; preds = %5
  %17 = load i32, i32* %i, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, i32* %i, align 4
  br label %2

; <label>:19                                      ; preds = %2
  store i32 0, i32* %i, align 4
  br label %20

; <label>:20                                      ; preds = %29, %19
  %21 = load i32, i32* %i, align 4
  %22 = icmp slt i32 %21, 80
  br i1 %22, label %23, label %32

; <label>:23                                      ; preds = %20
  %24 = load i32, i32* %i, align 4
  %25 = sitofp i32 %24 to float
  %26 = load i32, i32* %i, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [80 x float], [80 x float]* @input, i32 0, i64 %27
  store float %25, float* %28, align 4
  br label %29

; <label>:29                                      ; preds = %23
  %30 = load i32, i32* %i, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, i32* %i, align 4
  br label %20

; <label>:32                                      ; preds = %20
  call void @foo(i32 4)
  store i32 0, i32* %i, align 4
  br label %33

; <label>:33                                      ; preds = %49, %32
  %34 = load i32, i32* %i, align 4
  %35 = icmp slt i32 %34, 20
  br i1 %35, label %36, label %52

; <label>:36                                      ; preds = %33
  %37 = load i32, i32* %i, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [20 x float], [20 x float]* @results, i32 0, i64 %38
  %40 = load float, float* %39, align 4
  %41 = load i32, i32* %i, align 4
  %42 = mul nsw i32 %41, 4
  %43 = mul nsw i32 %42, 5
  %44 = sdiv i32 %43, 2
  %45 = sitofp i32 %44 to float
  %46 = fcmp une float %40, %45
  br i1 %46, label %47, label %48

; <label>:47                                      ; preds = %36
  store i32 1, i32* %1
  br label %53

; <label>:48                                      ; preds = %36
  br label %49

; <label>:49                                      ; preds = %48
  %50 = load i32, i32* %i, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, i32* %i, align 4
  br label %33

; <label>:52                                      ; preds = %33
  store i32 0, i32* %1
  br label %53

; <label>:53                                      ; preds = %52, %47
  %54 = load i32, i32* %1
  ret i32 %54
}

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
