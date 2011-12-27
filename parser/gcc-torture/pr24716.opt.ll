; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr24716.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@Link = global [1 x i32] [i32 -1], align 4
@W = global [1 x i32] [i32 2], align 4

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

define i32 @f(i32 %k, i32 %p) nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %do.cond57, %entry
  %0 = phi i32 [ 0, %entry ], [ 1, %do.cond57 ]
  %tmp615 = phi i32 [ 0, %entry ], [ %tmp616.ph, %do.cond57 ]
  %inc544 = phi i32 [ %p, %entry ], [ %3, %do.cond57 ]
  %tmp481 = phi i32 [ %k, %entry ], [ -1, %do.cond57 ]
  %cmp = icmp sgt i32 %tmp615, 2
  br i1 %cmp, label %do.body.preheader, label %if.end

do.body.preheader:                                ; preds = %for.cond
  %tmp = add i32 %0, 1
  %tmp31 = add i32 %tmp, %tmp615
  %tmp32 = sub i32 0, %0
  %tmp33 = icmp sgt i32 %tmp32, -3
  %smax = select i1 %tmp33, i32 %tmp32, i32 -3
  %tmp34 = add i32 %tmp31, %smax
  %tmp35 = xor i32 %smax, -1
  br label %if.end

if.end:                                           ; preds = %do.body.preheader, %for.cond
  %1 = phi i32 [ %0, %for.cond ], [ %tmp35, %do.body.preheader ]
  %tmp6112 = phi i32 [ %tmp615, %for.cond ], [ %tmp34, %do.body.preheader ]
  %cmp6 = icmp eq i32 %1, 1
  br i1 %cmp6, label %for.end, label %while.cond.preheader

while.cond.preheader:                             ; preds = %if.end
  %cmp1114 = icmp sgt i32 %tmp6112, %inc544
  br i1 %cmp1114, label %while.body.lr.ph, label %do.body19.loopexit

while.body.lr.ph:                                 ; preds = %while.cond.preheader
  %cmp14 = icmp eq i32 %1, %inc544
  %tmp41 = zext i1 %cmp14 to i32
  %tmp44 = add i32 %tmp6112, %tmp41
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %indvar = phi i32 [ 0, %while.body.lr.ph ], [ %indvar.next, %while.body ]
  %tmp58 = sext i1 %cmp14 to i32
  %tmp43 = and i32 %indvar, %tmp58
  %inc17.tmp6111 = add i32 %tmp44, %tmp43
  %cmp11 = icmp sgt i32 %inc17.tmp6111, %inc544
  %indvar.next = add i32 %indvar, 1
  br i1 %cmp11, label %while.body, label %do.body19.loopexit

do.body19.loopexit:                               ; preds = %while.body, %while.cond.preheader
  %tmp6111.lcssa = phi i32 [ %tmp6112, %while.cond.preheader ], [ %inc17.tmp6111, %while.body ]
  %idxprom = sext i32 %tmp481 to i64
  %arrayidx = getelementptr inbounds [1 x i32]* @W, i64 0, i64 %idxprom
  %cmp32 = icmp slt i32 %inc544, 1
  %cmp36 = icmp sgt i32 %tmp481, 0
  %arrayidx.promoted = load i32* %arrayidx, align 4
  br label %do.body19

do.body19:                                        ; preds = %do.body19.loopexit, %do.body22
  %2 = phi i32 [ 0, %do.body22 ], [ %arrayidx.promoted, %do.body19.loopexit ]
  %tmp6110 = phi i32 [ %tmp618, %do.body22 ], [ %tmp6111.lcssa, %do.body19.loopexit ]
  br i1 %cmp32, label %do.body22.us, label %do.body22

do.body22.us:                                     ; preds = %do.body22.us, %do.body19
  br label %do.body22.us

do.body22:                                        ; preds = %do.body19
  %phitmp = icmp eq i32 %2, 0
  %tmp618 = select i1 %phitmp, i32 %tmp6110, i32 1
  br i1 %cmp36, label %do.body19, label %do.body38.loopexit

do.body38.loopexit:                               ; preds = %do.body22
  store i32 0, i32* %arrayidx, align 4
  br label %do.body38

do.body38:                                        ; preds = %do.body38.loopexit, %do.cond57
  %tmp617 = phi i32 [ %tmp616.ph, %do.cond57 ], [ %tmp618, %do.body38.loopexit ]
  %tmp482 = phi i32 [ %tmp42, %do.cond57 ], [ %tmp481, %do.body38.loopexit ]
  %idxprom40 = sext i32 %tmp482 to i64
  %arrayidx41 = getelementptr inbounds [1 x i32]* @Link, i64 0, i64 %idxprom40
  %tmp42 = load i32* %arrayidx41, align 4
  %cmp49 = icmp eq i32 %tmp42, -1
  br label %while.cond43.outer

while.cond43.outer:                               ; preds = %do.body38, %if.then50
  %3 = phi i32 [ %inc54, %if.then50 ], [ 0, %do.body38 ]
  %tmp616.ph = add i32 %tmp617, %3
  %cmp46 = icmp slt i32 %3, %1
  br i1 %cmp46, label %while.cond43.outer.split.us, label %do.cond57

while.cond43.outer.split.us:                      ; preds = %while.cond43.outer
  br i1 %cmp49, label %while.body47.us.us, label %if.then50

while.body47.us.us:                               ; preds = %while.body47.us.us, %while.cond43.outer.split.us
  br label %while.body47.us.us

if.then50:                                        ; preds = %while.cond43.outer.split.us
  %inc54 = add nsw i32 %3, 1
  br label %while.cond43.outer

do.cond57:                                        ; preds = %while.cond43.outer
  br i1 %cmp49, label %for.cond, label %do.body38

for.end:                                          ; preds = %if.end
  ret i32 %tmp6112
}

define i32 @main() nounwind uwtable {
entry:
  %call = tail call i32 @f(i32 0, i32 2)
  %tobool = icmp eq i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
