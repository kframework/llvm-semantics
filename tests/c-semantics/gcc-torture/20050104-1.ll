; ModuleID = './20050104-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define void @foo(i64 %j) #0 {
  %1 = alloca i64, align 8
  store i64 %j, i64* %1, align 8
  %2 = load i64* %1, align 8
  %3 = icmp sgt i64 %2, 10
  br i1 %3, label %8, label %4

; <label>:4                                       ; preds = %0
  %5 = load i64* %1, align 8
  %6 = call i64 @min()
  %7 = icmp slt i64 %5, %6
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %4, %0
  call void @abort() #2
  unreachable

; <label>:9                                       ; preds = %4
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @foo(i64 10)
  ret i32 0
}

; Function Attrs: nounwind uwtable
define internal i64 @min() #0 {
  ret i64 -9223372036854775808
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
