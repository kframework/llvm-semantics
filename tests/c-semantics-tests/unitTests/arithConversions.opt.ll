; ModuleID = '/home/david/src/c-semantics/tests/unitTests/arithConversions.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str2 = private unnamed_addr constant [10 x i8] c"Good in 1\00", align 1
@.str6 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str7 = private unnamed_addr constant [13 x i8] c"Good in 3_a\0A\00", align 1
@.str10 = private unnamed_addr constant [13 x i8] c"Good in 3_b\0A\00", align 1
@str = private unnamed_addr constant [17 x i8] c"Good answer in 2\00"

define i32 @test1() nounwind uwtable {
entry:
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([10 x i8]* @.str2, i64 0, i64 0))
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @test2() nounwind uwtable {
entry:
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([17 x i8]* @str, i64 0, i64 0))
  ret i32 0
}

define i32 @test3() nounwind uwtable {
entry:
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str6, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @.str7, i64 0, i64 0)) nounwind
  %call4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str6, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @.str10, i64 0, i64 0)) nounwind
  ret i32 0
}

define i32 @main() nounwind uwtable {
entry:
  %puts.i = tail call i32 @puts(i8* getelementptr inbounds ([10 x i8]* @.str2, i64 0, i64 0)) nounwind
  %puts.i3 = tail call i32 @puts(i8* getelementptr inbounds ([17 x i8]* @str, i64 0, i64 0)) nounwind
  %call.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str6, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @.str7, i64 0, i64 0)) nounwind
  %call4.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str6, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @.str10, i64 0, i64 0)) nounwind
  ret i32 0
}

declare i32 @puts(i8* nocapture) nounwind
