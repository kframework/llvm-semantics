; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20020206-2.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define void @foo(i32 %x) nounwind uwtable {
entry:
  switch i32 %x, label %if.then [
    i32 2048, label %if.end
    i32 2064, label %if.end
  ]

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry, %entry
  ret void
}

declare void @abort() noreturn

define i32 @main(i32 %argc, i8** nocapture %argv) noreturn nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %foo.exit, %entry
  %0 = phi i32 [ 0, %entry ], [ %inc, %foo.exit ]
  %cmp = icmp slt i32 %0, 2
  br i1 %cmp, label %cond.end, label %for.end

cond.end:                                         ; preds = %for.cond
  %tmp = shl i32 %0, 4
  %add6 = add i32 %tmp, 2048
  %conv9 = and i32 %add6, 65520
  switch i32 %conv9, label %if.then.i [
    i32 2048, label %foo.exit
    i32 2064, label %foo.exit
  ]

if.then.i:                                        ; preds = %cond.end
  tail call void @abort() noreturn nounwind
  unreachable

foo.exit:                                         ; preds = %cond.end, %cond.end
  %inc = add nsw i32 %0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn
