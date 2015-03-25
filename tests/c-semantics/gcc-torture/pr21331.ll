; ModuleID = './pr21331.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @bar() #0 {
  ret i32 -1
}

; Function Attrs: nounwind uwtable
define i64 @foo() #0 {
  %1 = alloca i64, align 8
  %retval = alloca i64, align 8
  %2 = call i32 @bar()
  %3 = sext i32 %2 to i64
  store i64 %3, i64* %retval, align 8
  %4 = load i64* %retval, align 8
  %5 = icmp eq i64 %4, -1
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  store i64 0, i64* %1
  br label %8

; <label>:7                                       ; preds = %0
  store i64 3, i64* %1
  br label %8

; <label>:8                                       ; preds = %7, %6
  %9 = load i64* %1
  ret i64 %9
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i64 @foo()
  %3 = icmp ne i64 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
