; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001136.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 1, align 4
@g_15 = global i32 -1697824616, align 4
@g_14 = global i32* @g_15, align 8
@g_16 = global i32* null, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_15 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
return:
  store i32 17, i32* @g_2, align 4
  %tmp26 = volatile load i32** @g_14, align 8
  %tmp27 = load i32* %tmp26, align 4
  %or = or i32 %tmp27, 136
  store i32 %or, i32* %tmp26, align 4
  %tmp33 = load i32* @g_15, align 4
  %storemerge = trunc i32 %tmp33 to i8
  ret i8 %storemerge
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  store i32 17, i32* @g_2, align 4
  %tmp26.i = volatile load i32** @g_14, align 8
  %tmp27.i = load i32* %tmp26.i, align 4
  %or.i = or i32 %tmp27.i, 136
  store i32 %or.i, i32* %tmp26.i, align 4
  %tmp = load i32* @g_2, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* @g_15, align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
