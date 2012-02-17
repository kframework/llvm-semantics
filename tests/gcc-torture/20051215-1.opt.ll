; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20051215-1.ll'
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

define i32 @foo(i32 %x, i32 %y, i32* %z) nounwind uwtable readonly noinline {
entry:
  %cmp10 = icmp sgt i32 %y, 0
  br i1 %cmp10, label %for.body.lr.ph, label %for.end17

for.body.lr.ph:                                   ; preds = %entry
  %tobool = icmp eq i32* %z, null
  %cmp96 = icmp sgt i32 %x, 0
  br i1 %tobool, label %for.body.lr.ph.split.us, label %for.body.lr.ph.for.body.lr.ph.split_crit_edge

for.body.lr.ph.for.body.lr.ph.split_crit_edge:    ; preds = %for.body.lr.ph
  br i1 %cmp96, label %for.inc14.us19, label %for.inc14

for.body.lr.ph.split.us:                          ; preds = %for.body.lr.ph
  br i1 %cmp96, label %for.inc14.us.us, label %for.inc14.us

for.inc14.us.us:                                  ; preds = %for.inc14.us.us, %for.body.lr.ph.split.us
  %storemerge13.us.us = phi i32 [ %0, %for.inc14.us.us ], [ 0, %for.body.lr.ph.split.us ]
  %0 = add nsw i32 %storemerge13.us.us, 1
  %exitcond = icmp eq i32 %0, %y
  br i1 %exitcond, label %for.end17, label %for.inc14.us.us

for.inc14.us:                                     ; preds = %for.body.lr.ph.split.us, %for.inc14.us
  %storemerge13.us = phi i32 [ %1, %for.inc14.us ], [ 0, %for.body.lr.ph.split.us ]
  %1 = add nsw i32 %storemerge13.us, 1
  %exitcond46 = icmp eq i32 %1, %y
  br i1 %exitcond46, label %for.end17, label %for.inc14.us

for.inc14.us19:                                   ; preds = %for.body.lr.ph.for.body.lr.ph.split_crit_edge, %for.inc14.us19
  %tmp18312.us17 = phi i32 [ %tmp41, %for.inc14.us19 ], [ 0, %for.body.lr.ph.for.body.lr.ph.split_crit_edge ]
  %2 = phi i32 [ %3, %for.inc14.us19 ], [ 0, %for.body.lr.ph.for.body.lr.ph.split_crit_edge ]
  %tmp5.us30 = load i32* %z, align 4
  %mul.us31 = mul nsw i32 %tmp5.us30, %2
  %tmp40 = mul i32 %mul.us31, %x
  %tmp41 = add i32 %tmp18312.us17, %tmp40
  %3 = add nsw i32 %2, 1
  %exitcond44 = icmp eq i32 %3, %y
  br i1 %exitcond44, label %for.end17, label %for.inc14.us19

for.inc14:                                        ; preds = %for.inc14, %for.body.lr.ph.for.body.lr.ph.split_crit_edge
  %storemerge13 = phi i32 [ %4, %for.inc14 ], [ 0, %for.body.lr.ph.for.body.lr.ph.split_crit_edge ]
  %4 = add nsw i32 %storemerge13, 1
  %exitcond48 = icmp eq i32 %4, %y
  br i1 %exitcond48, label %for.end17, label %for.inc14

for.end17:                                        ; preds = %for.inc14.us, %for.inc14.us.us, %for.inc14, %for.inc14.us19, %entry
  %tmp183.lcssa = phi i32 [ 0, %entry ], [ 0, %for.inc14.us ], [ 0, %for.inc14.us.us ], [ %tmp41, %for.inc14.us19 ], [ 0, %for.inc14 ]
  ret i32 %tmp183.lcssa
}

define i32 @main() nounwind uwtable {
entry:
  %call = tail call i32 @foo(i32 3, i32 2, i32* null)
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
