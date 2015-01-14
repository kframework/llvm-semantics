; ModuleID = './990804-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @gfbyte() #0 {
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @gfbyte()
  store i32 %2, i32* %i, align 4
  %3 = load i32* %i, align 4
  %4 = add nsw i32 %3, 1
  store i32 %4, i32* %i, align 4
  %5 = load i32* %i, align 4
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  store i32 0, i32* %k, align 4
  br label %11

; <label>:8                                       ; preds = %0
  %9 = load i32* %i, align 4
  %10 = add nsw i32 %9, 0
  store i32 %10, i32* %k, align 4
  br label %11

; <label>:11                                      ; preds = %8, %7
  %12 = load i32* %i, align 4
  %13 = icmp ne i32 %12, 1
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %11
  call void @abort() #2
  unreachable

; <label>:15                                      ; preds = %11
  store i32 1, i32* %k, align 4
  %16 = load i32* %k, align 4
  %17 = load i32* %i, align 4
  %18 = icmp sle i32 %16, %17
  br i1 %18, label %19, label %28

; <label>:19                                      ; preds = %15
  br label %20

; <label>:20                                      ; preds = %22, %19
  %21 = call i32 @gfbyte()
  store i32 %21, i32* %j, align 4
  br label %22

; <label>:22                                      ; preds = %20
  %23 = load i32* %k, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, i32* %k, align 4
  %25 = load i32* %i, align 4
  %26 = icmp slt i32 %23, %25
  br i1 %26, label %20, label %27

; <label>:27                                      ; preds = %22
  br label %28

; <label>:28                                      ; preds = %27, %15
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
