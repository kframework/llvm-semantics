; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr36034-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@x = global [5 x [10 x double]] [[10 x double] [double 1.000000e+01, double 1.100000e+01, double 1.200000e+01, double 1.300000e+01, double 1.400000e+01, double 1.500000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00], [10 x double] [double 2.100000e+01, double 2.200000e+01, double 2.300000e+01, double 2.400000e+01, double 2.500000e+01, double 2.600000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00], [10 x double] [double 3.200000e+01, double 3.300000e+01, double 3.400000e+01, double 3.500000e+01, double 3.600000e+01, double 3.700000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00], [10 x double] [double 4.300000e+01, double 4.400000e+01, double 4.500000e+01, double 4.600000e+01, double 4.700000e+01, double 4.800000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00], [10 x double] [double 5.400000e+01, double 5.500000e+01, double 5.600000e+01, double 5.700000e+01, double 5.800000e+01, double 5.900000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00]], align 16
@tmp = common global [5 x [6 x double]] zeroinitializer, align 16

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %shr = lshr i64 %__dev, 8
  %and = and i64 %shr, 4095
  %shr2 = lshr i64 %__dev, 32
  %and3 = and i64 %shr2, 4294963200
  %or = or i64 %and, %and3
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %and = and i64 %__dev, 255
  %shr = lshr i64 %__dev, 12
  %and2 = and i64 %shr, 4294967040
  %or = or i64 %and2, %and
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable readnone inlinehint {
entry:
  %and = and i32 %__minor, 255
  %and2 = shl i32 %__major, 8
  %shl = and i32 %and2, 1048320
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %and4 = and i32 %__minor, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl nuw nsw i64 %conv5, 12
  %and9 = and i32 %__major, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl nuw i64 %conv10, 32
  %or7 = or i64 %shl6, %shl11
  %or12 = or i64 %or7, %conv
  ret i64 %or12
}

define void @test() nounwind uwtable noinline {
entry:
  %tmp3 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 0, i64 0), align 16
  store double %tmp3, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 0, i64 0), align 16
  %tmp12 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 0, i64 1), align 8
  store double %tmp12, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 0, i64 1), align 8
  %tmp21 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 0, i64 2), align 16
  store double %tmp21, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 0, i64 2), align 16
  %tmp30 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 0, i64 3), align 8
  store double %tmp30, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 0, i64 3), align 8
  %tmp39 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 0, i64 4), align 16
  store double %tmp39, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 0, i64 4), align 16
  %tmp48 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 0, i64 5), align 8
  store double %tmp48, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 0, i64 5), align 8
  %tmp3.1 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 1, i64 0), align 16
  store double %tmp3.1, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 1, i64 0), align 16
  %tmp12.1 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 1, i64 1), align 8
  store double %tmp12.1, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 1, i64 1), align 8
  %tmp21.1 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 1, i64 2), align 16
  store double %tmp21.1, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 1, i64 2), align 16
  %tmp30.1 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 1, i64 3), align 8
  store double %tmp30.1, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 1, i64 3), align 8
  %tmp39.1 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 1, i64 4), align 16
  store double %tmp39.1, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 1, i64 4), align 16
  %tmp48.1 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 1, i64 5), align 8
  store double %tmp48.1, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 1, i64 5), align 8
  %tmp3.2 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 2, i64 0), align 16
  store double %tmp3.2, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 2, i64 0), align 16
  %tmp12.2 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 2, i64 1), align 8
  store double %tmp12.2, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 2, i64 1), align 8
  %tmp21.2 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 2, i64 2), align 16
  store double %tmp21.2, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 2, i64 2), align 16
  %tmp30.2 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 2, i64 3), align 8
  store double %tmp30.2, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 2, i64 3), align 8
  %tmp39.2 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 2, i64 4), align 16
  store double %tmp39.2, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 2, i64 4), align 16
  %tmp48.2 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 2, i64 5), align 8
  store double %tmp48.2, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 2, i64 5), align 8
  %tmp3.3 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 3, i64 0), align 16
  store double %tmp3.3, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 3, i64 0), align 16
  %tmp12.3 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 3, i64 1), align 8
  store double %tmp12.3, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 3, i64 1), align 8
  %tmp21.3 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 3, i64 2), align 16
  store double %tmp21.3, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 3, i64 2), align 16
  %tmp30.3 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 3, i64 3), align 8
  store double %tmp30.3, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 3, i64 3), align 8
  %tmp39.3 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 3, i64 4), align 16
  store double %tmp39.3, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 3, i64 4), align 16
  %tmp48.3 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 3, i64 5), align 8
  store double %tmp48.3, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 3, i64 5), align 8
  %tmp3.4 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 4, i64 0), align 16
  store double %tmp3.4, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 4, i64 0), align 16
  %tmp12.4 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 4, i64 1), align 8
  store double %tmp12.4, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 4, i64 1), align 8
  %tmp21.4 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 4, i64 2), align 16
  store double %tmp21.4, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 4, i64 2), align 16
  %tmp30.4 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 4, i64 3), align 8
  store double %tmp30.4, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 4, i64 3), align 8
  %tmp39.4 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 4, i64 4), align 16
  store double %tmp39.4, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 4, i64 4), align 16
  %tmp48.4 = load double* getelementptr inbounds ([5 x [10 x double]]* @x, i64 0, i64 4, i64 5), align 8
  store double %tmp48.4, double* getelementptr inbounds ([5 x [6 x double]]* @tmp, i64 0, i64 4, i64 5), align 8
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  tail call void @test()
  br label %for.cond

for.cond:                                         ; preds = %for.inc12, %entry
  %indvar2 = phi i64 [ %indvar.next3, %for.inc12 ], [ 0, %entry ]
  %storemerge = trunc i64 %indvar2 to i32
  %cmp = icmp slt i32 %storemerge, 5
  br i1 %cmp, label %for.cond1, label %for.end15

for.cond1:                                        ; preds = %for.cond, %for.inc
  %indvar = phi i64 [ %indvar.next, %for.inc ], [ 0, %for.cond ]
  %storemerge1 = trunc i64 %indvar to i32
  %cmp3 = icmp slt i32 %storemerge1, 6
  br i1 %cmp3, label %for.body4, label %for.inc12

for.body4:                                        ; preds = %for.cond1
  %arrayidx8 = getelementptr [5 x [6 x double]]* @tmp, i64 0, i64 %indvar2, i64 %indvar
  %tmp9 = load double* %arrayidx8, align 8
  %cmp10 = fcmp oeq double %tmp9, -1.000000e+00
  br i1 %cmp10, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body4
  tail call void @abort() noreturn nounwind
  unreachable

for.inc:                                          ; preds = %for.body4
  %indvar.next = add i64 %indvar, 1
  br label %for.cond1

for.inc12:                                        ; preds = %for.cond1
  %indvar.next3 = add i64 %indvar2, 1
  br label %for.cond

for.end15:                                        ; preds = %for.cond
  ret i32 0
}

declare void @abort() noreturn nounwind
