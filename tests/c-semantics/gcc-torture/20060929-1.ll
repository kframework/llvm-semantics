; ModuleID = './20060929-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define void @foo(i32** %p, i32* %q) #0 {
  %1 = alloca i32**, align 8
  %2 = alloca i32*, align 8
  store i32** %p, i32*** %1, align 8
  store i32* %q, i32** %2, align 8
  %3 = load i32** %2, align 8
  %4 = getelementptr inbounds i32* %3, i32 1
  store i32* %4, i32** %2, align 8
  %5 = load i32* %3, align 4
  %6 = load i32*** %1, align 8
  %7 = getelementptr inbounds i32** %6, i32 1
  store i32** %7, i32*** %1, align 8
  %8 = load i32** %6, align 8
  %9 = getelementptr inbounds i32* %8, i32 1
  store i32* %9, i32** %6, align 8
  store i32 %5, i32* %8, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @bar(i32** %p, i32* %q) #0 {
  %1 = alloca i32**, align 8
  %2 = alloca i32*, align 8
  store i32** %p, i32*** %1, align 8
  store i32* %q, i32** %2, align 8
  %3 = load i32** %2, align 8
  %4 = getelementptr inbounds i32* %3, i32 1
  store i32* %4, i32** %2, align 8
  %5 = load i32* %3, align 4
  %6 = load i32*** %1, align 8
  %7 = load i32** %6, align 8
  store i32 %5, i32* %7, align 4
  %8 = load i32*** %1, align 8
  %9 = getelementptr inbounds i32** %8, i32 1
  store i32** %9, i32*** %1, align 8
  %10 = load i32** %8, align 8
  %11 = getelementptr inbounds i32* %10, i32 1
  store i32* %11, i32** %8, align 8
  %12 = load i32* %10, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @baz(i32** %p, i32* %q) #0 {
  %1 = alloca i32**, align 8
  %2 = alloca i32*, align 8
  store i32** %p, i32*** %1, align 8
  store i32* %q, i32** %2, align 8
  %3 = load i32** %2, align 8
  %4 = getelementptr inbounds i32* %3, i32 1
  store i32* %4, i32** %2, align 8
  %5 = load i32* %3, align 4
  %6 = load i32*** %1, align 8
  %7 = load i32** %6, align 8
  store i32 %5, i32* %7, align 4
  %8 = load i32*** %1, align 8
  %9 = getelementptr inbounds i32** %8, i32 1
  store i32** %9, i32*** %1, align 8
  %10 = load i32** %8, align 8
  %11 = getelementptr inbounds i32* %10, i32 1
  store i32* %11, i32** %8, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %p = alloca i32*, align 8
  store i32 0, i32* %1
  store i32 42, i32* %i, align 4
  store i32 0, i32* %j, align 4
  store i32* %i, i32** %p, align 8
  call void @foo(i32** %p, i32* %j)
  %2 = load i32** %p, align 8
  %3 = getelementptr inbounds i32* %2, i64 -1
  %4 = icmp ne i32* %3, %i
  br i1 %4, label %11, label %5

; <label>:5                                       ; preds = %0
  %6 = load i32* %j, align 4
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %11, label %8

; <label>:8                                       ; preds = %5
  %9 = load i32* %i, align 4
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %8, %5, %0
  call void @abort() #2
  unreachable

; <label>:12                                      ; preds = %8
  store i32 43, i32* %i, align 4
  store i32* %i, i32** %p, align 8
  call void @bar(i32** %p, i32* %j)
  %13 = load i32** %p, align 8
  %14 = getelementptr inbounds i32* %13, i64 -1
  %15 = icmp ne i32* %14, %i
  br i1 %15, label %22, label %16

; <label>:16                                      ; preds = %12
  %17 = load i32* %j, align 4
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %22, label %19

; <label>:19                                      ; preds = %16
  %20 = load i32* %i, align 4
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %19, %16, %12
  call void @abort() #2
  unreachable

; <label>:23                                      ; preds = %19
  store i32 44, i32* %i, align 4
  store i32* %i, i32** %p, align 8
  call void @baz(i32** %p, i32* %j)
  %24 = load i32** %p, align 8
  %25 = getelementptr inbounds i32* %24, i64 -1
  %26 = icmp ne i32* %25, %i
  br i1 %26, label %33, label %27

; <label>:27                                      ; preds = %23
  %28 = load i32* %j, align 4
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %33, label %30

; <label>:30                                      ; preds = %27
  %31 = load i32* %i, align 4
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %33, label %34

; <label>:33                                      ; preds = %30, %27, %23
  call void @abort() #2
  unreachable

; <label>:34                                      ; preds = %30
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
