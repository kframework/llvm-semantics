; ModuleID = './20051110-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@bytes = common global [5 x i8] zeroinitializer, align 1

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

; <label>:5                                       ; preds = %27, %0
  %6 = load i64* %o, align 8
  %7 = icmp ne i64 %6, 0
  br i1 %7, label %8, label %30

; <label>:8                                       ; preds = %5
  %9 = load i64* %o, align 8
  %10 = and i64 %9, 127
  %11 = trunc i64 %10 to i8
  %12 = load i32* %n, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [5 x i8]* @bytes, i32 0, i64 %13
  store i8 %11, i8* %14, align 1
  %15 = load i64* %o, align 8
  %16 = lshr i64 %15, 7
  store i64 %16, i64* %o, align 8
  %17 = load i64* %o, align 8
  %18 = icmp ne i64 %17, 0
  br i1 %18, label %19, label %27

; <label>:19                                      ; preds = %8
  %20 = load i32* %n, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [5 x i8]* @bytes, i32 0, i64 %21
  %23 = load i8* %22, align 1
  %24 = zext i8 %23 to i32
  %25 = or i32 %24, 128
  %26 = trunc i32 %25 to i8
  store i8 %26, i8* %22, align 1
  br label %27

; <label>:27                                      ; preds = %19, %8
  %28 = load i32* %n, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, i32* %n, align 4
  br label %5

; <label>:30                                      ; preds = %5
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
