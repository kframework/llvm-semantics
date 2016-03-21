; ModuleID = './basicBitfields.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { i8, i32 }

@s = common global %struct.anon zeroinitializer, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 7, i32* getelementptr inbounds (%struct.anon, %struct.anon* @s, i32 0, i32 1), align 4
  %2 = load i8, i8* getelementptr inbounds (%struct.anon, %struct.anon* @s, i32 0, i32 0), align 4
  %3 = and i8 %2, -7
  %4 = or i8 %3, 4
  store i8 %4, i8* getelementptr inbounds (%struct.anon, %struct.anon* @s, i32 0, i32 0), align 4
  %5 = load i8, i8* getelementptr inbounds (%struct.anon, %struct.anon* @s, i32 0, i32 0), align 4
  %6 = and i8 %5, -2
  %7 = or i8 %6, 1
  store i8 %7, i8* getelementptr inbounds (%struct.anon, %struct.anon* @s, i32 0, i32 0), align 4
  %8 = load i8, i8* getelementptr inbounds (%struct.anon, %struct.anon* @s, i32 0, i32 0), align 4
  %9 = and i8 %8, -57
  %10 = or i8 %9, 24
  store i8 %10, i8* getelementptr inbounds (%struct.anon, %struct.anon* @s, i32 0, i32 0), align 4
  %11 = load i8, i8* getelementptr inbounds (%struct.anon, %struct.anon* @s, i32 0, i32 0), align 4
  %12 = lshr i8 %11, 1
  %13 = and i8 %12, 3
  %14 = zext i8 %13 to i32
  %15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %14)
  %16 = load i8, i8* getelementptr inbounds (%struct.anon, %struct.anon* @s, i32 0, i32 0), align 4
  %17 = and i8 %16, 1
  %18 = zext i8 %17 to i32
  %19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %18)
  %20 = load i8, i8* getelementptr inbounds (%struct.anon, %struct.anon* @s, i32 0, i32 0), align 4
  %21 = lshr i8 %20, 3
  %22 = and i8 %21, 7
  %23 = zext i8 %22 to i32
  %24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %23)
  %25 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @s, i32 0, i32 1), align 4
  %26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %25)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
