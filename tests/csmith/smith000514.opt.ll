; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000514.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = constant i16 3977, align 2
@g_7 = global i32 355227899, align 4
@g_14 = global i32 7, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_14 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_8 = alloca [7 x i32], align 16
  %l_815 = bitcast [7 x i32]* %l_8 to i8*
  %l_19 = alloca [10 x [7 x i16]], align 16
  call void @llvm.memset.p0i8.i64(i8* %l_815, i8 0, i64 28, i32 16, i1 false)
  %tmp3 = volatile load i16* @g_4, align 2
  %tmp4 = load i32* @g_7, align 4
  %conv5 = sext i32 %tmp4 to i64
  %cmp9 = icmp ne i32 %tmp4, 0
  %conv11 = zext i1 %cmp9 to i64
  %cmp15 = icmp eq i64 %conv5, %conv11
  %conv16 = zext i1 %cmp15 to i16
  %or = or i16 %conv16, %tmp3
  %conv13.i = sext i16 %or to i32
  %div.i = sdiv i32 %conv13.i, 111
  %conv16.i = trunc i32 %div.i to i16
  %tobool21 = icmp eq i16 %conv16.i, 0
  br i1 %tobool21, label %if.else, label %for.cond66.preheader

if.else:                                          ; preds = %entry
  store i32 1, i32* @g_14, align 4
  br label %for.cond66.preheader

for.cond66.preheader:                             ; preds = %if.else, %entry, %for.cond66.preheader
  %indvar9 = phi i64 [ %indvar.next10, %for.cond66.preheader ], [ 0, %entry ], [ 0, %if.else ]
  %arrayidx76.6 = getelementptr [10 x [7 x i16]]* %l_19, i64 0, i64 %indvar9, i64 6
  %arrayidx76.5 = getelementptr [10 x [7 x i16]]* %l_19, i64 0, i64 %indvar9, i64 5
  %arrayidx76.4 = getelementptr [10 x [7 x i16]]* %l_19, i64 0, i64 %indvar9, i64 4
  %arrayidx76.3 = getelementptr [10 x [7 x i16]]* %l_19, i64 0, i64 %indvar9, i64 3
  %arrayidx76.2 = getelementptr [10 x [7 x i16]]* %l_19, i64 0, i64 %indvar9, i64 2
  %arrayidx76.1 = getelementptr [10 x [7 x i16]]* %l_19, i64 0, i64 %indvar9, i64 1
  %arrayidx76 = getelementptr [10 x [7 x i16]]* %l_19, i64 0, i64 %indvar9, i64 0
  store i16 1, i16* %arrayidx76, align 2
  store i16 1, i16* %arrayidx76.1, align 2
  store i16 1, i16* %arrayidx76.2, align 2
  store i16 1, i16* %arrayidx76.3, align 2
  store i16 1, i16* %arrayidx76.4, align 2
  store i16 1, i16* %arrayidx76.5, align 2
  store i16 1, i16* %arrayidx76.6, align 2
  %indvar.next10 = add i64 %indvar9, 1
  %exitcond = icmp eq i64 %indvar.next10, 10
  br i1 %exitcond, label %return, label %for.cond66.preheader

return:                                           ; preds = %for.cond66.preheader
  %arrayidx86 = getelementptr inbounds [10 x [7 x i16]]* %l_19, i64 0, i64 6, i64 0
  %tmp87 = load i16* %arrayidx86, align 4
  %conv88 = sext i16 %tmp87 to i32
  ret i32 %conv88
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %l_8.i = alloca [7 x i32], align 16
  %l_19.i = alloca [10 x [7 x i16]], align 16
  %0 = bitcast [7 x i32]* %l_8.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0) nounwind
  %1 = bitcast [10 x [7 x i16]]* %l_19.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %1) nounwind
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 28, i32 16, i1 false) nounwind
  %tmp3.i = volatile load i16* @g_4, align 2
  %tmp4.i = load i32* @g_7, align 4
  %conv5.i = sext i32 %tmp4.i to i64
  %cmp9.i = icmp ne i32 %tmp4.i, 0
  %conv11.i = zext i1 %cmp9.i to i64
  %cmp15.i = icmp eq i64 %conv5.i, %conv11.i
  %conv16.i = zext i1 %cmp15.i to i16
  %or.i = or i16 %conv16.i, %tmp3.i
  %conv13.i.i = sext i16 %or.i to i32
  %div.i.i = sdiv i32 %conv13.i.i, 111
  %conv16.i.i = trunc i32 %div.i.i to i16
  %tobool21.i = icmp eq i16 %conv16.i.i, 0
  br i1 %tobool21.i, label %if.else.i, label %for.cond66.preheader.i

if.else.i:                                        ; preds = %entry
  store i32 1, i32* @g_14, align 4
  br label %for.cond66.preheader.i

for.cond66.preheader.i:                           ; preds = %if.else.i, %entry, %for.cond66.preheader.i
  %indvar9.i = phi i64 [ %2, %for.cond66.preheader.i ], [ 0, %entry ], [ 0, %if.else.i ]
  %arrayidx76.i = getelementptr [10 x [7 x i16]]* %l_19.i, i64 0, i64 %indvar9.i, i64 0
  %arrayidx76.1.i = getelementptr [10 x [7 x i16]]* %l_19.i, i64 0, i64 %indvar9.i, i64 1
  %arrayidx76.2.i = getelementptr [10 x [7 x i16]]* %l_19.i, i64 0, i64 %indvar9.i, i64 2
  %arrayidx76.3.i = getelementptr [10 x [7 x i16]]* %l_19.i, i64 0, i64 %indvar9.i, i64 3
  %arrayidx76.4.i = getelementptr [10 x [7 x i16]]* %l_19.i, i64 0, i64 %indvar9.i, i64 4
  %arrayidx76.5.i = getelementptr [10 x [7 x i16]]* %l_19.i, i64 0, i64 %indvar9.i, i64 5
  %arrayidx76.6.i = getelementptr [10 x [7 x i16]]* %l_19.i, i64 0, i64 %indvar9.i, i64 6
  store i16 1, i16* %arrayidx76.i, align 2
  store i16 1, i16* %arrayidx76.1.i, align 2
  store i16 1, i16* %arrayidx76.2.i, align 2
  store i16 1, i16* %arrayidx76.3.i, align 2
  store i16 1, i16* %arrayidx76.4.i, align 2
  store i16 1, i16* %arrayidx76.5.i, align 2
  store i16 1, i16* %arrayidx76.6.i, align 2
  %2 = add i64 %indvar9.i, 1
  %exitcond = icmp eq i64 %2, 10
  br i1 %exitcond, label %func_1.exit, label %for.cond66.preheader.i

func_1.exit:                                      ; preds = %for.cond66.preheader.i
  call void @llvm.lifetime.end(i64 -1, i8* %0) nounwind
  call void @llvm.lifetime.end(i64 -1, i8* %1) nounwind
  %tmp = volatile load i16* @g_4, align 2
  %conv = zext i16 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %conv) nounwind
  %tmp2 = load i32* @g_7, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* @g_14, align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
