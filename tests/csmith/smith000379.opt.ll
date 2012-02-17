; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000379.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = constant i8 9, align 1
@g_5 = global [8 x i32] zeroinitializer, align 16
@g_4 = global i32* getelementptr inbounds ([8 x i32]* @g_5, i64 0, i64 2), align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_5[0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_5[1] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_5[2] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_5[3] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_5[4] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_5[5] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [22 x i8] c"checksum g_5[6] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [22 x i8] c"checksum g_5[7] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %tmp = volatile load i32** @g_4, align 8
  store i32 9, i32* %tmp, align 4
  %tmp1 = load i32* getelementptr inbounds ([8 x i32]* @g_5, i64 0, i64 6), align 8
  %conv = sext i32 %tmp1 to i64
  ret i64 %conv
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp.i = volatile load i32** @g_4, align 8
  store i32 9, i32* %tmp.i, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 9) nounwind
  %tmp = load i32* getelementptr inbounds ([8 x i32]* @g_5, i64 0, i64 0), align 16
  %call2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i64 0, i64 0), i32 %tmp) nounwind
  %tmp3 = load i32* getelementptr inbounds ([8 x i32]* @g_5, i64 0, i64 1), align 4
  %call4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i64 0, i64 0), i32 %tmp3) nounwind
  %tmp5 = load i32* getelementptr inbounds ([8 x i32]* @g_5, i64 0, i64 2), align 8
  %call6 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i64 0, i64 0), i32 %tmp5) nounwind
  %tmp7 = load i32* getelementptr inbounds ([8 x i32]* @g_5, i64 0, i64 3), align 4
  %call8 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i64 0, i64 0), i32 %tmp7) nounwind
  %tmp9 = load i32* getelementptr inbounds ([8 x i32]* @g_5, i64 0, i64 4), align 16
  %call10 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i64 0, i64 0), i32 %tmp9) nounwind
  %tmp11 = load i32* getelementptr inbounds ([8 x i32]* @g_5, i64 0, i64 5), align 4
  %call12 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i64 0, i64 0), i32 %tmp11) nounwind
  %tmp13 = load i32* getelementptr inbounds ([8 x i32]* @g_5, i64 0, i64 6), align 8
  %call14 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str7, i64 0, i64 0), i32 %tmp13) nounwind
  %tmp15 = load i32* getelementptr inbounds ([8 x i32]* @g_5, i64 0, i64 7), align 4
  %call16 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str8, i64 0, i64 0), i32 %tmp15) nounwind
  %tmp17 = load i32* getelementptr inbounds ([8 x i32]* @g_5, i64 0, i64 2), align 8
  %call18 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i64 0, i64 0), i32 %tmp17) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
