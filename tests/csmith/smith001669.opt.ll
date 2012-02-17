; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001669.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global [1 x i32] [i32 1], align 4
@g_15 = global i32 1799092786, align 4
@g_19 = global i32* getelementptr inbounds ([1 x i32]* @g_3, i64 0, i64 0), align 8
@g_18 = global i32** @g_19, align 8
@.str = private unnamed_addr constant [22 x i8] c"checksum g_3[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_15 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
for.end:
  store i32 194431532, i32* getelementptr inbounds ([1 x i32]* @g_3, i64 0, i64 0), align 4
  store i32 8, i32* @g_15, align 4
  ret i64 8
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  store i32 194431532, i32* getelementptr inbounds ([1 x i32]* @g_3, i64 0, i64 0), align 4
  store i32 8, i32* @g_15, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 194431532) nounwind
  %tmp2 = load i32* getelementptr inbounds ([1 x i32]* @g_3, i64 0, i64 0), align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* @g_15, align 4
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i64 0, i64 0), i32 %tmp4) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
