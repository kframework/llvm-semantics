; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001716.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 -1, align 4
@g_5 = global [10 x i32*] [i32* @g_3, i32* @g_3, i32* @g_3, i32* @g_3, i32* @g_3, i32* @g_3, i32* @g_3, i32* @g_3, i32* @g_3, i32* @g_3], align 16
@g_4 = constant i32** getelementptr inbounds ([10 x i32*]* @g_5, i64 0, i64 6), align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  %l_2 = alloca [8 x [9 x i32*]], align 16
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader, %entry
  %indvar4 = phi i64 [ 0, %entry ], [ %indvar.next5, %for.cond1.preheader ]
  %arrayidx8.8 = getelementptr [8 x [9 x i32*]]* %l_2, i64 0, i64 %indvar4, i64 8
  %arrayidx8.7 = getelementptr [8 x [9 x i32*]]* %l_2, i64 0, i64 %indvar4, i64 7
  %arrayidx8.6 = getelementptr [8 x [9 x i32*]]* %l_2, i64 0, i64 %indvar4, i64 6
  %arrayidx8.5 = getelementptr [8 x [9 x i32*]]* %l_2, i64 0, i64 %indvar4, i64 5
  %arrayidx8.4 = getelementptr [8 x [9 x i32*]]* %l_2, i64 0, i64 %indvar4, i64 4
  %arrayidx8.3 = getelementptr [8 x [9 x i32*]]* %l_2, i64 0, i64 %indvar4, i64 3
  %arrayidx8.2 = getelementptr [8 x [9 x i32*]]* %l_2, i64 0, i64 %indvar4, i64 2
  %arrayidx8.1 = getelementptr [8 x [9 x i32*]]* %l_2, i64 0, i64 %indvar4, i64 1
  %arrayidx8 = getelementptr [8 x [9 x i32*]]* %l_2, i64 0, i64 %indvar4, i64 0
  store i32* @g_3, i32** %arrayidx8, align 8
  store i32* @g_3, i32** %arrayidx8.1, align 8
  store i32* @g_3, i32** %arrayidx8.2, align 8
  store i32* @g_3, i32** %arrayidx8.3, align 8
  store i32* @g_3, i32** %arrayidx8.4, align 8
  store i32* @g_3, i32** %arrayidx8.5, align 8
  store i32* @g_3, i32** %arrayidx8.6, align 8
  store i32* @g_3, i32** %arrayidx8.7, align 8
  store i32* @g_3, i32** %arrayidx8.8, align 8
  %indvar.next5 = add i64 %indvar4, 1
  %exitcond = icmp eq i64 %indvar.next5, 8
  br i1 %exitcond, label %for.end13, label %for.cond1.preheader

for.end13:                                        ; preds = %for.cond1.preheader
  %arrayidx15 = getelementptr inbounds [8 x [9 x i32*]]* %l_2, i64 0, i64 7, i64 5
  %tmp16 = load i32** %arrayidx15, align 8
  %tmp17 = volatile load i32*** @g_4, align 8
  store i32* %tmp16, i32** %tmp17, align 8
  %tmp18 = load i32* @g_3, align 4
  %conv = trunc i32 %tmp18 to i16
  ret i16 %conv
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %l_2.i = alloca [8 x [9 x i32*]], align 16
  %0 = bitcast [8 x [9 x i32*]]* %l_2.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  br label %for.cond1.preheader.i

for.cond1.preheader.i:                            ; preds = %for.cond1.preheader.i, %entry
  %indvar4.i = phi i64 [ 0, %entry ], [ %1, %for.cond1.preheader.i ]
  %arrayidx8.i = getelementptr [8 x [9 x i32*]]* %l_2.i, i64 0, i64 %indvar4.i, i64 0
  %arrayidx8.1.i = getelementptr [8 x [9 x i32*]]* %l_2.i, i64 0, i64 %indvar4.i, i64 1
  %arrayidx8.2.i = getelementptr [8 x [9 x i32*]]* %l_2.i, i64 0, i64 %indvar4.i, i64 2
  %arrayidx8.3.i = getelementptr [8 x [9 x i32*]]* %l_2.i, i64 0, i64 %indvar4.i, i64 3
  %arrayidx8.4.i = getelementptr [8 x [9 x i32*]]* %l_2.i, i64 0, i64 %indvar4.i, i64 4
  %arrayidx8.5.i = getelementptr [8 x [9 x i32*]]* %l_2.i, i64 0, i64 %indvar4.i, i64 5
  %arrayidx8.6.i = getelementptr [8 x [9 x i32*]]* %l_2.i, i64 0, i64 %indvar4.i, i64 6
  %arrayidx8.7.i = getelementptr [8 x [9 x i32*]]* %l_2.i, i64 0, i64 %indvar4.i, i64 7
  %arrayidx8.8.i = getelementptr [8 x [9 x i32*]]* %l_2.i, i64 0, i64 %indvar4.i, i64 8
  store i32* @g_3, i32** %arrayidx8.i, align 8
  store i32* @g_3, i32** %arrayidx8.1.i, align 8
  store i32* @g_3, i32** %arrayidx8.2.i, align 8
  store i32* @g_3, i32** %arrayidx8.3.i, align 8
  store i32* @g_3, i32** %arrayidx8.4.i, align 8
  store i32* @g_3, i32** %arrayidx8.5.i, align 8
  store i32* @g_3, i32** %arrayidx8.6.i, align 8
  store i32* @g_3, i32** %arrayidx8.7.i, align 8
  store i32* @g_3, i32** %arrayidx8.8.i, align 8
  %1 = add i64 %indvar4.i, 1
  %exitcond = icmp eq i64 %1, 8
  br i1 %exitcond, label %func_1.exit, label %for.cond1.preheader.i

func_1.exit:                                      ; preds = %for.cond1.preheader.i
  %arrayidx15.i = getelementptr inbounds [8 x [9 x i32*]]* %l_2.i, i64 0, i64 7, i64 5
  %tmp16.i = load i32** %arrayidx15.i, align 8
  %tmp17.i = volatile load i32*** @g_4, align 8
  store i32* %tmp16.i, i32** %tmp17.i, align 8
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  %tmp = load i32* @g_3, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
