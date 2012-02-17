; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000386.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -76084617, align 4
@g_8 = global i32* @g_2, align 8
@g_7 = global i32** @g_8, align 8
@g_13 = global [9 x [1 x [1 x [1 x i32]]]] [[1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -1]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -1]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -1]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -1]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -1]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -1]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -1]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -1]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -1]]]], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [32 x i8] c"checksum g_13[0][0][0][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [32 x i8] c"checksum g_13[1][0][0][0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [32 x i8] c"checksum g_13[2][0][0][0] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [32 x i8] c"checksum g_13[3][0][0][0] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [32 x i8] c"checksum g_13[4][0][0][0] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [32 x i8] c"checksum g_13[5][0][0][0] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [32 x i8] c"checksum g_13[6][0][0][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [32 x i8] c"checksum g_13[7][0][0][0] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [32 x i8] c"checksum g_13[8][0][0][0] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
for.end32:
  store i32 27, i32* @g_2, align 4
  ret i32 27
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  store i32 27, i32* @g_2, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 27) nounwind
  %tmp2 = load i32* getelementptr inbounds ([9 x [1 x [1 x [1 x i32]]]]* @g_13, i64 0, i64 0, i64 0, i64 0, i64 0), align 16
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* getelementptr inbounds ([9 x [1 x [1 x [1 x i32]]]]* @g_13, i64 0, i64 1, i64 0, i64 0, i64 0), align 4
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = load i32* getelementptr inbounds ([9 x [1 x [1 x [1 x i32]]]]* @g_13, i64 0, i64 2, i64 0, i64 0, i64 0), align 8
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = load i32* getelementptr inbounds ([9 x [1 x [1 x [1 x i32]]]]* @g_13, i64 0, i64 3, i64 0, i64 0, i64 0), align 4
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str4, i64 0, i64 0), i32 %tmp8) nounwind
  %tmp10 = load i32* getelementptr inbounds ([9 x [1 x [1 x [1 x i32]]]]* @g_13, i64 0, i64 4, i64 0, i64 0, i64 0), align 16
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str5, i64 0, i64 0), i32 %tmp10) nounwind
  %tmp12 = load i32* getelementptr inbounds ([9 x [1 x [1 x [1 x i32]]]]* @g_13, i64 0, i64 5, i64 0, i64 0, i64 0), align 4
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str6, i64 0, i64 0), i32 %tmp12) nounwind
  %tmp14 = load i32* getelementptr inbounds ([9 x [1 x [1 x [1 x i32]]]]* @g_13, i64 0, i64 6, i64 0, i64 0, i64 0), align 8
  %call15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str7, i64 0, i64 0), i32 %tmp14) nounwind
  %tmp16 = load i32* getelementptr inbounds ([9 x [1 x [1 x [1 x i32]]]]* @g_13, i64 0, i64 7, i64 0, i64 0, i64 0), align 4
  %call17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str8, i64 0, i64 0), i32 %tmp16) nounwind
  %tmp18 = load i32* getelementptr inbounds ([9 x [1 x [1 x [1 x i32]]]]* @g_13, i64 0, i64 8, i64 0, i64 0, i64 0), align 16
  %call19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str9, i64 0, i64 0), i32 %tmp18) nounwind
  %tmp20 = load i32* getelementptr inbounds ([9 x [1 x [1 x [1 x i32]]]]* @g_13, i64 0, i64 7, i64 0, i64 0, i64 0), align 4
  %call21 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str8, i64 0, i64 0), i32 %tmp20) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
