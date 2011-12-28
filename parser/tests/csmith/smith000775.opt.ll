; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000775.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_9 = global i32 -1239700647, align 4
@g_8 = global i32* @g_9, align 8
@g_11 = global i32 0, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_11 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
entry:
  %tmp1 = volatile load i32* @g_9, align 4
  store i32* null, i32** @g_8, align 8
  %sub.i = sub i32 0, %tmp1
  %conv4 = and i32 %sub.i, 65535
  %tmp6 = load i32* @g_11, align 4
  %xor = xor i32 %tmp6, %conv4
  store i32 %xor, i32* @g_11, align 4
  %conv9 = trunc i32 %xor to i8
  ret i8 %conv9
}

define i32 @func_5(i32 %p_6) nounwind uwtable {
entry:
  store i32* null, i32** @g_8, align 8
  ret i32 %p_6
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp1.i = volatile load i32* @g_9, align 4
  store i32* null, i32** @g_8, align 8
  %sub.i.i = sub i32 0, %tmp1.i
  %conv4.i = and i32 %sub.i.i, 65535
  %tmp6.i = load i32* @g_11, align 4
  %xor.i = xor i32 %tmp6.i, %conv4.i
  store i32 %xor.i, i32* @g_11, align 4
  %tmp = volatile load i32* @g_9, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* @g_11, align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
