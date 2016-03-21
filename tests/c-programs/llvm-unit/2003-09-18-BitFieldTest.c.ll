; ModuleID = './2003-09-18-BitFieldTest.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.rtx_def = type { i8, [3 x i8] }

@.str = private unnamed_addr constant [7 x i8] c"%d %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @i2(%struct.rtx_def* %d) #0 {
  %1 = alloca %struct.rtx_def*, align 8
  store %struct.rtx_def* %d, %struct.rtx_def** %1, align 8
  %2 = load %struct.rtx_def*, %struct.rtx_def** %1, align 8
  %3 = bitcast %struct.rtx_def* %2 to i8*
  %4 = load i8, i8* %3, align 4
  %5 = and i8 %4, -2
  store i8 %5, i8* %3, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %D = alloca %struct.rtx_def, align 4
  store i32 0, i32* %1
  %2 = bitcast %struct.rtx_def* %D to i8*
  %3 = load i8, i8* %2, align 4
  %4 = and i8 %3, -3
  %5 = or i8 %4, 2
  store i8 %5, i8* %2, align 4
  call void @i2(%struct.rtx_def* %D)
  %6 = bitcast %struct.rtx_def* %D to i8*
  %7 = load i8, i8* %6, align 4
  %8 = and i8 %7, 1
  %9 = zext i8 %8 to i32
  %10 = bitcast %struct.rtx_def* %D to i8*
  %11 = load i8, i8* %10, align 4
  %12 = lshr i8 %11, 1
  %13 = and i8 %12, 1
  %14 = zext i8 %13 to i32
  %15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 %9, i32 %14)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
