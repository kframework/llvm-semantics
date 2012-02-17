; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000556.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_7 = global [9 x i32] [i32 1891830172, i32 1891830172, i32 1891830172, i32 1891830172, i32 1891830172, i32 1891830172, i32 1891830172, i32 1891830172, i32 1891830172], align 16
@g_9 = global i32 374868041, align 4
@g_14 = global i32* null, align 8
@.str = private unnamed_addr constant [22 x i8] c"checksum g_7[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_7[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_7[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_7[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_7[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_7[5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_7[6] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [22 x i8] c"checksum g_7[7] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [22 x i8] c"checksum g_7[8] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
entry:
  %tmp4 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_7, i64 0, i64 1), align 4
  %tmp5 = load i32* @g_9, align 4
  %tmp.i = volatile load i32* getelementptr inbounds ([9 x i32]* @g_7, i64 0, i64 4), align 16
  %or.i = or i32 %tmp.i, %tmp5
  store i32 %or.i, i32* @g_9, align 4
  store i32* null, i32** @g_14, align 8
  ret i16 -109
}

define i32* @func_2(i32 %p_3, i16 zeroext %p_4, i16 signext %p_5, i8 signext %p_6) nounwind uwtable {
entry:
  %tmp = volatile load i32* getelementptr inbounds ([9 x i32]* @g_7, i64 0, i64 4), align 16
  %tmp2 = load i32* @g_9, align 4
  %or = or i32 %tmp2, %tmp
  store i32 %or, i32* @g_9, align 4
  ret i32* @g_9
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp4.i = volatile load i32* getelementptr inbounds ([9 x i32]* @g_7, i64 0, i64 1), align 4
  %tmp5.i = load i32* @g_9, align 4
  %tmp.i.i = volatile load i32* getelementptr inbounds ([9 x i32]* @g_7, i64 0, i64 4), align 16
  %or.i.i = or i32 %tmp.i.i, %tmp5.i
  store i32 %or.i.i, i32* @g_9, align 4
  store i32* null, i32** @g_14, align 8
  %tmp = volatile load i32* getelementptr inbounds ([9 x i32]* @g_7, i64 0, i64 0), align 16
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_7, i64 0, i64 1), align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_7, i64 0, i64 2), align 8
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_7, i64 0, i64 3), align 4
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_7, i64 0, i64 4), align 16
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i64 0, i64 0), i32 %tmp8) nounwind
  %tmp10 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_7, i64 0, i64 5), align 4
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i64 0, i64 0), i32 %tmp10) nounwind
  %tmp12 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_7, i64 0, i64 6), align 8
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i64 0, i64 0), i32 %tmp12) nounwind
  %tmp14 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_7, i64 0, i64 7), align 4
  %call15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str7, i64 0, i64 0), i32 %tmp14) nounwind
  %tmp16 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_7, i64 0, i64 8), align 16
  %call17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str8, i64 0, i64 0), i32 %tmp16) nounwind
  %tmp18 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_7, i64 0, i64 4), align 16
  %call19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i64 0, i64 0), i32 %tmp18) nounwind
  %tmp20 = load i32* @g_9, align 4
  %call21 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str9, i64 0, i64 0), i32 %tmp20) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
