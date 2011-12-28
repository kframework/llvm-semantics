; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001032.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 245849238, align 4
@g_14 = global [4 x [5 x i32]] [[5 x i32] [i32 4, i32 4, i32 4, i32 4, i32 4], [5 x i32] [i32 4, i32 4, i32 4, i32 4, i32 4], [5 x i32] [i32 4, i32 4, i32 4, i32 4, i32 4], [5 x i32] [i32 4, i32 4, i32 4, i32 4, i32 4]], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [26 x i8] c"checksum g_14[0][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [26 x i8] c"checksum g_14[0][1] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [26 x i8] c"checksum g_14[0][2] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [26 x i8] c"checksum g_14[0][3] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [26 x i8] c"checksum g_14[0][4] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [26 x i8] c"checksum g_14[1][0] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [26 x i8] c"checksum g_14[1][1] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [26 x i8] c"checksum g_14[1][2] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [26 x i8] c"checksum g_14[1][3] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [26 x i8] c"checksum g_14[1][4] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [26 x i8] c"checksum g_14[2][0] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [26 x i8] c"checksum g_14[2][1] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [26 x i8] c"checksum g_14[2][2] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [26 x i8] c"checksum g_14[2][3] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [26 x i8] c"checksum g_14[2][4] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [26 x i8] c"checksum g_14[3][0] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [26 x i8] c"checksum g_14[3][1] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [26 x i8] c"checksum g_14[3][2] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [26 x i8] c"checksum g_14[3][3] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [26 x i8] c"checksum g_14[3][4] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
entry:
  %l_9 = alloca i32, align 4
  %l_23 = alloca i32, align 4
  %l_24 = alloca i32*, align 8
  %l_25 = alloca i8, align 1
  store i32 2119968860, i32* %l_9, align 4
  volatile store i32 15, i32* @g_2, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = volatile load i32* @g_2, align 4
  %cmp = icmp eq i32 %tmp, 3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  store i32 1826108312, i32* %l_23, align 4
  store i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 3, i64 4), i32** %l_24, align 8
  store i8 -1, i8* %l_25, align 1
  %tmp4 = load i32* %l_9, align 4
  %tmp5 = load i32* %l_9, align 4
  %conv = trunc i32 %tmp5 to i8
  %call = call zeroext i8 @safe_lshift_func_uint8_t_u_u(i8 zeroext %conv, i32 -1336616002)
  %conv6 = zext i8 %call to i32
  %tmp7 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 2, i64 2), align 4
  %conv8 = trunc i32 %tmp7 to i8
  %call9 = call zeroext i8 @safe_rshift_func_uint8_t_u_u(i8 zeroext %conv8, i32 -1)
  %conv10 = zext i8 %call9 to i32
  %cmp11 = icmp sgt i32 %conv6, %conv10
  %conv12 = zext i1 %cmp11 to i32
  %xor = xor i32 %tmp4, %conv12
  %conv13 = sext i32 %xor to i64
  %call14 = call i64 @safe_add_func_uint64_t_u_u(i64 1, i64 %conv13)
  %cmp15 = icmp ne i64 0, %call14
  %conv16 = zext i1 %cmp15 to i32
  %conv17 = trunc i32 %conv16 to i16
  %tmp18 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 1, i64 4), align 4
  %tmp19 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 2, i64 2), align 4
  %tmp20 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 2, i64 2), align 4
  %conv21 = trunc i32 %tmp20 to i8
  %tmp22 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 0, i64 2), align 4
  %conv23 = trunc i32 %tmp22 to i8
  %tmp24 = load i32* %l_23, align 4
  %tmp25 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 2, i64 2), align 4
  %and = and i32 %tmp24, %tmp25
  %tmp26 = load i32* %l_9, align 4
  %tmp27 = load i32* %l_23, align 4
  %cmp28 = icmp uge i32 %tmp26, %tmp27
  %conv29 = zext i1 %cmp28 to i32
  %xor30 = xor i32 %and, %conv29
  %conv31 = trunc i32 %xor30 to i8
  %call32 = call i32 @func_17(i32 %tmp19, i32 1264470359, i8 zeroext %conv21, i8 zeroext %conv23, i8 signext %conv31)
  %cmp33 = icmp ne i32 %tmp18, %call32
  %conv34 = zext i1 %cmp33 to i32
  %conv35 = sext i32 %conv34 to i64
  %tmp36 = load i32* %l_23, align 4
  %conv37 = zext i32 %tmp36 to i64
  %call38 = call i64 @safe_add_func_int64_t_s_s(i64 %conv35, i64 %conv37)
  %conv39 = trunc i64 %call38 to i32
  %call40 = call zeroext i16 @safe_lshift_func_uint16_t_u_u(i16 zeroext %conv17, i32 %conv39)
  %conv41 = zext i16 %call40 to i32
  %tmp42 = load i32** %l_24, align 8
  store i32 %conv41, i32* %tmp42
  %tmp43 = load i8* %l_25, align 1
  %tobool = icmp ne i8 %tmp43, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  br label %for.inc

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end, %if.then
  %tmp44 = volatile load i32* @g_2, align 4
  %conv45 = trunc i32 %tmp44 to i8
  %call46 = call signext i8 @safe_sub_func_int8_t_s_s(i8 signext %conv45, i8 signext 1)
  %conv47 = sext i8 %call46 to i32
  volatile store i32 %conv47, i32* @g_2, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp48 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 0, i64 1), align 4
  %conv49 = trunc i32 %tmp48 to i16
  ret i16 %conv49
}

