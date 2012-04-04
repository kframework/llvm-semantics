; ModuleID = '/home/david/src/c-semantics/tests/unitTests/arr.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@str31 = private unnamed_addr constant [3 x i8] c"OK\00"

define i32 @main() nounwind uwtable {
entry:
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8]* @str31, i64 0, i64 0))
  %puts127 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8]* @str31, i64 0, i64 0))
  %puts128 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8]* @str31, i64 0, i64 0))
  %puts129 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8]* @str31, i64 0, i64 0))
  %puts130 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8]* @str31, i64 0, i64 0))
  %puts131 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8]* @str31, i64 0, i64 0))
  %puts132 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8]* @str31, i64 0, i64 0))
  %puts133 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8]* @str31, i64 0, i64 0))
  %puts134 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8]* @str31, i64 0, i64 0))
  %puts135 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8]* @str31, i64 0, i64 0))
  %puts136 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8]* @str31, i64 0, i64 0))
  %puts137 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8]* @str31, i64 0, i64 0))
  %puts138 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8]* @str31, i64 0, i64 0))
  %puts139 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8]* @str31, i64 0, i64 0))
  %puts140 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8]* @str31, i64 0, i64 0))
  %puts141 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8]* @str31, i64 0, i64 0))
  %puts142 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8]* @str31, i64 0, i64 0))
  %puts143 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8]* @str31, i64 0, i64 0))
  %puts144 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8]* @str31, i64 0, i64 0))
  ret i32 0
}

declare i32 @puts(i8* nocapture) nounwind
