; ModuleID = './20080506-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %u = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 -1, i32* %i, align 4
  %2 = load i32* %i, align 4
  %3 = icmp sgt i32 %2, 0
  br i1 %3, label %4, label %6

; <label>:4                                       ; preds = %0
  %5 = load i32* %i, align 4
  br label %7

; <label>:6                                       ; preds = %0
  br label %7

; <label>:7                                       ; preds = %6, %4
  %8 = phi i32 [ %5, %4 ], [ 0, %6 ]
  %9 = icmp ugt i32 %8, 1
  br i1 %9, label %10, label %18

; <label>:10                                      ; preds = %7
  %11 = load i32* %i, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13                                      ; preds = %10
  %14 = load i32* %i, align 4
  br label %16

; <label>:15                                      ; preds = %10
  br label %16

; <label>:16                                      ; preds = %15, %13
  %17 = phi i32 [ %14, %13 ], [ 0, %15 ]
  br label %19

; <label>:18                                      ; preds = %7
  br label %19

; <label>:19                                      ; preds = %18, %16
  %20 = phi i32 [ %17, %16 ], [ 1, %18 ]
  store i32 %20, i32* %u, align 4
  %21 = load i32* %u, align 4
  %22 = icmp ne i32 %21, 1
  br i1 %22, label %23, label %24

; <label>:23                                      ; preds = %19
  call void @abort() #2
  unreachable

; <label>:24                                      ; preds = %19
  %25 = load i32* %i, align 4
  %26 = icmp sgt i32 %25, 0
  br i1 %26, label %27, label %29

; <label>:27                                      ; preds = %24
  %28 = load i32* %i, align 4
  br label %30

; <label>:29                                      ; preds = %24
  br label %30

; <label>:30                                      ; preds = %29, %27
  %31 = phi i32 [ %28, %27 ], [ 0, %29 ]
  %32 = load i32* %i, align 4
  %33 = icmp ult i32 %31, %32
  br i1 %33, label %34, label %42

; <label>:34                                      ; preds = %30
  %35 = load i32* %i, align 4
  %36 = icmp sgt i32 %35, 0
  br i1 %36, label %37, label %39

; <label>:37                                      ; preds = %34
  %38 = load i32* %i, align 4
  br label %40

; <label>:39                                      ; preds = %34
  br label %40

; <label>:40                                      ; preds = %39, %37
  %41 = phi i32 [ %38, %37 ], [ 0, %39 ]
  br label %44

; <label>:42                                      ; preds = %30
  %43 = load i32* %i, align 4
  br label %44

; <label>:44                                      ; preds = %42, %40
  %45 = phi i32 [ %41, %40 ], [ %43, %42 ]
  store i32 %45, i32* %u, align 4
  %46 = load i32* %u, align 4
  %47 = icmp ne i32 %46, 0
  br i1 %47, label %48, label %49

; <label>:48                                      ; preds = %44
  call void @abort() #2
  unreachable

; <label>:49                                      ; preds = %44
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
