; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001280.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 1049667108, align 4
@g_4 = global i32 9, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
for.end35:
  %l_2 = alloca [1 x [4 x i64]], align 16
  %l_5 = alloca [1 x [7 x i32]], align 16
  %arrayidx8.3 = getelementptr [1 x [4 x i64]]* %l_2, i64 0, i64 0, i64 3
  %arrayidx8.2 = getelementptr [1 x [4 x i64]]* %l_2, i64 0, i64 0, i64 2
  %arrayidx8.1 = getelementptr [1 x [4 x i64]]* %l_2, i64 0, i64 0, i64 1
  %arrayidx8 = getelementptr [1 x [4 x i64]]* %l_2, i64 0, i64 0, i64 0
  store i64 4160957051390178529, i64* %arrayidx8, align 16
  store i64 4160957051390178529, i64* %arrayidx8.1, align 8
  store i64 4160957051390178529, i64* %arrayidx8.2, align 16
  store i64 4160957051390178529, i64* %arrayidx8.3, align 8
  %arrayidx27.6 = getelementptr [1 x [7 x i32]]* %l_5, i64 0, i64 0, i64 6
  %arrayidx27.5 = getelementptr [1 x [7 x i32]]* %l_5, i64 0, i64 0, i64 5
  %arrayidx27.4 = getelementptr [1 x [7 x i32]]* %l_5, i64 0, i64 0, i64 4
  %arrayidx27.3 = getelementptr [1 x [7 x i32]]* %l_5, i64 0, i64 0, i64 3
  %arrayidx27.2 = getelementptr [1 x [7 x i32]]* %l_5, i64 0, i64 0, i64 2
  %arrayidx27.1 = getelementptr [1 x [7 x i32]]* %l_5, i64 0, i64 0, i64 1
  %arrayidx27 = getelementptr [1 x [7 x i32]]* %l_5, i64 0, i64 0, i64 0
  store i32 1435830023, i32* %arrayidx27, align 16
  store i32 1435830023, i32* %arrayidx27.1, align 4
  store i32 1435830023, i32* %arrayidx27.2, align 8
  store i32 1435830023, i32* %arrayidx27.3, align 4
  store i32 1435830023, i32* %arrayidx27.4, align 16
  store i32 1435830023, i32* %arrayidx27.5, align 4
  store i32 1435830023, i32* %arrayidx27.6, align 8
  volatile store i32 0, i32* @g_3, align 4
  %tmp376 = volatile load i32* @g_3, align 4
  %cmp387 = icmp slt i32 %tmp376, 1
  br i1 %cmp387, label %for.body39, label %for.end56

for.body39:                                       ; preds = %for.end35, %for.inc53
  volatile store i32 0, i32* @g_4, align 4
  %tmp414 = volatile load i32* @g_4, align 4
  %cmp425 = icmp slt i32 %tmp414, 4
  br i1 %cmp425, label %for.body43, label %for.inc53

for.body43:                                       ; preds = %for.body39, %for.body43
  %tmp44 = volatile load i32* @g_4, align 4
  %idxprom45 = sext i32 %tmp44 to i64
  %tmp46 = volatile load i32* @g_3, align 4
  %idxprom47 = sext i32 %tmp46 to i64
  %arrayidx49 = getelementptr inbounds [1 x [4 x i64]]* %l_2, i64 0, i64 %idxprom47, i64 %idxprom45
  store i64 -1469607814198321683, i64* %arrayidx49, align 8
  %tmp51 = volatile load i32* @g_4, align 4
  %add = add nsw i32 %tmp51, 1
  volatile store i32 %add, i32* @g_4, align 4
  %tmp41 = volatile load i32* @g_4, align 4
  %cmp42 = icmp slt i32 %tmp41, 4
  br i1 %cmp42, label %for.body43, label %for.inc53

for.inc53:                                        ; preds = %for.body43, %for.body39
  %tmp54 = volatile load i32* @g_3, align 4
  %add55 = add nsw i32 %tmp54, 1
  volatile store i32 %add55, i32* @g_3, align 4
  %tmp37 = volatile load i32* @g_3, align 4
  %cmp38 = icmp slt i32 %tmp37, 1
  br i1 %cmp38, label %for.body39, label %for.end56

