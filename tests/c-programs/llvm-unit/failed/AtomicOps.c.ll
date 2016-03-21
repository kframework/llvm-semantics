; ModuleID = './AtomicOps.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"%d, %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @foo(i32* %mem, i32 %val, i32 %c) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %oldval = alloca i32, align 4
  store i32* %mem, i32** %1, align 8
  store i32 %val, i32* %2, align 4
  store i32 %c, i32* %3, align 4
  %4 = load i32*, i32** %1, align 8
  %5 = load i32, i32* %2, align 4
  %6 = atomicrmw add i32* %4, i32 %5 seq_cst
  store i32 %6, i32* %oldval, align 4
  %7 = load i32, i32* %oldval, align 4
  %8 = load i32, i32* %3, align 4
  %9 = add nsw i32 %7, %8
  ret i32 %9
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 0, i32* %1
  store volatile i32 0, i32* %x, align 4
  %2 = call i32 @foo(i32* %x, i32 1, i32 2)
  store i32 %2, i32* %y, align 4
  %3 = load i32, i32* %y, align 4
  %4 = load volatile i32, i32* %x, align 4
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 %3, i32 %4)
  %6 = cmpxchg i32* %x, i32 1, i32 2 seq_cst seq_cst
  %7 = extractvalue { i32, i1 } %6, 0
  store i32 %7, i32* %y, align 4
  %8 = load i32, i32* %y, align 4
  %9 = load volatile i32, i32* %x, align 4
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 %8, i32 %9)
  %11 = atomicrmw xchg i32* %x, i32 1 seq_cst
  store i32 %11, i32* %y, align 4
  %12 = load i32, i32* %y, align 4
  %13 = load volatile i32, i32* %x, align 4
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 %12, i32 %13)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
