; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/floats-ull.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [15 x i8] c"Messed up 1.99\00", align 1
@.str1 = private unnamed_addr constant [23 x i8] c"VOLATILE: Messed up &&\00", align 1
@.str2 = private unnamed_addr constant [13 x i8] c"Messed up ~~\00", align 1
@.str3 = private unnamed_addr constant [14 x i8] c"Messed up 0.0\00", align 1

define i64 @f2ull(float %f) nounwind uwtable {
entry:
  %f.addr = alloca float, align 4
  store float %f, float* %f.addr, align 4
  %tmp = load float* %f.addr, align 4
  %conv = fptoui float %tmp to i64
  ret i64 %conv
}

define i64 @d2ull(double %d) nounwind uwtable {
entry:
  %d.addr = alloca double, align 8
  store double %d, double* %d.addr, align 8
  %tmp = load double* %d.addr, align 8
  %conv = fptoui double %tmp to i64
  ret i64 %conv
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %innerInt = alloca i64, align 8
  %innerFloat = alloca float, align 4
  %lhs_ull = alloca i64, align 8
  %choice1 = alloca i64, align 8
  %choice2 = alloca i64, align 8
  store i32 0, i32* %retval
  %call = call i64 @f2ull(float 0x3FFFD70A40000000)
  %cmp = icmp ne i64 %call, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call i32 @puts(i8* getelementptr inbounds ([15 x i8]* @.str, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  store i64 9223372036854775807, i64* %innerInt, align 8
  %tmp = load i64* %innerInt, align 8
  %conv = uitofp i64 %tmp to float
  store float %conv, float* %innerFloat, align 4
  %tmp3 = load float* %innerFloat, align 4
  %call4 = call i64 @f2ull(float %tmp3)
  store i64 %call4, i64* %lhs_ull, align 8
  store i64 9223372036854775807, i64* %choice1, align 8
  store i64 -9223372036854775808, i64* %choice2, align 8
  %tmp7 = load i64* %lhs_ull, align 8
  %tmp8 = load i64* %choice1, align 8
  %cmp9 = icmp ne i64 %tmp7, %tmp8
  br i1 %cmp9, label %land.lhs.true, label %if.end17

land.lhs.true:                                    ; preds = %if.end
  %tmp11 = load i64* %lhs_ull, align 8
  %tmp12 = load i64* %choice2, align 8
  %cmp13 = icmp ne i64 %tmp11, %tmp12
  br i1 %cmp13, label %if.then15, label %if.end17

if.then15:                                        ; preds = %land.lhs.true
  %call16 = call i32 @puts(i8* getelementptr inbounds ([23 x i8]* @.str1, i32 0, i32 0))
  br label %if.end17

if.end17:                                         ; preds = %if.then15, %land.lhs.true, %if.end
  %call18 = call i64 @f2ull(float 0x43E0000000000000)
  %cmp19 = icmp ne i64 %call18, -9223372036854775808
  br i1 %cmp19, label %if.then21, label %if.end23

if.then21:                                        ; preds = %if.end17
  %call22 = call i32 @puts(i8* getelementptr inbounds ([13 x i8]* @.str2, i32 0, i32 0))
  br label %if.end23

if.end23:                                         ; preds = %if.then21, %if.end17
  %call24 = call i64 @d2ull(double 0.000000e+00)
  %cmp25 = icmp ne i64 %call24, 0
  br i1 %cmp25, label %if.then27, label %if.end29

if.then27:                                        ; preds = %if.end23
  %call28 = call i32 @puts(i8* getelementptr inbounds ([14 x i8]* @.str3, i32 0, i32 0))
  br label %if.end29

if.end29:                                         ; preds = %if.then27, %if.end23
  ret i32 0
}

declare i32 @puts(i8*)
