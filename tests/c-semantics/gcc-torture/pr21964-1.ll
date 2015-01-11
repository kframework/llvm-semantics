; ModuleID = './pr21964-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define void @foo(i32 %n, i32 %m) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  store i32 %m, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable

; <label>:6                                       ; preds = %0
  %7 = load i32* %1, align 4
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %6
  call void @abort() #2
  unreachable

; <label>:10                                      ; preds = %6
  %11 = load i32* %1, align 4
  %12 = add nsw i32 %11, 1
  store i32 %12, i32* %1, align 4
  %13 = load i32* %2, align 4
  %14 = sub nsw i32 %13, 1
  call void @foo(i32 %11, i32 %14)
  br label %15

; <label>:15                                      ; preds = %10
  br label %16

; <label>:16                                      ; preds = %15
  ret void
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  call void @foo(i32 0, i32 4)
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
