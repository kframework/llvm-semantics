; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000975.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_11 = global i8 3, align 1
@g_12 = global i32 0, align 4
@g_27 = global i32* null, align 8
@g_28 = global i32* null, align 8
@g_29 = global i32* null, align 8
@g_32 = global i32 -642882109, align 4
@g_31 = global i32* @g_32, align 8
@g_37 = global i32** @g_31, align 8
@.str = private unnamed_addr constant [20 x i8] c"checksum g_11 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_12 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_32 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
for.end50:
  store i32 0, i32* @g_12, align 4
  %tmp51 = load i8* @g_11, align 1
  %conv52 = sext i8 %tmp51 to i16
  ret i16 %conv52
}

define i32 @func_9(i64 %p_10) nounwind uwtable readnone {
entry:
  %conv = trunc i64 %p_10 to i32
  ret i32 %conv
}

define i32* @func_15(i32* %p_16, i32* nocapture %p_17, i64 %p_18, i32 %p_19) nounwind uwtable {
entry:
  %tmp = load i32* @g_12, align 4
  %tmp2 = load i32* %p_16, align 4
  %xor = xor i32 %tmp2, %tmp
  store i32 %xor, i32* %p_16, align 4
  ret i32* %p_16
}

define noalias i32* @func_20(i64 %p_21) nounwind uwtable readonly {
entry:
  %l_24 = alloca [7 x i32], align 16
  %l_30 = alloca i32, align 4
  store i32 831211331, i32* %l_30, align 4
  %arrayidx = getelementptr [7 x i32]* %l_24, i64 0, i64 0
  store i32 -4, i32* %arrayidx, align 16
  %arrayidx.1 = getelementptr [7 x i32]* %l_24, i64 0, i64 1
  store i32 -4, i32* %arrayidx.1, align 4
  %arrayidx.2 = getelementptr [7 x i32]* %l_24, i64 0, i64 2
  store i32 -4, i32* %arrayidx.2, align 8
  %arrayidx.3 = getelementptr [7 x i32]* %l_24, i64 0, i64 3
  store i32 -4, i32* %arrayidx.3, align 4
  %arrayidx.4 = getelementptr [7 x i32]* %l_24, i64 0, i64 4
  store i32 -4, i32* %arrayidx.4, align 16
  %arrayidx.5 = getelementptr [7 x i32]* %l_24, i64 0, i64 5
  store i32 -4, i32* %arrayidx.5, align 4
  %arrayidx.6 = getelementptr [7 x i32]* %l_24, i64 0, i64 6
  store i32 -4, i32* %arrayidx.6, align 8
  ret i32* %l_30
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  store i32 0, i32* @g_12, align 4
  %tmp51.i = load i8* @g_11, align 1
  %conv = sext i8 %tmp51.i to i32
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str, i64 0, i64 0), i32 %conv) nounwind
  %tmp2 = load i32* @g_12, align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* @g_32, align 4
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
