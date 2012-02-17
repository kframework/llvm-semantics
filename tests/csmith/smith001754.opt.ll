; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001754.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -9, align 4
@g_6 = constant i32* @g_2, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
return:
  store i32 0, i32* @g_2, align 4
  %tmp5 = volatile load i32** @g_6, align 8
  store i32 -1, i32* %tmp5, align 4
  %storemerge.in = load i32* @g_2, align 4
  %storemerge = sext i32 %storemerge.in to i64
  ret i64 %storemerge
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  store i32 0, i32* @g_2, align 4
  %tmp5.i = volatile load i32** @g_6, align 8
  store i32 -1, i32* %tmp5.i, align 4
  %storemerge.in.i = load i32* @g_2, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %storemerge.in.i) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
