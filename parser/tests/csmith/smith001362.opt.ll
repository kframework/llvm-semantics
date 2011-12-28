; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001362.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_9 = constant i32 -1793153426, align 4
@g_39 = global i32 -3, align 4
@g_41 = global i32 868786368, align 4
@g_40 = global i32* @g_41, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_39 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_41 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable readonly {
entry:
  %tmp = load i32** @g_40, align 8
  %tmp4 = load i32* %tmp, align 4
  ret i32 %tmp4
}

define i32* @func_2(i32* %p_3, i64 %p_4, i32 %p_5) nounwind uwtable {
entry:
  ret i32* @g_9
}

define i32 @func_15(i32 %p_16, i32* %p_17, i8 signext %p_18) nounwind uwtable {
entry:
  %tmp8 = load i32* %p_17, align 4
  %conv11 = and i32 %tmp8, 17866
  %or = xor i32 %conv11, 47741
  store i32 %or, i32* %p_17, align 4
  ret i32 -1793153426
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 -1793153426) nounwind
  %tmp = load i32* @g_39, align 4
  %call2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i64 0, i64 0), i32 %tmp) nounwind
  %tmp3 = load i32* @g_41, align 4
  %call4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i64 0, i64 0), i32 %tmp3) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
