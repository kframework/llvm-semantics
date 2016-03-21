; ModuleID = './j035f.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"hi0\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"hi1\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"hi2\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %x, align 4
  %2 = load i8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i64 0), align 1
  %3 = sext i8 %2 to i32
  %4 = load i32, i32* %x, align 4
  %5 = add nsw i32 %4, 1
  store i32 %5, i32* %x, align 4
  %6 = add nsw i32 %3, %4
  %7 = load i8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i64 0), align 1
  %8 = sext i8 %7 to i32
  %9 = add nsw i32 %6, %8
  %10 = load i32, i32* %x, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* %x, align 4
  %12 = add nsw i32 %9, %10
  %13 = load i8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i64 0), align 1
  %14 = sext i8 %13 to i32
  %15 = add nsw i32 %12, %14
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
