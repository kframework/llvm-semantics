; ModuleID = './j077.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @f(i32* dereferenceable(20) %a) #0 {
  %1 = alloca i32*, align 8
  store i32* %a, i32** %1, align 8
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca [5 x i32], align 16
  %b = alloca i32*, align 8
  store i32 0, i32* %1
  %2 = call noalias i8* @malloc(i64 20) #2
  %3 = bitcast i8* %2 to i32*
  store i32* %3, i32** %b, align 8
  %4 = getelementptr inbounds [5 x i32], [5 x i32]* %a, i32 0, i32 0
  %5 = call i32 @f(i32* %4)
  %6 = load i32*, i32** %b, align 8
  %7 = call i32 @f(i32* %6)
  %8 = add nsw i32 %5, %7
  ret i32 %8
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
