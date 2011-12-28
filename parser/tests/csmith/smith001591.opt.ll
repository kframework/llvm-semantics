; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001591.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 96995658, align 4
@g_15 = global [2 x i8] c"\06\06", align 1
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [23 x i8] c"checksum g_15[0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [23 x i8] c"checksum g_15[1] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %tmp37 = load i8* getelementptr inbounds ([2 x i8]* @g_15, i64 0, i64 0), align 1
  %conv42 = sext i8 %tmp37 to i32
  %or44 = or i32 %conv42, -1617219176
  store i32 %or44, i32* @g_3, align 4
  ret i32 %or44
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp37.i = load i8* getelementptr inbounds ([2 x i8]* @g_15, i64 0, i64 0), align 1
  %conv42.i = sext i8 %tmp37.i to i32
  %or44.i = or i32 %conv42.i, -1617219176
  store i32 %or44.i, i32* @g_3, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %or44.i) nounwind
  %tmp2 = load i8* getelementptr inbounds ([2 x i8]* @g_15, i64 0, i64 0), align 1
  %conv = sext i8 %tmp2 to i32
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str1, i64 0, i64 0), i32 %conv) nounwind
  %tmp4 = load i8* getelementptr inbounds ([2 x i8]* @g_15, i64 0, i64 1), align 1
  %conv5 = sext i8 %tmp4 to i32
  %call6 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i64 0, i64 0), i32 %conv5) nounwind
  %tmp7 = load i8* getelementptr inbounds ([2 x i8]* @g_15, i64 0, i64 0), align 1
  %conv8 = sext i8 %tmp7 to i32
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str1, i64 0, i64 0), i32 %conv8) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
