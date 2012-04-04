; ModuleID = '/home/david/src/c-semantics/tests/integration/factorial.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable readnone {
entry:
  ret i32 3628800
}

define i32 @factorial(i32 %n) nounwind uwtable readnone {
entry:
  %0 = icmp ult i32 %n, 2
  br i1 %0, label %return, label %if.end

if.end:                                           ; preds = %entry, %if.end
  %n.tr3 = phi i32 [ %sub, %if.end ], [ %n, %entry ]
  %accumulator.tr2 = phi i32 [ %mul, %if.end ], [ 1, %entry ]
  %sub = add nsw i32 %n.tr3, -1
  %mul = mul nsw i32 %n.tr3, %accumulator.tr2
  %1 = icmp ult i32 %sub, 2
  br i1 %1, label %return, label %if.end

return:                                           ; preds = %if.end, %entry
  %accumulator.tr.lcssa = phi i32 [ 1, %entry ], [ %mul, %if.end ]
  ret i32 %accumulator.tr.lcssa
}
