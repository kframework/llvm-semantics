; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/950607-2.ll'
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

define i32 @f(i64 %basePt.coerce0, i64 %basePt.coerce1, i64 %pt1.coerce0, i64 %pt1.coerce1, i64 %pt2.coerce0, i64 %pt2.coerce1) nounwind uwtable readnone {
entry:
  %sub = sub nsw i64 %pt1.coerce0, %basePt.coerce0
  %sub6 = sub nsw i64 %pt2.coerce1, %basePt.coerce1
  %mul = mul nsw i64 %sub6, %sub
  %sub11 = sub nsw i64 %pt1.coerce1, %basePt.coerce1
  %sub16 = sub nsw i64 %pt2.coerce0, %basePt.coerce0
  %mul17 = mul nsw i64 %sub16, %sub11
  %sub18 = sub nsw i64 %mul, %mul17
  %cmp = icmp sgt i64 %sub18, 0
  br i1 %cmp, label %return, label %if.else

if.else:                                          ; preds = %entry
  %cmp21 = icmp slt i64 %sub18, 0
  br i1 %cmp21, label %return, label %if.else23

if.else23:                                        ; preds = %if.else
  br label %return

return:                                           ; preds = %if.else, %entry, %if.else23
  %0 = phi i32 [ 2, %if.else23 ], [ 0, %entry ], [ 1, %if.else ]
  ret i32 %0
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
