; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20050713-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo2(i64 %x.coerce0, i32 %x.coerce1, i64 %y.coerce0, i32 %y.coerce1) nounwind uwtable {
entry:
  %0 = icmp eq i64 %x.coerce0, 17179869187
  %cmp4 = icmp eq i32 %x.coerce1, 5
  %or.cond32 = and i1 %0, %cmp4
  br i1 %or.cond32, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %1 = icmp eq i64 %y.coerce0, 30064771078
  %cmp12 = icmp eq i32 %y.coerce1, 8
  %or.cond34 = and i1 %1, %cmp12
  br i1 %or.cond34, label %if.end14, label %if.then13

if.then13:                                        ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end14:                                         ; preds = %if.end
  ret i32 0
}

declare void @abort() noreturn nounwind

define i32 @foo3(i64 %x.coerce0, i32 %x.coerce1, i64 %y.coerce0, i32 %y.coerce1, i64 %z.coerce0, i32 %z.coerce1) nounwind uwtable {
entry:
  %0 = icmp eq i64 %x.coerce0, 17179869187
  %cmp4.i = icmp eq i32 %x.coerce1, 5
  %or.cond32.i = and i1 %0, %cmp4.i
  br i1 %or.cond32.i, label %if.end.i, label %if.then.i

if.then.i:                                        ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end.i:                                         ; preds = %entry
  %1 = icmp eq i64 %y.coerce0, 30064771078
  %cmp12.i = icmp eq i32 %y.coerce1, 8
  %or.cond34.i = and i1 %1, %cmp12.i
  br i1 %or.cond34.i, label %foo2.exit, label %if.then13.i

if.then13.i:                                      ; preds = %if.end.i
  tail call void @abort() noreturn nounwind
  unreachable

foo2.exit:                                        ; preds = %if.end.i
  %2 = icmp eq i64 %z.coerce0, 42949672969
  %cmp5 = icmp eq i32 %z.coerce1, 11
  %or.cond16 = and i1 %2, %cmp5
  br i1 %or.cond16, label %if.end, label %if.then

if.then:                                          ; preds = %foo2.exit
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %foo2.exit
  ret i32 0
}

define i32 @bar2(i64 %x.coerce0, i32 %x.coerce1, i64 %y.coerce0, i32 %y.coerce1) nounwind uwtable {
entry:
  %0 = icmp eq i64 %y.coerce0, 17179869187
  %cmp4.i = icmp eq i32 %y.coerce1, 5
  %or.cond32.i = and i1 %0, %cmp4.i
  br i1 %or.cond32.i, label %if.end.i, label %if.then.i

if.then.i:                                        ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end.i:                                         ; preds = %entry
  %1 = icmp eq i64 %x.coerce0, 30064771078
  %cmp12.i = icmp eq i32 %x.coerce1, 8
  %or.cond34.i = and i1 %1, %cmp12.i
  br i1 %or.cond34.i, label %foo2.exit, label %if.then13.i

if.then13.i:                                      ; preds = %if.end.i
  tail call void @abort() noreturn nounwind
  unreachable

foo2.exit:                                        ; preds = %if.end.i
  ret i32 0
}

define i32 @bar3(i64 %x.coerce0, i32 %x.coerce1, i64 %y.coerce0, i32 %y.coerce1, i64 %z.coerce0, i32 %z.coerce1) nounwind uwtable {
entry:
  %0 = icmp eq i64 %y.coerce0, 17179869187
  %cmp4.i.i = icmp eq i32 %y.coerce1, 5
  %or.cond32.i.i = and i1 %0, %cmp4.i.i
  br i1 %or.cond32.i.i, label %if.end.i.i, label %if.then.i.i

if.then.i.i:                                      ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end.i.i:                                       ; preds = %entry
  %1 = icmp eq i64 %x.coerce0, 30064771078
  %cmp12.i.i = icmp eq i32 %x.coerce1, 8
  %or.cond34.i.i = and i1 %1, %cmp12.i.i
  br i1 %or.cond34.i.i, label %foo2.exit.i, label %if.then13.i.i

if.then13.i.i:                                    ; preds = %if.end.i.i
  tail call void @abort() noreturn nounwind
  unreachable

foo2.exit.i:                                      ; preds = %if.end.i.i
  %2 = icmp eq i64 %z.coerce0, 42949672969
  %cmp5.i = icmp eq i32 %z.coerce1, 11
  %or.cond16.i = and i1 %2, %cmp5.i
  br i1 %or.cond16.i, label %foo3.exit, label %if.then.i

if.then.i:                                        ; preds = %foo2.exit.i
  tail call void @abort() noreturn nounwind
  unreachable

foo3.exit:                                        ; preds = %foo2.exit.i
  ret i32 0
}

define i32 @baz3(i64 %x.coerce0, i32 %x.coerce1, i64 %y.coerce0, i32 %y.coerce1, i64 %z.coerce0, i32 %z.coerce1) nounwind uwtable {
entry:
  %0 = icmp eq i64 %y.coerce0, 17179869187
  %cmp4.i.i = icmp eq i32 %y.coerce1, 5
  %or.cond32.i.i = and i1 %0, %cmp4.i.i
  br i1 %or.cond32.i.i, label %if.end.i.i, label %if.then.i.i

if.then.i.i:                                      ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end.i.i:                                       ; preds = %entry
  %1 = icmp eq i64 %z.coerce0, 30064771078
  %cmp12.i.i = icmp eq i32 %z.coerce1, 8
  %or.cond34.i.i = and i1 %1, %cmp12.i.i
  br i1 %or.cond34.i.i, label %foo2.exit.i, label %if.then13.i.i

if.then13.i.i:                                    ; preds = %if.end.i.i
  tail call void @abort() noreturn nounwind
  unreachable

foo2.exit.i:                                      ; preds = %if.end.i.i
  %2 = icmp eq i64 %x.coerce0, 42949672969
  %cmp5.i = icmp eq i32 %x.coerce1, 11
  %or.cond16.i = and i1 %2, %cmp5.i
  br i1 %or.cond16.i, label %foo3.exit, label %if.then.i

if.then.i:                                        ; preds = %foo2.exit.i
  tail call void @abort() noreturn nounwind
  unreachable

foo3.exit:                                        ; preds = %foo2.exit.i
  ret i32 0
}

define i32 @main() nounwind uwtable readnone {
entry:
  ret i32 0
}
