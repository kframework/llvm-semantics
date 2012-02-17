; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000443.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 0, align 4
@g_5 = global i32* @g_3, align 8
@g_4 = global [1 x [7 x i32**]] [[7 x i32**] [i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5]], align 16
@g_6 = global [8 x [6 x i32**]] [[6 x i32**] [i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5], [6 x i32**] [i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5], [6 x i32**] [i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5], [6 x i32**] [i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5], [6 x i32**] [i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5], [6 x i32**] [i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5], [6 x i32**] [i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5], [6 x i32**] [i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5]], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_2 = alloca [9 x [3 x [1 x [1 x [1 x i32*]]]]], align 16
  br label %for.inc39.2

for.end46:                                        ; preds = %for.inc39.2
  %arrayidx51 = getelementptr inbounds [9 x [3 x [1 x [1 x [1 x i32*]]]]]* %l_2, i64 0, i64 6, i64 2, i64 0, i64 0, i64 0
  %tmp52 = load i32** %arrayidx51, align 16
  store i32* %tmp52, i32** @g_5, align 8
  %tmp54 = load i32* @g_3, align 4
  ret i32 %tmp54

for.inc39.2:                                      ; preds = %entry, %for.inc39.2
  %indvar10 = phi i64 [ 0, %entry ], [ %indvar.next11, %for.inc39.2 ]
  %scevgep = getelementptr [9 x [3 x [1 x [1 x [1 x i32*]]]]]* %l_2, i64 0, i64 %indvar10, i64 2, i64 0, i64 0, i64 0
  %scevgep34 = getelementptr [9 x [3 x [1 x [1 x [1 x i32*]]]]]* %l_2, i64 0, i64 %indvar10, i64 1, i64 0, i64 0, i64 0
  %arrayidx29 = getelementptr [9 x [3 x [1 x [1 x [1 x i32*]]]]]* %l_2, i64 0, i64 %indvar10, i64 0, i64 0, i64 0, i64 0
  store i32* @g_3, i32** %arrayidx29, align 8
  store i32* @g_3, i32** %scevgep34, align 8
  store i32* @g_3, i32** %scevgep, align 8
  %indvar.next11 = add i64 %indvar10, 1
  %exitcond = icmp eq i64 %indvar.next11, 9
  br i1 %exitcond, label %for.end46, label %for.inc39.2
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %l_2.i = alloca [9 x [3 x [1 x [1 x [1 x i32*]]]]], align 16
  %0 = bitcast [9 x [3 x [1 x [1 x [1 x i32*]]]]]* %l_2.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  %arrayidx29.i = getelementptr [9 x [3 x [1 x [1 x [1 x i32*]]]]]* %l_2.i, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0
  %scevgep34.i = getelementptr [9 x [3 x [1 x [1 x [1 x i32*]]]]]* %l_2.i, i64 0, i64 0, i64 1, i64 0, i64 0, i64 0
  %scevgep.i = getelementptr [9 x [3 x [1 x [1 x [1 x i32*]]]]]* %l_2.i, i64 0, i64 0, i64 2, i64 0, i64 0, i64 0
  store i32* @g_3, i32** %arrayidx29.i, align 16
  store i32* @g_3, i32** %scevgep34.i, align 8
  store i32* @g_3, i32** %scevgep.i, align 16
  %arrayidx29.i.1 = getelementptr [9 x [3 x [1 x [1 x [1 x i32*]]]]]* %l_2.i, i64 0, i64 1, i64 0, i64 0, i64 0, i64 0
  %scevgep34.i.1 = getelementptr [9 x [3 x [1 x [1 x [1 x i32*]]]]]* %l_2.i, i64 0, i64 1, i64 1, i64 0, i64 0, i64 0
  %scevgep.i.1 = getelementptr [9 x [3 x [1 x [1 x [1 x i32*]]]]]* %l_2.i, i64 0, i64 1, i64 2, i64 0, i64 0, i64 0
  store i32* @g_3, i32** %arrayidx29.i.1, align 8
  store i32* @g_3, i32** %scevgep34.i.1, align 8
  store i32* @g_3, i32** %scevgep.i.1, align 8
  %arrayidx29.i.2 = getelementptr [9 x [3 x [1 x [1 x [1 x i32*]]]]]* %l_2.i, i64 0, i64 2, i64 0, i64 0, i64 0, i64 0
  %scevgep34.i.2 = getelementptr [9 x [3 x [1 x [1 x [1 x i32*]]]]]* %l_2.i, i64 0, i64 2, i64 1, i64 0, i64 0, i64 0
  %scevgep.i.2 = getelementptr [9 x [3 x [1 x [1 x [1 x i32*]]]]]* %l_2.i, i64 0, i64 2, i64 2, i64 0, i64 0, i64 0
  store i32* @g_3, i32** %arrayidx29.i.2, align 16
  store i32* @g_3, i32** %scevgep34.i.2, align 8
  store i32* @g_3, i32** %scevgep.i.2, align 16
  %arrayidx29.i.3 = getelementptr [9 x [3 x [1 x [1 x [1 x i32*]]]]]* %l_2.i, i64 0, i64 3, i64 0, i64 0, i64 0, i64 0
  %scevgep34.i.3 = getelementptr [9 x [3 x [1 x [1 x [1 x i32*]]]]]* %l_2.i, i64 0, i64 3, i64 1, i64 0, i64 0, i64 0
  %scevgep.i.3 = getelementptr [9 x [3 x [1 x [1 x [1 x i32*]]]]]* %l_2.i, i64 0, i64 3, i64 2, i64 0, i64 0, i64 0
  store i32* @g_3, i32** %arrayidx29.i.3, align 8
  store i32* @g_3, i32** %scevgep34.i.3, align 8
  store i32* @g_3, i32** %scevgep.i.3, align 8
  %arrayidx29.i.4 = getelementptr [9 x [3 x [1 x [1 x [1 x i32*]]]]]* %l_2.i, i64 0, i64 4, i64 0, i64 0, i64 0, i64 0
  %scevgep34.i.4 = getelementptr [9 x [3 x [1 x [1 x [1 x i32*]]]]]* %l_2.i, i64 0, i64 4, i64 1, i64 0, i64 0, i64 0
  %scevgep.i.4 = getelementptr [9 x [3 x [1 x [1 x [1 x i32*]]]]]* %l_2.i, i64 0, i64 4, i64 2, i64 0, i64 0, i64 0
  store i32* @g_3, i32** %arrayidx29.i.4, align 16
  store i32* @g_3, i32** %scevgep34.i.4, align 8
  store i32* @g_3, i32** %scevgep.i.4, align 16
  %arrayidx29.i.5 = getelementptr [9 x [3 x [1 x [1 x [1 x i32*]]]]]* %l_2.i, i64 0, i64 5, i64 0, i64 0, i64 0, i64 0
  %scevgep34.i.5 = getelementptr [9 x [3 x [1 x [1 x [1 x i32*]]]]]* %l_2.i, i64 0, i64 5, i64 1, i64 0, i64 0, i64 0
  %scevgep.i.5 = getelementptr [9 x [3 x [1 x [1 x [1 x i32*]]]]]* %l_2.i, i64 0, i64 5, i64 2, i64 0, i64 0, i64 0
  store i32* @g_3, i32** %arrayidx29.i.5, align 8
  store i32* @g_3, i32** %scevgep34.i.5, align 8
  store i32* @g_3, i32** %scevgep.i.5, align 8
  %arrayidx29.i.6 = getelementptr [9 x [3 x [1 x [1 x [1 x i32*]]]]]* %l_2.i, i64 0, i64 6, i64 0, i64 0, i64 0, i64 0
  %scevgep34.i.6 = getelementptr [9 x [3 x [1 x [1 x [1 x i32*]]]]]* %l_2.i, i64 0, i64 6, i64 1, i64 0, i64 0, i64 0
  %scevgep.i.6 = getelementptr [9 x [3 x [1 x [1 x [1 x i32*]]]]]* %l_2.i, i64 0, i64 6, i64 2, i64 0, i64 0, i64 0
  store i32* @g_3, i32** %arrayidx29.i.6, align 16
  store i32* @g_3, i32** %scevgep34.i.6, align 8
  store i32* @g_3, i32** %scevgep.i.6, align 16
  %arrayidx29.i.7 = getelementptr [9 x [3 x [1 x [1 x [1 x i32*]]]]]* %l_2.i, i64 0, i64 7, i64 0, i64 0, i64 0, i64 0
  %scevgep34.i.7 = getelementptr [9 x [3 x [1 x [1 x [1 x i32*]]]]]* %l_2.i, i64 0, i64 7, i64 1, i64 0, i64 0, i64 0
  %scevgep.i.7 = getelementptr [9 x [3 x [1 x [1 x [1 x i32*]]]]]* %l_2.i, i64 0, i64 7, i64 2, i64 0, i64 0, i64 0
  store i32* @g_3, i32** %arrayidx29.i.7, align 8
  store i32* @g_3, i32** %scevgep34.i.7, align 8
  store i32* @g_3, i32** %scevgep.i.7, align 8
  %arrayidx29.i.8 = getelementptr [9 x [3 x [1 x [1 x [1 x i32*]]]]]* %l_2.i, i64 0, i64 8, i64 0, i64 0, i64 0, i64 0
  %scevgep34.i.8 = getelementptr [9 x [3 x [1 x [1 x [1 x i32*]]]]]* %l_2.i, i64 0, i64 8, i64 1, i64 0, i64 0, i64 0
  %scevgep.i.8 = getelementptr [9 x [3 x [1 x [1 x [1 x i32*]]]]]* %l_2.i, i64 0, i64 8, i64 2, i64 0, i64 0, i64 0
  store i32* @g_3, i32** %arrayidx29.i.8, align 16
  store i32* @g_3, i32** %scevgep34.i.8, align 8
  store i32* @g_3, i32** %scevgep.i.8, align 16
  store i32* @g_3, i32** @g_5, align 8
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  %tmp = load i32* @g_3, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
