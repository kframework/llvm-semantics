; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000605-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() noreturn nounwind uwtable {
for.body.lr.ph.i:
  br label %if.end.i

if.end.i:                                         ; preds = %if.end.i, %for.body.lr.ph.i
  %src_y16.pre-phi.i.if.end.i1 = phi i32 [ 0, %for.body.lr.ph.i ], [ %add.i, %if.end.i ]
  %y.018.i = phi i32 [ 0, %for.body.lr.ph.i ], [ %inc.i, %if.end.i ]
  %add.i = add nsw i32 %src_y16.pre-phi.i.if.end.i1, 1
  %inc.i = add nsw i32 %y.018.i, 1
  %exitcond.i = icmp eq i32 %inc.i, 256
  br i1 %exitcond.i, label %render_image_rgb_a.exit, label %if.end.i

render_image_rgb_a.exit:                          ; preds = %if.end.i
  %cmp = icmp eq i32 %add.i, 256
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %render_image_rgb_a.exit
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %render_image_rgb_a.exit
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
