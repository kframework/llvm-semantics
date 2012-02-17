; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001784.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 1615296610, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  volatile store i32 0, i32* @g_2, align 4
  %tmp = volatile load i32* @g_2, align 4
  %cmp = icmp slt i32 %tmp, 27
  %tmp1 = volatile load i32* @g_2, align 4
  br i1 %cmp, label %for.body, label %return

for.body:                                         ; preds = %entry
  %tobool = icmp eq i32 %tmp1, 0
  br i1 %tobool, label %return, label %if.then

if.then:                                          ; preds = %for.body
  %tmp2 = volatile load i32* @g_2, align 4
  br label %return

return:                                           ; preds = %entry, %for.body, %if.then
  %0 = phi i32 [ %tmp2, %if.then ], [ -1, %for.body ], [ %tmp1, %entry ]
  ret i32 %0
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  volatile store i32 0, i32* @g_2, align 4
  %tmp.i = volatile load i32* @g_2, align 4
  %cmp.i = icmp sgt i32 %tmp.i, 26
  %tmp1.i = volatile load i32* @g_2, align 4
  %tobool.i = icmp eq i32 %tmp1.i, 0
  %or.cond = or i1 %cmp.i, %tobool.i
  br i1 %or.cond, label %func_1.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  %tmp2.i = volatile load i32* @g_2, align 4
  br label %func_1.exit

func_1.exit:                                      ; preds = %entry, %if.then.i
  %tmp = volatile load i32* @g_2, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
