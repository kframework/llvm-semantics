; ModuleID = '/home/david/src/c-semantics/tests/llvm-regression/callargs.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [36 x i8] c"\0AprintArgsNoRet with 15 arguments:\0A\00", align 1
@.str1 = private unnamed_addr constant [29 x i8] c"\09Args 1-5  : %d %d %c %d %c\0A\00", align 1
@.str2 = private unnamed_addr constant [29 x i8] c"\09Args 6-10 : %d %d %c %d %c\0A\00", align 1
@.str3 = private unnamed_addr constant [29 x i8] c"\09Args 11-14: %d %d %c %d %c\0A\00", align 1
@.str4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str5 = private unnamed_addr constant [2 x i8] c"e\00", align 1
@.str6 = private unnamed_addr constant [2 x i8] c"j\00", align 1
@.str7 = private unnamed_addr constant [2 x i8] c"o\00", align 1

define void @printArgsNoRet(i32 %a1, float %a2, i8 signext %a3, double %a4, i8* %a5, i32 %a6, float %a7, i8 signext %a8, double %a9, i8* %a10, i32 %a11, float %a12, i8 signext %a13, double %a14, i8* %a15) nounwind uwtable {
entry:
  %a1.addr = alloca i32, align 4
  %a2.addr = alloca float, align 4
  %a3.addr = alloca i8, align 1
  %a4.addr = alloca double, align 8
  %a5.addr = alloca i8*, align 8
  %a6.addr = alloca i32, align 4
  %a7.addr = alloca float, align 4
  %a8.addr = alloca i8, align 1
  %a9.addr = alloca double, align 8
  %a10.addr = alloca i8*, align 8
  %a11.addr = alloca i32, align 4
  %a12.addr = alloca float, align 4
  %a13.addr = alloca i8, align 1
  %a14.addr = alloca double, align 8
  %a15.addr = alloca i8*, align 8
  store i32 %a1, i32* %a1.addr, align 4
  store float %a2, float* %a2.addr, align 4
  store i8 %a3, i8* %a3.addr, align 1
  store double %a4, double* %a4.addr, align 8
  store i8* %a5, i8** %a5.addr, align 8
  store i32 %a6, i32* %a6.addr, align 4
  store float %a7, float* %a7.addr, align 4
  store i8 %a8, i8* %a8.addr, align 1
  store double %a9, double* %a9.addr, align 8
  store i8* %a10, i8** %a10.addr, align 8
  store i32 %a11, i32* %a11.addr, align 4
  store float %a12, float* %a12.addr, align 4
  store i8 %a13, i8* %a13.addr, align 1
  store double %a14, double* %a14.addr, align 8
  store i8* %a15, i8** %a15.addr, align 8
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str, i32 0, i32 0))
  %0 = load i32* %a1.addr, align 4
  %1 = load float* %a2.addr, align 4
  %conv = fptosi float %1 to i32
  %2 = load i8* %a3.addr, align 1
  %conv1 = sext i8 %2 to i32
  %3 = load double* %a4.addr, align 8
  %conv2 = fptosi double %3 to i32
  %4 = load i8** %a5.addr, align 8
  %5 = load i8* %4, align 1
  %conv3 = sext i8 %5 to i32
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str1, i32 0, i32 0), i32 %0, i32 %conv, i32 %conv1, i32 %conv2, i32 %conv3)
  %6 = load i32* %a6.addr, align 4
  %7 = load float* %a7.addr, align 4
  %conv5 = fptosi float %7 to i32
  %8 = load i8* %a8.addr, align 1
  %conv6 = sext i8 %8 to i32
  %9 = load double* %a9.addr, align 8
  %conv7 = fptosi double %9 to i32
  %10 = load i8** %a10.addr, align 8
  %11 = load i8* %10, align 1
  %conv8 = sext i8 %11 to i32
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str2, i32 0, i32 0), i32 %6, i32 %conv5, i32 %conv6, i32 %conv7, i32 %conv8)
  %12 = load i32* %a11.addr, align 4
  %13 = load float* %a12.addr, align 4
  %conv10 = fptosi float %13 to i32
  %14 = load i8* %a13.addr, align 1
  %conv11 = sext i8 %14 to i32
  %15 = load double* %a14.addr, align 8
  %conv12 = fptosi double %15 to i32
  %16 = load i8** %a15.addr, align 8
  %17 = load i8* %16, align 1
  %conv13 = sext i8 %17 to i32
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str3, i32 0, i32 0), i32 %12, i32 %conv10, i32 %conv11, i32 %conv12, i32 %conv13)
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str4, i32 0, i32 0))
  ret void
}

declare i32 @printf(i8*, ...)

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  call void @printArgsNoRet(i32 1, float 0x4000CCCCC0000000, i8 signext 99, double 4.100000e+00, i8* getelementptr inbounds ([2 x i8]* @.str5, i32 0, i32 0), i32 6, float 0x401C666660000000, i8 signext 104, double 9.100000e+00, i8* getelementptr inbounds ([2 x i8]* @.str6, i32 0, i32 0), i32 11, float 0x4028333340000000, i8 signext 109, double 1.410000e+01, i8* getelementptr inbounds ([2 x i8]* @.str7, i32 0, i32 0))
  ret i32 0
}
