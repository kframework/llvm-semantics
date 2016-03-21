; ModuleID = './loop-8.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@a = global [3 x double] [double 0.000000e+00, double 1.000000e+00, double 2.000000e+00], align 16

; Function Attrs: nounwind uwtable
define void @bar(i32 %x, double* %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca double*, align 8
  store i32 %x, i32* %1, align 4
  store double* %y, double** %2, align 8
  %3 = load i32, i32* %1, align 4
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %9, label %5

; <label>:5                                       ; preds = %0
  %6 = load double*, double** %2, align 8
  %7 = load double, double* %6, align 8
  %8 = fcmp une double %7, 1.000000e+00
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %5, %0
  call void @abort() #2
  unreachable

; <label>:10                                      ; preds = %5
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %c = alloca double, align 8
  %d = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %d, align 4
  br label %2

; <label>:2                                       ; preds = %14, %0
  %3 = load i32, i32* %d, align 4
  %4 = icmp slt i32 %3, 3
  br i1 %4, label %5, label %17

; <label>:5                                       ; preds = %2
  %6 = load i32, i32* %d, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [3 x double], [3 x double]* @a, i32 0, i64 %7
  %9 = load double, double* %8, align 8
  store double %9, double* %c, align 8
  %10 = load double, double* %c, align 8
  %11 = fcmp ogt double %10, 0.000000e+00
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %5
  br label %18

; <label>:13                                      ; preds = %5
  br label %14

; <label>:14                                      ; preds = %13
  %15 = load i32, i32* %d, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, i32* %d, align 4
  br label %2

; <label>:17                                      ; preds = %2
  call void @bar(i32 1, double* %c)
  call void @exit(i32 1) #2
  unreachable

; <label>:18                                      ; preds = %12
  call void @bar(i32 0, double* %c)
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %20 = load i32, i32* %1
  ret i32 %20
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
