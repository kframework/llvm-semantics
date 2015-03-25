; ModuleID = './pr43269.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@g_261 = common global i32 0, align 4
@g_21 = common global i32 0, align 4
@g_211 = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @func_32(i32 0)
  %2 = load i32* @g_261, align 4
  %3 = icmp ne i32 %2, -1
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:5                                       ; preds = %0
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define internal void @func_32(i32 %b) #1 {
  %1 = alloca i32, align 4
  store i32 %b, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %6

; <label>:4                                       ; preds = %0
  br label %5

; <label>:5                                       ; preds = %15, %4
  store i32 1, i32* @g_21, align 4
  br label %6

; <label>:6                                       ; preds = %5, %0
  store i32 -1, i32* @g_261, align 4
  br label %7

; <label>:7                                       ; preds = %16, %6
  %8 = load i32* @g_261, align 4
  %9 = icmp sgt i32 %8, -2
  br i1 %9, label %10, label %19

; <label>:10                                      ; preds = %7
  %11 = load i32* @g_211, align 4
  %12 = add nsw i32 %11, 1
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %10
  br label %19

; <label>:15                                      ; preds = %10
  store i32 1, i32* @g_21, align 4
  br label %5
                                                  ; No predecessors!
  %17 = load i32* @g_261, align 4
  %18 = add nsw i32 %17, -1
  store i32 %18, i32* @g_261, align 4
  br label %7

; <label>:19                                      ; preds = %14, %7
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
