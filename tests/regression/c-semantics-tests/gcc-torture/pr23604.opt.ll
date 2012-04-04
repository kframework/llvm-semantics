; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr23604.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @g(i32 %i, i32 %j) nounwind uwtable readnone {
entry:
  %0 = icmp ult i32 %i, 2
  br i1 %0, label %if.then2, label %if.end9

if.then2:                                         ; preds = %entry
  %cmp3 = icmp ne i32 %i, %j
  %cmp5 = icmp ne i32 %j, 0
  %or.cond10 = and i1 %cmp3, %cmp5
  br i1 %or.cond10, label %return, label %if.end9

if.end9:                                          ; preds = %if.then2, %entry
  br label %return

return:                                           ; preds = %if.then2, %if.end9
  %retval.0 = phi i32 [ 1, %if.end9 ], [ 0, %if.then2 ]
  ret i32 %retval.0
}

define i32 @main() nounwind uwtable {
if.end:
  ret i32 0
}
