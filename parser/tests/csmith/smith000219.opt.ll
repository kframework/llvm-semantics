; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000219.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_5 = global i8 -118, align 1
@g_7 = global i32 -1, align 4
@g_6 = global i32* @g_7, align 8
@g_8 = global i32 -1, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [19 x i8] c"checksum g_8 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
lor.end:
  %l_2 = alloca [6 x i32], align 16
  %l_38 = alloca [1 x [6 x [1 x [4 x i64]]]], align 16
  %arrayidx = getelementptr [6 x i32]* %l_2, i64 0, i64 0
  store i32 -4, i32* %arrayidx, align 16
  %arrayidx.1 = getelementptr [6 x i32]* %l_2, i64 0, i64 1
  store i32 -4, i32* %arrayidx.1, align 4
  %arrayidx.2 = getelementptr [6 x i32]* %l_2, i64 0, i64 2
  store i32 -4, i32* %arrayidx.2, align 8
  %arrayidx.3 = getelementptr [6 x i32]* %l_2, i64 0, i64 3
  store i32 -4, i32* %arrayidx.3, align 4
  %arrayidx.4 = getelementptr [6 x i32]* %l_2, i64 0, i64 4
  store i32 -4, i32* %arrayidx.4, align 16
  %arrayidx.5 = getelementptr [6 x i32]* %l_2, i64 0, i64 5
  store i32 -4, i32* %arrayidx.5, align 4
  %tmp7 = volatile load i8* @g_5, align 1
  %tmp28 = volatile load i32** @g_6, align 8
  store i32 0, i32* %tmp28, align 4
  %tmp29 = volatile load i32** @g_6, align 8
  %tmp30 = load i32* %tmp29, align 4
  %tmp31 = load i32* @g_8, align 4
  %or = or i32 %tmp31, %tmp30
  store i32 %or, i32* @g_8, align 4
  %tmp32 = volatile load i32** @g_6, align 8
  %tmp33 = load i32* %tmp32, align 4
  %and = and i32 %tmp33, %or
  %conv35 = trunc i32 %and to i16
  %tmp36 = load i32* @g_7, align 4
  %conv371 = trunc i32 %tmp36 to i16
  %and38 = and i16 %conv371, 1
  %tmp = sub i16 0, %and38
  %mul.i = and i16 %conv35, %tmp
  %tobool = icmp eq i16 %mul.i, 0
  br i1 %tobool, label %for.body365, label %if.then

if.then:                                          ; preds = %lor.end
  %tmp42 = volatile load i32** @g_6, align 8
  br label %lbl_14

lbl_14:                                           ; preds = %lbl_14, %for.body50, %if.then
  volatile store i8 0, i8* @g_5, align 1
  %tmp4616 = volatile load i8* @g_5, align 1
  %cmp4817 = icmp ult i8 %tmp4616, 6
  br i1 %cmp4817, label %for.body50, label %lbl_14

for.body50:                                       ; preds = %lbl_14, %for.body50
  %tmp51 = volatile load i8* @g_5, align 1
  %idxprom52 = zext i8 %tmp51 to i64
  %arrayidx53 = getelementptr inbounds [6 x i32]* %l_2, i64 0, i64 %idxprom52
  store i32 5369819, i32* %arrayidx53, align 4
  %tmp55 = volatile load i8* @g_5, align 1
  %add = add i8 %tmp55, 1
  volatile store i8 %add, i8* @g_5, align 1
  %tmp46 = volatile load i8* @g_5, align 1
  %cmp48 = icmp ult i8 %tmp46, 6
  br i1 %cmp48, label %for.body50, label %lbl_14

for.body365:                                      ; preds = %lor.end
  %scevgep49 = getelementptr [1 x [6 x [1 x [4 x i64]]]]* %l_38, i64 0, i64 0, i64 5, i64 0, i64 0
  %scevgep53 = getelementptr [1 x [6 x [1 x [4 x i64]]]]* %l_38, i64 0, i64 0, i64 4, i64 0, i64 0
  %scevgep57 = getelementptr [1 x [6 x [1 x [4 x i64]]]]* %l_38, i64 0, i64 0, i64 3, i64 0, i64 0
  %scevgep61 = getelementptr [1 x [6 x [1 x [4 x i64]]]]* %l_38, i64 0, i64 0, i64 2, i64 0, i64 0
  %scevgep65 = getelementptr [1 x [6 x [1 x [4 x i64]]]]* %l_38, i64 0, i64 0, i64 1, i64 0, i64 0
  %scevgep39 = bitcast [1 x [6 x [1 x [4 x i64]]]]* %l_38 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep39, i8 -1, i64 32, i32 16, i1 false)
  %scevgep39.1 = bitcast i64* %scevgep65 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep39.1, i8 -1, i64 32, i32 16, i1 false)
  %scevgep39.2 = bitcast i64* %scevgep61 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep39.2, i8 -1, i64 32, i32 16, i1 false)
  %scevgep39.3 = bitcast i64* %scevgep57 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep39.3, i8 -1, i64 32, i32 16, i1 false)
  %scevgep39.4 = bitcast i64* %scevgep53 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep39.4, i8 -1, i64 32, i32 16, i1 false)
  %scevgep39.5 = bitcast i64* %scevgep49 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep39.5, i8 -1, i64 32, i32 16, i1 false)
  store i32 3, i32* @g_8, align 4
  %arrayidx369 = getelementptr inbounds [1 x [6 x [1 x [4 x i64]]]]* %l_38, i64 0, i64 0, i64 4, i64 0, i64 1
  %tmp370 = load i64* %arrayidx369, align 8
  ret i64 %tmp370
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %call = tail call i64 @func_1()
  %tmp = volatile load i8* @g_5, align 1
  %conv = zext i8 %tmp to i32
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %conv) nounwind
  %tmp2 = load i32* @g_7, align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* @g_8, align 4
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind
