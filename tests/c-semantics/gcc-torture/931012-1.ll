; ModuleID = './931012-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @f(i32 %b, i32 %c) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %b, i32* %1, align 4
  store i32 %c, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %5, label %12

; <label>:5                                       ; preds = %0
  %6 = load i32* %1, align 4
  %7 = icmp ne i32 %6, 1
  br i1 %7, label %8, label %12

; <label>:8                                       ; preds = %5
  %9 = load i32* %2, align 4
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %8
  store i32 0, i32* %1, align 4
  br label %12

; <label>:12                                      ; preds = %11, %8, %5, %0
  %13 = load i32* %1, align 4
  ret i32 %13
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @f(i32 1, i32 2)
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %5, label %4

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
