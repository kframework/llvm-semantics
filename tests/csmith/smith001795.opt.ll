; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001795.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i32 1, align 4
@g_3 = global i32* @g_4, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
for.inc17.3.4:
  %l_2 = alloca [5 x [4 x [1 x i32]]], align 16
  %scevgep = getelementptr [5 x [4 x [1 x i32]]]* %l_2, i64 0, i64 0, i64 3, i64 0
  %scevgep14 = getelementptr [5 x [4 x [1 x i32]]]* %l_2, i64 0, i64 0, i64 2, i64 0
  %scevgep16 = getelementptr [5 x [4 x [1 x i32]]]* %l_2, i64 0, i64 0, i64 1, i64 0
  %arrayidx15 = getelementptr [5 x [4 x [1 x i32]]]* %l_2, i64 0, i64 0, i64 0, i64 0
  store i32 -7, i32* %arrayidx15, align 16
  store i32 -7, i32* %scevgep16, align 4
  store i32 -7, i32* %scevgep14, align 8
  store i32 -7, i32* %scevgep, align 4
  %scevgep.1 = getelementptr [5 x [4 x [1 x i32]]]* %l_2, i64 0, i64 1, i64 3, i64 0
  %scevgep14.1 = getelementptr [5 x [4 x [1 x i32]]]* %l_2, i64 0, i64 1, i64 2, i64 0
  %scevgep16.1 = getelementptr [5 x [4 x [1 x i32]]]* %l_2, i64 0, i64 1, i64 1, i64 0
  %arrayidx15.122 = getelementptr [5 x [4 x [1 x i32]]]* %l_2, i64 0, i64 1, i64 0, i64 0
  store i32 -7, i32* %arrayidx15.122, align 16
  store i32 -7, i32* %scevgep16.1, align 4
  store i32 -7, i32* %scevgep14.1, align 8
  store i32 -7, i32* %scevgep.1, align 4
  %scevgep.2 = getelementptr [5 x [4 x [1 x i32]]]* %l_2, i64 0, i64 2, i64 3, i64 0
  %scevgep14.2 = getelementptr [5 x [4 x [1 x i32]]]* %l_2, i64 0, i64 2, i64 2, i64 0
  %scevgep16.2 = getelementptr [5 x [4 x [1 x i32]]]* %l_2, i64 0, i64 2, i64 1, i64 0
  %arrayidx15.227 = getelementptr [5 x [4 x [1 x i32]]]* %l_2, i64 0, i64 2, i64 0, i64 0
  store i32 -7, i32* %arrayidx15.227, align 16
  store i32 -7, i32* %scevgep16.2, align 4
  store i32 -7, i32* %scevgep14.2, align 8
  store i32 -7, i32* %scevgep.2, align 4
  %scevgep.3 = getelementptr [5 x [4 x [1 x i32]]]* %l_2, i64 0, i64 3, i64 3, i64 0
  %scevgep14.3 = getelementptr [5 x [4 x [1 x i32]]]* %l_2, i64 0, i64 3, i64 2, i64 0
  %scevgep16.3 = getelementptr [5 x [4 x [1 x i32]]]* %l_2, i64 0, i64 3, i64 1, i64 0
  %arrayidx15.332 = getelementptr [5 x [4 x [1 x i32]]]* %l_2, i64 0, i64 3, i64 0, i64 0
  store i32 -7, i32* %arrayidx15.332, align 16
  store i32 -7, i32* %scevgep16.3, align 4
  store i32 -7, i32* %scevgep14.3, align 8
  store i32 -7, i32* %scevgep.3, align 4
  %scevgep.4 = getelementptr [5 x [4 x [1 x i32]]]* %l_2, i64 0, i64 4, i64 3, i64 0
  %scevgep14.4 = getelementptr [5 x [4 x [1 x i32]]]* %l_2, i64 0, i64 4, i64 2, i64 0
  %scevgep16.4 = getelementptr [5 x [4 x [1 x i32]]]* %l_2, i64 0, i64 4, i64 1, i64 0
  %arrayidx15.4 = getelementptr [5 x [4 x [1 x i32]]]* %l_2, i64 0, i64 4, i64 0, i64 0
  store i32 -7, i32* %arrayidx15.4, align 16
  store i32 -7, i32* %scevgep16.4, align 4
  store i32 -7, i32* %scevgep14.4, align 8
  store i32 -7, i32* %scevgep.4, align 4
  %tmp29 = volatile load i32** @g_3, align 8
  store i32 -7, i32* %tmp29, align 4
  %tmp30 = load i32* @g_4, align 4
  ret i32 %tmp30
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %l_2.i = alloca [5 x [4 x [1 x i32]]], align 16
  %0 = bitcast [5 x [4 x [1 x i32]]]* %l_2.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  %scevgep.i = getelementptr [5 x [4 x [1 x i32]]]* %l_2.i, i64 0, i64 0, i64 3, i64 0
  %scevgep14.i = getelementptr [5 x [4 x [1 x i32]]]* %l_2.i, i64 0, i64 0, i64 2, i64 0
  %scevgep16.i = getelementptr [5 x [4 x [1 x i32]]]* %l_2.i, i64 0, i64 0, i64 1, i64 0
  %arrayidx15.i = getelementptr [5 x [4 x [1 x i32]]]* %l_2.i, i64 0, i64 0, i64 0, i64 0
  store i32 -7, i32* %arrayidx15.i, align 16
  store i32 -7, i32* %scevgep16.i, align 4
  store i32 -7, i32* %scevgep14.i, align 8
  store i32 -7, i32* %scevgep.i, align 4
  %scevgep.1.i = getelementptr [5 x [4 x [1 x i32]]]* %l_2.i, i64 0, i64 1, i64 3, i64 0
  %scevgep14.1.i = getelementptr [5 x [4 x [1 x i32]]]* %l_2.i, i64 0, i64 1, i64 2, i64 0
  %scevgep16.1.i = getelementptr [5 x [4 x [1 x i32]]]* %l_2.i, i64 0, i64 1, i64 1, i64 0
  %arrayidx15.122.i = getelementptr [5 x [4 x [1 x i32]]]* %l_2.i, i64 0, i64 1, i64 0, i64 0
  store i32 -7, i32* %arrayidx15.122.i, align 16
  store i32 -7, i32* %scevgep16.1.i, align 4
  store i32 -7, i32* %scevgep14.1.i, align 8
  store i32 -7, i32* %scevgep.1.i, align 4
  %scevgep.2.i = getelementptr [5 x [4 x [1 x i32]]]* %l_2.i, i64 0, i64 2, i64 3, i64 0
  %scevgep14.2.i = getelementptr [5 x [4 x [1 x i32]]]* %l_2.i, i64 0, i64 2, i64 2, i64 0
  %scevgep16.2.i = getelementptr [5 x [4 x [1 x i32]]]* %l_2.i, i64 0, i64 2, i64 1, i64 0
  %arrayidx15.227.i = getelementptr [5 x [4 x [1 x i32]]]* %l_2.i, i64 0, i64 2, i64 0, i64 0
  store i32 -7, i32* %arrayidx15.227.i, align 16
  store i32 -7, i32* %scevgep16.2.i, align 4
  store i32 -7, i32* %scevgep14.2.i, align 8
  store i32 -7, i32* %scevgep.2.i, align 4
  %scevgep.3.i = getelementptr [5 x [4 x [1 x i32]]]* %l_2.i, i64 0, i64 3, i64 3, i64 0
  %scevgep14.3.i = getelementptr [5 x [4 x [1 x i32]]]* %l_2.i, i64 0, i64 3, i64 2, i64 0
  %scevgep16.3.i = getelementptr [5 x [4 x [1 x i32]]]* %l_2.i, i64 0, i64 3, i64 1, i64 0
  %arrayidx15.332.i = getelementptr [5 x [4 x [1 x i32]]]* %l_2.i, i64 0, i64 3, i64 0, i64 0
  store i32 -7, i32* %arrayidx15.332.i, align 16
  store i32 -7, i32* %scevgep16.3.i, align 4
  store i32 -7, i32* %scevgep14.3.i, align 8
  store i32 -7, i32* %scevgep.3.i, align 4
  %scevgep.4.i = getelementptr [5 x [4 x [1 x i32]]]* %l_2.i, i64 0, i64 4, i64 3, i64 0
  %scevgep14.4.i = getelementptr [5 x [4 x [1 x i32]]]* %l_2.i, i64 0, i64 4, i64 2, i64 0
  %scevgep16.4.i = getelementptr [5 x [4 x [1 x i32]]]* %l_2.i, i64 0, i64 4, i64 1, i64 0
  %arrayidx15.4.i = getelementptr [5 x [4 x [1 x i32]]]* %l_2.i, i64 0, i64 4, i64 0, i64 0
  store i32 -7, i32* %arrayidx15.4.i, align 16
  store i32 -7, i32* %scevgep16.4.i, align 4
  store i32 -7, i32* %scevgep14.4.i, align 8
  store i32 -7, i32* %scevgep.4.i, align 4
  %tmp29.i = volatile load i32** @g_3, align 8
  store i32 -7, i32* %tmp29.i, align 4
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  %tmp = load i32* @g_4, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