define internal zeroext i16 @safe_lshift_func_uint16_t_u_u(i16 zeroext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i16, align 2
  %right.addr = alloca i32, align 4
  store i16 %left, i16* %left.addr, align 2
  store i32 %right, i32* %right.addr, align 4
  %tmp = load i32* %right.addr, align 4
  %cmp = icmp uge i32 %tmp, 32
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load i16* %left.addr, align 2
  %conv = zext i16 %tmp1 to i32
  %tmp2 = load i32* %right.addr, align 4
  %shr = ashr i32 65535, %tmp2
  %cmp3 = icmp sgt i32 %conv, %shr
  br i1 %cmp3, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %entry
  %tmp5 = load i16* %left.addr, align 2
  %conv6 = zext i16 %tmp5 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %tmp7 = load i16* %left.addr, align 2
  %conv8 = zext i16 %tmp7 to i32
  %tmp9 = load i32* %right.addr, align 4
  %shl = shl i32 %conv8, %tmp9
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv6, %cond.true ], [ %shl, %cond.false ]
  %conv10 = trunc i32 %cond to i16
  ret i16 %conv10
}

define internal i64 @safe_add_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i64, align 8
  %ui2.addr = alloca i64, align 8
  store i64 %ui1, i64* %ui1.addr, align 8
  store i64 %ui2, i64* %ui2.addr, align 8
  %tmp = load i64* %ui1.addr, align 8
  %tmp1 = load i64* %ui2.addr, align 8
  %add = add i64 %tmp, %tmp1
  ret i64 %add
}

define internal zeroext i8 @safe_lshift_func_uint8_t_u_u(i8 zeroext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i8, align 1
  %right.addr = alloca i32, align 4
  store i8 %left, i8* %left.addr, align 1
  store i32 %right, i32* %right.addr, align 4
  %tmp = load i32* %right.addr, align 4
  %cmp = icmp uge i32 %tmp, 32
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load i8* %left.addr, align 1
  %conv = zext i8 %tmp1 to i32
  %tmp2 = load i32* %right.addr, align 4
  %shr = ashr i32 255, %tmp2
  %cmp3 = icmp sgt i32 %conv, %shr
  br i1 %cmp3, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %entry
  %tmp5 = load i8* %left.addr, align 1
  %conv6 = zext i8 %tmp5 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %tmp7 = load i8* %left.addr, align 1
  %conv8 = zext i8 %tmp7 to i32
  %tmp9 = load i32* %right.addr, align 4
  %shl = shl i32 %conv8, %tmp9
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv6, %cond.true ], [ %shl, %cond.false ]
  %conv10 = trunc i32 %cond to i8
  ret i8 %conv10
}

define internal zeroext i8 @safe_rshift_func_uint8_t_u_u(i8 zeroext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i8, align 1
  %right.addr = alloca i32, align 4
  store i8 %left, i8* %left.addr, align 1
  store i32 %right, i32* %right.addr, align 4
  %tmp = load i32* %right.addr, align 4
  %cmp = icmp uge i32 %tmp, 32
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp1 = load i8* %left.addr, align 1
  %conv = zext i8 %tmp1 to i32
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp2 = load i8* %left.addr, align 1
  %conv3 = zext i8 %tmp2 to i32
  %tmp4 = load i32* %right.addr, align 4
  %shr = ashr i32 %conv3, %tmp4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv, %cond.true ], [ %shr, %cond.false ]
  %conv5 = trunc i32 %cond to i8
  ret i8 %conv5
}

