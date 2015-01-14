; ModuleID = './pr27073.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define void @foo(i32* %p, i32 %d1, i32 %d2, i32 %d3, i16 signext %count, i32 %s1, i32 %s2, i32 %s3, i32 %s4, i32 %s5) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i16, align 2
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %n = alloca i32, align 4
  store i32* %p, i32** %1, align 8
  store i32 %d1, i32* %2, align 4
  store i32 %d2, i32* %3, align 4
  store i32 %d3, i32* %4, align 4
  store i16 %count, i16* %5, align 2
  store i32 %s1, i32* %6, align 4
  store i32 %s2, i32* %7, align 4
  store i32 %s3, i32* %8, align 4
  store i32 %s4, i32* %9, align 4
  store i32 %s5, i32* %10, align 4
  %11 = load i16* %5, align 2
  %12 = sext i16 %11 to i32
  store i32 %12, i32* %n, align 4
  br label %13

; <label>:13                                      ; preds = %17, %0
  %14 = load i32* %n, align 4
  %15 = add nsw i32 %14, -1
  store i32 %15, i32* %n, align 4
  %16 = icmp ne i32 %14, 0
  br i1 %16, label %17, label %33

; <label>:17                                      ; preds = %13
  %18 = load i32* %6, align 4
  %19 = load i32** %1, align 8
  %20 = getelementptr inbounds i32* %19, i32 1
  store i32* %20, i32** %1, align 8
  store i32 %18, i32* %19, align 4
  %21 = load i32* %7, align 4
  %22 = load i32** %1, align 8
  %23 = getelementptr inbounds i32* %22, i32 1
  store i32* %23, i32** %1, align 8
  store i32 %21, i32* %22, align 4
  %24 = load i32* %8, align 4
  %25 = load i32** %1, align 8
  %26 = getelementptr inbounds i32* %25, i32 1
  store i32* %26, i32** %1, align 8
  store i32 %24, i32* %25, align 4
  %27 = load i32* %9, align 4
  %28 = load i32** %1, align 8
  %29 = getelementptr inbounds i32* %28, i32 1
  store i32* %29, i32** %1, align 8
  store i32 %27, i32* %28, align 4
  %30 = load i32* %10, align 4
  %31 = load i32** %1, align 8
  %32 = getelementptr inbounds i32* %31, i32 1
  store i32* %32, i32** %1, align 8
  store i32 %30, i32* %31, align 4
  br label %13

; <label>:33                                      ; preds = %13
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #1 {
  %1 = alloca i32, align 4
  %x = alloca [10 x i32], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %1
  %2 = getelementptr inbounds [10 x i32]* %x, i32 0, i32 0
  call void @foo(i32* %2, i32 0, i32 0, i32 0, i16 signext 2, i32 100, i32 200, i32 300, i32 400, i32 500)
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %18, %0
  %4 = load i32* %i, align 4
  %5 = icmp slt i32 %4, 10
  br i1 %5, label %6, label %21

; <label>:6                                       ; preds = %3
  %7 = load i32* %i, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [10 x i32]* %x, i32 0, i64 %8
  %10 = load i32* %9, align 4
  %11 = load i32* %i, align 4
  %12 = srem i32 %11, 5
  %13 = add nsw i32 %12, 1
  %14 = mul nsw i32 %13, 100
  %15 = icmp ne i32 %10, %14
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %6
  call void @abort() #3
  unreachable

; <label>:17                                      ; preds = %6
  br label %18

; <label>:18                                      ; preds = %17
  %19 = load i32* %i, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, i32* %i, align 4
  br label %3

; <label>:21                                      ; preds = %3
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %23 = load i32* %1
  ret i32 %23
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

attributes #0 = { noinline nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
