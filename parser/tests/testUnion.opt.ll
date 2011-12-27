; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/testUnion.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i32, %union.anon }
%union.anon = type { double }

@.str1 = private unnamed_addr constant [8 x i8] c"%d, %d\0A\00", align 1
@.str3 = private unnamed_addr constant [48 x i8] c"s->u.s_floats[0] != - s->u.s_floats[1]: %f, %f\0A\00", align 1
@.str5 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str6 = private unnamed_addr constant [26 x i8] c"s->u.s_double is off: %f\0A\00", align 1
@str = internal constant [22 x i8] c"This S has type INTS.\00"
@str1 = internal constant [24 x i8] c"This S has type FLOATS.\00"
@str2 = internal constant [24 x i8] c"This S has type DOUBLE.\00"

define void @do_something(%struct.S* %s) nounwind uwtable {
entry:
  %s_type = getelementptr inbounds %struct.S* %s, i64 0, i32 0
  %tmp1 = load i32* %s_type, align 4
  switch i32 %tmp1, label %sw.epilog [
    i32 0, label %sw.bb
    i32 1, label %sw.bb10
    i32 2, label %sw.bb49
  ]

sw.bb:                                            ; preds = %entry
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([22 x i8]* @str, i64 0, i64 0))
  %u = getelementptr inbounds %struct.S* %s, i64 0, i32 1
  %arrayidx = bitcast %union.anon* %u to i32*
  %tmp3 = load i32* %arrayidx, align 4
  %s_ints6 = bitcast %union.anon* %u to [2 x i32]*
  %arrayidx7 = getelementptr inbounds [2 x i32]* %s_ints6, i64 0, i64 1
  %tmp8 = load i32* %arrayidx7, align 4
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), i32 %tmp3, i32 %tmp8) nounwind
  br label %sw.epilog

sw.bb10:                                          ; preds = %entry
  %puts1 = tail call i32 @puts(i8* getelementptr inbounds ([24 x i8]* @str1, i64 0, i64 0))
  %u13 = getelementptr inbounds %struct.S* %s, i64 0, i32 1
  %arrayidx14 = bitcast %union.anon* %u13 to float*
  %tmp15 = load float* %arrayidx14, align 4
  %mul = fmul float %tmp15, 1.000000e+04
  %conv = fptosi float %mul to i32
  %s_floats18 = bitcast %union.anon* %u13 to [2 x float]*
  %arrayidx19 = getelementptr inbounds [2 x float]* %s_floats18, i64 0, i64 1
  %tmp20 = load float* %arrayidx19, align 4
  %mul21 = fmul float %tmp20, 1.000000e+04
  %conv22 = fptosi float %mul21 to i32
  %call23 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), i32 %conv, i32 %conv22) nounwind
  %tmp28 = load float* %arrayidx14, align 4
  %tmp33 = load float* %arrayidx19, align 4
  %sub = fsub float -0.000000e+00, %tmp33
  %cmp = fcmp une float %tmp28, %sub
  br i1 %cmp, label %if.then, label %sw.epilog

if.then:                                          ; preds = %sw.bb10
  %conv40 = fpext float %tmp28 to double
  %conv47 = fpext float %sub to double
  %call48 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([48 x i8]* @.str3, i64 0, i64 0), double %conv40, double %conv47) nounwind
  br label %sw.epilog

sw.bb49:                                          ; preds = %entry
  %puts2 = tail call i32 @puts(i8* getelementptr inbounds ([24 x i8]* @str2, i64 0, i64 0))
  %s_double = getelementptr inbounds %struct.S* %s, i64 0, i32 1, i32 0
  %tmp53 = load double* %s_double, align 8
  %mul54 = fmul double %tmp53, 1.000000e+04
  %conv55 = fptosi double %mul54 to i32
  %call56 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str5, i64 0, i64 0), i32 %conv55) nounwind
  %tmp60 = load double* %s_double, align 8
  %cmp61 = fcmp ogt double %tmp60, 1.570800e+00
  %cmp67 = fcmp olt double %tmp60, 1.570790e+00
  %or.cond = or i1 %cmp61, %cmp67
  br i1 %or.cond, label %if.then69, label %sw.epilog

if.then69:                                        ; preds = %sw.bb49
  %call74 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str6, i64 0, i64 0), double %tmp60) nounwind
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.bb49, %if.then69, %sw.bb10, %if.then, %sw.bb, %entry
  ret void
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main() nounwind uwtable {
entry:
  %esses = alloca [3 x %struct.S], align 16
  %s_type = getelementptr inbounds [3 x %struct.S]* %esses, i64 0, i64 0, i32 0
  store i32 0, i32* %s_type, align 16
  %u = getelementptr inbounds [3 x %struct.S]* %esses, i64 0, i64 0, i32 1
  %arrayidx2 = bitcast %union.anon* %u to i32*
  store i32 2123456789, i32* %arrayidx2, align 8
  %s_ints5 = bitcast %union.anon* %u to [2 x i32]*
  %arrayidx6 = getelementptr inbounds [2 x i32]* %s_ints5, i64 0, i64 1
  store i32 -2123456789, i32* %arrayidx6, align 4
  %s_type8 = getelementptr inbounds [3 x %struct.S]* %esses, i64 0, i64 1, i32 0
  store i32 1, i32* %s_type8, align 16
  %u10 = getelementptr inbounds [3 x %struct.S]* %esses, i64 0, i64 1, i32 1
  %arrayidx11 = bitcast %union.anon* %u10 to float*
  store float 0x400921FB60000000, float* %arrayidx11, align 8
  %s_floats14 = bitcast %union.anon* %u10 to [2 x float]*
  %arrayidx15 = getelementptr inbounds [2 x float]* %s_floats14, i64 0, i64 1
  store float 0xC00921FB60000000, float* %arrayidx15, align 4
  %s_type17 = getelementptr inbounds [3 x %struct.S]* %esses, i64 0, i64 2, i32 0
  store i32 2, i32* %s_type17, align 16
  %s_double = getelementptr inbounds [3 x %struct.S]* %esses, i64 0, i64 2, i32 1, i32 0
  store double 0x3FF921FB54442D11, double* %s_double, align 8
  %arrayidx26 = getelementptr [3 x %struct.S]* %esses, i64 0, i64 0
  call void @do_something(%struct.S* %arrayidx26)
  %arrayidx26.1 = getelementptr [3 x %struct.S]* %esses, i64 0, i64 1
  call void @do_something(%struct.S* %arrayidx26.1)
  %arrayidx26.2 = getelementptr [3 x %struct.S]* %esses, i64 0, i64 2
  call void @do_something(%struct.S* %arrayidx26.2)
  ret i32 0
}

declare i32 @puts(i8* nocapture) nounwind
