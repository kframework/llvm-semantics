; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20000224-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@loop_1 = global i32 100, align 4
@loop_2 = global i32 7, align 4
@flag = global i32 0, align 4

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

define i32 @test() nounwind uwtable {
entry:
  %tmp8 = load i32* @loop_1, align 4
  %cmp9 = icmp sgt i32 %tmp8, 0
  br i1 %cmp9, label %while.body.lr.ph, label %while.end

while.body.lr.ph:                                 ; preds = %entry
  %tmp44 = load i32* @loop_2, align 4
  %cmp55 = icmp sgt i32 %tmp44, 0
  %flag.promoted = load i32* @flag, align 4
  br i1 %cmp55, label %while.body.lr.ph.split.us, label %if.end

while.body.lr.ph.split.us:                        ; preds = %while.body.lr.ph
  %tmp14 = add i32 %flag.promoted, 1
  br label %while.body.us

while.body.us:                                    ; preds = %while.body.us, %while.body.lr.ph.split.us
  %indvar = phi i32 [ %indvar.next, %while.body.us ], [ 0, %while.body.lr.ph.split.us ]
  %inc110.us = phi i32 [ %inc2.us, %while.body.us ], [ 0, %while.body.lr.ph.split.us ]
  %inc1011.us = add i32 %flag.promoted, %indvar
  %and.us = and i32 %inc1011.us, 1
  %tobool.us = icmp eq i32 %and.us, 0
  %tmp12 = select i1 %tobool.us, i32 0, i32 %tmp44
  %inc2.us = add i32 %inc110.us, %tmp12
  %cmp.us = icmp sgt i32 %tmp8, %inc2.us
  %indvar.next = add i32 %indvar, 1
  br i1 %cmp.us, label %while.body.us, label %while.cond.while.end_crit_edge

if.end:                                           ; preds = %if.end, %while.body.lr.ph
  br label %if.end

while.cond.while.end_crit_edge:                   ; preds = %while.body.us
  %inc10.us = add i32 %tmp14, %indvar
  store i32 %inc10.us, i32* @flag, align 4
  br label %while.end

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %entry
  ret i32 1
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %tmp8.i = load i32* @loop_1, align 4
  %cmp9.i = icmp sgt i32 %tmp8.i, 0
  br i1 %cmp9.i, label %while.body.lr.ph.i, label %test.exit

while.body.lr.ph.i:                               ; preds = %entry
  %tmp44.i = load i32* @loop_2, align 4
  %cmp55.i = icmp sgt i32 %tmp44.i, 0
  %flag.promoted.i = load i32* @flag, align 4
  br i1 %cmp55.i, label %while.body.us.i, label %if.end.i

while.body.us.i:                                  ; preds = %while.body.lr.ph.i, %while.body.us.i
  %0 = phi i32 [ %indvar.next.i, %while.body.us.i ], [ 0, %while.body.lr.ph.i ]
  %inc110.us.i = phi i32 [ %inc2.us.i, %while.body.us.i ], [ 0, %while.body.lr.ph.i ]
  %inc1011.us.i = add i32 %flag.promoted.i, %0
  %and.us.i = and i32 %inc1011.us.i, 1
  %tobool.us.i = icmp eq i32 %and.us.i, 0
  %tmp12.i = select i1 %tobool.us.i, i32 0, i32 %tmp44.i
  %inc2.us.i = add i32 %tmp12.i, %inc110.us.i
  %cmp.us.i = icmp sgt i32 %tmp8.i, %inc2.us.i
  %indvar.next.i = add i32 %0, 1
  br i1 %cmp.us.i, label %while.body.us.i, label %while.cond.while.end_crit_edge.i

if.end.i:                                         ; preds = %while.body.lr.ph.i, %if.end.i
  br label %if.end.i

while.cond.while.end_crit_edge.i:                 ; preds = %while.body.us.i
  %tmp14.i = add i32 %flag.promoted.i, 1
  %inc10.us.i = add i32 %tmp14.i, %0
  store i32 %inc10.us.i, i32* @flag, align 4
  br label %test.exit

test.exit:                                        ; preds = %entry, %while.cond.while.end_crit_edge.i
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
