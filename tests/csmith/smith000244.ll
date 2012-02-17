; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000244.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_6 = global i16 -8012, align 2
@g_8 = global [8 x [3 x [1 x i32]]] [[3 x [1 x i32]] [[1 x i32] [i32 -1925412580], [1 x i32] [i32 -1925412580], [1 x i32] [i32 -1925412580]], [3 x [1 x i32]] [[1 x i32] [i32 -1925412580], [1 x i32] [i32 -1925412580], [1 x i32] [i32 -1925412580]], [3 x [1 x i32]] [[1 x i32] [i32 -1925412580], [1 x i32] [i32 -1925412580], [1 x i32] [i32 -1925412580]], [3 x [1 x i32]] [[1 x i32] [i32 -1925412580], [1 x i32] [i32 -1925412580], [1 x i32] [i32 -1925412580]], [3 x [1 x i32]] [[1 x i32] [i32 -1925412580], [1 x i32] [i32 -1925412580], [1 x i32] [i32 -1925412580]], [3 x [1 x i32]] [[1 x i32] [i32 -1925412580], [1 x i32] [i32 -1925412580], [1 x i32] [i32 -1925412580]], [3 x [1 x i32]] [[1 x i32] [i32 -1925412580], [1 x i32] [i32 -1925412580], [1 x i32] [i32 -1925412580]], [3 x [1 x i32]] [[1 x i32] [i32 -1925412580], [1 x i32] [i32 -1925412580], [1 x i32] [i32 -1925412580]]], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [28 x i8] c"checksum g_8[0][0][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [28 x i8] c"checksum g_8[0][1][0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [28 x i8] c"checksum g_8[0][2][0] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [28 x i8] c"checksum g_8[1][0][0] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [28 x i8] c"checksum g_8[1][1][0] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [28 x i8] c"checksum g_8[1][2][0] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [28 x i8] c"checksum g_8[2][0][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [28 x i8] c"checksum g_8[2][1][0] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [28 x i8] c"checksum g_8[2][2][0] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [28 x i8] c"checksum g_8[3][0][0] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [28 x i8] c"checksum g_8[3][1][0] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [28 x i8] c"checksum g_8[3][2][0] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [28 x i8] c"checksum g_8[4][0][0] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [28 x i8] c"checksum g_8[4][1][0] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [28 x i8] c"checksum g_8[4][2][0] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [28 x i8] c"checksum g_8[5][0][0] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [28 x i8] c"checksum g_8[5][1][0] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [28 x i8] c"checksum g_8[5][2][0] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [28 x i8] c"checksum g_8[6][0][0] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [28 x i8] c"checksum g_8[6][1][0] = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [28 x i8] c"checksum g_8[6][2][0] = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [28 x i8] c"checksum g_8[7][0][0] = %d\0A\00", align 1
@.str23 = private unnamed_addr constant [28 x i8] c"checksum g_8[7][1][0] = %d\0A\00", align 1
@.str24 = private unnamed_addr constant [28 x i8] c"checksum g_8[7][2][0] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_7 = alloca i32*, align 8
  store i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 7, i64 1, i64 0), i32** %l_7, align 8
  %tmp = load i16* @g_6, align 2
  %conv = trunc i16 %tmp to i8
  %call = call zeroext i8 @safe_rshift_func_uint8_t_u_s(i8 zeroext %conv, i32 0)
  %conv1 = zext i8 %call to i64
  %cmp = icmp sge i64 %conv1, 613181173
  %conv2 = zext i1 %cmp to i32
  %conv3 = trunc i32 %conv2 to i8
  %call4 = call signext i8 @safe_div_func_int8_t_s_s(i8 signext 0, i8 signext %conv3)
  %conv5 = sext i8 %call4 to i32
  %tmp6 = load i32** %l_7, align 8
  %tmp7 = load i32* %tmp6
  %xor = xor i32 %tmp7, %conv5
  store i32 %xor, i32* %tmp6
  %tmp8 = load i16* @g_6, align 2
  %tobool = icmp ne i16 %tmp8, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %lbl_9

if.end:                                           ; preds = %entry
  br label %lbl_9

lbl_9:                                            ; preds = %if.end, %if.then
  %tmp9 = load i32** %l_7, align 8
  store i32 9, i32* %tmp9
  %tmp10 = load i32** %l_7, align 8
  store i32 2105282952, i32* %tmp10
  %tmp11 = load i32** %l_7, align 8
  %tmp12 = load i32* %tmp11
  ret i32 %tmp12
}

