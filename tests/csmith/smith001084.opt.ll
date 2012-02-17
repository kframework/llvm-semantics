; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001084.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_11 = global i32 -2, align 4
@g_15 = global [5 x i32*] [i32* @g_11, i32* @g_11, i32* @g_11, i32* @g_11, i32* @g_11], align 16
@g_14 = global i32** getelementptr inbounds ([5 x i32*]* @g_15, i64 0, i64 3), align 8
@g_17 = global i32* @g_11, align 8
@.str = private unnamed_addr constant [20 x i8] c"checksum g_11 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
entry:
  %l_12.i = alloca [4 x [5 x [1 x i32*]]], align 16
  %0 = bitcast [4 x [5 x [1 x i32*]]]* %l_12.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  %1 = bitcast [4 x [5 x [1 x i32*]]]* %l_12.i to i8*
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 160, i32 16, i1 false)
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  %tmp4 = volatile load i32*** @g_14, align 8
  store i32* null, i32** %tmp4, align 8
  %tmp6 = volatile load i32** @g_17, align 8
  %tmp7 = load i32* %tmp6, align 4
  %and = and i32 %tmp7, 1
  store i32 %and, i32* %tmp6, align 4
  %tmp9 = load i32* @g_11, align 4
  %conv10 = trunc i32 %tmp9 to i8
  ret i8 %conv10
}

define i32* @func_2(i32* nocapture %p_3, i32* nocapture %p_4, i32 %p_5, i16 signext %p_6, i32* nocapture %p_7) nounwind uwtable readnone {
for.inc17.4.3:
  %l_12 = alloca [4 x [5 x [1 x i32*]]], align 16
  %scevgep = getelementptr [4 x [5 x [1 x i32*]]]* %l_12, i64 0, i64 0, i64 4, i64 0
  %scevgep15 = getelementptr [4 x [5 x [1 x i32*]]]* %l_12, i64 0, i64 0, i64 3, i64 0
  %scevgep17 = getelementptr [4 x [5 x [1 x i32*]]]* %l_12, i64 0, i64 0, i64 2, i64 0
  %scevgep19 = getelementptr [4 x [5 x [1 x i32*]]]* %l_12, i64 0, i64 0, i64 1, i64 0
  %arrayidx15 = getelementptr [4 x [5 x [1 x i32*]]]* %l_12, i64 0, i64 0, i64 0, i64 0
  store i32* null, i32** %arrayidx15, align 16
  store i32* null, i32** %scevgep19, align 8
  store i32* null, i32** %scevgep17, align 16
  store i32* null, i32** %scevgep15, align 8
  store i32* null, i32** %scevgep, align 16
  %scevgep.1 = getelementptr [4 x [5 x [1 x i32*]]]* %l_12, i64 0, i64 1, i64 4, i64 0
  %scevgep15.1 = getelementptr [4 x [5 x [1 x i32*]]]* %l_12, i64 0, i64 1, i64 3, i64 0
  %scevgep17.1 = getelementptr [4 x [5 x [1 x i32*]]]* %l_12, i64 0, i64 1, i64 2, i64 0
  %scevgep19.1 = getelementptr [4 x [5 x [1 x i32*]]]* %l_12, i64 0, i64 1, i64 1, i64 0
  %arrayidx15.125 = getelementptr [4 x [5 x [1 x i32*]]]* %l_12, i64 0, i64 1, i64 0, i64 0
  store i32* null, i32** %arrayidx15.125, align 8
  store i32* null, i32** %scevgep19.1, align 8
  store i32* null, i32** %scevgep17.1, align 8
  store i32* null, i32** %scevgep15.1, align 8
  store i32* null, i32** %scevgep.1, align 8
  %scevgep.2 = getelementptr [4 x [5 x [1 x i32*]]]* %l_12, i64 0, i64 2, i64 4, i64 0
  %scevgep15.2 = getelementptr [4 x [5 x [1 x i32*]]]* %l_12, i64 0, i64 2, i64 3, i64 0
  %scevgep17.2 = getelementptr [4 x [5 x [1 x i32*]]]* %l_12, i64 0, i64 2, i64 2, i64 0
  %scevgep19.2 = getelementptr [4 x [5 x [1 x i32*]]]* %l_12, i64 0, i64 2, i64 1, i64 0
  %arrayidx15.230 = getelementptr [4 x [5 x [1 x i32*]]]* %l_12, i64 0, i64 2, i64 0, i64 0
  store i32* null, i32** %arrayidx15.230, align 16
  store i32* null, i32** %scevgep19.2, align 8
  store i32* null, i32** %scevgep17.2, align 16
  store i32* null, i32** %scevgep15.2, align 8
  store i32* null, i32** %scevgep.2, align 16
  %scevgep.3 = getelementptr [4 x [5 x [1 x i32*]]]* %l_12, i64 0, i64 3, i64 4, i64 0
  %scevgep15.3 = getelementptr [4 x [5 x [1 x i32*]]]* %l_12, i64 0, i64 3, i64 3, i64 0
  %scevgep17.3 = getelementptr [4 x [5 x [1 x i32*]]]* %l_12, i64 0, i64 3, i64 2, i64 0
  %scevgep19.3 = getelementptr [4 x [5 x [1 x i32*]]]* %l_12, i64 0, i64 3, i64 1, i64 0
  %arrayidx15.335 = getelementptr [4 x [5 x [1 x i32*]]]* %l_12, i64 0, i64 3, i64 0, i64 0
  store i32* null, i32** %arrayidx15.335, align 8
  store i32* null, i32** %scevgep19.3, align 8
  store i32* null, i32** %scevgep17.3, align 8
  store i32* null, i32** %scevgep15.3, align 8
  store i32* null, i32** %scevgep.3, align 8
  %tmp39 = load i32** %scevgep15, align 8
  ret i32* %tmp39
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %l_12.i.i = alloca [4 x [5 x [1 x i32*]]], align 16
  %0 = bitcast [4 x [5 x [1 x i32*]]]* %l_12.i.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0) nounwind
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 160, i32 16, i1 false) nounwind
  call void @llvm.lifetime.end(i64 -1, i8* %0) nounwind
  %tmp4.i = volatile load i32*** @g_14, align 8
  store i32* null, i32** %tmp4.i, align 8
  %tmp6.i = volatile load i32** @g_17, align 8
  %tmp7.i = load i32* %tmp6.i, align 4
  %and.i = and i32 %tmp7.i, 1
  store i32 %and.i, i32* %tmp6.i, align 4
  %tmp9.i = load i32* @g_11, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str, i64 0, i64 0), i32 %tmp9.i) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind
