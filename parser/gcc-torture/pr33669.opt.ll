; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr33669.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.foo_t = type { i32, i32 }

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

define i64 @foo(%struct.foo_t* %pxp, i64 %offset, i32 %extent) nounwind uwtable {
entry:
  %blksz = getelementptr inbounds %struct.foo_t* %pxp, i64 0, i32 0
  %tmp3 = load i32* %blksz, align 4
  %conv = zext i32 %tmp3 to i64
  %rem = srem i64 %offset, %conv
  %sub = sub nsw i64 %offset, %rem
  %conv8 = trunc i64 %rem to i32
  %add = add i32 %extent, -1
  %add15 = add i32 %add, %tmp3
  %sub16 = add i32 %add15, %conv8
  %div = urem i32 %sub16, %tmp3
  %mul = sub i32 %sub16, %div
  %cmp = icmp ult i32 %tmp3, %mul
  br i1 %cmp, label %return, label %if.end

if.end:                                           ; preds = %entry
  %bf_cnt = getelementptr inbounds %struct.foo_t* %pxp, i64 0, i32 1
  %tmp29 = load i32* %bf_cnt, align 4
  %cmp33 = icmp ugt i32 %tmp29, %tmp3
  br i1 %cmp33, label %if.then35, label %return

if.then35:                                        ; preds = %if.end
  store i32 %tmp3, i32* %bf_cnt, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then35, %entry
  %storemerge = phi i64 [ -1, %entry ], [ %sub, %if.then35 ], [ %sub, %if.end ]
  ret i64 %storemerge
}

define i32 @main() nounwind uwtable {
if.end:
  ret i32 0
}
