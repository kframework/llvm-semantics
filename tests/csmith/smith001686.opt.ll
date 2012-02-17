; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001686.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_5 = global [3 x i32] zeroinitializer, align 4
@g_4 = global i32* getelementptr inbounds ([3 x i32]* @g_5, i64 0, i64 1), align 8
@g_3 = global i32** @g_4, align 8
@.str = private unnamed_addr constant [22 x i8] c"checksum g_5[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_5[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_5[2] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i8 @func_1() nounwind uwtable {
entry:
  %tmp17 = volatile load i32*** @g_3, align 8
  store i32* null, i32** %tmp17, align 8
  %tmp18 = load i32* getelementptr inbounds ([3 x i32]* @g_5, i64 0, i64 1), align 4
  %conv = trunc i32 %tmp18 to i8
  ret i8 %conv
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp17.i = volatile load i32*** @g_3, align 8
  store i32* null, i32** %tmp17.i, align 8
  %tmp = load i32* getelementptr inbounds ([3 x i32]* @g_5, i64 0, i64 0), align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* getelementptr inbounds ([3 x i32]* @g_5, i64 0, i64 1), align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* getelementptr inbounds ([3 x i32]* @g_5, i64 0, i64 2), align 4
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = load i32* getelementptr inbounds ([3 x i32]* @g_5, i64 0, i64 1), align 4
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i64 0, i64 0), i32 %tmp6) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
