; ModuleID = './20041213-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define void @foo(i32 %i) #0 {
  %1 = alloca i32, align 4
  %next_n = alloca i32, align 4
  %j = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %i, i32* %1, align 4
  store i32 1, i32* %next_n, align 4
  store i32 0, i32* %j, align 4
  br label %2

; <label>:2                                       ; preds = %23, %0
  %3 = load i32* %1, align 4
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %5, label %26

; <label>:5                                       ; preds = %2
  %6 = load i32* %next_n, align 4
  store i32 %6, i32* %n, align 4
  br label %7

; <label>:7                                       ; preds = %14, %5
  %8 = load i32* %j, align 4
  %9 = load i32* %n, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %17

; <label>:11                                      ; preds = %7
  %12 = load i32* %next_n, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, i32* %next_n, align 4
  br label %14

; <label>:14                                      ; preds = %11
  %15 = load i32* %j, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, i32* %j, align 4
  br label %7

; <label>:17                                      ; preds = %7
  %18 = load i32* %j, align 4
  %19 = load i32* %n, align 4
  %20 = icmp ne i32 %18, %19
  br i1 %20, label %21, label %22

; <label>:21                                      ; preds = %17
  call void @abort() #3
  unreachable

; <label>:22                                      ; preds = %17
  br label %23

; <label>:23                                      ; preds = %22
  %24 = load i32* %1, align 4
  %25 = add nsw i32 %24, -1
  store i32 %25, i32* %1, align 4
  br label %2

; <label>:26                                      ; preds = %2
  ret void
}

; Function Attrs: noreturn
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @main() #2 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @foo(i32 2)
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %3 = load i32* %1
  ret i32 %3
}

; Function Attrs: noreturn
declare void @exit(i32) #1

attributes #0 = { noinline nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
