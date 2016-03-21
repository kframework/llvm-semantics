; ModuleID = './loop-ivopts-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define void @check(i32* %l) #0 {
  %1 = alloca i32*, align 8
  %i = alloca i32, align 4
  store i32* %l, i32** %1, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %32, %0
  %3 = load i32, i32* %i, align 4
  %4 = icmp slt i32 %3, 288
  br i1 %4, label %5, label %35

; <label>:5                                       ; preds = %2
  %6 = load i32, i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = load i32*, i32** %1, align 8
  %9 = getelementptr inbounds i32, i32* %8, i64 %7
  %10 = load i32, i32* %9, align 4
  %11 = load i32, i32* %i, align 4
  %12 = icmp slt i32 %11, 256
  br i1 %12, label %16, label %13

; <label>:13                                      ; preds = %5
  %14 = load i32, i32* %i, align 4
  %15 = icmp sge i32 %14, 280
  br label %16

; <label>:16                                      ; preds = %13, %5
  %17 = phi i1 [ true, %5 ], [ %15, %13 ]
  %18 = zext i1 %17 to i32
  %19 = add nsw i32 7, %18
  %20 = load i32, i32* %i, align 4
  %21 = icmp sge i32 %20, 144
  br i1 %21, label %22, label %25

; <label>:22                                      ; preds = %16
  %23 = load i32, i32* %i, align 4
  %24 = icmp slt i32 %23, 256
  br label %25

; <label>:25                                      ; preds = %22, %16
  %26 = phi i1 [ false, %16 ], [ %24, %22 ]
  %27 = zext i1 %26 to i32
  %28 = add nsw i32 %19, %27
  %29 = icmp ne i32 %10, %28
  br i1 %29, label %30, label %31

; <label>:30                                      ; preds = %25
  call void @abort() #2
  unreachable

; <label>:31                                      ; preds = %25
  br label %32

; <label>:32                                      ; preds = %31
  %33 = load i32, i32* %i, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, i32* %i, align 4
  br label %2

; <label>:35                                      ; preds = %2
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %l = alloca [288 x i32], align 16
  store i32 0, i32* %1
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %9, %0
  %3 = load i32, i32* %i, align 4
  %4 = icmp slt i32 %3, 144
  br i1 %4, label %5, label %12

; <label>:5                                       ; preds = %2
  %6 = load i32, i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [288 x i32], [288 x i32]* %l, i32 0, i64 %7
  store i32 8, i32* %8, align 4
  br label %9

; <label>:9                                       ; preds = %5
  %10 = load i32, i32* %i, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* %i, align 4
  br label %2

; <label>:12                                      ; preds = %2
  br label %13

; <label>:13                                      ; preds = %20, %12
  %14 = load i32, i32* %i, align 4
  %15 = icmp slt i32 %14, 256
  br i1 %15, label %16, label %23

; <label>:16                                      ; preds = %13
  %17 = load i32, i32* %i, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [288 x i32], [288 x i32]* %l, i32 0, i64 %18
  store i32 9, i32* %19, align 4
  br label %20

; <label>:20                                      ; preds = %16
  %21 = load i32, i32* %i, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, i32* %i, align 4
  br label %13

; <label>:23                                      ; preds = %13
  br label %24

; <label>:24                                      ; preds = %31, %23
  %25 = load i32, i32* %i, align 4
  %26 = icmp slt i32 %25, 280
  br i1 %26, label %27, label %34

; <label>:27                                      ; preds = %24
  %28 = load i32, i32* %i, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [288 x i32], [288 x i32]* %l, i32 0, i64 %29
  store i32 7, i32* %30, align 4
  br label %31

; <label>:31                                      ; preds = %27
  %32 = load i32, i32* %i, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %i, align 4
  br label %24

; <label>:34                                      ; preds = %24
  br label %35

; <label>:35                                      ; preds = %42, %34
  %36 = load i32, i32* %i, align 4
  %37 = icmp slt i32 %36, 288
  br i1 %37, label %38, label %45

; <label>:38                                      ; preds = %35
  %39 = load i32, i32* %i, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [288 x i32], [288 x i32]* %l, i32 0, i64 %40
  store i32 8, i32* %41, align 4
  br label %42

; <label>:42                                      ; preds = %38
  %43 = load i32, i32* %i, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, i32* %i, align 4
  br label %35

; <label>:45                                      ; preds = %35
  %46 = getelementptr inbounds [288 x i32], [288 x i32]* %l, i32 0, i32 0
  call void @check(i32* %46)
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
