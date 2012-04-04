; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/921124-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i32 %x, double %d1, double %d2, double %d3) nounwind uwtable readnone {
entry:
  ret i32 %x
}

define void @g(i8* nocapture %b, i8* nocapture %s, double %x, double %y, i32 %i, i32 %j) nounwind uwtable {
entry:
  %notlhs = fcmp oeq double %x, 1.000000e+00
  %notrhs = fcmp oeq double %y, 2.000000e+00
  %or.cond.not = and i1 %notrhs, %notlhs
  %cmp3 = icmp eq i32 %i, 3
  %or.cond6 = and i1 %or.cond.not, %cmp3
  %cmp5 = icmp eq i32 %j, 4
  %or.cond7 = and i1 %or.cond6, %cmp5
  br i1 %or.cond7, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn

define i32 @main() noreturn nounwind uwtable {
g.exit:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn
