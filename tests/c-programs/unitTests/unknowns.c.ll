; ModuleID = './unknowns.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %x = alloca i8, align 1
  %1 = load i8, i8* %x, align 1
  %2 = zext i8 %1 to i32
  %3 = xor i32 %2, -1
  %4 = load i8, i8* %x, align 1
  %5 = zext i8 %4 to i32
  %6 = xor i32 %5, 5
  %7 = load i8, i8* %x, align 1
  %8 = zext i8 %7 to i32
  %9 = or i32 %8, 5
  %10 = load i8, i8* %x, align 1
  %11 = zext i8 %10 to i32
  %12 = and i32 %11, 5
  %13 = load i8, i8* %x, align 1
  %14 = zext i8 %13 to i32
  %15 = and i32 %14, 0
  %16 = load i8, i8* %x, align 1
  %17 = zext i8 %16 to i32
  %18 = xor i32 5, %17
  %19 = load i8, i8* %x, align 1
  %20 = zext i8 %19 to i32
  %21 = or i32 5, %20
  %22 = load i8, i8* %x, align 1
  %23 = zext i8 %22 to i32
  %24 = and i32 5, %23
  %25 = load i8, i8* %x, align 1
  %26 = zext i8 %25 to i32
  %27 = and i32 0, %26
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
