; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001706.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_9 = global i32 1972767171, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  %l_12 = alloca [8 x [7 x [1 x i32]]], align 16
  br label %for.inc28.6

for.end35:                                        ; preds = %for.inc28.6
  %tmp38 = load i32* @g_9, align 4
  %and.i = and i32 %tmp38, -1733977065
  store i32 %and.i, i32* @g_9, align 4
  %conv49 = trunc i32 %and.i to i16
  ret i16 %conv49

for.inc28.6:                                      ; preds = %entry, %for.inc28.6
  %indvar8 = phi i64 [ 0, %entry ], [ %indvar.next9, %for.inc28.6 ]
  %scevgep = getelementptr [8 x [7 x [1 x i32]]]* %l_12, i64 0, i64 %indvar8, i64 6, i64 0
  %scevgep16 = getelementptr [8 x [7 x [1 x i32]]]* %l_12, i64 0, i64 %indvar8, i64 5, i64 0
  %scevgep18 = getelementptr [8 x [7 x [1 x i32]]]* %l_12, i64 0, i64 %indvar8, i64 4, i64 0
  %scevgep20 = getelementptr [8 x [7 x [1 x i32]]]* %l_12, i64 0, i64 %indvar8, i64 3, i64 0
  %scevgep22 = getelementptr [8 x [7 x [1 x i32]]]* %l_12, i64 0, i64 %indvar8, i64 2, i64 0
  %scevgep24 = getelementptr [8 x [7 x [1 x i32]]]* %l_12, i64 0, i64 %indvar8, i64 1, i64 0
  %arrayidx23 = getelementptr [8 x [7 x [1 x i32]]]* %l_12, i64 0, i64 %indvar8, i64 0, i64 0
  store i32 1, i32* %arrayidx23, align 4
  store i32 1, i32* %scevgep24, align 4
  store i32 1, i32* %scevgep22, align 4
  store i32 1, i32* %scevgep20, align 4
  store i32 1, i32* %scevgep18, align 4
  store i32 1, i32* %scevgep16, align 4
  store i32 1, i32* %scevgep, align 4
  %indvar.next9 = add i64 %indvar8, 1
  %exitcond = icmp eq i64 %indvar.next9, 8
  br i1 %exitcond, label %for.end35, label %for.inc28.6
}

