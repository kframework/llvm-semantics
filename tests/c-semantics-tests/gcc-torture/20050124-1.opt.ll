; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20050124-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo(i32 %i, i32 %j) nounwind uwtable readnone {
entry:
  %add = add nsw i32 %i, 1
  %tobool = icmp eq i32 %j, 0
  br i1 %tobool, label %if.end5, label %if.then

if.then:                                          ; preds = %entry
  %cmp = icmp sgt i32 %add, 0
  br i1 %cmp, label %if.then1, label %if.else

if.then1:                                         ; preds = %if.then
  %inc = add nsw i32 %i, 2
  br label %if.end5

if.else:                                          ; preds = %if.then
  %cmp2 = icmp slt i32 %add, 0
  %i.add = select i1 %cmp2, i32 %i, i32 %add
  ret i32 %i.add

if.end5:                                          ; preds = %entry, %if.then1
  %k.0 = phi i32 [ %inc, %if.then1 ], [ %add, %entry ]
  ret i32 %k.0
}

define i32 @main() nounwind uwtable {
if.end28:
  ret i32 0
}
