; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001368.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global [4 x i32] [i32 -447125152, i32 -447125152, i32 -447125152, i32 -447125152], align 16
@g_2 = global i32* getelementptr inbounds ([4 x i32]* @g_3, i64 0, i64 2), align 8
@.str = private unnamed_addr constant [22 x i8] c"checksum g_3[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_3[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_3[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_3[3] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
entry:
  %tmp = volatile load i32** @g_2, align 8
  volatile store i32* %tmp, i32** @g_2, align 8
  %tmp1 = load i32* getelementptr inbounds ([4 x i32]* @g_3, i64 0, i64 2), align 8
  %conv = trunc i32 %tmp1 to i16
  ret i16 %conv
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp.i = volatile load i32** @g_2, align 8
  volatile store i32* %tmp.i, i32** @g_2, align 8
  %tmp = load i32* getelementptr inbounds ([4 x i32]* @g_3, i64 0, i64 0), align 16
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* getelementptr inbounds ([4 x i32]* @g_3, i64 0, i64 1), align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* getelementptr inbounds ([4 x i32]* @g_3, i64 0, i64 2), align 8
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = load i32* getelementptr inbounds ([4 x i32]* @g_3, i64 0, i64 3), align 4
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = load i32* getelementptr inbounds ([4 x i32]* @g_3, i64 0, i64 2), align 8
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i64 0, i64 0), i32 %tmp8) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
