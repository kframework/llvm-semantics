; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20000717-5.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.trio = type { i32, i32, i32 }

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

define i32 @bar(i32 %i, i32 %j, i32 %k, i64 %t.coerce0, i32 %t.coerce1) nounwind uwtable {
entry:
  %0 = icmp eq i64 %t.coerce0, 8589934593
  br i1 %0, label %lor.lhs.false3, label %if.then

lor.lhs.false3:                                   ; preds = %entry
  %cmp5 = icmp eq i32 %t.coerce1, 3
  %cmp8 = icmp eq i32 %i, 4
  %or.cond = and i1 %cmp5, %cmp8
  %cmp11 = icmp eq i32 %j, 5
  %or.cond16 = and i1 %or.cond, %cmp11
  %cmp14 = icmp eq i32 %k, 6
  %or.cond17 = and i1 %or.cond16, %cmp14
  br i1 %or.cond17, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false3, %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false3
  ret i32 0
}

declare void @abort() noreturn nounwind

define i32 @foo(i64 %t.coerce0, i32 %t.coerce1, i32 %i, i32 %j, i32 %k) nounwind uwtable {
entry:
  %0 = icmp eq i64 %t.coerce0, 8589934593
  br i1 %0, label %lor.lhs.false3.i, label %if.then.i

lor.lhs.false3.i:                                 ; preds = %entry
  %cmp5.i = icmp eq i32 %t.coerce1, 3
  %cmp8.i = icmp eq i32 %i, 4
  %or.cond.i = and i1 %cmp5.i, %cmp8.i
  %cmp11.i = icmp eq i32 %j, 5
  %or.cond16.i = and i1 %or.cond.i, %cmp11.i
  %cmp14.i = icmp eq i32 %k, 6
  %or.cond17.i = and i1 %or.cond16.i, %cmp14.i
  br i1 %or.cond17.i, label %bar.exit, label %if.then.i

if.then.i:                                        ; preds = %lor.lhs.false3.i, %entry
  tail call void @abort() noreturn nounwind
  unreachable

bar.exit:                                         ; preds = %lor.lhs.false3.i
  ret i32 0
}

define i32 @main() noreturn nounwind uwtable {
foo.exit:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
