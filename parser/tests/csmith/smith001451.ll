; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001451.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_7 = global i32 -8, align 4
@g_12 = global i32* @g_7, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %l_8 = alloca i32, align 4
  %l_11 = alloca i32, align 4
  store i32 -541234113, i32* %l_8, align 4
  store i32 2127307843, i32* %l_11, align 4
  %tmp = load i32* %l_8, align 4
  %conv = trunc i32 %tmp to i16
  %tmp1 = load i32* %l_11, align 4
  %conv2 = sext i32 %tmp1 to i64
  %call = call i64 @safe_mod_func_int64_t_s_s(i64 %conv2, i64 3)
  %conv3 = trunc i64 %call to i8
  %tmp4 = load i32* @g_7, align 4
  %conv5 = trunc i32 %tmp4 to i8
  %call6 = call i32* @func_2(i16 signext %conv, i8 zeroext %conv3, i8 signext %conv5)
  store i32* %call6, i32** @g_12, align 8
  %tmp7 = load i32* %l_11, align 4
  %conv8 = sext i32 %tmp7 to i64
  ret i64 %conv8
}

define i32* @func_2(i16 signext %p_3, i8 zeroext %p_4, i8 signext %p_5) nounwind uwtable {
entry:
  %p_3.addr = alloca i16, align 2
  %p_4.addr = alloca i8, align 1
  %p_5.addr = alloca i8, align 1
  %l_6 = alloca i32*, align 8
  store i16 %p_3, i16* %p_3.addr, align 2
  store i8 %p_4, i8* %p_4.addr, align 1
  store i8 %p_5, i8* %p_5.addr, align 1
  store i32* @g_7, i32** %l_6, align 8
  %tmp = load i32** %l_6, align 8
  ret i32* %tmp
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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i64 @func_1()
  %tmp = load i32* @g_7, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
