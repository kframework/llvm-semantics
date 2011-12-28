; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001905.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 0, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
entry:
  %l_2 = alloca [7 x i8], align 1
  %l_24 = getelementptr inbounds [7 x i8]* %l_2, i64 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* %l_24, i8 0, i64 7, i32 1, i1 false)
  volatile store i32 6, i32* @g_3, align 4
  %tmp4 = volatile load i32* @g_3, align 4
  %cmp5 = icmp sgt i32 %tmp4, -1
  %tmp7 = volatile load i32* @g_3, align 4
  br i1 %cmp5, label %for.body6, label %for.end13

for.body6:                                        ; preds = %entry
  %rem = urem i32 %tmp7, 7
  %idxprom8 = zext i32 %rem to i64
  %arrayidx9 = getelementptr inbounds [7 x i8]* %l_2, i64 0, i64 %idxprom8
  %tmp10 = load i8* %arrayidx9, align 1
  %conv = zext i8 %tmp10 to i16
  br label %return

for.end13:                                        ; preds = %entry
  %conv15 = trunc i32 %tmp7 to i16
  br label %return

return:                                           ; preds = %for.end13, %for.body6
  %storemerge1 = phi i16 [ %conv, %for.body6 ], [ %conv15, %for.end13 ]
  ret i16 %storemerge1
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %l_2.i = alloca [7 x i8], align 1
  %0 = getelementptr inbounds [7 x i8]* %l_2.i, i64 0, i64 0
  call void @llvm.lifetime.start(i64 -1, i8* %0) nounwind
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 7, i32 1, i1 false) nounwind
  volatile store i32 6, i32* @g_3, align 4
  %tmp4.i = volatile load i32* @g_3, align 4
  %tmp7.i = volatile load i32* @g_3, align 4
  call void @llvm.lifetime.end(i64 -1, i8* %0) nounwind
  %tmp = volatile load i32* @g_3, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
