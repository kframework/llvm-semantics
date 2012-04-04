; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/931004-13.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @f(i32 %n, i32 %x.coerce, i32 %y.coerce, i32 %z.coerce, i64 %l) nounwind uwtable {
entry:
  %sext.mask = and i32 %x.coerce, 255
  %cmp = icmp eq i32 %sext.mask, 10
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %sext.mask77 = and i32 %x.coerce, 65280
  %cmp3 = icmp eq i32 %sext.mask77, 5120
  br i1 %cmp3, label %if.end6, label %if.then5

if.then5:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.end
  %sext.mask78 = and i32 %x.coerce, 16711680
  %cmp8 = icmp eq i32 %sext.mask78, 1966080
  br i1 %cmp8, label %if.end11, label %if.then10

if.then10:                                        ; preds = %if.end6
  tail call void @abort() noreturn nounwind
  unreachable

if.end11:                                         ; preds = %if.end6
  %sroa.store.elt76.mask = and i32 %x.coerce, -16777216
  %cmp13 = icmp eq i32 %sroa.store.elt76.mask, 671088640
  br i1 %cmp13, label %if.end16, label %if.then15

if.then15:                                        ; preds = %if.end11
  tail call void @abort() noreturn nounwind
  unreachable

if.end16:                                         ; preds = %if.end11
  %sext.mask79 = and i32 %y.coerce, 255
  %cmp19 = icmp eq i32 %sext.mask79, 11
  br i1 %cmp19, label %if.end22, label %if.then21

if.then21:                                        ; preds = %if.end16
  tail call void @abort() noreturn nounwind
  unreachable

if.end22:                                         ; preds = %if.end16
  %sext.mask80 = and i32 %y.coerce, 65280
  %cmp25 = icmp eq i32 %sext.mask80, 5376
  br i1 %cmp25, label %if.end28, label %if.then27

if.then27:                                        ; preds = %if.end22
  tail call void @abort() noreturn nounwind
  unreachable

if.end28:                                         ; preds = %if.end22
  %sext.mask81 = and i32 %y.coerce, 16711680
  %cmp31 = icmp eq i32 %sext.mask81, 2031616
  br i1 %cmp31, label %if.end34, label %if.then33

if.then33:                                        ; preds = %if.end28
  tail call void @abort() noreturn nounwind
  unreachable

if.end34:                                         ; preds = %if.end28
  %sroa.store.elt73.mask = and i32 %y.coerce, -16777216
  %cmp37 = icmp eq i32 %sroa.store.elt73.mask, 687865856
  br i1 %cmp37, label %if.end40, label %if.then39

if.then39:                                        ; preds = %if.end34
  tail call void @abort() noreturn nounwind
  unreachable

if.end40:                                         ; preds = %if.end34
  %sext.mask82 = and i32 %z.coerce, 255
  %cmp43 = icmp eq i32 %sext.mask82, 12
  br i1 %cmp43, label %if.end46, label %if.then45

if.then45:                                        ; preds = %if.end40
  tail call void @abort() noreturn nounwind
  unreachable

if.end46:                                         ; preds = %if.end40
  %sext.mask83 = and i32 %z.coerce, 65280
  %cmp49 = icmp eq i32 %sext.mask83, 5632
  br i1 %cmp49, label %if.end52, label %if.then51

if.then51:                                        ; preds = %if.end46
  tail call void @abort() noreturn nounwind
  unreachable

if.end52:                                         ; preds = %if.end46
  %sext.mask84 = and i32 %z.coerce, 16711680
  %cmp55 = icmp eq i32 %sext.mask84, 2097152
  br i1 %cmp55, label %if.end58, label %if.then57

if.then57:                                        ; preds = %if.end52
  tail call void @abort() noreturn nounwind
  unreachable

if.end58:                                         ; preds = %if.end52
  %sroa.store.elt70.mask = and i32 %z.coerce, -16777216
  %cmp61 = icmp eq i32 %sroa.store.elt70.mask, 704643072
  br i1 %cmp61, label %if.end64, label %if.then63

if.then63:                                        ; preds = %if.end58
  tail call void @abort() noreturn nounwind
  unreachable

if.end64:                                         ; preds = %if.end58
  %cmp65 = icmp eq i64 %l, 123
  br i1 %cmp65, label %if.end68, label %if.then67

if.then67:                                        ; preds = %if.end64
  tail call void @abort() noreturn nounwind
  unreachable

if.end68:                                         ; preds = %if.end64
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
