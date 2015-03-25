; ModuleID = './2004-06-20-StaticBitfieldInit.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@GV = global { i8, i8, [2 x i8] } { i8 -95, i8 8, [2 x i8] undef }, align 4
@.str = private unnamed_addr constant [10 x i8] c"%d %d %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = load i16* bitcast ({ i8, i8, [2 x i8] }* @GV to i16*), align 4
  %3 = and i16 %2, 31
  %4 = zext i16 %3 to i32
  %5 = load i16* bitcast ({ i8, i8, [2 x i8] }* @GV to i16*), align 4
  %6 = lshr i16 %5, 5
  %7 = and i16 %6, 63
  %8 = zext i16 %7 to i32
  %9 = load i16* bitcast ({ i8, i8, [2 x i8] }* @GV to i16*), align 4
  %10 = lshr i16 %9, 11
  %11 = zext i16 %10 to i32
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0), i32 %4, i32 %8, i32 %11)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
