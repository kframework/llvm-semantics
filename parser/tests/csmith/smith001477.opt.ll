; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001477.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = constant [9 x i16] [i16 -72, i16 -72, i16 -72, i16 -72, i16 -72, i16 -72, i16 -72, i16 -72, i16 -72], align 16
@g_4 = global i32 1822608209, align 4
@.str = private unnamed_addr constant [22 x i8] c"checksum g_2[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_2[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_2[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_2[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_2[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_2[5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_2[6] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [22 x i8] c"checksum g_2[7] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [22 x i8] c"checksum g_2[8] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %tmp4 = load i32* @g_4, align 4
  %and = and i32 %tmp4, 65464
  store i32 %and, i32* @g_4, align 4
  ret i32 %and
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp4.i = load i32* @g_4, align 4
  %and.i = and i32 %tmp4.i, 65464
  store i32 %and.i, i32* @g_4, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 65464) nounwind
  %call4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i64 0, i64 0), i32 65464) nounwind
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i64 0, i64 0), i32 65464) nounwind
  %call10 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i64 0, i64 0), i32 65464) nounwind
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i64 0, i64 0), i32 65464) nounwind
  %call16 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i64 0, i64 0), i32 65464) nounwind
  %call19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i64 0, i64 0), i32 65464) nounwind
  %call22 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str7, i64 0, i64 0), i32 65464) nounwind
  %call25 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str8, i64 0, i64 0), i32 65464) nounwind
  %call28 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i64 0, i64 0), i32 65464) nounwind
  %tmp29 = load i32* @g_4, align 4
  %call30 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str9, i64 0, i64 0), i32 %tmp29) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
