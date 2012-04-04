; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/hanoiSimple.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@step = common global i32 0, align 4

define void @hanoi(i32 %t1, i32 %t2, i32 %t3, i32 %n) nounwind uwtable {
entry:
  %tmp1 = load i32* @step, align 4
  %inc2 = add nsw i32 %tmp1, 1
  store i32 %inc2, i32* @step, align 4
  %cmp3 = icmp eq i32 %n, 1
  br i1 %cmp3, label %return, label %if.end.lr.ph

if.end.lr.ph:                                     ; preds = %entry
  %tmp7 = add i32 %n, -1
  br label %if.end

if.end:                                           ; preds = %if.end.lr.ph, %if.end
  %indvar = phi i32 [ 0, %if.end.lr.ph ], [ %indvar.next, %if.end ]
  %t3.tr5 = phi i32 [ %t3, %if.end.lr.ph ], [ %t1.tr4, %if.end ]
  %t1.tr4 = phi i32 [ %t1, %if.end.lr.ph ], [ %t3.tr5, %if.end ]
  %sub = sub i32 %tmp7, %indvar
  tail call void @hanoi(i32 %t1.tr4, i32 %t3.tr5, i32 %t2, i32 %sub)
  %tmp = load i32* @step, align 4
  %inc = add nsw i32 %tmp, 1
  store i32 %inc, i32* @step, align 4
  %indvar.next = add i32 %indvar, 1
  %exitcond = icmp eq i32 %indvar.next, %tmp7
  br i1 %exitcond, label %return, label %if.end

return:                                           ; preds = %if.end, %entry
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  tail call void @hanoi(i32 1, i32 2, i32 3, i32 4)
  %tmp1 = load i32* @step, align 4
  ret i32 %tmp1
}
