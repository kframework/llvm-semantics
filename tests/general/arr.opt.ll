; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/arr.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@str = internal constant [3 x i8] c"OK\00"
@str1 = internal constant [3 x i8] c"OK\00"
@str2 = internal constant [3 x i8] c"OK\00"
@str3 = internal constant [3 x i8] c"OK\00"
@str4 = internal constant [3 x i8] c"OK\00"
@str6 = internal constant [3 x i8] c"OK\00"
@str8 = internal constant [3 x i8] c"OK\00"
@str10 = internal constant [3 x i8] c"OK\00"
@str12 = internal constant [3 x i8] c"OK\00"
@str14 = internal constant [3 x i8] c"OK\00"
@str16 = internal constant [3 x i8] c"OK\00"
@str18 = internal constant [3 x i8] c"OK\00"
@str20 = internal constant [3 x i8] c"OK\00"
@str21 = internal constant [3 x i8] c"OK\00"
@str22 = internal constant [3 x i8] c"OK\00"
@str23 = internal constant [3 x i8] c"OK\00"
@str24 = internal constant [3 x i8] c"OK\00"
@str26 = internal constant [3 x i8] c"OK\00"
@str28 = internal constant [3 x i8] c"OK\00"

define i32 @main() nounwind uwtable {
if.end199:
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8]* @str, i64 0, i64 0))
  %puts9 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8]* @str1, i64 0, i64 0))
  %puts10 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8]* @str2, i64 0, i64 0))
  %puts11 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8]* @str3, i64 0, i64 0))
  %puts12 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8]* @str4, i64 0, i64 0))
  %puts14 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8]* @str6, i64 0, i64 0))
  %puts16 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8]* @str8, i64 0, i64 0))
  %puts18 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8]* @str10, i64 0, i64 0))
  %puts20 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8]* @str12, i64 0, i64 0))
  %puts22 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8]* @str14, i64 0, i64 0))
  %puts24 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8]* @str16, i64 0, i64 0))
  %puts26 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8]* @str18, i64 0, i64 0))
  %puts28 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8]* @str20, i64 0, i64 0))
  %puts29 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8]* @str21, i64 0, i64 0))
  %puts30 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8]* @str22, i64 0, i64 0))
  %puts31 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8]* @str23, i64 0, i64 0))
  %puts32 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8]* @str24, i64 0, i64 0))
  %puts34 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8]* @str26, i64 0, i64 0))
  %puts36 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8]* @str28, i64 0, i64 0))
  ret i32 0
}

declare i32 @puts(i8* nocapture) nounwind
