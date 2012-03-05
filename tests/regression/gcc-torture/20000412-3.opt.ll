; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20000412-3.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.X = type { i8, [32 x i8] }

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

define i32 @z() nounwind uwtable readnone {
f.exit:
  ret i32 96
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

define i32 @f(%struct.X* nocapture byval align 8 %x, %struct.X* nocapture byval align 8 %y) nounwind uwtable readonly {
entry:
  %0 = bitcast %struct.X* %x to i16*
  %tmp = load i16* %0, align 8
  %1 = trunc i16 %tmp to i8
  %2 = bitcast %struct.X* %y to i16*
  %tmp3 = load i16* %2, align 8
  %3 = trunc i16 %tmp3 to i8
  %cmp = icmp eq i8 %1, %3
  br i1 %cmp, label %if.end, label %return

if.end:                                           ; preds = %entry
  %tmp4 = lshr i16 %tmp3, 8
  %tmp1 = lshr i16 %tmp, 8
  %tmp5 = zext i16 %tmp4 to i32
  %tmp2 = zext i16 %tmp1 to i32
  %sext = shl nuw i32 %tmp2, 24
  %conv8 = ashr exact i32 %sext, 24
  %sext6 = shl nuw i32 %tmp5, 24
  %conv12 = ashr exact i32 %sext6, 24
  %add = add nsw i32 %conv12, %conv8
  br label %return

return:                                           ; preds = %entry, %if.end
  %storemerge = phi i32 [ %add, %if.end ], [ 70, %entry ]
  ret i32 %storemerge
}
