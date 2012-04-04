; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20031010-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i64 @foo(i64 %ct, i64 %cf, i1 zeroext %p1, i1 zeroext %p2, i1 zeroext %p3) nounwind uwtable noinline {
entry:
  br i1 %p1, label %if.then, label %if.end9

if.then:                                          ; preds = %entry
  %sub = sub nsw i64 %ct, %cf
  br i1 %p2, label %if.then4, label %if.end8

if.then4:                                         ; preds = %if.then
  %ct.cf = select i1 %p3, i64 %ct, i64 %cf
  %cf.ct = select i1 %p3, i64 %cf, i64 %ct
  %sub7 = sub nsw i64 %cf.ct, %ct.cf
  br label %if.end8

if.end8:                                          ; preds = %if.then4, %if.then
  %diff.0 = phi i64 [ %sub7, %if.then4 ], [ %sub, %if.then ]
  ret i64 %diff.0

if.end9:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %call = tail call i64 @foo(i64 2, i64 3, i1 zeroext true, i1 zeroext true, i1 zeroext true)
  %cmp = icmp eq i64 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}
