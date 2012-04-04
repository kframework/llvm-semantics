; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2006-01-29-SimpleIndirectCall.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@str = private unnamed_addr constant [14 x i8] c"Hello, world!\00"
@str2 = private unnamed_addr constant [16 x i8] c"Goodbye, world!\00"

define void @hello() nounwind uwtable {
entry:
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([14 x i8]* @str, i64 0, i64 0))
  ret void
}

define void @goodbye() nounwind uwtable {
entry:
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([16 x i8]* @str2, i64 0, i64 0))
  ret void
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %cmp = icmp sgt i32 %argc, 1
  %cond = select i1 %cmp, void (...)* bitcast (void ()* @hello to void (...)*), void (...)* bitcast (void ()* @goodbye to void (...)*)
  tail call void (...)* %cond() nounwind
  ret i32 0
}

declare i32 @puts(i8* nocapture) nounwind
