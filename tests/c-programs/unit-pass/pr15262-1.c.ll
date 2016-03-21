; ModuleID = './pr15262-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.A = type { i32, i32 }

; Function Attrs: nounwind uwtable
define i32 @foo() #0 {
  ret i32 3
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %loc = alloca %struct.A, align 4
  %locp = alloca %struct.A*, align 8
  %f = alloca float, align 4
  %g = alloca float, align 4
  %p = alloca float*, align 8
  %T355 = alloca i32, align 4
  %T356 = alloca i32*, align 8
  store i32 0, i32* %1
  store float 3.000000e+00, float* %f, align 4
  store float 2.000000e+00, float* %g, align 4
  %2 = call i32 @foo()
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  br label %6

; <label>:5                                       ; preds = %0
  br label %6

; <label>:6                                       ; preds = %5, %4
  %7 = phi float* [ %g, %4 ], [ %f, %5 ]
  store float* %7, float** %p, align 8
  %8 = load float*, float** %p, align 8
  %9 = load float, float* %8, align 4
  %10 = fpext float %9 to double
  %11 = fcmp ogt double %10, 0.000000e+00
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %6
  store float 1.000000e+00, float* %g, align 4
  br label %13

; <label>:13                                      ; preds = %12, %6
  %14 = call noalias i8* @malloc(i64 8) #3
  %15 = bitcast i8* %14 to %struct.A*
  store %struct.A* %15, %struct.A** %locp, align 8
  %16 = load %struct.A*, %struct.A** %locp, align 8
  %17 = getelementptr inbounds %struct.A, %struct.A* %16, i32 0, i32 1
  store i32 10, i32* %17, align 4
  %18 = load %struct.A*, %struct.A** %locp, align 8
  %19 = getelementptr inbounds %struct.A, %struct.A* %18, i32 0, i32 1
  %20 = load i32, i32* %19, align 4
  store i32 %20, i32* %T355, align 4
  %21 = load %struct.A*, %struct.A** %locp, align 8
  %22 = getelementptr inbounds %struct.A, %struct.A* %21, i32 0, i32 1
  store i32* %22, i32** %T356, align 8
  %23 = load i32*, i32** %T356, align 8
  store i32 1, i32* %23, align 4
  %24 = load %struct.A*, %struct.A** %locp, align 8
  %25 = getelementptr inbounds %struct.A, %struct.A* %24, i32 0, i32 1
  %26 = load i32, i32* %25, align 4
  store i32 %26, i32* %T355, align 4
  %27 = load i32, i32* %T355, align 4
  %28 = icmp ne i32 %27, 1
  br i1 %28, label %29, label %30

; <label>:29                                      ; preds = %13
  call void @abort() #4
  unreachable

; <label>:30                                      ; preds = %13
  ret i32 0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: noreturn nounwind
declare void @abort() #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
