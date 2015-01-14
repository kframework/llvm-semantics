; ModuleID = './20020911-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@c = global i16 -32768, align 2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = load i16* @c, align 2
  %3 = zext i16 %2 to i32
  %4 = sub nsw i32 %3, 32768
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %11, label %6

; <label>:6                                       ; preds = %0
  %7 = load i16* @c, align 2
  %8 = zext i16 %7 to i32
  %9 = sub nsw i32 %8, 32768
  %10 = icmp sgt i32 %9, 32767
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %6, %0
  call void @abort() #2
  unreachable

; <label>:12                                      ; preds = %6
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
