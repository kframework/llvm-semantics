; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2003-04-22-Switch.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@str = private unnamed_addr constant [2 x i8] c"C\00"
@str4 = private unnamed_addr constant [2 x i8] c"A\00"
@str5 = private unnamed_addr constant [2 x i8] c"B\00"
@str6 = private unnamed_addr constant [2 x i8] c"D\00"

define i32 @main() nounwind uwtable {
entry:
  br label %for.body

for.body:                                         ; preds = %func.exit, %entry
  %i.01 = phi i32 [ 0, %entry ], [ %inc, %func.exit ]
  switch i32 %i.01, label %sw.default.i [
    i32 8, label %sw.bb.i
    i32 0, label %sw.bb1.i
    i32 3, label %sw.bb1.i
    i32 2, label %sw.bb1.i
    i32 1, label %sw.bb4.i
    i32 7, label %sw.bb4.i
    i32 9, label %sw.bb4.i
  ]

sw.bb.i:                                          ; preds = %for.body
  %puts.i = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8]* @str, i64 0, i64 0)) nounwind
  br label %sw.bb1.i

sw.bb1.i:                                         ; preds = %sw.bb.i, %for.body, %for.body, %for.body
  %puts1.i = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8]* @str4, i64 0, i64 0)) nounwind
  br label %func.exit

sw.bb4.i:                                         ; preds = %for.body, %for.body, %for.body
  %puts2.i = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8]* @str5, i64 0, i64 0)) nounwind
  br label %func.exit

sw.default.i:                                     ; preds = %for.body
  %puts3.i = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8]* @str6, i64 0, i64 0)) nounwind
  br label %func.exit

func.exit:                                        ; preds = %sw.bb1.i, %sw.bb4.i, %sw.default.i
  %inc = add i32 %i.01, 1
  %exitcond = icmp eq i32 %inc, 10
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %func.exit
  ret i32 0
}

declare i32 @puts(i8* nocapture) nounwind
