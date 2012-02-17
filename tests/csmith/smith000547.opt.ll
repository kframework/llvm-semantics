; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000547.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -5, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_5 = alloca [8 x [2 x [1 x [6 x i32]]]], align 16
  br label %for.inc28.1

return:                                           ; preds = %for.inc28.1
  store i32 0, i32* @g_2, align 4
  %arrayidx43 = getelementptr inbounds [8 x [2 x [1 x [6 x i32]]]]* %l_5, i64 0, i64 6, i64 0, i64 0, i64 4
  %tmp44 = load i32* %arrayidx43, align 16
  ret i32 %tmp44

for.inc28.1:                                      ; preds = %for.inc28.1, %entry
  %indvar9 = phi i64 [ 0, %entry ], [ %indvar.next10, %for.inc28.1 ]
  %scevgep = getelementptr [8 x [2 x [1 x [6 x i32]]]]* %l_5, i64 0, i64 %indvar9, i64 1, i64 0, i64 5
  %scevgep23 = getelementptr [8 x [2 x [1 x [6 x i32]]]]* %l_5, i64 0, i64 %indvar9, i64 1, i64 0, i64 4
  %scevgep26 = getelementptr [8 x [2 x [1 x [6 x i32]]]]* %l_5, i64 0, i64 %indvar9, i64 1, i64 0, i64 3
  %scevgep29 = getelementptr [8 x [2 x [1 x [6 x i32]]]]* %l_5, i64 0, i64 %indvar9, i64 1, i64 0, i64 2
  %scevgep32 = getelementptr [8 x [2 x [1 x [6 x i32]]]]* %l_5, i64 0, i64 %indvar9, i64 1, i64 0, i64 1
  %scevgep35 = getelementptr [8 x [2 x [1 x [6 x i32]]]]* %l_5, i64 0, i64 %indvar9, i64 1, i64 0, i64 0
  %arrayidx22.5 = getelementptr [8 x [2 x [1 x [6 x i32]]]]* %l_5, i64 0, i64 %indvar9, i64 0, i64 0, i64 5
  %arrayidx22.4 = getelementptr [8 x [2 x [1 x [6 x i32]]]]* %l_5, i64 0, i64 %indvar9, i64 0, i64 0, i64 4
  %arrayidx22.3 = getelementptr [8 x [2 x [1 x [6 x i32]]]]* %l_5, i64 0, i64 %indvar9, i64 0, i64 0, i64 3
  %arrayidx22.2 = getelementptr [8 x [2 x [1 x [6 x i32]]]]* %l_5, i64 0, i64 %indvar9, i64 0, i64 0, i64 2
  %arrayidx22.1 = getelementptr [8 x [2 x [1 x [6 x i32]]]]* %l_5, i64 0, i64 %indvar9, i64 0, i64 0, i64 1
  %arrayidx22 = getelementptr [8 x [2 x [1 x [6 x i32]]]]* %l_5, i64 0, i64 %indvar9, i64 0, i64 0, i64 0
  store i32 553545266, i32* %arrayidx22, align 16
  store i32 553545266, i32* %arrayidx22.1, align 4
  store i32 553545266, i32* %arrayidx22.2, align 8
  store i32 553545266, i32* %arrayidx22.3, align 4
  store i32 553545266, i32* %arrayidx22.4, align 16
  store i32 553545266, i32* %arrayidx22.5, align 4
  store i32 553545266, i32* %scevgep35, align 8
  store i32 553545266, i32* %scevgep32, align 4
  store i32 553545266, i32* %scevgep29, align 8
  store i32 553545266, i32* %scevgep26, align 4
  store i32 553545266, i32* %scevgep23, align 8
  store i32 553545266, i32* %scevgep, align 4
  %indvar.next10 = add i64 %indvar9, 1
  %exitcond = icmp eq i64 %indvar.next10, 8
  br i1 %exitcond, label %return, label %for.inc28.1
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %l_5.i = alloca [8 x [2 x [1 x [6 x i32]]]], align 16
  %0 = bitcast [8 x [2 x [1 x [6 x i32]]]]* %l_5.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  br label %for.inc28.1.i

