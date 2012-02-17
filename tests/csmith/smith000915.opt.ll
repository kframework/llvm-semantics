; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000915.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global [7 x i16] [i16 17513, i16 17513, i16 17513, i16 17513, i16 17513, i16 17513, i16 17513], align 2
@g_4 = global i32 -1114352581, align 4
@g_3 = global i32* @g_4, align 8
@g_12 = global i32 978188025, align 4
@.str = private unnamed_addr constant [22 x i8] c"checksum g_2[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_2[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_2[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_2[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_2[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_2[5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_2[6] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [20 x i8] c"checksum g_12 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %l_27 = alloca i32*, align 8
  volatile store i32* @g_4, i32** %l_27, align 8
  %tmp = volatile load i16* getelementptr inbounds ([7 x i16]* @g_2, i64 0, i64 1), align 2
  %conv = zext i16 %tmp to i32
  %tmp1 = volatile load i32** @g_3, align 8
  volatile store i32 %conv, i32* %tmp1, align 4
  %tmp2 = volatile load i32** @g_3, align 8
  volatile store i32* %tmp2, i32** %l_27, align 8
  volatile store i32* @g_4, i32** %l_27, align 8
  %tmp3 = volatile load i16* getelementptr inbounds ([7 x i16]* @g_2, i64 0, i64 1), align 2
  %conv4 = zext i16 %tmp3 to i64
  ret i64 %conv4
}

define i32* @func_5(i64 %p_6, i32* %p_7) nounwind uwtable {
entry:
  %tmp1 = load i32* %p_7, align 4
  %0 = icmp ugt i32 %tmp1, 31
  %conv.i = and i32 %tmp1, 65535
  %shr.i = select i1 %0, i32 0, i32 %tmp1
  %cond.i = lshr i32 %conv.i, %shr.i
  %conv6 = and i32 %cond.i, 65535
  %cmp = icmp ult i32 %conv6, 3
  %conv9 = zext i1 %cmp to i32
  %cmp12 = icmp ne i32 %conv9, %tmp1
  %conv13 = zext i1 %cmp12 to i32
  %cmp14 = icmp sge i32 %tmp1, %conv13
  %conv15 = zext i1 %cmp14 to i32
  %tmp16 = volatile load i32** @g_3, align 8
  volatile store i32 %conv15, i32* %tmp16, align 4
  store i32 0, i32* %p_7, align 4
  ret i32* @g_12
}

define i32* @func_14(i64 %p_15, i32* nocapture %p_16, i32* nocapture %p_17, i8 zeroext %p_18, i32* %p_19) nounwind uwtable readnone {
entry:
  ret i32* %p_19
}

define i32* @func_20(i32 %p_21, i32* nocapture %p_22, i32 %p_23, i32* nocapture %p_24, i32* nocapture %p_25) nounwind uwtable readnone {
entry:
  ret i32* @g_12
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %l_27.i = alloca i32*, align 8
  %0 = bitcast i32** %l_27.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  volatile store i32* @g_4, i32** %l_27.i, align 8
  %tmp.i = volatile load i16* getelementptr inbounds ([7 x i16]* @g_2, i64 0, i64 1), align 2
  %conv.i = zext i16 %tmp.i to i32
  %tmp1.i = volatile load i32** @g_3, align 8
  volatile store i32 %conv.i, i32* %tmp1.i, align 4
  %tmp2.i = volatile load i32** @g_3, align 8
  volatile store i32* %tmp2.i, i32** %l_27.i, align 8
  volatile store i32* @g_4, i32** %l_27.i, align 8
  %tmp3.i = volatile load i16* getelementptr inbounds ([7 x i16]* @g_2, i64 0, i64 1), align 2
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  %tmp = volatile load i16* getelementptr inbounds ([7 x i16]* @g_2, i64 0, i64 0), align 2
  %conv = zext i16 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 %conv) nounwind
  %tmp2 = volatile load i16* getelementptr inbounds ([7 x i16]* @g_2, i64 0, i64 1), align 2
  %conv3 = zext i16 %tmp2 to i32
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i64 0, i64 0), i32 %conv3) nounwind
  %tmp5 = volatile load i16* getelementptr inbounds ([7 x i16]* @g_2, i64 0, i64 2), align 2
  %conv6 = zext i16 %tmp5 to i32
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i64 0, i64 0), i32 %conv6) nounwind
  %tmp8 = volatile load i16* getelementptr inbounds ([7 x i16]* @g_2, i64 0, i64 3), align 2
  %conv9 = zext i16 %tmp8 to i32
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i64 0, i64 0), i32 %conv9) nounwind
  %tmp11 = volatile load i16* getelementptr inbounds ([7 x i16]* @g_2, i64 0, i64 4), align 2
  %conv12 = zext i16 %tmp11 to i32
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i64 0, i64 0), i32 %conv12) nounwind
  %tmp14 = volatile load i16* getelementptr inbounds ([7 x i16]* @g_2, i64 0, i64 5), align 2
  %conv15 = zext i16 %tmp14 to i32
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i64 0, i64 0), i32 %conv15) nounwind
  %tmp17 = volatile load i16* getelementptr inbounds ([7 x i16]* @g_2, i64 0, i64 6), align 2
  %conv18 = zext i16 %tmp17 to i32
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i64 0, i64 0), i32 %conv18) nounwind
  %tmp20 = volatile load i16* getelementptr inbounds ([7 x i16]* @g_2, i64 0, i64 1), align 2
  %conv21 = zext i16 %tmp20 to i32
  %call22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i64 0, i64 0), i32 %conv21) nounwind
  %tmp23 = volatile load i32* @g_4, align 4
  %call24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str7, i64 0, i64 0), i32 %tmp23) nounwind
  %tmp25 = load i32* @g_12, align 4
  %call26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str8, i64 0, i64 0), i32 %tmp25) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
