; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr36034-2.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@x = global [50 x double] [double 1.000000e+01, double 1.100000e+01, double 1.200000e+01, double 1.300000e+01, double 1.400000e+01, double 1.500000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double 2.100000e+01, double 2.200000e+01, double 2.300000e+01, double 2.400000e+01, double 2.500000e+01, double 2.600000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double 3.200000e+01, double 3.300000e+01, double 3.400000e+01, double 3.500000e+01, double 3.600000e+01, double 3.700000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double 4.300000e+01, double 4.400000e+01, double 4.500000e+01, double 4.600000e+01, double 4.700000e+01, double 4.800000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double 5.400000e+01, double 5.500000e+01, double 5.600000e+01, double 5.700000e+01, double 5.800000e+01, double 5.900000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00], align 16
@tmp = common global [30 x double] zeroinitializer, align 16

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
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvar = phi i64 [ 0, %entry ], [ %indvar.next, %for.body ]
  %tmp = mul i64 %indvar, 10
  %tmp4 = add i64 %tmp, 5
  %arrayidx54 = getelementptr [50 x double]* @x, i64 0, i64 %tmp4
  %tmp5 = add i64 %tmp, 4
  %arrayidx43 = getelementptr [50 x double]* @x, i64 0, i64 %tmp5
  %tmp6 = add i64 %tmp, 3
  %arrayidx32 = getelementptr [50 x double]* @x, i64 0, i64 %tmp6
  %tmp7 = add i64 %tmp, 2
  %arrayidx21 = getelementptr [50 x double]* @x, i64 0, i64 %tmp7
  %tmp818 = or i64 %tmp, 1
  %arrayidx10 = getelementptr [50 x double]* @x, i64 0, i64 %tmp818
  %arrayidx = getelementptr [50 x double]* @x, i64 0, i64 %tmp
  %tmp9 = mul i64 %indvar, 6
  %tmp10 = add i64 %tmp9, 5
  %arrayidx60 = getelementptr [30 x double]* @tmp, i64 0, i64 %tmp10
  %tmp12 = add i64 %tmp9, 4
  %arrayidx49 = getelementptr [30 x double]* @tmp, i64 0, i64 %tmp12
  %tmp13 = add i64 %tmp9, 3
  %arrayidx38 = getelementptr [30 x double]* @tmp, i64 0, i64 %tmp13
  %tmp14 = add i64 %tmp9, 2
  %arrayidx27 = getelementptr [30 x double]* @tmp, i64 0, i64 %tmp14
  %tmp1519 = or i64 %tmp9, 1
  %arrayidx16 = getelementptr [30 x double]* @tmp, i64 0, i64 %tmp1519
  %arrayidx6 = getelementptr [30 x double]* @tmp, i64 0, i64 %tmp9
  %tmp2 = load double* %arrayidx, align 16
  store double %tmp2, double* %arrayidx6, align 16
  %tmp11 = load double* %arrayidx10, align 8
  store double %tmp11, double* %arrayidx16, align 8
  %tmp22 = load double* %arrayidx21, align 16
  store double %tmp22, double* %arrayidx27, align 16
  %tmp33 = load double* %arrayidx32, align 8
  store double %tmp33, double* %arrayidx38, align 8
  %tmp44 = load double* %arrayidx43, align 16
  store double %tmp44, double* %arrayidx49, align 16
  %tmp55 = load double* %arrayidx54, align 8
  store double %tmp55, double* %arrayidx60, align 8
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, 5
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  tail call void @test()
  br label %for.cond

for.cond:                                         ; preds = %for.inc10, %entry
  %indvar2 = phi i64 [ %indvar.next3, %for.inc10 ], [ 0, %entry ]
  %tmp6 = mul i64 %indvar2, 6
  %storemerge = trunc i64 %indvar2 to i32
  %cmp = icmp slt i32 %storemerge, 5
  br i1 %cmp, label %for.cond1, label %for.end13

for.cond1:                                        ; preds = %for.cond, %for.inc
  %indvar = phi i64 [ %indvar.next, %for.inc ], [ 0, %for.cond ]
  %storemerge1 = trunc i64 %indvar to i32
  %cmp3 = icmp slt i32 %storemerge1, 6
  br i1 %cmp3, label %for.body4, label %for.inc10

for.body4:                                        ; preds = %for.cond1
  %tmp8 = add i64 %tmp6, %indvar
  %arrayidx = getelementptr [30 x double]* @tmp, i64 0, i64 %tmp8
  %tmp7 = load double* %arrayidx, align 8
  %cmp8 = fcmp oeq double %tmp7, -1.000000e+00
  br i1 %cmp8, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body4
  tail call void @abort() noreturn nounwind
  unreachable

for.inc:                                          ; preds = %for.body4
  %indvar.next = add i64 %indvar, 1
  br label %for.cond1

for.inc10:                                        ; preds = %for.cond1
  %indvar.next3 = add i64 %indvar2, 1
  br label %for.cond

for.end13:                                        ; preds = %for.cond
  ret i32 0
}

declare void @abort() noreturn nounwind
