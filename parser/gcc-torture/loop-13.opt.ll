; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/loop-13.ll'
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

define void @scale(i64* %alpha, i64* %x, i32 %n) nounwind uwtable {
entry:
  %tmp1 = load i64* %alpha, align 8
  %cmp = icmp ne i64 %tmp1, 1
  %cmp43 = icmp sgt i32 %n, 0
  %or.cond = and i1 %cmp, %cmp43
  br i1 %or.cond, label %for.body.lr.ph, label %if.end

for.body.lr.ph:                                   ; preds = %entry
  %tmp = zext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %for.body.for.body_crit_edge, %for.body.lr.ph
  %tmp8 = phi i64 [ %tmp1, %for.body.lr.ph ], [ %tmp8.pre, %for.body.for.body_crit_edge ]
  %indvar = phi i64 [ 0, %for.body.lr.ph ], [ %indvar.next, %for.body.for.body_crit_edge ]
  %tmp6 = shl i64 %indvar, 1
  %arrayidx = getelementptr i64* %x, i64 %tmp6
  %tmp712 = or i64 %tmp6, 1
  %arrayidx17 = getelementptr i64* %x, i64 %tmp712
  %tmp11 = load i64* %arrayidx, align 8
  %mul = mul nsw i64 %tmp11, %tmp8
  %tmp18 = load i64* %arrayidx17, align 8
  %mul19 = mul nsw i64 %tmp18, %tmp8
  store i64 %mul, i64* %arrayidx, align 8
  store i64 %mul19, i64* %arrayidx17, align 8
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, %tmp
  br i1 %exitcond, label %if.end, label %for.body.for.body_crit_edge

for.body.for.body_crit_edge:                      ; preds = %for.body
  %tmp8.pre = load i64* %alpha, align 8
  br label %for.body

if.end:                                           ; preds = %entry, %for.body
  ret void
}

define i32 @main() nounwind uwtable {
if.end:
  ret i32 0
}
