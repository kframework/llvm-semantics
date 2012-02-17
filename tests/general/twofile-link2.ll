; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/twofile-link2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@f.r = internal global i32 0, align 4
@.str = private unnamed_addr constant [11 x i8] c"  2z = %d\0A\00", align 1
@z = common global i32 0, align 4
@.str1 = private unnamed_addr constant [11 x i8] c"  2w = %d\0A\00", align 1
@w = internal global i32 13, align 4
@.str2 = private unnamed_addr constant [11 x i8] c"  2r = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [11 x i8] c"  2c = %d\0A\00", align 1
@c = external global i32
@.str4 = private unnamed_addr constant [14 x i8] c"  2g(5) = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [11 x i8] c"  2v = %d\0A\00", align 1

define i32 @f(i32 %x, i32 %y) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  %v = alloca double, align 8
  store i32 %x, i32* %x.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  %tmp = load i32* @f.r, align 4
  %inc = add nsw i32 %tmp, 1
  store i32 %inc, i32* @f.r, align 4
  store double 1.800000e+00, double* %v, align 8
  %tmp2 = load i32* @z, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0), i32 %tmp2)
  %tmp3 = load i32* @w, align 4
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str1, i32 0, i32 0), i32 %tmp3)
  %tmp5 = load i32* @f.r, align 4
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str2, i32 0, i32 0), i32 %tmp5)
  %tmp7 = load i32* @c, align 4
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str3, i32 0, i32 0), i32 %tmp7)
  %call9 = call i32 @g(i32 5)
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str4, i32 0, i32 0), i32 %call9)
  %tmp11 = load double* %v, align 8
  %mul = fmul double %tmp11, 1.000000e+03
  %conv = fptosi double %mul to i32
  %call12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str5, i32 0, i32 0), i32 %conv)
  %tmp13 = load i32* %x.addr, align 4
  %mul14 = mul nsw i32 %tmp13, 2
  %tmp15 = load i32* %y.addr, align 4
  %add = add nsw i32 %mul14, %tmp15
  ret i32 %add
}

declare i32 @printf(i8*, ...)

define internal i32 @g(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %tmp1 = load i32* %x.addr, align 4
  %mul = mul nsw i32 %tmp, %tmp1
  ret i32 %mul
}
