; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/931004-5.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @f(i32 %n, i32 %x.coerce, i32 %y.coerce, i32 %z.coerce, i64 %l) nounwind uwtable {
entry:
  %sext.mask = and i32 %x.coerce, 65535
  %cmp = icmp eq i32 %sext.mask, 10
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %sroa.store.elt36.mask = and i32 %x.coerce, -65536
  %cmp3 = icmp eq i32 %sroa.store.elt36.mask, 1310720
  br i1 %cmp3, label %if.end6, label %if.then5

if.then5:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.end
  %sext.mask37 = and i32 %y.coerce, 65535
  %cmp9 = icmp eq i32 %sext.mask37, 11
  br i1 %cmp9, label %if.end12, label %if.then11

if.then11:                                        ; preds = %if.end6
  tail call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %if.end6
  %sroa.store.elt35.mask = and i32 %y.coerce, -65536
  %cmp15 = icmp eq i32 %sroa.store.elt35.mask, 1376256
  br i1 %cmp15, label %if.end18, label %if.then17

if.then17:                                        ; preds = %if.end12
  tail call void @abort() noreturn nounwind
  unreachable

if.end18:                                         ; preds = %if.end12
  %sext.mask38 = and i32 %z.coerce, 65535
  %cmp21 = icmp eq i32 %sext.mask38, 12
  br i1 %cmp21, label %if.end24, label %if.then23

if.then23:                                        ; preds = %if.end18
  tail call void @abort() noreturn nounwind
  unreachable

if.end24:                                         ; preds = %if.end18
  %sroa.store.elt.mask = and i32 %z.coerce, -65536
  %cmp27 = icmp eq i32 %sroa.store.elt.mask, 1441792
  br i1 %cmp27, label %if.end30, label %if.then29

if.then29:                                        ; preds = %if.end24
  tail call void @abort() noreturn nounwind
  unreachable

if.end30:                                         ; preds = %if.end24
  %cmp31 = icmp eq i64 %l, 123
  br i1 %cmp31, label %if.end34, label %if.then33

if.then33:                                        ; preds = %if.end30
  tail call void @abort() noreturn nounwind
  unreachable

if.end34:                                         ; preds = %if.end30
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
