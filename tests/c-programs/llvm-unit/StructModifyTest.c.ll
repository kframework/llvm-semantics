; ModuleID = './StructModifyTest.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.S1Ty = type { i32, float, double, i64 }
%struct.S2Ty = type { %struct.S1Ty, %struct.S1Ty }

@.str = private unnamed_addr constant [18 x i8] c"%d, %d, %d, %lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @printS1(%struct.S1Ty* %V) #0 {
  %1 = alloca %struct.S1Ty*, align 8
  store %struct.S1Ty* %V, %struct.S1Ty** %1, align 8
  %2 = load %struct.S1Ty*, %struct.S1Ty** %1, align 8
  %3 = getelementptr inbounds %struct.S1Ty, %struct.S1Ty* %2, i32 0, i32 0
  %4 = load i32, i32* %3, align 4
  %5 = load %struct.S1Ty*, %struct.S1Ty** %1, align 8
  %6 = getelementptr inbounds %struct.S1Ty, %struct.S1Ty* %5, i32 0, i32 1
  %7 = load float, float* %6, align 4
  %8 = fmul float 1.000000e+01, %7
  %9 = fptosi float %8 to i32
  %10 = load %struct.S1Ty*, %struct.S1Ty** %1, align 8
  %11 = getelementptr inbounds %struct.S1Ty, %struct.S1Ty* %10, i32 0, i32 2
  %12 = load double, double* %11, align 8
  %13 = fmul double 1.000000e+01, %12
  %14 = fptosi double %13 to i32
  %15 = load %struct.S1Ty*, %struct.S1Ty** %1, align 8
  %16 = getelementptr inbounds %struct.S1Ty, %struct.S1Ty* %15, i32 0, i32 3
  %17 = load i64, i64* %16, align 8
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i32 0, i32 0), i32 %4, i32 %9, i32 %14, i64 %17)
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %E = alloca %struct.S2Ty, align 8
  store i32 0, i32* %1
  %2 = getelementptr inbounds %struct.S2Ty, %struct.S2Ty* %E, i32 0, i32 0
  %3 = getelementptr inbounds %struct.S1Ty, %struct.S1Ty* %2, i32 0, i32 0
  store i32 1, i32* %3, align 4
  %4 = getelementptr inbounds %struct.S2Ty, %struct.S2Ty* %E, i32 0, i32 0
  %5 = getelementptr inbounds %struct.S1Ty, %struct.S1Ty* %4, i32 0, i32 1
  store float 0x405EDAE140000000, float* %5, align 4
  %6 = getelementptr inbounds %struct.S2Ty, %struct.S2Ty* %E, i32 0, i32 0
  %7 = getelementptr inbounds %struct.S1Ty, %struct.S1Ty* %6, i32 0, i32 2
  store double 1.900000e+01, double* %7, align 8
  %8 = getelementptr inbounds %struct.S2Ty, %struct.S2Ty* %E, i32 0, i32 0
  %9 = getelementptr inbounds %struct.S1Ty, %struct.S1Ty* %8, i32 0, i32 3
  store i64 123455678902, i64* %9, align 8
  %10 = getelementptr inbounds %struct.S2Ty, %struct.S2Ty* %E, i32 0, i32 1
  %11 = getelementptr inbounds %struct.S1Ty, %struct.S1Ty* %10, i32 0, i32 0
  store i32 2, i32* %11, align 4
  %12 = getelementptr inbounds %struct.S2Ty, %struct.S2Ty* %E, i32 0, i32 1
  %13 = getelementptr inbounds %struct.S1Ty, %struct.S1Ty* %12, i32 0, i32 1
  store float 0x40376B8520000000, float* %13, align 4
  %14 = getelementptr inbounds %struct.S2Ty, %struct.S2Ty* %E, i32 0, i32 1
  %15 = getelementptr inbounds %struct.S1Ty, %struct.S1Ty* %14, i32 0, i32 2
  store double 2.900000e+01, double* %15, align 8
  %16 = getelementptr inbounds %struct.S2Ty, %struct.S2Ty* %E, i32 0, i32 1
  %17 = getelementptr inbounds %struct.S1Ty, %struct.S1Ty* %16, i32 0, i32 3
  store i64 23455678902, i64* %17, align 8
  %18 = getelementptr inbounds %struct.S2Ty, %struct.S2Ty* %E, i32 0, i32 0
  call void @printS1(%struct.S1Ty* %18)
  %19 = getelementptr inbounds %struct.S2Ty, %struct.S2Ty* %E, i32 0, i32 1
  call void @printS1(%struct.S1Ty* %19)
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
