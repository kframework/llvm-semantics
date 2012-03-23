; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20061101-1.ll'
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

define i32 @tar(i32 %i) nounwind uwtable {
entry:
  %cmp = icmp eq i32 %i, 36863
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 -1
}

declare void @abort() noreturn nounwind

define void @bug(i32 %q, i32 %bcount) nounwind uwtable {
entry:
  %sub = add nsw i32 %q, -1
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %tmp72 = phi i32 [ 0, %entry ], [ %tmp71, %while.body ]
  %0 = phi i1 [ false, %entry ], [ true, %while.body ]
  br i1 %0, label %while.end, label %while.body

while.body:                                       ; preds = %while.cond
  %inc = add nsw i32 %tmp72, 1
  %cmp4 = icmp sgt i32 %inc, %sub
  %tmp71 = select i1 %cmp4, i32 %sub, i32 %inc
  %mul = mul nsw i32 %tmp71, %bcount
  %cmp.i = icmp eq i32 %mul, 36863
  br i1 %cmp.i, label %while.cond, label %if.then.i

if.then.i:                                        ; preds = %while.body
  tail call void @abort() noreturn nounwind
  unreachable

while.end:                                        ; preds = %while.cond
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  br label %while.cond.i

while.cond.i:                                     ; preds = %while.body.i, %entry
  %tmp72.i = phi i32 [ 0, %entry ], [ %tmp71.i, %while.body.i ]
  %0 = phi i1 [ false, %entry ], [ true, %while.body.i ]
  br i1 %0, label %bug.exit, label %while.body.i

while.body.i:                                     ; preds = %while.cond.i
  %inc.i = add nsw i32 %tmp72.i, 1
  %cmp4.i = icmp sgt i32 %inc.i, 4
  %tmp71.i = select i1 %cmp4.i, i32 4, i32 %inc.i
  %mul.i = mul nsw i32 %tmp71.i, 36863
  %cmp.i.i = icmp eq i32 %mul.i, 36863
  br i1 %cmp.i.i, label %while.cond.i, label %if.then.i.i

if.then.i.i:                                      ; preds = %while.body.i
  tail call void @abort() noreturn nounwind
  unreachable

bug.exit:                                         ; preds = %while.cond.i
  ret i32 0
}
