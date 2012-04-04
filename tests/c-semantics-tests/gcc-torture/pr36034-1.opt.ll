; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr36034-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@x = global [5 x [10 x double]] [[10 x double] [double 1.000000e+01, double 1.100000e+01, double 1.200000e+01, double 1.300000e+01, double 1.400000e+01, double 1.500000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00], [10 x double] [double 2.100000e+01, double 2.200000e+01, double 2.300000e+01, double 2.400000e+01, double 2.500000e+01, double 2.600000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00], [10 x double] [double 3.200000e+01, double 3.300000e+01, double 3.400000e+01, double 3.500000e+01, double 3.600000e+01, double 3.700000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00], [10 x double] [double 4.300000e+01, double 4.400000e+01, double 4.500000e+01, double 4.600000e+01, double 4.700000e+01, double 4.800000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00], [10 x double] [double 5.400000e+01, double 5.500000e+01, double 5.600000e+01, double 5.700000e+01, double 5.800000e+01, double 5.900000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00]], align 16
@tmp = common global [5 x [6 x double]] zeroinitializer, align 16

define void @test() nounwind uwtable noinline {
entry:
  %0 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 0, i64 0), align 16, !tbaa !0
  store double %0, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 0, i64 0), align 16, !tbaa !0
  %1 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 0, i64 1), align 8, !tbaa !0
  store double %1, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 0, i64 1), align 8, !tbaa !0
  %2 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 0, i64 2), align 16, !tbaa !0
  store double %2, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 0, i64 2), align 16, !tbaa !0
  %3 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 0, i64 3), align 8, !tbaa !0
  store double %3, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 0, i64 3), align 8, !tbaa !0
  %4 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 0, i64 4), align 16, !tbaa !0
  store double %4, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 0, i64 4), align 16, !tbaa !0
  %5 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 0, i64 5), align 8, !tbaa !0
  store double %5, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 0, i64 5), align 8, !tbaa !0
  %6 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 1, i64 0), align 16, !tbaa !0
  store double %6, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 1, i64 0), align 16, !tbaa !0
  %7 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 1, i64 1), align 8, !tbaa !0
  store double %7, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 1, i64 1), align 8, !tbaa !0
  %8 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 1, i64 2), align 16, !tbaa !0
  store double %8, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 1, i64 2), align 16, !tbaa !0
  %9 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 1, i64 3), align 8, !tbaa !0
  store double %9, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 1, i64 3), align 8, !tbaa !0
  %10 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 1, i64 4), align 16, !tbaa !0
  store double %10, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 1, i64 4), align 16, !tbaa !0
  %11 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 1, i64 5), align 8, !tbaa !0
  store double %11, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 1, i64 5), align 8, !tbaa !0
  %12 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 2, i64 0), align 16, !tbaa !0
  store double %12, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 2, i64 0), align 16, !tbaa !0
  %13 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 2, i64 1), align 8, !tbaa !0
  store double %13, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 2, i64 1), align 8, !tbaa !0
  %14 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 2, i64 2), align 16, !tbaa !0
  store double %14, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 2, i64 2), align 16, !tbaa !0
  %15 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 2, i64 3), align 8, !tbaa !0
  store double %15, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 2, i64 3), align 8, !tbaa !0
  %16 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 2, i64 4), align 16, !tbaa !0
  store double %16, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 2, i64 4), align 16, !tbaa !0
  %17 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 2, i64 5), align 8, !tbaa !0
  store double %17, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 2, i64 5), align 8, !tbaa !0
  %18 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 3, i64 0), align 16, !tbaa !0
  store double %18, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 3, i64 0), align 16, !tbaa !0
  %19 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 3, i64 1), align 8, !tbaa !0
  store double %19, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 3, i64 1), align 8, !tbaa !0
  %20 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 3, i64 2), align 16, !tbaa !0
  store double %20, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 3, i64 2), align 16, !tbaa !0
  %21 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 3, i64 3), align 8, !tbaa !0
  store double %21, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 3, i64 3), align 8, !tbaa !0
  %22 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 3, i64 4), align 16, !tbaa !0
  store double %22, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 3, i64 4), align 16, !tbaa !0
  %23 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 3, i64 5), align 8, !tbaa !0
  store double %23, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 3, i64 5), align 8, !tbaa !0
  %24 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 4, i64 0), align 16, !tbaa !0
  store double %24, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 4, i64 0), align 16, !tbaa !0
  %25 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 4, i64 1), align 8, !tbaa !0
  store double %25, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 4, i64 1), align 8, !tbaa !0
  %26 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 4, i64 2), align 16, !tbaa !0
  store double %26, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 4, i64 2), align 16, !tbaa !0
  %27 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 4, i64 3), align 8, !tbaa !0
  store double %27, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 4, i64 3), align 8, !tbaa !0
  %28 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 4, i64 4), align 16, !tbaa !0
  store double %28, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 4, i64 4), align 16, !tbaa !0
  %29 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 4, i64 5), align 8, !tbaa !0
  store double %29, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 4, i64 5), align 8, !tbaa !0
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  tail call void @test()
  br label %for.cond

for.cond:                                         ; preds = %for.inc7, %entry
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %for.inc7 ], [ 0, %entry ]
  %0 = trunc i64 %indvars.iv10 to i32
  %cmp = icmp slt i32 %0, 5
  br i1 %cmp, label %for.cond1, label %for.end9

for.cond1:                                        ; preds = %for.cond, %for.body3
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3 ], [ 0, %for.cond ]
  %1 = trunc i64 %indvars.iv to i32
  %cmp2 = icmp slt i32 %1, 6
  br i1 %cmp2, label %for.body3, label %for.inc7

for.body3:                                        ; preds = %for.cond1
  %arrayidx5 = getelementptr inbounds [5 x [6 x double]]* @tmp, i64 0, i64 %indvars.iv10, i64 %indvars.iv
  %2 = load double* %arrayidx5, align 8, !tbaa !0
  %cmp6 = fcmp oeq double %2, -1.000000e+00
  %indvars.iv.next = add i64 %indvars.iv, 1
  br i1 %cmp6, label %if.then, label %for.cond1

if.then:                                          ; preds = %for.body3
  tail call void @abort() noreturn nounwind
  unreachable

for.inc7:                                         ; preds = %for.cond1
  %indvars.iv.next11 = add i64 %indvars.iv10, 1
  br label %for.cond

for.end9:                                         ; preds = %for.cond
  ret i32 0
}

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"double", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
