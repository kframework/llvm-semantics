; ModuleID = './980526-3.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @compare(i32 %x, i32 %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %x, i32* %2, align 4
  store i32 %y, i32* %3, align 4
  %4 = load i32* %2, align 4
  %5 = load i32* %3, align 4
  %6 = icmp eq i32 %4, %5
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  store i32 0, i32* %1
  br label %9

; <label>:8                                       ; preds = %0
  store i32 1, i32* %1
  br label %9

; <label>:9                                       ; preds = %8, %7
  %10 = load i32* %1
  ret i32 %10
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  store i32 0, i32* %1
  store i32 5, i32* %i, align 4
  store i32 2, i32* %j, align 4
  store i32 0, i32* %k, align 4
  store i32 2, i32* %l, align 4
  %2 = load i32* %i, align 4
  %3 = load i32* %j, align 4
  %4 = xor i32 %3, -1
  %5 = urem i32 %2, %4
  %6 = call i32 @compare(i32 5, i32 %5)
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %15, label %8

; <label>:8                                       ; preds = %0
  %9 = load i32* %k, align 4
  %10 = load i32* %l, align 4
  %11 = xor i32 %10, -1
  %12 = urem i32 %9, %11
  %13 = call i32 @compare(i32 0, i32 %12)
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %8, %0
  call void @abort() #2
  unreachable

; <label>:16                                      ; preds = %8
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %18 = load i32* %1
  ret i32 %18
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
