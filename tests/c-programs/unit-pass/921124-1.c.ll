; ModuleID = './921124-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

; Function Attrs: nounwind uwtable
define i32 @f(i32 %x, double %d1, double %d2, double %d3) #0 {
  %1 = alloca i32, align 4
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  store i32 %x, i32* %1, align 4
  store double %d1, double* %2, align 8
  store double %d2, double* %3, align 8
  store double %d3, double* %4, align 8
  %5 = load i32, i32* %1, align 4
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define void @g(i8* %b, i8* %s, double %x, double %y, i32 %i, i32 %j) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i8* %b, i8** %1, align 8
  store i8* %s, i8** %2, align 8
  store double %x, double* %3, align 8
  store double %y, double* %4, align 8
  store i32 %i, i32* %5, align 4
  store i32 %j, i32* %6, align 4
  %7 = load double, double* %3, align 8
  %8 = fcmp une double %7, 1.000000e+00
  br i1 %8, label %18, label %9

; <label>:9                                       ; preds = %0
  %10 = load double, double* %4, align 8
  %11 = fcmp une double %10, 2.000000e+00
  br i1 %11, label %18, label %12

; <label>:12                                      ; preds = %9
  %13 = load i32, i32* %5, align 4
  %14 = icmp ne i32 %13, 3
  br i1 %14, label %18, label %15

; <label>:15                                      ; preds = %12
  %16 = load i32, i32* %6, align 4
  %17 = icmp ne i32 %16, 4
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %15, %12, %9, %0
  call void @abort() #2
  unreachable

; <label>:19                                      ; preds = %15
  ret void
}

; Function Attrs: noreturn
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @f(i32 3, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00)
  %3 = call i32 @f(i32 4, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00)
  call void @g(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0), double 1.000000e+00, double 2.000000e+00, i32 %2, i32 %3)
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %5 = load i32, i32* %1
  ret i32 %5
}

; Function Attrs: noreturn
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
