; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000602.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i16 -19514, align 2
@g_4 = global i32 -1311847611, align 4
@g_3 = constant [3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4], align 16
@g_5 = global i32* null, align 8
@g_6 = global i32* null, align 8
@g_12 = global [8 x i32] [i32 1687928846, i32 1687928846, i32 1687928846, i32 1687928846, i32 1687928846, i32 1687928846, i32 1687928846, i32 1687928846], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [23 x i8] c"checksum g_12[0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"checksum g_12[1] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [23 x i8] c"checksum g_12[2] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [23 x i8] c"checksum g_12[3] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [23 x i8] c"checksum g_12[4] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [23 x i8] c"checksum g_12[5] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [23 x i8] c"checksum g_12[6] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [23 x i8] c"checksum g_12[7] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
for.end101:
  %l_8 = alloca [5 x [4 x [1 x i8]]], align 16
  %scevgep = getelementptr [5 x [4 x [1 x i8]]]* %l_8, i64 0, i64 0, i64 3, i64 0
  %scevgep40 = getelementptr [5 x [4 x [1 x i8]]]* %l_8, i64 0, i64 0, i64 2, i64 0
  %scevgep42 = getelementptr [5 x [4 x [1 x i8]]]* %l_8, i64 0, i64 0, i64 1, i64 0
  %arrayidx45 = getelementptr [5 x [4 x [1 x i8]]]* %l_8, i64 0, i64 0, i64 0, i64 0
  volatile store i8 -42, i8* %arrayidx45, align 16
  volatile store i8 -42, i8* %scevgep42, align 1
  volatile store i8 -42, i8* %scevgep40, align 2
  volatile store i8 -42, i8* %scevgep, align 1
  %scevgep.1 = getelementptr [5 x [4 x [1 x i8]]]* %l_8, i64 0, i64 1, i64 3, i64 0
  %scevgep40.1 = getelementptr [5 x [4 x [1 x i8]]]* %l_8, i64 0, i64 1, i64 2, i64 0
  %scevgep42.1 = getelementptr [5 x [4 x [1 x i8]]]* %l_8, i64 0, i64 1, i64 1, i64 0
  %arrayidx45.149 = getelementptr [5 x [4 x [1 x i8]]]* %l_8, i64 0, i64 1, i64 0, i64 0
  volatile store i8 -42, i8* %arrayidx45.149, align 4
  volatile store i8 -42, i8* %scevgep42.1, align 1
  volatile store i8 -42, i8* %scevgep40.1, align 2
  volatile store i8 -42, i8* %scevgep.1, align 1
  %scevgep.2 = getelementptr [5 x [4 x [1 x i8]]]* %l_8, i64 0, i64 2, i64 3, i64 0
  %scevgep40.2 = getelementptr [5 x [4 x [1 x i8]]]* %l_8, i64 0, i64 2, i64 2, i64 0
  %scevgep42.2 = getelementptr [5 x [4 x [1 x i8]]]* %l_8, i64 0, i64 2, i64 1, i64 0
  %arrayidx45.254 = getelementptr [5 x [4 x [1 x i8]]]* %l_8, i64 0, i64 2, i64 0, i64 0
  volatile store i8 -42, i8* %arrayidx45.254, align 8
  volatile store i8 -42, i8* %scevgep42.2, align 1
  volatile store i8 -42, i8* %scevgep40.2, align 2
  volatile store i8 -42, i8* %scevgep.2, align 1
  %scevgep.3 = getelementptr [5 x [4 x [1 x i8]]]* %l_8, i64 0, i64 3, i64 3, i64 0
  %scevgep40.3 = getelementptr [5 x [4 x [1 x i8]]]* %l_8, i64 0, i64 3, i64 2, i64 0
  %scevgep42.3 = getelementptr [5 x [4 x [1 x i8]]]* %l_8, i64 0, i64 3, i64 1, i64 0
  %arrayidx45.359 = getelementptr [5 x [4 x [1 x i8]]]* %l_8, i64 0, i64 3, i64 0, i64 0
  volatile store i8 -42, i8* %arrayidx45.359, align 4
  volatile store i8 -42, i8* %scevgep42.3, align 1
  volatile store i8 -42, i8* %scevgep40.3, align 2
  volatile store i8 -42, i8* %scevgep.3, align 1
  %scevgep.4 = getelementptr [5 x [4 x [1 x i8]]]* %l_8, i64 0, i64 4, i64 3, i64 0
  %scevgep40.4 = getelementptr [5 x [4 x [1 x i8]]]* %l_8, i64 0, i64 4, i64 2, i64 0
  %scevgep42.4 = getelementptr [5 x [4 x [1 x i8]]]* %l_8, i64 0, i64 4, i64 1, i64 0
  %arrayidx45.4 = getelementptr [5 x [4 x [1 x i8]]]* %l_8, i64 0, i64 4, i64 0, i64 0
  volatile store i8 -42, i8* %arrayidx45.4, align 16
  volatile store i8 -42, i8* %scevgep42.4, align 1
  volatile store i8 -42, i8* %scevgep40.4, align 2
  volatile store i8 -42, i8* %scevgep.4, align 1
  %tmp102 = volatile load i16* @g_2, align 2
  %conv = trunc i16 %tmp102 to i8
  volatile store i8 %conv, i8* %scevgep40.3, align 2
  %tmp109 = volatile load i16* @g_2, align 2
  %conv110 = sext i16 %tmp109 to i64
  ret i64 %conv110
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %l_8.i = alloca [5 x [4 x [1 x i8]]], align 16
  %0 = getelementptr inbounds [5 x [4 x [1 x i8]]]* %l_8.i, i64 0, i64 0, i64 0, i64 0
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  %scevgep.i = getelementptr [5 x [4 x [1 x i8]]]* %l_8.i, i64 0, i64 0, i64 3, i64 0
  %scevgep40.i = getelementptr [5 x [4 x [1 x i8]]]* %l_8.i, i64 0, i64 0, i64 2, i64 0
  %scevgep42.i = getelementptr [5 x [4 x [1 x i8]]]* %l_8.i, i64 0, i64 0, i64 1, i64 0
  volatile store i8 -42, i8* %0, align 16
  volatile store i8 -42, i8* %scevgep42.i, align 1
  volatile store i8 -42, i8* %scevgep40.i, align 2
  volatile store i8 -42, i8* %scevgep.i, align 1
  %scevgep.1.i = getelementptr [5 x [4 x [1 x i8]]]* %l_8.i, i64 0, i64 1, i64 3, i64 0
  %scevgep40.1.i = getelementptr [5 x [4 x [1 x i8]]]* %l_8.i, i64 0, i64 1, i64 2, i64 0
  %scevgep42.1.i = getelementptr [5 x [4 x [1 x i8]]]* %l_8.i, i64 0, i64 1, i64 1, i64 0
  %arrayidx45.149.i = getelementptr [5 x [4 x [1 x i8]]]* %l_8.i, i64 0, i64 1, i64 0, i64 0
  volatile store i8 -42, i8* %arrayidx45.149.i, align 4
  volatile store i8 -42, i8* %scevgep42.1.i, align 1
  volatile store i8 -42, i8* %scevgep40.1.i, align 2
  volatile store i8 -42, i8* %scevgep.1.i, align 1
  %scevgep.2.i = getelementptr [5 x [4 x [1 x i8]]]* %l_8.i, i64 0, i64 2, i64 3, i64 0
  %scevgep40.2.i = getelementptr [5 x [4 x [1 x i8]]]* %l_8.i, i64 0, i64 2, i64 2, i64 0
  %scevgep42.2.i = getelementptr [5 x [4 x [1 x i8]]]* %l_8.i, i64 0, i64 2, i64 1, i64 0
  %arrayidx45.254.i = getelementptr [5 x [4 x [1 x i8]]]* %l_8.i, i64 0, i64 2, i64 0, i64 0
  volatile store i8 -42, i8* %arrayidx45.254.i, align 8
  volatile store i8 -42, i8* %scevgep42.2.i, align 1
  volatile store i8 -42, i8* %scevgep40.2.i, align 2
  volatile store i8 -42, i8* %scevgep.2.i, align 1
  %scevgep.3.i = getelementptr [5 x [4 x [1 x i8]]]* %l_8.i, i64 0, i64 3, i64 3, i64 0
  %scevgep40.3.i = getelementptr [5 x [4 x [1 x i8]]]* %l_8.i, i64 0, i64 3, i64 2, i64 0
  %scevgep42.3.i = getelementptr [5 x [4 x [1 x i8]]]* %l_8.i, i64 0, i64 3, i64 1, i64 0
  %arrayidx45.359.i = getelementptr [5 x [4 x [1 x i8]]]* %l_8.i, i64 0, i64 3, i64 0, i64 0
  volatile store i8 -42, i8* %arrayidx45.359.i, align 4
  volatile store i8 -42, i8* %scevgep42.3.i, align 1
  volatile store i8 -42, i8* %scevgep40.3.i, align 2
  volatile store i8 -42, i8* %scevgep.3.i, align 1
  %scevgep.4.i = getelementptr [5 x [4 x [1 x i8]]]* %l_8.i, i64 0, i64 4, i64 3, i64 0
  %scevgep40.4.i = getelementptr [5 x [4 x [1 x i8]]]* %l_8.i, i64 0, i64 4, i64 2, i64 0
  %scevgep42.4.i = getelementptr [5 x [4 x [1 x i8]]]* %l_8.i, i64 0, i64 4, i64 1, i64 0
  %arrayidx45.4.i = getelementptr [5 x [4 x [1 x i8]]]* %l_8.i, i64 0, i64 4, i64 0, i64 0
  volatile store i8 -42, i8* %arrayidx45.4.i, align 16
  volatile store i8 -42, i8* %scevgep42.4.i, align 1
  volatile store i8 -42, i8* %scevgep40.4.i, align 2
  volatile store i8 -42, i8* %scevgep.4.i, align 1
  %tmp102.i = volatile load i16* @g_2, align 2
  %conv.i = trunc i16 %tmp102.i to i8
  volatile store i8 %conv.i, i8* %scevgep40.3.i, align 2
  %tmp109.i = volatile load i16* @g_2, align 2
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  %tmp = volatile load i16* @g_2, align 2
  %conv = sext i16 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %conv) nounwind
  %tmp2 = volatile load i32* @g_4, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* getelementptr inbounds ([8 x i32]* @g_12, i64 0, i64 0), align 16
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = load i32* getelementptr inbounds ([8 x i32]* @g_12, i64 0, i64 1), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = load i32* getelementptr inbounds ([8 x i32]* @g_12, i64 0, i64 2), align 8
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str4, i64 0, i64 0), i32 %tmp8) nounwind
  %tmp10 = load i32* getelementptr inbounds ([8 x i32]* @g_12, i64 0, i64 3), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str5, i64 0, i64 0), i32 %tmp10) nounwind
  %tmp12 = load i32* getelementptr inbounds ([8 x i32]* @g_12, i64 0, i64 4), align 16
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str6, i64 0, i64 0), i32 %tmp12) nounwind
  %tmp14 = load i32* getelementptr inbounds ([8 x i32]* @g_12, i64 0, i64 5), align 4
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str7, i64 0, i64 0), i32 %tmp14) nounwind
  %tmp16 = load i32* getelementptr inbounds ([8 x i32]* @g_12, i64 0, i64 6), align 8
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str8, i64 0, i64 0), i32 %tmp16) nounwind
  %tmp18 = load i32* getelementptr inbounds ([8 x i32]* @g_12, i64 0, i64 7), align 4
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str9, i64 0, i64 0), i32 %tmp18) nounwind
  %tmp20 = load i32* getelementptr inbounds ([8 x i32]* @g_12, i64 0, i64 5), align 4
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str7, i64 0, i64 0), i32 %tmp20) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
