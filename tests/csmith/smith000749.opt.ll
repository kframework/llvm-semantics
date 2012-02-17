; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000749.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 0, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_7 = alloca [7 x [2 x [1 x [6 x [1 x i32*]]]]], align 16
  br label %for.inc44.1

return:                                           ; preds = %for.inc44.1
  store i32 0, i32* @g_2, align 4
  ret i32 0

for.inc44.1:                                      ; preds = %entry, %for.inc44.1
  %indvar11 = phi i64 [ 0, %entry ], [ %indvar.next12, %for.inc44.1 ]
  %scevgep = getelementptr [7 x [2 x [1 x [6 x [1 x i32*]]]]]* %l_7, i64 0, i64 %indvar11, i64 1, i64 0, i64 5, i64 0
  %scevgep56 = getelementptr [7 x [2 x [1 x [6 x [1 x i32*]]]]]* %l_7, i64 0, i64 %indvar11, i64 1, i64 0, i64 4, i64 0
  %scevgep60 = getelementptr [7 x [2 x [1 x [6 x [1 x i32*]]]]]* %l_7, i64 0, i64 %indvar11, i64 1, i64 0, i64 3, i64 0
  %scevgep64 = getelementptr [7 x [2 x [1 x [6 x [1 x i32*]]]]]* %l_7, i64 0, i64 %indvar11, i64 1, i64 0, i64 2, i64 0
  %scevgep68 = getelementptr [7 x [2 x [1 x [6 x [1 x i32*]]]]]* %l_7, i64 0, i64 %indvar11, i64 1, i64 0, i64 1, i64 0
  %scevgep72 = getelementptr [7 x [2 x [1 x [6 x [1 x i32*]]]]]* %l_7, i64 0, i64 %indvar11, i64 1, i64 0, i64 0, i64 0
  %scevgep76 = getelementptr [7 x [2 x [1 x [6 x [1 x i32*]]]]]* %l_7, i64 0, i64 %indvar11, i64 0, i64 0, i64 5, i64 0
  %scevgep78 = getelementptr [7 x [2 x [1 x [6 x [1 x i32*]]]]]* %l_7, i64 0, i64 %indvar11, i64 0, i64 0, i64 4, i64 0
  %scevgep80 = getelementptr [7 x [2 x [1 x [6 x [1 x i32*]]]]]* %l_7, i64 0, i64 %indvar11, i64 0, i64 0, i64 3, i64 0
  %scevgep82 = getelementptr [7 x [2 x [1 x [6 x [1 x i32*]]]]]* %l_7, i64 0, i64 %indvar11, i64 0, i64 0, i64 2, i64 0
  %scevgep84 = getelementptr [7 x [2 x [1 x [6 x [1 x i32*]]]]]* %l_7, i64 0, i64 %indvar11, i64 0, i64 0, i64 1, i64 0
  %arrayidx34 = getelementptr [7 x [2 x [1 x [6 x [1 x i32*]]]]]* %l_7, i64 0, i64 %indvar11, i64 0, i64 0, i64 0, i64 0
  store i32* @g_2, i32** %arrayidx34, align 16
  store i32* @g_2, i32** %scevgep84, align 8
  store i32* @g_2, i32** %scevgep82, align 16
  store i32* @g_2, i32** %scevgep80, align 8
  store i32* @g_2, i32** %scevgep78, align 16
  store i32* @g_2, i32** %scevgep76, align 8
  store i32* @g_2, i32** %scevgep72, align 16
  store i32* @g_2, i32** %scevgep68, align 8
  store i32* @g_2, i32** %scevgep64, align 16
  store i32* @g_2, i32** %scevgep60, align 8
  store i32* @g_2, i32** %scevgep56, align 16
  store i32* @g_2, i32** %scevgep, align 8
  %indvar.next12 = add i64 %indvar11, 1
  %exitcond = icmp eq i64 %indvar.next12, 7
  br i1 %exitcond, label %return, label %for.inc44.1
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %l_7.i = alloca [7 x [2 x [1 x [6 x [1 x i32*]]]]], align 16
  %0 = bitcast [7 x [2 x [1 x [6 x [1 x i32*]]]]]* %l_7.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  br label %for.inc44.1.i

