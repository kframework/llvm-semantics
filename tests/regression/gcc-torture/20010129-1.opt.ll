; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20010129-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@baz1.l = internal unnamed_addr global i64 0, align 8
@bar = common global i8** null, align 8

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

define i64 @baz1(i8* nocapture %a) nounwind uwtable {
entry:
  %tmp = load i64* @baz1.l, align 8
  %inc = add nsw i64 %tmp, 1
  store i64 %inc, i64* @baz1.l, align 8
  ret i64 %tmp
}

define i32 @baz2(i8* nocapture %a) nounwind uwtable readnone {
entry:
  ret i32 0
}

define i32 @baz3(i32 %i) nounwind uwtable {
entry:
  %tobool = icmp eq i32 %i, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 1
}

declare void @abort() noreturn nounwind

define i32 @foo(i8* %a, i64 %b, i32 %c) nounwind uwtable {
entry:
  %g = alloca [256 x i8], align 16
  %arrayidx = getelementptr inbounds [256 x i8]* %g, i64 0, i64 0
  store i8 10, i8* %arrayidx, align 16
  %arrayidx1 = getelementptr inbounds [256 x i8]* %g, i64 0, i64 1
  store i8 0, i8* %arrayidx1, align 1
  %and = and i32 %c, 16
  %cmp19 = icmp eq i32 %and, 0
  %0 = and i32 %c, 16400
  %1 = icmp eq i32 %0, 16400
  %2 = and i32 %c, 13962
  %3 = icmp ne i32 %2, 128
  %.old16 = load i8*** @bar, align 8
  %tobool75.old = icmp eq i8** %.old16, null
  %or.cond19 = or i1 %3, %tobool75.old
  %4 = and i32 %c, 13960
  %5 = icmp ne i32 %4, 128
  %or.cond17 = or i1 %5, %tobool75.old
  %baz1.l.promoted22 = load i64* @baz1.l, align 8
  br label %while.cond

while.cond:                                       ; preds = %entry, %land.lhs.true33, %land.lhs.true13, %if.end38
  %inc.i.lcssa2123 = phi i64 [ %baz1.l.promoted22, %entry ], [ %inc.i, %land.lhs.true33 ], [ %inc.i, %land.lhs.true13 ], [ %inc.i, %if.end38 ]
  %.ph = phi i32 [ 0, %entry ], [ %6, %land.lhs.true33 ], [ 0, %land.lhs.true13 ], [ 1, %if.end38 ]
  %inc.i = add i64 %inc.i.lcssa2123, 1
  %cmp = icmp slt i64 %inc.i.lcssa2123, %b
  br i1 %cmp, label %if.then, label %while.end

if.then:                                          ; preds = %while.cond
  %tobool = icmp eq i32 %.ph, 0
  br i1 %tobool, label %land.lhs.true13, label %land.lhs.true33

land.lhs.true13:                                  ; preds = %if.then
  br i1 %cmp19, label %while.cond, label %if.end22

if.end22:                                         ; preds = %land.lhs.true13
  br i1 %1, label %if.end38, label %land.lhs.true33

land.lhs.true33:                                  ; preds = %if.end22, %if.then
  %6 = phi i32 [ 1, %if.end22 ], [ %.ph, %if.then ]
  br i1 %or.cond19, label %while.cond, label %if.then.i

if.end38:                                         ; preds = %if.end22
  br i1 %or.cond17, label %while.cond, label %if.then.i

if.then.i:                                        ; preds = %land.lhs.true33, %if.end38
  store i64 %inc.i, i64* @baz1.l, align 8
  call void @abort() noreturn nounwind
  unreachable

while.end:                                        ; preds = %while.cond
  store i64 %inc.i, i64* @baz1.l, align 8
  ret i32 0
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %g.i = alloca [256 x i8], align 16
  %n = alloca i8*, align 8
  store i8* null, i8** %n, align 8
  store i8** %n, i8*** @bar, align 8
  %0 = getelementptr inbounds [256 x i8]* %g.i, i64 0, i64 0
  call void @llvm.lifetime.start(i64 -1, i8* %0) nounwind
  store i8 10, i8* %0, align 16
  %arrayidx1.i = getelementptr inbounds [256 x i8]* %g.i, i64 0, i64 1
  store i8 0, i8* %arrayidx1.i, align 1
  %baz1.l.promoted22.i = load i64* @baz1.l, align 8
  br label %while.cond.i.outer

while.cond.i.outer:                               ; preds = %while.cond.i.us, %entry
  %inc.i.lcssa2123.i.ph = phi i64 [ %baz1.l.promoted22.i, %entry ], [ %tmp, %while.cond.i.us ]
  %.ph.i.ph = phi i1 [ true, %entry ], [ false, %while.cond.i.us ]
  %tmp = add i64 %inc.i.lcssa2123.i.ph, 1
  br i1 %.ph.i.ph, label %while.cond.i.us, label %while.cond.i

while.cond.i.us:                                  ; preds = %while.cond.i.outer
  %cmp.i.us = icmp slt i64 %inc.i.lcssa2123.i.ph, 1
  br i1 %cmp.i.us, label %while.cond.i.outer, label %foo.exit

while.cond.i:                                     ; preds = %while.cond.i.outer, %land.lhs.true33.i
  %indvar6 = phi i64 [ %indvar.next7, %land.lhs.true33.i ], [ 0, %while.cond.i.outer ]
  %inc.i.lcssa2123.i = add i64 %inc.i.lcssa2123.i.ph, %indvar6
  %cmp.i = icmp slt i64 %inc.i.lcssa2123.i, 1
  br i1 %cmp.i, label %land.lhs.true33.i, label %foo.exit.us-lcssa

land.lhs.true33.i:                                ; preds = %while.cond.i
  %indvar.next7 = add i64 %indvar6, 1
  br label %while.cond.i

foo.exit.us-lcssa:                                ; preds = %while.cond.i
  %inc.i.i = add i64 %tmp, %indvar6
  br label %foo.exit

foo.exit:                                         ; preds = %while.cond.i.us, %foo.exit.us-lcssa
  %inc.i.i.lcssa = phi i64 [ %inc.i.i, %foo.exit.us-lcssa ], [ %tmp, %while.cond.i.us ]
  store i64 %inc.i.i.lcssa, i64* @baz1.l, align 8
  call void @llvm.lifetime.end(i64 -1, i8* %0) nounwind
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
