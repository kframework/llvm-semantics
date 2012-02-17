; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/compare-1.ll'
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

define i32 @ieq(i32 %x, i32 %y, i32 %ok) nounwind uwtable {
entry:
  %cmp = icmp slt i32 %y, %x
  %0 = icmp eq i32 %x, %y
  %tobool8 = icmp eq i32 %ok, 0
  br i1 %0, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br i1 %tobool8, label %if.then6, label %if.end29

if.then6:                                         ; preds = %if.then
  tail call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  br i1 %tobool8, label %if.end11, label %if.then9

if.then9:                                         ; preds = %if.else
  tail call void @abort() noreturn nounwind
  unreachable

if.end11:                                         ; preds = %if.else
  br i1 %cmp, label %if.end47, label %land.lhs.true15

land.lhs.true15:                                  ; preds = %if.end11
  br i1 %0, label %if.then19, label %if.else24

if.then19:                                        ; preds = %land.lhs.true15
  br i1 %tobool8, label %if.then22, label %if.end29

if.then22:                                        ; preds = %if.then19
  tail call void @abort() noreturn nounwind
  unreachable

if.else24:                                        ; preds = %land.lhs.true15
  br i1 %tobool8, label %if.end29, label %if.then27

if.then27:                                        ; preds = %if.else24
  tail call void @abort() noreturn nounwind
  unreachable

if.end29:                                         ; preds = %if.then, %if.else24, %if.then19
  %1 = icmp eq i32 %y, %x
  br i1 %1, label %if.then37, label %if.else42

if.then37:                                        ; preds = %if.end29
  br i1 %tobool8, label %if.then40, label %if.end65

if.then40:                                        ; preds = %if.then37
  tail call void @abort() noreturn nounwind
  unreachable

if.else42:                                        ; preds = %if.end29
  br i1 %tobool8, label %if.end65, label %if.then45

if.then45:                                        ; preds = %if.else42
  tail call void @abort() noreturn nounwind
  unreachable

if.end47:                                         ; preds = %if.end11
  %.pre = icmp eq i32 %y, %x
  br i1 %.pre, label %if.then58, label %if.end65

if.then58:                                        ; preds = %if.end47
  tail call void @abort() noreturn nounwind
  unreachable

if.end65:                                         ; preds = %if.else42, %if.end47, %if.then37
  ret i32 0
}

declare void @abort() noreturn nounwind

define void @ine(i32 %x, i32 %y, i32 %ok) nounwind uwtable {
entry:
  %0 = icmp eq i32 %x, %y
  %tobool = icmp eq i32 %ok, 0
  br i1 %0, label %if.else, label %if.then

if.then:                                          ; preds = %entry
  br i1 %tobool, label %if.then6, label %if.end11

if.then6:                                         ; preds = %if.then
  tail call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  br i1 %tobool, label %if.end11, label %if.then9

if.then9:                                         ; preds = %if.else
  tail call void @abort() noreturn nounwind
  unreachable

if.end11:                                         ; preds = %if.else, %if.then
  ret void
}

define i32 @ilt(i32 %x, i32 %y, i32 %ok) nounwind uwtable {
entry:
  %0 = icmp slt i32 %x, %y
  %tobool8 = icmp eq i32 %ok, 0
  br i1 %0, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br i1 %tobool8, label %if.then6, label %if.end11

if.then6:                                         ; preds = %if.then
  tail call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  br i1 %tobool8, label %if.end11, label %if.then9

if.then9:                                         ; preds = %if.else
  tail call void @abort() noreturn nounwind
  unreachable

if.end11:                                         ; preds = %if.else, %if.then
  ret i32 0
}

define i32 @ile(i32 %x, i32 %y, i32 %ok) nounwind uwtable {
entry:
  %0 = icmp sgt i32 %x, %y
  %tobool = icmp eq i32 %ok, 0
  br i1 %0, label %if.else, label %if.then

if.then:                                          ; preds = %entry
  br i1 %tobool, label %if.then6, label %if.end11

if.then6:                                         ; preds = %if.then
  tail call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  br i1 %tobool, label %if.end11, label %if.then9

if.then9:                                         ; preds = %if.else
  tail call void @abort() noreturn nounwind
  unreachable

if.end11:                                         ; preds = %if.else, %if.then
  ret i32 0
}

define i32 @igt(i32 %x, i32 %y, i32 %ok) nounwind uwtable {
entry:
  %0 = icmp sgt i32 %x, %y
  %tobool8 = icmp eq i32 %ok, 0
  br i1 %0, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br i1 %tobool8, label %if.then6, label %if.end11

if.then6:                                         ; preds = %if.then
  tail call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  br i1 %tobool8, label %if.end11, label %if.then9

if.then9:                                         ; preds = %if.else
  tail call void @abort() noreturn nounwind
  unreachable

if.end11:                                         ; preds = %if.else, %if.then
  ret i32 0
}

define i32 @ige(i32 %x, i32 %y, i32 %ok) nounwind uwtable {
entry:
  %0 = icmp slt i32 %x, %y
  %tobool = icmp eq i32 %ok, 0
  br i1 %0, label %if.else, label %if.then

if.then:                                          ; preds = %entry
  br i1 %tobool, label %if.then6, label %if.end11

if.then6:                                         ; preds = %if.then
  tail call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  br i1 %tobool, label %if.end11, label %if.then9

if.then9:                                         ; preds = %if.else
  tail call void @abort() noreturn nounwind
  unreachable

if.end11:                                         ; preds = %if.else, %if.then
  ret i32 0
}

define i32 @main() nounwind uwtable {
entry:
  %call = tail call i32 @ieq(i32 1, i32 4, i32 0)
  %call1 = tail call i32 @ieq(i32 3, i32 3, i32 1)
  %call2 = tail call i32 @ieq(i32 5, i32 2, i32 0)
  ret i32 0
}
