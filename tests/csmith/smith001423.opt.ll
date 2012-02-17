; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001423.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 1974829013, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_5 = alloca [3 x [9 x [3 x [1 x i16]]]], align 16
  br label %for.inc24.2

for.cond36.us:                                    ; preds = %for.inc32.2, %for.inc45.us
  %storemerge1.us = phi i32 [ %si1.sub14.i.us, %for.inc45.us ], [ 0, %for.inc32.2 ]
  %cmp38.us = icmp eq i32 %storemerge1.us, 29
  br i1 %cmp38.us, label %for.end47, label %for.inc45.us

for.inc45.us:                                     ; preds = %for.cond36.us
  %xor6.i.us = and i32 %storemerge1.us, 2147483647
  %sub.i.us = add nsw i32 %xor6.i.us, -2
  %and10.i.us = and i32 %sub.i.us, %storemerge1.us
  %sub14.i.us = add nsw i32 %storemerge1.us, -2
  %cmp.i.us = icmp slt i32 %and10.i.us, 0
  %si1.sub14.i.us = select i1 %cmp.i.us, i32 %storemerge1.us, i32 %sub14.i.us
  br label %for.cond36.us

for.end47:                                        ; preds = %for.cond36.us, %for.inc32.2
  %storemerge1.lcssa = phi i32 [ 0, %for.inc32.2 ], [ 29, %for.cond36.us ]
  store i32 %storemerge1.lcssa, i32* @g_2, align 4
  ret i32 %storemerge1.lcssa

for.inc24.2:                                      ; preds = %entry, %for.inc24.2
  %indvar11 = phi i64 [ 0, %entry ], [ %indvar.next12, %for.inc24.2 ]
  %scevgep25 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5, i64 0, i64 0, i64 %indvar11, i64 1, i64 0
  %scevgep27 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5, i64 0, i64 0, i64 %indvar11, i64 2, i64 0
  %arrayidx22 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5, i64 0, i64 0, i64 %indvar11, i64 0, i64 0
  store i16 -9, i16* %arrayidx22, align 2
  store i16 -9, i16* %scevgep25, align 2
  store i16 -9, i16* %scevgep27, align 2
  %indvar.next12 = add i64 %indvar11, 1
  %exitcond = icmp eq i64 %indvar.next12, 9
  br i1 %exitcond, label %for.inc24.2.1, label %for.inc24.2

for.inc24.2.1:                                    ; preds = %for.inc24.2, %for.inc24.2.1
  %indvar11.1 = phi i64 [ %indvar.next12.1, %for.inc24.2.1 ], [ 0, %for.inc24.2 ]
  %scevgep25.1 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5, i64 0, i64 1, i64 %indvar11.1, i64 1, i64 0
  %scevgep27.1 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5, i64 0, i64 1, i64 %indvar11.1, i64 2, i64 0
  %arrayidx22.132 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5, i64 0, i64 1, i64 %indvar11.1, i64 0, i64 0
  store i16 -9, i16* %arrayidx22.132, align 2
  store i16 -9, i16* %scevgep25.1, align 2
  store i16 -9, i16* %scevgep27.1, align 2
  %indvar.next12.1 = add i64 %indvar11.1, 1
  %exitcond.1 = icmp eq i64 %indvar.next12.1, 9
  br i1 %exitcond.1, label %for.inc24.2.2, label %for.inc24.2.1

for.inc32.2:                                      ; preds = %for.inc24.2.2
  %arrayidx43 = getelementptr inbounds [3 x [9 x [3 x [1 x i16]]]]* %l_5, i64 0, i64 2, i64 3, i64 0, i64 0
  %tmp44 = load i16* %arrayidx43, align 2
  %tobool = icmp eq i16 %tmp44, 0
  br i1 %tobool, label %for.cond36.us, label %for.end47

