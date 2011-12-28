; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001119.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_7 = global i8 -93, align 1
@g_8 = global i8 0, align 1
@.str = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_8 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_15 = alloca [4 x [5 x [1 x [1 x i16]]]], align 16
  br label %for.inc28.4

for.end35:                                        ; preds = %for.inc28.4
  %tmp36 = volatile load i8* @g_7, align 1
  %conv = zext i8 %tmp36 to i16
  %tmp37 = load i8* @g_8, align 1
  %conv38 = sext i8 %tmp37 to i16
  %add.i = add i16 %conv38, %conv
  %conv42 = sext i8 %tmp37 to i32
  %arrayidx49 = getelementptr inbounds [4 x [5 x [1 x [1 x i16]]]]* %l_15, i64 0, i64 2, i64 3, i64 0, i64 0
  %tmp50 = load i16* %arrayidx49, align 2
  %conv51 = sext i16 %tmp50 to i32
  %cmp54 = icmp sgt i32 %conv51, %conv42
  %conv55 = zext i1 %cmp54 to i32
  %cmp56 = icmp sgt i32 %conv42, %conv55
  %cmp73 = icmp slt i32 %conv51, %conv42
  %conv11.i.op = sext i1 %cmp56 to i16
  %tmp = select i1 %cmp73, i16 0, i16 %conv11.i.op
  %mul.i = and i16 %tmp, %add.i
  %tobool = icmp eq i16 %mul.i, 0
  %storemerge1 = select i1 %tobool, i32 162, i32 %conv42
  ret i32 %storemerge1

for.inc28.4:                                      ; preds = %entry, %for.inc28.4
  %indvar17 = phi i64 [ 0, %entry ], [ %indvar.next18, %for.inc28.4 ]
  %scevgep = getelementptr [4 x [5 x [1 x [1 x i16]]]]* %l_15, i64 0, i64 %indvar17, i64 4, i64 0, i64 0
  %scevgep34 = getelementptr [4 x [5 x [1 x [1 x i16]]]]* %l_15, i64 0, i64 %indvar17, i64 3, i64 0, i64 0
  %scevgep37 = getelementptr [4 x [5 x [1 x [1 x i16]]]]* %l_15, i64 0, i64 %indvar17, i64 2, i64 0, i64 0
  %scevgep40 = getelementptr [4 x [5 x [1 x [1 x i16]]]]* %l_15, i64 0, i64 %indvar17, i64 1, i64 0, i64 0
  %arrayidx22 = getelementptr [4 x [5 x [1 x [1 x i16]]]]* %l_15, i64 0, i64 %indvar17, i64 0, i64 0, i64 0
  store i16 22799, i16* %arrayidx22, align 2
  store i16 22799, i16* %scevgep40, align 2
  store i16 22799, i16* %scevgep37, align 2
  store i16 22799, i16* %scevgep34, align 2
  store i16 22799, i16* %scevgep, align 2
  %indvar.next18 = add i64 %indvar17, 1
  %exitcond = icmp eq i64 %indvar.next18, 4
  br i1 %exitcond, label %for.end35, label %for.inc28.4
}

