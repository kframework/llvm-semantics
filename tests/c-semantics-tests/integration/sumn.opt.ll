; ModuleID = '/home/david/src/c-semantics/tests/integration/sumn.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"10\00", align 1
@.str1 = private unnamed_addr constant [13 x i8] c"sum(%d)==%d\0A\00", align 1

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %call.i = tail call i64 @strtol(i8* nocapture getelementptr inbounds ([3 x i8]* @.str, i64 0, i64 0), i8** null, i32 10) nounwind
  %conv.i = trunc i64 %call.i to i32
  %cmp1.i = icmp slt i32 %conv.i, 1
  br i1 %cmp1.i, label %sum.exit, label %while.body.lr.ph.i

while.body.lr.ph.i:                               ; preds = %entry
  %0 = shl i32 %conv.i, 1
  %1 = add i32 %conv.i, -1
  %2 = zext i32 %1 to i33
  %3 = add i32 %conv.i, -2
  %4 = zext i32 %3 to i33
  %5 = mul i33 %2, %4
  %6 = lshr i33 %5, 1
  %7 = trunc i33 %6 to i32
  %8 = add i32 %0, -1
  %9 = add i32 %8, %7
  br label %sum.exit

sum.exit:                                         ; preds = %entry, %while.body.lr.ph.i
  %sum.0.lcssa.i = phi i32 [ %9, %while.body.lr.ph.i ], [ 0, %entry ]
  %call2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str1, i64 0, i64 0), i32 %conv.i, i32 %sum.0.lcssa.i) nounwind
  ret i32 %sum.0.lcssa.i
}

define i32 @sum(i32 %n) nounwind uwtable readnone {
entry:
  %cmp1 = icmp slt i32 %n, 1
  br i1 %cmp1, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %entry
  %0 = shl i32 %n, 1
  %1 = add i32 %n, -1
  %2 = zext i32 %1 to i33
  %3 = add i32 %n, -2
  %4 = zext i32 %3 to i33
  %5 = mul i33 %2, %4
  %6 = lshr i33 %5, 1
  %7 = trunc i33 %6 to i32
  %8 = add i32 %0, %7
  %9 = add i32 %8, -1
  br label %while.end

while.end:                                        ; preds = %while.body.lr.ph, %entry
  %sum.0.lcssa = phi i32 [ %9, %while.body.lr.ph ], [ 0, %entry ]
  ret i32 %sum.0.lcssa
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare i64 @strtol(i8*, i8** nocapture, i32) nounwind
