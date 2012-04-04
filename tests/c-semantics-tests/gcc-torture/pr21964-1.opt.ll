; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr21964-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @foo(i32 %n, i32 %m) nounwind uwtable {
entry:
  %cmp1 = icmp eq i32 %n, 0
  br i1 %cmp1, label %tailrecurse.us, label %entry.entry.split_crit_edge

entry.entry.split_crit_edge:                      ; preds = %entry
  %cmp = icmp eq i32 %m, 0
  br i1 %cmp, label %if.then, label %if.then2

tailrecurse.us:                                   ; preds = %if.else.us, %entry
  %m.tr.us = phi i32 [ %sub.us, %if.else.us ], [ %m, %entry ]
  %cmp.us = icmp eq i32 %m.tr.us, 0
  br i1 %cmp.us, label %if.then, label %if.else.us

if.else.us:                                       ; preds = %tailrecurse.us
  %sub.us = add nsw i32 %m.tr.us, -1
  br label %tailrecurse.us

if.then:                                          ; preds = %entry.entry.split_crit_edge, %tailrecurse.us
  tail call void @exit(i32 0) noreturn nounwind
  unreachable

if.then2:                                         ; preds = %entry.entry.split_crit_edge
  tail call void @abort() noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}