for.inc28.1.i:                                    ; preds = %for.inc28.1.i, %entry
  %indvar9.i = phi i64 [ 0, %entry ], [ %1, %for.inc28.1.i ]
  %arrayidx22.i = getelementptr [8 x [2 x [1 x [6 x i32]]]]* %l_5.i, i64 0, i64 %indvar9.i, i64 0, i64 0, i64 0
  %arrayidx22.1.i = getelementptr [8 x [2 x [1 x [6 x i32]]]]* %l_5.i, i64 0, i64 %indvar9.i, i64 0, i64 0, i64 1
  %arrayidx22.2.i = getelementptr [8 x [2 x [1 x [6 x i32]]]]* %l_5.i, i64 0, i64 %indvar9.i, i64 0, i64 0, i64 2
  %arrayidx22.3.i = getelementptr [8 x [2 x [1 x [6 x i32]]]]* %l_5.i, i64 0, i64 %indvar9.i, i64 0, i64 0, i64 3
  %arrayidx22.4.i = getelementptr [8 x [2 x [1 x [6 x i32]]]]* %l_5.i, i64 0, i64 %indvar9.i, i64 0, i64 0, i64 4
  %arrayidx22.5.i = getelementptr [8 x [2 x [1 x [6 x i32]]]]* %l_5.i, i64 0, i64 %indvar9.i, i64 0, i64 0, i64 5
  %scevgep35.i = getelementptr [8 x [2 x [1 x [6 x i32]]]]* %l_5.i, i64 0, i64 %indvar9.i, i64 1, i64 0, i64 0
  %scevgep32.i = getelementptr [8 x [2 x [1 x [6 x i32]]]]* %l_5.i, i64 0, i64 %indvar9.i, i64 1, i64 0, i64 1
  %scevgep29.i = getelementptr [8 x [2 x [1 x [6 x i32]]]]* %l_5.i, i64 0, i64 %indvar9.i, i64 1, i64 0, i64 2
  %scevgep26.i = getelementptr [8 x [2 x [1 x [6 x i32]]]]* %l_5.i, i64 0, i64 %indvar9.i, i64 1, i64 0, i64 3
  %scevgep23.i = getelementptr [8 x [2 x [1 x [6 x i32]]]]* %l_5.i, i64 0, i64 %indvar9.i, i64 1, i64 0, i64 4
  %scevgep.i = getelementptr [8 x [2 x [1 x [6 x i32]]]]* %l_5.i, i64 0, i64 %indvar9.i, i64 1, i64 0, i64 5
  store i32 553545266, i32* %arrayidx22.i, align 16
  store i32 553545266, i32* %arrayidx22.1.i, align 4
  store i32 553545266, i32* %arrayidx22.2.i, align 8
  store i32 553545266, i32* %arrayidx22.3.i, align 4
  store i32 553545266, i32* %arrayidx22.4.i, align 16
  store i32 553545266, i32* %arrayidx22.5.i, align 4
  store i32 553545266, i32* %scevgep35.i, align 8
  store i32 553545266, i32* %scevgep32.i, align 4
  store i32 553545266, i32* %scevgep29.i, align 8
  store i32 553545266, i32* %scevgep26.i, align 4
  store i32 553545266, i32* %scevgep23.i, align 8
  store i32 553545266, i32* %scevgep.i, align 4
  %1 = add i64 %indvar9.i, 1
  %exitcond = icmp eq i64 %1, 8
  br i1 %exitcond, label %func_1.exit, label %for.inc28.1.i

func_1.exit:                                      ; preds = %for.inc28.1.i
  store i32 0, i32* @g_2, align 4
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 0) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
