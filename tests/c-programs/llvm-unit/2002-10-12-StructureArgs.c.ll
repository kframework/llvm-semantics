; ModuleID = './2002-10-12-StructureArgs.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.vec2 = type { double, double }

@.str = private unnamed_addr constant [16 x i8] c"%d, %d, %d, %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @print(double %S.coerce0, double %S.coerce1, double %T.coerce0, double %T.coerce1) #0 {
  %S = alloca %struct.vec2, align 8
  %T = alloca %struct.vec2, align 8
  %1 = bitcast %struct.vec2* %S to { double, double }*
  %2 = getelementptr { double, double }, { double, double }* %1, i32 0, i32 0
  store double %S.coerce0, double* %2
  %3 = getelementptr { double, double }, { double, double }* %1, i32 0, i32 1
  store double %S.coerce1, double* %3
  %4 = bitcast %struct.vec2* %T to { double, double }*
  %5 = getelementptr { double, double }, { double, double }* %4, i32 0, i32 0
  store double %T.coerce0, double* %5
  %6 = getelementptr { double, double }, { double, double }* %4, i32 0, i32 1
  store double %T.coerce1, double* %6
  %7 = getelementptr inbounds %struct.vec2, %struct.vec2* %S, i32 0, i32 0
  %8 = load double, double* %7, align 8
  %9 = fmul double 1.000000e+04, %8
  %10 = fptosi double %9 to i32
  %11 = getelementptr inbounds %struct.vec2, %struct.vec2* %S, i32 0, i32 1
  %12 = load double, double* %11, align 8
  %13 = fmul double 1.000000e+04, %12
  %14 = fptosi double %13 to i32
  %15 = getelementptr inbounds %struct.vec2, %struct.vec2* %T, i32 0, i32 0
  %16 = load double, double* %15, align 8
  %17 = fmul double 1.000000e+04, %16
  %18 = fptosi double %17 to i32
  %19 = getelementptr inbounds %struct.vec2, %struct.vec2* %T, i32 0, i32 1
  %20 = load double, double* %19, align 8
  %21 = fmul double 1.000000e+04, %20
  %22 = fptosi double %21 to i32
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i32 0, i32 0), i32 %10, i32 %14, i32 %18, i32 %22)
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %U = alloca %struct.vec2, align 8
  %V = alloca %struct.vec2, align 8
  store i32 0, i32* %1
  %2 = getelementptr inbounds %struct.vec2, %struct.vec2* %U, i32 0, i32 0
  store double 5.000000e-01, double* %2, align 8
  %3 = getelementptr inbounds %struct.vec2, %struct.vec2* %U, i32 0, i32 1
  store double 1.300000e+00, double* %3, align 8
  %4 = getelementptr inbounds %struct.vec2, %struct.vec2* %V, i32 0, i32 0
  store double -1.230100e+02, double* %4, align 8
  %5 = getelementptr inbounds %struct.vec2, %struct.vec2* %V, i32 0, i32 1
  store double 0x3FD5555555555555, double* %5, align 8
  %6 = bitcast %struct.vec2* %U to { double, double }*
  %7 = getelementptr { double, double }, { double, double }* %6, i32 0, i32 0
  %8 = load double, double* %7, align 1
  %9 = getelementptr { double, double }, { double, double }* %6, i32 0, i32 1
  %10 = load double, double* %9, align 1
  %11 = bitcast %struct.vec2* %V to { double, double }*
  %12 = getelementptr { double, double }, { double, double }* %11, i32 0, i32 0
  %13 = load double, double* %12, align 1
  %14 = getelementptr { double, double }, { double, double }* %11, i32 0, i32 1
  %15 = load double, double* %14, align 1
  call void @print(double %8, double %10, double %13, double %15)
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
