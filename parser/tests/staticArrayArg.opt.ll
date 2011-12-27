; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/staticArrayArg.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i32* nocapture %a) nounwind uwtable readonly {
entry:
  %tmp1 = load i32* %a, align 4
  %arrayidx3 = getelementptr inbounds i32* %a, i64 1
  %tmp4 = load i32* %arrayidx3, align 4
  %arrayidx6 = getelementptr inbounds i32* %a, i64 2
  %tmp7 = load i32* %arrayidx6, align 4
  %add = add i32 %tmp4, %tmp1
  %add8 = add i32 %add, %tmp7
  ret i32 %add8
}

define i32 @main() nounwind uwtable readnone {
entry:
  ret i32 6
}
