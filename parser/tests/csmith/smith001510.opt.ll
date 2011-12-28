; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001510.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global [2 x [4 x i32]] [[4 x i32] [i32 -10, i32 -10, i32 -10, i32 -10], [4 x i32] [i32 -10, i32 -10, i32 -10, i32 -10]], align 16
@g_3 = global i32* getelementptr inbounds ([2 x [4 x i32]]* @g_4, i64 0, i64 1, i64 3), align 8
@.str = private unnamed_addr constant [25 x i8] c"checksum g_4[0][0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_4[0][1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"checksum g_4[0][2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [25 x i8] c"checksum g_4[0][3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"checksum g_4[1][0] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"checksum g_4[1][1] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"checksum g_4[1][2] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c"checksum g_4[1][3] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i8 @func_1() nounwind uwtable {
entry:
  %tmp1 = volatile load i32** @g_3, align 8
  %tmp2 = load i32* %tmp1, align 4
  %and = and i32 %tmp2, 2123068157
  store i32 %and, i32* %tmp1, align 4
  ret i8 -3
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp1.i = volatile load i32** @g_3, align 8
  %tmp2.i = load i32* %tmp1.i, align 4
  %and.i = and i32 %tmp2.i, 2123068157
  store i32 %and.i, i32* %tmp1.i, align 4
  %tmp = load i32* getelementptr inbounds ([2 x [4 x i32]]* @g_4, i64 0, i64 0, i64 0), align 16
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* getelementptr inbounds ([2 x [4 x i32]]* @g_4, i64 0, i64 0, i64 1), align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* getelementptr inbounds ([2 x [4 x i32]]* @g_4, i64 0, i64 0, i64 2), align 8
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = load i32* getelementptr inbounds ([2 x [4 x i32]]* @g_4, i64 0, i64 0, i64 3), align 4
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = load i32* getelementptr inbounds ([2 x [4 x i32]]* @g_4, i64 0, i64 1, i64 0), align 16
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i64 0, i64 0), i32 %tmp8) nounwind
  %tmp10 = load i32* getelementptr inbounds ([2 x [4 x i32]]* @g_4, i64 0, i64 1, i64 1), align 4
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i64 0, i64 0), i32 %tmp10) nounwind
  %tmp12 = load i32* getelementptr inbounds ([2 x [4 x i32]]* @g_4, i64 0, i64 1, i64 2), align 8
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i64 0, i64 0), i32 %tmp12) nounwind
  %tmp14 = load i32* getelementptr inbounds ([2 x [4 x i32]]* @g_4, i64 0, i64 1, i64 3), align 4
  %call15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i64 0, i64 0), i32 %tmp14) nounwind
  %tmp16 = load i32* getelementptr inbounds ([2 x [4 x i32]]* @g_4, i64 0, i64 1, i64 3), align 4
  %call17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i64 0, i64 0), i32 %tmp16) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
