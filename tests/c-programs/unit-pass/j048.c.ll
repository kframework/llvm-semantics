; ModuleID = './j048.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define void @f(i32 %a, i32 %b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca [3 x i32], align 4
  %b = alloca [2 x i32], align 4
  store i32 0, i32* %1
  %2 = getelementptr inbounds [3 x i32], [3 x i32]* %a, i32 0, i64 2
  %3 = getelementptr inbounds [3 x i32], [3 x i32]* %a, i32 0, i64 1
  %4 = ptrtoint i32* %2 to i64
  %5 = ptrtoint i32* %3 to i64
  %6 = sub i64 %4, %5
  %7 = sdiv exact i64 %6, 4
  call void @f(i32 5, i32 6)
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
