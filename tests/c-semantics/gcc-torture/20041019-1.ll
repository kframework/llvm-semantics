; ModuleID = './20041019-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @test_store_ccp(i32 %i) #0 {
  %1 = alloca i32, align 4
  %p = alloca i32*, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 %i, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = icmp slt i32 %2, 5
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  store i32* %a, i32** %p, align 8
  br label %11

; <label>:5                                       ; preds = %0
  %6 = load i32* %1, align 4
  %7 = icmp sgt i32 %6, 8
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5
  store i32* %b, i32** %p, align 8
  br label %10

; <label>:9                                       ; preds = %5
  store i32* %c, i32** %p, align 8
  br label %10

; <label>:10                                      ; preds = %9, %8
  br label %11

; <label>:11                                      ; preds = %10, %4
  %12 = load i32** %p, align 8
  store i32 10, i32* %12, align 4
  store i32 3, i32* %b, align 4
  %13 = load i32** %p, align 8
  %14 = load i32* %13, align 4
  %15 = add nsw i32 %14, 2
  ret i32 %15
}

; Function Attrs: nounwind uwtable
define i32 @test_store_copy_prop(i32 %i) #0 {
  %1 = alloca i32, align 4
  %p = alloca i32*, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 %i, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = icmp slt i32 %2, 5
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  store i32* %a, i32** %p, align 8
  br label %11

; <label>:5                                       ; preds = %0
  %6 = load i32* %1, align 4
  %7 = icmp sgt i32 %6, 8
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5
  store i32* %b, i32** %p, align 8
  br label %10

; <label>:9                                       ; preds = %5
  store i32* %c, i32** %p, align 8
  br label %10

; <label>:10                                      ; preds = %9, %8
  br label %11

; <label>:11                                      ; preds = %10, %4
  %12 = load i32* %1, align 4
  %13 = load i32** %p, align 8
  store i32 %12, i32* %13, align 4
  %14 = load i32* %1, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* %b, align 4
  %16 = load i32** %p, align 8
  %17 = load i32* %16, align 4
  ret i32 %17
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @test_store_ccp(i32 10)
  store i32 %2, i32* %x, align 4
  %3 = load i32* %x, align 4
  %4 = icmp eq i32 %3, 12
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  %7 = call i32 @test_store_copy_prop(i32 9)
  store i32 %7, i32* %x, align 4
  %8 = load i32* %x, align 4
  %9 = icmp eq i32 %8, 9
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %6
  call void @abort() #2
  unreachable

; <label>:11                                      ; preds = %6
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
