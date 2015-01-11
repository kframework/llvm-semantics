; ModuleID = './pr20187-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@a = global i32 257, align 4
@b = global i32 256, align 4

; Function Attrs: nounwind uwtable
define i32 @test() #0 {
  %1 = load i32* @a, align 4
  %2 = icmp ne i32 %1, 0
  br i1 %2, label %3, label %5

; <label>:3                                       ; preds = %0
  %4 = load i32* @a, align 4
  br label %6

; <label>:5                                       ; preds = %0
  br label %6

; <label>:6                                       ; preds = %5, %3
  %7 = phi i32 [ %4, %3 ], [ 1, %5 ]
  %8 = load i32* @a, align 4
  %9 = load i32* @b, align 4
  %10 = mul nsw i32 %8, %9
  %11 = and i32 %7, %10
  %12 = sext i32 %11 to i64
  %13 = trunc i64 %12 to i8
  %14 = zext i8 %13 to i32
  %15 = icmp ne i32 %14, 0
  %16 = select i1 %15, i32 0, i32 1
  ret i32 %16
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @test()
  %3 = sub nsw i32 1, %2
  ret i32 %3
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
