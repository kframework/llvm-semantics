; ModuleID = './961206-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @sub1(i64 %i) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  store i64 %i, i64* %2, align 8
  %3 = load i64* %2, align 8
  %4 = icmp ult i64 %3, 2147483648
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  store i32 1, i32* %1
  br label %7

; <label>:6                                       ; preds = %0
  store i32 0, i32* %1
  br label %7

; <label>:7                                       ; preds = %6, %5
  %8 = load i32* %1
  ret i32 %8
}

; Function Attrs: nounwind uwtable
define i32 @sub2(i64 %i) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  store i64 %i, i64* %2, align 8
  %3 = load i64* %2, align 8
  %4 = icmp ule i64 %3, 2147483647
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  store i32 1, i32* %1
  br label %7

; <label>:6                                       ; preds = %0
  store i32 0, i32* %1
  br label %7

; <label>:7                                       ; preds = %6, %5
  %8 = load i32* %1
  ret i32 %8
}

; Function Attrs: nounwind uwtable
define i32 @sub3(i64 %i) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  store i64 %i, i64* %2, align 8
  %3 = load i64* %2, align 8
  %4 = icmp uge i64 %3, 2147483648
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  store i32 0, i32* %1
  br label %7

; <label>:6                                       ; preds = %0
  store i32 1, i32* %1
  br label %7

; <label>:7                                       ; preds = %6, %5
  %8 = load i32* %1
  ret i32 %8
}

; Function Attrs: nounwind uwtable
define i32 @sub4(i64 %i) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  store i64 %i, i64* %2, align 8
  %3 = load i64* %2, align 8
  %4 = icmp ugt i64 %3, 2147483647
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  store i32 0, i32* %1
  br label %7

; <label>:6                                       ; preds = %0
  store i32 1, i32* %1
  br label %7

; <label>:7                                       ; preds = %6, %5
  %8 = load i32* %1
  ret i32 %8
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @sub1(i64 2147483648)
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  %6 = call i32 @sub2(i64 2147483648)
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5
  call void @abort() #2
  unreachable

; <label>:9                                       ; preds = %5
  %10 = call i32 @sub3(i64 2147483648)
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %9
  call void @abort() #2
  unreachable

; <label>:13                                      ; preds = %9
  %14 = call i32 @sub4(i64 2147483648)
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %13
  call void @abort() #2
  unreachable

; <label>:17                                      ; preds = %13
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %19 = load i32* %1
  ret i32 %19
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
