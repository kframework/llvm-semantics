; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000717-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @bar(i32 %i, i64 %t.coerce0, i32 %t.coerce1) nounwind uwtable {
entry:
  %0 = trunc i64 %t.coerce0 to i32
  %1 = lshr i64 %t.coerce0, 32
  %2 = trunc i64 %1 to i32
  %cmp = icmp eq i32 %0, %2
  %cmp2 = icmp eq i32 %0, %t.coerce1
  %or.cond = or i1 %cmp, %cmp2
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind

define i32 @foo(i64 %t.coerce0, i32 %t.coerce1, i32 %i) nounwind uwtable {
entry:
  %0 = trunc i64 %t.coerce0 to i32
  %1 = lshr i64 %t.coerce0, 32
  %2 = trunc i64 %1 to i32
  %cmp.i = icmp eq i32 %0, %2
  %cmp2.i = icmp eq i32 %0, %t.coerce1
  %or.cond.i = or i1 %cmp.i, %cmp2.i
  br i1 %or.cond.i, label %if.then.i, label %bar.exit

if.then.i:                                        ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

bar.exit:                                         ; preds = %entry
  ret i32 0
}

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
