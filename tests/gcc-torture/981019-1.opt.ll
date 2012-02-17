; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/981019-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@f3.x = internal unnamed_addr global i32 0, align 4

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

define void @ff(i32 %fname, i32 %part, i32 %nparts) nounwind uwtable {
entry:
  %tobool = icmp eq i32 %fname, 0
  %tobool2 = icmp eq i32 %nparts, 0
  %or.cond = or i1 %tobool, %tobool2
  br i1 %or.cond, label %while.cond.preheader, label %if.then3

while.cond.preheader:                             ; preds = %entry
  %f3.x.promoted = load i32* @f3.x, align 4
  br i1 %tobool2, label %while.cond.us, label %while.cond

while.cond.us:                                    ; preds = %while.cond.us, %while.cond.preheader
  %lnot.ext.i2.us = phi i32 [ %f3.x.promoted, %while.cond.preheader ], [ %lnot.ext.i.us, %while.cond.us ]
  %lnot.i.us = icmp eq i32 %lnot.ext.i2.us, 0
  %lnot.ext.i.us = zext i1 %lnot.i.us to i32
  br i1 %lnot.i.us, label %while.cond.us, label %while.end

if.then3:                                         ; preds = %entry
  tail call void @f1()
  unreachable

while.cond:                                       ; preds = %while.cond.preheader
  %lnot.i = icmp eq i32 %f3.x.promoted, 0
  %lnot.ext.i = zext i1 %lnot.i to i32
  store i32 %lnot.ext.i, i32* @f3.x, align 4
  br i1 %lnot.i, label %land.lhs.true, label %if.then19

land.lhs.true:                                    ; preds = %while.cond
  %call8 = tail call i32 @f2()
  unreachable

while.end:                                        ; preds = %while.cond.us
  store i32 %lnot.ext.i.us, i32* @f3.x, align 4
  br i1 %tobool2, label %if.end20, label %if.then19

if.then19:                                        ; preds = %while.cond, %while.end
  tail call void @f1()
  unreachable

if.end20:                                         ; preds = %while.end
  ret void
}

define void @f1() noreturn nounwind uwtable {
entry:
  tail call void @abort() noreturn nounwind
  unreachable
}

define i32 @f3() nounwind uwtable {
entry:
  %tmp = load i32* @f3.x, align 4
  %lnot = icmp eq i32 %tmp, 0
  %lnot.ext = zext i1 %lnot to i32
  store i32 %lnot.ext, i32* @f3.x, align 4
  ret i32 %lnot.ext
}

define i32 @f2() noreturn nounwind uwtable {
entry:
  tail call void @abort() noreturn nounwind
  unreachable
}

define i32 @main() nounwind uwtable {
entry:
  %f3.x.promoted.i = load i32* @f3.x, align 4
  br label %while.cond.us.i

while.cond.us.i:                                  ; preds = %while.cond.us.i, %entry
  %lnot.ext.i2.us.i = phi i32 [ %f3.x.promoted.i, %entry ], [ %lnot.ext.i.us.i, %while.cond.us.i ]
  %lnot.i.us.i = icmp eq i32 %lnot.ext.i2.us.i, 0
  %lnot.ext.i.us.i = zext i1 %lnot.i.us.i to i32
  br i1 %lnot.i.us.i, label %while.cond.us.i, label %ff.exit

ff.exit:                                          ; preds = %while.cond.us.i
  store i32 %lnot.ext.i.us.i, i32* @f3.x, align 4
  ret i32 0
}

declare void @abort() noreturn nounwind
