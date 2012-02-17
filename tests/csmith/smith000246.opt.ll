; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000246.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_7 = global [8 x i32] [i32 -167511435, i32 -167511435, i32 -167511435, i32 -167511435, i32 -167511435, i32 -167511435, i32 -167511435, i32 -167511435], align 16
@g_10 = global i32 7, align 4
@g_9 = global [10 x [8 x i32*]] [[8 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10], [8 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10], [8 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10], [8 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10], [8 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10], [8 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10], [8 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10], [8 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10], [8 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10], [8 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10]], align 16
@g_11 = global [7 x [3 x i32*]] [[3 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10], [3 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10], [3 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10], [3 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10], [3 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10], [3 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10], [3 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10]], align 16
@g_12 = global [4 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10], align 16
@g_13 = global i32* null, align 8
@g_14 = global i32* @g_10, align 8
@.str = private unnamed_addr constant [22 x i8] c"checksum g_7[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_7[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_7[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_7[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_7[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_7[5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_7[6] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [22 x i8] c"checksum g_7[7] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [20 x i8] c"checksum g_10 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %tmp.i = load i32* getelementptr inbounds ([8 x i32]* @g_7, i64 0, i64 4), align 16
  %tmp5 = volatile load i32** @g_14, align 8
  store i32 %tmp.i, i32* %tmp5, align 4
  %tmp7 = load i32* @g_10, align 4
  %xor = xor i32 %tmp7, 1
  store i32 %xor, i32* @g_10, align 4
  ret i32 %xor
}

define i32 @func_2(i32 %p_3, i16 signext %p_4, i8 signext %p_5, i32 %p_6) nounwind uwtable readonly {
entry:
  %tmp = load i32* getelementptr inbounds ([8 x i32]* @g_7, i64 0, i64 4), align 16
  ret i32 %tmp
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp.i.i = load i32* getelementptr inbounds ([8 x i32]* @g_7, i64 0, i64 4), align 16
  %tmp5.i = volatile load i32** @g_14, align 8
  store i32 %tmp.i.i, i32* %tmp5.i, align 4
  %tmp7.i = load i32* @g_10, align 4
  %xor.i = xor i32 %tmp7.i, 1
  store i32 %xor.i, i32* @g_10, align 4
  %tmp = load i32* getelementptr inbounds ([8 x i32]* @g_7, i64 0, i64 0), align 16
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* getelementptr inbounds ([8 x i32]* @g_7, i64 0, i64 1), align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* getelementptr inbounds ([8 x i32]* @g_7, i64 0, i64 2), align 8
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = load i32* getelementptr inbounds ([8 x i32]* @g_7, i64 0, i64 3), align 4
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = load i32* getelementptr inbounds ([8 x i32]* @g_7, i64 0, i64 4), align 16
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i64 0, i64 0), i32 %tmp8) nounwind
  %tmp10 = load i32* getelementptr inbounds ([8 x i32]* @g_7, i64 0, i64 5), align 4
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i64 0, i64 0), i32 %tmp10) nounwind
  %tmp12 = load i32* getelementptr inbounds ([8 x i32]* @g_7, i64 0, i64 6), align 8
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i64 0, i64 0), i32 %tmp12) nounwind
  %tmp14 = load i32* getelementptr inbounds ([8 x i32]* @g_7, i64 0, i64 7), align 4
  %call15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str7, i64 0, i64 0), i32 %tmp14) nounwind
  %tmp16 = load i32* getelementptr inbounds ([8 x i32]* @g_7, i64 0, i64 4), align 16
  %call17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i64 0, i64 0), i32 %tmp16) nounwind
  %tmp18 = load i32* @g_10, align 4
  %call19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str8, i64 0, i64 0), i32 %tmp18) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