for.end56:                                        ; preds = %for.inc53, %for.end35
  %arrayidx58 = getelementptr inbounds [1 x [7 x i32]]* %l_5, i64 0, i64 0, i64 4
  %tmp59 = load i32* %arrayidx58, align 16
  %conv = trunc i32 %tmp59 to i8
  ret i8 %conv
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %l_2.i = alloca [1 x [4 x i64]], align 16
  %l_5.i = alloca [1 x [7 x i32]], align 16
  %0 = bitcast [1 x [4 x i64]]* %l_2.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  %1 = bitcast [1 x [7 x i32]]* %l_5.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %1)
  %arrayidx8.3.i = getelementptr [1 x [4 x i64]]* %l_2.i, i64 0, i64 0, i64 3
  %arrayidx8.2.i = getelementptr [1 x [4 x i64]]* %l_2.i, i64 0, i64 0, i64 2
  %arrayidx8.1.i = getelementptr [1 x [4 x i64]]* %l_2.i, i64 0, i64 0, i64 1
  %arrayidx8.i = getelementptr [1 x [4 x i64]]* %l_2.i, i64 0, i64 0, i64 0
  store i64 4160957051390178529, i64* %arrayidx8.i, align 16
  store i64 4160957051390178529, i64* %arrayidx8.1.i, align 8
  store i64 4160957051390178529, i64* %arrayidx8.2.i, align 16
  store i64 4160957051390178529, i64* %arrayidx8.3.i, align 8
  %arrayidx27.6.i = getelementptr [1 x [7 x i32]]* %l_5.i, i64 0, i64 0, i64 6
  %arrayidx27.5.i = getelementptr [1 x [7 x i32]]* %l_5.i, i64 0, i64 0, i64 5
  %arrayidx27.4.i = getelementptr [1 x [7 x i32]]* %l_5.i, i64 0, i64 0, i64 4
  %arrayidx27.3.i = getelementptr [1 x [7 x i32]]* %l_5.i, i64 0, i64 0, i64 3
  %arrayidx27.2.i = getelementptr [1 x [7 x i32]]* %l_5.i, i64 0, i64 0, i64 2
  %arrayidx27.1.i = getelementptr [1 x [7 x i32]]* %l_5.i, i64 0, i64 0, i64 1
  %arrayidx27.i = getelementptr [1 x [7 x i32]]* %l_5.i, i64 0, i64 0, i64 0
  store i32 1435830023, i32* %arrayidx27.i, align 16
  store i32 1435830023, i32* %arrayidx27.1.i, align 4
  store i32 1435830023, i32* %arrayidx27.2.i, align 8
  store i32 1435830023, i32* %arrayidx27.3.i, align 4
  store i32 1435830023, i32* %arrayidx27.4.i, align 16
  store i32 1435830023, i32* %arrayidx27.5.i, align 4
  store i32 1435830023, i32* %arrayidx27.6.i, align 8
  volatile store i32 0, i32* @g_3, align 4
  %tmp376.i = volatile load i32* @g_3, align 4
  %cmp387.i = icmp slt i32 %tmp376.i, 1
  br i1 %cmp387.i, label %for.body39.i, label %func_1.exit

for.body39.i:                                     ; preds = %entry, %for.inc53.i
  volatile store i32 0, i32* @g_4, align 4
  %tmp414.i = volatile load i32* @g_4, align 4
  %cmp425.i = icmp slt i32 %tmp414.i, 4
  br i1 %cmp425.i, label %for.body43.i, label %for.inc53.i

for.body43.i:                                     ; preds = %for.body39.i, %for.body43.i
  %tmp44.i = volatile load i32* @g_4, align 4
  %idxprom45.i = sext i32 %tmp44.i to i64
  %tmp46.i = volatile load i32* @g_3, align 4
  %idxprom47.i = sext i32 %tmp46.i to i64
  %arrayidx49.i = getelementptr inbounds [1 x [4 x i64]]* %l_2.i, i64 0, i64 %idxprom47.i, i64 %idxprom45.i
  store i64 -1469607814198321683, i64* %arrayidx49.i, align 8
  %tmp51.i = volatile load i32* @g_4, align 4
  %add.i = add nsw i32 %tmp51.i, 1
  volatile store i32 %add.i, i32* @g_4, align 4
  %tmp41.i = volatile load i32* @g_4, align 4
  %cmp42.i = icmp slt i32 %tmp41.i, 4
  br i1 %cmp42.i, label %for.body43.i, label %for.inc53.i

for.inc53.i:                                      ; preds = %for.body43.i, %for.body39.i
  %tmp54.i = volatile load i32* @g_3, align 4
  %add55.i = add nsw i32 %tmp54.i, 1
  volatile store i32 %add55.i, i32* @g_3, align 4
  %tmp37.i = volatile load i32* @g_3, align 4
  %cmp38.i = icmp slt i32 %tmp37.i, 1
  br i1 %cmp38.i, label %for.body39.i, label %func_1.exit

func_1.exit:                                      ; preds = %for.inc53.i, %entry
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  call void @llvm.lifetime.end(i64 -1, i8* %1)
  %tmp = volatile load i32* @g_3, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = volatile load i32* @g_4, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
