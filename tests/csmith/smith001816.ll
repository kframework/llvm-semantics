; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001816.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_9 = global i32 0, align 4
@g_11 = global [1 x [8 x i32]] [[8 x i32] [i32 -10, i32 -10, i32 -10, i32 -10, i32 -10, i32 -10, i32 -10, i32 -10]], align 16
@g_10 = global i32* bitcast (i8* getelementptr (i8* bitcast ([1 x [8 x i32]]* @g_11 to i8*), i64 12) to i32*), align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [26 x i8] c"checksum g_11[0][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [26 x i8] c"checksum g_11[0][1] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [26 x i8] c"checksum g_11[0][2] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [26 x i8] c"checksum g_11[0][3] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [26 x i8] c"checksum g_11[0][4] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [26 x i8] c"checksum g_11[0][5] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [26 x i8] c"checksum g_11[0][6] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [26 x i8] c"checksum g_11[0][7] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
entry:
  %l_8 = alloca i32, align 4
  store i32 0, i32* %l_8, align 4
  %tmp = load i32* %l_8, align 4
  %conv = sext i32 %tmp to i64
  %or = or i64 1, %conv
  %conv1 = trunc i64 %or to i16
  %tmp2 = load i32* %l_8, align 4
  %conv3 = trunc i32 %tmp2 to i16
  %call = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %conv1, i16 signext %conv3)
  %conv4 = trunc i16 %call to i8
  %tmp5 = load i32* @g_9, align 4
  %conv6 = zext i32 %tmp5 to i64
  %and = and i64 %conv6, 1
  %conv7 = trunc i64 %and to i8
  %call8 = call zeroext i8 @safe_div_func_uint8_t_u_u(i8 zeroext %conv4, i8 zeroext %conv7)
  %conv9 = zext i8 %call8 to i16
  %call10 = call zeroext i16 @safe_rshift_func_uint16_t_u_u(i16 zeroext %conv9, i32 0)
  %tobool = icmp ne i16 %call10, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %lbl_12

lbl_12:                                           ; preds = %if.then15, %if.then
  %tmp11 = load i32* @g_9, align 4
  %tmp12 = volatile load i32** @g_10, align 8
  store i32 %tmp11, i32* %tmp12
  br label %if.end16

if.else:                                          ; preds = %entry
  %tmp13 = load i32* @g_9, align 4
  %tobool14 = icmp ne i32 %tmp13, 0
  br i1 %tobool14, label %if.then15, label %if.end

if.then15:                                        ; preds = %if.else
  br label %lbl_12

if.end:                                           ; preds = %if.else
  br label %if.end16

if.end16:                                         ; preds = %if.end, %lbl_12
  %tmp17 = load i32* getelementptr inbounds ([1 x [8 x i32]]* @g_11, i32 0, i64 0, i64 0), align 4
  %conv18 = trunc i32 %tmp17 to i16
  ret i16 %conv18
}

define internal zeroext i16 @safe_rshift_func_uint16_t_u_u(i16 zeroext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i16, align 2
  %right.addr = alloca i32, align 4
  store i16 %left, i16* %left.addr, align 2
  store i32 %right, i32* %right.addr, align 4
  %tmp = load i32* %right.addr, align 4
  %cmp = icmp uge i32 %tmp, 32
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp1 = load i16* %left.addr, align 2
  %conv = zext i16 %tmp1 to i32
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp2 = load i16* %left.addr, align 2
  %conv3 = zext i16 %tmp2 to i32
  %tmp4 = load i32* %right.addr, align 4
  %shr = ashr i32 %conv3, %tmp4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv, %cond.true ], [ %shr, %cond.false ]
  %conv5 = trunc i32 %cond to i16
  ret i16 %conv5
}

define internal zeroext i8 @safe_div_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
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
  %div = sdiv i32 %conv5, %conv7
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv3, %cond.true ], [ %div, %cond.false ]
  %conv8 = trunc i32 %cond to i8
  ret i8 %conv8
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
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call signext i16 @func_1()
  %tmp = load i32* @g_9, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* getelementptr inbounds ([1 x [8 x i32]]* @g_11, i32 0, i64 0, i64 0), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* getelementptr inbounds ([1 x [8 x i32]]* @g_11, i32 0, i64 0, i64 1), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = load i32* getelementptr inbounds ([1 x [8 x i32]]* @g_11, i32 0, i64 0, i64 2), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = load i32* getelementptr inbounds ([1 x [8 x i32]]* @g_11, i32 0, i64 0, i64 3), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %tmp10 = load i32* getelementptr inbounds ([1 x [8 x i32]]* @g_11, i32 0, i64 0, i64 4), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str5, i32 0, i32 0), i32 %tmp10)
  %tmp12 = load i32* getelementptr inbounds ([1 x [8 x i32]]* @g_11, i32 0, i64 0, i64 5), align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str6, i32 0, i32 0), i32 %tmp12)
  %tmp14 = load i32* getelementptr inbounds ([1 x [8 x i32]]* @g_11, i32 0, i64 0, i64 6), align 4
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str7, i32 0, i32 0), i32 %tmp14)
  %tmp16 = load i32* getelementptr inbounds ([1 x [8 x i32]]* @g_11, i32 0, i64 0, i64 7), align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str8, i32 0, i32 0), i32 %tmp16)
  %tmp18 = load i32* getelementptr inbounds ([1 x [8 x i32]]* @g_11, i32 0, i64 0, i64 3), align 4
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str4, i32 0, i32 0), i32 %tmp18)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
