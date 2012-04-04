; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr29798.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %if.end4, %entry
  %beta.0 = phi double [ 0.000000e+00, %entry ], [ %beta.1, %if.end4 ]
  %oldrho.0 = phi double [ undef, %entry ], [ %mul, %if.end4 ]
  %i.0 = phi i32 [ 1, %entry ], [ %inc, %if.end4 ]
  %work.0 = phi double [ 1.000000e+00, %entry ], [ %div5, %if.end4 ]
  %cmp = icmp slt i32 %i.0, 3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %mul = fmul double %work.0, %work.0
  %cmp1 = icmp eq i32 %i.0, 1
  br i1 %cmp1, label %if.end, label %if.then

if.then:                                          ; preds = %for.body
  %div = fdiv double %mul, %oldrho.0
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %beta.1 = phi double [ %div, %if.then ], [ %beta.0, %for.body ]
  %cmp2 = fcmp oeq double %beta.1, 1.000000e+00
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  %div5 = fmul double %work.0, 5.000000e-01
  %inc = add nsw i32 %i.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}

declare void @abort() noreturn nounwind
