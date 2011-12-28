; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000634.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 736797483, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  volatile store i32 0, i32* @g_2, align 4
  %tmp = volatile load i32* @g_2, align 4
  %cmp = icmp slt i32 %tmp, -1
  br i1 %cmp, label %for.body, label %return

for.body:                                         ; preds = %entry
  %tmp1 = volatile load i32* @g_2, align 4
  volatile store i32 0, i32* @g_2, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc, %for.body
  %tmp4 = volatile load i32* @g_2, align 4
  %cmp5 = icmp eq i32 %tmp4, -30
  br i1 %cmp5, label %return, label %for.body6

for.body6:                                        ; preds = %for.cond3
  %tmp7 = volatile load i32* @g_2, align 4
  %tobool = icmp eq i32 %tmp7, 0
  br i1 %tobool, label %for.inc, label %return

for.inc:                                          ; preds = %for.body6
  %tmp8 = volatile load i32* @g_2, align 4
  %sub.i = shl i32 %tmp8, 24
  %sext = add i32 %sub.i, -16777216
  %conv9 = ashr exact i32 %sext, 24
  volatile store i32 %conv9, i32* @g_2, align 4
  br label %for.cond3

return:                                           ; preds = %for.cond3, %for.body6, %entry
  %storemerge.in = volatile load i32* @g_2, align 4
  %storemerge = trunc i32 %storemerge.in to i16
  ret i16 %storemerge
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  volatile store i32 0, i32* @g_2, align 4
  %tmp.i = volatile load i32* @g_2, align 4
  %cmp.i = icmp slt i32 %tmp.i, -1
  br i1 %cmp.i, label %for.body.i, label %func_1.exit

for.body.i:                                       ; preds = %entry
  %tmp1.i = volatile load i32* @g_2, align 4
  volatile store i32 0, i32* @g_2, align 4
  br label %for.cond3.i

for.cond3.i:                                      ; preds = %for.inc.i, %for.body.i
  %tmp4.i = volatile load i32* @g_2, align 4
  %cmp5.i = icmp eq i32 %tmp4.i, -30
  br i1 %cmp5.i, label %func_1.exit, label %for.body6.i

for.body6.i:                                      ; preds = %for.cond3.i
  %tmp7.i = volatile load i32* @g_2, align 4
  %tobool.i = icmp eq i32 %tmp7.i, 0
  br i1 %tobool.i, label %for.inc.i, label %func_1.exit

for.inc.i:                                        ; preds = %for.body6.i
  %tmp8.i = volatile load i32* @g_2, align 4
  %sub.i.i = shl i32 %tmp8.i, 24
  %sext.i = add i32 %sub.i.i, -16777216
  %conv9.i = ashr exact i32 %sext.i, 24
  volatile store i32 %conv9.i, i32* @g_2, align 4
  br label %for.cond3.i

func_1.exit:                                      ; preds = %for.cond3.i, %for.body6.i, %entry
  %storemerge.in.i = volatile load i32* @g_2, align 4
  %tmp = volatile load i32* @g_2, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