define internal signext i8 @safe_div_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i8, align 1
  %si2.addr = alloca i8, align 1
  store i8 %si1, i8* %si1.addr, align 1
  store i8 %si2, i8* %si2.addr, align 1
  %tmp = load i8* %si2.addr, align 1
  %conv = sext i8 %tmp to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp2 = load i8* %si1.addr, align 1
  %conv3 = sext i8 %tmp2 to i32
  %cmp4 = icmp eq i32 %conv3, -128
  br i1 %cmp4, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %lor.lhs.false
  %tmp6 = load i8* %si2.addr, align 1
  %conv7 = sext i8 %tmp6 to i32
  %cmp8 = icmp eq i32 %conv7, -1
  br i1 %cmp8, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true, %entry
  %tmp10 = load i8* %si1.addr, align 1
  %conv11 = sext i8 %tmp10 to i32
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %lor.lhs.false
  %tmp12 = load i8* %si1.addr, align 1
  %conv13 = sext i8 %tmp12 to i32
  %tmp14 = load i8* %si2.addr, align 1
  %conv15 = sext i8 %tmp14 to i32
  %div = sdiv i32 %conv13, %conv15
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv11, %cond.true ], [ %div, %cond.false ]
  %conv16 = trunc i32 %cond to i8
  ret i8 %conv16
}

define internal zeroext i8 @safe_rshift_func_uint8_t_u_s(i8 zeroext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i8, align 1
  %right.addr = alloca i32, align 4
  store i8 %left, i8* %left.addr, align 1
  store i32 %right, i32* %right.addr, align 4
  %tmp = load i32* %right.addr, align 4
  %cmp = icmp slt i32 %tmp, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load i32* %right.addr, align 4
  %cmp2 = icmp sge i32 %tmp1, 32
  br i1 %cmp2, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %entry
  %tmp3 = load i8* %left.addr, align 1
  %conv = zext i8 %tmp3 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %tmp4 = load i8* %left.addr, align 1
  %conv5 = zext i8 %tmp4 to i32
  %tmp6 = load i32* %right.addr, align 4
  %shr = ashr i32 %conv5, %tmp6
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv, %cond.true ], [ %shr, %cond.false ]
  %conv7 = trunc i32 %cond to i8
  ret i8 %conv7
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i32 @func_1()
  %tmp = load i16* @g_6, align 2
  %conv = sext i16 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %tmp2 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 0, i64 0, i64 0), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 0, i64 1, i64 0), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 0, i64 2, i64 0), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 1, i64 0, i64 0), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %tmp10 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 1, i64 1, i64 0), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str5, i32 0, i32 0), i32 %tmp10)
  %tmp12 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 1, i64 2, i64 0), align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str6, i32 0, i32 0), i32 %tmp12)
  %tmp14 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 2, i64 0, i64 0), align 4
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str7, i32 0, i32 0), i32 %tmp14)
  %tmp16 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 2, i64 1, i64 0), align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str8, i32 0, i32 0), i32 %tmp16)
  %tmp18 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 2, i64 2, i64 0), align 4
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str9, i32 0, i32 0), i32 %tmp18)
  %tmp20 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 3, i64 0, i64 0), align 4
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str10, i32 0, i32 0), i32 %tmp20)
  %tmp22 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 3, i64 1, i64 0), align 4
  %call23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str11, i32 0, i32 0), i32 %tmp22)
  %tmp24 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 3, i64 2, i64 0), align 4
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str12, i32 0, i32 0), i32 %tmp24)
  %tmp26 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 4, i64 0, i64 0), align 4
  %call27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str13, i32 0, i32 0), i32 %tmp26)
  %tmp28 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 4, i64 1, i64 0), align 4
  %call29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str14, i32 0, i32 0), i32 %tmp28)
  %tmp30 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 4, i64 2, i64 0), align 4
  %call31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str15, i32 0, i32 0), i32 %tmp30)
  %tmp32 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 5, i64 0, i64 0), align 4
  %call33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str16, i32 0, i32 0), i32 %tmp32)
  %tmp34 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 5, i64 1, i64 0), align 4
  %call35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str17, i32 0, i32 0), i32 %tmp34)
  %tmp36 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 5, i64 2, i64 0), align 4
  %call37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str18, i32 0, i32 0), i32 %tmp36)
  %tmp38 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 6, i64 0, i64 0), align 4
  %call39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str19, i32 0, i32 0), i32 %tmp38)
  %tmp40 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 6, i64 1, i64 0), align 4
  %call41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str20, i32 0, i32 0), i32 %tmp40)
  %tmp42 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 6, i64 2, i64 0), align 4
  %call43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str21, i32 0, i32 0), i32 %tmp42)
  %tmp44 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 7, i64 0, i64 0), align 4
  %call45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str22, i32 0, i32 0), i32 %tmp44)
  %tmp46 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 7, i64 1, i64 0), align 4
  %call47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str23, i32 0, i32 0), i32 %tmp46)
  %tmp48 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 7, i64 2, i64 0), align 4
  %call49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str24, i32 0, i32 0), i32 %tmp48)
  %tmp50 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 7, i64 1, i64 0), align 4
  %call51 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str23, i32 0, i32 0), i32 %tmp50)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
