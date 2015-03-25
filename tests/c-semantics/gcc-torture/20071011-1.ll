; ModuleID = './20071011-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define void @foo(i32* %p) #0 {
  %1 = alloca i32*, align 8
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i32* %p, i32** %1, align 8
  %2 = load i32** %1, align 8
  %3 = load i32* %2, align 4
  store i32 %3, i32* %x, align 4
  %4 = load i32** %1, align 8
  store i32 0, i32* %4, align 4
  %5 = load i32** %1, align 8
  %6 = load i32* %5, align 4
  store i32 %6, i32* %y, align 4
  %7 = load i32* %x, align 4
  %8 = load i32* %y, align 4
  %9 = icmp ne i32 %7, %8
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %0
  ret void

; <label>:11                                      ; preds = %0
  call void @abort() #2
  unreachable
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 0, i32* %1
  store i32 1, i32* %a, align 4
  call void @foo(i32* %a)
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
