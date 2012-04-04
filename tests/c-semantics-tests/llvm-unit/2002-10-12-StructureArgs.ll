; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2002-10-12-StructureArgs.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.vec2 = type { double, double }

@.str = private unnamed_addr constant [16 x i8] c"%d, %d, %d, %d\0A\00", align 1

define void @print(double %S.coerce0, double %S.coerce1, double %T.coerce0, double %T.coerce1) nounwind uwtable {
entry:
  %S = alloca %struct.vec2, align 8
  %T = alloca %struct.vec2, align 8
  %0 = bitcast %struct.vec2* %S to { double, double }*
  %1 = getelementptr { double, double }* %0, i32 0, i32 0
  store double %S.coerce0, double* %1
  %2 = getelementptr { double, double }* %0, i32 0, i32 1
  store double %S.coerce1, double* %2
  %3 = bitcast %struct.vec2* %T to { double, double }*
  %4 = getelementptr { double, double }* %3, i32 0, i32 0
  store double %T.coerce0, double* %4
  %5 = getelementptr { double, double }* %3, i32 0, i32 1
  store double %T.coerce1, double* %5
  %X = getelementptr inbounds %struct.vec2* %S, i32 0, i32 0
  %6 = load double* %X, align 8
  %mul = fmul double 1.000000e+04, %6
  %conv = fptosi double %mul to i32
  %Y = getelementptr inbounds %struct.vec2* %S, i32 0, i32 1
  %7 = load double* %Y, align 8
  %mul1 = fmul double 1.000000e+04, %7
  %conv2 = fptosi double %mul1 to i32
  %X3 = getelementptr inbounds %struct.vec2* %T, i32 0, i32 0
  %8 = load double* %X3, align 8
  %mul4 = fmul double 1.000000e+04, %8
  %conv5 = fptosi double %mul4 to i32
  %Y6 = getelementptr inbounds %struct.vec2* %T, i32 0, i32 1
  %9 = load double* %Y6, align 8
  %mul7 = fmul double 1.000000e+04, %9
  %conv8 = fptosi double %mul7 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 %conv, i32 %conv2, i32 %conv5, i32 %conv8)
  ret void
}

declare i32 @printf(i8*, ...)

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %U = alloca %struct.vec2, align 8
  %V = alloca %struct.vec2, align 8
  store i32 0, i32* %retval
  %X = getelementptr inbounds %struct.vec2* %U, i32 0, i32 0
  store double 5.000000e-01, double* %X, align 8
  %Y = getelementptr inbounds %struct.vec2* %U, i32 0, i32 1
  store double 1.300000e+00, double* %Y, align 8
  %X1 = getelementptr inbounds %struct.vec2* %V, i32 0, i32 0
  store double -1.230100e+02, double* %X1, align 8
  %Y2 = getelementptr inbounds %struct.vec2* %V, i32 0, i32 1
  store double 0x3FD5555555555555, double* %Y2, align 8
  %0 = bitcast %struct.vec2* %U to { double, double }*
  %1 = getelementptr { double, double }* %0, i32 0, i32 0
  %2 = load double* %1, align 1
  %3 = getelementptr { double, double }* %0, i32 0, i32 1
  %4 = load double* %3, align 1
  %5 = bitcast %struct.vec2* %V to { double, double }*
  %6 = getelementptr { double, double }* %5, i32 0, i32 0
  %7 = load double* %6, align 1
  %8 = getelementptr { double, double }* %5, i32 0, i32 1
  %9 = load double* %8, align 1
  call void @print(double %2, double %4, double %7, double %9)
  ret i32 0
}