for.inc24.2.2:                                    ; preds = %for.inc24.2.1, %for.inc24.2.2
  %indvar11.2 = phi i64 [ %indvar.next12.2, %for.inc24.2.2 ], [ 0, %for.inc24.2.1 ]
  %scevgep25.2 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5, i64 0, i64 2, i64 %indvar11.2, i64 1, i64 0
  %scevgep27.2 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5, i64 0, i64 2, i64 %indvar11.2, i64 2, i64 0
  %arrayidx22.237 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5, i64 0, i64 2, i64 %indvar11.2, i64 0, i64 0
  store i16 -9, i16* %arrayidx22.237, align 2
  store i16 -9, i16* %scevgep25.2, align 2
  store i16 -9, i16* %scevgep27.2, align 2
  %indvar.next12.2 = add i64 %indvar11.2, 1
  %exitcond.2 = icmp eq i64 %indvar.next12.2, 9
  br i1 %exitcond.2, label %for.inc32.2, label %for.inc24.2.2
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
func_1.exit:
  %l_5.i = alloca [3 x [9 x [3 x [1 x i16]]]], align 16
  %0 = bitcast [3 x [9 x [3 x [1 x i16]]]]* %l_5.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  %arrayidx22.i = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 0, i64 0, i64 0, i64 0
  %scevgep27.i = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 0, i64 0, i64 2, i64 0
  %scevgep25.i = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 0, i64 0, i64 1, i64 0
  store i16 -9, i16* %arrayidx22.i, align 16
  store i16 -9, i16* %scevgep25.i, align 2
  store i16 -9, i16* %scevgep27.i, align 4
  %arrayidx22.i.1 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 0, i64 1, i64 0, i64 0
  %scevgep27.i.1 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 0, i64 1, i64 2, i64 0
  %scevgep25.i.1 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 0, i64 1, i64 1, i64 0
  store i16 -9, i16* %arrayidx22.i.1, align 2
  store i16 -9, i16* %scevgep25.i.1, align 2
  store i16 -9, i16* %scevgep27.i.1, align 2
  %arrayidx22.i.2 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 0, i64 2, i64 0, i64 0
  %scevgep27.i.2 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 0, i64 2, i64 2, i64 0
  %scevgep25.i.2 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 0, i64 2, i64 1, i64 0
  store i16 -9, i16* %arrayidx22.i.2, align 4
  store i16 -9, i16* %scevgep25.i.2, align 2
  store i16 -9, i16* %scevgep27.i.2, align 4
  %arrayidx22.i.3 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 0, i64 3, i64 0, i64 0
  %scevgep27.i.3 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 0, i64 3, i64 2, i64 0
  %scevgep25.i.3 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 0, i64 3, i64 1, i64 0
  store i16 -9, i16* %arrayidx22.i.3, align 2
  store i16 -9, i16* %scevgep25.i.3, align 2
  store i16 -9, i16* %scevgep27.i.3, align 2
  %arrayidx22.i.4 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 0, i64 4, i64 0, i64 0
  %scevgep27.i.4 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 0, i64 4, i64 2, i64 0
  %scevgep25.i.4 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 0, i64 4, i64 1, i64 0
  store i16 -9, i16* %arrayidx22.i.4, align 8
  store i16 -9, i16* %scevgep25.i.4, align 2
  store i16 -9, i16* %scevgep27.i.4, align 4
  %arrayidx22.i.5 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 0, i64 5, i64 0, i64 0
  %scevgep27.i.5 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 0, i64 5, i64 2, i64 0
  %scevgep25.i.5 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 0, i64 5, i64 1, i64 0
  store i16 -9, i16* %arrayidx22.i.5, align 2
  store i16 -9, i16* %scevgep25.i.5, align 2
  store i16 -9, i16* %scevgep27.i.5, align 2
  %arrayidx22.i.6 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 0, i64 6, i64 0, i64 0
  %scevgep27.i.6 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 0, i64 6, i64 2, i64 0
  %scevgep25.i.6 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 0, i64 6, i64 1, i64 0
  store i16 -9, i16* %arrayidx22.i.6, align 4
  store i16 -9, i16* %scevgep25.i.6, align 2
  store i16 -9, i16* %scevgep27.i.6, align 4
  %arrayidx22.i.7 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 0, i64 7, i64 0, i64 0
  %scevgep27.i.7 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 0, i64 7, i64 2, i64 0
  %scevgep25.i.7 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 0, i64 7, i64 1, i64 0
  store i16 -9, i16* %arrayidx22.i.7, align 2
  store i16 -9, i16* %scevgep25.i.7, align 2
  store i16 -9, i16* %scevgep27.i.7, align 2
  %arrayidx22.i.8 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 0, i64 8, i64 0, i64 0
  %scevgep27.i.8 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 0, i64 8, i64 2, i64 0
  %scevgep25.i.8 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 0, i64 8, i64 1, i64 0
  store i16 -9, i16* %arrayidx22.i.8, align 16
  store i16 -9, i16* %scevgep25.i.8, align 2
  store i16 -9, i16* %scevgep27.i.8, align 4
  %arrayidx22.132.i = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 1, i64 0, i64 0, i64 0
  %scevgep27.1.i = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 1, i64 0, i64 2, i64 0
  %scevgep25.1.i = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 1, i64 0, i64 1, i64 0
  store i16 -9, i16* %arrayidx22.132.i, align 2
  store i16 -9, i16* %scevgep25.1.i, align 2
  store i16 -9, i16* %scevgep27.1.i, align 2
  %arrayidx22.132.i.1 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 1, i64 1, i64 0, i64 0
  %scevgep27.1.i.1 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 1, i64 1, i64 2, i64 0
  %scevgep25.1.i.1 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 1, i64 1, i64 1, i64 0
  store i16 -9, i16* %arrayidx22.132.i.1, align 2
  store i16 -9, i16* %scevgep25.1.i.1, align 2
  store i16 -9, i16* %scevgep27.1.i.1, align 2
  %arrayidx22.132.i.2 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 1, i64 2, i64 0, i64 0
  %scevgep27.1.i.2 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 1, i64 2, i64 2, i64 0
  %scevgep25.1.i.2 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 1, i64 2, i64 1, i64 0
  store i16 -9, i16* %arrayidx22.132.i.2, align 2
  store i16 -9, i16* %scevgep25.1.i.2, align 2
  store i16 -9, i16* %scevgep27.1.i.2, align 2
  %arrayidx22.132.i.3 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 1, i64 3, i64 0, i64 0
  %scevgep27.1.i.3 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 1, i64 3, i64 2, i64 0
  %scevgep25.1.i.3 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 1, i64 3, i64 1, i64 0
  store i16 -9, i16* %arrayidx22.132.i.3, align 2
  store i16 -9, i16* %scevgep25.1.i.3, align 2
  store i16 -9, i16* %scevgep27.1.i.3, align 2
  %arrayidx22.132.i.4 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 1, i64 4, i64 0, i64 0
  %scevgep27.1.i.4 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 1, i64 4, i64 2, i64 0
  %scevgep25.1.i.4 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 1, i64 4, i64 1, i64 0
  store i16 -9, i16* %arrayidx22.132.i.4, align 2
  store i16 -9, i16* %scevgep25.1.i.4, align 2
  store i16 -9, i16* %scevgep27.1.i.4, align 2
  %arrayidx22.132.i.5 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 1, i64 5, i64 0, i64 0
  %scevgep27.1.i.5 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 1, i64 5, i64 2, i64 0
  %scevgep25.1.i.5 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 1, i64 5, i64 1, i64 0
  store i16 -9, i16* %arrayidx22.132.i.5, align 2
  store i16 -9, i16* %scevgep25.1.i.5, align 2
  store i16 -9, i16* %scevgep27.1.i.5, align 2
  %arrayidx22.132.i.6 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 1, i64 6, i64 0, i64 0
  %scevgep27.1.i.6 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 1, i64 6, i64 2, i64 0
  %scevgep25.1.i.6 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 1, i64 6, i64 1, i64 0
  store i16 -9, i16* %arrayidx22.132.i.6, align 2
  store i16 -9, i16* %scevgep25.1.i.6, align 2
  store i16 -9, i16* %scevgep27.1.i.6, align 2
  %arrayidx22.132.i.7 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 1, i64 7, i64 0, i64 0
  %scevgep27.1.i.7 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 1, i64 7, i64 2, i64 0
  %scevgep25.1.i.7 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 1, i64 7, i64 1, i64 0
  store i16 -9, i16* %arrayidx22.132.i.7, align 2
  store i16 -9, i16* %scevgep25.1.i.7, align 2
  store i16 -9, i16* %scevgep27.1.i.7, align 2
  %arrayidx22.132.i.8 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 1, i64 8, i64 0, i64 0
  %scevgep27.1.i.8 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 1, i64 8, i64 2, i64 0
  %scevgep25.1.i.8 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 1, i64 8, i64 1, i64 0
  store i16 -9, i16* %arrayidx22.132.i.8, align 2
  store i16 -9, i16* %scevgep25.1.i.8, align 2
  store i16 -9, i16* %scevgep27.1.i.8, align 2
  %arrayidx22.237.i = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 2, i64 0, i64 0, i64 0
  %scevgep27.2.i = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 2, i64 0, i64 2, i64 0
  %scevgep25.2.i = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 2, i64 0, i64 1, i64 0
  store i16 -9, i16* %arrayidx22.237.i, align 4
  store i16 -9, i16* %scevgep25.2.i, align 2
  store i16 -9, i16* %scevgep27.2.i, align 4
  %arrayidx22.237.i.1 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 2, i64 1, i64 0, i64 0
  %scevgep27.2.i.1 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 2, i64 1, i64 2, i64 0
  %scevgep25.2.i.1 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 2, i64 1, i64 1, i64 0
  store i16 -9, i16* %arrayidx22.237.i.1, align 2
  store i16 -9, i16* %scevgep25.2.i.1, align 2
  store i16 -9, i16* %scevgep27.2.i.1, align 2
  %arrayidx22.237.i.2 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 2, i64 2, i64 0, i64 0
  %scevgep27.2.i.2 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 2, i64 2, i64 2, i64 0
  %scevgep25.2.i.2 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 2, i64 2, i64 1, i64 0
  store i16 -9, i16* %arrayidx22.237.i.2, align 4
  store i16 -9, i16* %scevgep25.2.i.2, align 2
  store i16 -9, i16* %scevgep27.2.i.2, align 4
  %arrayidx22.237.i.3 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 2, i64 3, i64 0, i64 0
  %scevgep27.2.i.3 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 2, i64 3, i64 2, i64 0
  %scevgep25.2.i.3 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 2, i64 3, i64 1, i64 0
  store i16 -9, i16* %arrayidx22.237.i.3, align 2
  store i16 -9, i16* %scevgep25.2.i.3, align 2
  store i16 -9, i16* %scevgep27.2.i.3, align 2
  %arrayidx22.237.i.4 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 2, i64 4, i64 0, i64 0
  %scevgep27.2.i.4 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 2, i64 4, i64 2, i64 0
  %scevgep25.2.i.4 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 2, i64 4, i64 1, i64 0
  store i16 -9, i16* %arrayidx22.237.i.4, align 4
  store i16 -9, i16* %scevgep25.2.i.4, align 2
  store i16 -9, i16* %scevgep27.2.i.4, align 4
  %arrayidx22.237.i.5 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 2, i64 5, i64 0, i64 0
  %scevgep27.2.i.5 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 2, i64 5, i64 2, i64 0
  %scevgep25.2.i.5 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 2, i64 5, i64 1, i64 0
  store i16 -9, i16* %arrayidx22.237.i.5, align 2
  store i16 -9, i16* %scevgep25.2.i.5, align 2
  store i16 -9, i16* %scevgep27.2.i.5, align 2
  %arrayidx22.237.i.6 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 2, i64 6, i64 0, i64 0
  %scevgep27.2.i.6 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 2, i64 6, i64 2, i64 0
  %scevgep25.2.i.6 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 2, i64 6, i64 1, i64 0
  store i16 -9, i16* %arrayidx22.237.i.6, align 4
  store i16 -9, i16* %scevgep25.2.i.6, align 2
  store i16 -9, i16* %scevgep27.2.i.6, align 4
  %arrayidx22.237.i.7 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 2, i64 7, i64 0, i64 0
  %scevgep27.2.i.7 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 2, i64 7, i64 2, i64 0
  %scevgep25.2.i.7 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 2, i64 7, i64 1, i64 0
  store i16 -9, i16* %arrayidx22.237.i.7, align 2
  store i16 -9, i16* %scevgep25.2.i.7, align 2
  store i16 -9, i16* %scevgep27.2.i.7, align 2
  %arrayidx22.237.i.8 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 2, i64 8, i64 0, i64 0
  %scevgep27.2.i.8 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 2, i64 8, i64 2, i64 0
  %scevgep25.2.i.8 = getelementptr [3 x [9 x [3 x [1 x i16]]]]* %l_5.i, i64 0, i64 2, i64 8, i64 1, i64 0
  store i16 -9, i16* %arrayidx22.237.i.8, align 4
  store i16 -9, i16* %scevgep25.2.i.8, align 2
  store i16 -9, i16* %scevgep27.2.i.8, align 4
  store i32 0, i32* @g_2, align 4
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 0) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
