; ModuleID = './insertion-sort.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@main.a = private unnamed_addr constant [5 x i32] [i32 5, i32 1, i32 9, i32 3, i32 2], align 16

; Function Attrs: nounwind uwtable
define void @insertion_sort(i32* %a, i32 %length) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %v = alloca i32, align 4
  store i32* %a, i32** %1, align 8
  store i32 %length, i32* %2, align 4
  store i32 1, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %48, %0
  %4 = load i32, i32* %i, align 4
  %5 = load i32, i32* %2, align 4
  %6 = icmp slt i32 %4, %5
  br i1 %6, label %7, label %51

; <label>:7                                       ; preds = %3
  %8 = load i32, i32* %i, align 4
  %9 = sext i32 %8 to i64
  %10 = load i32*, i32** %1, align 8
  %11 = getelementptr inbounds i32, i32* %10, i64 %9
  %12 = load i32, i32* %11, align 4
  store i32 %12, i32* %v, align 4
  %13 = load i32, i32* %i, align 4
  %14 = sub nsw i32 %13, 1
  store i32 %14, i32* %j, align 4
  br label %15

; <label>:15                                      ; preds = %38, %7
  %16 = load i32, i32* %j, align 4
  %17 = icmp sgt i32 %16, 0
  br i1 %17, label %18, label %41

; <label>:18                                      ; preds = %15
  %19 = load i32, i32* %j, align 4
  %20 = sext i32 %19 to i64
  %21 = load i32*, i32** %1, align 8
  %22 = getelementptr inbounds i32, i32* %21, i64 %20
  %23 = load i32, i32* %22, align 4
  %24 = load i32, i32* %v, align 4
  %25 = icmp sle i32 %23, %24
  br i1 %25, label %26, label %27

; <label>:26                                      ; preds = %18
  br label %41

; <label>:27                                      ; preds = %18
  %28 = load i32, i32* %j, align 4
  %29 = sext i32 %28 to i64
  %30 = load i32*, i32** %1, align 8
  %31 = getelementptr inbounds i32, i32* %30, i64 %29
  %32 = load i32, i32* %31, align 4
  %33 = load i32, i32* %j, align 4
  %34 = add nsw i32 %33, 1
  %35 = sext i32 %34 to i64
  %36 = load i32*, i32** %1, align 8
  %37 = getelementptr inbounds i32, i32* %36, i64 %35
  store i32 %32, i32* %37, align 4
  br label %38

; <label>:38                                      ; preds = %27
  %39 = load i32, i32* %j, align 4
  %40 = add nsw i32 %39, -1
  store i32 %40, i32* %j, align 4
  br label %15

; <label>:41                                      ; preds = %26, %15
  %42 = load i32, i32* %v, align 4
  %43 = load i32, i32* %j, align 4
  %44 = add nsw i32 %43, 1
  %45 = sext i32 %44 to i64
  %46 = load i32*, i32** %1, align 8
  %47 = getelementptr inbounds i32, i32* %46, i64 %45
  store i32 %42, i32* %47, align 4
  br label %48

; <label>:48                                      ; preds = %41
  %49 = load i32, i32* %i, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, i32* %i, align 4
  br label %3

; <label>:51                                      ; preds = %3
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @checkThatArrayIsSorted(i32* %array, i32 %length) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32, align 4
  %sorted = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %array, i32** %1, align 8
  store i32 %length, i32* %2, align 4
  store i32 0, i32* %sorted, align 4
  store i32 1, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %24, %0
  %4 = load i32, i32* %i, align 4
  %5 = load i32, i32* %2, align 4
  %6 = icmp slt i32 %4, %5
  br i1 %6, label %7, label %27

; <label>:7                                       ; preds = %3
  %8 = load i32, i32* %i, align 4
  %9 = sub nsw i32 %8, 1
  %10 = sext i32 %9 to i64
  %11 = load i32*, i32** %1, align 8
  %12 = getelementptr inbounds i32, i32* %11, i64 %10
  %13 = load i32, i32* %12, align 4
  %14 = load i32, i32* %i, align 4
  %15 = sext i32 %14 to i64
  %16 = load i32*, i32** %1, align 8
  %17 = getelementptr inbounds i32, i32* %16, i64 %15
  %18 = load i32, i32* %17, align 4
  %19 = icmp sle i32 %13, %18
  br i1 %19, label %20, label %23

; <label>:20                                      ; preds = %7
  %21 = load i32, i32* %sorted, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, i32* %sorted, align 4
  br label %23

; <label>:23                                      ; preds = %20, %7
  br label %24

; <label>:24                                      ; preds = %23
  %25 = load i32, i32* %i, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %i, align 4
  br label %3

; <label>:27                                      ; preds = %3
  %28 = load i32, i32* %sorted, align 4
  ret i32 %28
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %a = alloca [5 x i32], align 16
  store i32 0, i32* %1
  %2 = bitcast [5 x i32]* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast ([5 x i32]* @main.a to i8*), i64 20, i32 16, i1 false)
  %3 = getelementptr inbounds [5 x i32], [5 x i32]* %a, i32 0, i32 0
  call void @insertion_sort(i32* %3, i32 5)
  store i32 0, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %9, %0
  %5 = load i32, i32* %i, align 4
  %6 = zext i32 %5 to i64
  %7 = icmp ult i64 %6, 5
  br i1 %7, label %8, label %12

; <label>:8                                       ; preds = %4
  br label %9

; <label>:9                                       ; preds = %8
  %10 = load i32, i32* %i, align 4
  %11 = add i32 %10, 1
  store i32 %11, i32* %i, align 4
  br label %4

; <label>:12                                      ; preds = %4
  %13 = getelementptr inbounds [5 x i32], [5 x i32]* %a, i32 0, i32 0
  %14 = call i32 @checkThatArrayIsSorted(i32* %13, i32 5)
  ret i32 %14
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
