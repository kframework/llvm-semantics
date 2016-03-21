; ModuleID = './j010.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@y = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32* @f() #0 {
  %x = alloca i32, align 4
  ret i32* @y
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %p = alloca i32*, align 8
  %x = alloca i32, align 4
  %i = alloca i32, align 4
  %x1 = alloca i32, align 4
  store i32 0, i32* %1
  store i32* null, i32** %p, align 8
  store i32* %x, i32** %p, align 8
  %2 = call i32* @f()
  store i32* %2, i32** %p, align 8
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %6, %0
  %4 = load i32, i32* %i, align 4
  %5 = icmp slt i32 %4, 10
  br i1 %5, label %6, label %9

; <label>:6                                       ; preds = %3
  store i32 2, i32* %x1, align 4
  %7 = load i32, i32* %i, align 4
  %8 = add nsw i32 %7, 1
  store i32 %8, i32* %i, align 4
  store i32* %x1, i32** %p, align 8
  br label %3

; <label>:9                                       ; preds = %3
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
