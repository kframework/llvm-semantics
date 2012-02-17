; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000704.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_5 = global i16 -1, align 2
@g_6 = global i16 1, align 2
@.str = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i8 @func_1() nounwind uwtable {
entry:
  %tmp4 = load i16* @g_6, align 2
  %tobool = icmp eq i16 %tmp4, 0
  br label %lbl_9

lbl_9:                                            ; preds = %for.cond, %entry
  %tmp2 = volatile load i16* @g_5, align 2
  volatile store i16 5, i16* @g_5, align 2
  br i1 %tobool, label %for.cond.us, label %for.cond

for.cond.us:                                      ; preds = %lbl_9, %if.end.us
  %tmp8.us = volatile load i16* @g_5, align 2
  %cmp.us = icmp eq i16 %tmp8.us, 5
  br i1 %cmp.us, label %for.end, label %if.end.us

if.end.us:                                        ; preds = %for.cond.us
  %tmp18.us = volatile load i16* @g_5, align 2
  %sub.i.us = shl i16 %tmp18.us, 8
  %sext5.us = add i16 %sub.i.us, -1792
  %conv21.us = ashr exact i16 %sext5.us, 8
  volatile store i16 %conv21.us, i16* @g_5, align 2
  br label %for.cond.us

for.cond:                                         ; preds = %lbl_9
  %tmp8 = volatile load i16* @g_5, align 2
  %cmp = icmp eq i16 %tmp8, 5
  br i1 %cmp, label %for.end, label %lbl_9

for.end:                                          ; preds = %for.cond, %for.cond.us
  %conv23 = trunc i16 %tmp4 to i8
  ret i8 %conv23
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp4.i = load i16* @g_6, align 2
  %tobool.i = icmp eq i16 %tmp4.i, 0
  br i1 %tobool.i, label %for.cond.us.i.preheader, label %for.cond.i

for.cond.us.i.preheader:                          ; preds = %entry
  %tmp2.i.us = volatile load i16* @g_5, align 2
  volatile store i16 5, i16* @g_5, align 2
  %tmp8.us.i1 = volatile load i16* @g_5, align 2
  %cmp.us.i2 = icmp eq i16 %tmp8.us.i1, 5
  br i1 %cmp.us.i2, label %func_1.exit, label %if.end.us.i

if.end.us.i:                                      ; preds = %for.cond.us.i.preheader, %if.end.us.i
  %tmp18.us.i = volatile load i16* @g_5, align 2
  %sub.i.us.i = shl i16 %tmp18.us.i, 8
  %sext5.us.i = add i16 %sub.i.us.i, -1792
  %conv21.us.i = ashr exact i16 %sext5.us.i, 8
  volatile store i16 %conv21.us.i, i16* @g_5, align 2
  %tmp8.us.i = volatile load i16* @g_5, align 2
  %cmp.us.i = icmp eq i16 %tmp8.us.i, 5
  br i1 %cmp.us.i, label %func_1.exit, label %if.end.us.i

for.cond.i:                                       ; preds = %for.cond.i, %entry
  %tmp2.i = volatile load i16* @g_5, align 2
  volatile store i16 5, i16* @g_5, align 2
  %tmp8.i = volatile load i16* @g_5, align 2
  %cmp.i = icmp eq i16 %tmp8.i, 5
  br i1 %cmp.i, label %func_1.exit, label %for.cond.i

func_1.exit:                                      ; preds = %for.cond.i, %for.cond.us.i.preheader, %if.end.us.i
  %tmp = volatile load i16* @g_5, align 2
  %conv = zext i16 %tmp to i32
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %conv) nounwind
  %tmp2 = load i16* @g_6, align 2
  %conv3 = sext i16 %tmp2 to i32
  %call4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i64 0, i64 0), i32 %conv3) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
