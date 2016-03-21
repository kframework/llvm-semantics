; ModuleID = './930603-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define float @fx(double) #0 {
  %2 = alloca float, align 4
  %x = fptrunc double %0 to float
  store float %x, float* %2, align 4
  %3 = load float, float* %2, align 4
  %4 = fpext float %3 to double
  %5 = fmul double 0x40026BB1BBB58975, %4
  %6 = fdiv double 3.000000e+00, %5
  %7 = fadd double 1.000000e+00, %6
  %8 = fptrunc double %7 to float
  ret float %8
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca float, align 4
  %b = alloca float, align 4
  %c = alloca float, align 4
  store i32 0, i32* %1
  %2 = call float @inita()
  store float %2, float* %a, align 4
  %3 = call float @initc()
  store float %3, float* %c, align 4
  call void @f()
  %4 = load float, float* %c, align 4
  %5 = fpext float %4 to double
  %6 = call float @fx(double %5)
  %7 = load float, float* %a, align 4
  %8 = fadd float %6, %7
  store float %8, float* %b, align 4
  call void @f()
  %9 = load float, float* %a, align 4
  %10 = fpext float %9 to double
  %11 = fcmp une double %10, 3.000000e+00
  br i1 %11, label %24, label %12

; <label>:12                                      ; preds = %0
  %13 = load float, float* %b, align 4
  %14 = fpext float %13 to double
  %15 = fcmp olt double %14, 4.325700e+00
  br i1 %15, label %24, label %16

; <label>:16                                      ; preds = %12
  %17 = load float, float* %b, align 4
  %18 = fpext float %17 to double
  %19 = fcmp ogt double %18, 4.325800e+00
  br i1 %19, label %24, label %20

; <label>:20                                      ; preds = %16
  %21 = load float, float* %c, align 4
  %22 = fpext float %21 to double
  %23 = fcmp une double %22, 4.000000e+00
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %20, %16, %12, %0
  call void @abort() #2
  unreachable

; <label>:25                                      ; preds = %20
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %27 = load i32, i32* %1
  ret i32 %27
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

; Function Attrs: nounwind uwtable
define float @inita() #0 {
  ret float 3.000000e+00
}

; Function Attrs: nounwind uwtable
define float @initc() #0 {
  ret float 4.000000e+00
}

; Function Attrs: nounwind uwtable
define void @f() #0 {
  ret void
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
