; ModuleID = './j068a.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @f(i32* noalias %a, i32* noalias %b) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32*, align 8
  store i32* %a, i32** %1, align 8
  store i32* %b, i32** %2, align 8
  %3 = load i32*, i32** %1, align 8
  store i32 1, i32* %3, align 4
  %4 = load i32*, i32** %2, align 8
  store i32 1, i32* %4, align 4
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 0, i32* %1
  store i32 5, i32* %a, align 4
  %2 = call i32 @f(i32* %a, i32* %a)
  ret i32 %2
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
