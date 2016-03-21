; ModuleID = './pr15262.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.A = type { i32, i32 }

; Function Attrs: nounwind uwtable
define void @bar(float* %p) #0 {
  %1 = alloca float*, align 8
  store float* %p, float** %1, align 8
  %2 = load float*, float** %1, align 8
  store float 0x4014CCCCC0000000, float* %2, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @foo(%struct.A* %locp, i32 %i, i32 %str) #0 {
  %1 = alloca %struct.A*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %f = alloca float, align 4
  %g = alloca float, align 4
  %p = alloca float*, align 8
  %T355 = alloca i32, align 4
  %T356 = alloca i32*, align 8
  store %struct.A* %locp, %struct.A** %1, align 8
  store i32 %i, i32* %2, align 4
  store i32 %str, i32* %3, align 4
  %4 = load i32, i32* %2, align 4
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  br label %8

; <label>:7                                       ; preds = %0
  br label %8

; <label>:8                                       ; preds = %7, %6
  %9 = phi float* [ %g, %6 ], [ %f, %7 ]
  store float* %9, float** %p, align 8
  %10 = load float*, float** %p, align 8
  call void @bar(float* %10)
  %11 = load float*, float** %p, align 8
  %12 = load float, float* %11, align 4
  %13 = fpext float %12 to double
  %14 = fcmp ogt double %13, 0.000000e+00
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %8
  store i32 1, i32* %3, align 4
  br label %16

; <label>:16                                      ; preds = %15, %8
  %17 = load %struct.A*, %struct.A** %1, align 8
  %18 = getelementptr inbounds %struct.A, %struct.A* %17, i32 0, i32 1
  %19 = load i32, i32* %18, align 4
  store i32 %19, i32* %T355, align 4
  %20 = load %struct.A*, %struct.A** %1, align 8
  %21 = getelementptr inbounds %struct.A, %struct.A* %20, i32 0, i32 1
  store i32* %21, i32** %T356, align 8
  %22 = load i32, i32* %3, align 4
  %23 = load i32*, i32** %T356, align 8
  store i32 %22, i32* %23, align 4
  %24 = load %struct.A*, %struct.A** %1, align 8
  %25 = getelementptr inbounds %struct.A, %struct.A* %24, i32 0, i32 1
  %26 = load i32, i32* %25, align 4
  store i32 %26, i32* %T355, align 4
  %27 = load i32, i32* %T355, align 4
  ret i32 %27
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %loc = alloca %struct.A, align 4
  %str = alloca i32, align 4
  store i32 0, i32* %1
  %2 = getelementptr inbounds %struct.A, %struct.A* %loc, i32 0, i32 1
  store i32 2, i32* %2, align 4
  %3 = call i32 @foo(%struct.A* %loc, i32 10, i32 3)
  store i32 %3, i32* %str, align 4
  %4 = load i32, i32* %str, align 4
  %5 = icmp ne i32 %4, 1
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:7                                       ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
