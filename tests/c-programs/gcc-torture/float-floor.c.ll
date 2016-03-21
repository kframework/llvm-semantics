; ModuleID = './float-floor.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@d = global double 0x408FFFFFF0000000, align 8

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %df = alloca double, align 8
  %f1 = alloca float, align 4
  store i32 0, i32* %1
  %2 = load double, double* @d, align 8
  %3 = call double @floor(double %2) #3
  store double %3, double* %df, align 8
  %4 = load double, double* @d, align 8
  %5 = call double @floor(double %4) #3
  %6 = fptrunc double %5 to float
  store float %6, float* %f1, align 4
  %7 = load double, double* %df, align 8
  %8 = fptosi double %7 to i32
  %9 = icmp ne i32 %8, 1023
  br i1 %9, label %14, label %10

; <label>:10                                      ; preds = %0
  %11 = load float, float* %f1, align 4
  %12 = fptosi float %11 to i32
  %13 = icmp ne i32 %12, 1023
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %10, %0
  call void @abort() #4
  unreachable

; <label>:15                                      ; preds = %10
  ret i32 0
}

; Function Attrs: nounwind readnone
declare double @floor(double) #1

; Function Attrs: noreturn nounwind
declare void @abort() #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
