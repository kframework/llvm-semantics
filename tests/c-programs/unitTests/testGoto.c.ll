; ModuleID = './testGoto.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @test1() #0 {
  %x = alloca i32, align 4
  store i32 0, i32* %x, align 4
  br label %1

; <label>:1                                       ; preds = %0
  %2 = load i32, i32* %x, align 4
  ret i32 %2
}

; Function Attrs: nounwind uwtable
define i32 @test2() #0 {
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 0, i32* %x, align 4
  br label %1

; <label>:1                                       ; preds = %0
  store i32 5, i32* %y, align 4
  %2 = load i32, i32* %y, align 4
  %3 = load i32, i32* %x, align 4
  %4 = icmp eq i32 %2, %3
  %5 = zext i1 %4 to i32
  %6 = mul nsw i32 2, %5
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define i32 @test3() #0 {
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 2, i32* %x, align 4
  br label %1

; <label>:1                                       ; preds = %0
  store i32 2, i32* %y, align 4
  %2 = load i32, i32* %y, align 4
  %3 = load i32, i32* %x, align 4
  %4 = sub nsw i32 %2, %3
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define i32 @test4() #0 {
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %w = alloca i32, align 4
  %z = alloca i32, align 4
  store i32 0, i32* %x, align 4
  store i32 1, i32* %y, align 4
  store i32 0, i32* %w, align 4
  br label %1

; <label>:1                                       ; preds = %0
  store i32 5, i32* %z, align 4
  %2 = load i32, i32* %z, align 4
  %3 = load i32, i32* %y, align 4
  %4 = sub nsw i32 %2, %3
  %5 = icmp ne i32 %4, 4
  %6 = zext i1 %5 to i32
  %7 = mul nsw i32 4, %6
  ret i32 %7
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @test1()
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  store i32 1, i32* %1
  br label %18

; <label>:5                                       ; preds = %0
  %6 = call i32 @test2()
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5
  store i32 2, i32* %1
  br label %18

; <label>:9                                       ; preds = %5
  %10 = call i32 @test3()
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %9
  store i32 3, i32* %1
  br label %18

; <label>:13                                      ; preds = %9
  %14 = call i32 @test4()
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %13
  store i32 4, i32* %1
  br label %18

; <label>:17                                      ; preds = %13
  store i32 0, i32* %1
  br label %18

; <label>:18                                      ; preds = %17, %16, %12, %8, %4
  %19 = load i32, i32* %1
  ret i32 %19
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
