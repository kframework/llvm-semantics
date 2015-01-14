; ModuleID = './981001-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@flg = global i64 0, align 8

; Function Attrs: nounwind uwtable
define i64 @sub(i32 %n) #0 {
  %1 = alloca i64, align 8
  %2 = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 %n, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp sge i32 %3, 2
  br i1 %4, label %5, label %43

; <label>:5                                       ; preds = %0
  %6 = load i32* %2, align 4
  %7 = srem i32 %6, 2
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %25

; <label>:9                                       ; preds = %5
  %10 = load i32* %2, align 4
  %11 = sdiv i32 %10, 2
  %12 = call i64 @sub(i32 %11)
  %13 = trunc i64 %12 to i32
  store i32 %13, i32* %a, align 4
  %14 = load i32* %a, align 4
  %15 = sext i32 %14 to i64
  %16 = load i32* %2, align 4
  %17 = sdiv i32 %16, 2
  %18 = sub nsw i32 %17, 1
  %19 = call i64 @sub(i32 %18)
  %20 = mul nsw i64 2, %19
  %21 = add nsw i64 %15, %20
  %22 = load i32* %a, align 4
  %23 = sext i32 %22 to i64
  %24 = mul nsw i64 %21, %23
  store i64 %24, i64* %1
  br label %46

; <label>:25                                      ; preds = %5
  %26 = load i32* %2, align 4
  %27 = sdiv i32 %26, 2
  %28 = add nsw i32 %27, 1
  %29 = call i64 @sub(i32 %28)
  %30 = trunc i64 %29 to i32
  store i32 %30, i32* %a, align 4
  %31 = load i32* %2, align 4
  %32 = sdiv i32 %31, 2
  %33 = call i64 @sub(i32 %32)
  %34 = trunc i64 %33 to i32
  store i32 %34, i32* %b, align 4
  %35 = load i32* %a, align 4
  %36 = load i32* %a, align 4
  %37 = mul nsw i32 %35, %36
  %38 = load i32* %b, align 4
  %39 = load i32* %b, align 4
  %40 = mul nsw i32 %38, %39
  %41 = add nsw i32 %37, %40
  %42 = sext i32 %41 to i64
  store i64 %42, i64* %1
  br label %46

; <label>:43                                      ; preds = %0
  %44 = load i32* %2, align 4
  %45 = sext i32 %44 to i64
  store i64 %45, i64* %1
  br label %46

; <label>:46                                      ; preds = %43, %25, %9
  %47 = load i64* %1
  ret i64 %47
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i64 @sub(i32 30)
  %3 = icmp ne i64 %2, 832040
  br i1 %3, label %4, label %7

; <label>:4                                       ; preds = %0
  %5 = load i64* @flg, align 8
  %6 = or i64 %5, 256
  store i64 %6, i64* @flg, align 8
  br label %7

; <label>:7                                       ; preds = %4, %0
  %8 = load i64* @flg, align 8
  %9 = icmp ne i64 %8, 0
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %7
  call void @abort() #2
  unreachable

; <label>:11                                      ; preds = %7
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %13 = load i32* %1
  ret i32 %13
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
