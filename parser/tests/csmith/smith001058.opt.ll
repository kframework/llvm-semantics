; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001058.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_9 = global i32 5, align 4
@g_12 = global i32* @g_9, align 8
@g_11 = global i32** @g_12, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %tmp5 = volatile load i32*** @g_11, align 8
  store i32* @g_9, i32** %tmp5, align 8
  %tmp6 = volatile load i32*** @g_11, align 8
  %tmp7 = load i32** %tmp6, align 8
  %tmp8 = load i32* %tmp7, align 4
  ret i32 %tmp8
}

define i32* @func_2(i8 signext %p_3, i32* nocapture %p_4, i8 signext %p_5, i16 zeroext %p_6, i64 %p_7) nounwind uwtable readnone {
entry:
  ret i32* @g_9
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp5.i = volatile load i32*** @g_11, align 8
  store i32* @g_9, i32** %tmp5.i, align 8
  %tmp6.i = volatile load i32*** @g_11, align 8
  %tmp = load i32* @g_9, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
