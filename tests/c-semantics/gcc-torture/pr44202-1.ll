; ModuleID = './pr44202-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define i32 @add512(i32 %a, i32* %b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32*, align 8
  %c = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32* %b, i32** %2, align 8
  %3 = load i32* %1, align 4
  %4 = add nsw i32 %3, 512
  store i32 %4, i32* %c, align 4
  %5 = load i32* %c, align 4
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %10

; <label>:7                                       ; preds = %0
  %8 = load i32* %1, align 4
  %9 = load i32** %2, align 8
  store i32 %8, i32* %9, align 4
  br label %10

; <label>:10                                      ; preds = %7, %0
  %11 = load i32* %c, align 4
  ret i32 %11
}

; Function Attrs: noinline nounwind uwtable
define i32 @add513(i32 %a, i32* %b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32*, align 8
  %c = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32* %b, i32** %2, align 8
  %3 = load i32* %1, align 4
  %4 = add nsw i32 %3, 513
  store i32 %4, i32* %c, align 4
  %5 = load i32* %c, align 4
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %10

; <label>:7                                       ; preds = %0
  %8 = load i32* %1, align 4
  %9 = load i32** %2, align 8
  store i32 %8, i32* %9, align 4
  br label %10

; <label>:10                                      ; preds = %7, %0
  %11 = load i32* %c, align 4
  ret i32 %11
}

; Function Attrs: nounwind uwtable
define i32 @main() #1 {
  %1 = alloca i32, align 4
  %b0 = alloca i32, align 4
  %b1 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 -1, i32* %b0, align 4
  store i32 -1, i32* %b1, align 4
  %2 = call i32 @add512(i32 -512, i32* %b0)
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %13, label %4

; <label>:4                                       ; preds = %0
  %5 = load i32* %b0, align 4
  %6 = icmp ne i32 %5, -1
  br i1 %6, label %13, label %7

; <label>:7                                       ; preds = %4
  %8 = call i32 @add513(i32 -513, i32* %b1)
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %13, label %10

; <label>:10                                      ; preds = %7
  %11 = load i32* %b1, align 4
  %12 = icmp ne i32 %11, -513
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %10, %7, %4, %0
  call void @abort() #3
  unreachable

; <label>:14                                      ; preds = %10
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %16 = load i32* %1
  ret i32 %16
}

; Function Attrs: noreturn
declare void @abort() #2

; Function Attrs: noreturn
declare void @exit(i32) #2

attributes #0 = { noinline nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
