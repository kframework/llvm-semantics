; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20000403-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@aa = global [1 x i64] [i64 9223372036854771713], align 8
@bb = global [1 x i64] [i64 9223372036854771713], align 8

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
  %tmp = load i64* getelementptr inbounds ([1 x i64]* @aa, i64 0, i64 0), align 8
  %tmp1 = load i64* getelementptr inbounds ([1 x i64]* @bb, i64 0, i64 0), align 8
  %add.i = add i64 %tmp, 4096
  %sub.i = sub i64 %add.i, %tmp1
  %cmp.i = icmp sgt i64 %sub.i, 0
  br i1 %cmp.i, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

define i32 @seqgt(i64 %a, i16 zeroext %win, i64 %b) nounwind uwtable readnone {
entry:
  %conv = zext i16 %win to i64
  %add = sub i64 %a, %b
  %sub = add i64 %add, %conv
  %cmp = icmp sgt i64 %sub, 0
  %conv3 = zext i1 %cmp to i32
  ret i32 %conv3
}

define i32 @seqgt2(i64 %a, i16 zeroext %win, i64 %b) nounwind uwtable readnone {
entry:
  %conv = zext i16 %win to i64
  %add = sub i64 %a, %b
  %sub = add i64 %add, %conv
  %cmp = icmp sgt i64 %sub, 0
  %conv4 = zext i1 %cmp to i32
  ret i32 %conv4
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
