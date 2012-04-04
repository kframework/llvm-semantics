; ModuleID = '/home/david/src/c-semantics/tests/integration/gaussianElimination.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.b = private unnamed_addr constant [3 x double] [double 2.000000e+02, double 0.000000e+00, double 0.000000e+00], align 16
@main.a = private unnamed_addr constant [3 x [3 x double]] [[3 x double] [double 1.000000e+02, double 1.000000e+02, double 1.000000e+02], [3 x double] [double -1.000000e+02, double 3.000000e+02, double -1.000000e+02], [3 x double] [double -1.000000e+02, double -1.000000e+02, double 3.000000e+02]], align 16
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@str = private unnamed_addr constant [35 x i8] c"The matrix dimension is too large.\00"

define i32 @main() nounwind uwtable {
entry:
  %x = alloca [3 x double], align 16
  %b = alloca [3 x double], align 16
  %a = alloca [3 x [3 x double]], align 16
  %indx = alloca [3 x i32], align 4
  %0 = bitcast [3 x double]* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([3 x double]* @main.b to i8*), i64 24, i32 16, i1 false)
  %1 = bitcast [3 x [3 x double]]* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast ([3 x [3 x double]]* @main.a to i8*), i64 72, i32 16, i1 false)
  %arraydecay = getelementptr inbounds [3 x [3 x double]]* %a, i64 0, i64 0
  %arraydecay1 = getelementptr inbounds [3 x double]* %b, i64 0, i64 0
  %arraydecay2 = getelementptr inbounds [3 x double]* %x, i64 0, i64 0
  %arraydecay3 = getelementptr inbounds [3 x i32]* %indx, i64 0, i64 0
  call void @legs([3 x double]* %arraydecay, i32 3, double* %arraydecay1, double* %arraydecay2, i32* %arraydecay3) nounwind
  %2 = load double* %arraydecay2, align 16, !tbaa !0
  %mul = fmul double %2, 1.000000e+04
  %conv = fptosi double %mul to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %conv) nounwind
  %arrayidx.1 = getelementptr inbounds [3 x double]* %x, i64 0, i64 1
  %3 = load double* %arrayidx.1, align 8, !tbaa !0
  %mul.1 = fmul double %3, 1.000000e+04
  %conv.1 = fptosi double %mul.1 to i32
  %call.1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %conv.1) nounwind
  %arrayidx.2 = getelementptr inbounds [3 x double]* %x, i64 0, i64 2
  %4 = load double* %arrayidx.2, align 16, !tbaa !0
  %mul.2 = fmul double %4, 1.000000e+04
  %conv.2 = fptosi double %mul.2 to i32
  %call.2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %conv.2) nounwind
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind

