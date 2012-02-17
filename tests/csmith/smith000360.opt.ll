; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000360.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i32 9, align 4
@g_3 = global i32* @g_4, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
for.body:
  %l_2 = alloca [1 x i32*], align 8
  %l_5 = alloca [7 x [9 x [1 x i8]]], align 16
  %arrayidx = getelementptr [1 x i32*]* %l_2, i64 0, i64 0
  store i32* null, i32** %arrayidx, align 8
  br label %for.inc28.8

for.end35:                                        ; preds = %for.inc28.8
  %arrayidx36 = getelementptr inbounds [1 x i32*]* %l_2, i64 0, i64 0
  %tmp37 = load i32** %arrayidx36, align 8
  store i32* %tmp37, i32** @g_3, align 8
  %arrayidx40 = getelementptr inbounds [7 x [9 x [1 x i8]]]* %l_5, i64 0, i64 3, i64 8, i64 0
  %tmp41 = load i8* %arrayidx40, align 1
  %conv = sext i8 %tmp41 to i32
  ret i32 %conv

for.inc28.8:                                      ; preds = %for.inc28.8, %for.body
  %indvar8 = phi i64 [ %indvar.next9, %for.inc28.8 ], [ 0, %for.body ]
  %scevgep = getelementptr [7 x [9 x [1 x i8]]]* %l_5, i64 0, i64 %indvar8, i64 8, i64 0
  %scevgep16 = getelementptr [7 x [9 x [1 x i8]]]* %l_5, i64 0, i64 %indvar8, i64 7, i64 0
  %scevgep18 = getelementptr [7 x [9 x [1 x i8]]]* %l_5, i64 0, i64 %indvar8, i64 6, i64 0
  %scevgep20 = getelementptr [7 x [9 x [1 x i8]]]* %l_5, i64 0, i64 %indvar8, i64 5, i64 0
  %scevgep22 = getelementptr [7 x [9 x [1 x i8]]]* %l_5, i64 0, i64 %indvar8, i64 4, i64 0
  %scevgep24 = getelementptr [7 x [9 x [1 x i8]]]* %l_5, i64 0, i64 %indvar8, i64 3, i64 0
  %scevgep26 = getelementptr [7 x [9 x [1 x i8]]]* %l_5, i64 0, i64 %indvar8, i64 2, i64 0
  %scevgep28 = getelementptr [7 x [9 x [1 x i8]]]* %l_5, i64 0, i64 %indvar8, i64 1, i64 0
  %arrayidx23 = getelementptr [7 x [9 x [1 x i8]]]* %l_5, i64 0, i64 %indvar8, i64 0, i64 0
  store i8 16, i8* %arrayidx23, align 1
  store i8 16, i8* %scevgep28, align 1
  store i8 16, i8* %scevgep26, align 1
  store i8 16, i8* %scevgep24, align 1
  store i8 16, i8* %scevgep22, align 1
  store i8 16, i8* %scevgep20, align 1
  store i8 16, i8* %scevgep18, align 1
  store i8 16, i8* %scevgep16, align 1
  store i8 16, i8* %scevgep, align 1
  %indvar.next9 = add i64 %indvar8, 1
  %exitcond = icmp eq i64 %indvar.next9, 7
  br i1 %exitcond, label %for.end35, label %for.inc28.8
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %l_2.i = alloca [1 x i32*], align 8
  %l_5.i = alloca [7 x [9 x [1 x i8]]], align 16
  %0 = bitcast [1 x i32*]* %l_2.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  %1 = getelementptr inbounds [7 x [9 x [1 x i8]]]* %l_5.i, i64 0, i64 0, i64 0, i64 0
  call void @llvm.lifetime.start(i64 -1, i8* %1)
  %arrayidx.i = getelementptr [1 x i32*]* %l_2.i, i64 0, i64 0
  store i32* null, i32** %arrayidx.i, align 8
  call void @llvm.memset.p0i8.i64(i8* %1, i8 16, i64 63, i32 16, i1 false)
  store i32* null, i32** @g_3, align 8
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  call void @llvm.lifetime.end(i64 -1, i8* %1)
  %tmp = load i32* @g_4, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind
