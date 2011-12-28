; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000386.c'
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
entry:
  %l_5 = alloca i32*, align 8
  %l_6 = alloca i32**, align 8
  %l_10 = alloca i32*, align 8
  store i32* @g_2, i32** %l_5, align 8
  br label %lbl_16

lbl_16:                                           ; preds = %if.then, %entry
  store i32 0, i32* @g_2, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %lbl_16
  %tmp = load i32* @g_2, align 4
  %cmp = icmp sgt i32 %tmp, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  store i32** null, i32*** %l_6, align 8
  store i32* @g_2, i32** %l_10, align 8
  %tmp3 = load i32** %l_5, align 8
  %tmp4 = volatile load i32*** @g_7, align 8
  store i32* %tmp3, i32** %tmp4
  %tmp5 = load i32** %l_10, align 8
  %tmp6 = volatile load i32*** @g_7, align 8
  %tmp7 = load i32** %tmp6
  %cmp8 = icmp eq i32* %tmp5, %tmp7
  br i1 %cmp8, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.body
  %tmp9 = volatile load i32*** @g_7, align 8
  %tmp10 = load i32** %tmp9
  %tmp11 = load i32* %tmp10
  %conv = sext i32 %tmp11 to i64
  %call = call i64 @safe_mod_func_int64_t_s_s(i64 0, i64 %conv)
  %tobool = icmp ne i64 %call, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.body
  %0 = phi i1 [ false, %for.body ], [ %tobool, %land.rhs ]
  %land.ext = zext i1 %0 to i32
  %conv12 = trunc i32 %land.ext to i8
  %call13 = call zeroext i8 @safe_unary_minus_func_uint8_t_u(i8 zeroext %conv12)
  %conv14 = zext i8 %call13 to i32
  %tmp15 = load i32* getelementptr inbounds ([9 x [1 x [1 x [1 x i32]]]]* @g_13, i32 0, i64 7, i64 0, i64 0, i64 0), align 4
  %or = or i32 %tmp15, %conv14
  store i32 %or, i32* getelementptr inbounds ([9 x [1 x [1 x [1 x i32]]]]* @g_13, i32 0, i64 7, i64 0, i64 0, i64 0), align 4
  br label %for.inc

for.inc:                                          ; preds = %land.end
  %tmp16 = load i32* @g_2, align 4
  %conv17 = trunc i32 %tmp16 to i16
  %call18 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %conv17, i16 signext 1)
  %conv19 = sext i16 %call18 to i32
  store i32 %conv19, i32* @g_2, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 26, i32* @g_2, align 4
  br label %for.cond20

for.cond20:                                       ; preds = %for.inc27, %for.end
  %tmp21 = load i32* @g_2, align 4
  %cmp22 = icmp sle i32 %tmp21, -27
  br i1 %cmp22, label %for.body24, label %for.end32

for.body24:                                       ; preds = %for.cond20
  %tmp25 = load i32* @g_2, align 4
  %tobool26 = icmp ne i32 %tmp25, 0
  br i1 %tobool26, label %if.then, label %if.end

if.then:                                          ; preds = %for.body24
  br label %lbl_16

if.end:                                           ; preds = %for.body24
  br label %for.inc27

for.inc27:                                        ; preds = %if.end
  %tmp28 = load i32* @g_2, align 4
  %conv29 = trunc i32 %tmp28 to i16
  %call30 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %conv29, i16 signext 1)
  %conv31 = sext i16 %call30 to i32
  store i32 %conv31, i32* @g_2, align 4
  br label %for.cond20

for.end32:                                        ; preds = %for.cond20
  %tmp33 = load i32** %l_5, align 8
  %tmp34 = load i32* %tmp33
  %or35 = or i32 %tmp34, 1
  %tmp36 = load i32** %l_5, align 8
  store i32 %or35, i32* %tmp36
  %tmp37 = load i32** %l_5, align 8
  %tmp38 = load i32* %tmp37
  ret i32 %tmp38
}

