; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000600.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_5 = global i32 560462428, align 4
@g_6 = global i32 1, align 4
@g_9 = global [6 x i32] [i32 -2, i32 -2, i32 -2, i32 -2, i32 -2, i32 -2], align 16
@g_8 = global i32* getelementptr inbounds ([6 x i32]* @g_9, i64 0, i64 3), align 8
@g_7 = global i32** @g_8, align 8
@g_14 = global i32* @g_6, align 8
@g_13 = global i32** @g_14, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_9[0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_9[1] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_9[2] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_9[3] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_9[4] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [22 x i8] c"checksum g_9[5] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  store i32 6, i32* @g_5, align 4
  store i32 0, i32* @g_6, align 4
  %tmp = volatile load i32*** @g_13, align 8
  store i32* @g_6, i32** %tmp, align 8
  ret i32 1000475541
}

define i32* @func_2(i64 %p_3) nounwind uwtable {
entry:
  store i32 6, i32* @g_5, align 4
  store i32 0, i32* @g_6, align 4
  ret i32* @g_6
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  store i32 6, i32* @g_5, align 4
  store i32 0, i32* @g_6, align 4
  %tmp.i = volatile load i32*** @g_13, align 8
  store i32* @g_6, i32** %tmp.i, align 8
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 6) nounwind
  %tmp2 = load i32* @g_6, align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_9, i64 0, i64 0), align 16
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_9, i64 0, i64 1), align 4
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_9, i64 0, i64 2), align 8
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i64 0, i64 0), i32 %tmp8) nounwind
  %tmp10 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_9, i64 0, i64 3), align 4
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i64 0, i64 0), i32 %tmp10) nounwind
  %tmp12 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_9, i64 0, i64 4), align 16
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i64 0, i64 0), i32 %tmp12) nounwind
  %tmp14 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_9, i64 0, i64 5), align 4
  %call15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str7, i64 0, i64 0), i32 %tmp14) nounwind
  %tmp16 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_9, i64 0, i64 3), align 4
  %call17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i64 0, i64 0), i32 %tmp16) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
