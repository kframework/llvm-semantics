; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/950612-1.ll'
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

define i32 @f1(i32 %diff) nounwind uwtable readnone {
entry:
  %cmp = icmp slt i32 %diff, 0
  %sub = sub nsw i32 0, %diff
  %cond = select i1 %cmp, i32 %sub, i32 %diff
  ret i32 %cond
}

define i32 @f2(i32 %diff) nounwind uwtable readnone {
entry:
  %cmp = icmp slt i32 %diff, 0
  %sub = sub i32 0, %diff
  %cond = select i1 %cmp, i32 %sub, i32 %diff
  ret i32 %cond
}

define i64 @f3(i64 %diff) nounwind uwtable readnone {
entry:
  %cmp = icmp slt i64 %diff, 0
  %sub = sub nsw i64 0, %diff
  %cond = select i1 %cmp, i64 %sub, i64 %diff
  ret i64 %cond
}

define i64 @f4(i64 %diff) nounwind uwtable readnone {
entry:
  %cmp = icmp slt i64 %diff, 0
  %sub = sub i64 0, %diff
  %cond = select i1 %cmp, i64 %sub, i64 %diff
  ret i64 %cond
}

define i32 @main() noreturn nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %conv = phi i64 [ %indvar.next, %for.inc ], [ 0, %entry ]
  %storemerge = trunc i64 %conv to i32
  %sub.i11 = sub i64 0, %conv
  %cmp = icmp slt i32 %storemerge, 11
  br i1 %cmp, label %if.end, label %for.end

if.end:                                           ; preds = %for.cond
  %sub.i17 = trunc i64 %sub.i11 to i32
  %cmp.i19 = icmp sgt i32 %storemerge, 0
  %cond.i21 = select i1 %cmp.i19, i32 %storemerge, i32 %sub.i17
  %cmp7 = icmp eq i32 %cond.i21, %storemerge
  br i1 %cmp7, label %if.end30, label %if.then8

if.then8:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end30:                                         ; preds = %if.end
  %cond.i9 = select i1 %cmp.i19, i64 %conv, i64 %sub.i11
  %cmp37 = icmp eq i64 %cond.i9, %conv
  br i1 %cmp37, label %for.inc, label %if.then39

if.then39:                                        ; preds = %if.end30
  tail call void @abort() noreturn nounwind
  unreachable

for.inc:                                          ; preds = %if.end30
  %indvar.next = add i64 %conv, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
