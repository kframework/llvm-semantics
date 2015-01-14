; ModuleID = './20030916-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define void @f(i32* %x) #0 {
  %1 = alloca i32*, align 8
  %i = alloca i8, align 1
  %j = alloca i32, align 4
  store i32* %x, i32** %1, align 8
  store i8 16, i8* %i, align 1
  store i32 0, i32* %j, align 4
  br label %2

; <label>:2                                       ; preds = %18, %0
  %3 = load i32* %j, align 4
  %4 = icmp slt i32 %3, 16
  br i1 %4, label %5, label %21

; <label>:5                                       ; preds = %2
  %6 = load i8* %i, align 1
  %7 = zext i8 %6 to i32
  %8 = add nsw i32 %7, 232
  %9 = trunc i32 %8 to i8
  store i8 %9, i8* %i, align 1
  %10 = load i8* %i, align 1
  %11 = zext i8 %10 to i64
  %12 = load i32** %1, align 8
  %13 = getelementptr inbounds i32* %12, i64 %11
  store i32 0, i32* %13, align 4
  %14 = load i8* %i, align 1
  %15 = zext i8 %14 to i32
  %16 = sub nsw i32 %15, 231
  %17 = trunc i32 %16 to i8
  store i8 %17, i8* %i, align 1
  br label %18

; <label>:18                                      ; preds = %5
  %19 = load i32* %j, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, i32* %j, align 4
  br label %2

; <label>:21                                      ; preds = %2
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca [256 x i32], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %9, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 256
  br i1 %4, label %5, label %12

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [256 x i32]* %x, i32 0, i64 %7
  store i32 1, i32* %8, align 4
  br label %9

; <label>:9                                       ; preds = %5
  %10 = load i32* %i, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* %i, align 4
  br label %2

; <label>:12                                      ; preds = %2
  %13 = getelementptr inbounds [256 x i32]* %x, i32 0, i32 0
  call void @f(i32* %13)
  store i32 0, i32* %i, align 4
  br label %14

; <label>:14                                      ; preds = %33, %12
  %15 = load i32* %i, align 4
  %16 = icmp slt i32 %15, 256
  br i1 %16, label %17, label %36

; <label>:17                                      ; preds = %14
  %18 = load i32* %i, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [256 x i32]* %x, i32 0, i64 %19
  %21 = load i32* %20, align 4
  %22 = load i32* %i, align 4
  %23 = icmp sge i32 %22, 8
  br i1 %23, label %24, label %27

; <label>:24                                      ; preds = %17
  %25 = load i32* %i, align 4
  %26 = icmp slt i32 %25, 248
  br label %27

; <label>:27                                      ; preds = %24, %17
  %28 = phi i1 [ false, %17 ], [ %26, %24 ]
  %29 = zext i1 %28 to i32
  %30 = icmp ne i32 %21, %29
  br i1 %30, label %31, label %32

; <label>:31                                      ; preds = %27
  call void @abort() #2
  unreachable

; <label>:32                                      ; preds = %27
  br label %33

; <label>:33                                      ; preds = %32
  %34 = load i32* %i, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, i32* %i, align 4
  br label %14

; <label>:36                                      ; preds = %14
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %38 = load i32* %1
  ret i32 %38
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
