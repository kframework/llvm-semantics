; ModuleID = './sse.shift.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.IV = type { <2 x i64> }

@.str = private unnamed_addr constant [21 x i8] c"%08x %08x %08x %08x\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca <2 x i64>, align 16
  %2 = alloca i32, align 4
  %3 = alloca <2 x i64>, align 16
  %4 = alloca i32, align 4
  %5 = alloca <2 x i64>, align 16
  %6 = alloca <2 x i64>, align 16
  %7 = alloca i32, align 4
  %8 = alloca <4 x i32>, align 16
  %9 = alloca i32, align 4
  %allones = alloca <2 x i64>, align 16
  %zeroones = alloca <2 x i64>, align 16
  %onezeros = alloca <2 x i64>, align 16
  store i32 0, i32* %9
  store i32 0, i32* %7, align 4
  %10 = load i32, i32* %7, align 4
  %11 = insertelement <4 x i32> undef, i32 %10, i32 0
  %12 = load i32, i32* %7, align 4
  %13 = insertelement <4 x i32> %11, i32 %12, i32 1
  %14 = load i32, i32* %7, align 4
  %15 = insertelement <4 x i32> %13, i32 %14, i32 2
  %16 = load i32, i32* %7, align 4
  %17 = insertelement <4 x i32> %15, i32 %16, i32 3
  store <4 x i32> %17, <4 x i32>* %8
  %18 = load <4 x i32>, <4 x i32>* %8
  %19 = bitcast <4 x i32> %18 to <2 x i64>
  store <2 x i64> %19, <2 x i64>* %allones, align 16
  %20 = load <2 x i64>, <2 x i64>* %allones, align 16
  %21 = load <2 x i64>, <2 x i64>* %allones, align 16
  store <2 x i64> %20, <2 x i64>* %5, align 16
  store <2 x i64> %21, <2 x i64>* %6, align 16
  %22 = load <2 x i64>, <2 x i64>* %5, align 16
  %23 = bitcast <2 x i64> %22 to <4 x i32>
  %24 = load <2 x i64>, <2 x i64>* %6, align 16
  %25 = bitcast <2 x i64> %24 to <4 x i32>
  %26 = icmp eq <4 x i32> %23, %25
  %27 = sext <4 x i1> %26 to <4 x i32>
  %28 = bitcast <4 x i32> %27 to <2 x i64>
  store <2 x i64> %28, <2 x i64>* %allones, align 16
  %29 = load <2 x i64>, <2 x i64>* %allones, align 16
  store <2 x i64> %29, <2 x i64>* %1, align 16
  store i32 8, i32* %2, align 4
  %30 = load <2 x i64>, <2 x i64>* %1, align 16
  %31 = bitcast <2 x i64> %30 to <8 x i16>
  %32 = load i32, i32* %2, align 4
  %33 = call <8 x i16> @llvm.x86.sse2.psrli.w(<8 x i16> %31, i32 %32) #3
  %34 = bitcast <8 x i16> %33 to <2 x i64>
  store <2 x i64> %34, <2 x i64>* %zeroones, align 16
  %35 = bitcast <2 x i64>* %zeroones to %union.IV*
  call void @printIV(%union.IV* %35)
  %36 = load <2 x i64>, <2 x i64>* %allones, align 16
  store <2 x i64> %36, <2 x i64>* %3, align 16
  store i32 8, i32* %4, align 4
  %37 = load <2 x i64>, <2 x i64>* %3, align 16
  %38 = bitcast <2 x i64> %37 to <8 x i16>
  %39 = load i32, i32* %4, align 4
  %40 = call <8 x i16> @llvm.x86.sse2.pslli.w(<8 x i16> %38, i32 %39) #3
  %41 = bitcast <8 x i16> %40 to <2 x i64>
  store <2 x i64> %41, <2 x i64>* %onezeros, align 16
  %42 = bitcast <2 x i64>* %onezeros to %union.IV*
  call void @printIV(%union.IV* %42)
  ret i32 0
}

; Function Attrs: nounwind uwtable
define internal void @printIV(%union.IV* %F) #0 {
  %1 = alloca %union.IV*, align 8
  store %union.IV* %F, %union.IV** %1, align 8
  %2 = load %union.IV*, %union.IV** %1, align 8
  %3 = bitcast %union.IV* %2 to [4 x i32]*
  %4 = getelementptr inbounds [4 x i32], [4 x i32]* %3, i32 0, i64 0
  %5 = load i32, i32* %4, align 4
  %6 = load %union.IV*, %union.IV** %1, align 8
  %7 = bitcast %union.IV* %6 to [4 x i32]*
  %8 = getelementptr inbounds [4 x i32], [4 x i32]* %7, i32 0, i64 1
  %9 = load i32, i32* %8, align 4
  %10 = load %union.IV*, %union.IV** %1, align 8
  %11 = bitcast %union.IV* %10 to [4 x i32]*
  %12 = getelementptr inbounds [4 x i32], [4 x i32]* %11, i32 0, i64 2
  %13 = load i32, i32* %12, align 4
  %14 = load %union.IV*, %union.IV** %1, align 8
  %15 = bitcast %union.IV* %14 to [4 x i32]*
  %16 = getelementptr inbounds [4 x i32], [4 x i32]* %15, i32 0, i64 3
  %17 = load i32, i32* %16, align 4
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i32 0, i32 0), i32 %5, i32 %9, i32 %13, i32 %17)
  ret void
}

; Function Attrs: nounwind readnone
declare <8 x i16> @llvm.x86.sse2.psrli.w(<8 x i16>, i32) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind readnone
declare <8 x i16> @llvm.x86.sse2.pslli.w(<8 x i16>, i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
