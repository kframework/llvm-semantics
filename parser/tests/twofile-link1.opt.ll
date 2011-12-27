; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/twofile-link1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@z = global i32 5, align 4
@q = global i32 3, align 4
@c = global i32 32, align 4
@r = global i32 77, align 4
@.str = private unnamed_addr constant [11 x i8] c"1zza = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [9 x i8] c"1z = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [9 x i8] c"1w = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [9 x i8] c"1q = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [9 x i8] c"1r = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [9 x i8] c"1v = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [11 x i8] c"1zzb = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [12 x i8] c"1g(5) = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [13 x i8] c"f(2, 3)==%d\0A\00", align 1
@str = internal constant [20 x i8] c"f(2, 3) should be 7\00"

define i32 @main() nounwind uwtable {
entry:
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str, i64 0, i64 0), i32 0) nounwind
  %tmp1 = load i32* @z, align 4
  %call2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i64 0, i64 0), i32 %tmp1) nounwind
  %call4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str2, i64 0, i64 0), i32 7) nounwind
  %call6 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str3, i64 0, i64 0), i32 4) nounwind
  %tmp7 = load i32* @r, align 4
  %call8 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str4, i64 0, i64 0), i32 %tmp7) nounwind
  %call10 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str5, i64 0, i64 0), i32 15) nounwind
  %call12 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str6, i64 0, i64 0), i32 5) nounwind
  %call14 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str7, i64 0, i64 0), i32 5) nounwind
  %call15 = tail call i32 @f(i32 2, i32 3) nounwind
  %call16 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str8, i64 0, i64 0), i32 %call15) nounwind
  %call17 = tail call i32 @f(i32 2, i32 3) nounwind
  %call18 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str8, i64 0, i64 0), i32 %call17) nounwind
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([20 x i8]* @str, i64 0, i64 0))
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare i32 @f(i32, i32)

declare i32 @puts(i8* nocapture) nounwind
