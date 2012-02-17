; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001460.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i32* null, align 8
@g_6 = global [3 x [3 x i32]] [[3 x i32] [i32 -6, i32 -6, i32 -6], [3 x i32] [i32 -6, i32 -6, i32 -6], [3 x i32] [i32 -6, i32 -6, i32 -6]], align 16
@.str = private unnamed_addr constant [25 x i8] c"checksum g_6[0][0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_6[0][1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"checksum g_6[0][2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [25 x i8] c"checksum g_6[1][0] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"checksum g_6[1][1] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"checksum g_6[1][2] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"checksum g_6[2][0] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c"checksum g_6[2][1] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [25 x i8] c"checksum g_6[2][2] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %tmp2 = load i32* getelementptr inbounds ([3 x [3 x i32]]* @g_6, i64 0, i64 0, i64 1), align 4
  %and = and i32 %tmp2, 116
  store i32 %and, i32* getelementptr inbounds ([3 x [3 x i32]]* @g_6, i64 0, i64 0, i64 1), align 4
  %conv81 = zext i32 %and to i64
  ret i64 %conv81
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp2.i = load i32* getelementptr inbounds ([3 x [3 x i32]]* @g_6, i64 0, i64 0, i64 1), align 4
  %and.i = and i32 %tmp2.i, 116
  store i32 %and.i, i32* getelementptr inbounds ([3 x [3 x i32]]* @g_6, i64 0, i64 0, i64 1), align 4
  %tmp = load i32* getelementptr inbounds ([3 x [3 x i32]]* @g_6, i64 0, i64 0, i64 0), align 16
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* getelementptr inbounds ([3 x [3 x i32]]* @g_6, i64 0, i64 0, i64 1), align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* getelementptr inbounds ([3 x [3 x i32]]* @g_6, i64 0, i64 0, i64 2), align 8
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = load i32* getelementptr inbounds ([3 x [3 x i32]]* @g_6, i64 0, i64 1, i64 0), align 4
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = load i32* getelementptr inbounds ([3 x [3 x i32]]* @g_6, i64 0, i64 1, i64 1), align 4
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i64 0, i64 0), i32 %tmp8) nounwind
  %tmp10 = load i32* getelementptr inbounds ([3 x [3 x i32]]* @g_6, i64 0, i64 1, i64 2), align 4
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i64 0, i64 0), i32 %tmp10) nounwind
  %tmp12 = load i32* getelementptr inbounds ([3 x [3 x i32]]* @g_6, i64 0, i64 2, i64 0), align 8
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i64 0, i64 0), i32 %tmp12) nounwind
  %tmp14 = load i32* getelementptr inbounds ([3 x [3 x i32]]* @g_6, i64 0, i64 2, i64 1), align 4
  %call15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i64 0, i64 0), i32 %tmp14) nounwind
  %tmp16 = load i32* getelementptr inbounds ([3 x [3 x i32]]* @g_6, i64 0, i64 2, i64 2), align 8
  %call17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str8, i64 0, i64 0), i32 %tmp16) nounwind
  %tmp18 = load i32* getelementptr inbounds ([3 x [3 x i32]]* @g_6, i64 0, i64 0, i64 1), align 4
  %call19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i64 0, i64 0), i32 %tmp18) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
