; ModuleID = '/home/david/src/c-semantics/tests/shouldPass/r06080503.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [12 x i8] c"b=%d, j=%d\0A\00", align 1
@.str1 = private unnamed_addr constant [18 x i8] c"b=%d, i=%d, j=%d\0A\00", align 1
@str = private unnamed_addr constant [7 x i8] c"test1:\00"
@str5 = private unnamed_addr constant [7 x i8] c"test2:\00"
@str6 = private unnamed_addr constant [7 x i8] c"test3:\00"

define i32 @f1() nounwind uwtable {
entry:
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i32 1, i32 1) nounwind
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str1, i64 0, i64 0), i32 0, i32 0, i32 1) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @f2() nounwind uwtable {
while.end:
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i32 1, i32 1) nounwind
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str1, i64 0, i64 0), i32 1, i32 0, i32 2) nounwind
  ret i32 0
}

define i32 @f3() nounwind uwtable {
entry:
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str1, i64 0, i64 0), i32 0, i32 0, i32 1) nounwind
  ret i32 0
}

define i32 @main() nounwind uwtable {
entry:
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([7 x i8]* @str, i64 0, i64 0))
  %call.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i32 1, i32 1) nounwind
  %call1.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str1, i64 0, i64 0), i32 0, i32 0, i32 1) nounwind
  %puts9 = tail call i32 @puts(i8* getelementptr inbounds ([7 x i8]* @str5, i64 0, i64 0))
  %call.i6 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i32 1, i32 1) nounwind
  %call1.i7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str1, i64 0, i64 0), i32 1, i32 0, i32 2) nounwind
  %puts10 = tail call i32 @puts(i8* getelementptr inbounds ([7 x i8]* @str6, i64 0, i64 0))
  %call.i8 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str1, i64 0, i64 0), i32 0, i32 0, i32 1) nounwind
  ret i32 0
}

declare i32 @puts(i8* nocapture) nounwind
