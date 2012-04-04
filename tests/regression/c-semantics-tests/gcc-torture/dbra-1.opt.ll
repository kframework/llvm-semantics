; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/dbra-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f1(i64 %a) nounwind uwtable readnone {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %a.addr.0 = phi i64 [ %a, %entry ], [ %dec, %for.inc ]
  %cmp = icmp slt i32 %i.0, 10
  br i1 %cmp, label %for.body, label %return

for.body:                                         ; preds = %for.cond
  %cmp1 = icmp eq i64 %a.addr.0, 0
  br i1 %cmp1, label %return, label %for.inc

for.inc:                                          ; preds = %for.body
  %dec = add nsw i64 %a.addr.0, -1
  %inc = add nsw i32 %i.0, 1
  br label %for.cond

return:                                           ; preds = %for.cond, %for.body
  %retval.0 = phi i32 [ %i.0, %for.body ], [ -1, %for.cond ]
  ret i32 %retval.0
}

define i32 @f2(i64 %a) nounwind uwtable readnone {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %a.addr.0 = phi i64 [ %a, %entry ], [ -1, %for.inc ]
  %cmp = icmp slt i32 %i.0, 10
  br i1 %cmp, label %for.body, label %return

for.body:                                         ; preds = %for.cond
  %cmp1 = icmp eq i64 %a.addr.0, 0
  br i1 %cmp1, label %for.inc, label %return

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1
  br label %for.cond

return:                                           ; preds = %for.cond, %for.body
  %retval.0 = phi i32 [ %i.0, %for.body ], [ -1, %for.cond ]
  ret i32 %retval.0
}

define i32 @f3(i64 %a) nounwind uwtable readnone {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %a.addr.0 = phi i64 [ %a, %entry ], [ %dec, %for.body ]
  %cmp = icmp slt i32 %i.0, 10
  br i1 %cmp, label %for.body, label %return

for.body:                                         ; preds = %for.cond
  %dec = add nsw i64 %a.addr.0, -1
  %cmp1 = icmp eq i64 %dec, 0
  %inc = add nsw i32 %i.0, 1
  br i1 %cmp1, label %return, label %for.cond

return:                                           ; preds = %for.cond, %for.body
  %retval.0 = phi i32 [ %i.0, %for.body ], [ -1, %for.cond ]
  ret i32 %retval.0
}

define i32 @f4(i64 %a) nounwind uwtable readnone {
entry:
  %phitmp = add i64 %a, -1
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %a.addr.0 = phi i64 [ %phitmp, %entry ], [ -1, %for.body ]
  %cmp = icmp slt i32 %i.0, 10
  br i1 %cmp, label %for.body, label %return

for.body:                                         ; preds = %for.cond
  %cmp1 = icmp eq i64 %a.addr.0, 0
  %inc = add nsw i32 %i.0, 1
  br i1 %cmp1, label %for.cond, label %return

return:                                           ; preds = %for.cond, %for.body
  %retval.0 = phi i32 [ %i.0, %for.body ], [ -1, %for.cond ]
  ret i32 %retval.0
}

define i32 @f5(i64 %a) nounwind uwtable readnone {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc2, %for.body ]
  %a.addr.0 = phi i64 [ %a, %entry ], [ %inc, %for.body ]
  %cmp = icmp slt i32 %i.0, 10
  br i1 %cmp, label %for.body, label %return

for.body:                                         ; preds = %for.cond
  %inc = add nsw i64 %a.addr.0, 1
  %cmp1 = icmp eq i64 %inc, 0
  %inc2 = add nsw i32 %i.0, 1
  br i1 %cmp1, label %return, label %for.cond

return:                                           ; preds = %for.cond, %for.body
  %retval.0 = phi i32 [ %i.0, %for.body ], [ -1, %for.cond ]
  ret i32 %retval.0
}

define i32 @f6(i64 %a) nounwind uwtable readnone {
entry:
  %phitmp = add i64 %a, 1
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc2, %for.body ]
  %a.addr.0 = phi i64 [ %phitmp, %entry ], [ 1, %for.body ]
  %cmp = icmp slt i32 %i.0, 10
  br i1 %cmp, label %for.body, label %return

for.body:                                         ; preds = %for.cond
  %cmp1 = icmp eq i64 %a.addr.0, 0
  %inc2 = add nsw i32 %i.0, 1
  br i1 %cmp1, label %for.cond, label %return

return:                                           ; preds = %for.cond, %for.body
  %retval.0 = phi i32 [ %i.0, %for.body ], [ -1, %for.cond ]
  ret i32 %retval.0
}

define i32 @main() noreturn nounwind uwtable {
entry:
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.inc.i, %entry
  %i.0.i = phi i32 [ 0, %entry ], [ %inc.i, %for.inc.i ]
  %a.addr.0.i = phi i64 [ 5, %entry ], [ %dec.i, %for.inc.i ]
  %cmp.i = icmp slt i32 %i.0.i, 10
  br i1 %cmp.i, label %for.body.i, label %if.then

for.body.i:                                       ; preds = %for.cond.i
  %cmp1.i = icmp eq i64 %a.addr.0.i, 0
  br i1 %cmp1.i, label %f1.exit, label %for.inc.i

for.inc.i:                                        ; preds = %for.body.i
  %dec.i = add nsw i64 %a.addr.0.i, -1
  %inc.i = add nsw i32 %i.0.i, 1
  br label %for.cond.i

f1.exit:                                          ; preds = %for.body.i
  %cmp = icmp eq i32 %i.0.i, 5
  br i1 %cmp, label %if.end32, label %if.then

if.then:                                          ; preds = %for.cond.i, %f1.exit
  tail call void @abort() noreturn nounwind
  unreachable

if.end32:                                         ; preds = %f1.exit
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