for.inc44.1.i:                                    ; preds = %for.inc44.1.i, %entry
  %indvar11.i = phi i64 [ 0, %entry ], [ %1, %for.inc44.1.i ]
  %arrayidx34.i = getelementptr [7 x [2 x [1 x [6 x [1 x i32*]]]]]* %l_7.i, i64 0, i64 %indvar11.i, i64 0, i64 0, i64 0, i64 0
  %scevgep84.i = getelementptr [7 x [2 x [1 x [6 x [1 x i32*]]]]]* %l_7.i, i64 0, i64 %indvar11.i, i64 0, i64 0, i64 1, i64 0
  %scevgep82.i = getelementptr [7 x [2 x [1 x [6 x [1 x i32*]]]]]* %l_7.i, i64 0, i64 %indvar11.i, i64 0, i64 0, i64 2, i64 0
  %scevgep80.i = getelementptr [7 x [2 x [1 x [6 x [1 x i32*]]]]]* %l_7.i, i64 0, i64 %indvar11.i, i64 0, i64 0, i64 3, i64 0
  %scevgep78.i = getelementptr [7 x [2 x [1 x [6 x [1 x i32*]]]]]* %l_7.i, i64 0, i64 %indvar11.i, i64 0, i64 0, i64 4, i64 0
  %scevgep76.i = getelementptr [7 x [2 x [1 x [6 x [1 x i32*]]]]]* %l_7.i, i64 0, i64 %indvar11.i, i64 0, i64 0, i64 5, i64 0
  %scevgep72.i = getelementptr [7 x [2 x [1 x [6 x [1 x i32*]]]]]* %l_7.i, i64 0, i64 %indvar11.i, i64 1, i64 0, i64 0, i64 0
  %scevgep68.i = getelementptr [7 x [2 x [1 x [6 x [1 x i32*]]]]]* %l_7.i, i64 0, i64 %indvar11.i, i64 1, i64 0, i64 1, i64 0
  %scevgep64.i = getelementptr [7 x [2 x [1 x [6 x [1 x i32*]]]]]* %l_7.i, i64 0, i64 %indvar11.i, i64 1, i64 0, i64 2, i64 0
  %scevgep60.i = getelementptr [7 x [2 x [1 x [6 x [1 x i32*]]]]]* %l_7.i, i64 0, i64 %indvar11.i, i64 1, i64 0, i64 3, i64 0
  %scevgep56.i = getelementptr [7 x [2 x [1 x [6 x [1 x i32*]]]]]* %l_7.i, i64 0, i64 %indvar11.i, i64 1, i64 0, i64 4, i64 0
  %scevgep.i = getelementptr [7 x [2 x [1 x [6 x [1 x i32*]]]]]* %l_7.i, i64 0, i64 %indvar11.i, i64 1, i64 0, i64 5, i64 0
  store i32* @g_2, i32** %arrayidx34.i, align 16
  store i32* @g_2, i32** %scevgep84.i, align 8
  store i32* @g_2, i32** %scevgep82.i, align 16
  store i32* @g_2, i32** %scevgep80.i, align 8
  store i32* @g_2, i32** %scevgep78.i, align 16
  store i32* @g_2, i32** %scevgep76.i, align 8
  store i32* @g_2, i32** %scevgep72.i, align 16
  store i32* @g_2, i32** %scevgep68.i, align 8
  store i32* @g_2, i32** %scevgep64.i, align 16
  store i32* @g_2, i32** %scevgep60.i, align 8
  store i32* @g_2, i32** %scevgep56.i, align 16
  store i32* @g_2, i32** %scevgep.i, align 8
  %1 = add i64 %indvar11.i, 1
  %exitcond = icmp eq i64 %1, 7
  br i1 %exitcond, label %func_1.exit, label %for.inc44.1.i

func_1.exit:                                      ; preds = %for.inc44.1.i
  store i32 0, i32* @g_2, align 4
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 0) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
