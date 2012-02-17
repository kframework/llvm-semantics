; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000234.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -1324299973, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  volatile store i32 -25, i32* @g_2, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc10, %entry
  %tmp = volatile load i32* @g_2, align 4
  %cmp = icmp sgt i32 %tmp, 17
  br i1 %cmp, label %for.body, label %for.end15

for.body:                                         ; preds = %for.cond
  volatile store i32 -17, i32* @g_2, align 4
  %tmp3 = volatile load i32* @g_2, align 4
  %cmp4 = icmp slt i32 %tmp3, 9
  br i1 %cmp4, label %return, label %for.inc10

for.inc10:                                        ; preds = %for.body
  %tmp11 = volatile load i32* @g_2, align 4
  %add.i = add i32 %tmp11, 1
  %conv14 = and i32 %add.i, 255
  volatile store i32 %conv14, i32* @g_2, align 4
  br label %for.cond

for.end15:                                        ; preds = %for.cond
  %tmp18 = volatile load i32* @g_2, align 4
  %conv19 = trunc i32 %tmp18 to i16
  br label %return

return:                                           ; preds = %for.body, %for.end15
  %storemerge = phi i16 [ %conv19, %for.end15 ], [ -1, %for.body ]
  ret i16 %storemerge
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  volatile store i32 -25, i32* @g_2, align 4
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.inc10.i, %entry
  %tmp.i = volatile load i32* @g_2, align 4
  %cmp.i = icmp sgt i32 %tmp.i, 17
  br i1 %cmp.i, label %for.body.i, label %for.end15.i

for.body.i:                                       ; preds = %for.cond.i
  volatile store i32 -17, i32* @g_2, align 4
  %tmp3.i = volatile load i32* @g_2, align 4
  %cmp4.i = icmp slt i32 %tmp3.i, 9
  br i1 %cmp4.i, label %func_1.exit, label %for.inc10.i

for.inc10.i:                                      ; preds = %for.body.i
  %tmp11.i = volatile load i32* @g_2, align 4
  %add.i.i = add i32 %tmp11.i, 1
  %conv14.i = and i32 %add.i.i, 255
  volatile store i32 %conv14.i, i32* @g_2, align 4
  br label %for.cond.i

for.end15.i:                                      ; preds = %for.cond.i
  %tmp18.i = volatile load i32* @g_2, align 4
  br label %func_1.exit

func_1.exit:                                      ; preds = %for.body.i, %for.end15.i
  %tmp = volatile load i32* @g_2, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
