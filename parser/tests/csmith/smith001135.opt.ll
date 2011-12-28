; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001135.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_7 = global i32 1, align 4
@g_6 = constant i32* @g_7, align 8
@g_8 = global i32* @g_7, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
safe_div_func_int64_t_s_s.exit:
  %l_4 = alloca [3 x [9 x i32]], align 16
  %arrayidx8.8 = getelementptr [3 x [9 x i32]]* %l_4, i64 0, i64 0, i64 8
  %arrayidx8.7 = getelementptr [3 x [9 x i32]]* %l_4, i64 0, i64 0, i64 7
  %arrayidx8.6 = getelementptr [3 x [9 x i32]]* %l_4, i64 0, i64 0, i64 6
  %arrayidx8.5 = getelementptr [3 x [9 x i32]]* %l_4, i64 0, i64 0, i64 5
  %arrayidx8.4 = getelementptr [3 x [9 x i32]]* %l_4, i64 0, i64 0, i64 4
  %arrayidx8.3 = getelementptr [3 x [9 x i32]]* %l_4, i64 0, i64 0, i64 3
  %arrayidx8.2 = getelementptr [3 x [9 x i32]]* %l_4, i64 0, i64 0, i64 2
  %arrayidx8.1 = getelementptr [3 x [9 x i32]]* %l_4, i64 0, i64 0, i64 1
  %arrayidx8 = getelementptr [3 x [9 x i32]]* %l_4, i64 0, i64 0, i64 0
  store i32 3, i32* %arrayidx8, align 16
  store i32 3, i32* %arrayidx8.1, align 4
  store i32 3, i32* %arrayidx8.2, align 8
  store i32 3, i32* %arrayidx8.3, align 4
  store i32 3, i32* %arrayidx8.4, align 16
  store i32 3, i32* %arrayidx8.5, align 4
  store i32 3, i32* %arrayidx8.6, align 8
  store i32 3, i32* %arrayidx8.7, align 4
  store i32 3, i32* %arrayidx8.8, align 16
  %arrayidx8.8.1 = getelementptr [3 x [9 x i32]]* %l_4, i64 0, i64 1, i64 8
  %arrayidx8.7.1 = getelementptr [3 x [9 x i32]]* %l_4, i64 0, i64 1, i64 7
  %arrayidx8.6.1 = getelementptr [3 x [9 x i32]]* %l_4, i64 0, i64 1, i64 6
  %arrayidx8.5.1 = getelementptr [3 x [9 x i32]]* %l_4, i64 0, i64 1, i64 5
  %arrayidx8.4.1 = getelementptr [3 x [9 x i32]]* %l_4, i64 0, i64 1, i64 4
  %arrayidx8.3.1 = getelementptr [3 x [9 x i32]]* %l_4, i64 0, i64 1, i64 3
  %arrayidx8.2.1 = getelementptr [3 x [9 x i32]]* %l_4, i64 0, i64 1, i64 2
  %arrayidx8.1.1 = getelementptr [3 x [9 x i32]]* %l_4, i64 0, i64 1, i64 1
  %arrayidx8.111 = getelementptr [3 x [9 x i32]]* %l_4, i64 0, i64 1, i64 0
  store i32 3, i32* %arrayidx8.111, align 4
  store i32 3, i32* %arrayidx8.1.1, align 4
  store i32 3, i32* %arrayidx8.2.1, align 4
  store i32 3, i32* %arrayidx8.3.1, align 4
  store i32 3, i32* %arrayidx8.4.1, align 4
  store i32 3, i32* %arrayidx8.5.1, align 4
  store i32 3, i32* %arrayidx8.6.1, align 4
  store i32 3, i32* %arrayidx8.7.1, align 4
  store i32 3, i32* %arrayidx8.8.1, align 4
  %arrayidx8.8.2 = getelementptr [3 x [9 x i32]]* %l_4, i64 0, i64 2, i64 8
  %arrayidx8.7.2 = getelementptr [3 x [9 x i32]]* %l_4, i64 0, i64 2, i64 7
  %arrayidx8.6.2 = getelementptr [3 x [9 x i32]]* %l_4, i64 0, i64 2, i64 6
  %arrayidx8.5.2 = getelementptr [3 x [9 x i32]]* %l_4, i64 0, i64 2, i64 5
  %arrayidx8.4.2 = getelementptr [3 x [9 x i32]]* %l_4, i64 0, i64 2, i64 4
  %arrayidx8.3.2 = getelementptr [3 x [9 x i32]]* %l_4, i64 0, i64 2, i64 3
  %arrayidx8.2.2 = getelementptr [3 x [9 x i32]]* %l_4, i64 0, i64 2, i64 2
  %arrayidx8.1.2 = getelementptr [3 x [9 x i32]]* %l_4, i64 0, i64 2, i64 1
  %arrayidx8.212 = getelementptr [3 x [9 x i32]]* %l_4, i64 0, i64 2, i64 0
  store i32 3, i32* %arrayidx8.212, align 8
  store i32 3, i32* %arrayidx8.1.2, align 4
  store i32 3, i32* %arrayidx8.2.2, align 8
  store i32 3, i32* %arrayidx8.3.2, align 4
  store i32 3, i32* %arrayidx8.4.2, align 8
  store i32 3, i32* %arrayidx8.5.2, align 4
  store i32 3, i32* %arrayidx8.6.2, align 8
  store i32 3, i32* %arrayidx8.7.2, align 4
  store i32 3, i32* %arrayidx8.8.2, align 8
  %tmp21 = volatile load i32** @g_6, align 8
  %tmp22 = load i32* %tmp21, align 4
  %xor4 = xor i32 %tmp22, 1
  store i32 %xor4, i32* %tmp21, align 4
  %tmp25 = volatile load i32** @g_6, align 8
  %tmp26 = load i32* %tmp25, align 4
  %and = and i32 %tmp26, -9
  %tmp29 = volatile load i32** @g_8, align 8
  store i32 %and, i32* %tmp29, align 4
  %tmp30 = volatile load i32** @g_6, align 8
  %tmp44 = load i32* %arrayidx8.4, align 16
  ret i32 %tmp44
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %l_4.i = alloca [3 x [9 x i32]], align 16
  %0 = bitcast [3 x [9 x i32]]* %l_4.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  %arrayidx8.8.i = getelementptr [3 x [9 x i32]]* %l_4.i, i64 0, i64 0, i64 8
  %arrayidx8.7.i = getelementptr [3 x [9 x i32]]* %l_4.i, i64 0, i64 0, i64 7
  %arrayidx8.6.i = getelementptr [3 x [9 x i32]]* %l_4.i, i64 0, i64 0, i64 6
  %arrayidx8.5.i = getelementptr [3 x [9 x i32]]* %l_4.i, i64 0, i64 0, i64 5
  %arrayidx8.4.i = getelementptr [3 x [9 x i32]]* %l_4.i, i64 0, i64 0, i64 4
  %arrayidx8.3.i = getelementptr [3 x [9 x i32]]* %l_4.i, i64 0, i64 0, i64 3
  %arrayidx8.2.i = getelementptr [3 x [9 x i32]]* %l_4.i, i64 0, i64 0, i64 2
  %arrayidx8.1.i = getelementptr [3 x [9 x i32]]* %l_4.i, i64 0, i64 0, i64 1
  %arrayidx8.i = getelementptr [3 x [9 x i32]]* %l_4.i, i64 0, i64 0, i64 0
  store i32 3, i32* %arrayidx8.i, align 16
  store i32 3, i32* %arrayidx8.1.i, align 4
  store i32 3, i32* %arrayidx8.2.i, align 8
  store i32 3, i32* %arrayidx8.3.i, align 4
  store i32 3, i32* %arrayidx8.4.i, align 16
  store i32 3, i32* %arrayidx8.5.i, align 4
  store i32 3, i32* %arrayidx8.6.i, align 8
  store i32 3, i32* %arrayidx8.7.i, align 4
  store i32 3, i32* %arrayidx8.8.i, align 16
  %arrayidx8.8.1.i = getelementptr [3 x [9 x i32]]* %l_4.i, i64 0, i64 1, i64 8
  %arrayidx8.7.1.i = getelementptr [3 x [9 x i32]]* %l_4.i, i64 0, i64 1, i64 7
  %arrayidx8.6.1.i = getelementptr [3 x [9 x i32]]* %l_4.i, i64 0, i64 1, i64 6
  %arrayidx8.5.1.i = getelementptr [3 x [9 x i32]]* %l_4.i, i64 0, i64 1, i64 5
  %arrayidx8.4.1.i = getelementptr [3 x [9 x i32]]* %l_4.i, i64 0, i64 1, i64 4
  %arrayidx8.3.1.i = getelementptr [3 x [9 x i32]]* %l_4.i, i64 0, i64 1, i64 3
  %arrayidx8.2.1.i = getelementptr [3 x [9 x i32]]* %l_4.i, i64 0, i64 1, i64 2
  %arrayidx8.1.1.i = getelementptr [3 x [9 x i32]]* %l_4.i, i64 0, i64 1, i64 1
  %arrayidx8.111.i = getelementptr [3 x [9 x i32]]* %l_4.i, i64 0, i64 1, i64 0
  store i32 3, i32* %arrayidx8.111.i, align 4
  store i32 3, i32* %arrayidx8.1.1.i, align 4
  store i32 3, i32* %arrayidx8.2.1.i, align 4
  store i32 3, i32* %arrayidx8.3.1.i, align 4
  store i32 3, i32* %arrayidx8.4.1.i, align 4
  store i32 3, i32* %arrayidx8.5.1.i, align 4
  store i32 3, i32* %arrayidx8.6.1.i, align 4
  store i32 3, i32* %arrayidx8.7.1.i, align 4
  store i32 3, i32* %arrayidx8.8.1.i, align 4
  %arrayidx8.8.2.i = getelementptr [3 x [9 x i32]]* %l_4.i, i64 0, i64 2, i64 8
  %arrayidx8.7.2.i = getelementptr [3 x [9 x i32]]* %l_4.i, i64 0, i64 2, i64 7
  %arrayidx8.6.2.i = getelementptr [3 x [9 x i32]]* %l_4.i, i64 0, i64 2, i64 6
  %arrayidx8.5.2.i = getelementptr [3 x [9 x i32]]* %l_4.i, i64 0, i64 2, i64 5
  %arrayidx8.4.2.i = getelementptr [3 x [9 x i32]]* %l_4.i, i64 0, i64 2, i64 4
  %arrayidx8.3.2.i = getelementptr [3 x [9 x i32]]* %l_4.i, i64 0, i64 2, i64 3
  %arrayidx8.2.2.i = getelementptr [3 x [9 x i32]]* %l_4.i, i64 0, i64 2, i64 2
  %arrayidx8.1.2.i = getelementptr [3 x [9 x i32]]* %l_4.i, i64 0, i64 2, i64 1
  %arrayidx8.212.i = getelementptr [3 x [9 x i32]]* %l_4.i, i64 0, i64 2, i64 0
  store i32 3, i32* %arrayidx8.212.i, align 8
  store i32 3, i32* %arrayidx8.1.2.i, align 4
  store i32 3, i32* %arrayidx8.2.2.i, align 8
  store i32 3, i32* %arrayidx8.3.2.i, align 4
  store i32 3, i32* %arrayidx8.4.2.i, align 8
  store i32 3, i32* %arrayidx8.5.2.i, align 4
  store i32 3, i32* %arrayidx8.6.2.i, align 8
  store i32 3, i32* %arrayidx8.7.2.i, align 4
  store i32 3, i32* %arrayidx8.8.2.i, align 8
  %tmp21.i = volatile load i32** @g_6, align 8
  %tmp22.i = load i32* %tmp21.i, align 4
  %xor4.i = xor i32 %tmp22.i, 1
  store i32 %xor4.i, i32* %tmp21.i, align 4
  %tmp25.i = volatile load i32** @g_6, align 8
  %tmp26.i = load i32* %tmp25.i, align 4
  %and.i = and i32 %tmp26.i, -9
  %tmp29.i = volatile load i32** @g_8, align 8
  store i32 %and.i, i32* %tmp29.i, align 4
  %tmp30.i = volatile load i32** @g_6, align 8
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  %tmp = load i32* @g_7, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
