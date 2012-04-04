; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2007-01-04-KNR-Args.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [25 x i8] c"%c %d %d %d %d %d %d %d\0A\00", align 1

define void @p1(i32, double, i32, double %d1, i32 %i, double, i64 %l, double %d2) nounwind uwtable {
entry:
  %c.addr = alloca i8, align 1
  %f1.addr = alloca float, align 4
  %s.addr = alloca i16, align 2
  %d1.addr = alloca double, align 8
  %i.addr = alloca i32, align 4
  %f2.addr = alloca float, align 4
  %l.addr = alloca i64, align 8
  %d2.addr = alloca double, align 8
  %c = trunc i32 %0 to i8
  store i8 %c, i8* %c.addr, align 1
  %f1 = fptrunc double %1 to float
  store float %f1, float* %f1.addr, align 4
  %s = trunc i32 %2 to i16
  store i16 %s, i16* %s.addr, align 2
  store double %d1, double* %d1.addr, align 8
  store i32 %i, i32* %i.addr, align 4
  %f2 = fptrunc double %3 to float
  store float %f2, float* %f2.addr, align 4
  store i64 %l, i64* %l.addr, align 8
  store double %d2, double* %d2.addr, align 8
  %4 = load i8* %c.addr, align 1
  %conv = sext i8 %4 to i32
  %5 = load float* %f1.addr, align 4
  %mul = fmul float 1.000000e+02, %5
  %conv1 = fptosi float %mul to i32
  %6 = load i16* %s.addr, align 2
  %conv2 = sext i16 %6 to i32
  %7 = load double* %d1.addr, align 8
  %mul3 = fmul double 1.000000e+02, %7
  %conv4 = fptosi double %mul3 to i32
  %8 = load i32* %i.addr, align 4
  %9 = load float* %f2.addr, align 4
  %mul5 = fmul float 1.000000e+02, %9
  %conv6 = fptosi float %mul5 to i32
  %10 = load i64* %l.addr, align 8
  %11 = load double* %d2.addr, align 8
  %mul7 = fmul double 1.000000e+02, %11
  %conv8 = fptosi double %mul7 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i32 0, i32 0), i32 %conv, i32 %conv1, i32 %conv2, i32 %conv4, i32 %8, i32 %conv6, i64 %10, i32 %conv8)
  ret void
}

declare i32 @printf(i8*, ...)

define void @p2(i8 signext %c, float %f1, i16 signext %s, double %d1, i32 %i, float %f2, i64 %l, double %d2) nounwind uwtable {
entry:
  %c.addr = alloca i8, align 1
  %f1.addr = alloca float, align 4
  %s.addr = alloca i16, align 2
  %d1.addr = alloca double, align 8
  %i.addr = alloca i32, align 4
  %f2.addr = alloca float, align 4
  %l.addr = alloca i64, align 8
  %d2.addr = alloca double, align 8
  store i8 %c, i8* %c.addr, align 1
  store float %f1, float* %f1.addr, align 4
  store i16 %s, i16* %s.addr, align 2
  store double %d1, double* %d1.addr, align 8
  store i32 %i, i32* %i.addr, align 4
  store float %f2, float* %f2.addr, align 4
  store i64 %l, i64* %l.addr, align 8
  store double %d2, double* %d2.addr, align 8
  %0 = load i8* %c.addr, align 1
  %conv = sext i8 %0 to i32
  %1 = load float* %f1.addr, align 4
  %mul = fmul float 1.000000e+02, %1
  %conv1 = fptosi float %mul to i32
  %2 = load i16* %s.addr, align 2
  %conv2 = sext i16 %2 to i32
  %3 = load double* %d1.addr, align 8
  %mul3 = fmul double 1.000000e+02, %3
  %conv4 = fptosi double %mul3 to i32
  %4 = load i32* %i.addr, align 4
  %5 = load float* %f2.addr, align 4
  %mul5 = fmul float 1.000000e+02, %5
  %conv6 = fptosi float %mul5 to i32
  %6 = load i64* %l.addr, align 8
  %7 = load double* %d2.addr, align 8
  %mul7 = fmul double 1.000000e+02, %7
  %conv8 = fptosi double %mul7 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i32 0, i32 0), i32 %conv, i32 %conv1, i32 %conv2, i32 %conv4, i32 %4, i32 %conv6, i64 %6, i32 %conv8)
  ret void
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  call void (...)* bitcast (void (i32, double, i32, double, i32, double, i64, double)* @p1 to void (...)*)(i32 97, double 4.000000e+00, i32 1, double 5.000000e+00, i32 2, double 4.000000e+00, i64 3, double 5.000000e+00)
  call void @p2(i8 signext 97, float 4.000000e+00, i16 signext 1, double 5.000000e+00, i32 2, float 4.000000e+00, i64 3, double 5.000000e+00)
  ret i32 0
}
