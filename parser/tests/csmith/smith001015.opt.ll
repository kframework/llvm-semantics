; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001015.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_6 = global i32 -6, align 4
@g_5 = global i32* @g_6, align 8
@g_9 = global i32 0, align 4
@g_8 = global i32* @g_9, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_7 = alloca [9 x i32*], align 16
  %l_10 = alloca i32, align 4
  volatile store i32 1, i32* %l_10, align 4
  %arrayidx = getelementptr [9 x i32*]* %l_7, i64 0, i64 0
  store i32* @g_6, i32** %arrayidx, align 16
  %arrayidx.1 = getelementptr [9 x i32*]* %l_7, i64 0, i64 1
  store i32* @g_6, i32** %arrayidx.1, align 8
  %arrayidx.2 = getelementptr [9 x i32*]* %l_7, i64 0, i64 2
  store i32* @g_6, i32** %arrayidx.2, align 16
  %arrayidx.3 = getelementptr [9 x i32*]* %l_7, i64 0, i64 3
  store i32* @g_6, i32** %arrayidx.3, align 8
  %arrayidx.4 = getelementptr [9 x i32*]* %l_7, i64 0, i64 4
  store i32* @g_6, i32** %arrayidx.4, align 16
  %arrayidx.5 = getelementptr [9 x i32*]* %l_7, i64 0, i64 5
  store i32* @g_6, i32** %arrayidx.5, align 8
  %arrayidx.6 = getelementptr [9 x i32*]* %l_7, i64 0, i64 6
  store i32* @g_6, i32** %arrayidx.6, align 16
  %arrayidx.7 = getelementptr [9 x i32*]* %l_7, i64 0, i64 7
  store i32* @g_6, i32** %arrayidx.7, align 8
  %arrayidx.8 = getelementptr [9 x i32*]* %l_7, i64 0, i64 8
  store i32* @g_6, i32** %arrayidx.8, align 16
  %tmp5 = volatile load i32** @g_5, align 8
  store i32 2378, i32* %tmp5, align 4
  %tmp8 = volatile load i32** @g_8, align 8
  %cmp9 = icmp eq i32* %tmp8, @g_6
  br i1 %cmp9, label %land.end, label %land.rhs

land.rhs:                                         ; preds = %entry
  %tmp11 = volatile load i32** @g_5, align 8
  %tmp12 = load i32* %tmp11, align 4
  %tobool = icmp ne i32 %tmp12, 0
  br label %land.end

land.end:                                         ; preds = %entry, %land.rhs
  %0 = phi i1 [ false, %entry ], [ %tobool, %land.rhs ]
  %land.ext = zext i1 %0 to i32
  %tmp13 = volatile load i32** @g_5, align 8
  store i32 %land.ext, i32* %tmp13, align 4
  %tmp14 = volatile load i32** @g_8, align 8
  %tmp15 = volatile load i32* %tmp14, align 4
  volatile store i32 %tmp15, i32* %l_10, align 4
  %tmp16 = load i32* @g_6, align 4
  ret i32 %tmp16
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %l_7.i = alloca [9 x i32*], align 16
  %l_10.i = alloca i32, align 4
  %0 = bitcast [9 x i32*]* %l_7.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  %1 = bitcast i32* %l_10.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %1)
  volatile store i32 1, i32* %l_10.i, align 4
  %arrayidx.i = getelementptr [9 x i32*]* %l_7.i, i64 0, i64 0
  store i32* @g_6, i32** %arrayidx.i, align 16
  %arrayidx.1.i = getelementptr [9 x i32*]* %l_7.i, i64 0, i64 1
  store i32* @g_6, i32** %arrayidx.1.i, align 8
  %arrayidx.2.i = getelementptr [9 x i32*]* %l_7.i, i64 0, i64 2
  store i32* @g_6, i32** %arrayidx.2.i, align 16
  %arrayidx.3.i = getelementptr [9 x i32*]* %l_7.i, i64 0, i64 3
  store i32* @g_6, i32** %arrayidx.3.i, align 8
  %arrayidx.4.i = getelementptr [9 x i32*]* %l_7.i, i64 0, i64 4
  store i32* @g_6, i32** %arrayidx.4.i, align 16
  %arrayidx.5.i = getelementptr [9 x i32*]* %l_7.i, i64 0, i64 5
  store i32* @g_6, i32** %arrayidx.5.i, align 8
  %arrayidx.6.i = getelementptr [9 x i32*]* %l_7.i, i64 0, i64 6
  store i32* @g_6, i32** %arrayidx.6.i, align 16
  %arrayidx.7.i = getelementptr [9 x i32*]* %l_7.i, i64 0, i64 7
  store i32* @g_6, i32** %arrayidx.7.i, align 8
  %arrayidx.8.i = getelementptr [9 x i32*]* %l_7.i, i64 0, i64 8
  store i32* @g_6, i32** %arrayidx.8.i, align 16
  %tmp5.i = volatile load i32** @g_5, align 8
  store i32 2378, i32* %tmp5.i, align 4
  %tmp8.i = volatile load i32** @g_8, align 8
  %cmp9.i = icmp eq i32* %tmp8.i, @g_6
  br i1 %cmp9.i, label %func_1.exit, label %land.rhs.i

land.rhs.i:                                       ; preds = %entry
  %tmp11.i = volatile load i32** @g_5, align 8
  %tmp12.i = load i32* %tmp11.i, align 4
  %tobool.i = icmp ne i32 %tmp12.i, 0
  br label %func_1.exit

func_1.exit:                                      ; preds = %entry, %land.rhs.i
  %2 = phi i1 [ false, %entry ], [ %tobool.i, %land.rhs.i ]
  %land.ext.i = zext i1 %2 to i32
  %tmp13.i = volatile load i32** @g_5, align 8
  store i32 %land.ext.i, i32* %tmp13.i, align 4
  %tmp14.i = volatile load i32** @g_8, align 8
  %tmp15.i = volatile load i32* %tmp14.i, align 4
  volatile store i32 %tmp15.i, i32* %l_10.i, align 4
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  call void @llvm.lifetime.end(i64 -1, i8* %1)
  %tmp = load i32* @g_6, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = volatile load i32* @g_9, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
