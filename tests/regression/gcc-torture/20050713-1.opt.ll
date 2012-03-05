; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20050713-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i32, i32, i32 }

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

define i32 @foo2(i64 %x.coerce0, i32 %x.coerce1, i64 %y.coerce0, i32 %y.coerce1) nounwind uwtable {
entry:
  %0 = icmp eq i64 %x.coerce0, 17179869187
  %cmp5 = icmp eq i32 %x.coerce1, 5
  %or.cond34 = and i1 %0, %cmp5
  br i1 %or.cond34, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %1 = icmp eq i64 %y.coerce0, 30064771078
  %cmp16 = icmp eq i32 %y.coerce1, 8
  %or.cond36 = and i1 %1, %cmp16
  br i1 %or.cond36, label %if.end18, label %if.then17

if.then17:                                        ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end18:                                         ; preds = %if.end
  ret i32 0
}

declare void @abort() noreturn nounwind

define i32 @foo3(i64 %x.coerce0, i32 %x.coerce1, i64 %y.coerce0, i32 %y.coerce1, i64 %z.coerce0, i32 %z.coerce1) nounwind uwtable {
entry:
  %0 = icmp eq i64 %x.coerce0, 17179869187
  %cmp5.i = icmp eq i32 %x.coerce1, 5
  %or.cond34.i = and i1 %0, %cmp5.i
  br i1 %or.cond34.i, label %if.end.i, label %if.then.i

if.then.i:                                        ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end.i:                                         ; preds = %entry
  %1 = icmp eq i64 %y.coerce0, 30064771078
  %cmp16.i = icmp eq i32 %y.coerce1, 8
  %or.cond36.i = and i1 %1, %cmp16.i
  br i1 %or.cond36.i, label %foo2.exit, label %if.then17.i

if.then17.i:                                      ; preds = %if.end.i
  tail call void @abort() noreturn nounwind
  unreachable

foo2.exit:                                        ; preds = %if.end.i
  %2 = icmp eq i64 %z.coerce0, 42949672969
  %cmp5 = icmp eq i32 %z.coerce1, 11
  %or.cond43 = and i1 %2, %cmp5
  br i1 %or.cond43, label %if.end, label %if.then

if.then:                                          ; preds = %foo2.exit
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %foo2.exit
  ret i32 0
}

define i32 @bar2(i64 %x.coerce0, i32 %x.coerce1, i64 %y.coerce0, i32 %y.coerce1) nounwind uwtable {
entry:
  %0 = icmp eq i64 %y.coerce0, 17179869187
  %cmp5.i = icmp eq i32 %y.coerce1, 5
  %or.cond34.i = and i1 %0, %cmp5.i
  br i1 %or.cond34.i, label %if.end.i, label %if.then.i

if.then.i:                                        ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end.i:                                         ; preds = %entry
  %1 = icmp eq i64 %x.coerce0, 30064771078
  %cmp16.i = icmp eq i32 %x.coerce1, 8
  %or.cond36.i = and i1 %1, %cmp16.i
  br i1 %or.cond36.i, label %foo2.exit, label %if.then17.i

if.then17.i:                                      ; preds = %if.end.i
  tail call void @abort() noreturn nounwind
  unreachable

foo2.exit:                                        ; preds = %if.end.i
  ret i32 0
}

define i32 @bar3(i64 %x.coerce0, i32 %x.coerce1, i64 %y.coerce0, i32 %y.coerce1, i64 %z.coerce0, i32 %z.coerce1) nounwind uwtable {
entry:
  %0 = icmp eq i64 %y.coerce0, 17179869187
  %cmp5.i.i = icmp eq i32 %y.coerce1, 5
  %or.cond34.i.i = and i1 %0, %cmp5.i.i
  br i1 %or.cond34.i.i, label %if.end.i.i, label %if.then.i.i

if.then.i.i:                                      ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end.i.i:                                       ; preds = %entry
  %1 = icmp eq i64 %x.coerce0, 30064771078
  %cmp16.i.i = icmp eq i32 %x.coerce1, 8
  %or.cond36.i.i = and i1 %1, %cmp16.i.i
  br i1 %or.cond36.i.i, label %foo2.exit.i, label %if.then17.i.i

if.then17.i.i:                                    ; preds = %if.end.i.i
  tail call void @abort() noreturn nounwind
  unreachable

foo2.exit.i:                                      ; preds = %if.end.i.i
  %2 = icmp eq i64 %z.coerce0, 42949672969
  %cmp5.i = icmp eq i32 %z.coerce1, 11
  %or.cond43.i = and i1 %2, %cmp5.i
  br i1 %or.cond43.i, label %foo3.exit, label %if.then.i

if.then.i:                                        ; preds = %foo2.exit.i
  tail call void @abort() noreturn nounwind
  unreachable

foo3.exit:                                        ; preds = %foo2.exit.i
  ret i32 0
}

define i32 @baz3(i64 %x.coerce0, i32 %x.coerce1, i64 %y.coerce0, i32 %y.coerce1, i64 %z.coerce0, i32 %z.coerce1) nounwind uwtable {
entry:
  %0 = icmp eq i64 %y.coerce0, 17179869187
  %cmp5.i.i = icmp eq i32 %y.coerce1, 5
  %or.cond34.i.i = and i1 %0, %cmp5.i.i
  br i1 %or.cond34.i.i, label %if.end.i.i, label %if.then.i.i

if.then.i.i:                                      ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end.i.i:                                       ; preds = %entry
  %1 = icmp eq i64 %z.coerce0, 30064771078
  %cmp16.i.i = icmp eq i32 %z.coerce1, 8
  %or.cond36.i.i = and i1 %1, %cmp16.i.i
  br i1 %or.cond36.i.i, label %foo2.exit.i, label %if.then17.i.i

if.then17.i.i:                                    ; preds = %if.end.i.i
  tail call void @abort() noreturn nounwind
  unreachable

foo2.exit.i:                                      ; preds = %if.end.i.i
  %2 = icmp eq i64 %x.coerce0, 42949672969
  %cmp5.i = icmp eq i32 %x.coerce1, 11
  %or.cond43.i = and i1 %2, %cmp5.i
  br i1 %or.cond43.i, label %foo3.exit, label %if.then.i

if.then.i:                                        ; preds = %foo2.exit.i
  tail call void @abort() noreturn nounwind
  unreachable

foo3.exit:                                        ; preds = %foo2.exit.i
  ret i32 0
}

define i32 @main() nounwind uwtable {
baz3.exit:
  ret i32 0
}