define i32 @func_2(i8 zeroext %p_3, i32 %p_4, i64 %p_5, i8 zeroext %p_6) nounwind uwtable {
entry:
  %tmp1 = load i32* @g_9, align 4
  %and = and i32 %tmp1, -1733977065
  store i32 %and, i32* @g_9, align 4
  ret i32 %and
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %l_12.i = alloca [8 x [7 x [1 x i32]]], align 16
  %0 = bitcast [8 x [7 x [1 x i32]]]* %l_12.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  %arrayidx23.i = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 0, i64 0, i64 0
  %scevgep24.i = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 0, i64 1, i64 0
  %scevgep22.i = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 0, i64 2, i64 0
  %scevgep20.i = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 0, i64 3, i64 0
  %scevgep18.i = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 0, i64 4, i64 0
  %scevgep16.i = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 0, i64 5, i64 0
  %scevgep.i = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 0, i64 6, i64 0
  store i32 1, i32* %arrayidx23.i, align 16
  store i32 1, i32* %scevgep24.i, align 4
  store i32 1, i32* %scevgep22.i, align 8
  store i32 1, i32* %scevgep20.i, align 4
  store i32 1, i32* %scevgep18.i, align 16
  store i32 1, i32* %scevgep16.i, align 4
  store i32 1, i32* %scevgep.i, align 8
  %arrayidx23.i.1 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 1, i64 0, i64 0
  %scevgep24.i.1 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 1, i64 1, i64 0
  %scevgep22.i.1 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 1, i64 2, i64 0
  %scevgep20.i.1 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 1, i64 3, i64 0
  %scevgep18.i.1 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 1, i64 4, i64 0
  %scevgep16.i.1 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 1, i64 5, i64 0
  %scevgep.i.1 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 1, i64 6, i64 0
  store i32 1, i32* %arrayidx23.i.1, align 4
  store i32 1, i32* %scevgep24.i.1, align 4
  store i32 1, i32* %scevgep22.i.1, align 4
  store i32 1, i32* %scevgep20.i.1, align 4
  store i32 1, i32* %scevgep18.i.1, align 4
  store i32 1, i32* %scevgep16.i.1, align 4
  store i32 1, i32* %scevgep.i.1, align 4
  %arrayidx23.i.2 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 2, i64 0, i64 0
  %scevgep24.i.2 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 2, i64 1, i64 0
  %scevgep22.i.2 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 2, i64 2, i64 0
  %scevgep20.i.2 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 2, i64 3, i64 0
  %scevgep18.i.2 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 2, i64 4, i64 0
  %scevgep16.i.2 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 2, i64 5, i64 0
  %scevgep.i.2 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 2, i64 6, i64 0
  store i32 1, i32* %arrayidx23.i.2, align 8
  store i32 1, i32* %scevgep24.i.2, align 4
  store i32 1, i32* %scevgep22.i.2, align 8
  store i32 1, i32* %scevgep20.i.2, align 4
  store i32 1, i32* %scevgep18.i.2, align 8
  store i32 1, i32* %scevgep16.i.2, align 4
  store i32 1, i32* %scevgep.i.2, align 8
  %arrayidx23.i.3 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 3, i64 0, i64 0
  %scevgep24.i.3 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 3, i64 1, i64 0
  %scevgep22.i.3 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 3, i64 2, i64 0
  %scevgep20.i.3 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 3, i64 3, i64 0
  %scevgep18.i.3 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 3, i64 4, i64 0
  %scevgep16.i.3 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 3, i64 5, i64 0
  %scevgep.i.3 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 3, i64 6, i64 0
  store i32 1, i32* %arrayidx23.i.3, align 4
  store i32 1, i32* %scevgep24.i.3, align 4
  store i32 1, i32* %scevgep22.i.3, align 4
  store i32 1, i32* %scevgep20.i.3, align 4
  store i32 1, i32* %scevgep18.i.3, align 4
  store i32 1, i32* %scevgep16.i.3, align 4
  store i32 1, i32* %scevgep.i.3, align 4
  %arrayidx23.i.4 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 4, i64 0, i64 0
  %scevgep24.i.4 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 4, i64 1, i64 0
  %scevgep22.i.4 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 4, i64 2, i64 0
  %scevgep20.i.4 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 4, i64 3, i64 0
  %scevgep18.i.4 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 4, i64 4, i64 0
  %scevgep16.i.4 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 4, i64 5, i64 0
  %scevgep.i.4 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 4, i64 6, i64 0
  store i32 1, i32* %arrayidx23.i.4, align 16
  store i32 1, i32* %scevgep24.i.4, align 4
  store i32 1, i32* %scevgep22.i.4, align 8
  store i32 1, i32* %scevgep20.i.4, align 4
  store i32 1, i32* %scevgep18.i.4, align 16
  store i32 1, i32* %scevgep16.i.4, align 4
  store i32 1, i32* %scevgep.i.4, align 8
  %arrayidx23.i.5 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 5, i64 0, i64 0
  %scevgep24.i.5 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 5, i64 1, i64 0
  %scevgep22.i.5 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 5, i64 2, i64 0
  %scevgep20.i.5 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 5, i64 3, i64 0
  %scevgep18.i.5 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 5, i64 4, i64 0
  %scevgep16.i.5 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 5, i64 5, i64 0
  %scevgep.i.5 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 5, i64 6, i64 0
  store i32 1, i32* %arrayidx23.i.5, align 4
  store i32 1, i32* %scevgep24.i.5, align 4
  store i32 1, i32* %scevgep22.i.5, align 4
  store i32 1, i32* %scevgep20.i.5, align 4
  store i32 1, i32* %scevgep18.i.5, align 4
  store i32 1, i32* %scevgep16.i.5, align 4
  store i32 1, i32* %scevgep.i.5, align 4
  %arrayidx23.i.6 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 6, i64 0, i64 0
  %scevgep24.i.6 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 6, i64 1, i64 0
  %scevgep22.i.6 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 6, i64 2, i64 0
  %scevgep20.i.6 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 6, i64 3, i64 0
  %scevgep18.i.6 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 6, i64 4, i64 0
  %scevgep16.i.6 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 6, i64 5, i64 0
  %scevgep.i.6 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 6, i64 6, i64 0
  store i32 1, i32* %arrayidx23.i.6, align 8
  store i32 1, i32* %scevgep24.i.6, align 4
  store i32 1, i32* %scevgep22.i.6, align 8
  store i32 1, i32* %scevgep20.i.6, align 4
  store i32 1, i32* %scevgep18.i.6, align 8
  store i32 1, i32* %scevgep16.i.6, align 4
  store i32 1, i32* %scevgep.i.6, align 8
  %arrayidx23.i.7 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 7, i64 0, i64 0
  %scevgep24.i.7 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 7, i64 1, i64 0
  %scevgep22.i.7 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 7, i64 2, i64 0
  %scevgep20.i.7 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 7, i64 3, i64 0
  %scevgep18.i.7 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 7, i64 4, i64 0
  %scevgep16.i.7 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 7, i64 5, i64 0
  %scevgep.i.7 = getelementptr [8 x [7 x [1 x i32]]]* %l_12.i, i64 0, i64 7, i64 6, i64 0
  store i32 1, i32* %arrayidx23.i.7, align 4
  store i32 1, i32* %scevgep24.i.7, align 4
  store i32 1, i32* %scevgep22.i.7, align 4
  store i32 1, i32* %scevgep20.i.7, align 4
  store i32 1, i32* %scevgep18.i.7, align 4
  store i32 1, i32* %scevgep16.i.7, align 4
  store i32 1, i32* %scevgep.i.7, align 4
  %tmp38.i = load i32* @g_9, align 4
  %and.i.i = and i32 %tmp38.i, -1733977065
  store i32 %and.i.i, i32* @g_9, align 4
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %and.i.i) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
