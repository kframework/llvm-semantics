; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000391.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_9 = global i32 -2, align 4
@g_11 = global i32* @g_9, align 8
@g_10 = global i32** @g_11, align 8
@g_25 = global i32* @g_9, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %tmp3 = volatile load i32*** @g_10, align 8
  %tmp5.i = volatile load i32*** @g_10, align 8
  store i32* @g_9, i32** %tmp5.i, align 8
  %tmp20 = load i32* @g_9, align 4
  %conv23 = and i32 %tmp20, 65535
  %cmp42 = icmp eq i32 %conv23, 0
  %conv43 = zext i1 %cmp42 to i32
  %tmp44 = volatile load i32** @g_25, align 8
  store i32 %conv43, i32* %tmp44, align 4
  ret i64 65528
}

define i32 @func_4(i32 %p_5, i16 zeroext %p_6, i32 %p_7) nounwind uwtable {
entry:
  %tmp5 = volatile load i32*** @g_10, align 8
  store i32* @g_9, i32** %tmp5, align 8
  ret i32 0
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp3.i = volatile load i32*** @g_10, align 8
  %tmp5.i.i = volatile load i32*** @g_10, align 8
  store i32* @g_9, i32** %tmp5.i.i, align 8
  %tmp20.i = load i32* @g_9, align 4
  %conv23.i = and i32 %tmp20.i, 65535
  %cmp42.i = icmp eq i32 %conv23.i, 0
  %conv43.i = zext i1 %cmp42.i to i32
  %tmp44.i = volatile load i32** @g_25, align 8
  store i32 %conv43.i, i32* %tmp44.i, align 4
  %tmp = load i32* @g_9, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
