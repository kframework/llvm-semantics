; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/950621-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.s = type { i32, i32, %struct.s* }

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

define i32 @f(%struct.s* %sp) nounwind uwtable readonly {
entry:
  %tobool = icmp eq %struct.s* %sp, null
  br i1 %tobool, label %land.end, label %land.lhs.true

land.lhs.true:                                    ; preds = %entry
  %a = getelementptr inbounds %struct.s* %sp, i64 0, i32 0
  %tmp2 = load i32* %a, align 4
  %cmp = icmp eq i32 %tmp2, -1
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true
  %b = getelementptr inbounds %struct.s* %sp, i64 0, i32 1
  %tmp4 = load i32* %b, align 4
  %cmp5 = icmp eq i32 %tmp4, -1
  br label %land.end

land.end:                                         ; preds = %entry, %land.rhs, %land.lhs.true
  %0 = phi i1 [ false, %land.lhs.true ], [ false, %entry ], [ %cmp5, %land.rhs ]
  %land.ext = zext i1 %0 to i32
  ret i32 %land.ext
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
