; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001570.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 0, align 4
@g_5 = global i16 -1, align 2
@g_7 = global i32 1, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i8 @func_1() nounwind uwtable {
entry:
  volatile store i32 4, i32* @g_2, align 4
  %tmp153 = volatile load i32* @g_2, align 4
  %cmp164 = icmp slt i32 %tmp153, -14
  %tmp195 = volatile load i32* @g_2, align 4
  %tmp20 = load i16* @g_5, align 2
  br i1 %cmp164, label %for.body17.lr.ph, label %for.end30

for.body17.lr.ph:                                 ; preds = %entry
  %conv21 = sext i16 %tmp20 to i64
  %xor = xor i64 %conv21, 3647139437
  %g_7.promoted = load i32* @g_7, align 4
  br label %for.body17

for.body17:                                       ; preds = %for.body17.lr.ph, %for.body17
  %tmp257 = phi i32 [ %g_7.promoted, %for.body17.lr.ph ], [ %or, %for.body17 ]
  %tmp196 = phi i32 [ %tmp195, %for.body17.lr.ph ], [ %tmp19, %for.body17 ]
  %conv = sext i32 %tmp196 to i64
  %cmp22 = icmp ne i64 %conv, %xor
  %conv23 = zext i1 %cmp22 to i32
  %or = or i32 %conv23, %tmp257
  %tmp29 = volatile load i32* @g_2, align 4
  %cmp6.i = icmp eq i32 %tmp29, 2147483647
  %add.i = add nsw i32 %tmp29, 1
  %cond.i = select i1 %cmp6.i, i32 2147483647, i32 %add.i
  volatile store i32 %cond.i, i32* @g_2, align 4
  %tmp15 = volatile load i32* @g_2, align 4
  %cmp16 = icmp slt i32 %tmp15, -14
  %tmp19 = volatile load i32* @g_2, align 4
  br i1 %cmp16, label %for.body17, label %for.cond14.for.end30_crit_edge

for.cond14.for.end30_crit_edge:                   ; preds = %for.body17
  store i32 %or, i32* @g_7, align 4
  br label %for.end30

for.end30:                                        ; preds = %entry, %for.cond14.for.end30_crit_edge
  volatile store i32 0, i32* @g_2, align 4
  %conv38 = trunc i16 %tmp20 to i8
  ret i8 %conv38
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  volatile store i32 4, i32* @g_2, align 4
  %tmp153.i = volatile load i32* @g_2, align 4
  %cmp164.i = icmp slt i32 %tmp153.i, -14
  %tmp195.i = volatile load i32* @g_2, align 4
  br i1 %cmp164.i, label %for.body17.lr.ph.i, label %func_1.exit

for.body17.lr.ph.i:                               ; preds = %entry
  %tmp20.i = load i16* @g_5, align 2
  %conv21.i = sext i16 %tmp20.i to i64
  %xor.i = xor i64 %conv21.i, 3647139437
  %g_7.promoted.i = load i32* @g_7, align 4
  br label %for.body17.i

for.body17.i:                                     ; preds = %for.body17.i, %for.body17.lr.ph.i
  %tmp257.i = phi i32 [ %g_7.promoted.i, %for.body17.lr.ph.i ], [ %or.i, %for.body17.i ]
  %tmp196.i = phi i32 [ %tmp195.i, %for.body17.lr.ph.i ], [ %tmp19.i, %for.body17.i ]
  %conv.i = sext i32 %tmp196.i to i64
  %cmp22.i = icmp ne i64 %conv.i, %xor.i
  %conv23.i = zext i1 %cmp22.i to i32
  %or.i = or i32 %conv23.i, %tmp257.i
  %tmp29.i = volatile load i32* @g_2, align 4
  %cmp6.i.i = icmp eq i32 %tmp29.i, 2147483647
  %add.i.i = add nsw i32 %tmp29.i, 1
  %cond.i.i = select i1 %cmp6.i.i, i32 2147483647, i32 %add.i.i
  volatile store i32 %cond.i.i, i32* @g_2, align 4
  %tmp15.i = volatile load i32* @g_2, align 4
  %cmp16.i = icmp slt i32 %tmp15.i, -14
  %tmp19.i = volatile load i32* @g_2, align 4
  br i1 %cmp16.i, label %for.body17.i, label %for.cond14.for.end30_crit_edge.i

for.cond14.for.end30_crit_edge.i:                 ; preds = %for.body17.i
  store i32 %or.i, i32* @g_7, align 4
  br label %func_1.exit

func_1.exit:                                      ; preds = %entry, %for.cond14.for.end30_crit_edge.i
  volatile store i32 0, i32* @g_2, align 4
  %tmp = volatile load i32* @g_2, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i16* @g_5, align 2
  %conv = sext i16 %tmp2 to i32
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i64 0, i64 0), i32 %conv) nounwind
  %tmp4 = load i32* @g_7, align 4
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
