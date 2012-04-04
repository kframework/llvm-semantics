; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2002-10-12-StructureArgsSimple.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.vec2 = type { double, double }

@.str = private unnamed_addr constant [8 x i8] c"%d, %d\0A\00", align 1

define void @print(double %S.coerce0, double %S.coerce1) nounwind uwtable {
entry:
  %S = alloca %struct.vec2, align 8
  %0 = bitcast %struct.vec2* %S to { double, double }*
  %1 = getelementptr { double, double }* %0, i32 0, i32 0
  store double %S.coerce0, double* %1
  %2 = getelementptr { double, double }* %0, i32 0, i32 1
  store double %S.coerce1, double* %2
  %X = getelementptr inbounds %struct.vec2* %S, i32 0, i32 0
  %3 = load double* %X, align 8
  %mul = fmul double 1.000000e+04, %3
  %conv = fptosi double %mul to i32
  %Y = getelementptr inbounds %struct.vec2* %S, i32 0, i32 1
  %4 = load double* %Y, align 8
  %mul1 = fmul double 1.000000e+04, %4
  %conv2 = fptosi double %mul1 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 %conv, i32 %conv2)
  ret void
}

declare i32 @printf(i8*, ...)

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %U = alloca %struct.vec2, align 8
  store i32 0, i32* %retval
  %X = getelementptr inbounds %struct.vec2* %U, i32 0, i32 0
  store double 5.000000e-01, double* %X, align 8
  %Y = getelementptr inbounds %struct.vec2* %U, i32 0, i32 1
  store double 1.300000e+00, double* %Y, align 8
  %0 = bitcast %struct.vec2* %U to { double, double }*
  %1 = getelementptr { double, double }* %0, i32 0, i32 0
  %2 = load double* %1, align 1
  %3 = getelementptr { double, double }* %0, i32 0, i32 1
  %4 = load double* %3, align 1
  call void @print(double %2, double %4)
  ret i32 0
}
