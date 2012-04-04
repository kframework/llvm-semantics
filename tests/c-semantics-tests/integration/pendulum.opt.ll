; ModuleID = '/home/david/src/c-semantics/tests/integration/pendulum.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@q = constant double 5.000000e-01, align 8
@b = constant double 9.000000e-01, align 8
@w = constant double 0x3FE5555555555555, align 8
@.str = private unnamed_addr constant [7 x i8] c"%d %d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %y = alloca [2 x [60 x double]], align 16
  %arrayidx2 = getelementptr inbounds [2 x [60 x double]]* %y, i64 0, i64 0, i64 0
  store double 0.000000e+00, double* %arrayidx2, align 16, !tbaa !0
  %arrayidx4 = getelementptr inbounds [2 x [60 x double]]* %y, i64 0, i64 1, i64 0
  store double 2.000000e+00, double* %arrayidx4, align 16, !tbaa !0
  br label %for.body

for.body:                                         ; preds = %for.cond.backedge, %entry
  %0 = phi double [ 2.000000e+00, %entry ], [ %add90, %for.cond.backedge ]
  %1 = phi double [ 0.000000e+00, %entry ], [ %sub110, %for.cond.backedge ]
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.cond.backedge ]
  %indvars.iv.next = add i64 %indvars.iv, 1
  %2 = trunc i64 %indvars.iv.next to i32
  %conv6 = sitofp i32 %2 to double
  %mul7 = fmul double %conv6, 0x3FE58AD76CCCB8F0
  %mul13 = fmul double %0, 0x3FE58AD76CCCB8F0
  %mul14 = fmul double %0, -5.000000e-01
  %call15 = call double @sin(double %1) nounwind readnone
  %sub16 = fsub double %mul14, %call15
  %mul17 = fmul double %mul7, 0x3FE5555555555555
  %call18 = call double @cos(double %mul17) nounwind readnone
  %mul19 = fmul double %call18, 9.000000e-01
  %add20 = fadd double %sub16, %mul19
  %mul21 = fmul double %add20, 0x3FE58AD76CCCB8F0
  %div22 = fmul double %mul21, 5.000000e-01
  %add23 = fadd double %0, %div22
  %mul24 = fmul double %add23, 0x3FE58AD76CCCB8F0
  %mul27 = fmul double %add23, -5.000000e-01
  %div28 = fmul double %mul13, 5.000000e-01
  %add29 = fadd double %1, %div28
  %call30 = call double @sin(double %add29) nounwind readnone
  %sub31 = fsub double %mul27, %call30
  %add33 = fadd double %mul7, 0x3FD58AD76CCCB8F0
  %mul34 = fmul double %add33, 0x3FE5555555555555
  %call35 = call double @cos(double %mul34) nounwind readnone
  %mul36 = fmul double %call35, 9.000000e-01
  %add37 = fadd double %sub31, %mul36
  %mul38 = fmul double %add37, 0x3FE58AD76CCCB8F0
  %div39 = fmul double %mul38, 5.000000e-01
  %add40 = fadd double %0, %div39
  %mul41 = fmul double %add40, 0x3FE58AD76CCCB8F0
  %mul44 = fmul double %add40, -5.000000e-01
  %div45 = fmul double %mul24, 5.000000e-01
  %add46 = fadd double %1, %div45
  %call47 = call double @sin(double %add46) nounwind readnone
  %sub48 = fsub double %mul44, %call47
  %add54 = fadd double %sub48, %mul36
  %mul55 = fmul double %add54, 0x3FE58AD76CCCB8F0
  %add56 = fadd double %0, %mul55
  %mul57 = fmul double %add56, 0x3FE58AD76CCCB8F0
  %mul59 = fmul double %add56, -5.000000e-01
  %add60 = fadd double %1, %mul41
  %call61 = call double @sin(double %add60) nounwind readnone
  %sub62 = fsub double %mul59, %call61
  %add63 = fadd double %mul7, 0x3FE58AD76CCCB8F0
  %mul64 = fmul double %add63, 0x3FE5555555555555
  %call65 = call double @cos(double %mul64) nounwind readnone
  %mul66 = fmul double %call65, 9.000000e-01
  %add67 = fadd double %sub62, %mul66
  %mul68 = fmul double %add67, 0x3FE58AD76CCCB8F0
  %add72 = fadd double %mul24, %mul41
  %mul73 = fmul double %add72, 2.000000e+00
  %add74 = fadd double %mul13, %mul73
  %add75 = fadd double %add74, %mul57
  %div76 = fdiv double %add75, 6.000000e+00
  %add77 = fadd double %1, %div76
  %arrayidx81 = getelementptr inbounds [2 x [60 x double]]* %y, i64 0, i64 0, i64 %indvars.iv.next
  %add85 = fadd double %mul38, %mul55
  %mul86 = fmul double %add85, 2.000000e+00
  %add87 = fadd double %mul21, %mul86
  %add88 = fadd double %add87, %mul68
  %div89 = fdiv double %add88, 6.000000e+00
  %add90 = fadd double %0, %div89
  %arrayidx94 = getelementptr inbounds [2 x [60 x double]]* %y, i64 0, i64 1, i64 %indvars.iv.next
  store double %add90, double* %arrayidx94, align 8, !tbaa !0
  %div100 = fdiv double %add77, 0x401921FB54442D18
  %add101 = fadd double %div100, 5.000000e-01
  %conv102 = fptosi double %add101 to i32
  %conv108 = sitofp i32 %conv102 to double
  %mul109 = fmul double %conv108, 0x401921FB54442D18
  %sub110 = fsub double %add77, %mul109
  store double %sub110, double* %arrayidx81, align 8, !tbaa !0
  %3 = trunc i64 %indvars.iv to i32
  %cmp115 = icmp eq i32 %3, 0
  %rem = srem i32 %2, 10
  %cmp118 = icmp eq i32 %rem, 0
  %or.cond = or i1 %cmp115, %cmp118
  br i1 %or.cond, label %if.then, label %for.cond.backedge

for.cond.backedge:                                ; preds = %for.body, %if.then
  %exitcond = icmp eq i32 %2, 59
  br i1 %exitcond, label %for.end, label %for.body

if.then:                                          ; preds = %for.body
  %arrayidx12 = getelementptr inbounds [2 x [60 x double]]* %y, i64 0, i64 1, i64 %indvars.iv
  %arrayidx9 = getelementptr inbounds [2 x [60 x double]]* %y, i64 0, i64 0, i64 %indvars.iv
  %4 = load double* %arrayidx9, align 8, !tbaa !0
  %mul123 = fmul double %4, 1.000000e+04
  %conv124 = fptosi double %mul123 to i32
  %5 = load double* %arrayidx12, align 8, !tbaa !0
  %mul128 = fmul double %5, 1.000000e+04
  %conv129 = fptosi double %mul128 to i32
  %call130 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str, i64 0, i64 0), i32 %conv124, i32 %conv129) nounwind
  br label %for.cond.backedge

for.end:                                          ; preds = %for.cond.backedge
  ret i32 0
}

declare double @sin(double) nounwind readnone

declare double @cos(double) nounwind readnone

declare i32 @printf(i8* nocapture, ...) nounwind

!0 = metadata !{metadata !"double", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
