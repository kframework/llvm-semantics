; ModuleID = './950511-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %xx = alloca i64, align 8
  %x = alloca i64*, align 8
  store i32 0, i32* %1
  store i64* %xx, i64** %x, align 8
  %2 = load i64** %x, align 8
  store i64 -3, i64* %2, align 8
  %3 = load i64** %x, align 8
  %4 = load i64* %3, align 8
  %5 = load i64** %x, align 8
  %6 = load i64* %5, align 8
  %7 = mul i64 %4, %6
  %8 = load i64** %x, align 8
  store i64 %7, i64* %8, align 8
  %9 = load i64** %x, align 8
  %10 = load i64* %9, align 8
  %11 = icmp ne i64 %10, 9
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %0
  call void @abort() #2
  unreachable

; <label>:13                                      ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %15 = load i32* %1
  ret i32 %15
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
