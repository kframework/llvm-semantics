; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001160.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_6 = global i16 0, align 2
@g_11 = global i32 -1, align 4
@g_12 = global [7 x i32*] zeroinitializer, align 16
@g_13 = global [3 x [4 x [5 x i32*]]] zeroinitializer, align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_11 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_3 = alloca i32, align 4
  %l_21 = alloca i32*, align 8
  store i32 0, i32* %l_3, align 4
  store i32* @g_11, i32** %l_21, align 8
  %tmp = load i32* %l_3, align 4
  %conv = trunc i32 %tmp to i16
  %call = call signext i16 @safe_unary_minus_func_int16_t_s(i16 signext %conv)
  %conv1 = sext i16 %call to i32
  %tmp2 = load i16* @g_6, align 2
  %conv3 = sext i16 %tmp2 to i32
  %tobool = icmp ne i32 %conv3, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %tmp4 = load i16* @g_6, align 2
  %conv5 = sext i16 %tmp4 to i32
  %tobool6 = icmp ne i32 %conv5, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %0 = phi i1 [ false, %entry ], [ %tobool6, %land.rhs ]
  %land.ext = zext i1 %0 to i32
  %tmp7 = load i32* %l_3, align 4
  %tmp8 = load i16* @g_6, align 2
  %conv9 = sext i16 %tmp8 to i32
  %xor = xor i32 %tmp7, %conv9
  %cmp = icmp slt i32 %land.ext, %xor
  %conv10 = zext i1 %cmp to i32
  %conv11 = trunc i32 %conv10 to i16
  %tmp12 = load i32* @g_11, align 4
  %conv13 = sext i32 %tmp12 to i64
  %call14 = call i32 @func_7(i64 %conv13)
  %conv15 = trunc i32 %call14 to i16
  %call16 = call zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext %conv11, i16 zeroext %conv15)
  %conv17 = zext i16 %call16 to i32
  %tobool18 = icmp ne i32 %conv17, 0
  br i1 %tobool18, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.end
  %tmp19 = load i32* %l_3, align 4
  %conv20 = trunc i32 %tmp19 to i16
  %tmp21 = load i32* @g_11, align 4
  %conv22 = trunc i32 %tmp21 to i8
  %call23 = call i32 @func_17(i16 zeroext %conv20, i8 zeroext %conv22)
  %tmp24 = load i32* %l_3, align 4
  %cmp25 = icmp eq i32 %call23, %tmp24
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.end
  %1 = phi i1 [ true, %land.end ], [ %cmp25, %lor.rhs ]
  %land.ext27 = zext i1 %1 to i32
  %cmp28 = icmp sgt i32 %conv1, %land.ext27
  %conv29 = zext i1 %cmp28 to i32
  %tmp30 = load i32** %l_21, align 8
  store i32 %conv29, i32* %tmp30
  %tmp31 = load i32** %l_21, align 8
  %tmp32 = load i32* %tmp31
  ret i32 %tmp32
}

define internal signext i16 @safe_unary_minus_func_int16_t_s(i16 signext %si) nounwind uwtable {
entry:
  %si.addr = alloca i16, align 2
  store i16 %si, i16* %si.addr, align 2
  %tmp = load i16* %si.addr, align 2
  %conv = sext i16 %tmp to i32
  %sub = sub nsw i32 0, %conv
  %conv1 = trunc i32 %sub to i16
  ret i16 %conv1
}

define internal zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i16, align 2
  %ui2.addr = alloca i16, align 2
  store i16 %ui1, i16* %ui1.addr, align 2
  store i16 %ui2, i16* %ui2.addr, align 2
  %tmp = load i16* %ui1.addr, align 2
  %conv = zext i16 %tmp to i32
  %tmp1 = load i16* %ui2.addr, align 2
  %conv2 = zext i16 %tmp1 to i32
  %add = add nsw i32 %conv, %conv2
  %conv3 = trunc i32 %add to i16
  ret i16 %conv3
}

define i32 @func_7(i64 %p_8) nounwind uwtable {
entry:
  %p_8.addr = alloca i64, align 8
  %l_10 = alloca i32*, align 8
  %l_9 = alloca i32**, align 8
  %l_14 = alloca i32*, align 8
  store i64 %p_8, i64* %p_8.addr, align 8
  store i32* @g_11, i32** %l_10, align 8
  store i32** %l_10, i32*** %l_9, align 8
  store i32* @g_11, i32** %l_14, align 8
  %tmp = load i32*** %l_9, align 8
  store i32* null, i32** %tmp
  %tmp1 = load i64* %p_8.addr, align 8
  %tmp2 = load i64* %p_8.addr, align 8
  %cmp = icmp ne i64 %tmp1, %tmp2
  %conv = zext i1 %cmp to i32
  %conv3 = sext i32 %conv to i64
  %tmp4 = load i64* %p_8.addr, align 8
  %cmp5 = icmp eq i64 %conv3, %tmp4
  %conv6 = zext i1 %cmp5 to i32
  %conv7 = sext i32 %conv6 to i64
  %or = or i64 1423687254, %conv7
  %tmp8 = load i32** %l_14, align 8
  %tmp9 = load i32* %tmp8
  %conv10 = sext i32 %tmp9 to i64
  %and = and i64 %conv10, %or
  %conv11 = trunc i64 %and to i32
  store i32 %conv11, i32* %tmp8
  %tmp12 = load i64* %p_8.addr, align 8
  %conv13 = trunc i64 %tmp12 to i16
  %cmp14 = icmp eq i32** %l_14, getelementptr inbounds ([3 x [4 x [5 x i32*]]]* @g_13, i32 0, i64 2, i64 3, i64 1)
  %conv15 = zext i1 %cmp14 to i32
  %conv16 = trunc i32 %conv15 to i16
  %call = call zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext %conv13, i16 zeroext %conv16)
  %conv17 = zext i16 %call to i32
  %tmp18 = load i32** %l_14, align 8
  %tmp19 = load i32* %tmp18
  %or20 = or i32 %tmp19, %conv17
  store i32 %or20, i32* %tmp18
  %tmp21 = load i64* %p_8.addr, align 8
  %conv22 = trunc i64 %tmp21 to i32
  ret i32 %conv22
}

define i32 @func_17(i16 zeroext %p_18, i8 zeroext %p_19) nounwind uwtable {
entry:
  %p_18.addr = alloca i16, align 2
  %p_19.addr = alloca i8, align 1
  %l_20 = alloca i32, align 4
  store i16 %p_18, i16* %p_18.addr, align 2
  store i8 %p_19, i8* %p_19.addr, align 1
  store i32 1, i32* %l_20, align 4
  %tmp = load i32* %l_20, align 4
  ret i32 %tmp
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
  %tmp2 = load i32* @g_11, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
