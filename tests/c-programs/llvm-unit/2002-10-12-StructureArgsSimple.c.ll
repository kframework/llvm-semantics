; ModuleID = './2002-10-12-StructureArgsSimple.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.vec2 = type { double, double }

@.str = private unnamed_addr constant [8 x i8] c"%d, %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @print(double %S.coerce0, double %S.coerce1) #0 {
  %S = alloca %struct.vec2, align 8
  %1 = bitcast %struct.vec2* %S to { double, double }*
  %2 = getelementptr { double, double }, { double, double }* %1, i32 0, i32 0
  store double %S.coerce0, double* %2
  %3 = getelementptr { double, double }, { double, double }* %1, i32 0, i32 1
  store double %S.coerce1, double* %3
  %4 = getelementptr inbounds %struct.vec2, %struct.vec2* %S, i32 0, i32 0
  %5 = load double, double* %4, align 8
  %6 = fmul double 1.000000e+04, %5
  %7 = fptosi double %6 to i32
  %8 = getelementptr inbounds %struct.vec2, %struct.vec2* %S, i32 0, i32 1
  %9 = load double, double* %8, align 8
  %10 = fmul double 1.000000e+04, %9
  %11 = fptosi double %10 to i32
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 %7, i32 %11)
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %U = alloca %struct.vec2, align 8
  store i32 0, i32* %1
  %2 = getelementptr inbounds %struct.vec2, %struct.vec2* %U, i32 0, i32 0
  store double 5.000000e-01, double* %2, align 8
  %3 = getelementptr inbounds %struct.vec2, %struct.vec2* %U, i32 0, i32 1
  store double 1.300000e+00, double* %3, align 8
  %4 = bitcast %struct.vec2* %U to { double, double }*
  %5 = getelementptr { double, double }, { double, double }* %4, i32 0, i32 0
  %6 = load double, double* %5, align 1
  %7 = getelementptr { double, double }, { double, double }* %4, i32 0, i32 1
  %8 = load double, double* %7, align 1
  call void @print(double %6, double %8)
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
