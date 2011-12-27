; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/931004-9.ll'
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

define void @f(i32 %n, i16 %x.coerce, i16 %y.coerce, i16 %z.coerce, i64 %l) nounwind uwtable {
entry:
  %tmp15 = trunc i16 %x.coerce to i8
  %cmp = icmp eq i8 %tmp15, 10
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %tmp16.mask = and i16 %x.coerce, -256
  %cmp4 = icmp eq i16 %tmp16.mask, 5120
  br i1 %cmp4, label %if.end7, label %if.then6

if.then6:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end7:                                          ; preds = %if.end
  %tmp10 = trunc i16 %y.coerce to i8
  %cmp11 = icmp eq i8 %tmp10, 11
  br i1 %cmp11, label %if.end14, label %if.then13

if.then13:                                        ; preds = %if.end7
  tail call void @abort() noreturn nounwind
  unreachable

if.end14:                                         ; preds = %if.end7
  %tmp12.mask = and i16 %y.coerce, -256
  %cmp18 = icmp eq i16 %tmp12.mask, 5376
  br i1 %cmp18, label %if.end21, label %if.then20

if.then20:                                        ; preds = %if.end14
  tail call void @abort() noreturn nounwind
  unreachable

if.end21:                                         ; preds = %if.end14
  %tmp4 = trunc i16 %z.coerce to i8
  %cmp25 = icmp eq i8 %tmp4, 12
  br i1 %cmp25, label %if.end28, label %if.then27

if.then27:                                        ; preds = %if.end21
  tail call void @abort() noreturn nounwind
  unreachable

if.end28:                                         ; preds = %if.end21
  %tmp6.mask = and i16 %z.coerce, -256
  %cmp32 = icmp eq i16 %tmp6.mask, 5632
  br i1 %cmp32, label %if.end35, label %if.then34

if.then34:                                        ; preds = %if.end28
  tail call void @abort() noreturn nounwind
  unreachable

if.end35:                                         ; preds = %if.end28
  %cmp37 = icmp eq i64 %l, 123
  br i1 %cmp37, label %if.end40, label %if.then39

if.then39:                                        ; preds = %if.end35
  tail call void @abort() noreturn nounwind
  unreachable

if.end40:                                         ; preds = %if.end35
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void @f(i32 3, i16 5130, i16 5387, i16 5644, i64 123)
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
