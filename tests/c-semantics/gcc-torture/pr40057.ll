; ModuleID = './pr40057.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define i32 @foo(i64 %x) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %y = alloca i64, align 8
  store i64 %x, i64* %2, align 8
  %3 = load i64* %2, align 8
  %4 = lshr i64 %3, 31
  %5 = and i64 %4, 1
  store i64 %5, i64* %y, align 8
  %6 = load i64* %y, align 8
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %0
  store i32 0, i32* %1
  br label %10

; <label>:9                                       ; preds = %0
  store i32 -1, i32* %1
  br label %10

; <label>:10                                      ; preds = %9, %8
  %11 = load i32* %1
  ret i32 %11
}

; Function Attrs: noinline nounwind uwtable
define i32 @bar(i64 %x) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %y = alloca i64, align 8
  store i64 %x, i64* %2, align 8
  %3 = load i64* %2, align 8
  %4 = ashr i64 %3, 31
  %5 = and i64 %4, 1
  store i64 %5, i64* %y, align 8
  %6 = load i64* %y, align 8
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %0
  store i32 0, i32* %1
  br label %10

; <label>:9                                       ; preds = %0
  store i32 -1, i32* %1
  br label %10

; <label>:10                                      ; preds = %9, %8
  %11 = load i32* %1
  ret i32 %11
}

; Function Attrs: nounwind uwtable
define i32 @main() #1 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @foo(i64 6042589866)
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:5                                       ; preds = %0
  %6 = call i32 @foo(i64 6579460778)
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %9, label %8

; <label>:8                                       ; preds = %5
  call void @abort() #3
  unreachable

; <label>:9                                       ; preds = %5
  %10 = call i32 @bar(i64 6042589866)
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %9
  call void @abort() #3
  unreachable

; <label>:13                                      ; preds = %9
  %14 = call i32 @bar(i64 6579460778)
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %17, label %16

; <label>:16                                      ; preds = %13
  call void @abort() #3
  unreachable

; <label>:17                                      ; preds = %13
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

attributes #0 = { noinline nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