define internal zeroext i8 @safe_unary_minus_func_uint8_t_u(i8 zeroext %ui) nounwind uwtable {
entry:
  %ui.addr = alloca i8, align 1
  store i8 %ui, i8* %ui.addr, align 1
  %tmp = load i8* %ui.addr, align 1
  %conv = zext i8 %tmp to i32
  %sub = sub nsw i32 0, %conv
  %conv1 = trunc i32 %sub to i8
  ret i8 %conv1
}

define internal i64 @safe_mod_func_int64_t_s_s(i64 %si1, i64 %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i64, align 8
  %si2.addr = alloca i64, align 8
  store i64 %si1, i64* %si1.addr, align 8
  store i64 %si2, i64* %si2.addr, align 8
  %tmp = load i64* %si2.addr, align 8
  %cmp = icmp eq i64 %tmp, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load i64* %si1.addr, align 8
  %cmp2 = icmp eq i64 %tmp1, -9223372036854775808
  br i1 %cmp2, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %lor.lhs.false
  %tmp3 = load i64* %si2.addr, align 8
  %cmp4 = icmp eq i64 %tmp3, -1
  br i1 %cmp4, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true, %entry
  %tmp5 = load i64* %si1.addr, align 8
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %lor.lhs.false
  %tmp6 = load i64* %si1.addr, align 8
  %tmp7 = load i64* %si2.addr, align 8
  %rem = srem i64 %tmp6, %tmp7
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %tmp5, %cond.true ], [ %rem, %cond.false ]
  ret i64 %cond
}

define internal signext i16 @safe_sub_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i16, align 2
  %si2.addr = alloca i16, align 2
  store i16 %si1, i16* %si1.addr, align 2
  store i16 %si2, i16* %si2.addr, align 2
  %tmp = load i16* %si1.addr, align 2
  %conv = sext i16 %tmp to i32
  %tmp1 = load i16* %si2.addr, align 2
  %conv2 = sext i16 %tmp1 to i32
  %sub = sub nsw i32 %conv, %conv2
  %conv3 = trunc i32 %sub to i16
  ret i16 %conv3
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i32 @func_1()
  %tmp = load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* getelementptr inbounds ([9 x [1 x [1 x [1 x i32]]]]* @g_13, i32 0, i64 0, i64 0, i64 0, i64 0), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* getelementptr inbounds ([9 x [1 x [1 x [1 x i32]]]]* @g_13, i32 0, i64 1, i64 0, i64 0, i64 0), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = load i32* getelementptr inbounds ([9 x [1 x [1 x [1 x i32]]]]* @g_13, i32 0, i64 2, i64 0, i64 0, i64 0), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = load i32* getelementptr inbounds ([9 x [1 x [1 x [1 x i32]]]]* @g_13, i32 0, i64 3, i64 0, i64 0, i64 0), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %tmp10 = load i32* getelementptr inbounds ([9 x [1 x [1 x [1 x i32]]]]* @g_13, i32 0, i64 4, i64 0, i64 0, i64 0), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str5, i32 0, i32 0), i32 %tmp10)
  %tmp12 = load i32* getelementptr inbounds ([9 x [1 x [1 x [1 x i32]]]]* @g_13, i32 0, i64 5, i64 0, i64 0, i64 0), align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str6, i32 0, i32 0), i32 %tmp12)
  %tmp14 = load i32* getelementptr inbounds ([9 x [1 x [1 x [1 x i32]]]]* @g_13, i32 0, i64 6, i64 0, i64 0, i64 0), align 4
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str7, i32 0, i32 0), i32 %tmp14)
  %tmp16 = load i32* getelementptr inbounds ([9 x [1 x [1 x [1 x i32]]]]* @g_13, i32 0, i64 7, i64 0, i64 0, i64 0), align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str8, i32 0, i32 0), i32 %tmp16)
  %tmp18 = load i32* getelementptr inbounds ([9 x [1 x [1 x [1 x i32]]]]* @g_13, i32 0, i64 8, i64 0, i64 0, i64 0), align 4
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str9, i32 0, i32 0), i32 %tmp18)
  %tmp20 = load i32* getelementptr inbounds ([9 x [1 x [1 x [1 x i32]]]]* @g_13, i32 0, i64 7, i64 0, i64 0, i64 0), align 4
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str8, i32 0, i32 0), i32 %tmp20)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
