; ModuleID = './920506-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@l = global [2 x i32] [i32 0, i32 1], align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %p = alloca i32*, align 8
  store i32 0, i32* %1
  store i32* getelementptr inbounds ([2 x i32]* @l, i32 0, i32 0), i32** %p, align 8
  %2 = load i32** %p, align 8
  %3 = getelementptr inbounds i32* %2, i32 1
  store i32* %3, i32** %p, align 8
  %4 = load i32* %2, align 4
  switch i32 %4, label %9 [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %7
    i32 3, label %8
    i32 4, label %8
  ]

; <label>:5                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable

; <label>:6                                       ; preds = %0
  br label %9

; <label>:7                                       ; preds = %0
  br label %9

; <label>:8                                       ; preds = %0, %0
  br label %9

; <label>:9                                       ; preds = %0, %8, %7, %6
  call void @abort() #2
  unreachable
                                                  ; No predecessors!
  %11 = load i32* %1
  ret i32 %11
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
