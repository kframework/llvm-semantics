; ModuleID = './bitfld-4.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@x = global { i8, i8, i8, i8 } { i8 -123, i8 -113, i8 -29, i8 -1 }, align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = load i32* bitcast ({ i8, i8, i8, i8 }* @x to i32*), align 4
  %3 = shl i32 %2, 20
  %4 = ashr i32 %3, 20
  %5 = icmp ne i32 %4, -123
  br i1 %5, label %10, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32* bitcast ({ i8, i8, i8, i8 }* @x to i32*), align 4
  %8 = ashr i32 %7, 12
  %9 = icmp ne i32 %8, -456
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %6, %0
  call void @abort() #2
  unreachable

; <label>:11                                      ; preds = %6
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
