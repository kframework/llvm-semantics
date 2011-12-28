; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000560.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global [4 x [5 x i32]] [[5 x i32] [i32 8, i32 8, i32 8, i32 8, i32 8], [5 x i32] [i32 8, i32 8, i32 8, i32 8, i32 8], [5 x i32] [i32 8, i32 8, i32 8, i32 8, i32 8], [5 x i32] [i32 8, i32 8, i32 8, i32 8, i32 8]], align 16
@.str = private unnamed_addr constant [25 x i8] c"checksum g_2[0][0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][0] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][1] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][2] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][3] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][4] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [25 x i8] c"checksum g_2[2][0] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [25 x i8] c"checksum g_2[2][1] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [25 x i8] c"checksum g_2[2][2] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [25 x i8] c"checksum g_2[2][3] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [25 x i8] c"checksum g_2[2][4] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [25 x i8] c"checksum g_2[3][0] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [25 x i8] c"checksum g_2[3][1] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [25 x i8] c"checksum g_2[3][2] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [25 x i8] c"checksum g_2[3][3] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [25 x i8] c"checksum g_2[3][4] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
entry:
  %tmp = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i32 0, i64 1, i64 1), align 4
  %conv = trunc i32 %tmp to i8
  ret i8 %conv
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call signext i8 @func_1()
  %tmp = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i32 0, i64 0, i64 0), align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i32 0, i64 0, i64 1), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i32 0, i64 0, i64 2), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i32 0, i64 0, i64 3), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i32 0, i64 0, i64 4), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %tmp10 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i32 0, i64 1, i64 0), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i32 0, i32 0), i32 %tmp10)
  %tmp12 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i32 0, i64 1, i64 1), align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i32 0, i32 0), i32 %tmp12)
  %tmp14 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i32 0, i64 1, i64 2), align 4
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i32 0, i32 0), i32 %tmp14)
  %tmp16 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i32 0, i64 1, i64 3), align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str8, i32 0, i32 0), i32 %tmp16)
  %tmp18 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i32 0, i64 1, i64 4), align 4
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str9, i32 0, i32 0), i32 %tmp18)
  %tmp20 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i32 0, i64 2, i64 0), align 4
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str10, i32 0, i32 0), i32 %tmp20)
  %tmp22 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i32 0, i64 2, i64 1), align 4
  %call23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str11, i32 0, i32 0), i32 %tmp22)
  %tmp24 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i32 0, i64 2, i64 2), align 4
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str12, i32 0, i32 0), i32 %tmp24)
  %tmp26 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i32 0, i64 2, i64 3), align 4
  %call27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str13, i32 0, i32 0), i32 %tmp26)
  %tmp28 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i32 0, i64 2, i64 4), align 4
  %call29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str14, i32 0, i32 0), i32 %tmp28)
  %tmp30 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i32 0, i64 3, i64 0), align 4
  %call31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str15, i32 0, i32 0), i32 %tmp30)
  %tmp32 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i32 0, i64 3, i64 1), align 4
  %call33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str16, i32 0, i32 0), i32 %tmp32)
  %tmp34 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i32 0, i64 3, i64 2), align 4
  %call35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str17, i32 0, i32 0), i32 %tmp34)
  %tmp36 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i32 0, i64 3, i64 3), align 4
  %call37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str18, i32 0, i32 0), i32 %tmp36)
  %tmp38 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i32 0, i64 3, i64 4), align 4
  %call39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str19, i32 0, i32 0), i32 %tmp38)
  %tmp40 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i32 0, i64 1, i64 1), align 4
  %call41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i32 0, i32 0), i32 %tmp40)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
