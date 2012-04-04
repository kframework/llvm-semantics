; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000717-5.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @bar(i32 %i, i32 %j, i32 %k, i64 %t.coerce0, i32 %t.coerce1) nounwind uwtable {
entry:
  %0 = icmp eq i64 %t.coerce0, 8589934593
  %cmp3 = icmp eq i32 %t.coerce1, 3
  %or.cond16 = and i1 %0, %cmp3
  %cmp5 = icmp eq i32 %i, 4
  %or.cond17 = and i1 %or.cond16, %cmp5
  %cmp7 = icmp eq i32 %j, 5
  %or.cond18 = and i1 %or.cond17, %cmp7
  %cmp9 = icmp eq i32 %k, 6
  %or.cond19 = and i1 %or.cond18, %cmp9
  br i1 %or.cond19, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind

define i32 @foo(i64 %t.coerce0, i32 %t.coerce1, i32 %i, i32 %j, i32 %k) nounwind uwtable {
entry:
  %0 = icmp eq i64 %t.coerce0, 8589934593
  %cmp3.i = icmp eq i32 %t.coerce1, 3
  %or.cond16.i = and i1 %0, %cmp3.i
  %cmp5.i = icmp eq i32 %i, 4
  %or.cond17.i = and i1 %or.cond16.i, %cmp5.i
  %cmp7.i = icmp eq i32 %j, 5
  %or.cond18.i = and i1 %or.cond17.i, %cmp7.i
  %cmp9.i = icmp eq i32 %k, 6
  %or.cond19.i = and i1 %or.cond18.i, %cmp9.i
  br i1 %or.cond19.i, label %bar.exit, label %if.then.i

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
