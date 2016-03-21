; ModuleID = './negativeBitfield.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { i24, i16 }

@s = common global %struct.anon zeroinitializer, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = load i32, i32* bitcast (%struct.anon* @s to i32*), align 4
  %3 = and i32 %2, -16
  %4 = or i32 %3, 6
  store i32 %4, i32* bitcast (%struct.anon* @s to i32*), align 4
  %5 = load i32, i32* bitcast (%struct.anon* @s to i32*), align 4
  %6 = and i32 %5, -241
  %7 = or i32 %6, 128
  store i32 %7, i32* bitcast (%struct.anon* @s to i32*), align 4
  %8 = load i32, i32* bitcast (%struct.anon* @s to i32*), align 4
  %9 = and i32 %8, -257
  %10 = or i32 %9, 256
  store i32 %10, i32* bitcast (%struct.anon* @s to i32*), align 4
  %11 = load i32, i32* bitcast (%struct.anon* @s to i32*), align 4
  %12 = and i32 %11, -1537
  %13 = or i32 %12, 512
  store i32 %13, i32* bitcast (%struct.anon* @s to i32*), align 4
  %14 = load i32, i32* bitcast (%struct.anon* @s to i32*), align 4
  %15 = and i32 %14, -6145
  %16 = or i32 %15, 4096
  store i32 %16, i32* bitcast (%struct.anon* @s to i32*), align 4
  %17 = load i32, i32* bitcast (%struct.anon* @s to i32*), align 4
  %18 = and i32 %17, -8380417
  %19 = or i32 %18, 2555904
  store i32 %19, i32* bitcast (%struct.anon* @s to i32*), align 4
  %20 = load i16, i16* getelementptr inbounds (%struct.anon, %struct.anon* @s, i32 0, i32 1), align 4
  %21 = and i16 %20, -1024
  %22 = or i16 %21, 619
  store i16 %22, i16* getelementptr inbounds (%struct.anon, %struct.anon* @s, i32 0, i32 1), align 4
  %23 = load i32, i32* bitcast (%struct.anon* @s to i32*), align 4
  %24 = shl i32 %23, 28
  %25 = ashr i32 %24, 28
  %26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %25)
  %27 = load i32, i32* bitcast (%struct.anon* @s to i32*), align 4
  %28 = shl i32 %27, 24
  %29 = ashr i32 %28, 28
  %30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %29)
  %31 = load i32, i32* bitcast (%struct.anon* @s to i32*), align 4
  %32 = lshr i32 %31, 8
  %33 = and i32 %32, 1
  %34 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %33)
  %35 = load i32, i32* bitcast (%struct.anon* @s to i32*), align 4
  %36 = shl i32 %35, 21
  %37 = ashr i32 %36, 30
  %38 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %37)
  %39 = load i32, i32* bitcast (%struct.anon* @s to i32*), align 4
  %40 = shl i32 %39, 19
  %41 = ashr i32 %40, 30
  %42 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %41)
  %43 = load i32, i32* bitcast (%struct.anon* @s to i32*), align 4
  %44 = shl i32 %43, 9
  %45 = ashr i32 %44, 22
  %46 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %45)
  %47 = load i16, i16* getelementptr inbounds (%struct.anon, %struct.anon* @s, i32 0, i32 1), align 4
  %48 = shl i16 %47, 6
  %49 = ashr i16 %48, 6
  %50 = sext i16 %49 to i32
  %51 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %50)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
