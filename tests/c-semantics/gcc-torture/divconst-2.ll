; ModuleID = './divconst-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@nums = global [3 x i64] [i64 -1, i64 2147483647, i64 -2147483648], align 16

; Function Attrs: nounwind uwtable
define i64 @f(i64 %x) #0 {
  %1 = alloca i64, align 8
  store i64 %x, i64* %1, align 8
  %2 = load i64* %1, align 8
  %3 = sdiv i64 %2, -2147483648
  ret i64 %3
}

; Function Attrs: nounwind uwtable
define i64 @r(i64 %x) #0 {
  %1 = alloca i64, align 8
  store i64 %x, i64* %1, align 8
  %2 = load i64* %1, align 8
  %3 = srem i64 %2, -2147483648
  ret i64 %3
}

; Function Attrs: nounwind uwtable
define i64 @std_eqn(i64 %num, i64 %denom, i64 %quot, i64 %rem) #0 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store i64 %num, i64* %1, align 8
  store i64 %denom, i64* %2, align 8
  store i64 %quot, i64* %3, align 8
  store i64 %rem, i64* %4, align 8
  %5 = load i64* %3, align 8
  %6 = mul nsw i64 %5, -2147483648
  %7 = load i64* %4, align 8
  %8 = add nsw i64 %6, %7
  %9 = load i64* %1, align 8
  %10 = icmp eq i64 %8, %9
  %11 = zext i1 %10 to i32
  %12 = sext i32 %11 to i64
  ret i64 %12
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %25, %0
  %3 = load i32* %i, align 4
  %4 = sext i32 %3 to i64
  %5 = icmp ult i64 %4, 3
  br i1 %5, label %6, label %28

; <label>:6                                       ; preds = %2
  %7 = load i32* %i, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [3 x i64]* @nums, i32 0, i64 %8
  %10 = load i64* %9, align 8
  %11 = load i32* %i, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [3 x i64]* @nums, i32 0, i64 %12
  %14 = load i64* %13, align 8
  %15 = call i64 @f(i64 %14)
  %16 = load i32* %i, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [3 x i64]* @nums, i32 0, i64 %17
  %19 = load i64* %18, align 8
  %20 = call i64 @r(i64 %19)
  %21 = call i64 @std_eqn(i64 %10, i64 -2147483648, i64 %15, i64 %20)
  %22 = icmp eq i64 %21, 0
  br i1 %22, label %23, label %24

; <label>:23                                      ; preds = %6
  call void @abort() #2
  unreachable

; <label>:24                                      ; preds = %6
  br label %25

; <label>:25                                      ; preds = %24
  %26 = load i32* %i, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %i, align 4
  br label %2

; <label>:28                                      ; preds = %2
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %30 = load i32* %1
  ret i32 %30
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
