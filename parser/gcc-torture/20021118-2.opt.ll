; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20021118-2.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

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

define i32 @t1(float* %f, i32 %i, void (double)* nocapture %f1, void (float, float)* %f2) nounwind uwtable {
entry:
  tail call void %f1(double 3.000000e+00) nounwind
  %add = add nsw i32 %i, 1
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds float* %f, i64 %idxprom
  %tmp3 = load float* %arrayidx, align 4
  %idxprom5 = sext i32 %i to i64
  %arrayidx7 = getelementptr inbounds float* %f, i64 %idxprom5
  store float %tmp3, float* %arrayidx7, align 4
  tail call void %f2(float 2.500000e+00, float 3.500000e+00) nounwind
  ret i32 0
}

define i32 @t2(float* %f, i32 %i, void (double)* %f1, void (float, float)* %f2, void (float)* nocapture %f3) nounwind uwtable {
entry:
  tail call void %f3(float 6.000000e+00) nounwind
  tail call void %f1(double 3.000000e+00) nounwind
  %add = add nsw i32 %i, 1
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds float* %f, i64 %idxprom
  %tmp4 = load float* %arrayidx, align 4
  %idxprom6 = sext i32 %i to i64
  %arrayidx8 = getelementptr inbounds float* %f, i64 %idxprom6
  store float %tmp4, float* %arrayidx8, align 4
  tail call void %f2(float 2.500000e+00, float 3.500000e+00) nounwind
  ret i32 0
}

define void @f1(double %d) nounwind uwtable {
entry:
  %cmp = fcmp une double %d, 3.000000e+00
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define void @f2(float %f1, float %f2) nounwind uwtable {
entry:
  %cmp = fcmp une float %f1, 2.500000e+00
  %cmp2 = fcmp une float %f2, 3.500000e+00
  %or.cond = or i1 %cmp, %cmp2
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f3(float %f) nounwind uwtable {
entry:
  %cmp = fcmp une float %f, 6.000000e+00
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
