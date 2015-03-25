; ModuleID = './pr36343.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define void @bar(i32** %p) #0 {
  %1 = alloca i32**, align 8
  %q = alloca float*, align 8
  store i32** %p, i32*** %1, align 8
  %2 = load i32*** %1, align 8
  %3 = bitcast i32** %2 to float*
  store float* %3, float** %q, align 8
  %4 = load float** %q, align 8
  store float 0.000000e+00, float* %4, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define float @foo(i32 %b) #0 {
  %1 = alloca float, align 4
  %2 = alloca i32, align 4
  %i = alloca i32*, align 8
  %f = alloca float, align 4
  %p = alloca i32**, align 8
  store i32 %b, i32* %2, align 4
  store i32* null, i32** %i, align 8
  store float 1.000000e+00, float* %f, align 4
  %3 = load i32* %2, align 4
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  store i32** %i, i32*** %p, align 8
  br label %8

; <label>:6                                       ; preds = %0
  %7 = bitcast float* %f to i32**
  store i32** %7, i32*** %p, align 8
  br label %8

; <label>:8                                       ; preds = %6, %5
  %9 = load i32*** %p, align 8
  call void @bar(i32** %9)
  %10 = load i32* %2, align 4
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %17

; <label>:12                                      ; preds = %8
  %13 = load i32*** %p, align 8
  %14 = load i32** %13, align 8
  %15 = load i32* %14, align 4
  %16 = sitofp i32 %15 to float
  store float %16, float* %1
  br label %19

; <label>:17                                      ; preds = %8
  %18 = load float* %f, align 4
  store float %18, float* %1
  br label %19

; <label>:19                                      ; preds = %17, %12
  %20 = load float* %1
  ret float %20
}

; Function Attrs: nounwind uwtable
define i32 @main() #1 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call float @foo(i32 0)
  %3 = fpext float %2 to double
  %4 = fcmp une double %3, 0.000000e+00
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:6                                       ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

attributes #0 = { noinline nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
