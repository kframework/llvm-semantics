; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20001013-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.x = type { i32, i32 }

@z = global %struct.x { i32 -4028, i32 4096 }, align 4

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

define i32 @foo(%struct.x* %p, i32 %y) nounwind uwtable readonly {
entry:
  %and = and i32 %y, 255
  %cmp = icmp eq i32 %and, %y
  br i1 %cmp, label %lor.lhs.false, label %return

lor.lhs.false:                                    ; preds = %entry
  %b = getelementptr inbounds %struct.x* %p, i64 0, i32 1
  %tmp3 = load i32* %b, align 4
  %sub = sub nsw i32 0, %tmp3
  %a = getelementptr inbounds %struct.x* %p, i64 0, i32 0
  %tmp5 = load i32* %a, align 4
  %cmp6 = icmp sgt i32 %tmp5, %sub
  br i1 %cmp6, label %if.end, label %return

if.end:                                           ; preds = %lor.lhs.false
  br label %return

return:                                           ; preds = %entry, %lor.lhs.false, %if.end
  %storemerge = phi i32 [ 0, %if.end ], [ 1, %lor.lhs.false ], [ 1, %entry ]
  ret i32 %storemerge
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %tmp3.i = load i32* getelementptr inbounds (%struct.x* @z, i64 0, i32 1), align 4
  %sub.i = sub nsw i32 0, %tmp3.i
  %tmp5.i = load i32* getelementptr inbounds (%struct.x* @z, i64 0, i32 0), align 4
  %cmp6.i = icmp sgt i32 %tmp5.i, %sub.i
  br i1 %cmp6.i, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
