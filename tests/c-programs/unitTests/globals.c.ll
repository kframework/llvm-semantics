; ModuleID = './globals.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@a = global i32 5, align 4
@b = global i32* @a, align 8
@c = common global i32 0, align 4
@d = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 5, i32* @c, align 4
  %2 = load i32, i32* @c, align 4
  store i32 %2, i32* @d, align 4
  %3 = load i32, i32* @a, align 4
  %4 = load i32*, i32** @b, align 8
  %5 = load i32, i32* %4, align 4
  %6 = add nsw i32 %3, %5
  %7 = load i32, i32* @c, align 4
  %8 = add nsw i32 %6, %7
  %9 = load i32, i32* @d, align 4
  %10 = add nsw i32 %8, %9
  ret i32 %10
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
