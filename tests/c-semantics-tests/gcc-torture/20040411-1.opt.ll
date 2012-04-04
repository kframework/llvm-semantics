; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20040411-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @sub1(i32 %i, i32 %j) nounwind uwtable readnone {
entry:
  %add = add nsw i32 %i, 2
  %cmp = icmp eq i32 %j, 2
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %0 = shl i32 %add, 2
  br label %return

if.else:                                          ; preds = %entry
  %mul = mul i32 %add, 12
  br label %return

return:                                           ; preds = %if.else, %if.then
  %retval.0 = phi i32 [ %0, %if.then ], [ %mul, %if.else ]
  ret i32 %retval.0
}

define i32 @main() nounwind uwtable {
if.end:
  ret i32 0
}
