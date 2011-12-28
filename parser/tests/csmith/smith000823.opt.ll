; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000823.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_5 = global i32 -1, align 4
@g_18 = global i32 9, align 4
@g_17 = global i32* @g_18, align 8
@g_19 = global i32* @g_18, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_18 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
entry:
  %tmp7 = volatile load i32* @g_5, align 4
  %conv15 = and i32 %tmp7, 1
  %sub.i = sub i32 0, %conv15
  %xor = xor i32 %sub.i, -39
  %tmp21 = volatile load i32** @g_17, align 8
  store i32 %xor, i32* %tmp21, align 4
  %tmp22 = volatile load i32** @g_17, align 8
  %tmp23 = load i32* %tmp22, align 4
  %tmp24 = volatile load i32** @g_17, align 8
  store i32 %tmp23, i32* %tmp24, align 4
  %tmp28 = volatile load i32** @g_19, align 8
  store i32 -39, i32* %tmp28, align 4
  %tmp29 = volatile load i32* @g_5, align 4
  %conv30 = trunc i32 %tmp29 to i16
  ret i16 %conv30
}

define i32 @func_6(i8 zeroext %p_7) nounwind uwtable readnone {
safe_div_func_int64_t_s_s.exit:
  ret i32 1
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp7.i = volatile load i32* @g_5, align 4
  %conv15.i = and i32 %tmp7.i, 1
  %sub.i.i = sub i32 0, %conv15.i
  %xor.i = xor i32 %sub.i.i, -39
  %tmp21.i = volatile load i32** @g_17, align 8
  store i32 %xor.i, i32* %tmp21.i, align 4
  %tmp22.i = volatile load i32** @g_17, align 8
  %tmp23.i = load i32* %tmp22.i, align 4
  %tmp24.i = volatile load i32** @g_17, align 8
  store i32 %tmp23.i, i32* %tmp24.i, align 4
  %tmp28.i = volatile load i32** @g_19, align 8
  store i32 -39, i32* %tmp28.i, align 4
  %tmp29.i = volatile load i32* @g_5, align 4
  %tmp = volatile load i32* @g_5, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* @g_18, align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