define void @legs([3 x double]* nocapture %a, i32 %n, double* nocapture %b, double* nocapture %x, i32* nocapture %indx) nounwind uwtable {
entry:
  tail call void @elgs([3 x double]* %a, i32 %n, i32* %indx) nounwind
  %sub = add nsw i32 %n, -1
  %cmp92 = icmp sgt i32 %sub, 0
  br i1 %cmp92, label %for.body, label %for.end23

for.cond.loopexit:                                ; preds = %for.body3, %for.body
  %indvars.iv.next103 = add i64 %indvars.iv102, 1
  %exitcond112 = icmp eq i32 %0, %sub
  br i1 %exitcond112, label %for.end23, label %for.body

for.body:                                         ; preds = %entry, %for.cond.loopexit
  %indvars.iv109 = phi i64 [ %indvars.iv.next110, %for.cond.loopexit ], [ 0, %entry ]
  %indvars.iv102 = phi i64 [ %indvars.iv.next103, %for.cond.loopexit ], [ 1, %entry ]
  %indvars.iv.next110 = add i64 %indvars.iv109, 1
  %0 = trunc i64 %indvars.iv.next110 to i32
  %cmp290 = icmp slt i32 %0, %n
  br i1 %cmp290, label %for.body3.lr.ph, label %for.cond.loopexit

for.body3.lr.ph:                                  ; preds = %for.body
  %arrayidx13 = getelementptr inbounds i32* %indx, i64 %indvars.iv109
  %1 = load i32* %arrayidx13, align 4, !tbaa !3
  %idxprom14 = sext i32 %1 to i64
  %arrayidx15 = getelementptr inbounds double* %b, i64 %idxprom14
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.body3.lr.ph
  %indvars.iv104 = phi i64 [ %indvars.iv102, %for.body3.lr.ph ], [ %indvars.iv.next105, %for.body3 ]
  %arrayidx = getelementptr inbounds i32* %indx, i64 %indvars.iv104
  %2 = load i32* %arrayidx, align 4, !tbaa !3
  %idxprom4 = sext i32 %2 to i64
  %arrayidx5 = getelementptr inbounds double* %b, i64 %idxprom4
  %3 = load double* %arrayidx5, align 8, !tbaa !0
  %arrayidx11 = getelementptr inbounds [3 x double]* %a, i64 %idxprom4, i64 %indvars.iv109
  %4 = load double* %arrayidx11, align 8, !tbaa !0
  %5 = load double* %arrayidx15, align 8, !tbaa !0
  %mul = fmul double %4, %5
  %sub16 = fsub double %3, %mul
  store double %sub16, double* %arrayidx5, align 8, !tbaa !0
  %indvars.iv.next105 = add i64 %indvars.iv104, 1
  %lftr.wideiv107 = trunc i64 %indvars.iv.next105 to i32
  %exitcond108 = icmp eq i32 %lftr.wideiv107, %n
  br i1 %exitcond108, label %for.cond.loopexit, label %for.body3

for.end23:                                        ; preds = %for.cond.loopexit, %entry
  %idxprom25 = sext i32 %sub to i64
  %arrayidx26 = getelementptr inbounds i32* %indx, i64 %idxprom25
  %6 = load i32* %arrayidx26, align 4, !tbaa !3
  %idxprom27 = sext i32 %6 to i64
  %arrayidx28 = getelementptr inbounds double* %b, i64 %idxprom27
  %7 = load double* %arrayidx28, align 8, !tbaa !0
  %arrayidx36 = getelementptr inbounds [3 x double]* %a, i64 %idxprom27, i64 %idxprom25
  %8 = load double* %arrayidx36, align 8, !tbaa !0
  %div = fdiv double %7, %8
  %arrayidx39 = getelementptr inbounds double* %x, i64 %idxprom25
  store double %div, double* %arrayidx39, align 8, !tbaa !0
  %sub40 = add nsw i32 %n, -2
  %cmp4288 = icmp sgt i32 %sub40, -1
  br i1 %cmp4288, label %for.body43.lr.ph, label %for.end83

for.body43.lr.ph:                                 ; preds = %for.end23
  %9 = sext i32 %sub40 to i64
  br label %for.body43

for.body43:                                       ; preds = %for.body43.lr.ph, %for.end70
  %indvars.iv98 = phi i64 [ %9, %for.body43.lr.ph ], [ %indvars.iv.next99, %for.end70 ]
  %indvars.iv = phi i32 [ %sub, %for.body43.lr.ph ], [ %indvars.iv.next, %for.end70 ]
  %arrayidx45 = getelementptr inbounds i32* %indx, i64 %indvars.iv98
  %10 = load i32* %arrayidx45, align 4, !tbaa !3
  %idxprom46 = sext i32 %10 to i64
  %arrayidx47 = getelementptr inbounds double* %b, i64 %idxprom46
  %11 = load double* %arrayidx47, align 8, !tbaa !0
  %arrayidx49 = getelementptr inbounds double* %x, i64 %indvars.iv98
  store double %11, double* %arrayidx49, align 8
  %12 = add nsw i64 %indvars.iv98, 1
  %13 = trunc i64 %12 to i32
  %cmp5285 = icmp slt i32 %13, %n
  br i1 %cmp5285, label %for.body53.lr.ph, label %for.end70

for.body53.lr.ph:                                 ; preds = %for.body43
  %14 = sext i32 %indvars.iv to i64
  br label %for.body53

for.body53:                                       ; preds = %for.body53, %for.body53.lr.ph
  %indvars.iv95 = phi i64 [ %14, %for.body53.lr.ph ], [ %indvars.iv.next96, %for.body53 ]
  %storemerge86 = phi double [ %11, %for.body53.lr.ph ], [ %sub65, %for.body53 ]
  %15 = load i32* %arrayidx45, align 4, !tbaa !3
  %idxprom59 = sext i32 %15 to i64
  %arrayidx61 = getelementptr inbounds [3 x double]* %a, i64 %idxprom59, i64 %indvars.iv95
  %16 = load double* %arrayidx61, align 8, !tbaa !0
  %arrayidx63 = getelementptr inbounds double* %x, i64 %indvars.iv95
  %17 = load double* %arrayidx63, align 8, !tbaa !0
  %mul64 = fmul double %16, %17
  %sub65 = fsub double %storemerge86, %mul64
  store double %sub65, double* %arrayidx49, align 8
  %indvars.iv.next96 = add i64 %indvars.iv95, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next96 to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %n
  br i1 %exitcond, label %for.end70, label %for.body53

for.end70:                                        ; preds = %for.body53, %for.body43
  %storemerge.lcssa = phi double [ %11, %for.body43 ], [ %sub65, %for.body53 ]
  %18 = load i32* %arrayidx45, align 4, !tbaa !3
  %idxprom76 = sext i32 %18 to i64
  %arrayidx78 = getelementptr inbounds [3 x double]* %a, i64 %idxprom76, i64 %indvars.iv98
  %19 = load double* %arrayidx78, align 8, !tbaa !0
  %div79 = fdiv double %storemerge.lcssa, %19
  store double %div79, double* %arrayidx49, align 8, !tbaa !0
  %20 = trunc i64 %indvars.iv98 to i32
  %cmp42 = icmp sgt i32 %20, 0
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvars.iv.next99 = add i64 %indvars.iv98, -1
  br i1 %cmp42, label %for.body43, label %for.end83

for.end83:                                        ; preds = %for.end70, %for.end23
  ret void
}

