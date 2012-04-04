; ModuleID = '/home/david/src/c-semantics/tests/unitTests/testUnion.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i32, %union.anon }
%union.anon = type { double }

@.str1 = private unnamed_addr constant [8 x i8] c"%d, %d\0A\00", align 1
@.str3 = private unnamed_addr constant [48 x i8] c"s->u.s_floats[0] != - s->u.s_floats[1]: %f, %f\0A\00", align 1
@.str5 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str6 = private unnamed_addr constant [26 x i8] c"s->u.s_double is off: %f\0A\00", align 1
@str = private unnamed_addr constant [22 x i8] c"This S has type INTS.\00"
@str7 = private unnamed_addr constant [24 x i8] c"This S has type FLOATS.\00"
@str8 = private unnamed_addr constant [24 x i8] c"This S has type DOUBLE.\00"

define void @do_something(%struct.S* nocapture %s) nounwind uwtable {
entry:
  %s_type = getelementptr inbounds %struct.S* %s, i64 0, i32 0
  %0 = load i32* %s_type, align 4, !tbaa !0
  switch i32 %0, label %sw.epilog [
    i32 0, label %sw.bb
    i32 1, label %sw.bb5
    i32 2, label %sw.bb32
  ]

sw.bb:                                            ; preds = %entry
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([22 x i8]* @str, i64 0, i64 0))
  %u = getelementptr inbounds %struct.S* %s, i64 0, i32 1
  %s_ints = bitcast %union.anon* %u to [2 x i32]*
  %arrayidx = bitcast %union.anon* %u to i32*
  %1 = load i32* %arrayidx, align 4, !tbaa !0
  %arrayidx3 = getelementptr inbounds [2 x i32]* %s_ints, i64 0, i64 1
  %2 = load i32* %arrayidx3, align 4, !tbaa !0
  %call4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), i32 %1, i32 %2) nounwind
  br label %sw.epilog

sw.bb5:                                           ; preds = %entry
  %puts51 = tail call i32 @puts(i8* getelementptr inbounds ([24 x i8]* @str7, i64 0, i64 0))
  %u7 = getelementptr inbounds %struct.S* %s, i64 0, i32 1
  %s_floats = bitcast %union.anon* %u7 to [2 x float]*
  %arrayidx8 = bitcast %union.anon* %u7 to float*
  %3 = load float* %arrayidx8, align 4, !tbaa !3
  %mul = fmul float %3, 1.000000e+04
  %conv = fptosi float %mul to i32
  %arrayidx11 = getelementptr inbounds [2 x float]* %s_floats, i64 0, i64 1
  %4 = load float* %arrayidx11, align 4, !tbaa !3
  %mul12 = fmul float %4, 1.000000e+04
  %conv13 = fptosi float %mul12 to i32
  %call14 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), i32 %conv, i32 %conv13) nounwind
  %5 = load float* %arrayidx8, align 4, !tbaa !3
  %6 = load float* %arrayidx11, align 4, !tbaa !3
  %sub = fsub float -0.000000e+00, %6
  %cmp = fcmp une float %5, %sub
  br i1 %cmp, label %if.then, label %sw.epilog

if.then:                                          ; preds = %sw.bb5
  %conv25 = fpext float %5 to double
  %conv30 = fpext float %sub to double
  %call31 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([48 x i8]* @.str3, i64 0, i64 0), double %conv25, double %conv30) nounwind
  br label %sw.epilog

sw.bb32:                                          ; preds = %entry
  %puts52 = tail call i32 @puts(i8* getelementptr inbounds ([24 x i8]* @str8, i64 0, i64 0))
  %s_double = getelementptr inbounds %struct.S* %s, i64 0, i32 1, i32 0
  %7 = load double* %s_double, align 8, !tbaa !4
  %mul35 = fmul double %7, 1.000000e+04
  %conv36 = fptosi double %mul35 to i32
  %call37 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str5, i64 0, i64 0), i32 %conv36) nounwind
  %8 = load double* %s_double, align 8, !tbaa !4
  %cmp40 = fcmp ogt double %8, 1.570800e+00
  %cmp44 = fcmp olt double %8, 1.570790e+00
  %or.cond = or i1 %cmp40, %cmp44
  br i1 %or.cond, label %if.then46, label %sw.epilog

if.then46:                                        ; preds = %sw.bb32
  %call49 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str6, i64 0, i64 0), double %8) nounwind
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.bb32, %if.then46, %sw.bb5, %if.then, %entry, %sw.bb
  ret void
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main() nounwind uwtable {
entry:
  %esses = alloca [3 x %struct.S], align 16
  %s_type = getelementptr inbounds [3 x %struct.S]* %esses, i64 0, i64 0, i32 0
  store i32 0, i32* %s_type, align 16, !tbaa !0
  %u = getelementptr inbounds [3 x %struct.S]* %esses, i64 0, i64 0, i32 1
  %s_ints = bitcast %union.anon* %u to [2 x i32]*
  %arrayidx2 = bitcast %union.anon* %u to i32*
  store i32 2123456789, i32* %arrayidx2, align 8, !tbaa !0
  %arrayidx6 = getelementptr inbounds [2 x i32]* %s_ints, i64 0, i64 1
  store i32 -2123456789, i32* %arrayidx6, align 4, !tbaa !0
  %s_type8 = getelementptr inbounds [3 x %struct.S]* %esses, i64 0, i64 1, i32 0
  store i32 1, i32* %s_type8, align 16, !tbaa !0
  %u10 = getelementptr inbounds [3 x %struct.S]* %esses, i64 0, i64 1, i32 1
  %s_floats = bitcast %union.anon* %u10 to [2 x float]*
  %arrayidx11 = bitcast %union.anon* %u10 to float*
  store float 0x400921FB60000000, float* %arrayidx11, align 8, !tbaa !3
  %arrayidx15 = getelementptr inbounds [2 x float]* %s_floats, i64 0, i64 1
  store float 0xC00921FB60000000, float* %arrayidx15, align 4, !tbaa !3
  %s_type17 = getelementptr inbounds [3 x %struct.S]* %esses, i64 0, i64 2, i32 0
  store i32 2, i32* %s_type17, align 16, !tbaa !0
  %s_double = getelementptr inbounds [3 x %struct.S]* %esses, i64 0, i64 2, i32 1, i32 0
  store double 0x3FF921FB54442D11, double* %s_double, align 8, !tbaa !4
  %arrayidx21 = getelementptr inbounds [3 x %struct.S]* %esses, i64 0, i64 0
  call void @do_something(%struct.S* %arrayidx21)
  %arrayidx21.1 = getelementptr inbounds [3 x %struct.S]* %esses, i64 0, i64 1
  call void @do_something(%struct.S* %arrayidx21.1)
  %arrayidx21.2 = getelementptr inbounds [3 x %struct.S]* %esses, i64 0, i64 2
  call void @do_something(%struct.S* %arrayidx21.2)
  ret i32 0
}

declare i32 @puts(i8* nocapture) nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"float", metadata !1}
!4 = metadata !{metadata !"double", metadata !1}
