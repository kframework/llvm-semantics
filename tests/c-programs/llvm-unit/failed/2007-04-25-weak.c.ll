; ModuleID = './2007-04-25-weak.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %t = alloca i32 (...)*, align 8
  store i32 0, i32* %1
  store i32 (...)* @test_weak, i32 (...)** %t, align 8
  %2 = load i32 (...)*, i32 (...)** %t, align 8
  %3 = icmp ne i32 (...)* %2, null
  br i1 %3, label %4, label %7

; <label>:4                                       ; preds = %0
  %5 = load i32 (...)*, i32 (...)** %t, align 8
  %6 = call i32 (...) %5()
  store i32 1, i32* %1
  br label %8

; <label>:7                                       ; preds = %0
  store i32 0, i32* %1
  br label %8

; <label>:8                                       ; preds = %7, %4
  %9 = load i32, i32* %1
  ret i32 %9
}

declare extern_weak i32 @test_weak(...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
