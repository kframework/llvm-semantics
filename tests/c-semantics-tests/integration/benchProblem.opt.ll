; ModuleID = '/home/david/src/c-semantics/tests/integration/benchProblem.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"%d %d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %b = alloca [20 x double], align 16
  %x = alloca [20 x double], align 16
  %y = alloca [20 x double], align 16
  %w = alloca [20 x double], align 16
  %u = alloca [20 x double], align 16
  %arrayidx = getelementptr inbounds [20 x double]* %w, i64 0, i64 0
  store double 2.000000e+00, double* %arrayidx, align 16, !tbaa !0
  %arrayidx10 = getelementptr inbounds [20 x double]* %u, i64 0, i64 0
  store double -5.000000e-01, double* %arrayidx10, align 16, !tbaa !0
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %0 = phi double [ -5.000000e-01, %entry ], [ %conv23, %for.body ]
  %indvars.iv155 = phi i64 [ 1, %entry ], [ %indvars.iv.next156, %for.body ]
  %conv13 = fpext double %0 to x86_fp80
  %mul14 = fmul x86_fp80 %conv13, 0xKBFFF8000000000000000
  %sub15 = fsub x86_fp80 0xK40008000000000000000, %mul14
  %conv16 = fptrunc x86_fp80 %sub15 to double
  %arrayidx18 = getelementptr inbounds [20 x double]* %w, i64 0, i64 %indvars.iv155
  store double %conv16, double* %arrayidx18, align 8, !tbaa !0
  %conv23 = fdiv double -1.000000e+00, %conv16
  %arrayidx25 = getelementptr inbounds [20 x double]* %u, i64 0, i64 %indvars.iv155
  store double %conv23, double* %arrayidx25, align 8, !tbaa !0
  %indvars.iv.next156 = add i64 %indvars.iv155, 1
  %lftr.wideiv158 = trunc i64 %indvars.iv.next156 to i32
  %exitcond159 = icmp eq i32 %lftr.wideiv158, 20
  br i1 %exitcond159, label %for.body29, label %for.body

for.body29:                                       ; preds = %for.body, %if.end
  %indvars.iv151 = phi i64 [ %indvars.iv.next152, %if.end ], [ 0, %for.body ]
  %indvars.iv.next152 = add i64 %indvars.iv151, 1
  %1 = trunc i64 %indvars.iv.next152 to i32
  %conv31 = sitofp i32 %1 to x86_fp80
  %mul32 = fmul x86_fp80 %conv31, 0xK3FFC9249249249249249
  %arrayidx38 = getelementptr inbounds [20 x double]* %b, i64 0, i64 %indvars.iv151
  store double 0xBFE3333333333334, double* %arrayidx38, align 8, !tbaa !0
  %sub40 = fadd x86_fp80 %mul32, 0xKBFFFC000000000000000
  %conv41 = fptrunc x86_fp80 %sub40 to double
  %call42 = call double @fabs(double %conv41) nounwind readnone
  %cmp44 = fcmp olt double %call42, 2.500000e-01
  br i1 %cmp44, label %if.then, label %if.end

if.then:                                          ; preds = %for.body29
  %div52 = fdiv x86_fp80 %sub40, 0xK3FFD8000000000000000
  %conv53 = fptrunc x86_fp80 %div52 to double
  %pow2 = fmul double %conv53, %conv53
  %sub54 = fsub double -0.000000e+00, %pow2
  %call55 = call double @exp(double %sub54) nounwind
  %conv56 = fpext double %call55 to x86_fp80
  %sub57 = fadd x86_fp80 %conv56, 0xKBFFDBC5AB1B16779C000
  %mul58 = fmul x86_fp80 %sub57, 0xK4001829CBC14E5E0A72F
  %sub59 = fsub x86_fp80 0xKBFFE999999999999A000, %mul58
  %conv60 = fptrunc x86_fp80 %sub59 to double
  store double %conv60, double* %arrayidx38, align 8, !tbaa !0
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body29
  %2 = phi double [ %conv60, %if.then ], [ 0xBFE3333333333334, %for.body29 ]
  %conv67 = fdiv double %2, 1.800000e+03
  store double %conv67, double* %arrayidx38, align 8, !tbaa !0
  %exitcond154 = icmp eq i32 %1, 20
  br i1 %exitcond154, label %for.end72, label %for.body29

