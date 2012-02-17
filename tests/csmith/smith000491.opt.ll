; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000491.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 398334073, align 4
@g_7 = global i32 1, align 4
@g_8 = global i32* @g_2, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
entry:
  volatile store i32 19, i32* @g_2, align 4
  %tmp1 = volatile load i32* @g_2, align 4
  %cmp2 = icmp slt i32 %tmp1, 1
  %tmp63 = volatile load i32* @g_2, align 4
  br i1 %cmp2, label %for.inc, label %for.end

for.inc:                                          ; preds = %entry, %for.inc
  %tmp64 = phi i32 [ %tmp6, %for.inc ], [ %tmp63, %entry ]
  %add.i = add i32 %tmp64, 9
  volatile store i32 %add.i, i32* @g_2, align 4
  %tmp = volatile load i32* @g_2, align 4
  %cmp = icmp slt i32 %tmp, 1
  %tmp6 = volatile load i32* @g_2, align 4
  br i1 %cmp, label %for.inc, label %for.end

for.end:                                          ; preds = %for.inc, %entry
  %tmp6.lcssa = phi i32 [ %tmp63, %entry ], [ %tmp6, %for.inc ]
  %tmp8 = volatile load i32** @g_8, align 8
  volatile store i32 %tmp6.lcssa, i32* %tmp8, align 4
  %tmp9 = volatile load i32* @g_2, align 4
  %conv = trunc i32 %tmp9 to i8
  ret i8 %conv
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  volatile store i32 19, i32* @g_2, align 4
  %tmp1.i = volatile load i32* @g_2, align 4
  %cmp2.i = icmp slt i32 %tmp1.i, 1
  %tmp63.i = volatile load i32* @g_2, align 4
  br i1 %cmp2.i, label %for.inc.i, label %func_1.exit

for.inc.i:                                        ; preds = %entry, %for.inc.i
  %tmp64.i = phi i32 [ %tmp6.i, %for.inc.i ], [ %tmp63.i, %entry ]
  %add.i.i = add i32 %tmp64.i, 9
  volatile store i32 %add.i.i, i32* @g_2, align 4
  %tmp.i = volatile load i32* @g_2, align 4
  %cmp.i = icmp slt i32 %tmp.i, 1
  %tmp6.i = volatile load i32* @g_2, align 4
  br i1 %cmp.i, label %for.inc.i, label %func_1.exit

func_1.exit:                                      ; preds = %for.inc.i, %entry
  %tmp6.lcssa.i = phi i32 [ %tmp63.i, %entry ], [ %tmp6.i, %for.inc.i ]
  %tmp8.i = volatile load i32** @g_8, align 8
  volatile store i32 %tmp6.lcssa.i, i32* %tmp8.i, align 4
  %tmp9.i = volatile load i32* @g_2, align 4
  %tmp = volatile load i32* @g_2, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* @g_7, align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
