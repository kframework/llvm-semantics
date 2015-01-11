; ModuleID = './complex-3.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.complex = type { float, float }

; Function Attrs: nounwind uwtable
define <2 x float> @f(float %a, float %b) #0 {
  %1 = alloca %struct.complex, align 4
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %c = alloca %struct.complex, align 4
  store float %a, float* %2, align 4
  store float %b, float* %3, align 4
  %4 = load float* %2, align 4
  %5 = getelementptr inbounds %struct.complex* %c, i32 0, i32 0
  store float %4, float* %5, align 4
  %6 = load float* %3, align 4
  %7 = getelementptr inbounds %struct.complex* %c, i32 0, i32 1
  store float %6, float* %7, align 4
  %8 = bitcast %struct.complex* %1 to i8*
  %9 = bitcast %struct.complex* %c to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %9, i64 8, i32 4, i1 false)
  %10 = bitcast %struct.complex* %1 to <2 x float>*
  %11 = load <2 x float>* %10, align 1
  ret <2 x float> %11
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %z = alloca %struct.complex, align 4
  store i32 0, i32* %1
  %2 = call <2 x float> @f(float 1.000000e+00, float 0.000000e+00)
  %3 = bitcast %struct.complex* %z to <2 x float>*
  store <2 x float> %2, <2 x float>* %3, align 1
  %4 = getelementptr inbounds %struct.complex* %z, i32 0, i32 0
  %5 = load float* %4, align 4
  %6 = fpext float %5 to double
  %7 = fcmp une double %6, 1.000000e+00
  br i1 %7, label %13, label %8

; <label>:8                                       ; preds = %0
  %9 = getelementptr inbounds %struct.complex* %z, i32 0, i32 1
  %10 = load float* %9, align 4
  %11 = fpext float %10 to double
  %12 = fcmp une double %11, 0.000000e+00
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %8, %0
  call void @abort() #3
  unreachable

; <label>:14                                      ; preds = %8
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %16 = load i32* %1
  ret i32 %16
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
