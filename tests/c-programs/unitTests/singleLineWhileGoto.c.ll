; ModuleID = './singleLineWhileGoto.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 0, i32* %1
  store i32 5, i32* %x, align 4
  br label %5
                                                  ; No predecessors!
  br label %3

; <label>:3                                       ; preds = %5, %2
  br i1 false, label %4, label %8

; <label>:4                                       ; preds = %3
  br label %5

; <label>:5                                       ; preds = %4, %0
  %6 = load i32, i32* %x, align 4
  %7 = add nsw i32 %6, 1
  store i32 %7, i32* %x, align 4
  br label %3

; <label>:8                                       ; preds = %3
  br label %12
                                                  ; No predecessors!
  br label %10

; <label>:10                                      ; preds = %9
  br i1 false, label %11, label %13

; <label>:11                                      ; preds = %10
  br label %12

; <label>:12                                      ; preds = %11, %8
  br label %13

; <label>:13                                      ; preds = %12, %10
  %14 = load i32, i32* %x, align 4
  ret i32 %14
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
