; ModuleID = './arrayLookupToAssign.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca [5 x i32], align 16
  store i32 0, i32* %1
  %2 = getelementptr inbounds [5 x i32], [5 x i32]* %a, i32 0, i64 0
  store i32 0, i32* %2, align 4
  %3 = getelementptr inbounds [5 x i32], [5 x i32]* %a, i32 0, i64 0
  %4 = load i32, i32* %3, align 4
  %5 = sext i32 %4 to i64
  %6 = getelementptr inbounds [5 x i32], [5 x i32]* %a, i32 0, i64 %5
  store i32 3, i32* %6, align 4
  %7 = getelementptr inbounds [5 x i32], [5 x i32]* %a, i32 0, i64 0
  %8 = load i32, i32* %7, align 4
  ret i32 %8
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
