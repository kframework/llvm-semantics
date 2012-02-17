; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20010224-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@masktab = global [6 x i16] [i16 1, i16 2, i16 3, i16 4, i16 5, i16 0], align 2
@psd = global [6 x i16] [i16 50, i16 40, i16 30, i16 20, i16 10, i16 0], align 2
@bndpsd = global [6 x i16] [i16 1, i16 2, i16 3, i16 4, i16 5, i16 0], align 2

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

define void @ba_compute_psd(i16 signext %start) nounwind uwtable {
entry:
  %conv = sext i16 %start to i32
  %idxprom = sext i16 %start to i64
  %arrayidx = getelementptr inbounds [6 x i16]* @masktab, i64 0, i64 %idxprom
  %tmp2 = load i16* %arrayidx, align 2
  %arrayidx6 = getelementptr inbounds [6 x i16]* @psd, i64 0, i64 %idxprom
  %tmp7 = load i16* %arrayidx6, align 2
  %idxprom9 = sext i16 %tmp2 to i64
  %arrayidx10 = getelementptr inbounds [6 x i16]* @bndpsd, i64 0, i64 %idxprom9
  store i16 %tmp7, i16* %arrayidx10, align 2
  %inc = add nsw i32 %conv, 1
  %cmp2 = icmp slt i32 %inc, 4
  br i1 %cmp2, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %tmp6 = sub i32 2, %conv
  %tmp8 = zext i32 %tmp6 to i64
  %tmp9 = add i64 %tmp8, 1
  %tmp15 = sext i32 %inc to i64
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvar = phi i64 [ 0, %for.body.lr.ph ], [ %indvar.next, %for.body ]
  %add.i5 = phi i16 [ %tmp7, %for.body.lr.ph ], [ %add.i, %for.body ]
  %tmp16 = add i64 %tmp15, %indvar
  %arrayidx22 = getelementptr [6 x i16]* @psd, i64 0, i64 %tmp16
  %tmp3.i = load i16* %arrayidx22, align 2
  %add.i = add i16 %tmp3.i, %add.i5
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, %tmp9
  br i1 %exitcond, label %for.cond.for.end_crit_edge, label %for.body

for.cond.for.end_crit_edge:                       ; preds = %for.body
  store i16 %add.i, i16* %arrayidx10, align 2
  br label %for.end

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %entry
  ret void
}

define signext i16 @logadd(i16* nocapture %a, i16* nocapture %b) nounwind uwtable readonly {
entry:
  %tmp1 = load i16* %a, align 2
  %tmp3 = load i16* %b, align 2
  %add = add i16 %tmp3, %tmp1
  ret i16 %add
}

define i32 @main() nounwind uwtable {
entry:
  %tmp2.i = load i16* getelementptr inbounds ([6 x i16]* @masktab, i64 0, i64 0), align 2
  %tmp7.i = load i16* getelementptr inbounds ([6 x i16]* @psd, i64 0, i64 0), align 2
  %idxprom9.i = sext i16 %tmp2.i to i64
  %arrayidx10.i = getelementptr inbounds [6 x i16]* @bndpsd, i64 0, i64 %idxprom9.i
  %tmp3.i.i = load i16* getelementptr inbounds ([6 x i16]* @psd, i64 0, i64 1), align 2
  %add.i.i = add i16 %tmp3.i.i, %tmp7.i
  %tmp3.i.i.1 = load i16* getelementptr inbounds ([6 x i16]* @psd, i64 0, i64 2), align 2
  %add.i.i.1 = add i16 %tmp3.i.i.1, %add.i.i
  %tmp3.i.i.2 = load i16* getelementptr inbounds ([6 x i16]* @psd, i64 0, i64 3), align 2
  %add.i.i.2 = add i16 %tmp3.i.i.2, %add.i.i.1
  store i16 %add.i.i.2, i16* %arrayidx10.i, align 2
  %tmp = load i16* getelementptr inbounds ([6 x i16]* @bndpsd, i64 0, i64 1), align 2
  %cmp = icmp eq i16 %tmp, 140
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
