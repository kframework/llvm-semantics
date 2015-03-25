; ModuleID = './pr37125.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define void @func_44(i32 %p_45) #0 {
  %1 = alloca i32, align 4
  store i32 %p_45, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = mul i32 %2, -9
  %4 = call i32 @mod_rhs(i32 -9)
  %5 = urem i32 %3, %4
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %8, label %7

; <label>:7                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:8                                       ; preds = %0
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define internal i32 @mod_rhs(i32 %rhs) #1 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %rhs, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  store i32 1, i32* %1
  br label %8

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  store i32 %7, i32* %1
  br label %8

; <label>:8                                       ; preds = %6, %5
  %9 = load i32* %1
  ret i32 %9
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @func_44(i32 2)
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { inlinehint nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
