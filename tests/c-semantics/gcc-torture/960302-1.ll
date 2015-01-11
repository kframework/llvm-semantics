; ModuleID = './960302-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@a = global i64 1, align 8

; Function Attrs: nounwind uwtable
define i32 @foo() #0 {
  %1 = alloca i32, align 4
  %2 = load i64* @a, align 8
  %3 = srem i64 %2, 2
  %4 = srem i64 %3, 2
  %5 = srem i64 %4, 2
  %6 = srem i64 %5, 2
  %7 = srem i64 %6, 2
  %8 = srem i64 %7, 2
  %9 = srem i64 %8, 2
  %10 = srem i64 %9, 2
  switch i64 %10, label %13 [
    i64 0, label %11
    i64 1, label %12
  ]

; <label>:11                                      ; preds = %0
  store i32 0, i32* %1
  br label %14

; <label>:12                                      ; preds = %0
  store i32 1, i32* %1
  br label %14

; <label>:13                                      ; preds = %0
  store i32 -1, i32* %1
  br label %14

; <label>:14                                      ; preds = %13, %12, %11
  %15 = load i32* %1
  ret i32 %15
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @foo()
  %3 = icmp ne i32 %2, 1
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %7 = load i32* %1
  ret i32 %7
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
