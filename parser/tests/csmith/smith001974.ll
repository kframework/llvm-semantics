; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001974.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_5 = global [4 x [6 x i8]] [[6 x i8] c"\12\12\12\12\12\12", [6 x i8] c"\12\12\12\12\12\12", [6 x i8] c"\12\12\12\12\12\12", [6 x i8] c"\12\12\12\12\12\12"], align 16
@.str = private unnamed_addr constant [25 x i8] c"checksum g_5[0][0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_5[0][1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"checksum g_5[0][2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [25 x i8] c"checksum g_5[0][3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"checksum g_5[0][4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"checksum g_5[0][5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"checksum g_5[1][0] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c"checksum g_5[1][1] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [25 x i8] c"checksum g_5[1][2] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [25 x i8] c"checksum g_5[1][3] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [25 x i8] c"checksum g_5[1][4] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [25 x i8] c"checksum g_5[1][5] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [25 x i8] c"checksum g_5[2][0] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [25 x i8] c"checksum g_5[2][1] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [25 x i8] c"checksum g_5[2][2] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [25 x i8] c"checksum g_5[2][3] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [25 x i8] c"checksum g_5[2][4] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [25 x i8] c"checksum g_5[2][5] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [25 x i8] c"checksum g_5[3][0] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [25 x i8] c"checksum g_5[3][1] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [25 x i8] c"checksum g_5[3][2] = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [25 x i8] c"checksum g_5[3][3] = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [25 x i8] c"checksum g_5[3][4] = %d\0A\00", align 1
@.str23 = private unnamed_addr constant [25 x i8] c"checksum g_5[3][5] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i8 @func_1() nounwind uwtable {
entry:
  %l_4 = alloca i32, align 4
  store i32 1208023666, i32* %l_4, align 4
  %call = call zeroext i16 @safe_div_func_uint16_t_u_u(i16 zeroext 1, i16 zeroext -1422)
  %conv = zext i16 %call to i32
  %tmp = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 2, i64 2), align 1
  %conv1 = zext i8 %tmp to i32
  %or = or i32 %conv1, %conv
  %conv2 = trunc i32 %or to i8
  store i8 %conv2, i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 2, i64 2), align 1
  ret i8 114
}

define internal zeroext i16 @safe_div_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i16, align 2
  %ui2.addr = alloca i16, align 2
  store i16 %ui1, i16* %ui1.addr, align 2
  store i16 %ui2, i16* %ui2.addr, align 2
  %tmp = load i16* %ui2.addr, align 2
  %conv = zext i16 %tmp to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp2 = load i16* %ui1.addr, align 2
  %conv3 = zext i16 %tmp2 to i32
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp4 = load i16* %ui1.addr, align 2
  %conv5 = zext i16 %tmp4 to i32
  %tmp6 = load i16* %ui2.addr, align 2
  %conv7 = zext i16 %tmp6 to i32
  %div = sdiv i32 %conv5, %conv7
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv3, %cond.true ], [ %div, %cond.false ]
  %conv8 = trunc i32 %cond to i16
  ret i16 %conv8
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
  %call = call zeroext i8 @func_1()
  %tmp = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 0, i64 0), align 1
  %conv = zext i8 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %tmp2 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 0, i64 1), align 1
  %conv3 = zext i8 %tmp2 to i32
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i32 %conv3)
  %tmp5 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 0, i64 2), align 1
  %conv6 = zext i8 %tmp5 to i32
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i32 0, i32 0), i32 %conv6)
  %tmp8 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 0, i64 3), align 1
  %conv9 = zext i8 %tmp8 to i32
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i32 0, i32 0), i32 %conv9)
  %tmp11 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 0, i64 4), align 1
  %conv12 = zext i8 %tmp11 to i32
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i32 0, i32 0), i32 %conv12)
  %tmp14 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 0, i64 5), align 1
  %conv15 = zext i8 %tmp14 to i32
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i32 0, i32 0), i32 %conv15)
  %tmp17 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 1, i64 0), align 1
  %conv18 = zext i8 %tmp17 to i32
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i32 0, i32 0), i32 %conv18)
  %tmp20 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 1, i64 1), align 1
  %conv21 = zext i8 %tmp20 to i32
  %call22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i32 0, i32 0), i32 %conv21)
  %tmp23 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 1, i64 2), align 1
  %conv24 = zext i8 %tmp23 to i32
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str8, i32 0, i32 0), i32 %conv24)
  %tmp26 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 1, i64 3), align 1
  %conv27 = zext i8 %tmp26 to i32
  %call28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str9, i32 0, i32 0), i32 %conv27)
  %tmp29 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 1, i64 4), align 1
  %conv30 = zext i8 %tmp29 to i32
  %call31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str10, i32 0, i32 0), i32 %conv30)
  %tmp32 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 1, i64 5), align 1
  %conv33 = zext i8 %tmp32 to i32
  %call34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str11, i32 0, i32 0), i32 %conv33)
  %tmp35 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 2, i64 0), align 1
  %conv36 = zext i8 %tmp35 to i32
  %call37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str12, i32 0, i32 0), i32 %conv36)
  %tmp38 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 2, i64 1), align 1
  %conv39 = zext i8 %tmp38 to i32
  %call40 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str13, i32 0, i32 0), i32 %conv39)
  %tmp41 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 2, i64 2), align 1
  %conv42 = zext i8 %tmp41 to i32
  %call43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str14, i32 0, i32 0), i32 %conv42)
  %tmp44 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 2, i64 3), align 1
  %conv45 = zext i8 %tmp44 to i32
  %call46 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str15, i32 0, i32 0), i32 %conv45)
  %tmp47 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 2, i64 4), align 1
  %conv48 = zext i8 %tmp47 to i32
  %call49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str16, i32 0, i32 0), i32 %conv48)
  %tmp50 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 2, i64 5), align 1
  %conv51 = zext i8 %tmp50 to i32
  %call52 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str17, i32 0, i32 0), i32 %conv51)
  %tmp53 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 3, i64 0), align 1
  %conv54 = zext i8 %tmp53 to i32
  %call55 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str18, i32 0, i32 0), i32 %conv54)
  %tmp56 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 3, i64 1), align 1
  %conv57 = zext i8 %tmp56 to i32
  %call58 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str19, i32 0, i32 0), i32 %conv57)
  %tmp59 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 3, i64 2), align 1
  %conv60 = zext i8 %tmp59 to i32
  %call61 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str20, i32 0, i32 0), i32 %conv60)
  %tmp62 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 3, i64 3), align 1
  %conv63 = zext i8 %tmp62 to i32
  %call64 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str21, i32 0, i32 0), i32 %conv63)
  %tmp65 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 3, i64 4), align 1
  %conv66 = zext i8 %tmp65 to i32
  %call67 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str22, i32 0, i32 0), i32 %conv66)
  %tmp68 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 3, i64 5), align 1
  %conv69 = zext i8 %tmp68 to i32
  %call70 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str23, i32 0, i32 0), i32 %conv69)
  %tmp71 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 2, i64 2), align 1
  %conv72 = zext i8 %tmp71 to i32
  %call73 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str14, i32 0, i32 0), i32 %conv72)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
