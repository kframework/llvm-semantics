; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001913.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i16 -1, align 2
@g_13 = constant i8 -72, align 1
@g_17 = global i8 35, align 1
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_13 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_17 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  %tmp25 = volatile load i16* @g_4, align 2
  %tmp49 = load i8* @g_17, align 1
  %or = or i8 %tmp49, -9
  store i8 %or, i8* @g_17, align 1
  ret i16 247
}

define i32 @func_7(i8 zeroext %p_8, i32 %p_9, i32 %p_10, i16 zeroext %p_11) nounwind uwtable readnone {
entry:
  ret i32 249
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp25.i = volatile load i16* @g_4, align 2
  %tmp49.i = load i8* @g_17, align 1
  %or.i = or i8 %tmp49.i, -9
  store i8 %or.i, i8* @g_17, align 1
  %tmp = volatile load i16* @g_4, align 2
  %conv = zext i16 %tmp to i32
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %conv) nounwind
  %call2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i64 0, i64 0), i32 -72) nounwind
  %tmp3 = load i8* @g_17, align 1
  %conv4 = sext i8 %tmp3 to i32
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i64 0, i64 0), i32 %conv4) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
