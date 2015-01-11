; ModuleID = './vrp-3.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @f(i32 %a) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %a, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp slt i32 %3, 12
  br i1 %4, label %5, label %23

; <label>:5                                       ; preds = %0
  %6 = load i32* %2, align 4
  %7 = icmp sgt i32 %6, -15
  br i1 %7, label %8, label %22

; <label>:8                                       ; preds = %5
  %9 = load i32* %2, align 4
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11                                      ; preds = %8
  %12 = load i32* %2, align 4
  br label %16

; <label>:13                                      ; preds = %8
  %14 = load i32* %2, align 4
  %15 = sub nsw i32 0, %14
  br label %16

; <label>:16                                      ; preds = %13, %11
  %17 = phi i32 [ %12, %11 ], [ %15, %13 ]
  store i32 %17, i32* %2, align 4
  %18 = load i32* %2, align 4
  %19 = icmp eq i32 %18, 2
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %16
  store i32 0, i32* %1
  br label %24

; <label>:21                                      ; preds = %16
  store i32 1, i32* %1
  br label %24

; <label>:22                                      ; preds = %5
  br label %23

; <label>:23                                      ; preds = %22, %0
  store i32 1, i32* %1
  br label %24

; <label>:24                                      ; preds = %23, %21, %20
  %25 = load i32* %1
  ret i32 %25
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @f(i32 -2)
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:7                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %9 = load i32* %1
  ret i32 %9
}

; Function Attrs: noreturn
declare void @abort() #1

; Function Attrs: noreturn
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
