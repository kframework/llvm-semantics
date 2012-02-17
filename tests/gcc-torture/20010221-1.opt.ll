; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20010221-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@n = global i32 2, align 4

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

define i32 @main() noreturn nounwind uwtable {
entry:
  %tmp13 = load i32* @n, align 4
  %cmp4 = icmp sgt i32 %tmp13, 0
  br i1 %cmp4, label %for.body.lr.ph, label %if.then10

for.body.lr.ph:                                   ; preds = %entry
  %tmp = icmp sgt i32 %tmp13, 1
  %smax = select i1 %tmp, i32 %tmp13, i32 1
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %0 = phi i32 [ 0, %for.body.lr.ph ], [ %1, %for.body ]
  %tmp825 = phi i32 [ 45, %for.body.lr.ph ], [ %tmp81, %for.body ]
  %cmp3 = icmp eq i32 %0, 0
  %tmp81 = select i1 %cmp3, i32 %tmp825, i32 %0
  %1 = add nsw i32 %0, 1
  %exitcond = icmp eq i32 %1, %smax
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  %cmp9 = icmp eq i32 %tmp81, 1
  br i1 %cmp9, label %if.end11, label %if.then10

if.then10:                                        ; preds = %entry, %for.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end11:                                         ; preds = %for.end
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
