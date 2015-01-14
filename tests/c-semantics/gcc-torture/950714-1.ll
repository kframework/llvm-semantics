; ModuleID = './950714-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@array = global [10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], align 16

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %p = alloca i32*, align 8
  store i32 0, i32* %1
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %20, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 10
  br i1 %4, label %5, label %23

; <label>:5                                       ; preds = %2
  store i32* getelementptr inbounds ([10 x i32]* @array, i32 0, i64 0), i32** %p, align 8
  br label %6

; <label>:6                                       ; preds = %16, %5
  %7 = load i32** %p, align 8
  %8 = icmp ne i32* %7, getelementptr inbounds ([10 x i32]* @array, i32 0, i64 9)
  br i1 %8, label %9, label %19

; <label>:9                                       ; preds = %6
  %10 = load i32** %p, align 8
  %11 = load i32* %10, align 4
  %12 = load i32* %i, align 4
  %13 = icmp eq i32 %11, %12
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %9
  br label %24

; <label>:15                                      ; preds = %9
  br label %16

; <label>:16                                      ; preds = %15
  %17 = load i32** %p, align 8
  %18 = getelementptr inbounds i32* %17, i32 1
  store i32* %18, i32** %p, align 8
  br label %6

; <label>:19                                      ; preds = %6
  br label %20

; <label>:20                                      ; preds = %19
  %21 = load i32* %i, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, i32* %i, align 4
  br label %2

; <label>:23                                      ; preds = %2
  br label %24

; <label>:24                                      ; preds = %23, %14
  %25 = load i32* %i, align 4
  %26 = icmp ne i32 %25, 1
  br i1 %26, label %27, label %28

; <label>:27                                      ; preds = %24
  call void @abort() #2
  unreachable

; <label>:28                                      ; preds = %24
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %30 = load i32* %1
  ret i32 %30
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