define i32 @func_11(i8 zeroext %p_12) nounwind uwtable readonly {
entry:
  %tmp = load i8* @g_8, align 1
  %conv = sext i8 %tmp to i32
  ret i32 %conv
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %l_15.i = alloca [4 x [5 x [1 x [1 x i16]]]], align 16
  %0 = bitcast [4 x [5 x [1 x [1 x i16]]]]* %l_15.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  %arrayidx22.i = getelementptr [4 x [5 x [1 x [1 x i16]]]]* %l_15.i, i64 0, i64 0, i64 0, i64 0, i64 0
  %scevgep40.i = getelementptr [4 x [5 x [1 x [1 x i16]]]]* %l_15.i, i64 0, i64 0, i64 1, i64 0, i64 0
  %scevgep37.i = getelementptr [4 x [5 x [1 x [1 x i16]]]]* %l_15.i, i64 0, i64 0, i64 2, i64 0, i64 0
  %scevgep34.i = getelementptr [4 x [5 x [1 x [1 x i16]]]]* %l_15.i, i64 0, i64 0, i64 3, i64 0, i64 0
  %scevgep.i = getelementptr [4 x [5 x [1 x [1 x i16]]]]* %l_15.i, i64 0, i64 0, i64 4, i64 0, i64 0
  store i16 22799, i16* %arrayidx22.i, align 16
  store i16 22799, i16* %scevgep40.i, align 2
  store i16 22799, i16* %scevgep37.i, align 4
  store i16 22799, i16* %scevgep34.i, align 2
  store i16 22799, i16* %scevgep.i, align 8
  %arrayidx22.i.1 = getelementptr [4 x [5 x [1 x [1 x i16]]]]* %l_15.i, i64 0, i64 1, i64 0, i64 0, i64 0
  %scevgep40.i.1 = getelementptr [4 x [5 x [1 x [1 x i16]]]]* %l_15.i, i64 0, i64 1, i64 1, i64 0, i64 0
  %scevgep37.i.1 = getelementptr [4 x [5 x [1 x [1 x i16]]]]* %l_15.i, i64 0, i64 1, i64 2, i64 0, i64 0
  %scevgep34.i.1 = getelementptr [4 x [5 x [1 x [1 x i16]]]]* %l_15.i, i64 0, i64 1, i64 3, i64 0, i64 0
  %scevgep.i.1 = getelementptr [4 x [5 x [1 x [1 x i16]]]]* %l_15.i, i64 0, i64 1, i64 4, i64 0, i64 0
  store i16 22799, i16* %arrayidx22.i.1, align 2
  store i16 22799, i16* %scevgep40.i.1, align 2
  store i16 22799, i16* %scevgep37.i.1, align 2
  store i16 22799, i16* %scevgep34.i.1, align 2
  store i16 22799, i16* %scevgep.i.1, align 2
  %arrayidx22.i.2 = getelementptr [4 x [5 x [1 x [1 x i16]]]]* %l_15.i, i64 0, i64 2, i64 0, i64 0, i64 0
  %scevgep40.i.2 = getelementptr [4 x [5 x [1 x [1 x i16]]]]* %l_15.i, i64 0, i64 2, i64 1, i64 0, i64 0
  %scevgep37.i.2 = getelementptr [4 x [5 x [1 x [1 x i16]]]]* %l_15.i, i64 0, i64 2, i64 2, i64 0, i64 0
  %scevgep34.i.2 = getelementptr [4 x [5 x [1 x [1 x i16]]]]* %l_15.i, i64 0, i64 2, i64 3, i64 0, i64 0
  %scevgep.i.2 = getelementptr [4 x [5 x [1 x [1 x i16]]]]* %l_15.i, i64 0, i64 2, i64 4, i64 0, i64 0
  store i16 22799, i16* %arrayidx22.i.2, align 4
  store i16 22799, i16* %scevgep40.i.2, align 2
  store i16 22799, i16* %scevgep37.i.2, align 4
  store i16 22799, i16* %scevgep34.i.2, align 2
  store i16 22799, i16* %scevgep.i.2, align 4
  %arrayidx22.i.3 = getelementptr [4 x [5 x [1 x [1 x i16]]]]* %l_15.i, i64 0, i64 3, i64 0, i64 0, i64 0
  %scevgep40.i.3 = getelementptr [4 x [5 x [1 x [1 x i16]]]]* %l_15.i, i64 0, i64 3, i64 1, i64 0, i64 0
  %scevgep37.i.3 = getelementptr [4 x [5 x [1 x [1 x i16]]]]* %l_15.i, i64 0, i64 3, i64 2, i64 0, i64 0
  %scevgep34.i.3 = getelementptr [4 x [5 x [1 x [1 x i16]]]]* %l_15.i, i64 0, i64 3, i64 3, i64 0, i64 0
  %scevgep.i.3 = getelementptr [4 x [5 x [1 x [1 x i16]]]]* %l_15.i, i64 0, i64 3, i64 4, i64 0, i64 0
  store i16 22799, i16* %arrayidx22.i.3, align 2
  store i16 22799, i16* %scevgep40.i.3, align 2
  store i16 22799, i16* %scevgep37.i.3, align 2
  store i16 22799, i16* %scevgep34.i.3, align 2
  store i16 22799, i16* %scevgep.i.3, align 2
  %tmp36.i = volatile load i8* @g_7, align 1
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  %tmp = volatile load i8* @g_7, align 1
  %conv = zext i8 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %conv) nounwind
  %tmp2 = load i8* @g_8, align 1
  %conv3 = sext i8 %tmp2 to i32
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i64 0, i64 0), i32 %conv3) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
