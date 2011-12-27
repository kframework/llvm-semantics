; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20000808-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.Point = type { i64, i64 }

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

define void @bar() nounwind uwtable readnone {
entry:
  ret void
}

define void @f(i64 %p0.coerce0, i64 %p0.coerce1, i64 %p1.coerce0, i64 %p1.coerce1, i64 %p2.coerce0, i64 %p2.coerce1, %struct.Point* nocapture byval align 8 %p3, %struct.Point* nocapture byval align 8 %p4, %struct.Point* nocapture byval align 8 %p5) nounwind uwtable {
entry:
  %cmp = icmp eq i64 %p0.coerce0, 0
  %cmp2 = icmp eq i64 %p0.coerce1, 1
  %or.cond = and i1 %cmp, %cmp2
  %cmp6 = icmp eq i64 %p1.coerce0, -1
  %or.cond1 = and i1 %or.cond, %cmp6
  %cmp10 = icmp eq i64 %p1.coerce1, 0
  %or.cond2 = and i1 %or.cond1, %cmp10
  %cmp14 = icmp eq i64 %p2.coerce0, 1
  %or.cond3 = and i1 %or.cond2, %cmp14
  %cmp18 = icmp eq i64 %p2.coerce1, -1
  %or.cond4 = and i1 %or.cond3, %cmp18
  br i1 %or.cond4, label %lor.lhs.false19, label %if.then

lor.lhs.false19:                                  ; preds = %entry
  %p_x20 = getelementptr inbounds %struct.Point* %p3, i64 0, i32 0
  %tmp21 = load i64* %p_x20, align 8
  %cmp22 = icmp eq i64 %tmp21, -1
  br i1 %cmp22, label %lor.lhs.false23, label %if.then

lor.lhs.false23:                                  ; preds = %lor.lhs.false19
  %p_y24 = getelementptr inbounds %struct.Point* %p3, i64 0, i32 1
  %tmp25 = load i64* %p_y24, align 8
  %cmp26 = icmp eq i64 %tmp25, 1
  br i1 %cmp26, label %lor.lhs.false27, label %if.then

lor.lhs.false27:                                  ; preds = %lor.lhs.false23
  %p_x28 = getelementptr inbounds %struct.Point* %p4, i64 0, i32 0
  %tmp29 = load i64* %p_x28, align 8
  %cmp30 = icmp eq i64 %tmp29, 0
  br i1 %cmp30, label %lor.lhs.false31, label %if.then

lor.lhs.false31:                                  ; preds = %lor.lhs.false27
  %p_y32 = getelementptr inbounds %struct.Point* %p4, i64 0, i32 1
  %tmp33 = load i64* %p_y32, align 8
  %cmp34 = icmp eq i64 %tmp33, -1
  br i1 %cmp34, label %lor.lhs.false35, label %if.then

lor.lhs.false35:                                  ; preds = %lor.lhs.false31
  %p_x36 = getelementptr inbounds %struct.Point* %p5, i64 0, i32 0
  %tmp37 = load i64* %p_x36, align 8
  %cmp38 = icmp eq i64 %tmp37, 1
  br i1 %cmp38, label %lor.lhs.false39, label %if.then

lor.lhs.false39:                                  ; preds = %lor.lhs.false35
  %p_y40 = getelementptr inbounds %struct.Point* %p5, i64 0, i32 1
  %tmp41 = load i64* %p_y40, align 8
  %cmp42 = icmp eq i64 %tmp41, 0
  br i1 %cmp42, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false39, %lor.lhs.false35, %lor.lhs.false31, %lor.lhs.false27, %lor.lhs.false23, %lor.lhs.false19, %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false39
  ret void
}

declare void @abort() noreturn nounwind

define void @foo() nounwind uwtable {
f.exit:
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
