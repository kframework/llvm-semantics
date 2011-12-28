; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001455.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global [1 x [2 x i32]] [[2 x i32] [i32 2089446293, i32 2089446293]], align 4
@g_4 = global i32 6, align 4
@g_5 = global i32 164374010, align 4
@g_6 = global i32 9, align 4
@.str = private unnamed_addr constant [25 x i8] c"checksum g_3[0][0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %l_2 = alloca [6 x [5 x [1 x [1 x i64]]]], align 16
  br label %for.inc28.4

for.end35:                                        ; preds = %for.inc28.4
  volatile store i32 4, i32* getelementptr inbounds ([1 x [2 x i32]]* @g_3, i64 0, i64 0, i64 1), align 4
  br label %for.cond36

for.cond36:                                       ; preds = %for.inc68, %for.end35
  %tmp37 = volatile load i32* getelementptr inbounds ([1 x [2 x i32]]* @g_3, i64 0, i64 0, i64 1), align 4
  %cmp38 = icmp sgt i32 %tmp37, -1
  br i1 %cmp38, label %for.body39, label %return

for.body39:                                       ; preds = %for.cond36
  volatile store i32 0, i32* @g_4, align 4
  br label %for.cond40

for.cond40:                                       ; preds = %for.inc64, %for.body39
  %tmp41 = volatile load i32* @g_4, align 4
  %cmp42 = icmp slt i32 %tmp41, 5
  br i1 %cmp42, label %for.body43, label %for.inc68

for.body43:                                       ; preds = %for.cond40
  volatile store i32 0, i32* @g_5, align 4
  br label %for.cond44

for.cond44:                                       ; preds = %for.inc60, %for.body43
  %tmp45 = volatile load i32* @g_5, align 4
  %cmp46 = icmp slt i32 %tmp45, 1
  br i1 %cmp46, label %for.body47, label %for.inc64

for.body47:                                       ; preds = %for.cond44
  volatile store i32 0, i32* @g_6, align 4
  %tmp49 = volatile load i32* @g_6, align 4
  %cmp50 = icmp slt i32 %tmp49, 1
  br i1 %cmp50, label %for.body51, label %for.inc60

for.body51:                                       ; preds = %for.body47
  %arrayidx55 = getelementptr inbounds [6 x [5 x [1 x [1 x i64]]]]* %l_2, i64 0, i64 5, i64 2, i64 0, i64 0
  %tmp56 = load i64* %arrayidx55, align 8
  br label %return

for.inc60:                                        ; preds = %for.body47
  %tmp61 = volatile load i32* @g_5, align 4
  %add62 = add nsw i32 %tmp61, 1
  volatile store i32 %add62, i32* @g_5, align 4
  br label %for.cond44

for.inc64:                                        ; preds = %for.cond44
  %tmp65 = volatile load i32* @g_4, align 4
  %add66 = add nsw i32 %tmp65, 2
  volatile store i32 %add66, i32* @g_4, align 4
  br label %for.cond40

for.inc68:                                        ; preds = %for.cond40
  %tmp69 = volatile load i32* getelementptr inbounds ([1 x [2 x i32]]* @g_3, i64 0, i64 0, i64 1), align 4
  %add70 = add nsw i32 %tmp69, -4
  volatile store i32 %add70, i32* getelementptr inbounds ([1 x [2 x i32]]* @g_3, i64 0, i64 0, i64 1), align 4
  br label %for.cond36

return:                                           ; preds = %for.cond36, %for.body51
  %storemerge1 = phi i64 [ %tmp56, %for.body51 ], [ -1139773754, %for.cond36 ]
  ret i64 %storemerge1

for.inc28.4:                                      ; preds = %entry, %for.inc28.4
  %indvar9 = phi i64 [ 0, %entry ], [ %indvar.next10, %for.inc28.4 ]
  %scevgep = getelementptr [6 x [5 x [1 x [1 x i64]]]]* %l_2, i64 0, i64 %indvar9, i64 4, i64 0, i64 0
  %scevgep23 = getelementptr [6 x [5 x [1 x [1 x i64]]]]* %l_2, i64 0, i64 %indvar9, i64 3, i64 0, i64 0
  %scevgep26 = getelementptr [6 x [5 x [1 x [1 x i64]]]]* %l_2, i64 0, i64 %indvar9, i64 2, i64 0, i64 0
  %scevgep29 = getelementptr [6 x [5 x [1 x [1 x i64]]]]* %l_2, i64 0, i64 %indvar9, i64 1, i64 0, i64 0
  %arrayidx22 = getelementptr [6 x [5 x [1 x [1 x i64]]]]* %l_2, i64 0, i64 %indvar9, i64 0, i64 0, i64 0
  store i64 1, i64* %arrayidx22, align 8
  store i64 1, i64* %scevgep29, align 8
  store i64 1, i64* %scevgep26, align 8
  store i64 1, i64* %scevgep23, align 8
  store i64 1, i64* %scevgep, align 8
  %indvar.next10 = add i64 %indvar9, 1
  %exitcond = icmp eq i64 %indvar.next10, 6
  br i1 %exitcond, label %for.end35, label %for.inc28.4
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %call = tail call i64 @func_1()
  %tmp = volatile load i32* getelementptr inbounds ([1 x [2 x i32]]* @g_3, i64 0, i64 0, i64 0), align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = volatile load i32* getelementptr inbounds ([1 x [2 x i32]]* @g_3, i64 0, i64 0, i64 1), align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = volatile load i32* getelementptr inbounds ([1 x [2 x i32]]* @g_3, i64 0, i64 0, i64 1), align 4
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = volatile load i32* @g_4, align 4
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str2, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = volatile load i32* @g_5, align 4
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str3, i64 0, i64 0), i32 %tmp8) nounwind
  %tmp10 = volatile load i32* @g_6, align 4
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str4, i64 0, i64 0), i32 %tmp10) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
