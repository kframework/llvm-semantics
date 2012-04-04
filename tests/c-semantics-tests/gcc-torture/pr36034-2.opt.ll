; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr36034-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@x = global [50 x double] [double 1.000000e+01, double 1.100000e+01, double 1.200000e+01, double 1.300000e+01, double 1.400000e+01, double 1.500000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double 2.100000e+01, double 2.200000e+01, double 2.300000e+01, double 2.400000e+01, double 2.500000e+01, double 2.600000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double 3.200000e+01, double 3.300000e+01, double 3.400000e+01, double 3.500000e+01, double 3.600000e+01, double 3.700000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double 4.300000e+01, double 4.400000e+01, double 4.500000e+01, double 4.600000e+01, double 4.700000e+01, double 4.800000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double 5.400000e+01, double 5.500000e+01, double 5.600000e+01, double 5.700000e+01, double 5.800000e+01, double 5.900000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00], align 16
@tmp = common global [30 x double] zeroinitializer, align 16

define void @test() nounwind uwtable noinline {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body ]
  %0 = mul nsw i64 %indvars.iv, 10
  %arrayidx = getelementptr inbounds [50 x double]* @x, i64 0, i64 %0
  %1 = load double* %arrayidx, align 16, !tbaa !0
  %2 = mul nsw i64 %indvars.iv, 6
  %arrayidx3 = getelementptr inbounds [30 x double]* @tmp, i64 0, i64 %2
  store double %1, double* %arrayidx3, align 16, !tbaa !0
  %3 = or i64 %0, 1
  %arrayidx6 = getelementptr inbounds [50 x double]* @x, i64 0, i64 %3
  %4 = load double* %arrayidx6, align 8, !tbaa !0
  %5 = or i64 %2, 1
  %arrayidx10 = getelementptr inbounds [30 x double]* @tmp, i64 0, i64 %5
  store double %4, double* %arrayidx10, align 8, !tbaa !0
  %6 = add nsw i64 %0, 2
  %arrayidx14 = getelementptr inbounds [50 x double]* @x, i64 0, i64 %6
  %7 = load double* %arrayidx14, align 16, !tbaa !0
  %8 = add nsw i64 %2, 2
  %arrayidx18 = getelementptr inbounds [30 x double]* @tmp, i64 0, i64 %8
  store double %7, double* %arrayidx18, align 16, !tbaa !0
  %9 = add nsw i64 %0, 3
  %arrayidx22 = getelementptr inbounds [50 x double]* @x, i64 0, i64 %9
  %10 = load double* %arrayidx22, align 8, !tbaa !0
  %11 = add nsw i64 %2, 3
  %arrayidx26 = getelementptr inbounds [30 x double]* @tmp, i64 0, i64 %11
  store double %10, double* %arrayidx26, align 8, !tbaa !0
  %12 = add nsw i64 %0, 4
  %arrayidx30 = getelementptr inbounds [50 x double]* @x, i64 0, i64 %12
  %13 = load double* %arrayidx30, align 16, !tbaa !0
  %14 = add nsw i64 %2, 4
  %arrayidx34 = getelementptr inbounds [30 x double]* @tmp, i64 0, i64 %14
  store double %13, double* %arrayidx34, align 16, !tbaa !0
  %15 = add nsw i64 %0, 5
  %arrayidx38 = getelementptr inbounds [50 x double]* @x, i64 0, i64 %15
  %16 = load double* %arrayidx38, align 8, !tbaa !0
  %17 = add nsw i64 %2, 5
  %arrayidx42 = getelementptr inbounds [30 x double]* @tmp, i64 0, i64 %17
  store double %16, double* %arrayidx42, align 8, !tbaa !0
  %indvars.iv.next = add i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 5
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  tail call void @test()
  br label %for.cond

for.cond:                                         ; preds = %for.inc5, %entry
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %for.inc5 ], [ 0, %entry ]
  %0 = trunc i64 %indvars.iv9 to i32
  %cmp = icmp slt i32 %0, 5
  br i1 %cmp, label %for.cond1.preheader, label %for.end7

for.cond1.preheader:                              ; preds = %for.cond
  %1 = mul nsw i64 %indvars.iv9, 6
  br label %for.cond1

for.cond1:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3 ], [ 0, %for.cond1.preheader ]
  %2 = trunc i64 %indvars.iv to i32
  %cmp2 = icmp slt i32 %2, 6
  br i1 %cmp2, label %for.body3, label %for.inc5

for.body3:                                        ; preds = %for.cond1
  %3 = add nsw i64 %indvars.iv, %1
  %arrayidx = getelementptr inbounds [30 x double]* @tmp, i64 0, i64 %3
  %4 = load double* %arrayidx, align 8, !tbaa !0
  %cmp4 = fcmp oeq double %4, -1.000000e+00
  %indvars.iv.next = add i64 %indvars.iv, 1
  br i1 %cmp4, label %if.then, label %for.cond1

if.then:                                          ; preds = %for.body3
  tail call void @abort() noreturn nounwind
  unreachable

for.inc5:                                         ; preds = %for.cond1
  %indvars.iv.next10 = add i64 %indvars.iv9, 1
  br label %for.cond

for.end7:                                         ; preds = %for.cond
  ret i32 0
}

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"double", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
