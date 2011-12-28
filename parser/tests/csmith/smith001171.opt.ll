; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001171.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -3, align 4
@g_11 = global [10 x i32] [i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [23 x i8] c"checksum g_11[0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [23 x i8] c"checksum g_11[1] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"checksum g_11[2] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [23 x i8] c"checksum g_11[3] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [23 x i8] c"checksum g_11[4] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [23 x i8] c"checksum g_11[5] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [23 x i8] c"checksum g_11[6] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [23 x i8] c"checksum g_11[7] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [23 x i8] c"checksum g_11[8] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [23 x i8] c"checksum g_11[9] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
return:
  store i32 1, i32* @g_2, align 4
  %tmp31 = load i32* getelementptr inbounds ([10 x i32]* @g_11, i64 0, i64 2), align 8
  %and = and i32 %tmp31, 1
  store i32 %and, i32* getelementptr inbounds ([10 x i32]* @g_11, i64 0, i64 2), align 8
  ret i32 1
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  store i32 1, i32* @g_2, align 4
  %tmp31.i = load i32* getelementptr inbounds ([10 x i32]* @g_11, i64 0, i64 2), align 8
  %and.i = and i32 %tmp31.i, 1
  store i32 %and.i, i32* getelementptr inbounds ([10 x i32]* @g_11, i64 0, i64 2), align 8
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 1) nounwind
  %tmp2 = load i32* getelementptr inbounds ([10 x i32]* @g_11, i64 0, i64 0), align 16
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* getelementptr inbounds ([10 x i32]* @g_11, i64 0, i64 1), align 4
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = load i32* getelementptr inbounds ([10 x i32]* @g_11, i64 0, i64 2), align 8
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = load i32* getelementptr inbounds ([10 x i32]* @g_11, i64 0, i64 3), align 4
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str4, i64 0, i64 0), i32 %tmp8) nounwind
  %tmp10 = load i32* getelementptr inbounds ([10 x i32]* @g_11, i64 0, i64 4), align 16
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str5, i64 0, i64 0), i32 %tmp10) nounwind
  %tmp12 = load i32* getelementptr inbounds ([10 x i32]* @g_11, i64 0, i64 5), align 4
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str6, i64 0, i64 0), i32 %tmp12) nounwind
  %tmp14 = load i32* getelementptr inbounds ([10 x i32]* @g_11, i64 0, i64 6), align 8
  %call15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str7, i64 0, i64 0), i32 %tmp14) nounwind
  %tmp16 = load i32* getelementptr inbounds ([10 x i32]* @g_11, i64 0, i64 7), align 4
  %call17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str8, i64 0, i64 0), i32 %tmp16) nounwind
  %tmp18 = load i32* getelementptr inbounds ([10 x i32]* @g_11, i64 0, i64 8), align 16
  %call19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str9, i64 0, i64 0), i32 %tmp18) nounwind
  %tmp20 = load i32* getelementptr inbounds ([10 x i32]* @g_11, i64 0, i64 9), align 4
  %call21 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str10, i64 0, i64 0), i32 %tmp20) nounwind
  %tmp22 = load i32* getelementptr inbounds ([10 x i32]* @g_11, i64 0, i64 2), align 8
  %call23 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i64 0, i64 0), i32 %tmp22) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
