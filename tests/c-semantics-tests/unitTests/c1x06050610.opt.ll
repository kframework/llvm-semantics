; ModuleID = '/home/david/src/c-semantics/tests/unitTests/c1x06050610.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str4 = private unnamed_addr constant [15 x i8] c"a[1][2] == %d\0A\00", align 1
@.str5 = private unnamed_addr constant [9 x i8] c"n == %d\0A\00", align 1
@str = private unnamed_addr constant [11 x i8] c"p == &a[0]\00"
@str6 = private unnamed_addr constant [11 x i8] c"p == &a[1]\00"

define i32 @main() nounwind uwtable {
entry:
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([11 x i8]* @str, i64 0, i64 0))
  %puts15 = tail call i32 @puts(i8* getelementptr inbounds ([11 x i8]* @str6, i64 0, i64 0))
  %call12 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str4, i64 0, i64 0), i32 99) nounwind
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str5, i64 0, i64 0), i32 1) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare i32 @puts(i8* nocapture) nounwind
