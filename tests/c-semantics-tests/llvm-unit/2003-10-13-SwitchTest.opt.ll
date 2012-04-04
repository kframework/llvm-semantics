; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2003-10-13-SwitchTest.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@str = private unnamed_addr constant [5 x i8] c"GOOD\00"
@str2 = private unnamed_addr constant [4 x i8] c"BAD\00"

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  switch i32 %argc, label %sw.default [
    i32 100, label %sw.bb
    i32 101, label %sw.bb
    i32 1023, label %sw.bb
  ]

sw.default:                                       ; preds = %entry
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([5 x i8]* @str, i64 0, i64 0))
  br label %return

sw.bb:                                            ; preds = %entry, %entry, %entry
  %puts2 = tail call i32 @puts(i8* getelementptr inbounds ([4 x i8]* @str2, i64 0, i64 0))
  br label %return

return:                                           ; preds = %sw.bb, %sw.default
  %retval.0 = phi i32 [ 0, %sw.default ], [ 1, %sw.bb ]
  ret i32 %retval.0
}

declare i32 @puts(i8* nocapture) nounwind
