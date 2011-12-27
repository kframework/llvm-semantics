; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/factorial.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable readnone {
entry:
  ret i32 3628800
}

define i32 @factorial(i32 %n) nounwind uwtable readnone {
entry:
  %switch1 = icmp ult i32 %n, 2
  br i1 %switch1, label %return, label %if.end.lr.ph

if.end.lr.ph:                                     ; preds = %entry
  %tmp = add i32 %n, -1
  br label %if.end

if.end:                                           ; preds = %if.end.lr.ph, %if.end
  %indvar = phi i32 [ 0, %if.end.lr.ph ], [ %indvar.next, %if.end ]
  %accumulator.tr2 = phi i32 [ 1, %if.end.lr.ph ], [ %mul, %if.end ]
  %n.tr3 = sub i32 %n, %indvar
  %mul = mul nsw i32 %n.tr3, %accumulator.tr2
  %indvar.next = add i32 %indvar, 1
  %exitcond = icmp eq i32 %indvar.next, %tmp
  br i1 %exitcond, label %return, label %if.end

return:                                           ; preds = %if.end, %entry
  %accumulator.tr.lcssa = phi i32 [ 1, %entry ], [ %mul, %if.end ]
  ret i32 %accumulator.tr.lcssa
}
