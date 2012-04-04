; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/StructModifyTest.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S1Ty = type { i32, float, double, i64 }
%struct.S2Ty = type { %struct.S1Ty, %struct.S1Ty }

@.str = private unnamed_addr constant [18 x i8] c"%d, %d, %d, %lld\0A\00", align 1

define void @printS1(%struct.S1Ty* %V) nounwind uwtable {
entry:
  %V.addr = alloca %struct.S1Ty*, align 8
  store %struct.S1Ty* %V, %struct.S1Ty** %V.addr, align 8
  %0 = load %struct.S1Ty** %V.addr, align 8
  %w = getelementptr inbounds %struct.S1Ty* %0, i32 0, i32 0
  %1 = load i32* %w, align 4
  %2 = load %struct.S1Ty** %V.addr, align 8
  %x = getelementptr inbounds %struct.S1Ty* %2, i32 0, i32 1
  %3 = load float* %x, align 4
  %mul = fmul float 1.000000e+01, %3
  %conv = fptosi float %mul to i32
  %4 = load %struct.S1Ty** %V.addr, align 8
  %y = getelementptr inbounds %struct.S1Ty* %4, i32 0, i32 2
  %5 = load double* %y, align 8
  %mul1 = fmul double 1.000000e+01, %5
  %conv2 = fptosi double %mul1 to i32
  %6 = load %struct.S1Ty** %V.addr, align 8
  %z = getelementptr inbounds %struct.S1Ty* %6, i32 0, i32 3
  %7 = load i64* %z, align 8
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str, i32 0, i32 0), i32 %1, i32 %conv, i32 %conv2, i64 %7)
  ret void
}

declare i32 @printf(i8*, ...)

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %E = alloca %struct.S2Ty, align 8
  store i32 0, i32* %retval
  %A = getelementptr inbounds %struct.S2Ty* %E, i32 0, i32 0
  %w = getelementptr inbounds %struct.S1Ty* %A, i32 0, i32 0
  store i32 1, i32* %w, align 4
  %A1 = getelementptr inbounds %struct.S2Ty* %E, i32 0, i32 0
  %x = getelementptr inbounds %struct.S1Ty* %A1, i32 0, i32 1
  store float 0x405EDAE140000000, float* %x, align 4
  %A2 = getelementptr inbounds %struct.S2Ty* %E, i32 0, i32 0
  %y = getelementptr inbounds %struct.S1Ty* %A2, i32 0, i32 2
  store double 1.900000e+01, double* %y, align 8
  %A3 = getelementptr inbounds %struct.S2Ty* %E, i32 0, i32 0
  %z = getelementptr inbounds %struct.S1Ty* %A3, i32 0, i32 3
  store i64 123455678902, i64* %z, align 8
  %B = getelementptr inbounds %struct.S2Ty* %E, i32 0, i32 1
  %w4 = getelementptr inbounds %struct.S1Ty* %B, i32 0, i32 0
  store i32 2, i32* %w4, align 4
  %B5 = getelementptr inbounds %struct.S2Ty* %E, i32 0, i32 1
  %x6 = getelementptr inbounds %struct.S1Ty* %B5, i32 0, i32 1
  store float 0x40376B8520000000, float* %x6, align 4
  %B7 = getelementptr inbounds %struct.S2Ty* %E, i32 0, i32 1
  %y8 = getelementptr inbounds %struct.S1Ty* %B7, i32 0, i32 2
  store double 2.900000e+01, double* %y8, align 8
  %B9 = getelementptr inbounds %struct.S2Ty* %E, i32 0, i32 1
  %z10 = getelementptr inbounds %struct.S1Ty* %B9, i32 0, i32 3
  store i64 23455678902, i64* %z10, align 8
  %A11 = getelementptr inbounds %struct.S2Ty* %E, i32 0, i32 0
  call void @printS1(%struct.S1Ty* %A11)
  %B12 = getelementptr inbounds %struct.S2Ty* %E, i32 0, i32 1
  call void @printS1(%struct.S1Ty* %B12)
  ret i32 0
}
