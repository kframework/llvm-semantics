; ModuleID = './2005-07-15-Bitfield-ABI.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.X = type { i32 }
%union.anon = type { i32 }

@.str = private unnamed_addr constant [4 x i8] c"%x\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @test(%struct.X* %P, i32 %A) #0 {
  %1 = alloca %struct.X*, align 8
  %2 = alloca i32, align 4
  store %struct.X* %P, %struct.X** %1, align 8
  store i32 %A, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = load %struct.X*, %struct.X** %1, align 8
  %5 = bitcast %struct.X* %4 to i32*
  %6 = load i32, i32* %5, align 4
  %7 = and i32 %3, 15
  %8 = shl i32 %7, 6
  %9 = and i32 %6, -961
  %10 = or i32 %9, %8
  store i32 %10, i32* %5, align 4
  %11 = shl i32 %7, 28
  %12 = ashr i32 %11, 28
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %U = alloca %union.anon, align 4
  store i32 0, i32* %1
  %2 = bitcast %union.anon* %U to i32*
  store i32 -1, i32* %2, align 4
  %3 = bitcast %union.anon* %U to %struct.X*
  call void @test(%struct.X* %3, i32 0)
  %4 = bitcast %union.anon* %U to i32*
  %5 = load i32, i32* %4, align 4
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %5)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
