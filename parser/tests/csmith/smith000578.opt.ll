; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000578.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 2111604215, align 4
@g_8 = global i32 1492875018, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_8 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i8 @func_1() nounwind uwtable {
entry:
  volatile store i32 0, i32* @g_2, align 4
  %tmp3 = volatile load i32* @g_2, align 4
  %cmp4 = icmp sgt i32 %tmp3, -25
  br i1 %cmp4, label %for.body, label %for.end

for.body:                                         ; preds = %entry, %for.body
  %tmp2 = volatile load i32* @g_2, align 4
  %tmp5 = volatile load i32* @g_2, align 4
  %add.i = shl i32 %tmp5, 24
  %sext1 = add i32 %add.i, 134217728
  %conv8 = ashr exact i32 %sext1, 24
  volatile store i32 %conv8, i32* @g_2, align 4
  %tmp = volatile load i32* @g_2, align 4
  %cmp = icmp sgt i32 %tmp, -25
  br i1 %cmp, label %for.body, label %for.cond.for.end_crit_edge

for.cond.for.end_crit_edge:                       ; preds = %for.body
  %sext = shl i32 %tmp2, 24
  %conv3 = ashr exact i32 %sext, 24
  store i32 %conv3, i32* @g_8, align 4
  br label %for.end

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %entry
  ret i8 1
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  volatile store i32 0, i32* @g_2, align 4
  %tmp3.i = volatile load i32* @g_2, align 4
  %cmp4.i = icmp sgt i32 %tmp3.i, -25
  br i1 %cmp4.i, label %for.body.i, label %func_1.exit

for.body.i:                                       ; preds = %entry, %for.body.i
  %tmp2.i = volatile load i32* @g_2, align 4
  %tmp5.i = volatile load i32* @g_2, align 4
  %add.i.i = shl i32 %tmp5.i, 24
  %sext1.i = add i32 %add.i.i, 134217728
  %conv8.i = ashr exact i32 %sext1.i, 24
  volatile store i32 %conv8.i, i32* @g_2, align 4
  %tmp.i = volatile load i32* @g_2, align 4
  %cmp.i = icmp sgt i32 %tmp.i, -25
  br i1 %cmp.i, label %for.body.i, label %for.cond.for.end_crit_edge.i

for.cond.for.end_crit_edge.i:                     ; preds = %for.body.i
  %sext.i = shl i32 %tmp2.i, 24
  %conv3.i = ashr exact i32 %sext.i, 24
  store i32 %conv3.i, i32* @g_8, align 4
  br label %func_1.exit

func_1.exit:                                      ; preds = %entry, %for.cond.for.end_crit_edge.i
  %tmp = volatile load i32* @g_2, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* @g_8, align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
