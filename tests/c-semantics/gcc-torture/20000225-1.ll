; ModuleID = './20000225-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %nResult = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %b, align 4
  store i32 -1, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %13, %0
  %3 = load i32* %b, align 4
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %2
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %2
  store i32 0, i32* %nResult, align 4
  br label %7

; <label>:7                                       ; preds = %6
  %8 = load i32* %i, align 4
  %9 = add nsw i32 %8, 1
  store i32 %9, i32* %i, align 4
  %10 = load i32* %i, align 4
  %11 = add nsw i32 %10, 2
  %12 = mul nsw i32 %11, 4
  store i32 %12, i32* %b, align 4
  br label %13

; <label>:13                                      ; preds = %7
  %14 = load i32* %i, align 4
  %15 = icmp slt i32 %14, 0
  br i1 %15, label %2, label %16

; <label>:16                                      ; preds = %13
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
