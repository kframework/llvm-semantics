; ModuleID = './2002-08-02-CastTest2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [11 x i8] c"s1   = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [11 x i8] c"us2  = %u\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @test(i16 signext %s1) #0 {
  %1 = alloca i16, align 2
  %us2 = alloca i16, align 2
  store i16 %s1, i16* %1, align 2
  %2 = load i16* %1, align 2
  store i16 %2, i16* %us2, align 2
  %3 = load i16* %1, align 2
  %4 = sext i16 %3 to i32
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0), i32 %4)
  %6 = load i16* %us2, align 2
  %7 = zext i16 %6 to i32
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str1, i32 0, i32 0), i32 %7)
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @test(i16 signext -769)
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
