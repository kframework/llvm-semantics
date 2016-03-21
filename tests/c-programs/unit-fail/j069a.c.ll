; ModuleID = './j069a.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @f(i32* noalias %p, i32* noalias %q) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32*, align 8
  store i32* %p, i32** %1, align 8
  store i32* %q, i32** %2, align 8
  %3 = load i32*, i32** %2, align 8
  store i32* %3, i32** %1, align 8
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %p = alloca i32, align 4
  %q = alloca i32, align 4
  store i32 0, i32* %1
  store i32 5, i32* %p, align 4
  store i32 6, i32* %q, align 4
  %2 = call i32 @f(i32* %p, i32* %q)
  ret i32 %2
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
