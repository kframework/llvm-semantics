; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/931004-13.ll'
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

define void @f(i32 %n, i32 %x.coerce, i32 %y.coerce, i32 %z.coerce, i64 %l) nounwind uwtable {
entry:
  %tmp28 = trunc i32 %x.coerce to i8
  %cmp = icmp eq i8 %tmp28, 10
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %0 = and i32 %x.coerce, 65280
  %cmp4 = icmp eq i32 %0, 5120
  br i1 %cmp4, label %if.end7, label %if.then6

if.then6:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end7:                                          ; preds = %if.end
  %1 = and i32 %x.coerce, 16711680
  %cmp10 = icmp eq i32 %1, 1966080
  br i1 %cmp10, label %if.end13, label %if.then12

if.then12:                                        ; preds = %if.end7
  tail call void @abort() noreturn nounwind
  unreachable

if.end13:                                         ; preds = %if.end7
  %tmp35.mask = and i32 %x.coerce, -16777216
  %cmp16 = icmp eq i32 %tmp35.mask, 671088640
  br i1 %cmp16, label %if.end19, label %if.then18

if.then18:                                        ; preds = %if.end13
  tail call void @abort() noreturn nounwind
  unreachable

if.end19:                                         ; preds = %if.end13
  %tmp17 = trunc i32 %y.coerce to i8
  %cmp23 = icmp eq i8 %tmp17, 11
  br i1 %cmp23, label %if.end26, label %if.then25

if.then25:                                        ; preds = %if.end19
  tail call void @abort() noreturn nounwind
  unreachable

if.end26:                                         ; preds = %if.end19
  %2 = and i32 %y.coerce, 65280
  %cmp30 = icmp eq i32 %2, 5376
  br i1 %cmp30, label %if.end33, label %if.then32

if.then32:                                        ; preds = %if.end26
  tail call void @abort() noreturn nounwind
  unreachable

if.end33:                                         ; preds = %if.end26
  %3 = and i32 %y.coerce, 16711680
  %cmp37 = icmp eq i32 %3, 2031616
  br i1 %cmp37, label %if.end40, label %if.then39

if.then39:                                        ; preds = %if.end33
  tail call void @abort() noreturn nounwind
  unreachable

if.end40:                                         ; preds = %if.end33
  %tmp25.mask = and i32 %y.coerce, -16777216
  %cmp44 = icmp eq i32 %tmp25.mask, 687865856
  br i1 %cmp44, label %if.end47, label %if.then46

if.then46:                                        ; preds = %if.end40
  tail call void @abort() noreturn nounwind
  unreachable

if.end47:                                         ; preds = %if.end40
  %tmp4 = trunc i32 %z.coerce to i8
  %cmp51 = icmp eq i8 %tmp4, 12
  br i1 %cmp51, label %if.end54, label %if.then53

if.then53:                                        ; preds = %if.end47
  tail call void @abort() noreturn nounwind
  unreachable

if.end54:                                         ; preds = %if.end47
  %4 = and i32 %z.coerce, 65280
  %cmp58 = icmp eq i32 %4, 5632
  br i1 %cmp58, label %if.end61, label %if.then60

if.then60:                                        ; preds = %if.end54
  tail call void @abort() noreturn nounwind
  unreachable

if.end61:                                         ; preds = %if.end54
  %5 = and i32 %z.coerce, 16711680
  %cmp65 = icmp eq i32 %5, 2097152
  br i1 %cmp65, label %if.end68, label %if.then67

if.then67:                                        ; preds = %if.end61
  tail call void @abort() noreturn nounwind
  unreachable

if.end68:                                         ; preds = %if.end61
  %tmp13.mask = and i32 %z.coerce, -16777216
  %cmp72 = icmp eq i32 %tmp13.mask, 704643072
  br i1 %cmp72, label %if.end75, label %if.then74

if.then74:                                        ; preds = %if.end68
  tail call void @abort() noreturn nounwind
  unreachable

if.end75:                                         ; preds = %if.end68
  %cmp77 = icmp eq i64 %l, 123
  br i1 %cmp77, label %if.end80, label %if.then79

if.then79:                                        ; preds = %if.end75
  tail call void @abort() noreturn nounwind
  unreachable

if.end80:                                         ; preds = %if.end75
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void @f(i32 3, i32 673059850, i32 689902859, i32 706745868, i64 123)
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
