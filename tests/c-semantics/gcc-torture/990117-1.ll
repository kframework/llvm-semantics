; ModuleID = './990117-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @foo(i32 %x, i32 %y, i32 %i, i32 %j) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %tmp1 = alloca double, align 8
  %tmp2 = alloca double, align 8
  store i32 %x, i32* %1, align 4
  store i32 %y, i32* %2, align 4
  store i32 %i, i32* %3, align 4
  store i32 %j, i32* %4, align 4
  %5 = load i32* %1, align 4
  %6 = sitofp i32 %5 to double
  %7 = load i32* %2, align 4
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %6, %8
  store double %9, double* %tmp1, align 8
  %10 = load i32* %3, align 4
  %11 = sitofp i32 %10 to double
  %12 = load i32* %4, align 4
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %11, %13
  store double %14, double* %tmp2, align 8
  %15 = load double* %tmp1, align 8
  %16 = load double* %tmp2, align 8
  %17 = fcmp olt double %15, %16
  %18 = zext i1 %17 to i32
  ret i32 %18
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @foo(i32 2, i32 24, i32 3, i32 4)
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
