; ModuleID = './j037g.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %p = alloca [10 x i32]*, align 8
  store i32 0, i32* %1
  %2 = call noalias i8* @malloc(i64 40) #2
  %3 = bitcast i8* %2 to [10 x i32]*
  store [10 x i32]* %3, [10 x i32]** %p, align 8
  %4 = load [10 x i32]*, [10 x i32]** %p, align 8
  %5 = getelementptr inbounds [10 x i32], [10 x i32]* %4, i32 0, i64 1
  store i32 42, i32* %5, align 4
  %6 = load [10 x i32]*, [10 x i32]** %p, align 8
  %7 = bitcast [10 x i32]* %6 to [10 x i64]*
  %8 = getelementptr inbounds [10 x i64], [10 x i64]* %7, i32 0, i64 1
  store i64 42, i64* %8, align 8
  %9 = load [10 x i32]*, [10 x i32]** %p, align 8
  %10 = getelementptr inbounds [10 x i32], [10 x i32]* %9, i32 0, i64 1
  %11 = load i32, i32* %10, align 4
  ret i32 %11
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