for.end72:                                        ; preds = %if.end
  %arrayidx73 = getelementptr inbounds [20 x double]* %b, i64 0, i64 0
  %3 = load double* %arrayidx73, align 16, !tbaa !0
  %4 = load double* %arrayidx, align 16, !tbaa !0
  %div75 = fdiv double %3, %4
  %arrayidx76 = getelementptr inbounds [20 x double]* %y, i64 0, i64 0
  store double %div75, double* %arrayidx76, align 16, !tbaa !0
  br label %for.body80

for.body80:                                       ; preds = %for.body80, %for.end72
  %5 = phi double [ %div75, %for.end72 ], [ %div89, %for.body80 ]
  %indvars.iv146 = phi i64 [ 1, %for.end72 ], [ %indvars.iv.next147, %for.body80 ]
  %arrayidx82 = getelementptr inbounds [20 x double]* %b, i64 0, i64 %indvars.iv146
  %6 = load double* %arrayidx82, align 8, !tbaa !0
  %add86 = fadd double %6, %5
  %arrayidx88 = getelementptr inbounds [20 x double]* %w, i64 0, i64 %indvars.iv146
  %7 = load double* %arrayidx88, align 8, !tbaa !0
  %div89 = fdiv double %add86, %7
  %arrayidx91 = getelementptr inbounds [20 x double]* %y, i64 0, i64 %indvars.iv146
  store double %div89, double* %arrayidx91, align 8, !tbaa !0
  %indvars.iv.next147 = add i64 %indvars.iv146, 1
  %lftr.wideiv149 = trunc i64 %indvars.iv.next147 to i32
  %exitcond150 = icmp eq i32 %lftr.wideiv149, 20
  br i1 %exitcond150, label %for.end94, label %for.body80

for.end94:                                        ; preds = %for.body80
  %arrayidx97 = getelementptr inbounds [20 x double]* %y, i64 0, i64 19
  %8 = load double* %arrayidx97, align 8, !tbaa !0
  %arrayidx100 = getelementptr inbounds [20 x double]* %x, i64 0, i64 19
  store double %8, double* %arrayidx100, align 8, !tbaa !0
  br label %for.body105

for.body105:                                      ; preds = %for.end94, %for.body105
  %9 = phi double [ %8, %for.end94 ], [ %sub114, %for.body105 ]
  %indvars.iv143 = phi i64 [ 18, %for.end94 ], [ %indvars.iv.next144, %for.body105 ]
  %arrayidx107 = getelementptr inbounds [20 x double]* %y, i64 0, i64 %indvars.iv143
  %10 = load double* %arrayidx107, align 8, !tbaa !0
  %arrayidx109 = getelementptr inbounds [20 x double]* %u, i64 0, i64 %indvars.iv143
  %11 = load double* %arrayidx109, align 8, !tbaa !0
  %mul113 = fmul double %11, %9
  %sub114 = fsub double %10, %mul113
  %arrayidx116 = getelementptr inbounds [20 x double]* %x, i64 0, i64 %indvars.iv143
  store double %sub114, double* %arrayidx116, align 8, !tbaa !0
  %indvars.iv.next144 = add i64 %indvars.iv143, -1
  %12 = trunc i64 %indvars.iv143 to i32
  %cmp103 = icmp sgt i32 %12, 0
  br i1 %cmp103, label %for.body105, label %for.body123

for.body123:                                      ; preds = %for.body105, %for.body123
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body123 ], [ 0, %for.body105 ]
  %indvars.iv.next = add i64 %indvars.iv, 1
  %13 = trunc i64 %indvars.iv.next to i32
  %conv125 = sitofp i32 %13 to x86_fp80
  %mul126 = fmul x86_fp80 %conv125, 0xK3FFC9249249249249249
  %mul127 = fmul x86_fp80 %mul126, 0xK4008FA00000000000000
  %conv128 = fptosi x86_fp80 %mul127 to i32
  %arrayidx130 = getelementptr inbounds [20 x double]* %x, i64 0, i64 %indvars.iv
  %14 = load double* %arrayidx130, align 8, !tbaa !0
  %mul131 = fmul double %14, 1.000000e+02
  %mul132 = fmul double %mul131, 1.000000e+03
  %conv133 = fptosi double %mul132 to i32
  %call134 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str, i64 0, i64 0), i32 %conv128, i32 %conv133) nounwind
  %exitcond = icmp eq i32 %13, 20
  br i1 %exitcond, label %for.end137, label %for.body123

for.end137:                                       ; preds = %for.body123
  ret i32 0
}

declare double @exp(double) nounwind

declare double @fabs(double) nounwind readnone

declare i32 @printf(i8* nocapture, ...) nounwind

!0 = metadata !{metadata !"double", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
