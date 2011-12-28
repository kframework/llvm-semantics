; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000770.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_5 = global i32 0, align 4
@g_8 = global i32 1997174728, align 4
@g_7 = global i32* @g_8, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_8 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
for.inc39.2.6:
  %l_12 = alloca [7 x [3 x [1 x i8]]], align 16
  %scevgep = getelementptr [7 x [3 x [1 x i8]]]* %l_12, i64 0, i64 0, i64 2, i64 0
  %scevgep19 = getelementptr [7 x [3 x [1 x i8]]]* %l_12, i64 0, i64 0, i64 1, i64 0
  %arrayidx34 = getelementptr [7 x [3 x [1 x i8]]]* %l_12, i64 0, i64 0, i64 0, i64 0
  store i8 -57, i8* %arrayidx34, align 16
  store i8 -57, i8* %scevgep19, align 1
  store i8 -57, i8* %scevgep, align 2
  %scevgep.1 = getelementptr [7 x [3 x [1 x i8]]]* %l_12, i64 0, i64 1, i64 2, i64 0
  %scevgep19.1 = getelementptr [7 x [3 x [1 x i8]]]* %l_12, i64 0, i64 1, i64 1, i64 0
  %arrayidx34.125 = getelementptr [7 x [3 x [1 x i8]]]* %l_12, i64 0, i64 1, i64 0, i64 0
  store i8 -57, i8* %arrayidx34.125, align 1
  store i8 -57, i8* %scevgep19.1, align 1
  store i8 -57, i8* %scevgep.1, align 1
  %scevgep.2 = getelementptr [7 x [3 x [1 x i8]]]* %l_12, i64 0, i64 2, i64 2, i64 0
  %scevgep19.2 = getelementptr [7 x [3 x [1 x i8]]]* %l_12, i64 0, i64 2, i64 1, i64 0
  %arrayidx34.230 = getelementptr [7 x [3 x [1 x i8]]]* %l_12, i64 0, i64 2, i64 0, i64 0
  store i8 -57, i8* %arrayidx34.230, align 2
  store i8 -57, i8* %scevgep19.2, align 1
  store i8 -57, i8* %scevgep.2, align 2
  %scevgep.3 = getelementptr [7 x [3 x [1 x i8]]]* %l_12, i64 0, i64 3, i64 2, i64 0
  %scevgep19.3 = getelementptr [7 x [3 x [1 x i8]]]* %l_12, i64 0, i64 3, i64 1, i64 0
  %arrayidx34.3 = getelementptr [7 x [3 x [1 x i8]]]* %l_12, i64 0, i64 3, i64 0, i64 0
  store i8 -57, i8* %arrayidx34.3, align 1
  store i8 -57, i8* %scevgep19.3, align 1
  store i8 -57, i8* %scevgep.3, align 1
  %scevgep.4 = getelementptr [7 x [3 x [1 x i8]]]* %l_12, i64 0, i64 4, i64 2, i64 0
  %scevgep19.4 = getelementptr [7 x [3 x [1 x i8]]]* %l_12, i64 0, i64 4, i64 1, i64 0
  %arrayidx34.4 = getelementptr [7 x [3 x [1 x i8]]]* %l_12, i64 0, i64 4, i64 0, i64 0
  store i8 -57, i8* %arrayidx34.4, align 4
  store i8 -57, i8* %scevgep19.4, align 1
  store i8 -57, i8* %scevgep.4, align 2
  %scevgep.5 = getelementptr [7 x [3 x [1 x i8]]]* %l_12, i64 0, i64 5, i64 2, i64 0
  %scevgep19.5 = getelementptr [7 x [3 x [1 x i8]]]* %l_12, i64 0, i64 5, i64 1, i64 0
  %arrayidx34.5 = getelementptr [7 x [3 x [1 x i8]]]* %l_12, i64 0, i64 5, i64 0, i64 0
  store i8 -57, i8* %arrayidx34.5, align 1
  store i8 -57, i8* %scevgep19.5, align 1
  store i8 -57, i8* %scevgep.5, align 1
  %scevgep.6 = getelementptr [7 x [3 x [1 x i8]]]* %l_12, i64 0, i64 6, i64 2, i64 0
  %scevgep19.6 = getelementptr [7 x [3 x [1 x i8]]]* %l_12, i64 0, i64 6, i64 1, i64 0
  %arrayidx34.6 = getelementptr [7 x [3 x [1 x i8]]]* %l_12, i64 0, i64 6, i64 0, i64 0
  store i8 -57, i8* %arrayidx34.6, align 2
  store i8 -57, i8* %scevgep19.6, align 1
  store i8 -57, i8* %scevgep.6, align 2
  %tmp47 = volatile load i32** @g_7, align 8
  volatile store i32* %tmp47, i32** @g_7, align 8
  volatile store i32 19, i32* @g_5, align 4
  %tmp50 = volatile load i32* @g_5, align 4
  %cmp51 = icmp ult i32 %tmp50, 4
  br i1 %cmp51, label %for.body52, label %for.end58

for.body52:                                       ; preds = %for.inc39.2.6
  %tmp53 = volatile load i32** @g_7, align 8
  %tmp54 = volatile load i32* %tmp53, align 4
  br label %return

for.end58:                                        ; preds = %for.inc39.2.6
  %tmp62 = load i8* %scevgep, align 2
  %conv63 = zext i8 %tmp62 to i32
  br label %return

return:                                           ; preds = %for.end58, %for.body52
  %storemerge2 = phi i32 [ %tmp54, %for.body52 ], [ %conv63, %for.end58 ]
  ret i32 %storemerge2
}

define i32* @func_2(i32* %p_3, i8 signext %p_4) nounwind uwtable {
entry:
  %tmp = volatile load i32* @g_5, align 4
  store i32 %tmp, i32* %p_3, align 4
  ret i32* %p_3
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %l_12.i = alloca [7 x [3 x [1 x i8]]], align 16
  %0 = getelementptr inbounds [7 x [3 x [1 x i8]]]* %l_12.i, i64 0, i64 0, i64 0, i64 0
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  call void @llvm.memset.p0i8.i64(i8* %0, i8 -57, i64 21, i32 16, i1 false)
  %tmp47.i = volatile load i32** @g_7, align 8
  volatile store i32* %tmp47.i, i32** @g_7, align 8
  volatile store i32 19, i32* @g_5, align 4
  %tmp50.i = volatile load i32* @g_5, align 4
  %cmp51.i = icmp ult i32 %tmp50.i, 4
  br i1 %cmp51.i, label %for.body52.i, label %func_1.exit

for.body52.i:                                     ; preds = %entry
  %tmp53.i = volatile load i32** @g_7, align 8
  %tmp54.i = volatile load i32* %tmp53.i, align 4
  br label %func_1.exit

func_1.exit:                                      ; preds = %entry, %for.body52.i
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  %tmp = volatile load i32* @g_5, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = volatile load i32* @g_8, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind
