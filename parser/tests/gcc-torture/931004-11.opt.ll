; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/931004-11.ll'
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

define void @f(i32 %n, i24 %x.coerce, i24 %y.coerce, i24 %z.coerce, i64 %l) nounwind uwtable {
entry:
  %tmp37 = trunc i24 %x.coerce to i8
  %tmp20 = trunc i24 %y.coerce to i8
  %tmp6 = trunc i24 %z.coerce to i8
  %cmp = icmp eq i8 %tmp37, 10
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %0 = and i24 %x.coerce, 65280
  %cmp7 = icmp eq i24 %0, 5120
  br i1 %cmp7, label %if.end10, label %if.then9

if.then9:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end10:                                         ; preds = %if.end
  %tmp43.mask = and i24 %x.coerce, -65536
  %cmp13 = icmp eq i24 %tmp43.mask, 1966080
  br i1 %cmp13, label %if.end16, label %if.then15

if.then15:                                        ; preds = %if.end10
  tail call void @abort() noreturn nounwind
  unreachable

if.end16:                                         ; preds = %if.end10
  %cmp20 = icmp eq i8 %tmp20, 11
  br i1 %cmp20, label %if.end23, label %if.then22

if.then22:                                        ; preds = %if.end16
  tail call void @abort() noreturn nounwind
  unreachable

if.end23:                                         ; preds = %if.end16
  %1 = and i24 %y.coerce, 65280
  %cmp27 = icmp eq i24 %1, 5376
  br i1 %cmp27, label %if.end30, label %if.then29

if.then29:                                        ; preds = %if.end23
  tail call void @abort() noreturn nounwind
  unreachable

if.end30:                                         ; preds = %if.end23
  %tmp26.mask = and i24 %y.coerce, -65536
  %cmp34 = icmp eq i24 %tmp26.mask, 2031616
  br i1 %cmp34, label %if.end37, label %if.then36

if.then36:                                        ; preds = %if.end30
  tail call void @abort() noreturn nounwind
  unreachable

if.end37:                                         ; preds = %if.end30
  %cmp41 = icmp eq i8 %tmp6, 12
  br i1 %cmp41, label %if.end44, label %if.then43

if.then43:                                        ; preds = %if.end37
  tail call void @abort() noreturn nounwind
  unreachable

if.end44:                                         ; preds = %if.end37
  %2 = and i24 %z.coerce, 65280
  %cmp48 = icmp eq i24 %2, 5632
  br i1 %cmp48, label %if.end51, label %if.then50

if.then50:                                        ; preds = %if.end44
  tail call void @abort() noreturn nounwind
  unreachable

if.end51:                                         ; preds = %if.end44
  %tmp12.mask = and i24 %z.coerce, -65536
  %cmp55 = icmp eq i24 %tmp12.mask, 2097152
  br i1 %cmp55, label %if.end58, label %if.then57

if.then57:                                        ; preds = %if.end51
  tail call void @abort() noreturn nounwind
  unreachable

if.end58:                                         ; preds = %if.end51
  %cmp60 = icmp eq i64 %l, 123
  br i1 %cmp60, label %if.end63, label %if.then62

if.then62:                                        ; preds = %if.end58
  tail call void @abort() noreturn nounwind
  unreachable

if.end63:                                         ; preds = %if.end58
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void @f(i32 3, i24 1971210, i24 2037003, i24 2102796, i64 123)
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