define void @elgs([3 x double]* nocapture %a, i32 %n, i32* nocapture %indx) nounwind uwtable {
entry:
  %c = alloca [3 x double], align 16
  %cmp = icmp sgt i32 %n, 3
  br i1 %cmp, label %if.then, label %for.cond.preheader

for.cond.preheader:                               ; preds = %entry
  %cmp1134 = icmp sgt i32 %n, 0
  br i1 %cmp1134, label %for.body, label %for.cond29.preheader

if.then:                                          ; preds = %entry
  %puts = call i32 @puts(i8* getelementptr inbounds ([35 x i8]* @str, i64 0, i64 0))
  call void @exit(i32 1) noreturn nounwind
  unreachable

for.cond2.preheader:                              ; preds = %for.body
  br i1 %cmp1134, label %for.body7.lr.ph.us, label %for.cond29.preheader

for.end23.us:                                     ; preds = %for.body7.us
  %arrayidx25.us = getelementptr inbounds [3 x double]* %c, i64 0, i64 %indvars.iv136
  store double %c1.1.us, double* %arrayidx25.us, align 8, !tbaa !0
  %indvars.iv.next137 = add i64 %indvars.iv136, 1
  %lftr.wideiv138 = trunc i64 %indvars.iv.next137 to i32
  %exitcond139 = icmp eq i32 %lftr.wideiv138, %n
  br i1 %exitcond139, label %for.cond29.preheader, label %for.body7.lr.ph.us

for.body7.us:                                     ; preds = %for.body7.us, %for.body7.lr.ph.us
  %indvars.iv = phi i64 [ 0, %for.body7.lr.ph.us ], [ %indvars.iv.next, %for.body7.us ]
  %c1.0130.us = phi double [ 0.000000e+00, %for.body7.lr.ph.us ], [ %c1.1.us, %for.body7.us ]
  %arrayidx11.us = getelementptr inbounds [3 x double]* %a, i64 %indvars.iv136, i64 %indvars.iv
  %0 = load double* %arrayidx11.us, align 8, !tbaa !0
  %call12.us = call double @fabs(double %0) nounwind readnone
  %cmp13.us = fcmp ogt double %call12.us, %c1.0130.us
  %c1.1.us = select i1 %cmp13.us, double %call12.us, double %c1.0130.us
  %indvars.iv.next = add i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %n
  br i1 %exitcond, label %for.end23.us, label %for.body7.us

for.body7.lr.ph.us:                               ; preds = %for.end23.us, %for.cond2.preheader
  %indvars.iv136 = phi i64 [ %indvars.iv.next137, %for.end23.us ], [ 0, %for.cond2.preheader ]
  br label %for.body7.us

for.body:                                         ; preds = %for.cond.preheader, %for.body
  %indvars.iv178 = phi i64 [ %indvars.iv.next179, %for.body ], [ 0, %for.cond.preheader ]
  %arrayidx = getelementptr inbounds i32* %indx, i64 %indvars.iv178
  %1 = trunc i64 %indvars.iv178 to i32
  store i32 %1, i32* %arrayidx, align 4, !tbaa !3
  %indvars.iv.next179 = add i64 %indvars.iv178, 1
  %lftr.wideiv180 = trunc i64 %indvars.iv.next179 to i32
  %exitcond181 = icmp eq i32 %lftr.wideiv180, %n
  br i1 %exitcond181, label %for.cond2.preheader, label %for.body

for.cond29.preheader:                             ; preds = %for.cond.preheader, %for.end23.us, %for.cond2.preheader
  %sub = add nsw i32 %n, -1
  %cmp30125 = icmp sgt i32 %sub, 0
  br i1 %cmp30125, label %for.cond32.preheader, label %for.end113

for.cond29.loopexit:                              ; preds = %for.inc108.us, %for.end51
  %k.3.lcssa = phi i32 [ %k.1.lcssa, %for.end51 ], [ %n, %for.inc108.us ]
  %indvars.iv.next161 = add i64 %indvars.iv160, 1
  %exitcond172 = icmp eq i32 %9, %sub
  br i1 %exitcond172, label %for.end113, label %for.cond32.preheader

for.cond32.preheader:                             ; preds = %for.cond29.preheader, %for.cond29.loopexit
  %indvars.iv169 = phi i64 [ %indvars.iv.next170, %for.cond29.loopexit ], [ 0, %for.cond29.preheader ]
  %indvars.iv160 = phi i64 [ %indvars.iv.next161, %for.cond29.loopexit ], [ 1, %for.cond29.preheader ]
  %k.0127 = phi i32 [ %k.3.lcssa, %for.cond29.loopexit ], [ undef, %for.cond29.preheader ]
  %2 = trunc i64 %indvars.iv169 to i32
  %cmp33114 = icmp slt i32 %2, %n
  br i1 %cmp33114, label %for.body34, label %for.end51

for.body34:                                       ; preds = %for.cond32.preheader, %for.body34
  %indvars.iv156 = phi i64 [ %indvars.iv.next157, %for.body34 ], [ %indvars.iv169, %for.cond32.preheader ]
  %pi1.0117 = phi double [ %pi1.1, %for.body34 ], [ 0.000000e+00, %for.cond32.preheader ]
  %k.1116 = phi i32 [ %k.2, %for.body34 ], [ %k.0127, %for.cond32.preheader ]
  %arrayidx37 = getelementptr inbounds i32* %indx, i64 %indvars.iv156
  %3 = load i32* %arrayidx37, align 4, !tbaa !3
  %idxprom38 = sext i32 %3 to i64
  %arrayidx40 = getelementptr inbounds [3 x double]* %a, i64 %idxprom38, i64 %indvars.iv169
  %4 = load double* %arrayidx40, align 8, !tbaa !0
  %call41 = call double @fabs(double %4) nounwind readnone
  %arrayidx45 = getelementptr inbounds [3 x double]* %c, i64 0, i64 %idxprom38
  %5 = load double* %arrayidx45, align 8, !tbaa !0
  %div = fdiv double %call41, %5
  %cmp46 = fcmp ogt double %div, %pi1.0117
  %6 = trunc i64 %indvars.iv156 to i32
  %k.2 = select i1 %cmp46, i32 %6, i32 %k.1116
  %pi1.1 = select i1 %cmp46, double %div, double %pi1.0117
  %indvars.iv.next157 = add i64 %indvars.iv156, 1
  %lftr.wideiv158 = trunc i64 %indvars.iv.next157 to i32
  %exitcond159 = icmp eq i32 %lftr.wideiv158, %n
  br i1 %exitcond159, label %for.end51, label %for.body34

for.end51:                                        ; preds = %for.body34, %for.cond32.preheader
  %k.1.lcssa = phi i32 [ %k.0127, %for.cond32.preheader ], [ %k.2, %for.body34 ]
  %arrayidx53 = getelementptr inbounds i32* %indx, i64 %indvars.iv169
  %7 = load i32* %arrayidx53, align 4, !tbaa !3
  %idxprom54 = sext i32 %k.1.lcssa to i64
  %arrayidx55 = getelementptr inbounds i32* %indx, i64 %idxprom54
  %8 = load i32* %arrayidx55, align 4, !tbaa !3
  store i32 %8, i32* %arrayidx53, align 4, !tbaa !3
  store i32 %7, i32* %arrayidx55, align 4, !tbaa !3
  %indvars.iv.next170 = add i64 %indvars.iv169, 1
  %9 = trunc i64 %indvars.iv.next170 to i32
  %cmp61122 = icmp slt i32 %9, %n
  br i1 %cmp61122, label %for.body62.lr.ph.split.us, label %for.cond29.loopexit

for.body62.lr.ph.split.us:                        ; preds = %for.end51
  %10 = load i32* %arrayidx53, align 4, !tbaa !3
  %idxprom72 = sext i32 %10 to i64
  %arrayidx74 = getelementptr inbounds [3 x double]* %a, i64 %idxprom72, i64 %indvars.iv169
  br label %for.body85.lr.ph.us

for.inc108.us:                                    ; preds = %for.body85.us
  %indvars.iv.next150 = add i64 %indvars.iv149, 1
  %lftr.wideiv152 = trunc i64 %indvars.iv.next150 to i32
  %exitcond153 = icmp eq i32 %lftr.wideiv152, %n
  br i1 %exitcond153, label %for.cond29.loopexit, label %for.body85.lr.ph.us

for.body85.us:                                    ; preds = %for.body85.us, %for.body85.lr.ph.us
  %indvars.iv142 = phi i64 [ %indvars.iv160, %for.body85.lr.ph.us ], [ %indvars.iv.next143, %for.body85.us ]
  %arrayidx91.us = getelementptr inbounds [3 x double]* %a, i64 %idxprom66.us, i64 %indvars.iv142
  %11 = load double* %arrayidx91.us, align 8, !tbaa !0
  %arrayidx97.us = getelementptr inbounds [3 x double]* %a, i64 %idxprom72, i64 %indvars.iv142
  %12 = load double* %arrayidx97.us, align 8, !tbaa !0
  %mul.us = fmul double %div75.us, %12
  %sub98.us = fsub double %11, %mul.us
  store double %sub98.us, double* %arrayidx91.us, align 8, !tbaa !0
  %indvars.iv.next143 = add i64 %indvars.iv142, 1
  %lftr.wideiv145 = trunc i64 %indvars.iv.next143 to i32
  %exitcond146 = icmp eq i32 %lftr.wideiv145, %n
  br i1 %exitcond146, label %for.inc108.us, label %for.body85.us

for.body85.lr.ph.us:                              ; preds = %for.body62.lr.ph.split.us, %for.inc108.us
  %indvars.iv149 = phi i64 [ %indvars.iv.next150, %for.inc108.us ], [ %indvars.iv160, %for.body62.lr.ph.split.us ]
  %arrayidx65.us = getelementptr inbounds i32* %indx, i64 %indvars.iv149
  %13 = load i32* %arrayidx65.us, align 4, !tbaa !3
  %idxprom66.us = sext i32 %13 to i64
  %arrayidx68.us = getelementptr inbounds [3 x double]* %a, i64 %idxprom66.us, i64 %indvars.iv169
  %14 = load double* %arrayidx68.us, align 8, !tbaa !0
  %15 = load double* %arrayidx74, align 8, !tbaa !0
  %div75.us = fdiv double %14, %15
  store double %div75.us, double* %arrayidx68.us, align 8, !tbaa !0
  br label %for.body85.us

for.end113:                                       ; preds = %for.cond29.loopexit, %for.cond29.preheader
  ret void
}

declare void @exit(i32) noreturn

declare double @fabs(double) nounwind readnone

declare i32 @puts(i8* nocapture) nounwind

!0 = metadata !{metadata !"double", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
