; ModuleID = './pr15262-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.A = type { i32, i32 }
%struct.B = type { i32*, float }

@X = common global float 0.000000e+00, align 4

; Function Attrs: nounwind uwtable
define i32 @foo(i32* %b.coerce0, float %b.coerce1, %struct.A* %q, float* %h) #0 {
  %b = alloca %struct.B, align 8
  %1 = alloca %struct.A*, align 8
  %2 = alloca float*, align 8
  %3 = bitcast %struct.B* %b to { i32*, float }*
  %4 = getelementptr { i32*, float }* %3, i32 0, i32 0
  store i32* %b.coerce0, i32** %4
  %5 = getelementptr { i32*, float }* %3, i32 0, i32 1
  store float %b.coerce1, float* %5
  store %struct.A* %q, %struct.A** %1, align 8
  store float* %h, float** %2, align 8
  %6 = load float** %2, align 8
  %7 = load float* %6, align 4
  %8 = load float* @X, align 4
  %9 = fadd float %8, %7
  store float %9, float* @X, align 4
  %10 = getelementptr inbounds %struct.B* %b, i32 0, i32 0
  %11 = load i32** %10, align 8
  store i32 3, i32* %11, align 4
  %12 = load %struct.A** %1, align 8
  %13 = getelementptr inbounds %struct.A* %12, i32 0, i32 0
  store i32 2, i32* %13, align 4
  %14 = getelementptr inbounds %struct.B* %b, i32 0, i32 0
  %15 = load i32** %14, align 8
  %16 = load i32* %15, align 4
  ret i32 %16
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca %struct.A, align 4
  %b = alloca %struct.B, align 8
  store i32 0, i32* %1
  %2 = getelementptr inbounds %struct.A* %a, i32 0, i32 0
  %3 = getelementptr inbounds %struct.B* %b, i32 0, i32 0
  store i32* %2, i32** %3, align 8
  %4 = bitcast %struct.B* %b to { i32*, float }*
  %5 = getelementptr { i32*, float }* %4, i32 0, i32 0
  %6 = load i32** %5, align 1
  %7 = getelementptr { i32*, float }* %4, i32 0, i32 1
  %8 = load float* %7, align 1
  %9 = call i32 @foo(i32* %6, float %8, %struct.A* %a, float* @X)
  %10 = icmp eq i32 %9, 3
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %0
  call void @abort() #2
  unreachable

; <label>:12                                      ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
