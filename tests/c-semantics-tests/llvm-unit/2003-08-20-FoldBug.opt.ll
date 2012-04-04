; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2003-08-20-FoldBug.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@str = private unnamed_addr constant [7 x i8] c"All ok\00"

define i32 @foo(i32 %x) nounwind uwtable {
entry:
  %and = and i32 %x, -2130706433
  %cmp = icmp eq i32 %and, -2147418114
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn

define i32 @main() nounwind uwtable {
entry:
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([7 x i8]* @str, i64 0, i64 0))
  ret i32 0
}

declare i32 @puts(i8* nocapture) nounwind
