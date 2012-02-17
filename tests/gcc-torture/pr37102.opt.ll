; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr37102.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@b = global i32 1, align 4
@c = common global i32 0, align 4
@a = common global i32 0, align 4

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

define void @foo(i32 %x) nounwind uwtable noinline {
entry:
  %cmp = icmp eq i32 %x, 5
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %tmp1 = load i32* @c, align 4
  %tobool = icmp eq i32 %tmp1, 0
  %tmp2 = load i32* @b, align 4
  br i1 %tobool, label %for.end, label %for.inc.3

for.end:                                          ; preds = %entry, %for.inc.3
  store i32 %tmp2, i32* @a, align 4
  %shl.mask = and i32 %tmp2, 2147483647
  %tobool7 = icmp eq i32 %shl.mask, 0
  br i1 %tobool7, label %if.end11, label %if.then8

if.then8:                                         ; preds = %for.end
  %shl10 = shl i32 %tmp2, 2
  %xor1 = or i32 %shl10, 1
  br label %if.end11

if.end11:                                         ; preds = %for.end, %if.then8
  %tmp122 = phi i32 [ 0, %for.end ], [ %xor1, %if.then8 ]
  tail call void @foo(i32 %tmp122)
  ret i32 0

for.inc.3:                                        ; preds = %entry
  store i32 %tmp2, i32* @a, align 4
  br label %for.end
}
