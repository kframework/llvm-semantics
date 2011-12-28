; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/990811-1.ll'
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

define i32 @foo(i32 %x, i8* %y) nounwind uwtable {
entry:
  switch i32 %x, label %sw.epilog [
    i32 0, label %sw.bb
    i32 1, label %sw.bb3
    i32 2, label %sw.bb7
  ]

sw.bb:                                            ; preds = %entry
  %a = bitcast i8* %y to i64*
  %tmp2 = load i64* %a, align 8
  %conv = trunc i64 %tmp2 to i32
  br label %return

sw.bb3:                                           ; preds = %entry
  %tmp5 = load i8* %y, align 1
  %conv6 = sext i8 %tmp5 to i32
  br label %return

sw.bb7:                                           ; preds = %entry
  %0 = bitcast i8* %y to i16*
  %tmp9 = load i16* %0, align 2
  %conv10 = sext i16 %tmp9 to i32
  br label %return

sw.epilog:                                        ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

return:                                           ; preds = %sw.bb7, %sw.bb3, %sw.bb
  %1 = phi i32 [ %conv10, %sw.bb7 ], [ %conv6, %sw.bb3 ], [ %conv, %sw.bb ]
  ret i32 %1
}

declare void @abort() noreturn nounwind

define i32 @main() noreturn nounwind uwtable {
if.end22:
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
