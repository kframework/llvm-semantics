; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001198.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i16 -18895, align 2
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %l_3 = alloca [4 x i16], align 2
  %arrayidx = getelementptr [4 x i16]* %l_3, i64 0, i64 0
  store i16 -2, i16* %arrayidx, align 2
  %arrayidx.1 = getelementptr [4 x i16]* %l_3, i64 0, i64 1
  %arrayidx.2 = getelementptr [4 x i16]* %l_3, i64 0, i64 2
  store i16 -2, i16* %arrayidx.2, align 2
  %arrayidx.3 = getelementptr [4 x i16]* %l_3, i64 0, i64 3
  store i16 -2, i16* %arrayidx.3, align 2
  %tmp3 = volatile load i16* @g_2, align 2
  %xor1 = xor i16 %tmp3, -2
  store i16 %xor1, i16* %arrayidx.1, align 2
  volatile store i16 0, i16* @g_2, align 2
  %tmp9 = volatile load i16* @g_2, align 2
  %cmp11 = icmp ult i16 %tmp9, 4
  br i1 %cmp11, label %for.body13, label %return

for.body13:                                       ; preds = %entry
  %tmp14 = volatile load i16* @g_2, align 2
  br label %return

return:                                           ; preds = %entry, %for.body13
  %storemerge2.in = phi i16 [ %tmp14, %for.body13 ], [ %xor1, %entry ]
  %storemerge2 = zext i16 %storemerge2.in to i64
  ret i64 %storemerge2
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %l_3.i = alloca [4 x i16], align 2
  %0 = bitcast [4 x i16]* %l_3.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  %arrayidx.i = getelementptr [4 x i16]* %l_3.i, i64 0, i64 0
  store i16 -2, i16* %arrayidx.i, align 2
  %arrayidx.1.i = getelementptr [4 x i16]* %l_3.i, i64 0, i64 1
  %arrayidx.2.i = getelementptr [4 x i16]* %l_3.i, i64 0, i64 2
  store i16 -2, i16* %arrayidx.2.i, align 2
  %arrayidx.3.i = getelementptr [4 x i16]* %l_3.i, i64 0, i64 3
  store i16 -2, i16* %arrayidx.3.i, align 2
  %tmp3.i = volatile load i16* @g_2, align 2
  %xor1.i = xor i16 %tmp3.i, -2
  store i16 %xor1.i, i16* %arrayidx.1.i, align 2
  volatile store i16 0, i16* @g_2, align 2
  %tmp9.i = volatile load i16* @g_2, align 2
  %cmp11.i = icmp ult i16 %tmp9.i, 4
  br i1 %cmp11.i, label %for.body13.i, label %func_1.exit

for.body13.i:                                     ; preds = %entry
  %tmp14.i = volatile load i16* @g_2, align 2
  br label %func_1.exit

func_1.exit:                                      ; preds = %entry, %for.body13.i
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  %tmp = volatile load i16* @g_2, align 2
  %conv = zext i16 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %conv) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
