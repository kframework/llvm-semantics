; ModuleID = './j039.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @f(i32 %x, i32 %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  store i32 %y, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @g(double %x) #0 {
  %1 = alloca double, align 8
  store double %x, double* %1, align 8
  %2 = load double, double* %1, align 8
  %3 = fptosi double %2 to i32
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @f(i32 0, i32 0)
  %3 = call i32 @g(double 0.000000e+00)
  %4 = call i32 @bar(double 5.000000e+00)
  %5 = call i32 @baz(i32 5)
  %6 = call i32 @bah(i32 5)
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @bar(double %a) #0 {
  %1 = alloca double, align 8
  store double %a, double* %1, align 8
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @baz(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @bah(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  ret i32 %2
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
