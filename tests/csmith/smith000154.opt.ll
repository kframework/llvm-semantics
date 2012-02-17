; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000154.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 -1646701846, align 4
@g_4 = global i32 1179588335, align 4
@g_5 = global i32 -7, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  volatile store i32 0, i32* @g_3, align 4
  br label %for.cond25

for.cond25:                                       ; preds = %for.inc45, %entry
  %tmp26 = volatile load i32* @g_3, align 4
  %cmp27 = icmp slt i32 %tmp26, 1
  br i1 %cmp27, label %for.body28, label %return

for.body28:                                       ; preds = %for.cond25
  volatile store i32 2, i32* @g_4, align 4
  br label %for.cond29

for.cond29:                                       ; preds = %for.inc41, %for.body28
  %tmp30 = volatile load i32* @g_4, align 4
  %cmp31 = icmp slt i32 %tmp30, 5
  br i1 %cmp31, label %for.body32, label %for.inc45

for.body32:                                       ; preds = %for.cond29
  volatile store i32 5, i32* @g_5, align 4
  %tmp34 = volatile load i32* @g_5, align 4
  %cmp35 = icmp sgt i32 %tmp34, -1
  br i1 %cmp35, label %return, label %for.inc41

for.inc41:                                        ; preds = %for.body32
  %tmp42 = volatile load i32* @g_4, align 4
  %add43 = add nsw i32 %tmp42, 5
  volatile store i32 %add43, i32* @g_4, align 4
  br label %for.cond29

for.inc45:                                        ; preds = %for.cond29
  %tmp46 = volatile load i32* @g_3, align 4
  %add47 = add nsw i32 %tmp46, 1
  volatile store i32 %add47, i32* @g_3, align 4
  br label %for.cond25

return:                                           ; preds = %for.cond25, %for.body32
  %storemerge1.in.in = phi i32* [ @g_3, %for.body32 ], [ @g_4, %for.cond25 ]
  %storemerge1.in = volatile load i32* %storemerge1.in.in, align 4
  %storemerge1 = sext i32 %storemerge1.in to i64
  ret i64 %storemerge1
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  volatile store i32 0, i32* @g_3, align 4
  br label %for.cond25.i

for.cond25.i:                                     ; preds = %for.inc45.i, %entry
  %tmp26.i = volatile load i32* @g_3, align 4
  %cmp27.i = icmp slt i32 %tmp26.i, 1
  br i1 %cmp27.i, label %for.body28.i, label %func_1.exit

for.body28.i:                                     ; preds = %for.cond25.i
  volatile store i32 2, i32* @g_4, align 4
  br label %for.cond29.i

for.cond29.i:                                     ; preds = %for.inc41.i, %for.body28.i
  %tmp30.i = volatile load i32* @g_4, align 4
  %cmp31.i = icmp slt i32 %tmp30.i, 5
  br i1 %cmp31.i, label %for.body32.i, label %for.inc45.i

for.body32.i:                                     ; preds = %for.cond29.i
  volatile store i32 5, i32* @g_5, align 4
  %tmp34.i = volatile load i32* @g_5, align 4
  %cmp35.i = icmp sgt i32 %tmp34.i, -1
  br i1 %cmp35.i, label %func_1.exit, label %for.inc41.i

for.inc41.i:                                      ; preds = %for.body32.i
  %tmp42.i = volatile load i32* @g_4, align 4
  %add43.i = add nsw i32 %tmp42.i, 5
  volatile store i32 %add43.i, i32* @g_4, align 4
  br label %for.cond29.i

for.inc45.i:                                      ; preds = %for.cond29.i
  %tmp46.i = volatile load i32* @g_3, align 4
  %add47.i = add nsw i32 %tmp46.i, 1
  volatile store i32 %add47.i, i32* @g_3, align 4
  br label %for.cond25.i

func_1.exit:                                      ; preds = %for.cond25.i, %for.body32.i
  %storemerge1.in.in.i = phi i32* [ @g_3, %for.body32.i ], [ @g_4, %for.cond25.i ]
  %storemerge1.in.i = volatile load i32* %storemerge1.in.in.i, align 4
  %tmp = volatile load i32* @g_3, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = volatile load i32* @g_4, align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = volatile load i32* @g_5, align 4
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
