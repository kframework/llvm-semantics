; ModuleID = '/home/david/src/c-semantics/tests/lcc-tests/cvt.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [25 x i8] c"%d %d %d %d %u %u %u %u\0A\00", align 1
@c = common global i8 0, align 1
@s = common global i16 0, align 2
@i = common global i32 0, align 4
@l = common global i64 0, align 8
@C = common global i8 0, align 1
@S = common global i16 0, align 2
@I = common global i32 0, align 4
@L = common global i64 0, align 8
@f = common global float 0.000000e+00, align 4
@d = common global double 0.000000e+00, align 8
@D = common global x86_fp80 0xK00000000000000000000, align 16
@p = common global i8* null, align 8
@P = common global void ()* null, align 8

define void @print() nounwind uwtable {
entry:
  %0 = load i8* @c, align 1
  %conv = sext i8 %0 to i32
  %1 = load i16* @s, align 2
  %conv1 = sext i16 %1 to i32
  %2 = load i32* @i, align 4
  %3 = load i64* @l, align 8
  %4 = load i8* @C, align 1
  %conv2 = zext i8 %4 to i32
  %5 = load i16* @S, align 2
  %conv3 = zext i16 %5 to i32
  %6 = load i32* @I, align 4
  %7 = load i64* @L, align 8
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i32 0, i32 0), i32 %conv, i32 %conv1, i32 %2, i64 %3, i32 %conv2, i32 %conv3, i32 %6, i64 %7)
  ret void
}

