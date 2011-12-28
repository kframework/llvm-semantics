; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001277.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 1988232740, align 4
@g_5 = global i32 -950892824, align 4
@g_11 = global i32* null, align 8
@g_12 = global i32* @g_5, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  volatile store i32 0, i32* @g_2, align 4
  %tmp4 = volatile load i32* @g_2, align 4
  %cmp5 = icmp slt i32 %tmp4, 5
  br i1 %cmp5, label %for.cond1.preheader, label %for.end14

for.cond1.preheader:                              ; preds = %entry, %for.cond1.preheader
  %tmp10 = volatile load i32* @g_2, align 4
  %add.i = add i32 %tmp10, 8
  volatile store i32 %add.i, i32* @g_2, align 4
  %tmp = volatile load i32* @g_2, align 4
  %cmp = icmp slt i32 %tmp, 5
  br i1 %cmp, label %for.cond1.preheader, label %for.cond.for.end14_crit_edge

for.cond.for.end14_crit_edge:                     ; preds = %for.cond1.preheader
  store i32 -1, i32* @g_5, align 4
  br label %for.end14

for.end14:                                        ; preds = %for.cond.for.end14_crit_edge, %entry
  %tmp19 = volatile load i32** @g_12, align 8
  store i32 1, i32* %tmp19, align 4
  %tmp20 = volatile load i32* @g_2, align 4
  %conv21 = sext i32 %tmp20 to i64
  ret i64 %conv21
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  volatile store i32 0, i32* @g_2, align 4
  %tmp4.i = volatile load i32* @g_2, align 4
  %cmp5.i = icmp slt i32 %tmp4.i, 5
  br i1 %cmp5.i, label %for.cond1.preheader.i, label %func_1.exit

for.cond1.preheader.i:                            ; preds = %entry, %for.cond1.preheader.i
  %tmp10.i = volatile load i32* @g_2, align 4
  %add.i.i = add i32 %tmp10.i, 8
  volatile store i32 %add.i.i, i32* @g_2, align 4
  %tmp.i = volatile load i32* @g_2, align 4
  %cmp.i = icmp slt i32 %tmp.i, 5
  br i1 %cmp.i, label %for.cond1.preheader.i, label %for.cond.for.end14_crit_edge.i

for.cond.for.end14_crit_edge.i:                   ; preds = %for.cond1.preheader.i
  store i32 -1, i32* @g_5, align 4
  br label %func_1.exit

func_1.exit:                                      ; preds = %entry, %for.cond.for.end14_crit_edge.i
  %tmp19.i = volatile load i32** @g_12, align 8
  store i32 1, i32* %tmp19.i, align 4
  %tmp20.i = volatile load i32* @g_2, align 4
  %tmp = volatile load i32* @g_2, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* @g_5, align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
