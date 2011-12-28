; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000045.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_10 = global i32 1108402532, align 4
@g_9 = global i32* @g_10, align 8
@g_15 = global [8 x i32*] zeroinitializer, align 16
@g_14 = global i32** getelementptr inbounds ([8 x i32*]* @g_15, i64 0, i64 6), align 8
@.str = private unnamed_addr constant [20 x i8] c"checksum g_10 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
for.inc10.1:
  %l_11.i = alloca i32*, align 8
  %l_16 = alloca [2 x [1 x i32]], align 4
  %arrayidx8 = getelementptr [2 x [1 x i32]]* %l_16, i64 0, i64 0, i64 0
  store i32 641538176, i32* %arrayidx8, align 4
  %arrayidx8.1 = getelementptr [2 x [1 x i32]]* %l_16, i64 0, i64 1, i64 0
  store i32 641538176, i32* %arrayidx8.1, align 4
  %tmp15 = volatile load i32** @g_9, align 8
  %0 = bitcast i32** %l_11.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  volatile store i32* @g_10, i32** %l_11.i, align 8
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  %tmp20 = volatile load i32*** @g_14, align 8
  store i32* @g_10, i32** %tmp20, align 8
  %arrayidx22 = getelementptr inbounds [2 x [1 x i32]]* %l_16, i64 0, i64 0, i64 0
  %tmp23 = load i32* %arrayidx22, align 4
  store i32 %tmp23, i32* @g_10, align 4
  %conv26 = trunc i32 %tmp23 to i16
  ret i16 %conv26
}

define i32* @func_2(i32* nocapture %p_3, i32* nocapture %p_4, i16 zeroext %p_5) nounwind uwtable {
entry:
  %l_11 = alloca i32*, align 8
  volatile store i32* @g_10, i32** %l_11, align 8
  ret i32* @g_10
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %l_11.i.i = alloca i32*, align 8
  %l_16.i = alloca [2 x [1 x i32]], align 4
  %0 = bitcast [2 x [1 x i32]]* %l_16.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0) nounwind
  %arrayidx8.i = getelementptr [2 x [1 x i32]]* %l_16.i, i64 0, i64 0, i64 0
  store i32 641538176, i32* %arrayidx8.i, align 4
  %arrayidx8.1.i = getelementptr [2 x [1 x i32]]* %l_16.i, i64 0, i64 1, i64 0
  store i32 641538176, i32* %arrayidx8.1.i, align 4
  %tmp15.i = volatile load i32** @g_9, align 8
  %1 = bitcast i32** %l_11.i.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %1) nounwind
  volatile store i32* @g_10, i32** %l_11.i.i, align 8
  call void @llvm.lifetime.end(i64 -1, i8* %1) nounwind
  %tmp20.i = volatile load i32*** @g_14, align 8
  store i32* @g_10, i32** %tmp20.i, align 8
  store i32 641538176, i32* @g_10, align 4
  call void @llvm.lifetime.end(i64 -1, i8* %0) nounwind
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str, i64 0, i64 0), i32 641538176) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
