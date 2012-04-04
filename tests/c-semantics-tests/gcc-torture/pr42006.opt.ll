; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr42006.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.inc.i, %entry
  %count.0.i = phi i32 [ 0, %entry ], [ %inc.i, %for.inc.i ]
  %p_6.addr.0.i = phi i32 [ 1, %entry ], [ %si1.add.i.i, %for.inc.i ]
  %cmp.i = icmp ult i32 %p_6.addr.0.i, 3
  br i1 %cmp.i, label %for.body.i, label %func_4.exit

for.body.i:                                       ; preds = %for.cond.i
  %inc.i = add nsw i32 %count.0.i, 1
  %cmp1.i = icmp sgt i32 %count.0.i, 1
  br i1 %cmp1.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %for.body.i
  tail call void @abort() noreturn nounwind
  unreachable

if.end.i:                                         ; preds = %for.body.i
  %cmp.i.i = icmp ugt i32 %p_6.addr.0.i, 100
  %shr.i.i = select i1 %cmp.i.i, i32 0, i32 %p_6.addr.0.i
  %left.shr.i.i = lshr i32 %p_6.addr.0.i, %shr.i.i
  %tobool.i = icmp eq i32 %left.shr.i.i, 0
  br i1 %tobool.i, label %for.inc.i, label %func_4.exit

for.inc.i:                                        ; preds = %if.end.i
  %not.cmp.i.i = icmp ult i32 %p_6.addr.0.i, 50
  %add.i.i = zext i1 %not.cmp.i.i to i32
  %si1.add.i.i = add i32 %add.i.i, %p_6.addr.0.i
  br label %for.cond.i

func_4.exit:                                      ; preds = %for.cond.i, %if.end.i
  ret i32 0
}

declare void @abort() noreturn nounwind
