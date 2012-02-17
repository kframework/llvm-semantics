; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000689.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = constant [10 x [7 x i16]] [[7 x i16] [i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074], [7 x i16] [i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074], [7 x i16] [i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074], [7 x i16] [i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074], [7 x i16] [i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074], [7 x i16] [i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074], [7 x i16] [i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074], [7 x i16] [i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074], [7 x i16] [i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074], [7 x i16] [i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074]], align 16
@g_5 = global i32 6, align 4
@.str = private unnamed_addr constant [25 x i8] c"checksum g_4[0][0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_4[0][1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"checksum g_4[0][2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [25 x i8] c"checksum g_4[0][3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"checksum g_4[0][4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"checksum g_4[0][5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"checksum g_4[0][6] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c"checksum g_4[1][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [25 x i8] c"checksum g_4[1][1] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [25 x i8] c"checksum g_4[1][2] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [25 x i8] c"checksum g_4[1][3] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [25 x i8] c"checksum g_4[1][4] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [25 x i8] c"checksum g_4[1][5] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [25 x i8] c"checksum g_4[1][6] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [25 x i8] c"checksum g_4[2][0] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [25 x i8] c"checksum g_4[2][1] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [25 x i8] c"checksum g_4[2][2] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [25 x i8] c"checksum g_4[2][3] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [25 x i8] c"checksum g_4[2][4] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [25 x i8] c"checksum g_4[2][5] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [25 x i8] c"checksum g_4[2][6] = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [25 x i8] c"checksum g_4[3][0] = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [25 x i8] c"checksum g_4[3][1] = %d\0A\00", align 1
@.str23 = private unnamed_addr constant [25 x i8] c"checksum g_4[3][2] = %d\0A\00", align 1
@.str24 = private unnamed_addr constant [25 x i8] c"checksum g_4[3][3] = %d\0A\00", align 1
@.str25 = private unnamed_addr constant [25 x i8] c"checksum g_4[3][4] = %d\0A\00", align 1
@.str26 = private unnamed_addr constant [25 x i8] c"checksum g_4[3][5] = %d\0A\00", align 1
@.str27 = private unnamed_addr constant [25 x i8] c"checksum g_4[3][6] = %d\0A\00", align 1
@.str28 = private unnamed_addr constant [25 x i8] c"checksum g_4[4][0] = %d\0A\00", align 1
@.str29 = private unnamed_addr constant [25 x i8] c"checksum g_4[4][1] = %d\0A\00", align 1
@.str30 = private unnamed_addr constant [25 x i8] c"checksum g_4[4][2] = %d\0A\00", align 1
@.str31 = private unnamed_addr constant [25 x i8] c"checksum g_4[4][3] = %d\0A\00", align 1
@.str32 = private unnamed_addr constant [25 x i8] c"checksum g_4[4][4] = %d\0A\00", align 1
@.str33 = private unnamed_addr constant [25 x i8] c"checksum g_4[4][5] = %d\0A\00", align 1
@.str34 = private unnamed_addr constant [25 x i8] c"checksum g_4[4][6] = %d\0A\00", align 1
@.str35 = private unnamed_addr constant [25 x i8] c"checksum g_4[5][0] = %d\0A\00", align 1
@.str36 = private unnamed_addr constant [25 x i8] c"checksum g_4[5][1] = %d\0A\00", align 1
@.str37 = private unnamed_addr constant [25 x i8] c"checksum g_4[5][2] = %d\0A\00", align 1
@.str38 = private unnamed_addr constant [25 x i8] c"checksum g_4[5][3] = %d\0A\00", align 1
@.str39 = private unnamed_addr constant [25 x i8] c"checksum g_4[5][4] = %d\0A\00", align 1
@.str40 = private unnamed_addr constant [25 x i8] c"checksum g_4[5][5] = %d\0A\00", align 1
@.str41 = private unnamed_addr constant [25 x i8] c"checksum g_4[5][6] = %d\0A\00", align 1
@.str42 = private unnamed_addr constant [25 x i8] c"checksum g_4[6][0] = %d\0A\00", align 1
@.str43 = private unnamed_addr constant [25 x i8] c"checksum g_4[6][1] = %d\0A\00", align 1
@.str44 = private unnamed_addr constant [25 x i8] c"checksum g_4[6][2] = %d\0A\00", align 1
@.str45 = private unnamed_addr constant [25 x i8] c"checksum g_4[6][3] = %d\0A\00", align 1
@.str46 = private unnamed_addr constant [25 x i8] c"checksum g_4[6][4] = %d\0A\00", align 1
@.str47 = private unnamed_addr constant [25 x i8] c"checksum g_4[6][5] = %d\0A\00", align 1
@.str48 = private unnamed_addr constant [25 x i8] c"checksum g_4[6][6] = %d\0A\00", align 1
@.str49 = private unnamed_addr constant [25 x i8] c"checksum g_4[7][0] = %d\0A\00", align 1
@.str50 = private unnamed_addr constant [25 x i8] c"checksum g_4[7][1] = %d\0A\00", align 1
@.str51 = private unnamed_addr constant [25 x i8] c"checksum g_4[7][2] = %d\0A\00", align 1
@.str52 = private unnamed_addr constant [25 x i8] c"checksum g_4[7][3] = %d\0A\00", align 1
@.str53 = private unnamed_addr constant [25 x i8] c"checksum g_4[7][4] = %d\0A\00", align 1
@.str54 = private unnamed_addr constant [25 x i8] c"checksum g_4[7][5] = %d\0A\00", align 1
@.str55 = private unnamed_addr constant [25 x i8] c"checksum g_4[7][6] = %d\0A\00", align 1
@.str56 = private unnamed_addr constant [25 x i8] c"checksum g_4[8][0] = %d\0A\00", align 1
@.str57 = private unnamed_addr constant [25 x i8] c"checksum g_4[8][1] = %d\0A\00", align 1
@.str58 = private unnamed_addr constant [25 x i8] c"checksum g_4[8][2] = %d\0A\00", align 1
@.str59 = private unnamed_addr constant [25 x i8] c"checksum g_4[8][3] = %d\0A\00", align 1
@.str60 = private unnamed_addr constant [25 x i8] c"checksum g_4[8][4] = %d\0A\00", align 1
@.str61 = private unnamed_addr constant [25 x i8] c"checksum g_4[8][5] = %d\0A\00", align 1
@.str62 = private unnamed_addr constant [25 x i8] c"checksum g_4[8][6] = %d\0A\00", align 1
@.str63 = private unnamed_addr constant [25 x i8] c"checksum g_4[9][0] = %d\0A\00", align 1
@.str64 = private unnamed_addr constant [25 x i8] c"checksum g_4[9][1] = %d\0A\00", align 1
@.str65 = private unnamed_addr constant [25 x i8] c"checksum g_4[9][2] = %d\0A\00", align 1
@.str66 = private unnamed_addr constant [25 x i8] c"checksum g_4[9][3] = %d\0A\00", align 1
@.str67 = private unnamed_addr constant [25 x i8] c"checksum g_4[9][4] = %d\0A\00", align 1
@.str68 = private unnamed_addr constant [25 x i8] c"checksum g_4[9][5] = %d\0A\00", align 1
@.str69 = private unnamed_addr constant [25 x i8] c"checksum g_4[9][6] = %d\0A\00", align 1
@.str70 = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  %tmp = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 1, i64 6), align 2
  %conv = trunc i16 %tmp to i8
  %tmp1 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 1, i64 6), align 2
  %conv2 = trunc i16 %tmp1 to i8
  %call = call zeroext i8 @safe_mod_func_uint8_t_u_u(i8 zeroext %conv, i8 zeroext %conv2)
  %conv3 = zext i8 %call to i32
  %tmp4 = load i32* @g_5, align 4
  %or = or i32 %tmp4, %conv3
  store i32 %or, i32* @g_5, align 4
  %tmp5 = load i32* @g_5, align 4
  %conv6 = trunc i32 %tmp5 to i16
  ret i16 %conv6
}