define internal i64 @safe_add_func_int64_t_s_s(i64 %si1, i64 %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i64, align 8
  %si2.addr = alloca i64, align 8
  store i64 %si1, i64* %si1.addr, align 8
  store i64 %si2, i64* %si2.addr, align 8
  %tmp = load i64* %si1.addr, align 8
  %cmp = icmp sgt i64 %tmp, 0
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %tmp1 = load i64* %si2.addr, align 8
  %cmp2 = icmp sgt i64 %tmp1, 0
  br i1 %cmp2, label %land.lhs.true3, label %lor.lhs.false

land.lhs.true3:                                   ; preds = %land.lhs.true
  %tmp4 = load i64* %si1.addr, align 8
  %tmp5 = load i64* %si2.addr, align 8
  %sub = sub nsw i64 9223372036854775807, %tmp5
  %cmp6 = icmp sgt i64 %tmp4, %sub
  br i1 %cmp6, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true3, %land.lhs.true, %entry
  %tmp7 = load i64* %si1.addr, align 8
  %cmp8 = icmp slt i64 %tmp7, 0
  br i1 %cmp8, label %land.lhs.true9, label %cond.false

land.lhs.true9:                                   ; preds = %lor.lhs.false
  %tmp10 = load i64* %si2.addr, align 8
  %cmp11 = icmp slt i64 %tmp10, 0
  br i1 %cmp11, label %land.lhs.true12, label %cond.false

land.lhs.true12:                                  ; preds = %land.lhs.true9
  %tmp13 = load i64* %si1.addr, align 8
  %tmp14 = load i64* %si2.addr, align 8
  %sub15 = sub nsw i64 -9223372036854775808, %tmp14
  %cmp16 = icmp slt i64 %tmp13, %sub15
  br i1 %cmp16, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true12, %land.lhs.true3
  %tmp17 = load i64* %si1.addr, align 8
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true12, %land.lhs.true9, %lor.lhs.false
  %tmp18 = load i64* %si1.addr, align 8
  %tmp19 = load i64* %si2.addr, align 8
  %add = add nsw i64 %tmp18, %tmp19
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %tmp17, %cond.true ], [ %add, %cond.false ]
  ret i64 %cond
}

define i32 @func_17(i32 %p_18, i32 %p_19, i8 zeroext %p_20, i8 zeroext %p_21, i8 signext %p_22) nounwind uwtable {
entry:
  %p_18.addr = alloca i32, align 4
  %p_19.addr = alloca i32, align 4
  %p_20.addr = alloca i8, align 1
  %p_21.addr = alloca i8, align 1
  %p_22.addr = alloca i8, align 1
  store i32 %p_18, i32* %p_18.addr, align 4
  store i32 %p_19, i32* %p_19.addr, align 4
  store i8 %p_20, i8* %p_20.addr, align 1
  store i8 %p_21, i8* %p_21.addr, align 1
  store i8 %p_22, i8* %p_22.addr, align 1
  %tmp = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 2, i64 2), align 4
  ret i32 %tmp
}

define internal signext i8 @safe_sub_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i8, align 1
  %si2.addr = alloca i8, align 1
  store i8 %si1, i8* %si1.addr, align 1
  store i8 %si2, i8* %si2.addr, align 1
  %tmp = load i8* %si1.addr, align 1
  %conv = sext i8 %tmp to i32
  %tmp1 = load i8* %si2.addr, align 1
  %conv2 = sext i8 %tmp1 to i32
  %sub = sub nsw i32 %conv, %conv2
  %conv3 = trunc i32 %sub to i8
  ret i8 %conv3
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
  %tmp = volatile load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 0, i64 0), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 0, i64 1), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 0, i64 2), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 0, i64 3), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %tmp10 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 0, i64 4), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str5, i32 0, i32 0), i32 %tmp10)
  %tmp12 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 1, i64 0), align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str6, i32 0, i32 0), i32 %tmp12)
  %tmp14 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 1, i64 1), align 4
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str7, i32 0, i32 0), i32 %tmp14)
  %tmp16 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 1, i64 2), align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str8, i32 0, i32 0), i32 %tmp16)
  %tmp18 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 1, i64 3), align 4
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str9, i32 0, i32 0), i32 %tmp18)
  %tmp20 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 1, i64 4), align 4
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str10, i32 0, i32 0), i32 %tmp20)
  %tmp22 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 2, i64 0), align 4
  %call23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str11, i32 0, i32 0), i32 %tmp22)
  %tmp24 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 2, i64 1), align 4
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str12, i32 0, i32 0), i32 %tmp24)
  %tmp26 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 2, i64 2), align 4
  %call27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str13, i32 0, i32 0), i32 %tmp26)
  %tmp28 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 2, i64 3), align 4
  %call29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str14, i32 0, i32 0), i32 %tmp28)
  %tmp30 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 2, i64 4), align 4
  %call31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str15, i32 0, i32 0), i32 %tmp30)
  %tmp32 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 3, i64 0), align 4
  %call33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str16, i32 0, i32 0), i32 %tmp32)
  %tmp34 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 3, i64 1), align 4
  %call35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str17, i32 0, i32 0), i32 %tmp34)
  %tmp36 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 3, i64 2), align 4
  %call37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str18, i32 0, i32 0), i32 %tmp36)
  %tmp38 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 3, i64 3), align 4
  %call39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str19, i32 0, i32 0), i32 %tmp38)
  %tmp40 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 3, i64 4), align 4
  %call41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str20, i32 0, i32 0), i32 %tmp40)
  %tmp42 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 2, i64 2), align 4
  %call43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str13, i32 0, i32 0), i32 %tmp42)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
