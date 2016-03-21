; ModuleID = './2003-05-22-LocalTypeTest.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sometimes.1 = type { i16, i16, i16, i16 }
%struct.sometimes = type { i32, i32 }
%struct.sometimes.0 = type { i8 }

@Y = common global %struct.sometimes.1 zeroinitializer, align 2
@.str = private unnamed_addr constant [14 x i8] c"Result is %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %X = alloca i32, align 4
  %S = alloca %struct.sometimes, align 4
  %S1 = alloca %struct.sometimes.0, align 1
  store i32 0, i32* %1
  %2 = getelementptr inbounds %struct.sometimes, %struct.sometimes* %S, i32 0, i32 0
  store i32 1, i32* %2, align 4
  %3 = getelementptr inbounds %struct.sometimes, %struct.sometimes* %S, i32 0, i32 0
  %4 = load i32, i32* %3, align 4
  store i32 %4, i32* %X, align 4
  %5 = getelementptr inbounds %struct.sometimes.0, %struct.sometimes.0* %S1, i32 0, i32 0
  store i8 -1, i8* %5, align 1
  %6 = getelementptr inbounds %struct.sometimes.0, %struct.sometimes.0* %S1, i32 0, i32 0
  %7 = load i8, i8* %6, align 1
  %8 = sext i8 %7 to i32
  %9 = load i32, i32* %X, align 4
  %10 = add nsw i32 %9, %8
  store i32 %10, i32* %X, align 4
  %11 = load i16, i16* getelementptr inbounds (%struct.sometimes.1, %struct.sometimes.1* @Y, i32 0, i32 0), align 2
  %12 = sext i16 %11 to i32
  %13 = load i32, i32* %X, align 4
  %14 = add nsw i32 %13, %12
  store i32 %14, i32* %X, align 4
  %15 = load i32, i32* %X, align 4
  %16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 %15)
  %17 = load i32, i32* %X, align 4
  ret i32 %17
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
