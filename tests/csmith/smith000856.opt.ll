; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000856.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i8 -30, align 1
@g_4 = global [10 x i32] [i32 1265003125, i32 1265003125, i32 1265003125, i32 1265003125, i32 1265003125, i32 1265003125, i32 1265003125, i32 1265003125, i32 1265003125, i32 1265003125], align 16
@g_5 = global i32* getelementptr inbounds ([10 x i32]* @g_4, i64 0, i64 5), align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_4[0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_4[1] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_4[2] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_4[3] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_4[4] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_4[5] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [22 x i8] c"checksum g_4[6] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [22 x i8] c"checksum g_4[7] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [22 x i8] c"checksum g_4[8] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [22 x i8] c"checksum g_4[9] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %tmp1 = volatile load i8* @g_3, align 1
  %cmp = icmp ugt i8 %tmp1, 8
  %conv3 = zext i1 %cmp to i32
  %tmp4 = load i32* getelementptr inbounds ([10 x i32]* @g_4, i64 0, i64 3), align 4
  %cmp7 = icmp eq i32 %tmp4, 9
  %conv8 = zext i1 %cmp7 to i32
  %or = or i32 %conv8, %conv3
  %neg = xor i32 %or, -1
  %tmp9 = volatile load i32** @g_5, align 8
  store i32 %neg, i32* %tmp9, align 4
  ret i64 9
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp1.i = volatile load i8* @g_3, align 1
  %cmp.i = icmp ugt i8 %tmp1.i, 8
  %conv3.i = zext i1 %cmp.i to i32
  %tmp4.i = load i32* getelementptr inbounds ([10 x i32]* @g_4, i64 0, i64 3), align 4
  %cmp7.i = icmp eq i32 %tmp4.i, 9
  %conv8.i = zext i1 %cmp7.i to i32
  %or.i = or i32 %conv8.i, %conv3.i
  %neg.i = xor i32 %or.i, -1
  %tmp9.i = volatile load i32** @g_5, align 8
  store i32 %neg.i, i32* %tmp9.i, align 4
  %tmp = volatile load i8* @g_3, align 1
  %conv = zext i8 %tmp to i32
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %conv) nounwind
  %tmp2 = load i32* getelementptr inbounds ([10 x i32]* @g_4, i64 0, i64 0), align 16
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* getelementptr inbounds ([10 x i32]* @g_4, i64 0, i64 1), align 4
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = load i32* getelementptr inbounds ([10 x i32]* @g_4, i64 0, i64 2), align 8
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = load i32* getelementptr inbounds ([10 x i32]* @g_4, i64 0, i64 3), align 4
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i64 0, i64 0), i32 %tmp8) nounwind
  %tmp10 = load i32* getelementptr inbounds ([10 x i32]* @g_4, i64 0, i64 4), align 16
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i64 0, i64 0), i32 %tmp10) nounwind
  %tmp12 = load i32* getelementptr inbounds ([10 x i32]* @g_4, i64 0, i64 5), align 4
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i64 0, i64 0), i32 %tmp12) nounwind
  %tmp14 = load i32* getelementptr inbounds ([10 x i32]* @g_4, i64 0, i64 6), align 8
  %call15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str7, i64 0, i64 0), i32 %tmp14) nounwind
  %tmp16 = load i32* getelementptr inbounds ([10 x i32]* @g_4, i64 0, i64 7), align 4
  %call17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str8, i64 0, i64 0), i32 %tmp16) nounwind
  %tmp18 = load i32* getelementptr inbounds ([10 x i32]* @g_4, i64 0, i64 8), align 16
  %call19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str9, i64 0, i64 0), i32 %tmp18) nounwind
  %tmp20 = load i32* getelementptr inbounds ([10 x i32]* @g_4, i64 0, i64 9), align 4
  %call21 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str10, i64 0, i64 0), i32 %tmp20) nounwind
  %tmp22 = load i32* getelementptr inbounds ([10 x i32]* @g_4, i64 0, i64 3), align 4
  %call23 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i64 0, i64 0), i32 %tmp22) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
