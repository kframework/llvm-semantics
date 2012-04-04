; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020206-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @foo(i32 %x) nounwind uwtable {
entry:
  switch i32 %x, label %if.then [
    i32 2064, label %if.end
    i32 2048, label %if.end
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
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %foo.exit ]
  %cmp = icmp slt i32 %i.0, 2
  br i1 %cmp, label %cond.end, label %for.end

cond.end:                                         ; preds = %for.cond
  %shl2.pre = shl i32 %i.0, 4
  %phitmp = add i32 %shl2.pre, 2048
  %phitmp7 = and i32 %phitmp, 65520
  switch i32 %phitmp7, label %if.then.i [
    i32 2064, label %foo.exit
    i32 2048, label %foo.exit
  ]

if.then.i:                                        ; preds = %cond.end
  tail call void @abort() noreturn nounwind
  unreachable

foo.exit:                                         ; preds = %cond.end, %cond.end
  %inc = add nsw i32 %i.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn
