; ModuleID = '/home/david/src/c-semantics/tests/integration/groundwater.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"%d %d %d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %phi = alloca [6 x [3 x double]], align 16
  %ck = alloca [6 x [3 x double]], align 16
  %sn = alloca [6 x [3 x double]], align 16
  %sn140 = bitcast [6 x [3 x double]]* %sn to i8*
  call void @llvm.memset.p0i8.i64(i8* %sn140, i8 0, i64 144, i32 16, i1 false)
  br label %for.body

for.cond34.preheader:                             ; preds = %for.body
  %arraydecay = getelementptr inbounds [6 x [3 x double]]* %phi, i64 0, i64 0
  %arraydecay75 = getelementptr inbounds [6 x [3 x double]]* %ck, i64 0, i64 0
  %arraydecay76 = getelementptr inbounds [6 x [3 x double]]* %sn, i64 0, i64 0
  %arrayidx44 = getelementptr inbounds [6 x [3 x double]]* %phi, i64 0, i64 1, i64 0
  %0 = load double* %arrayidx44, align 8, !tbaa !0
  %mul45 = fmul double %0, 4.000000e+00
  %arrayidx48 = getelementptr inbounds [6 x [3 x double]]* %phi, i64 0, i64 2, i64 0
  %1 = load double* %arrayidx48, align 16, !tbaa !0
  %sub49 = fsub double %mul45, %1
  %div50 = fdiv double %sub49, 3.000000e+00
  %arrayidx53 = getelementptr inbounds [6 x [3 x double]]* %phi, i64 0, i64 0, i64 0
  store double %div50, double* %arrayidx53, align 16, !tbaa !0
  %arrayidx58 = getelementptr inbounds [6 x [3 x double]]* %phi, i64 0, i64 4, i64 0
  %2 = load double* %arrayidx58, align 16, !tbaa !0
  %mul59 = fmul double %2, 4.000000e+00
  %arrayidx64 = getelementptr inbounds [6 x [3 x double]]* %phi, i64 0, i64 3, i64 0
  %3 = load double* %arrayidx64, align 8, !tbaa !0
  %sub65 = fsub double %mul59, %3
  %div66 = fdiv double %sub65, 3.000000e+00
  %arrayidx71 = getelementptr inbounds [6 x [3 x double]]* %phi, i64 0, i64 5, i64 0
  store double %div66, double* %arrayidx71, align 8, !tbaa !0
  %arrayidx44.1 = getelementptr inbounds [6 x [3 x double]]* %phi, i64 0, i64 1, i64 1
  %4 = load double* %arrayidx44.1, align 8, !tbaa !0
  %mul45.1 = fmul double %4, 4.000000e+00
  %arrayidx48.1 = getelementptr inbounds [6 x [3 x double]]* %phi, i64 0, i64 2, i64 1
  %5 = load double* %arrayidx48.1, align 8, !tbaa !0
  %sub49.1 = fsub double %mul45.1, %5
  %div50.1 = fdiv double %sub49.1, 3.000000e+00
  %arrayidx53.1 = getelementptr inbounds [6 x [3 x double]]* %phi, i64 0, i64 0, i64 1
  store double %div50.1, double* %arrayidx53.1, align 8, !tbaa !0
  %arrayidx58.1 = getelementptr inbounds [6 x [3 x double]]* %phi, i64 0, i64 4, i64 1
  %6 = load double* %arrayidx58.1, align 8, !tbaa !0
  %mul59.1 = fmul double %6, 4.000000e+00
  %arrayidx64.1 = getelementptr inbounds [6 x [3 x double]]* %phi, i64 0, i64 3, i64 1
  %7 = load double* %arrayidx64.1, align 8, !tbaa !0
  %sub65.1 = fsub double %mul59.1, %7
  %div66.1 = fdiv double %sub65.1, 3.000000e+00
  %arrayidx71.1 = getelementptr inbounds [6 x [3 x double]]* %phi, i64 0, i64 5, i64 1
  store double %div66.1, double* %arrayidx71.1, align 8, !tbaa !0
  %arrayidx44.2 = getelementptr inbounds [6 x [3 x double]]* %phi, i64 0, i64 1, i64 2
  %8 = load double* %arrayidx44.2, align 8, !tbaa !0
  %mul45.2 = fmul double %8, 4.000000e+00
  %arrayidx48.2 = getelementptr inbounds [6 x [3 x double]]* %phi, i64 0, i64 2, i64 2
  %9 = load double* %arrayidx48.2, align 16, !tbaa !0
  %sub49.2 = fsub double %mul45.2, %9
  %div50.2 = fdiv double %sub49.2, 3.000000e+00
  %arrayidx53.2 = getelementptr inbounds [6 x [3 x double]]* %phi, i64 0, i64 0, i64 2
  store double %div50.2, double* %arrayidx53.2, align 16, !tbaa !0
  %arrayidx58.2 = getelementptr inbounds [6 x [3 x double]]* %phi, i64 0, i64 4, i64 2
  %10 = load double* %arrayidx58.2, align 16, !tbaa !0
  %mul59.2 = fmul double %10, 4.000000e+00
  %arrayidx64.2 = getelementptr inbounds [6 x [3 x double]]* %phi, i64 0, i64 3, i64 2
  %11 = load double* %arrayidx64.2, align 8, !tbaa !0
  %sub65.2 = fsub double %mul59.2, %11
  %div66.2 = fdiv double %sub65.2, 3.000000e+00
  %arrayidx71.2 = getelementptr inbounds [6 x [3 x double]]* %phi, i64 0, i64 5, i64 2
  store double %div66.2, double* %arrayidx71.2, align 8, !tbaa !0
  call void @rx2d([3 x double]* %arraydecay, [3 x double]* %arraydecay75, [3 x double]* %arraydecay76, i32 6, i32 3, double 5.000000e-01, double 2.000000e+02, double 2.500000e+02) nounwind
  %12 = load double* %arrayidx44, align 8, !tbaa !0
  %mul45.1120 = fmul double %12, 4.000000e+00
  %13 = load double* %arrayidx48, align 16, !tbaa !0
  %sub49.1122 = fsub double %mul45.1120, %13
  %div50.1123 = fdiv double %sub49.1122, 3.000000e+00
  store double %div50.1123, double* %arrayidx53, align 16, !tbaa !0
  %14 = load double* %arrayidx58, align 16, !tbaa !0
  %mul59.1126 = fmul double %14, 4.000000e+00
  %15 = load double* %arrayidx64, align 8, !tbaa !0
  %sub65.1128 = fsub double %mul59.1126, %15
  %div66.1129 = fdiv double %sub65.1128, 3.000000e+00
  store double %div66.1129, double* %arrayidx71, align 8, !tbaa !0
  %16 = load double* %arrayidx44.1, align 8, !tbaa !0
  %mul45.1.1 = fmul double %16, 4.000000e+00
  %17 = load double* %arrayidx48.1, align 8, !tbaa !0
  %sub49.1.1 = fsub double %mul45.1.1, %17
  %div50.1.1 = fdiv double %sub49.1.1, 3.000000e+00
  store double %div50.1.1, double* %arrayidx53.1, align 8, !tbaa !0
  %18 = load double* %arrayidx58.1, align 8, !tbaa !0
  %mul59.1.1 = fmul double %18, 4.000000e+00
  %19 = load double* %arrayidx64.1, align 8, !tbaa !0
  %sub65.1.1 = fsub double %mul59.1.1, %19
  %div66.1.1 = fdiv double %sub65.1.1, 3.000000e+00
  store double %div66.1.1, double* %arrayidx71.1, align 8, !tbaa !0
  %20 = load double* %arrayidx44.2, align 8, !tbaa !0
  %mul45.2.1 = fmul double %20, 4.000000e+00
  %21 = load double* %arrayidx48.2, align 16, !tbaa !0
  %sub49.2.1 = fsub double %mul45.2.1, %21
  %div50.2.1 = fdiv double %sub49.2.1, 3.000000e+00
  store double %div50.2.1, double* %arrayidx53.2, align 16, !tbaa !0
  %22 = load double* %arrayidx58.2, align 16, !tbaa !0
  %mul59.2.1 = fmul double %22, 4.000000e+00
  %23 = load double* %arrayidx64.2, align 8, !tbaa !0
  %sub65.2.1 = fsub double %mul59.2.1, %23
  %div66.2.1 = fdiv double %sub65.2.1, 3.000000e+00
  store double %div66.2.1, double* %arrayidx71.2, align 8, !tbaa !0
  call void @rx2d([3 x double]* %arraydecay, [3 x double]* %arraydecay75, [3 x double]* %arraydecay76, i32 6, i32 3, double 5.000000e-01, double 2.000000e+02, double 2.500000e+02) nounwind
  br label %for.body83

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv136 = phi i64 [ 0, %entry ], [ %indvars.iv.next137, %for.body ]
  %24 = trunc i64 %indvars.iv136 to i32
  %conv5 = sitofp i32 %24 to double
  %mul6 = fmul double %conv5, 2.000000e+02
  %mul16 = fmul double %mul6, 0x400921FB54442D18
  %div17 = fdiv double %mul16, 1.000000e+03
  %call18 = call double @cos(double %div17) nounwind readnone
  %mul19 = fmul double %call18, -2.000000e+01
  %arrayidx15 = getelementptr inbounds [6 x [3 x double]]* %ck, i64 0, i64 %indvars.iv136, i64 0
  store double 1.000000e+00, double* %arrayidx15, align 8, !tbaa !0
  %mul20 = fmul double %mul19, 0.000000e+00
  %div21 = fdiv double %mul20, 5.000000e+02
  %add22 = fadd double %div21, 2.000000e+02
  %arrayidx26 = getelementptr inbounds [6 x [3 x double]]* %phi, i64 0, i64 %indvars.iv136, i64 0
  store double %add22, double* %arrayidx26, align 8, !tbaa !0
  %arrayidx15.1 = getelementptr inbounds [6 x [3 x double]]* %ck, i64 0, i64 %indvars.iv136, i64 1
  store double -9.000000e+00, double* %arrayidx15.1, align 8, !tbaa !0
  %mul20.1 = fmul double %mul19, 2.500000e+02
  %div21.1 = fdiv double %mul20.1, 5.000000e+02
  %add22.1 = fadd double %div21.1, 2.000000e+02
  %arrayidx26.1 = getelementptr inbounds [6 x [3 x double]]* %phi, i64 0, i64 %indvars.iv136, i64 1
  store double %add22.1, double* %arrayidx26.1, align 8, !tbaa !0
  %arrayidx15.2 = getelementptr inbounds [6 x [3 x double]]* %ck, i64 0, i64 %indvars.iv136, i64 2
  store double -1.900000e+01, double* %arrayidx15.2, align 8, !tbaa !0
  %mul20.2 = fmul double %mul19, 5.000000e+02
  %div21.2 = fdiv double %mul20.2, 5.000000e+02
  %add22.2 = fadd double %div21.2, 2.000000e+02
  %arrayidx26.2 = getelementptr inbounds [6 x [3 x double]]* %phi, i64 0, i64 %indvars.iv136, i64 2
  store double %add22.2, double* %arrayidx26.2, align 8, !tbaa !0
  %indvars.iv.next137 = add i64 %indvars.iv136, 1
  %lftr.wideiv138 = trunc i64 %indvars.iv.next137 to i32
  %exitcond139 = icmp eq i32 %lftr.wideiv138, 6
  br i1 %exitcond139, label %for.cond34.preheader, label %for.body

for.body83:                                       ; preds = %for.body83, %for.cond34.preheader
  %indvars.iv = phi i64 [ 0, %for.cond34.preheader ], [ %indvars.iv.next, %for.body83 ]
  %25 = trunc i64 %indvars.iv to i32
  %conv84 = sitofp i32 %25 to double
  %mul85 = fmul double %conv84, 2.000000e+02
  %mul92 = fmul double %mul85, 1.000000e+01
  %conv93 = fptosi double %mul92 to i32
  %arrayidx99 = getelementptr inbounds [6 x [3 x double]]* %phi, i64 0, i64 %indvars.iv, i64 0
  %26 = load double* %arrayidx99, align 8, !tbaa !0
  %conv100 = fptosi double %26 to i32
  %mul101 = mul nsw i32 %conv100, 10
  %call102 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str, i64 0, i64 0), i32 %conv93, i32 0, i32 %mul101) nounwind
  %arrayidx99.1 = getelementptr inbounds [6 x [3 x double]]* %phi, i64 0, i64 %indvars.iv, i64 1
  %27 = load double* %arrayidx99.1, align 8, !tbaa !0
  %conv100.1 = fptosi double %27 to i32
  %mul101.1 = mul nsw i32 %conv100.1, 10
  %call102.1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str, i64 0, i64 0), i32 %conv93, i32 2500, i32 %mul101.1) nounwind
  %arrayidx99.2 = getelementptr inbounds [6 x [3 x double]]* %phi, i64 0, i64 %indvars.iv, i64 2
  %28 = load double* %arrayidx99.2, align 8, !tbaa !0
  %conv100.2 = fptosi double %28 to i32
  %mul101.2 = mul nsw i32 %conv100.2, 10
  %call102.2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str, i64 0, i64 0), i32 %conv93, i32 5000, i32 %mul101.2) nounwind
  %indvars.iv.next = add i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 6
  br i1 %exitcond, label %for.end108, label %for.body83

for.end108:                                       ; preds = %for.body83
  ret i32 0
}

declare double @cos(double) nounwind readnone

declare i32 @printf(i8* nocapture, ...) nounwind

define void @rx2d([3 x double]* nocapture %fn, [3 x double]* nocapture %dn, [3 x double]* nocapture %s, i32 %nx, i32 %ny, double %p, double %hx, double %hy) nounwind uwtable {
entry:
  %mul = fmul double %hx, %hx
  %mul1 = fmul double %hy, %hy
  %div = fdiv double %mul, %mul1
  %add = fadd double %div, 1.000000e+00
  %mul2 = fmul double %add, 4.000000e+00
  %div3 = fdiv double 1.000000e+00, %mul2
  %sub = fsub double 1.000000e+00, %p
  %sub4 = add nsw i32 %nx, -1
  %cmp106 = icmp sgt i32 %sub4, 1
  br i1 %cmp106, label %for.cond5.preheader.lr.ph, label %for.end103

for.cond5.preheader.lr.ph:                        ; preds = %entry
  %sub6 = add nsw i32 %ny, -1
  %cmp7104 = icmp sgt i32 %sub6, 1
  %mul31 = fmul double %div, %div3
  br i1 %cmp7104, label %for.body8.lr.ph.us, label %for.end103

for.inc101.us:                                    ; preds = %for.body8.us
  %lftr.wideiv113 = trunc i64 %12 to i32
  %exitcond114 = icmp eq i32 %lftr.wideiv113, %sub4
  br i1 %exitcond114, label %for.end103, label %for.body8.lr.ph.us

for.body8.us:                                     ; preds = %for.body8.us, %for.body8.lr.ph.us
  %0 = phi double [ %.pre116, %for.body8.lr.ph.us ], [ %add96.us, %for.body8.us ]
  %1 = phi double [ %.pre, %for.body8.lr.ph.us ], [ %10, %for.body8.us ]
  %indvars.iv = phi i64 [ 1, %for.body8.lr.ph.us ], [ %indvars.iv.next, %for.body8.us ]
  %arrayidx11.us = getelementptr inbounds [3 x double]* %dn, i64 %12, i64 %indvars.iv
  %2 = load double* %arrayidx11.us, align 8, !tbaa !0
  %arrayidx15.us = getelementptr inbounds [3 x double]* %dn, i64 %indvars.iv109, i64 %indvars.iv
  %3 = load double* %arrayidx15.us, align 8, !tbaa !0
  %div16.us = fdiv double %2, %3
  %add17.us = fadd double %div16.us, 1.000000e+00
  %mul18.us = fmul double %div3, %add17.us
  %arrayidx23.us = getelementptr inbounds [3 x double]* %dn, i64 %13, i64 %indvars.iv
  %4 = load double* %arrayidx23.us, align 8, !tbaa !0
  %div28.us = fdiv double %4, %3
  %add29.us = fadd double %div28.us, 1.000000e+00
  %mul30.us = fmul double %div3, %add29.us
  %indvars.iv.next = add i64 %indvars.iv, 1
  %arrayidx36.us = getelementptr inbounds [3 x double]* %dn, i64 %indvars.iv109, i64 %indvars.iv.next
  %5 = load double* %arrayidx36.us, align 8, !tbaa !0
  %div41.us = fdiv double %5, %3
  %add42.us = fadd double %div41.us, 1.000000e+00
  %mul43.us = fmul double %mul31, %add42.us
  %6 = add nsw i64 %indvars.iv, -1
  %arrayidx49.us = getelementptr inbounds [3 x double]* %dn, i64 %indvars.iv109, i64 %6
  %7 = load double* %arrayidx49.us, align 8, !tbaa !0
  %div54.us = fdiv double %7, %3
  %add55.us = fadd double %div54.us, 1.000000e+00
  %mul56.us = fmul double %mul31, %add55.us
  %arrayidx60.us = getelementptr inbounds [3 x double]* %fn, i64 %indvars.iv109, i64 %indvars.iv
  %mul61.us = fmul double %sub, %1
  %arrayidx66.us = getelementptr inbounds [3 x double]* %fn, i64 %12, i64 %indvars.iv
  %8 = load double* %arrayidx66.us, align 8, !tbaa !0
  %mul67.us = fmul double %mul18.us, %8
  %arrayidx72.us = getelementptr inbounds [3 x double]* %fn, i64 %13, i64 %indvars.iv
  %9 = load double* %arrayidx72.us, align 8, !tbaa !0
  %mul73.us = fmul double %mul30.us, %9
  %add74.us = fadd double %mul67.us, %mul73.us
  %arrayidx79.us = getelementptr inbounds [3 x double]* %fn, i64 %indvars.iv109, i64 %indvars.iv.next
  %10 = load double* %arrayidx79.us, align 8, !tbaa !0
  %mul80.us = fmul double %mul43.us, %10
  %add81.us = fadd double %add74.us, %mul80.us
  %mul87.us = fmul double %mul56.us, %0
  %add88.us = fadd double %add81.us, %mul87.us
  %arrayidx92.us = getelementptr inbounds [3 x double]* %s, i64 %indvars.iv109, i64 %indvars.iv
  %11 = load double* %arrayidx92.us, align 8, !tbaa !0
  %mul93.us = fmul double %mul, %11
  %add94.us = fadd double %add88.us, %mul93.us
  %mul95.us = fmul double %add94.us, %p
  %add96.us = fadd double %mul61.us, %mul95.us
  store double %add96.us, double* %arrayidx60.us, align 8, !tbaa !0
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %sub6
  br i1 %exitcond, label %for.inc101.us, label %for.body8.us

for.body8.lr.ph.us:                               ; preds = %for.inc101.us, %for.cond5.preheader.lr.ph
  %indvars.iv109 = phi i64 [ %12, %for.inc101.us ], [ 1, %for.cond5.preheader.lr.ph ]
  %12 = add nsw i64 %indvars.iv109, 1
  %13 = add nsw i64 %indvars.iv109, -1
  %arrayidx60.us.phi.trans.insert = getelementptr inbounds [3 x double]* %fn, i64 %indvars.iv109, i64 1
  %.pre = load double* %arrayidx60.us.phi.trans.insert, align 8, !tbaa !0
  %arrayidx86.us.phi.trans.insert = getelementptr inbounds [3 x double]* %fn, i64 %indvars.iv109, i64 0
  %.pre116 = load double* %arrayidx86.us.phi.trans.insert, align 8, !tbaa !0
  br label %for.body8.us

for.end103:                                       ; preds = %for.cond5.preheader.lr.ph, %for.inc101.us, %entry
  ret void
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

!0 = metadata !{metadata !"double", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
