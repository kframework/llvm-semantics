; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001860.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 1, align 4
@g_4 = global i32 1075400155, align 4
@g_5 = global i32 125972078, align 4
@g_6 = global i32 933865841, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_2 = alloca [5 x [8 x [1 x [1 x i16]]]], align 16
  br label %for.inc28.7

for.cond36.preheader:                             ; preds = %for.inc28.7
  store i32 0, i32* @g_3, align 4
  br label %for.body39

for.body39:                                       ; preds = %for.inc75, %for.cond36.preheader
  %indvar18 = phi i64 [ 0, %for.cond36.preheader ], [ %indvar.next19, %for.inc75 ]
  volatile store i32 0, i32* @g_4, align 4
  %tmp4111 = volatile load i32* @g_4, align 4
  %cmp4212 = icmp slt i32 %tmp4111, 8
  br i1 %cmp4212, label %for.body43, label %for.inc75

for.body43:                                       ; preds = %for.body39, %for.inc71
  volatile store i32 0, i32* @g_5, align 4
  %tmp458 = volatile load i32* @g_5, align 4
  %cmp469 = icmp slt i32 %tmp458, 1
  br i1 %cmp469, label %for.inc67, label %for.inc71

for.inc67:                                        ; preds = %for.body43, %for.inc67
  %tmp54 = volatile load i32* @g_5, align 4
  %tmp56 = volatile load i32* @g_4, align 4
  %tmp24 = sext i32 %tmp54 to i64
  %tmp25 = sext i32 %tmp56 to i64
  %tmp26 = add i64 %tmp24, %tmp25
  %arrayidx63 = getelementptr [5 x [8 x [1 x [1 x i16]]]]* %l_2, i64 0, i64 %indvar18, i64 0, i64 0, i64 %tmp26
  store i16 1, i16* %arrayidx63, align 2
  %tmp68 = volatile load i32* @g_5, align 4
  %add69 = add nsw i32 %tmp68, 1
  volatile store i32 %add69, i32* @g_5, align 4
  %tmp45 = volatile load i32* @g_5, align 4
  %cmp46 = icmp slt i32 %tmp45, 1
  br i1 %cmp46, label %for.inc67, label %for.cond44.for.inc71_crit_edge

for.cond44.for.inc71_crit_edge:                   ; preds = %for.inc67
  store i32 1, i32* @g_6, align 4
  br label %for.inc71

for.inc71:                                        ; preds = %for.cond44.for.inc71_crit_edge, %for.body43
  %tmp72 = volatile load i32* @g_4, align 4
  %add73 = add nsw i32 %tmp72, 1
  volatile store i32 %add73, i32* @g_4, align 4
  %tmp41 = volatile load i32* @g_4, align 4
  %cmp42 = icmp slt i32 %tmp41, 8
  br i1 %cmp42, label %for.body43, label %for.inc75

for.inc75:                                        ; preds = %for.inc71, %for.body39
  %indvar.next19 = add i64 %indvar18, 1
  %exitcond = icmp eq i64 %indvar.next19, 5
  br i1 %exitcond, label %for.end78, label %for.body39

for.end78:                                        ; preds = %for.inc75
  store i32 5, i32* @g_3, align 4
  %arrayidx82 = getelementptr inbounds [5 x [8 x [1 x [1 x i16]]]]* %l_2, i64 0, i64 2, i64 4, i64 0, i64 0
  %tmp83 = load i16* %arrayidx82, align 8
  %conv = sext i16 %tmp83 to i32
  ret i32 %conv

for.inc28.7:                                      ; preds = %for.inc28.7, %entry
  %indvar32 = phi i64 [ 0, %entry ], [ %indvar.next33, %for.inc28.7 ]
  %scevgep = getelementptr [5 x [8 x [1 x [1 x i16]]]]* %l_2, i64 0, i64 %indvar32, i64 7, i64 0, i64 0
  %scevgep50 = getelementptr [5 x [8 x [1 x [1 x i16]]]]* %l_2, i64 0, i64 %indvar32, i64 6, i64 0, i64 0
  %scevgep53 = getelementptr [5 x [8 x [1 x [1 x i16]]]]* %l_2, i64 0, i64 %indvar32, i64 5, i64 0, i64 0
  %scevgep57 = getelementptr [5 x [8 x [1 x [1 x i16]]]]* %l_2, i64 0, i64 %indvar32, i64 4, i64 0, i64 0
  %scevgep60 = getelementptr [5 x [8 x [1 x [1 x i16]]]]* %l_2, i64 0, i64 %indvar32, i64 3, i64 0, i64 0
  %scevgep63 = getelementptr [5 x [8 x [1 x [1 x i16]]]]* %l_2, i64 0, i64 %indvar32, i64 2, i64 0, i64 0
  %scevgep66 = getelementptr [5 x [8 x [1 x [1 x i16]]]]* %l_2, i64 0, i64 %indvar32, i64 1, i64 0, i64 0
  %arrayidx22 = getelementptr [5 x [8 x [1 x [1 x i16]]]]* %l_2, i64 0, i64 %indvar32, i64 0, i64 0, i64 0
  store i16 2, i16* %arrayidx22, align 16
  store i16 2, i16* %scevgep66, align 2
  store i16 2, i16* %scevgep63, align 4
  store i16 2, i16* %scevgep60, align 2
  store i16 2, i16* %scevgep57, align 8
  store i16 2, i16* %scevgep53, align 2
  store i16 2, i16* %scevgep50, align 4
  store i16 2, i16* %scevgep, align 2
  %indvar.next33 = add i64 %indvar32, 1
  %exitcond48 = icmp eq i64 %indvar.next33, 5
  br i1 %exitcond48, label %for.cond36.preheader, label %for.inc28.7
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %call = tail call i32 @func_1()
  %tmp = load i32* @g_3, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = volatile load i32* @g_4, align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = volatile load i32* @g_5, align 4
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = load i32* @g_6, align 4
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
