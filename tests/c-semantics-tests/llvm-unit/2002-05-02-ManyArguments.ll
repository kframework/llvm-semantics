; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2002-05-02-ManyArguments.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [20 x i8] c"%d, %d, %d, %d, %d\0A\00", align 1
@.str1 = private unnamed_addr constant [23 x i8] c"%d, %ld, %d, %d, %lld\0A\00", align 1

define void @printfn(i32 %a, i16 signext %b, double %C, float %D, i8 signext %E, i8 signext %F, i8* %G, double* %H, i32 %I, i64 %J) nounwind uwtable {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i16, align 2
  %C.addr = alloca double, align 8
  %D.addr = alloca float, align 4
  %E.addr = alloca i8, align 1
  %F.addr = alloca i8, align 1
  %G.addr = alloca i8*, align 8
  %H.addr = alloca double*, align 8
  %I.addr = alloca i32, align 4
  %J.addr = alloca i64, align 8
  store i32 %a, i32* %a.addr, align 4
  store i16 %b, i16* %b.addr, align 2
  store double %C, double* %C.addr, align 8
  store float %D, float* %D.addr, align 4
  store i8 %E, i8* %E.addr, align 1
  store i8 %F, i8* %F.addr, align 1
  store i8* %G, i8** %G.addr, align 8
  store double* %H, double** %H.addr, align 8
  store i32 %I, i32* %I.addr, align 4
  store i64 %J, i64* %J.addr, align 8
  %0 = load i32* %a.addr, align 4
  %1 = load i16* %b.addr, align 2
  %conv = sext i16 %1 to i32
  %2 = load double* %C.addr, align 8
  %mul = fmul double 1.000000e+02, %2
  %conv1 = fptosi double %mul to i32
  %3 = load float* %D.addr, align 4
  %mul2 = fmul float 1.000000e+02, %3
  %conv3 = fptosi float %mul2 to i32
  %4 = load i8* %E.addr, align 1
  %conv4 = sext i8 %4 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str, i32 0, i32 0), i32 %0, i32 %conv, i32 %conv1, i32 %conv3, i32 %conv4)
  %5 = load i8* %F.addr, align 1
  %conv5 = sext i8 %5 to i32
  %6 = load i8** %G.addr, align 8
  %7 = bitcast i8* %6 to i32*
  %8 = load i32* %7, align 4
  %conv6 = sext i32 %8 to i64
  %9 = load double** %H.addr, align 8
  %cmp = icmp eq double* %9, null
  %conv7 = zext i1 %cmp to i32
  %10 = load i32* %I.addr, align 4
  %11 = load i64* %J.addr, align 8
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str1, i32 0, i32 0), i32 %conv5, i64 %conv6, i32 %conv7, i32 %10, i64 %11)
  ret void
}

declare i32 @printf(i8*, ...)

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 5, i32* %x, align 4
  %0 = bitcast i32* %x to i8*
  call void @printfn(i32 12, i16 signext 2, double 1.232340e+02, float 0x40933C7E20000000, i8 signext -12, i8 signext 23, i8* %0, double* null, i32 1234567, i64 123124124124)
  ret i32 0
}
