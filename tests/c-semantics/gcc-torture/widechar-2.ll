; ModuleID = './widechar-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@ws = constant [4 x i32] [i32 102, i32 111, i32 111, i32 0], align 16

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = load i32* getelementptr inbounds ([4 x i32]* @ws, i32 0, i64 0), align 4
  %3 = icmp ne i32 %2, 102
  br i1 %3, label %13, label %4

; <label>:4                                       ; preds = %0
  %5 = load i32* getelementptr inbounds ([4 x i32]* @ws, i32 0, i64 1), align 4
  %6 = icmp ne i32 %5, 111
  br i1 %6, label %13, label %7

; <label>:7                                       ; preds = %4
  %8 = load i32* getelementptr inbounds ([4 x i32]* @ws, i32 0, i64 2), align 4
  %9 = icmp ne i32 %8, 111
  br i1 %9, label %13, label %10

; <label>:10                                      ; preds = %7
  %11 = load i32* getelementptr inbounds ([4 x i32]* @ws, i32 0, i64 3), align 4
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %10, %7, %4, %0
  call void @abort() #2
  unreachable

; <label>:14                                      ; preds = %10
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %16 = load i32* %1
  ret i32 %16
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
