; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/931004-11.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @f(i32 %n, i24 %x.coerce, i24 %y.coerce, i24 %z.coerce, i64 %l) nounwind uwtable {
entry:
  %sext.mask = and i24 %x.coerce, 255
  %cmp = icmp eq i24 %sext.mask, 10
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %sext.mask60 = and i24 %x.coerce, 65280
  %cmp5 = icmp eq i24 %sext.mask60, 5120
  br i1 %cmp5, label %if.end8, label %if.then7

if.then7:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.end
  %.mask = and i24 %x.coerce, -65536
  %cmp10 = icmp eq i24 %.mask, 1966080
  br i1 %cmp10, label %if.end13, label %if.then12

if.then12:                                        ; preds = %if.end8
  tail call void @abort() noreturn nounwind
  unreachable

if.end13:                                         ; preds = %if.end8
  %sext.mask61 = and i24 %y.coerce, 255
  %cmp16 = icmp eq i24 %sext.mask61, 11
  br i1 %cmp16, label %if.end19, label %if.then18

if.then18:                                        ; preds = %if.end13
  tail call void @abort() noreturn nounwind
  unreachable

if.end19:                                         ; preds = %if.end13
  %sext.mask62 = and i24 %y.coerce, 65280
  %cmp22 = icmp eq i24 %sext.mask62, 5376
  br i1 %cmp22, label %if.end25, label %if.then24

if.then24:                                        ; preds = %if.end19
  tail call void @abort() noreturn nounwind
  unreachable

if.end25:                                         ; preds = %if.end19
  %.mask63 = and i24 %y.coerce, -65536
  %cmp28 = icmp eq i24 %.mask63, 2031616
  br i1 %cmp28, label %if.end31, label %if.then30

if.then30:                                        ; preds = %if.end25
  tail call void @abort() noreturn nounwind
  unreachable

if.end31:                                         ; preds = %if.end25
  %sext.mask64 = and i24 %z.coerce, 255
  %cmp34 = icmp eq i24 %sext.mask64, 12
  br i1 %cmp34, label %if.end37, label %if.then36

if.then36:                                        ; preds = %if.end31
  tail call void @abort() noreturn nounwind
  unreachable

if.end37:                                         ; preds = %if.end31
  %sext.mask65 = and i24 %z.coerce, 65280
  %cmp40 = icmp eq i24 %sext.mask65, 5632
  br i1 %cmp40, label %if.end43, label %if.then42

if.then42:                                        ; preds = %if.end37
  tail call void @abort() noreturn nounwind
  unreachable

if.end43:                                         ; preds = %if.end37
  %.mask66 = and i24 %z.coerce, -65536
  %cmp46 = icmp eq i24 %.mask66, 2097152
  br i1 %cmp46, label %if.end49, label %if.then48

if.then48:                                        ; preds = %if.end43
  tail call void @abort() noreturn nounwind
  unreachable

if.end49:                                         ; preds = %if.end43
  %cmp50 = icmp eq i64 %l, 123
  br i1 %cmp50, label %if.end53, label %if.then52

if.then52:                                        ; preds = %if.end49
  tail call void @abort() noreturn nounwind
  unreachable

if.end53:                                         ; preds = %if.end49
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
