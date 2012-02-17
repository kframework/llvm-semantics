; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001682.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -179040897, align 4
@g_14 = global i32 492391683, align 4
@g_23 = global i32 -3, align 4
@g_28 = global i16 22707, align 2
@g_34 = global i32 -2076813535, align 4
@g_35 = global i32 -10, align 4
@g_36 = global i32 1743226037, align 4
@g_41 = global i8 1, align 1
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_14 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_23 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [20 x i8] c"checksum g_28 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [20 x i8] c"checksum g_34 = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [20 x i8] c"checksum g_35 = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [20 x i8] c"checksum g_36 = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [20 x i8] c"checksum g_41 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  volatile store i32 -5, i32* @g_2, align 4
  %tmp15 = volatile load i32* @g_2, align 4
  %cmp16 = icmp slt i32 %tmp15, 1
  %tmp91 = load i16* @g_28, align 2
  br i1 %cmp16, label %for.cond5.preheader.lr.ph, label %for.end104

for.cond5.preheader.lr.ph:                        ; preds = %entry
  %conv92 = zext i16 %tmp91 to i32
  %g_14.promoted = load i32* @g_14, align 4
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.cond5.preheader.lr.ph, %for.cond5.preheader
  %tmp2.i17 = phi i32 [ %g_14.promoted, %for.cond5.preheader.lr.ph ], [ %conv98, %for.cond5.preheader ]
  %tmp36 = volatile load i32* @g_2, align 4
  %cmp93 = icmp eq i32 %tmp2.i17, %conv92
  %conv94 = zext i1 %cmp93 to i32
  %conv.i = and i32 %tmp2.i17, 65535
  %cond.i3 = lshr i32 %conv.i, %conv94
  %conv5.i = trunc i32 %cond.i3 to i16
  %cmp97 = icmp eq i16 %conv5.i, 0
  %conv98 = zext i1 %cmp97 to i32
  %tmp100 = volatile load i32* @g_2, align 4
  %sub.i = add i32 %tmp100, 248
  %conv103 = and i32 %sub.i, 255
  volatile store i32 %conv103, i32* @g_2, align 4
  %tmp = volatile load i32* @g_2, align 4
  %cmp = icmp slt i32 %tmp, 1
  br i1 %cmp, label %for.cond5.preheader, label %for.cond.for.end104_crit_edge

for.cond.for.end104_crit_edge:                    ; preds = %for.cond5.preheader
  store i32 0, i32* @g_36, align 4
  store i32 1, i32* @g_35, align 4
  store i32 0, i32* @g_34, align 4
  store i32 %conv98, i32* @g_14, align 4
  store i32 1, i32* @g_23, align 4
  br label %for.end104

for.end104:                                       ; preds = %entry, %for.cond.for.end104_crit_edge
  store i32 0, i32* @g_35, align 4
  %conv111 = zext i16 %tmp91 to i32
  ret i32 %conv111
}

define i32 @func_17(i64 %p_18, i8 signext %p_19, i32 %p_20, i32 %p_21) nounwind uwtable {
entry:
  store i32 1, i32* @g_23, align 4
  %tmp2 = load i32* @g_14, align 4
  ret i32 %tmp2
}

define i32 @func_31(i8 zeroext %p_32) nounwind uwtable {
entry:
  store i32 0, i32* @g_34, align 4
  store i32 1, i32* @g_35, align 4
  store i32 0, i32* @g_36, align 4
  %tmp38 = load i32* @g_14, align 4
  ret i32 %tmp38
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  volatile store i32 -5, i32* @g_2, align 4
  %tmp15.i = volatile load i32* @g_2, align 4
  %cmp16.i = icmp slt i32 %tmp15.i, 1
  br i1 %cmp16.i, label %for.cond5.preheader.lr.ph.i, label %func_1.exit

for.cond5.preheader.lr.ph.i:                      ; preds = %entry
  %tmp91.i = load i16* @g_28, align 2
  %conv92.i = zext i16 %tmp91.i to i32
  %g_14.promoted.i = load i32* @g_14, align 4
  br label %for.cond5.preheader.i

for.cond5.preheader.i:                            ; preds = %for.cond5.preheader.i, %for.cond5.preheader.lr.ph.i
  %tmp2.i17.i = phi i32 [ %g_14.promoted.i, %for.cond5.preheader.lr.ph.i ], [ %conv98.i, %for.cond5.preheader.i ]
  %tmp36.i = volatile load i32* @g_2, align 4
  %cmp93.i = icmp eq i32 %tmp2.i17.i, %conv92.i
  %conv94.i = zext i1 %cmp93.i to i32
  %conv.i.i = and i32 %tmp2.i17.i, 65535
  %cond.i3.i = lshr i32 %conv.i.i, %conv94.i
  %conv5.i.i = trunc i32 %cond.i3.i to i16
  %cmp97.i = icmp eq i16 %conv5.i.i, 0
  %conv98.i = zext i1 %cmp97.i to i32
  %tmp100.i = volatile load i32* @g_2, align 4
  %sub.i.i = add i32 %tmp100.i, 248
  %conv103.i = and i32 %sub.i.i, 255
  volatile store i32 %conv103.i, i32* @g_2, align 4
  %tmp.i = volatile load i32* @g_2, align 4
  %cmp.i = icmp slt i32 %tmp.i, 1
  br i1 %cmp.i, label %for.cond5.preheader.i, label %for.cond.for.end104_crit_edge.i

for.cond.for.end104_crit_edge.i:                  ; preds = %for.cond5.preheader.i
  store i32 0, i32* @g_36, align 4
  store i32 1, i32* @g_35, align 4
  store i32 0, i32* @g_34, align 4
  store i32 %conv98.i, i32* @g_14, align 4
  store i32 1, i32* @g_23, align 4
  br label %func_1.exit

func_1.exit:                                      ; preds = %entry, %for.cond.for.end104_crit_edge.i
  store i32 0, i32* @g_35, align 4
  %tmp = volatile load i32* @g_2, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* @g_14, align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* @g_23, align 4
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = load i16* @g_28, align 2
  %conv = zext i16 %tmp6 to i32
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str3, i64 0, i64 0), i32 %conv) nounwind
  %tmp8 = load i32* @g_34, align 4
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str4, i64 0, i64 0), i32 %tmp8) nounwind
  %tmp10 = load i32* @g_35, align 4
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str5, i64 0, i64 0), i32 %tmp10) nounwind
  %tmp12 = load i32* @g_36, align 4
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str6, i64 0, i64 0), i32 %tmp12) nounwind
  %tmp14 = load i8* @g_41, align 1
  %conv15 = sext i8 %tmp14 to i32
  %call16 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str7, i64 0, i64 0), i32 %conv15) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
