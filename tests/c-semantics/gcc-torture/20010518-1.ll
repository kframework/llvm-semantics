; ModuleID = './20010518-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @add(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i32 %f, i32 %g, i32 %h, i32 %i, i32 %j, i32 %k, i32 %l, i32 %m) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  store i32 %c, i32* %3, align 4
  store i32 %d, i32* %4, align 4
  store i32 %e, i32* %5, align 4
  store i32 %f, i32* %6, align 4
  store i32 %g, i32* %7, align 4
  store i32 %h, i32* %8, align 4
  store i32 %i, i32* %9, align 4
  store i32 %j, i32* %10, align 4
  store i32 %k, i32* %11, align 4
  store i32 %l, i32* %12, align 4
  store i32 %m, i32* %13, align 4
  %14 = load i32* %1, align 4
  %15 = load i32* %2, align 4
  %16 = add nsw i32 %14, %15
  %17 = load i32* %3, align 4
  %18 = add nsw i32 %16, %17
  %19 = load i32* %4, align 4
  %20 = add nsw i32 %18, %19
  %21 = load i32* %5, align 4
  %22 = add nsw i32 %20, %21
  %23 = load i32* %6, align 4
  %24 = add nsw i32 %22, %23
  %25 = load i32* %7, align 4
  %26 = add nsw i32 %24, %25
  %27 = load i32* %8, align 4
  %28 = add nsw i32 %26, %27
  %29 = load i32* %9, align 4
  %30 = add nsw i32 %28, %29
  %31 = load i32* %10, align 4
  %32 = add nsw i32 %30, %31
  %33 = load i32* %11, align 4
  %34 = add nsw i32 %32, %33
  %35 = load i32* %12, align 4
  %36 = add nsw i32 %34, %35
  %37 = load i32* %13, align 4
  %38 = add nsw i32 %36, %37
  ret i32 %38
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @add(i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13)
  %3 = icmp ne i32 %2, 91
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %7 = load i32* %1
  ret i32 %7
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
