; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000467.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_6 = global i32* null, align 8
@g_8 = global i16 -1, align 2
@g_13 = global i32 1, align 4
@g_14 = global [4 x i32] [i32 -1, i32 -1, i32 -1, i32 -1], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_8 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_13 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [23 x i8] c"checksum g_14[0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"checksum g_14[1] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [23 x i8] c"checksum g_14[2] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [23 x i8] c"checksum g_14[3] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
entry:
  %tmp19 = load i32* @g_13, align 4
  %conv20 = trunc i32 %tmp19 to i16
  ret i16 %conv20
}

define i32* @func_2(i32* nocapture %p_3, i32 %p_4, i16 zeroext %p_5) nounwind uwtable readonly {
entry:
  %tmp = load i32** @g_6, align 8
  ret i32* %tmp
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp = load i16* @g_8, align 2
  %conv = sext i16 %tmp to i32
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %conv) nounwind
  %tmp2 = load i32* @g_13, align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* getelementptr inbounds ([4 x i32]* @g_14, i64 0, i64 0), align 16
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = load i32* getelementptr inbounds ([4 x i32]* @g_14, i64 0, i64 1), align 4
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = load i32* getelementptr inbounds ([4 x i32]* @g_14, i64 0, i64 2), align 8
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str4, i64 0, i64 0), i32 %tmp8) nounwind
  %tmp10 = load i32* getelementptr inbounds ([4 x i32]* @g_14, i64 0, i64 3), align 4
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str5, i64 0, i64 0), i32 %tmp10) nounwind
  %tmp12 = load i32* getelementptr inbounds ([4 x i32]* @g_14, i64 0, i64 2), align 8
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str4, i64 0, i64 0), i32 %tmp12) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