define internal zeroext i8 @safe_mod_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i8, align 1
  %ui2.addr = alloca i8, align 1
  store i8 %ui1, i8* %ui1.addr, align 1
  store i8 %ui2, i8* %ui2.addr, align 1
  %tmp = load i8* %ui2.addr, align 1
  %conv = zext i8 %tmp to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp2 = load i8* %ui1.addr, align 1
  %conv3 = zext i8 %tmp2 to i32
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp4 = load i8* %ui1.addr, align 1
  %conv5 = zext i8 %tmp4 to i32
  %tmp6 = load i8* %ui2.addr, align 1
  %conv7 = zext i8 %tmp6 to i32
  %rem = srem i32 %conv5, %conv7
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv3, %cond.true ], [ %rem, %cond.false ]
  %conv8 = trunc i32 %cond to i8
  ret i8 %conv8
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
  %call = call zeroext i16 @func_1()
  %tmp = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 0, i64 0), align 2
  %conv = sext i16 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %tmp2 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 0, i64 1), align 2
  %conv3 = sext i16 %tmp2 to i32
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i32 %conv3)
  %tmp5 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 0, i64 2), align 2
  %conv6 = sext i16 %tmp5 to i32
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i32 0, i32 0), i32 %conv6)
  %tmp8 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 0, i64 3), align 2
  %conv9 = sext i16 %tmp8 to i32
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i32 0, i32 0), i32 %conv9)
  %tmp11 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 0, i64 4), align 2
  %conv12 = sext i16 %tmp11 to i32
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i32 0, i32 0), i32 %conv12)
  %tmp14 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 0, i64 5), align 2
  %conv15 = sext i16 %tmp14 to i32
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i32 0, i32 0), i32 %conv15)
  %tmp17 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 0, i64 6), align 2
  %conv18 = sext i16 %tmp17 to i32
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i32 0, i32 0), i32 %conv18)
  %tmp20 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 1, i64 0), align 2
  %conv21 = sext i16 %tmp20 to i32
  %call22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i32 0, i32 0), i32 %conv21)
  %tmp23 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 1, i64 1), align 2
  %conv24 = sext i16 %tmp23 to i32
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str8, i32 0, i32 0), i32 %conv24)
  %tmp26 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 1, i64 2), align 2
  %conv27 = sext i16 %tmp26 to i32
  %call28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str9, i32 0, i32 0), i32 %conv27)
  %tmp29 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 1, i64 3), align 2
  %conv30 = sext i16 %tmp29 to i32
  %call31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str10, i32 0, i32 0), i32 %conv30)
  %tmp32 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 1, i64 4), align 2
  %conv33 = sext i16 %tmp32 to i32
  %call34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str11, i32 0, i32 0), i32 %conv33)
  %tmp35 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 1, i64 5), align 2
  %conv36 = sext i16 %tmp35 to i32
  %call37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str12, i32 0, i32 0), i32 %conv36)
  %tmp38 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 1, i64 6), align 2
  %conv39 = sext i16 %tmp38 to i32
  %call40 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str13, i32 0, i32 0), i32 %conv39)
  %tmp41 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 2, i64 0), align 2
  %conv42 = sext i16 %tmp41 to i32
  %call43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str14, i32 0, i32 0), i32 %conv42)
  %tmp44 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 2, i64 1), align 2
  %conv45 = sext i16 %tmp44 to i32
  %call46 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str15, i32 0, i32 0), i32 %conv45)
  %tmp47 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 2, i64 2), align 2
  %conv48 = sext i16 %tmp47 to i32
  %call49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str16, i32 0, i32 0), i32 %conv48)
  %tmp50 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 2, i64 3), align 2
  %conv51 = sext i16 %tmp50 to i32
  %call52 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str17, i32 0, i32 0), i32 %conv51)
  %tmp53 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 2, i64 4), align 2
  %conv54 = sext i16 %tmp53 to i32
  %call55 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str18, i32 0, i32 0), i32 %conv54)
  %tmp56 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 2, i64 5), align 2
  %conv57 = sext i16 %tmp56 to i32
  %call58 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str19, i32 0, i32 0), i32 %conv57)
  %tmp59 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 2, i64 6), align 2
  %conv60 = sext i16 %tmp59 to i32
  %call61 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str20, i32 0, i32 0), i32 %conv60)
  %tmp62 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 3, i64 0), align 2
  %conv63 = sext i16 %tmp62 to i32
  %call64 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str21, i32 0, i32 0), i32 %conv63)
  %tmp65 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 3, i64 1), align 2
  %conv66 = sext i16 %tmp65 to i32
  %call67 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str22, i32 0, i32 0), i32 %conv66)
  %tmp68 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 3, i64 2), align 2
  %conv69 = sext i16 %tmp68 to i32
  %call70 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str23, i32 0, i32 0), i32 %conv69)
  %tmp71 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 3, i64 3), align 2
  %conv72 = sext i16 %tmp71 to i32
  %call73 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str24, i32 0, i32 0), i32 %conv72)
  %tmp74 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 3, i64 4), align 2
  %conv75 = sext i16 %tmp74 to i32
  %call76 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str25, i32 0, i32 0), i32 %conv75)
  %tmp77 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 3, i64 5), align 2
  %conv78 = sext i16 %tmp77 to i32
  %call79 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str26, i32 0, i32 0), i32 %conv78)
  %tmp80 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 3, i64 6), align 2
  %conv81 = sext i16 %tmp80 to i32
  %call82 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str27, i32 0, i32 0), i32 %conv81)
  %tmp83 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 4, i64 0), align 2
  %conv84 = sext i16 %tmp83 to i32
  %call85 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str28, i32 0, i32 0), i32 %conv84)
  %tmp86 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 4, i64 1), align 2
  %conv87 = sext i16 %tmp86 to i32
  %call88 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str29, i32 0, i32 0), i32 %conv87)
  %tmp89 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 4, i64 2), align 2
  %conv90 = sext i16 %tmp89 to i32
  %call91 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str30, i32 0, i32 0), i32 %conv90)
  %tmp92 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 4, i64 3), align 2
  %conv93 = sext i16 %tmp92 to i32
  %call94 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str31, i32 0, i32 0), i32 %conv93)
  %tmp95 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 4, i64 4), align 2
  %conv96 = sext i16 %tmp95 to i32
  %call97 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str32, i32 0, i32 0), i32 %conv96)
  %tmp98 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 4, i64 5), align 2
  %conv99 = sext i16 %tmp98 to i32
  %call100 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str33, i32 0, i32 0), i32 %conv99)
  %tmp101 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 4, i64 6), align 2
  %conv102 = sext i16 %tmp101 to i32
  %call103 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str34, i32 0, i32 0), i32 %conv102)
  %tmp104 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 5, i64 0), align 2
  %conv105 = sext i16 %tmp104 to i32
  %call106 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str35, i32 0, i32 0), i32 %conv105)
  %tmp107 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 5, i64 1), align 2
  %conv108 = sext i16 %tmp107 to i32
  %call109 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str36, i32 0, i32 0), i32 %conv108)
  %tmp110 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 5, i64 2), align 2
  %conv111 = sext i16 %tmp110 to i32
  %call112 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str37, i32 0, i32 0), i32 %conv111)
  %tmp113 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 5, i64 3), align 2
  %conv114 = sext i16 %tmp113 to i32
  %call115 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str38, i32 0, i32 0), i32 %conv114)
  %tmp116 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 5, i64 4), align 2
  %conv117 = sext i16 %tmp116 to i32
  %call118 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str39, i32 0, i32 0), i32 %conv117)
  %tmp119 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 5, i64 5), align 2
  %conv120 = sext i16 %tmp119 to i32
  %call121 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str40, i32 0, i32 0), i32 %conv120)
  %tmp122 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 5, i64 6), align 2
  %conv123 = sext i16 %tmp122 to i32
  %call124 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str41, i32 0, i32 0), i32 %conv123)
  %tmp125 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 6, i64 0), align 2
  %conv126 = sext i16 %tmp125 to i32
  %call127 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str42, i32 0, i32 0), i32 %conv126)
  %tmp128 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 6, i64 1), align 2
  %conv129 = sext i16 %tmp128 to i32
  %call130 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str43, i32 0, i32 0), i32 %conv129)
  %tmp131 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 6, i64 2), align 2
  %conv132 = sext i16 %tmp131 to i32
  %call133 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str44, i32 0, i32 0), i32 %conv132)
  %tmp134 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 6, i64 3), align 2
  %conv135 = sext i16 %tmp134 to i32
  %call136 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str45, i32 0, i32 0), i32 %conv135)
  %tmp137 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 6, i64 4), align 2
  %conv138 = sext i16 %tmp137 to i32
  %call139 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str46, i32 0, i32 0), i32 %conv138)
  %tmp140 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 6, i64 5), align 2
  %conv141 = sext i16 %tmp140 to i32
  %call142 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str47, i32 0, i32 0), i32 %conv141)
  %tmp143 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 6, i64 6), align 2
  %conv144 = sext i16 %tmp143 to i32
  %call145 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str48, i32 0, i32 0), i32 %conv144)
  %tmp146 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 7, i64 0), align 2
  %conv147 = sext i16 %tmp146 to i32
  %call148 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str49, i32 0, i32 0), i32 %conv147)
  %tmp149 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 7, i64 1), align 2
  %conv150 = sext i16 %tmp149 to i32
  %call151 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str50, i32 0, i32 0), i32 %conv150)
  %tmp152 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 7, i64 2), align 2
  %conv153 = sext i16 %tmp152 to i32
  %call154 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str51, i32 0, i32 0), i32 %conv153)
  %tmp155 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 7, i64 3), align 2
  %conv156 = sext i16 %tmp155 to i32
  %call157 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str52, i32 0, i32 0), i32 %conv156)
  %tmp158 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 7, i64 4), align 2
  %conv159 = sext i16 %tmp158 to i32
  %call160 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str53, i32 0, i32 0), i32 %conv159)
  %tmp161 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 7, i64 5), align 2
  %conv162 = sext i16 %tmp161 to i32
  %call163 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str54, i32 0, i32 0), i32 %conv162)
  %tmp164 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 7, i64 6), align 2
  %conv165 = sext i16 %tmp164 to i32
  %call166 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str55, i32 0, i32 0), i32 %conv165)
  %tmp167 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 8, i64 0), align 2
  %conv168 = sext i16 %tmp167 to i32
  %call169 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str56, i32 0, i32 0), i32 %conv168)
  %tmp170 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 8, i64 1), align 2
  %conv171 = sext i16 %tmp170 to i32
  %call172 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str57, i32 0, i32 0), i32 %conv171)
  %tmp173 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 8, i64 2), align 2
  %conv174 = sext i16 %tmp173 to i32
  %call175 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str58, i32 0, i32 0), i32 %conv174)
  %tmp176 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 8, i64 3), align 2
  %conv177 = sext i16 %tmp176 to i32
  %call178 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str59, i32 0, i32 0), i32 %conv177)
  %tmp179 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 8, i64 4), align 2
  %conv180 = sext i16 %tmp179 to i32
  %call181 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str60, i32 0, i32 0), i32 %conv180)
  %tmp182 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 8, i64 5), align 2
  %conv183 = sext i16 %tmp182 to i32
  %call184 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str61, i32 0, i32 0), i32 %conv183)
  %tmp185 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 8, i64 6), align 2
  %conv186 = sext i16 %tmp185 to i32
  %call187 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str62, i32 0, i32 0), i32 %conv186)
  %tmp188 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 9, i64 0), align 2
  %conv189 = sext i16 %tmp188 to i32
  %call190 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str63, i32 0, i32 0), i32 %conv189)
  %tmp191 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 9, i64 1), align 2
  %conv192 = sext i16 %tmp191 to i32
  %call193 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str64, i32 0, i32 0), i32 %conv192)
  %tmp194 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 9, i64 2), align 2
  %conv195 = sext i16 %tmp194 to i32
  %call196 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str65, i32 0, i32 0), i32 %conv195)
  %tmp197 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 9, i64 3), align 2
  %conv198 = sext i16 %tmp197 to i32
  %call199 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str66, i32 0, i32 0), i32 %conv198)
  %tmp200 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 9, i64 4), align 2
  %conv201 = sext i16 %tmp200 to i32
  %call202 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str67, i32 0, i32 0), i32 %conv201)
  %tmp203 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 9, i64 5), align 2
  %conv204 = sext i16 %tmp203 to i32
  %call205 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str68, i32 0, i32 0), i32 %conv204)
  %tmp206 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 9, i64 6), align 2
  %conv207 = sext i16 %tmp206 to i32
  %call208 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str69, i32 0, i32 0), i32 %conv207)
  %tmp209 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 1, i64 6), align 2
  %conv210 = sext i16 %tmp209 to i32
  %call211 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str13, i32 0, i32 0), i32 %conv210)
  %tmp212 = load i32* @g_5, align 4
  %call213 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str70, i32 0, i32 0), i32 %tmp212)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
