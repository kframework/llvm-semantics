; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/vrp-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i32 %a) nounwind uwtable readnone {
entry:
  %cmp = icmp eq i32 %a, 2
  br i1 %cmp, label %return, label %if.then

if.then:                                          ; preds = %entry
  %sub = sub nsw i32 0, %a
  %cmp3 = icmp eq i32 %sub, 2
  br i1 %cmp3, label %return, label %if.end

if.end:                                           ; preds = %if.then
  br label %return

return:                                           ; preds = %entry, %if.then, %if.end
  %0 = phi i32 [ 1, %if.end ], [ 0, %if.then ], [ 1, %entry ]
  ret i32 %0
}

define i32 @main(i32 %argc, i8** nocapture %argv) noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn
