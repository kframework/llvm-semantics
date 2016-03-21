; ModuleID = './loop-13.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define void @scale(i64* %alpha, i64* %x, i32 %n) #0 {
  %1 = alloca i64*, align 8
  %2 = alloca i64*, align 8
  %3 = alloca i32, align 4
  %i = alloca i32, align 4
  %ix = alloca i32, align 4
  %tmpr = alloca i64, align 8
  %tmpi = alloca i64, align 8
  store i64* %alpha, i64** %1, align 8
  store i64* %x, i64** %2, align 8
  store i32 %n, i32* %3, align 4
  %4 = load i64*, i64** %1, align 8
  %5 = load i64, i64* %4, align 8
  %6 = icmp ne i64 %5, 1
  br i1 %6, label %7, label %47

; <label>:7                                       ; preds = %0
  store i32 0, i32* %i, align 4
  store i32 0, i32* %ix, align 4
  br label %8

; <label>:8                                       ; preds = %41, %7
  %9 = load i32, i32* %i, align 4
  %10 = load i32, i32* %3, align 4
  %11 = icmp slt i32 %9, %10
  br i1 %11, label %12, label %46

; <label>:12                                      ; preds = %8
  %13 = load i64*, i64** %1, align 8
  %14 = load i64, i64* %13, align 8
  %15 = load i32, i32* %ix, align 4
  %16 = sext i32 %15 to i64
  %17 = load i64*, i64** %2, align 8
  %18 = getelementptr inbounds i64, i64* %17, i64 %16
  %19 = load i64, i64* %18, align 8
  %20 = mul nsw i64 %14, %19
  store i64 %20, i64* %tmpr, align 8
  %21 = load i64*, i64** %1, align 8
  %22 = load i64, i64* %21, align 8
  %23 = load i32, i32* %ix, align 4
  %24 = add nsw i32 %23, 1
  %25 = sext i32 %24 to i64
  %26 = load i64*, i64** %2, align 8
  %27 = getelementptr inbounds i64, i64* %26, i64 %25
  %28 = load i64, i64* %27, align 8
  %29 = mul nsw i64 %22, %28
  store i64 %29, i64* %tmpi, align 8
  %30 = load i64, i64* %tmpr, align 8
  %31 = load i32, i32* %ix, align 4
  %32 = sext i32 %31 to i64
  %33 = load i64*, i64** %2, align 8
  %34 = getelementptr inbounds i64, i64* %33, i64 %32
  store i64 %30, i64* %34, align 8
  %35 = load i64, i64* %tmpi, align 8
  %36 = load i32, i32* %ix, align 4
  %37 = add nsw i32 %36, 1
  %38 = sext i32 %37 to i64
  %39 = load i64*, i64** %2, align 8
  %40 = getelementptr inbounds i64, i64* %39, i64 %38
  store i64 %35, i64* %40, align 8
  br label %41

; <label>:41                                      ; preds = %12
  %42 = load i32, i32* %i, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* %i, align 4
  %44 = load i32, i32* %ix, align 4
  %45 = add nsw i32 %44, 2
  store i32 %45, i32* %ix, align 4
  br label %8

; <label>:46                                      ; preds = %8
  br label %47

; <label>:47                                      ; preds = %46, %0
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %x = alloca [10 x i64], align 16
  %alpha = alloca i64, align 8
  store i32 0, i32* %1
  store i64 2, i64* %alpha, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %11, %0
  %3 = load i32, i32* %i, align 4
  %4 = icmp slt i32 %3, 10
  br i1 %4, label %5, label %14

; <label>:5                                       ; preds = %2
  %6 = load i32, i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = load i32, i32* %i, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [10 x i64], [10 x i64]* %x, i32 0, i64 %9
  store i64 %7, i64* %10, align 8
  br label %11

; <label>:11                                      ; preds = %5
  %12 = load i32, i32* %i, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, i32* %i, align 4
  br label %2

; <label>:14                                      ; preds = %2
  %15 = getelementptr inbounds [10 x i64], [10 x i64]* %x, i32 0, i32 0
  call void @scale(i64* %alpha, i64* %15, i32 5)
  %16 = getelementptr inbounds [10 x i64], [10 x i64]* %x, i32 0, i64 9
  %17 = load i64, i64* %16, align 8
  %18 = icmp ne i64 %17, 18
  br i1 %18, label %19, label %20

; <label>:19                                      ; preds = %14
  call void @abort() #2
  unreachable

; <label>:20                                      ; preds = %14
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
