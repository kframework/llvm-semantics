; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001162.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -1931221442, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  volatile store i32 0, i32* @g_2, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = volatile load i32* @g_2, align 4
  %cmp = icmp eq i32 %tmp, 7
  br i1 %cmp, label %for.end, label %for.body

for.body:                                         ; preds = %for.cond
  %tmp1 = volatile load i32* @g_2, align 4
  %tobool = icmp eq i32 %tmp1, 0
  br i1 %tobool, label %for.inc, label %for.end

for.inc:                                          ; preds = %for.body
  %tmp2 = volatile load i32* @g_2, align 4
  %add.i = add i32 %tmp2, 4
  %conv3 = and i32 %add.i, 255
  volatile store i32 %conv3, i32* @g_2, align 4
  br label %for.cond

for.end:                                          ; preds = %for.body, %for.cond
  %tmp4 = volatile load i32* @g_2, align 4
  volatile store i32 %tmp4, i32* @g_2, align 4
  %tmp6 = volatile load i32* @g_2, align 4
  ret i32 %tmp6
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  volatile store i32 0, i32* @g_2, align 4
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.inc.i, %entry
  %tmp.i = volatile load i32* @g_2, align 4
  %cmp.i = icmp eq i32 %tmp.i, 7
  br i1 %cmp.i, label %func_1.exit, label %for.body.i

for.body.i:                                       ; preds = %for.cond.i
  %tmp1.i = volatile load i32* @g_2, align 4
  %tobool.i = icmp eq i32 %tmp1.i, 0
  br i1 %tobool.i, label %for.inc.i, label %func_1.exit

for.inc.i:                                        ; preds = %for.body.i
  %tmp2.i = volatile load i32* @g_2, align 4
  %add.i.i = add i32 %tmp2.i, 4
  %conv3.i = and i32 %add.i.i, 255
  volatile store i32 %conv3.i, i32* @g_2, align 4
  br label %for.cond.i

func_1.exit:                                      ; preds = %for.cond.i, %for.body.i
  %tmp4.i = volatile load i32* @g_2, align 4
  volatile store i32 %tmp4.i, i32* @g_2, align 4
  %tmp6.i = volatile load i32* @g_2, align 4
  %tmp = volatile load i32* @g_2, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
