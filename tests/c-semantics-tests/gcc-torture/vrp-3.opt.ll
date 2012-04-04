; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/vrp-3.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i32 %a) nounwind uwtable readnone {
entry:
  %a.off = add i32 %a, 14
  %0 = icmp ult i32 %a.off, 26
  br i1 %0, label %if.then2, label %return

if.then2:                                         ; preds = %entry
  %cmp3 = icmp sgt i32 %a, 0
  %sub = sub nsw i32 0, %a
  %cond = select i1 %cmp3, i32 %a, i32 %sub
  %not.cmp4 = icmp ne i32 %cond, 2
  %. = zext i1 %not.cmp4 to i32
  br label %return

return:                                           ; preds = %entry, %if.then2
  %retval.0 = phi i32 [ %., %if.then2 ], [ 1, %entry ]
  ret i32 %retval.0
}

define i32 @main(i32 %argc, i8** nocapture %argv) noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn
