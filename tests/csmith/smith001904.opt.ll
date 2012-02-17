; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001904.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 -1, align 4
@g_7 = global i32* null, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  store i32 -2, i32* @g_3, align 4
  store i32* @g_3, i32** @g_7, align 8
  ret i32 -1
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  store i32 -2, i32* @g_3, align 4
  store i32* @g_3, i32** @g_7, align 8
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 -2) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
