; ModuleID = './j037e.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca i32, align 4
  %a = alloca i32*, align 8
  %b = alloca i64*, align 8
  store i32 0, i32* %1
  store i32 10, i32* %x, align 4
  store i32* %x, i32** %a, align 8
  %2 = load i32*, i32** %a, align 8
  %3 = bitcast i32* %2 to i64*
  store i64* %3, i64** %b, align 8
  %4 = load i64*, i64** %b, align 8
  %5 = load i64, i64* %4, align 8
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
