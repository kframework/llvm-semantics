; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000071.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_8 = constant [2 x [5 x [3 x [1 x i32]]]] [[5 x [3 x [1 x i32]]] [[3 x [1 x i32]] [[1 x i32] [i32 -508159061], [1 x i32] [i32 -508159061], [1 x i32] [i32 -508159061]], [3 x [1 x i32]] [[1 x i32] [i32 -508159061], [1 x i32] [i32 -508159061], [1 x i32] [i32 -508159061]], [3 x [1 x i32]] [[1 x i32] [i32 -508159061], [1 x i32] [i32 -508159061], [1 x i32] [i32 -508159061]], [3 x [1 x i32]] [[1 x i32] [i32 -508159061], [1 x i32] [i32 -508159061], [1 x i32] [i32 -508159061]], [3 x [1 x i32]] [[1 x i32] [i32 -508159061], [1 x i32] [i32 -508159061], [1 x i32] [i32 -508159061]]], [5 x [3 x [1 x i32]]] [[3 x [1 x i32]] [[1 x i32] [i32 -508159061], [1 x i32] [i32 -508159061], [1 x i32] [i32 -508159061]], [3 x [1 x i32]] [[1 x i32] [i32 -508159061], [1 x i32] [i32 -508159061], [1 x i32] [i32 -508159061]], [3 x [1 x i32]] [[1 x i32] [i32 -508159061], [1 x i32] [i32 -508159061], [1 x i32] [i32 -508159061]], [3 x [1 x i32]] [[1 x i32] [i32 -508159061], [1 x i32] [i32 -508159061], [1 x i32] [i32 -508159061]], [3 x [1 x i32]] [[1 x i32] [i32 -508159061], [1 x i32] [i32 -508159061], [1 x i32] [i32 -508159061]]]], align 16
@g_15 = constant i32 1388262280, align 4
@g_14 = global i32* @g_15, align 8
@g_16 = global i32** @g_14, align 8
@g_17 = global i32** null, align 8
@g_19 = global i32 -1, align 4
@g_18 = global i32* @g_19, align 8
@.str = private unnamed_addr constant [31 x i8] c"checksum g_8[0][0][0][0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [31 x i8] c"checksum g_8[0][0][1][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [31 x i8] c"checksum g_8[0][0][2][0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [31 x i8] c"checksum g_8[0][1][0][0] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [31 x i8] c"checksum g_8[0][1][1][0] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [31 x i8] c"checksum g_8[0][1][2][0] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [31 x i8] c"checksum g_8[0][2][0][0] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [31 x i8] c"checksum g_8[0][2][1][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [31 x i8] c"checksum g_8[0][2][2][0] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [31 x i8] c"checksum g_8[0][3][0][0] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [31 x i8] c"checksum g_8[0][3][1][0] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [31 x i8] c"checksum g_8[0][3][2][0] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [31 x i8] c"checksum g_8[0][4][0][0] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [31 x i8] c"checksum g_8[0][4][1][0] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [31 x i8] c"checksum g_8[0][4][2][0] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [31 x i8] c"checksum g_8[1][0][0][0] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [31 x i8] c"checksum g_8[1][0][1][0] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [31 x i8] c"checksum g_8[1][0][2][0] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [31 x i8] c"checksum g_8[1][1][0][0] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [31 x i8] c"checksum g_8[1][1][1][0] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [31 x i8] c"checksum g_8[1][1][2][0] = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [31 x i8] c"checksum g_8[1][2][0][0] = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [31 x i8] c"checksum g_8[1][2][1][0] = %d\0A\00", align 1
@.str23 = private unnamed_addr constant [31 x i8] c"checksum g_8[1][2][2][0] = %d\0A\00", align 1
@.str24 = private unnamed_addr constant [31 x i8] c"checksum g_8[1][3][0][0] = %d\0A\00", align 1
@.str25 = private unnamed_addr constant [31 x i8] c"checksum g_8[1][3][1][0] = %d\0A\00", align 1
@.str26 = private unnamed_addr constant [31 x i8] c"checksum g_8[1][3][2][0] = %d\0A\00", align 1
@.str27 = private unnamed_addr constant [31 x i8] c"checksum g_8[1][4][0][0] = %d\0A\00", align 1
@.str28 = private unnamed_addr constant [31 x i8] c"checksum g_8[1][4][1][0] = %d\0A\00", align 1
@.str29 = private unnamed_addr constant [31 x i8] c"checksum g_8[1][4][2][0] = %d\0A\00", align 1
@.str30 = private unnamed_addr constant [20 x i8] c"checksum g_15 = %d\0A\00", align 1
@.str31 = private unnamed_addr constant [20 x i8] c"checksum g_19 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %tmp = volatile load i32** @g_14, align 8
  %tmp1 = volatile load i32*** @g_16, align 8
  volatile store i32* %tmp, i32** %tmp1, align 8
  %tmp2 = volatile load i32* @g_15, align 4
  store i32* null, i32** @g_18, align 8
  %tmp6 = load i32* @g_19, align 4
  %or = or i32 %tmp6, -524369867
  store i32 %or, i32* @g_19, align 4
  ret i32 %or
}

define i32* @func_9(i16 signext %p_10, i32 %p_11, i32* %p_12) nounwind uwtable readnone {
entry:
  ret i32* %p_12
}

define i32* @func_2(i32* %p_3) nounwind uwtable {
entry:
  store i32 0, i32* %p_3, align 4
  ret i32* getelementptr inbounds ([2 x [5 x [3 x [1 x i32]]]]* @g_8, i64 0, i64 1, i64 2, i64 0, i64 0)
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp.i = volatile load i32** @g_14, align 8
  %tmp1.i = volatile load i32*** @g_16, align 8
  volatile store i32* %tmp.i, i32** %tmp1.i, align 8
  %tmp2.i = volatile load i32* @g_15, align 4
  store i32* null, i32** @g_18, align 8
  %tmp6.i = load i32* @g_19, align 4
  %or.i = or i32 %tmp6.i, -524369867
  store i32 %or.i, i32* @g_19, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str, i64 0, i64 0), i32 -508159061) nounwind
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str1, i64 0, i64 0), i32 -508159061) nounwind
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str2, i64 0, i64 0), i32 -508159061) nounwind
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str3, i64 0, i64 0), i32 -508159061) nounwind
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str4, i64 0, i64 0), i32 -508159061) nounwind
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str5, i64 0, i64 0), i32 -508159061) nounwind
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str6, i64 0, i64 0), i32 -508159061) nounwind
  %call15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str7, i64 0, i64 0), i32 -508159061) nounwind
  %call17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str8, i64 0, i64 0), i32 -508159061) nounwind
  %call19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str9, i64 0, i64 0), i32 -508159061) nounwind
  %call21 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str10, i64 0, i64 0), i32 -508159061) nounwind
  %call23 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str11, i64 0, i64 0), i32 -508159061) nounwind
  %call25 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str12, i64 0, i64 0), i32 -508159061) nounwind
  %call27 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str13, i64 0, i64 0), i32 -508159061) nounwind
  %call29 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str14, i64 0, i64 0), i32 -508159061) nounwind
  %call31 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str15, i64 0, i64 0), i32 -508159061) nounwind
  %call33 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str16, i64 0, i64 0), i32 -508159061) nounwind
  %call35 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str17, i64 0, i64 0), i32 -508159061) nounwind
  %call37 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str18, i64 0, i64 0), i32 -508159061) nounwind
  %call39 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str19, i64 0, i64 0), i32 -508159061) nounwind
  %call41 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str20, i64 0, i64 0), i32 -508159061) nounwind
  %call43 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str21, i64 0, i64 0), i32 -508159061) nounwind
  %call45 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str22, i64 0, i64 0), i32 -508159061) nounwind
  %call47 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str23, i64 0, i64 0), i32 -508159061) nounwind
  %call49 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str24, i64 0, i64 0), i32 -508159061) nounwind
  %call51 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str25, i64 0, i64 0), i32 -508159061) nounwind
  %call53 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str26, i64 0, i64 0), i32 -508159061) nounwind
  %call55 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str27, i64 0, i64 0), i32 -508159061) nounwind
  %call57 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str28, i64 0, i64 0), i32 -508159061) nounwind
  %call59 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str29, i64 0, i64 0), i32 -508159061) nounwind
  %call61 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str21, i64 0, i64 0), i32 -508159061) nounwind
  %tmp62 = volatile load i32* @g_15, align 4
  %call63 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str30, i64 0, i64 0), i32 %tmp62) nounwind
  %tmp64 = load i32* @g_19, align 4
  %call65 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str31, i64 0, i64 0), i32 %tmp64) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
