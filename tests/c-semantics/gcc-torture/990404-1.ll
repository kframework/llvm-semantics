; ModuleID = './990404-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@x = global [10 x i32] [i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9], align 16

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %niterations = alloca i32, align 4
  %i = alloca i32, align 4
  %i1 = alloca i32, align 4
  %mi = alloca i32, align 4
  %max = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %niterations, align 4
  br label %2

; <label>:2                                       ; preds = %36, %0
  store i32 0, i32* %max, align 4
  store i32 0, i32* %i1, align 4
  br label %3

; <label>:3                                       ; preds = %20, %2
  %4 = load i32* %i1, align 4
  %5 = icmp slt i32 %4, 10
  br i1 %5, label %6, label %23

; <label>:6                                       ; preds = %3
  %7 = load i32* %i1, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [10 x i32]* @x, i32 0, i64 %8
  %10 = load i32* %9, align 4
  %11 = load i32* %max, align 4
  %12 = icmp sgt i32 %10, %11
  br i1 %12, label %13, label %19

; <label>:13                                      ; preds = %6
  %14 = load i32* %i1, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [10 x i32]* @x, i32 0, i64 %15
  %17 = load i32* %16, align 4
  store i32 %17, i32* %max, align 4
  %18 = load i32* %i1, align 4
  store i32 %18, i32* %mi, align 4
  br label %19

; <label>:19                                      ; preds = %13, %6
  br label %20

; <label>:20                                      ; preds = %19
  %21 = load i32* %i1, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, i32* %i1, align 4
  br label %3

; <label>:23                                      ; preds = %3
  %24 = load i32* %max, align 4
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %26, label %27

; <label>:26                                      ; preds = %23
  br label %37

; <label>:27                                      ; preds = %23
  %28 = load i32* %mi, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [10 x i32]* @x, i32 0, i64 %29
  store i32 0, i32* %30, align 4
  %31 = load i32* %niterations, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, i32* %niterations, align 4
  %33 = load i32* %niterations, align 4
  %34 = icmp sgt i32 %33, 10
  br i1 %34, label %35, label %36

; <label>:35                                      ; preds = %27
  call void @abort() #2
  unreachable

; <label>:36                                      ; preds = %27
  br label %2

; <label>:37                                      ; preds = %26
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %39 = load i32* %1
  ret i32 %39
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
