; ModuleID = './20051110-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@bytes = common global [5 x i8] zeroinitializer, align 1
@flag = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @add_unwind_adjustsp(i64 %offset) #0 {
  %1 = alloca i64, align 8
  %n = alloca i32, align 4
  %o = alloca i64, align 8
  store i64 %offset, i64* %1, align 8
  %2 = load i64* %1, align 8
  %3 = sub nsw i64 %2, 516
  %4 = ashr i64 %3, 2
  store i64 %4, i64* %o, align 8
  store i32 0, i32* %n, align 4
  br label %5

; <label>:5                                       ; preds = %32, %0
  br label %6

; <label>:6                                       ; preds = %27, %5
  %7 = load i64* %o, align 8
  %8 = and i64 %7, 127
  %9 = trunc i64 %8 to i8
  %10 = load i32* %n, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [5 x i8]* @bytes, i32 0, i64 %11
  store i8 %9, i8* %12, align 1
  %13 = load i64* %o, align 8
  %14 = lshr i64 %13, 7
  store i64 %14, i64* %o, align 8
  %15 = load i64* %o, align 8
  %16 = icmp ne i64 %15, 0
  br i1 %16, label %17, label %29

; <label>:17                                      ; preds = %6
  %18 = load i32* %n, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [5 x i8]* @bytes, i32 0, i64 %19
  %21 = load i8* %20, align 1
  %22 = zext i8 %21 to i32
  %23 = or i32 %22, 128
  %24 = trunc i32 %23 to i8
  store i8 %24, i8* %20, align 1
  %25 = load i32* @flag, align 4
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %27, label %28

; <label>:27                                      ; preds = %17
  br label %6

; <label>:28                                      ; preds = %17
  br label %29

; <label>:29                                      ; preds = %28, %6
  %30 = load i32* %n, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, i32* %n, align 4
  br label %32

; <label>:32                                      ; preds = %29
  %33 = load i64* %o, align 8
  %34 = icmp ne i64 %33, 0
  br i1 %34, label %5, label %35

; <label>:35                                      ; preds = %32
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @add_unwind_adjustsp(i64 4132)
  %2 = load i8* getelementptr inbounds ([5 x i8]* @bytes, i32 0, i64 0), align 1
  %3 = zext i8 %2 to i32
  %4 = icmp ne i32 %3, 136
  br i1 %4, label %9, label %5

; <label>:5                                       ; preds = %0
  %6 = load i8* getelementptr inbounds ([5 x i8]* @bytes, i32 0, i64 1), align 1
  %7 = zext i8 %6 to i32
  %8 = icmp ne i32 %7, 7
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %5, %0
  call void @abort() #2
  unreachable

; <label>:10                                      ; preds = %5
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
