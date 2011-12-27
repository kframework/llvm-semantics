; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20060930-1.ll'
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

define i32 @bar(i32 %a, i32 %b) nounwind uwtable noinline {
entry:
  %cmp = icmp eq i32 %b, 1
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind

define void @foo(i32 %e, i32 %n) nounwind uwtable noinline {
entry:
  %sub = sub nsw i32 0, %e
  %cmp = icmp sgt i32 %e, 0
  %sub.e = select i1 %cmp, i32 %sub, i32 %e
  %cmp43 = icmp sgt i32 %n, 0
  br i1 %cmp43, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %sub9 = sub nsw i32 0, %sub.e
  %cmp6 = icmp sgt i32 %sub.e, -1
  %.sub9 = select i1 %cmp6, i32 0, i32 %sub9
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %storemerge4 = phi i32 [ 0, %for.body.lr.ph ], [ %0, %for.body ]
  %call = tail call i32 @bar(i32 %.sub9, i32 %.sub9)
  %0 = add nsw i32 %storemerge4, 1
  %exitcond = icmp eq i32 %0, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  tail call void @foo(i32 1, i32 1)
  ret i32 0
}
