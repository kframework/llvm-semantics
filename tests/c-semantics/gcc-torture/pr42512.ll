; ModuleID = './pr42512.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@g_3 = common global i16 0, align 2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %l_2 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 -1, i32* %l_2, align 4
  br label %2

; <label>:2                                       ; preds = %11, %0
  %3 = load i32* %l_2, align 4
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %5, label %16

; <label>:5                                       ; preds = %2
  %6 = load i32* %l_2, align 4
  %7 = load i16* @g_3, align 2
  %8 = sext i16 %7 to i32
  %9 = or i32 %8, %6
  %10 = trunc i32 %9 to i16
  store i16 %10, i16* @g_3, align 2
  br label %11

; <label>:11                                      ; preds = %5
  %12 = load i32* %l_2, align 4
  %13 = sub nsw i32 %12, 1
  %14 = trunc i32 %13 to i8
  %15 = zext i8 %14 to i32
  store i32 %15, i32* %l_2, align 4
  br label %2

; <label>:16                                      ; preds = %2
  %17 = load i16* @g_3, align 2
  %18 = sext i16 %17 to i32
  %19 = icmp ne i32 %18, -1
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %16
  call void @abort() #2
  unreachable

; <label>:21                                      ; preds = %16
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
