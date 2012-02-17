; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001327.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = constant i16 0, align 2
@g_8 = global i32 741758029, align 4
@g_10 = global i32 -10, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_8 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_10 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
lor.end:
  %tmp = volatile load i16* @g_4, align 2
  %conv = trunc i16 %tmp to i8
  %tmp6 = load i32* @g_8, align 4
  %tobool7 = icmp ne i32 %tmp6, 0
  %lor.ext = zext i1 %tobool7 to i32
  %cmp.i = icmp slt i8 %conv, 0
  %conv10.i = sext i8 %conv to i32
  %shr.i = select i1 %cmp.i, i32 0, i32 %lor.ext
  %cond.i = ashr i32 %conv10.i, %shr.i
  %tmp10 = load i32* @g_10, align 4
  %and = and i32 %cond.i, %tmp10
  store i32 %and, i32* @g_10, align 4
  %xor = xor i32 %tmp6, -1
  store i32 %xor, i32* @g_8, align 4
  %tmp14 = volatile load i16* @g_4, align 2
  %conv15 = zext i16 %tmp14 to i32
  ret i32 %conv15
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp.i = volatile load i16* @g_4, align 2
  %conv.i = trunc i16 %tmp.i to i8
  %tmp6.i = load i32* @g_8, align 4
  %tobool7.i = icmp ne i32 %tmp6.i, 0
  %lor.ext.i = zext i1 %tobool7.i to i32
  %cmp.i.i = icmp slt i8 %conv.i, 0
  %conv10.i.i = sext i8 %conv.i to i32
  %shr.i.i = select i1 %cmp.i.i, i32 0, i32 %lor.ext.i
  %cond.i.i = ashr i32 %conv10.i.i, %shr.i.i
  %tmp10.i = load i32* @g_10, align 4
  %and.i = and i32 %cond.i.i, %tmp10.i
  store i32 %and.i, i32* @g_10, align 4
  %xor.i = xor i32 %tmp6.i, -1
  store i32 %xor.i, i32* @g_8, align 4
  %tmp14.i = volatile load i16* @g_4, align 2
  %tmp = volatile load i16* @g_4, align 2
  %conv = zext i16 %tmp to i32
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %conv) nounwind
  %tmp2 = load i32* @g_8, align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* @g_10, align 4
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
