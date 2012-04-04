; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/switch-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo(i32 %x) nounwind uwtable readnone {
entry:
  switch i32 %x, label %sw.epilog [
    i32 4, label %return
    i32 6, label %return
    i32 9, label %return
    i32 11, label %return
  ]

sw.epilog:                                        ; preds = %entry
  br label %return

return:                                           ; preds = %entry, %entry, %entry, %entry, %sw.epilog
  %retval.0 = phi i32 [ 31, %sw.epilog ], [ 30, %entry ], [ 30, %entry ], [ 30, %entry ], [ 30, %entry ]
  ret i32 %retval.0
}

define i32 @main() nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ -1, %entry ], [ %inc, %for.inc ]
  %cmp = icmp slt i32 %i.0, 66
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  switch i32 %i.0, label %sw.epilog.i [
    i32 4, label %foo.exit
    i32 6, label %foo.exit
    i32 9, label %foo.exit
    i32 11, label %foo.exit
  ]

sw.epilog.i:                                      ; preds = %for.body
  br label %foo.exit

foo.exit:                                         ; preds = %for.body, %for.body, %for.body, %for.body, %sw.epilog.i
  %retval.0.i = phi i32 [ 31, %sw.epilog.i ], [ 30, %for.body ], [ 30, %for.body ], [ 30, %for.body ], [ 30, %for.body ]
  switch i32 %i.0, label %if.else21 [
    i32 4, label %if.then
    i32 6, label %if.then5
    i32 9, label %if.then11
    i32 11, label %if.then17
  ]

if.then:                                          ; preds = %foo.exit
  %cmp2 = icmp eq i32 %retval.0.i, 30
  br i1 %cmp2, label %for.inc, label %if.then3

if.then3:                                         ; preds = %if.then
  tail call void @abort() noreturn nounwind
  unreachable

if.then5:                                         ; preds = %foo.exit
  %cmp6 = icmp eq i32 %retval.0.i, 30
  br i1 %cmp6, label %for.inc, label %if.then7

if.then7:                                         ; preds = %if.then5
  tail call void @abort() noreturn nounwind
  unreachable

if.then11:                                        ; preds = %foo.exit
  %cmp12 = icmp eq i32 %retval.0.i, 30
  br i1 %cmp12, label %for.inc, label %if.then13

if.then13:                                        ; preds = %if.then11
  tail call void @abort() noreturn nounwind
  unreachable

if.then17:                                        ; preds = %foo.exit
  %cmp18 = icmp eq i32 %retval.0.i, 30
  br i1 %cmp18, label %for.inc, label %if.then19

if.then19:                                        ; preds = %if.then17
  tail call void @abort() noreturn nounwind
  unreachable

if.else21:                                        ; preds = %foo.exit
  %cmp22 = icmp eq i32 %retval.0.i, 31
  br i1 %cmp22, label %for.inc, label %if.then23

if.then23:                                        ; preds = %if.else21
  tail call void @abort() noreturn nounwind
  unreachable

for.inc:                                          ; preds = %if.then, %if.then5, %if.then11, %if.then17, %if.else21
  %inc = add nsw i32 %i.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}

declare void @abort() noreturn nounwind
