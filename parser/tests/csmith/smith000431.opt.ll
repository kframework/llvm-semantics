; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000431.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_5 = global i32 4, align 4
@g_4 = global i32* @g_5, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %tmp = volatile load i32** @g_4, align 8
  store i32 0, i32* %tmp, align 4
  %tmp5 = volatile load i32** @g_4, align 8
  %tmp6 = load i32* %tmp5, align 4
  %tmp8 = load i32* @g_5, align 4
  %add.i = add i32 %tmp8, %tmp6
  %conv11 = and i32 %add.i, 65535
  %tmp14 = volatile load i32** @g_4, align 8
  store i32 %conv11, i32* %tmp14, align 4
  %tmp17 = volatile load i32** @g_4, align 8
  %tmp18 = load i32* %tmp17, align 4
  %conv19 = sext i32 %tmp18 to i64
  ret i64 %conv19
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp.i = volatile load i32** @g_4, align 8
  store i32 0, i32* %tmp.i, align 4
  %tmp5.i = volatile load i32** @g_4, align 8
  %tmp6.i = load i32* %tmp5.i, align 4
  %tmp8.i = load i32* @g_5, align 4
  %add.i.i = add i32 %tmp8.i, %tmp6.i
  %conv11.i = and i32 %add.i.i, 65535
  %tmp14.i = volatile load i32** @g_4, align 8
  store i32 %conv11.i, i32* %tmp14.i, align 4
  %tmp17.i = volatile load i32** @g_4, align 8
  %tmp = load i32* @g_5, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
