; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000025.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global [5 x i32] [i32 4, i32 4, i32 4, i32 4, i32 4], align 16
@g_7 = global i32 1572032109, align 4
@g_13 = constant [6 x i32*] [i32* @g_7, i32* @g_7, i32* @g_7, i32* @g_7, i32* @g_7, i32* @g_7], align 16
@g_14 = global [1 x i32*] zeroinitializer, align 8
@.str = private unnamed_addr constant [22 x i8] c"checksum g_2[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_2[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_2[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_2[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_2[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  volatile store i32 0, i32* getelementptr inbounds ([5 x i32]* @g_2, i64 0, i64 4), align 16
  %tmp4812 = volatile load i32* getelementptr inbounds ([5 x i32]* @g_2, i64 0, i64 4), align 16
  %cmp4913 = icmp sgt i32 %tmp4812, 28
  br i1 %cmp4913, label %for.cond64.preheader, label %entry.for.end99_crit_edge

entry.for.end99_crit_edge:                        ; preds = %entry
  %tmp100.pre = load i32* @g_7, align 4
  br label %for.end99

for.cond64.preheader:                             ; preds = %for.inc94, %entry, %for.cond64.preheader
  %conv9211 = phi i32 [ %conv92, %for.cond64.preheader ], [ 5, %entry ], [ 5, %for.inc94 ]
  %sub.i = shl nsw i32 %conv9211, 16
  %sext8 = add i32 %sub.i, -131072
  %conv92 = ashr exact i32 %sext8, 16
  %cmp57 = icmp slt i32 %sext8, 1638400
  br i1 %cmp57, label %for.cond64.preheader, label %for.inc94

for.inc94:                                        ; preds = %for.cond64.preheader
  %tmp95 = volatile load i32* getelementptr inbounds ([5 x i32]* @g_2, i64 0, i64 4), align 16
  %add.i = shl i32 %tmp95, 16
  %sext = add i32 %add.i, 65536
  %conv98 = ashr exact i32 %sext, 16
  volatile store i32 %conv98, i32* getelementptr inbounds ([5 x i32]* @g_2, i64 0, i64 4), align 16
  %tmp48 = volatile load i32* getelementptr inbounds ([5 x i32]* @g_2, i64 0, i64 4), align 16
  %cmp49 = icmp sgt i32 %tmp48, 28
  br i1 %cmp49, label %for.cond64.preheader, label %for.cond47.for.end99_crit_edge

for.cond47.for.end99_crit_edge:                   ; preds = %for.inc94
  store i32 %conv92, i32* @g_7, align 4
  br label %for.end99

for.end99:                                        ; preds = %entry.for.end99_crit_edge, %for.cond47.for.end99_crit_edge
  %tmp100 = phi i32 [ %tmp100.pre, %entry.for.end99_crit_edge ], [ %conv92, %for.cond47.for.end99_crit_edge ]
  volatile store i32* @g_7, i32** getelementptr inbounds ([1 x i32*]* @g_14, i64 0, i64 0), align 8
  %conv101 = sext i32 %tmp100 to i64
  ret i64 %conv101
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  volatile store i32 0, i32* getelementptr inbounds ([5 x i32]* @g_2, i64 0, i64 4), align 16
  %tmp4812.i = volatile load i32* getelementptr inbounds ([5 x i32]* @g_2, i64 0, i64 4), align 16
  %cmp4913.i = icmp sgt i32 %tmp4812.i, 28
  br i1 %cmp4913.i, label %for.cond64.preheader.i, label %func_1.exit

for.cond64.preheader.i:                           ; preds = %for.inc94.i, %for.cond64.preheader.i, %entry
  %conv9211.i = phi i32 [ 5, %entry ], [ %conv92.i, %for.cond64.preheader.i ], [ 5, %for.inc94.i ]
  %sub.i.i = shl nsw i32 %conv9211.i, 16
  %sext8.i = add i32 %sub.i.i, -131072
  %conv92.i = ashr exact i32 %sext8.i, 16
  %cmp57.i = icmp slt i32 %sext8.i, 1638400
  br i1 %cmp57.i, label %for.cond64.preheader.i, label %for.inc94.i

for.inc94.i:                                      ; preds = %for.cond64.preheader.i
  %tmp95.i = volatile load i32* getelementptr inbounds ([5 x i32]* @g_2, i64 0, i64 4), align 16
  %add.i.i = shl i32 %tmp95.i, 16
  %sext.i = add i32 %add.i.i, 65536
  %conv98.i = ashr exact i32 %sext.i, 16
  volatile store i32 %conv98.i, i32* getelementptr inbounds ([5 x i32]* @g_2, i64 0, i64 4), align 16
  %tmp48.i = volatile load i32* getelementptr inbounds ([5 x i32]* @g_2, i64 0, i64 4), align 16
  %cmp49.i = icmp sgt i32 %tmp48.i, 28
  br i1 %cmp49.i, label %for.cond64.preheader.i, label %for.cond47.for.end99_crit_edge.i

for.cond47.for.end99_crit_edge.i:                 ; preds = %for.inc94.i
  store i32 %conv92.i, i32* @g_7, align 4
  br label %func_1.exit

func_1.exit:                                      ; preds = %entry, %for.cond47.for.end99_crit_edge.i
  volatile store i32* @g_7, i32** getelementptr inbounds ([1 x i32*]* @g_14, i64 0, i64 0), align 8
  %tmp = volatile load i32* getelementptr inbounds ([5 x i32]* @g_2, i64 0, i64 0), align 16
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = volatile load i32* getelementptr inbounds ([5 x i32]* @g_2, i64 0, i64 1), align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = volatile load i32* getelementptr inbounds ([5 x i32]* @g_2, i64 0, i64 2), align 8
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = volatile load i32* getelementptr inbounds ([5 x i32]* @g_2, i64 0, i64 3), align 4
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = volatile load i32* getelementptr inbounds ([5 x i32]* @g_2, i64 0, i64 4), align 16
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i64 0, i64 0), i32 %tmp8) nounwind
  %tmp10 = volatile load i32* getelementptr inbounds ([5 x i32]* @g_2, i64 0, i64 4), align 16
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i64 0, i64 0), i32 %tmp10) nounwind
  %tmp12 = load i32* @g_7, align 4
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str5, i64 0, i64 0), i32 %tmp12) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
