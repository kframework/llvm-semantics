; ModuleID = '/home/david/src/c-semantics/tests/unitTests/sizeofVLA.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [17 x i8] c"%d should be %d\0A\00", align 1
@.str1 = private unnamed_addr constant [9 x i8] c"n is %d\0A\00", align 1
@.str2 = private unnamed_addr constant [13 x i8] c"n is now %d\0A\00", align 1
@.str3 = private unnamed_addr constant [21 x i8] c"sizeof(int[n]) = %d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str, i64 0, i64 0), i32 5, i32 5) nounwind
  %call2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i64 0, i64 0), i32 2) nounwind
  %call4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str2, i64 0, i64 0), i32 3) nounwind
  %call10 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str, i64 0, i64 0), i32 5, i32 6) nounwind
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str2, i64 0, i64 0), i32 4) nounwind
  %call14 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str3, i64 0, i64 0), i32 16) nounwind
  %call15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str2, i64 0, i64 0), i32 5) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
