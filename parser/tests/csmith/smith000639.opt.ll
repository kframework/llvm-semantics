; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000639.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = constant i32 -1, align 4
@g_8 = global i32 -3, align 4
@g_10 = global i32 1, align 4
@g_31 = global i32 653085642, align 4
@g_30 = global i32* @g_31, align 8
@g_33 = global i32 -1, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_8 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_10 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [20 x i8] c"checksum g_31 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [20 x i8] c"checksum g_33 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
safe_div_func_uint8_t_u_u.exit:
  %l_26.i = alloca i32, align 4
  %tmp = volatile load i32* @g_4, align 4
  %0 = bitcast i32* %l_26.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  volatile store i32 -1, i32* %l_26.i, align 4
  %tmp.i = volatile load i32* @g_4, align 4
  volatile store i32 %tmp.i, i32* %l_26.i, align 4
  %tmp1.i2 = volatile load i32* @g_4, align 4
  %xor.i = xor i32 %tmp1.i2, 1
  store i32 %xor.i, i32* @g_8, align 4
  %tmp4.i3 = volatile load i32* @g_4, align 4
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  %tmp1.lobit.i = lshr i32 %xor.i, 31
  %tmp4.i = volatile load i32* @g_4, align 4
  %cmp5.i = icmp eq i32 %tmp1.lobit.i, %tmp4.i
  %conv6.i = zext i1 %cmp5.i to i32
  store i32 %conv6.i, i32* @g_33, align 4
  store i32 0, i32* @g_10, align 4
  %tmp15 = load i32** @g_30, align 8
  %tmp16 = volatile load i32* %tmp15, align 4
  ret i32 %tmp16
}

define i32 @func_5(i64 %p_6) nounwind uwtable {
entry:
  store i32 1, i32* @g_8, align 4
  %tmp6 = load i32* @g_10, align 4
  %or = or i32 %tmp6, 1
  store i32 %or, i32* @g_10, align 4
  %conv8 = trunc i64 %p_6 to i32
  ret i32 %conv8
}

define i32* @func_12(i32* nocapture %p_13, i16 zeroext %p_14, i8 zeroext %p_15, i32* %p_16) nounwind uwtable {
return:
  %tmp1 = load i32* @g_8, align 4
  %tmp1.lobit = lshr i32 %tmp1, 31
  %tmp4 = volatile load i32* @g_4, align 4
  %cmp5 = icmp eq i32 %tmp1.lobit, %tmp4
  %conv6 = zext i1 %cmp5 to i32
  store i32 %conv6, i32* %p_16, align 4
  store i32 0, i32* @g_10, align 4
  ret i32* @g_8
}

define zeroext i16 @func_23(i8 zeroext %p_24, i32** nocapture %p_25) nounwind uwtable {
entry:
  %l_26 = alloca i32, align 4
  volatile store i32 -1, i32* %l_26, align 4
  %tmp = volatile load i32* @g_4, align 4
  volatile store i32 %tmp, i32* %l_26, align 4
  %tmp1 = volatile load i32* @g_4, align 4
  %tmp3 = load i32* @g_8, align 4
  %xor = xor i32 %tmp3, %tmp1
  store i32 %xor, i32* @g_8, align 4
  %tmp4 = volatile load i32* @g_4, align 4
  %conv = trunc i32 %tmp4 to i16
  ret i16 %conv
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %l_26.i.i = alloca i32, align 4
  %tmp.i = volatile load i32* @g_4, align 4
  %0 = bitcast i32* %l_26.i.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0) nounwind
  volatile store i32 -1, i32* %l_26.i.i, align 4
  %tmp.i.i = volatile load i32* @g_4, align 4
  volatile store i32 %tmp.i.i, i32* %l_26.i.i, align 4
  %tmp1.i2.i = volatile load i32* @g_4, align 4
  %xor.i.i = xor i32 %tmp1.i2.i, 1
  store i32 %xor.i.i, i32* @g_8, align 4
  %tmp4.i3.i = volatile load i32* @g_4, align 4
  call void @llvm.lifetime.end(i64 -1, i8* %0) nounwind
  %tmp1.lobit.i.i = lshr i32 %xor.i.i, 31
  %tmp4.i.i = volatile load i32* @g_4, align 4
  %cmp5.i.i = icmp eq i32 %tmp1.lobit.i.i, %tmp4.i.i
  %conv6.i.i = zext i1 %cmp5.i.i to i32
  store i32 %conv6.i.i, i32* @g_33, align 4
  store i32 0, i32* @g_10, align 4
  %tmp15.i = load i32** @g_30, align 8
  %tmp16.i = volatile load i32* %tmp15.i, align 4
  %tmp = volatile load i32* @g_4, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* @g_8, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* @g_10, align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = volatile load i32* @g_31, align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = load i32* @g_33, align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str4, i64 0, i64 0), i32 %tmp8) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
