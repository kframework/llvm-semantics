; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pending-4.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @dummy(i32* nocapture %x, i32 %y) nounwind uwtable readnone {
entry:
  ret void
}

define i32 @main(i32 %argc, i8** nocapture %argv) noreturn nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %cnt0.0 = phi i32 [ 0, %entry ], [ %cnt0.1, %for.inc ]
  %cnt1.0 = phi i32 [ 0, %entry ], [ %cnt1.1, %for.inc ]
  %i.0 = phi i32 [ 8, %entry ], [ %dec, %for.inc ]
  switch i32 %i.0, label %if.else [
    i32 0, label %for.end
    i32 1, label %if.then
  ]

if.then:                                          ; preds = %for.cond
  %inc = add nsw i32 %cnt0.0, 1
  br label %for.inc

if.else:                                          ; preds = %for.cond
  %inc3 = add nsw i32 %cnt1.0, 1
  br label %for.inc

for.inc:                                          ; preds = %if.then, %if.else
  %cnt0.1 = phi i32 [ %inc, %if.then ], [ %cnt0.0, %if.else ]
  %cnt1.1 = phi i32 [ %cnt1.0, %if.then ], [ %inc3, %if.else ]
  %dec = add nsw i32 %i.0, -1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %cmp4 = icmp eq i32 %cnt0.0, 1
  %cmp5 = icmp eq i32 %cnt1.0, 7
  %or.cond = and i1 %cmp4, %cmp5
  br i1 %or.cond, label %if.end7, label %if.then6

if.then6:                                         ; preds = %for.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end7:                                          ; preds = %for.end
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
