; ModuleID = './switch-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @foo(i32 %x) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %x, i32* %2, align 4
  %3 = load i32* %2, align 4
  switch i32 %3, label %5 [
    i32 4, label %4
    i32 6, label %4
    i32 9, label %4
    i32 11, label %4
  ]

; <label>:4                                       ; preds = %0, %0, %0, %0
  store i32 30, i32* %1
  br label %6

; <label>:5                                       ; preds = %0
  store i32 31, i32* %1
  br label %6

; <label>:6                                       ; preds = %5, %4
  %7 = load i32* %1
  ret i32 %7
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 0, i32* %1
  store i32 -1, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %48, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 66
  br i1 %4, label %5, label %51

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = call i32 @foo(i32 %6)
  store i32 %7, i32* %r, align 4
  %8 = load i32* %i, align 4
  %9 = icmp eq i32 %8, 4
  br i1 %9, label %10, label %15

; <label>:10                                      ; preds = %5
  %11 = load i32* %r, align 4
  %12 = icmp ne i32 %11, 30
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %10
  call void @abort() #2
  unreachable

; <label>:14                                      ; preds = %10
  br label %47

; <label>:15                                      ; preds = %5
  %16 = load i32* %i, align 4
  %17 = icmp eq i32 %16, 6
  br i1 %17, label %18, label %23

; <label>:18                                      ; preds = %15
  %19 = load i32* %r, align 4
  %20 = icmp ne i32 %19, 30
  br i1 %20, label %21, label %22

; <label>:21                                      ; preds = %18
  call void @abort() #2
  unreachable

; <label>:22                                      ; preds = %18
  br label %46

; <label>:23                                      ; preds = %15
  %24 = load i32* %i, align 4
  %25 = icmp eq i32 %24, 9
  br i1 %25, label %26, label %31

; <label>:26                                      ; preds = %23
  %27 = load i32* %r, align 4
  %28 = icmp ne i32 %27, 30
  br i1 %28, label %29, label %30

; <label>:29                                      ; preds = %26
  call void @abort() #2
  unreachable

; <label>:30                                      ; preds = %26
  br label %45

; <label>:31                                      ; preds = %23
  %32 = load i32* %i, align 4
  %33 = icmp eq i32 %32, 11
  br i1 %33, label %34, label %39

; <label>:34                                      ; preds = %31
  %35 = load i32* %r, align 4
  %36 = icmp ne i32 %35, 30
  br i1 %36, label %37, label %38

; <label>:37                                      ; preds = %34
  call void @abort() #2
  unreachable

; <label>:38                                      ; preds = %34
  br label %44

; <label>:39                                      ; preds = %31
  %40 = load i32* %r, align 4
  %41 = icmp ne i32 %40, 31
  br i1 %41, label %42, label %43

; <label>:42                                      ; preds = %39
  call void @abort() #2
  unreachable

; <label>:43                                      ; preds = %39
  br label %44

; <label>:44                                      ; preds = %43, %38
  br label %45

; <label>:45                                      ; preds = %44, %30
  br label %46

; <label>:46                                      ; preds = %45, %22
  br label %47

; <label>:47                                      ; preds = %46, %14
  br label %48

; <label>:48                                      ; preds = %47
  %49 = load i32* %i, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, i32* %i, align 4
  br label %2

; <label>:51                                      ; preds = %2
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
