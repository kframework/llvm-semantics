; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000598.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global [7 x [5 x [1 x i32]]] [[5 x [1 x i32]] [[1 x i32] [i32 1067932697], [1 x i32] [i32 1067932697], [1 x i32] [i32 1067932697], [1 x i32] [i32 1067932697], [1 x i32] [i32 1067932697]], [5 x [1 x i32]] [[1 x i32] [i32 1067932697], [1 x i32] [i32 1067932697], [1 x i32] [i32 1067932697], [1 x i32] [i32 1067932697], [1 x i32] [i32 1067932697]], [5 x [1 x i32]] [[1 x i32] [i32 1067932697], [1 x i32] [i32 1067932697], [1 x i32] [i32 1067932697], [1 x i32] [i32 1067932697], [1 x i32] [i32 1067932697]], [5 x [1 x i32]] [[1 x i32] [i32 1067932697], [1 x i32] [i32 1067932697], [1 x i32] [i32 1067932697], [1 x i32] [i32 1067932697], [1 x i32] [i32 1067932697]], [5 x [1 x i32]] [[1 x i32] [i32 1067932697], [1 x i32] [i32 1067932697], [1 x i32] [i32 1067932697], [1 x i32] [i32 1067932697], [1 x i32] [i32 1067932697]], [5 x [1 x i32]] [[1 x i32] [i32 1067932697], [1 x i32] [i32 1067932697], [1 x i32] [i32 1067932697], [1 x i32] [i32 1067932697], [1 x i32] [i32 1067932697]], [5 x [1 x i32]] [[1 x i32] [i32 1067932697], [1 x i32] [i32 1067932697], [1 x i32] [i32 1067932697], [1 x i32] [i32 1067932697], [1 x i32] [i32 1067932697]]], align 16
@g_3 = global i32* null, align 8
@g_5 = global i32 -1859874334, align 4
@.str = private unnamed_addr constant [28 x i8] c"checksum g_2[0][0][0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [28 x i8] c"checksum g_2[0][1][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [28 x i8] c"checksum g_2[0][2][0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [28 x i8] c"checksum g_2[0][3][0] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [28 x i8] c"checksum g_2[0][4][0] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [28 x i8] c"checksum g_2[1][0][0] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [28 x i8] c"checksum g_2[1][1][0] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [28 x i8] c"checksum g_2[1][2][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [28 x i8] c"checksum g_2[1][3][0] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [28 x i8] c"checksum g_2[1][4][0] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [28 x i8] c"checksum g_2[2][0][0] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [28 x i8] c"checksum g_2[2][1][0] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [28 x i8] c"checksum g_2[2][2][0] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [28 x i8] c"checksum g_2[2][3][0] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [28 x i8] c"checksum g_2[2][4][0] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [28 x i8] c"checksum g_2[3][0][0] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [28 x i8] c"checksum g_2[3][1][0] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [28 x i8] c"checksum g_2[3][2][0] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [28 x i8] c"checksum g_2[3][3][0] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [28 x i8] c"checksum g_2[3][4][0] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [28 x i8] c"checksum g_2[4][0][0] = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [28 x i8] c"checksum g_2[4][1][0] = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [28 x i8] c"checksum g_2[4][2][0] = %d\0A\00", align 1
@.str23 = private unnamed_addr constant [28 x i8] c"checksum g_2[4][3][0] = %d\0A\00", align 1
@.str24 = private unnamed_addr constant [28 x i8] c"checksum g_2[4][4][0] = %d\0A\00", align 1
@.str25 = private unnamed_addr constant [28 x i8] c"checksum g_2[5][0][0] = %d\0A\00", align 1
@.str26 = private unnamed_addr constant [28 x i8] c"checksum g_2[5][1][0] = %d\0A\00", align 1
@.str27 = private unnamed_addr constant [28 x i8] c"checksum g_2[5][2][0] = %d\0A\00", align 1
@.str28 = private unnamed_addr constant [28 x i8] c"checksum g_2[5][3][0] = %d\0A\00", align 1
@.str29 = private unnamed_addr constant [28 x i8] c"checksum g_2[5][4][0] = %d\0A\00", align 1
@.str30 = private unnamed_addr constant [28 x i8] c"checksum g_2[6][0][0] = %d\0A\00", align 1
@.str31 = private unnamed_addr constant [28 x i8] c"checksum g_2[6][1][0] = %d\0A\00", align 1
@.str32 = private unnamed_addr constant [28 x i8] c"checksum g_2[6][2][0] = %d\0A\00", align 1
@.str33 = private unnamed_addr constant [28 x i8] c"checksum g_2[6][3][0] = %d\0A\00", align 1
@.str34 = private unnamed_addr constant [28 x i8] c"checksum g_2[6][4][0] = %d\0A\00", align 1
@.str35 = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
entry:
  %tmp = load i32* getelementptr inbounds ([7 x [5 x [1 x i32]]]* @g_2, i64 0, i64 1, i64 4, i64 0), align 4
  store i32 %tmp, i32* @g_5, align 4
  %tmp2 = load i32* getelementptr inbounds ([7 x [5 x [1 x i32]]]* @g_2, i64 0, i64 2, i64 4, i64 0), align 8
  %conv = trunc i32 %tmp2 to i8
  ret i8 %conv
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp.i = load i32* getelementptr inbounds ([7 x [5 x [1 x i32]]]* @g_2, i64 0, i64 1, i64 4, i64 0), align 4
  store i32 %tmp.i, i32* @g_5, align 4
  %tmp = load i32* getelementptr inbounds ([7 x [5 x [1 x i32]]]* @g_2, i64 0, i64 0, i64 0, i64 0), align 16
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* getelementptr inbounds ([7 x [5 x [1 x i32]]]* @g_2, i64 0, i64 0, i64 1, i64 0), align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* getelementptr inbounds ([7 x [5 x [1 x i32]]]* @g_2, i64 0, i64 0, i64 2, i64 0), align 8
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = load i32* getelementptr inbounds ([7 x [5 x [1 x i32]]]* @g_2, i64 0, i64 0, i64 3, i64 0), align 4
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = load i32* getelementptr inbounds ([7 x [5 x [1 x i32]]]* @g_2, i64 0, i64 0, i64 4, i64 0), align 16
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str4, i64 0, i64 0), i32 %tmp8) nounwind
  %tmp10 = load i32* getelementptr inbounds ([7 x [5 x [1 x i32]]]* @g_2, i64 0, i64 1, i64 0, i64 0), align 4
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str5, i64 0, i64 0), i32 %tmp10) nounwind
  %tmp12 = load i32* getelementptr inbounds ([7 x [5 x [1 x i32]]]* @g_2, i64 0, i64 1, i64 1, i64 0), align 4
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str6, i64 0, i64 0), i32 %tmp12) nounwind
  %tmp14 = load i32* getelementptr inbounds ([7 x [5 x [1 x i32]]]* @g_2, i64 0, i64 1, i64 2, i64 0), align 4
  %call15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str7, i64 0, i64 0), i32 %tmp14) nounwind
  %tmp16 = load i32* getelementptr inbounds ([7 x [5 x [1 x i32]]]* @g_2, i64 0, i64 1, i64 3, i64 0), align 4
  %call17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str8, i64 0, i64 0), i32 %tmp16) nounwind
  %tmp18 = load i32* getelementptr inbounds ([7 x [5 x [1 x i32]]]* @g_2, i64 0, i64 1, i64 4, i64 0), align 4
  %call19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str9, i64 0, i64 0), i32 %tmp18) nounwind
  %tmp20 = load i32* getelementptr inbounds ([7 x [5 x [1 x i32]]]* @g_2, i64 0, i64 2, i64 0, i64 0), align 8
  %call21 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str10, i64 0, i64 0), i32 %tmp20) nounwind
  %tmp22 = load i32* getelementptr inbounds ([7 x [5 x [1 x i32]]]* @g_2, i64 0, i64 2, i64 1, i64 0), align 4
  %call23 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str11, i64 0, i64 0), i32 %tmp22) nounwind
  %tmp24 = load i32* getelementptr inbounds ([7 x [5 x [1 x i32]]]* @g_2, i64 0, i64 2, i64 2, i64 0), align 8
  %call25 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str12, i64 0, i64 0), i32 %tmp24) nounwind
  %tmp26 = load i32* getelementptr inbounds ([7 x [5 x [1 x i32]]]* @g_2, i64 0, i64 2, i64 3, i64 0), align 4
  %call27 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str13, i64 0, i64 0), i32 %tmp26) nounwind
  %tmp28 = load i32* getelementptr inbounds ([7 x [5 x [1 x i32]]]* @g_2, i64 0, i64 2, i64 4, i64 0), align 8
  %call29 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str14, i64 0, i64 0), i32 %tmp28) nounwind
  %tmp30 = load i32* getelementptr inbounds ([7 x [5 x [1 x i32]]]* @g_2, i64 0, i64 3, i64 0, i64 0), align 4
  %call31 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str15, i64 0, i64 0), i32 %tmp30) nounwind
  %tmp32 = load i32* getelementptr inbounds ([7 x [5 x [1 x i32]]]* @g_2, i64 0, i64 3, i64 1, i64 0), align 4
  %call33 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str16, i64 0, i64 0), i32 %tmp32) nounwind
  %tmp34 = load i32* getelementptr inbounds ([7 x [5 x [1 x i32]]]* @g_2, i64 0, i64 3, i64 2, i64 0), align 4
  %call35 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str17, i64 0, i64 0), i32 %tmp34) nounwind
  %tmp36 = load i32* getelementptr inbounds ([7 x [5 x [1 x i32]]]* @g_2, i64 0, i64 3, i64 3, i64 0), align 4
  %call37 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str18, i64 0, i64 0), i32 %tmp36) nounwind
  %tmp38 = load i32* getelementptr inbounds ([7 x [5 x [1 x i32]]]* @g_2, i64 0, i64 3, i64 4, i64 0), align 4
  %call39 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str19, i64 0, i64 0), i32 %tmp38) nounwind
  %tmp40 = load i32* getelementptr inbounds ([7 x [5 x [1 x i32]]]* @g_2, i64 0, i64 4, i64 0, i64 0), align 16
  %call41 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str20, i64 0, i64 0), i32 %tmp40) nounwind
  %tmp42 = load i32* getelementptr inbounds ([7 x [5 x [1 x i32]]]* @g_2, i64 0, i64 4, i64 1, i64 0), align 4
  %call43 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str21, i64 0, i64 0), i32 %tmp42) nounwind
  %tmp44 = load i32* getelementptr inbounds ([7 x [5 x [1 x i32]]]* @g_2, i64 0, i64 4, i64 2, i64 0), align 8
  %call45 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str22, i64 0, i64 0), i32 %tmp44) nounwind
  %tmp46 = load i32* getelementptr inbounds ([7 x [5 x [1 x i32]]]* @g_2, i64 0, i64 4, i64 3, i64 0), align 4
  %call47 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str23, i64 0, i64 0), i32 %tmp46) nounwind
  %tmp48 = load i32* getelementptr inbounds ([7 x [5 x [1 x i32]]]* @g_2, i64 0, i64 4, i64 4, i64 0), align 16
  %call49 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str24, i64 0, i64 0), i32 %tmp48) nounwind
  %tmp50 = load i32* getelementptr inbounds ([7 x [5 x [1 x i32]]]* @g_2, i64 0, i64 5, i64 0, i64 0), align 4
  %call51 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str25, i64 0, i64 0), i32 %tmp50) nounwind
  %tmp52 = load i32* getelementptr inbounds ([7 x [5 x [1 x i32]]]* @g_2, i64 0, i64 5, i64 1, i64 0), align 4
  %call53 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str26, i64 0, i64 0), i32 %tmp52) nounwind
  %tmp54 = load i32* getelementptr inbounds ([7 x [5 x [1 x i32]]]* @g_2, i64 0, i64 5, i64 2, i64 0), align 4
  %call55 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str27, i64 0, i64 0), i32 %tmp54) nounwind
  %tmp56 = load i32* getelementptr inbounds ([7 x [5 x [1 x i32]]]* @g_2, i64 0, i64 5, i64 3, i64 0), align 4
  %call57 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str28, i64 0, i64 0), i32 %tmp56) nounwind
  %tmp58 = load i32* getelementptr inbounds ([7 x [5 x [1 x i32]]]* @g_2, i64 0, i64 5, i64 4, i64 0), align 4
  %call59 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str29, i64 0, i64 0), i32 %tmp58) nounwind
  %tmp60 = load i32* getelementptr inbounds ([7 x [5 x [1 x i32]]]* @g_2, i64 0, i64 6, i64 0, i64 0), align 8
  %call61 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str30, i64 0, i64 0), i32 %tmp60) nounwind
  %tmp62 = load i32* getelementptr inbounds ([7 x [5 x [1 x i32]]]* @g_2, i64 0, i64 6, i64 1, i64 0), align 4
  %call63 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str31, i64 0, i64 0), i32 %tmp62) nounwind
  %tmp64 = load i32* getelementptr inbounds ([7 x [5 x [1 x i32]]]* @g_2, i64 0, i64 6, i64 2, i64 0), align 8
  %call65 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str32, i64 0, i64 0), i32 %tmp64) nounwind
  %tmp66 = load i32* getelementptr inbounds ([7 x [5 x [1 x i32]]]* @g_2, i64 0, i64 6, i64 3, i64 0), align 4
  %call67 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str33, i64 0, i64 0), i32 %tmp66) nounwind
  %tmp68 = load i32* getelementptr inbounds ([7 x [5 x [1 x i32]]]* @g_2, i64 0, i64 6, i64 4, i64 0), align 8
  %call69 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str34, i64 0, i64 0), i32 %tmp68) nounwind
  %tmp70 = load i32* getelementptr inbounds ([7 x [5 x [1 x i32]]]* @g_2, i64 0, i64 1, i64 4, i64 0), align 4
  %call71 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str9, i64 0, i64 0), i32 %tmp70) nounwind
  %tmp72 = load i32* @g_5, align 4
  %call73 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str35, i64 0, i64 0), i32 %tmp72) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