declare i32 @printf(i8*, ...)

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i8 1, i8* @c, align 1
  %0 = load i8* @c, align 1
  %conv = sext i8 %0 to i16
  store i16 %conv, i16* @s, align 2
  %1 = load i8* @c, align 1
  %conv1 = sext i8 %1 to i32
  store i32 %conv1, i32* @i, align 4
  %2 = load i8* @c, align 1
  %conv2 = sext i8 %2 to i64
  store i64 %conv2, i64* @l, align 8
  %3 = load i8* @c, align 1
  store i8 %3, i8* @C, align 1
  %4 = load i8* @c, align 1
  %conv3 = sext i8 %4 to i16
  store i16 %conv3, i16* @S, align 2
  %5 = load i8* @c, align 1
  %conv4 = sext i8 %5 to i32
  store i32 %conv4, i32* @I, align 4
  %6 = load i8* @c, align 1
  %conv5 = sext i8 %6 to i64
  store i64 %conv5, i64* @L, align 8
  %7 = load i8* @c, align 1
  %conv6 = sitofp i8 %7 to float
  store float %conv6, float* @f, align 4
  %8 = load i8* @c, align 1
  %conv7 = sitofp i8 %8 to double
  store double %conv7, double* @d, align 8
  %9 = load i8* @c, align 1
  %conv8 = sitofp i8 %9 to x86_fp80
  store x86_fp80 %conv8, x86_fp80* @D, align 16
  call void @print()
  store i16 2, i16* @s, align 2
  %10 = load i16* @s, align 2
  %conv9 = trunc i16 %10 to i8
  store i8 %conv9, i8* @c, align 1
  %11 = load i16* @s, align 2
  %conv10 = sext i16 %11 to i32
  store i32 %conv10, i32* @i, align 4
  %12 = load i16* @s, align 2
  %conv11 = sext i16 %12 to i64
  store i64 %conv11, i64* @l, align 8
  %13 = load i16* @s, align 2
  %conv12 = trunc i16 %13 to i8
  store i8 %conv12, i8* @C, align 1
  %14 = load i16* @s, align 2
  store i16 %14, i16* @S, align 2
  %15 = load i16* @s, align 2
  %conv13 = sext i16 %15 to i32
  store i32 %conv13, i32* @I, align 4
  %16 = load i16* @s, align 2
  %conv14 = sext i16 %16 to i64
  store i64 %conv14, i64* @L, align 8
  %17 = load i16* @s, align 2
  %conv15 = sitofp i16 %17 to float
  store float %conv15, float* @f, align 4
  %18 = load i16* @s, align 2
  %conv16 = sitofp i16 %18 to double
  store double %conv16, double* @d, align 8
  %19 = load i16* @s, align 2
  %conv17 = sitofp i16 %19 to x86_fp80
  store x86_fp80 %conv17, x86_fp80* @D, align 16
  call void @print()
  store i32 3, i32* @i, align 4
  %20 = load i32* @i, align 4
  %conv18 = trunc i32 %20 to i8
  store i8 %conv18, i8* @c, align 1
  %21 = load i32* @i, align 4
  %conv19 = trunc i32 %21 to i16
  store i16 %conv19, i16* @s, align 2
  %22 = load i32* @i, align 4
  %conv20 = sext i32 %22 to i64
  store i64 %conv20, i64* @l, align 8
  %23 = load i32* @i, align 4
  %conv21 = trunc i32 %23 to i8
  store i8 %conv21, i8* @C, align 1
  %24 = load i32* @i, align 4
  %conv22 = trunc i32 %24 to i16
  store i16 %conv22, i16* @S, align 2
  %25 = load i32* @i, align 4
  store i32 %25, i32* @I, align 4
  %26 = load i32* @i, align 4
  %conv23 = sext i32 %26 to i64
  store i64 %conv23, i64* @L, align 8
  %27 = load i32* @i, align 4
  %conv24 = sitofp i32 %27 to float
  store float %conv24, float* @f, align 4
  %28 = load i32* @i, align 4
  %conv25 = sitofp i32 %28 to double
  store double %conv25, double* @d, align 8
  %29 = load i32* @i, align 4
  %conv26 = sitofp i32 %29 to x86_fp80
  store x86_fp80 %conv26, x86_fp80* @D, align 16
  call void @print()
  store i64 4, i64* @l, align 8
  %30 = load i64* @l, align 8
  %conv27 = trunc i64 %30 to i8
  store i8 %conv27, i8* @c, align 1
  %31 = load i64* @l, align 8
  %conv28 = trunc i64 %31 to i16
  store i16 %conv28, i16* @s, align 2
  %32 = load i64* @l, align 8
  %conv29 = trunc i64 %32 to i32
  store i32 %conv29, i32* @i, align 4
  %33 = load i64* @l, align 8
  %conv30 = trunc i64 %33 to i8
  store i8 %conv30, i8* @C, align 1
  %34 = load i64* @l, align 8
  %conv31 = trunc i64 %34 to i16
  store i16 %conv31, i16* @S, align 2
  %35 = load i64* @l, align 8
  %conv32 = trunc i64 %35 to i32
  store i32 %conv32, i32* @I, align 4
  %36 = load i64* @l, align 8
  store i64 %36, i64* @L, align 8
  %37 = load i64* @l, align 8
  %conv33 = sitofp i64 %37 to float
  store float %conv33, float* @f, align 4
  %38 = load i64* @l, align 8
  %conv34 = sitofp i64 %38 to double
  store double %conv34, double* @d, align 8
  %39 = load i64* @l, align 8
  %conv35 = sitofp i64 %39 to x86_fp80
  store x86_fp80 %conv35, x86_fp80* @D, align 16
  call void @print()
  store i8 5, i8* @C, align 1
  %40 = load i8* @C, align 1
  store i8 %40, i8* @c, align 1
  %41 = load i8* @C, align 1
  %conv36 = zext i8 %41 to i16
  store i16 %conv36, i16* @s, align 2
  %42 = load i8* @C, align 1
  %conv37 = zext i8 %42 to i32
  store i32 %conv37, i32* @i, align 4
  %43 = load i8* @C, align 1
  %conv38 = zext i8 %43 to i64
  store i64 %conv38, i64* @l, align 8
  %44 = load i8* @C, align 1
  %conv39 = zext i8 %44 to i16
  store i16 %conv39, i16* @S, align 2
  %45 = load i8* @C, align 1
  %conv40 = zext i8 %45 to i32
  store i32 %conv40, i32* @I, align 4
  %46 = load i8* @C, align 1
  %conv41 = zext i8 %46 to i64
  store i64 %conv41, i64* @L, align 8
  %47 = load i8* @C, align 1
  %conv42 = uitofp i8 %47 to float
  store float %conv42, float* @f, align 4
  %48 = load i8* @C, align 1
  %conv43 = uitofp i8 %48 to double
  store double %conv43, double* @d, align 8
  %49 = load i8* @C, align 1
  %conv44 = uitofp i8 %49 to x86_fp80
  store x86_fp80 %conv44, x86_fp80* @D, align 16
  call void @print()
  store i16 6, i16* @S, align 2
  %50 = load i16* @S, align 2
  %conv45 = trunc i16 %50 to i8
  store i8 %conv45, i8* @c, align 1
  %51 = load i16* @S, align 2
  store i16 %51, i16* @s, align 2
  %52 = load i16* @S, align 2
  %conv46 = zext i16 %52 to i32
  store i32 %conv46, i32* @i, align 4
  %53 = load i16* @S, align 2
  %conv47 = zext i16 %53 to i64
  store i64 %conv47, i64* @l, align 8
  %54 = load i16* @S, align 2
  %conv48 = trunc i16 %54 to i8
  store i8 %conv48, i8* @C, align 1
  %55 = load i16* @S, align 2
  %conv49 = zext i16 %55 to i32
  store i32 %conv49, i32* @I, align 4
  %56 = load i16* @S, align 2
  %conv50 = zext i16 %56 to i64
  store i64 %conv50, i64* @L, align 8
  %57 = load i16* @S, align 2
  %conv51 = uitofp i16 %57 to float
  store float %conv51, float* @f, align 4
  %58 = load i16* @S, align 2
  %conv52 = uitofp i16 %58 to double
  store double %conv52, double* @d, align 8
  %59 = load i16* @S, align 2
  %conv53 = uitofp i16 %59 to x86_fp80
  store x86_fp80 %conv53, x86_fp80* @D, align 16
  call void @print()
  store i32 7, i32* @I, align 4
  %60 = load i32* @I, align 4
  %conv54 = trunc i32 %60 to i8
  store i8 %conv54, i8* @c, align 1
  %61 = load i32* @I, align 4
  %conv55 = trunc i32 %61 to i16
  store i16 %conv55, i16* @s, align 2
  %62 = load i32* @I, align 4
  store i32 %62, i32* @i, align 4
  %63 = load i32* @I, align 4
  %conv56 = zext i32 %63 to i64
  store i64 %conv56, i64* @l, align 8
  %64 = load i32* @I, align 4
  %conv57 = trunc i32 %64 to i8
  store i8 %conv57, i8* @C, align 1
  %65 = load i32* @I, align 4
  %conv58 = trunc i32 %65 to i16
  store i16 %conv58, i16* @S, align 2
  %66 = load i32* @I, align 4
  %conv59 = zext i32 %66 to i64
  store i64 %conv59, i64* @L, align 8
  %67 = load i32* @I, align 4
  %conv60 = uitofp i32 %67 to float
  store float %conv60, float* @f, align 4
  %68 = load i32* @I, align 4
  %conv61 = uitofp i32 %68 to double
  store double %conv61, double* @d, align 8
  %69 = load i32* @I, align 4
  %conv62 = uitofp i32 %69 to x86_fp80
  store x86_fp80 %conv62, x86_fp80* @D, align 16
  call void @print()
  store i64 8, i64* @L, align 8
  %70 = load i64* @L, align 8
  %conv63 = trunc i64 %70 to i8
  store i8 %conv63, i8* @c, align 1
  %71 = load i64* @L, align 8
  %conv64 = trunc i64 %71 to i16
  store i16 %conv64, i16* @s, align 2
  %72 = load i64* @L, align 8
  %conv65 = trunc i64 %72 to i32
  store i32 %conv65, i32* @i, align 4
  %73 = load i64* @L, align 8
  store i64 %73, i64* @l, align 8
  %74 = load i64* @L, align 8
  %conv66 = trunc i64 %74 to i8
  store i8 %conv66, i8* @C, align 1
  %75 = load i64* @L, align 8
  %conv67 = trunc i64 %75 to i16
  store i16 %conv67, i16* @S, align 2
  %76 = load i16* @S, align 2
  %conv68 = zext i16 %76 to i32
  store i32 %conv68, i32* @I, align 4
  %77 = load i64* @L, align 8
  %conv69 = uitofp i64 %77 to float
  store float %conv69, float* @f, align 4
  %78 = load i64* @L, align 8
  %conv70 = uitofp i64 %78 to double
  store double %conv70, double* @d, align 8
  %79 = load i64* @L, align 8
  %conv71 = uitofp i64 %79 to x86_fp80
  store x86_fp80 %conv71, x86_fp80* @D, align 16
  call void @print()
  store float 9.000000e+00, float* @f, align 4
  %80 = load float* @f, align 4
  %conv72 = fptosi float %80 to i8
  store i8 %conv72, i8* @c, align 1
  %81 = load float* @f, align 4
  %conv73 = fptosi float %81 to i16
  store i16 %conv73, i16* @s, align 2
  %82 = load float* @f, align 4
  %conv74 = fptosi float %82 to i32
  store i32 %conv74, i32* @i, align 4
  %83 = load float* @f, align 4
  %conv75 = fptosi float %83 to i64
  store i64 %conv75, i64* @l, align 8
  %84 = load float* @f, align 4
  %conv76 = fptoui float %84 to i8
  store i8 %conv76, i8* @C, align 1
  %85 = load float* @f, align 4
  %conv77 = fptoui float %85 to i16
  store i16 %conv77, i16* @S, align 2
  %86 = load float* @f, align 4
  %conv78 = fptoui float %86 to i32
  store i32 %conv78, i32* @I, align 4
  %87 = load float* @f, align 4
  %conv79 = fptoui float %87 to i64
  store i64 %conv79, i64* @L, align 8
  %88 = load float* @f, align 4
  %conv80 = fpext float %88 to double
  store double %conv80, double* @d, align 8
  %89 = load float* @f, align 4
  %conv81 = fpext float %89 to x86_fp80
  store x86_fp80 %conv81, x86_fp80* @D, align 16
  call void @print()
  store double 1.000000e+01, double* @d, align 8
  %90 = load double* @d, align 8
  %conv82 = fptosi double %90 to i8
  store i8 %conv82, i8* @c, align 1
  %91 = load double* @d, align 8
  %conv83 = fptosi double %91 to i16
  store i16 %conv83, i16* @s, align 2
  %92 = load double* @d, align 8
  %conv84 = fptosi double %92 to i32
  store i32 %conv84, i32* @i, align 4
  %93 = load double* @d, align 8
  %conv85 = fptosi double %93 to i64
  store i64 %conv85, i64* @l, align 8
  %94 = load double* @d, align 8
  %conv86 = fptoui double %94 to i8
  store i8 %conv86, i8* @C, align 1
  %95 = load double* @d, align 8
  %conv87 = fptoui double %95 to i16
  store i16 %conv87, i16* @S, align 2
  %96 = load double* @d, align 8
  %conv88 = fptoui double %96 to i32
  store i32 %conv88, i32* @I, align 4
  %97 = load double* @d, align 8
  %conv89 = fptoui double %97 to i64
  store i64 %conv89, i64* @L, align 8
  %98 = load double* @d, align 8
  %conv90 = fptrunc double %98 to float
  store float %conv90, float* @f, align 4
  %99 = load double* @d, align 8
  %conv91 = fpext double %99 to x86_fp80
  store x86_fp80 %conv91, x86_fp80* @D, align 16
  call void @print()
  store x86_fp80 0xK4002B000000000000000, x86_fp80* @D, align 16
  %100 = load x86_fp80* @D, align 16
  %conv92 = fptosi x86_fp80 %100 to i8
  store i8 %conv92, i8* @c, align 1
  %101 = load x86_fp80* @D, align 16
  %conv93 = fptosi x86_fp80 %101 to i16
  store i16 %conv93, i16* @s, align 2
  %102 = load x86_fp80* @D, align 16
  %conv94 = fptosi x86_fp80 %102 to i32
  store i32 %conv94, i32* @i, align 4
  %103 = load x86_fp80* @D, align 16
  %conv95 = fptosi x86_fp80 %103 to i64
  store i64 %conv95, i64* @l, align 8
  %104 = load x86_fp80* @D, align 16
  %conv96 = fptoui x86_fp80 %104 to i8
  store i8 %conv96, i8* @C, align 1
  %105 = load x86_fp80* @D, align 16
  %conv97 = fptoui x86_fp80 %105 to i16
  store i16 %conv97, i16* @S, align 2
  %106 = load x86_fp80* @D, align 16
  %conv98 = fptoui x86_fp80 %106 to i32
  store i32 %conv98, i32* @I, align 4
  %107 = load x86_fp80* @D, align 16
  %conv99 = fptoui x86_fp80 %107 to i64
  store i64 %conv99, i64* @L, align 8
  %108 = load x86_fp80* @D, align 16
  %conv100 = fptrunc x86_fp80 %108 to float
  store float %conv100, float* @f, align 4
  %109 = load x86_fp80* @D, align 16
  %conv101 = fptrunc x86_fp80 %109 to double
  store double %conv101, double* @d, align 8
  call void @print()
  store i8* null, i8** @p, align 8
  store i8* null, i8** @p, align 8
  store i8* null, i8** @p, align 8
  store i8* null, i8** @p, align 8
  %110 = load void ()** @P, align 8
  %111 = bitcast void ()* %110 to i8*
  store i8* %111, i8** @p, align 8
  store void ()* null, void ()** @P, align 8
  store void ()* null, void ()** @P, align 8
  store void ()* null, void ()** @P, align 8
  store void ()* null, void ()** @P, align 8
  %112 = load i8** @p, align 8
  %113 = bitcast i8* %112 to void ()*
  store void ()* %113, void ()** @P, align 8
  ret i32 0
}
