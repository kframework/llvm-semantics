; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000631.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 -577957117, align 4
@g_4 = global i32* @g_3, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
entry:
  %l_2 = alloca [9 x [7 x [1 x [1 x i32*]]]], align 16
  br label %for.inc28.6

for.end35:                                        ; preds = %for.inc28.6
  %arrayidx39 = getelementptr inbounds [9 x [7 x [1 x [1 x i32*]]]]* %l_2, i64 0, i64 7, i64 4, i64 0, i64 0
  %tmp40 = load i32** %arrayidx39, align 8
  store i32* %tmp40, i32** @g_4, align 8
  %tmp41 = load i32* @g_3, align 4
  %conv = trunc i32 %tmp41 to i16
  ret i16 %conv

for.inc28.6:                                      ; preds = %entry, %for.inc28.6
  %indvar8 = phi i64 [ 0, %entry ], [ %indvar.next9, %for.inc28.6 ]
  %scevgep = getelementptr [9 x [7 x [1 x [1 x i32*]]]]* %l_2, i64 0, i64 %indvar8, i64 6, i64 0, i64 0
  %scevgep22 = getelementptr [9 x [7 x [1 x [1 x i32*]]]]* %l_2, i64 0, i64 %indvar8, i64 5, i64 0, i64 0
  %scevgep25 = getelementptr [9 x [7 x [1 x [1 x i32*]]]]* %l_2, i64 0, i64 %indvar8, i64 4, i64 0, i64 0
  %scevgep28 = getelementptr [9 x [7 x [1 x [1 x i32*]]]]* %l_2, i64 0, i64 %indvar8, i64 3, i64 0, i64 0
  %scevgep31 = getelementptr [9 x [7 x [1 x [1 x i32*]]]]* %l_2, i64 0, i64 %indvar8, i64 2, i64 0, i64 0
  %scevgep34 = getelementptr [9 x [7 x [1 x [1 x i32*]]]]* %l_2, i64 0, i64 %indvar8, i64 1, i64 0, i64 0
  %arrayidx22 = getelementptr [9 x [7 x [1 x [1 x i32*]]]]* %l_2, i64 0, i64 %indvar8, i64 0, i64 0, i64 0
  store i32* @g_3, i32** %arrayidx22, align 8
  store i32* @g_3, i32** %scevgep34, align 8
  store i32* @g_3, i32** %scevgep31, align 8
  store i32* @g_3, i32** %scevgep28, align 8
  store i32* @g_3, i32** %scevgep25, align 8
  store i32* @g_3, i32** %scevgep22, align 8
  store i32* @g_3, i32** %scevgep, align 8
  %indvar.next9 = add i64 %indvar8, 1
  %exitcond = icmp eq i64 %indvar.next9, 9
  br i1 %exitcond, label %for.end35, label %for.inc28.6
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %l_2.i = alloca [9 x [7 x [1 x [1 x i32*]]]], align 16
  %0 = bitcast [9 x [7 x [1 x [1 x i32*]]]]* %l_2.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  br label %for.inc28.6.i

for.inc28.6.i:                                    ; preds = %for.inc28.6.i, %entry
  %indvar8.i = phi i64 [ 0, %entry ], [ %1, %for.inc28.6.i ]
  %arrayidx22.i = getelementptr [9 x [7 x [1 x [1 x i32*]]]]* %l_2.i, i64 0, i64 %indvar8.i, i64 0, i64 0, i64 0
  %scevgep34.i = getelementptr [9 x [7 x [1 x [1 x i32*]]]]* %l_2.i, i64 0, i64 %indvar8.i, i64 1, i64 0, i64 0
  %scevgep31.i = getelementptr [9 x [7 x [1 x [1 x i32*]]]]* %l_2.i, i64 0, i64 %indvar8.i, i64 2, i64 0, i64 0
  %scevgep28.i = getelementptr [9 x [7 x [1 x [1 x i32*]]]]* %l_2.i, i64 0, i64 %indvar8.i, i64 3, i64 0, i64 0
  %scevgep25.i = getelementptr [9 x [7 x [1 x [1 x i32*]]]]* %l_2.i, i64 0, i64 %indvar8.i, i64 4, i64 0, i64 0
  %scevgep22.i = getelementptr [9 x [7 x [1 x [1 x i32*]]]]* %l_2.i, i64 0, i64 %indvar8.i, i64 5, i64 0, i64 0
  %scevgep.i = getelementptr [9 x [7 x [1 x [1 x i32*]]]]* %l_2.i, i64 0, i64 %indvar8.i, i64 6, i64 0, i64 0
  store i32* @g_3, i32** %arrayidx22.i, align 8
  store i32* @g_3, i32** %scevgep34.i, align 8
  store i32* @g_3, i32** %scevgep31.i, align 8
  store i32* @g_3, i32** %scevgep28.i, align 8
  store i32* @g_3, i32** %scevgep25.i, align 8
  store i32* @g_3, i32** %scevgep22.i, align 8
  store i32* @g_3, i32** %scevgep.i, align 8
  %1 = add i64 %indvar8.i, 1
  %exitcond = icmp eq i64 %1, 9
  br i1 %exitcond, label %func_1.exit, label %for.inc28.6.i

func_1.exit:                                      ; preds = %for.inc28.6.i
  %arrayidx39.i = getelementptr inbounds [9 x [7 x [1 x [1 x i32*]]]]* %l_2.i, i64 0, i64 7, i64 4, i64 0, i64 0
  %tmp40.i = load i32** %arrayidx39.i, align 8
  store i32* %tmp40.i, i32** @g_4, align 8
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  %tmp = load i32* @g_3, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
