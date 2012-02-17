; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000075.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_10 = global i32 5, align 4
@g_9 = global [7 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10], align 16
@g_20 = global i32* @g_10, align 8
@g_31 = global i8 -45, align 1
@.str = private unnamed_addr constant [20 x i8] c"checksum g_10 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_31 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %tmp3 = volatile load i32** @g_20, align 8
  %tmp8 = load i32* @g_10, align 4
  %tmp19.i = volatile load i32** @g_20, align 8
  %tmp20.i = load i32* %tmp19.i, align 4
  %xor.i = xor i32 %tmp20.i, %tmp8
  store i32 %xor.i, i32* %tmp19.i, align 4
  volatile store i32* null, i32** getelementptr inbounds ([7 x i32*]* @g_9, i64 0, i64 3), align 8
  store i32 1, i32* @g_10, align 4
  %tmp36 = load i8* @g_31, align 1
  %conv37 = zext i8 %tmp36 to i64
  ret i64 %conv37
}

define i32 @func_3(i16 zeroext %p_4, i8 signext %p_5, i32 %p_6, i32 %p_7, i32 %p_8) nounwind uwtable {
entry:
  volatile store i32* null, i32** getelementptr inbounds ([7 x i32*]* @g_9, i64 0, i64 3), align 8
  ret i32 -7
}

define signext i8 @func_12(i8 signext %p_13, i64 %p_14, i32 %p_15, i32 %p_16) nounwind uwtable {
for.end32:
  %tmp19 = volatile load i32** @g_20, align 8
  %tmp20 = load i32* %tmp19, align 4
  %xor = xor i32 %tmp20, %p_15
  store i32 %xor, i32* %tmp19, align 4
  ret i8 83
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp3.i = volatile load i32** @g_20, align 8
  %tmp8.i = load i32* @g_10, align 4
  %tmp19.i.i = volatile load i32** @g_20, align 8
  %tmp20.i.i = load i32* %tmp19.i.i, align 4
  %xor.i.i = xor i32 %tmp20.i.i, %tmp8.i
  store i32 %xor.i.i, i32* %tmp19.i.i, align 4
  volatile store i32* null, i32** getelementptr inbounds ([7 x i32*]* @g_9, i64 0, i64 3), align 8
  store i32 1, i32* @g_10, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str, i64 0, i64 0), i32 1) nounwind
  %tmp2 = load i8* @g_31, align 1
  %conv = zext i8 %tmp2 to i32
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i64 0, i64 0), i32 %conv) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
