; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/negativeFloat.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define void @f(double %d) nounwind uwtable {
entry:
  %d.addr = alloca double, align 8
  store double %d, double* %d.addr, align 8
  %tmp = load double* %d.addr, align 8
  %sub = fsub double -0.000000e+00, %tmp
  %mul = fmul double %sub, 1.000000e+02
  %conv = fptosi double %mul to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %conv)
  ret void
}

declare i32 @printf(i8*, ...)

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca double, align 8
  store i32 0, i32* %retval
  store double 5.000000e+00, double* %x, align 8
  call void @f(double 6.200000e+00)
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 -350)
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i64 8)
  %0 = load i32* %retval
  ret i32 %0
}
