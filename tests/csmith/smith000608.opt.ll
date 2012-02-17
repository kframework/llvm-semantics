; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000608.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -2, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
entry:
  volatile store i32 -15, i32* @g_2, align 4
  %tmp = volatile load i32* @g_2, align 4
  %cmp = icmp eq i32 %tmp, 0
  br i1 %cmp, label %for.cond3.preheader, label %for.end13

for.cond3.preheader:                              ; preds = %entry
  volatile store i32 5, i32* @g_2, align 4
  br label %return

for.end13:                                        ; preds = %entry
  %tmp14 = volatile load i32* @g_2, align 4
  %conv15 = trunc i32 %tmp14 to i16
  br label %return

return:                                           ; preds = %for.end13, %for.cond3.preheader
  %storemerge1 = phi i16 [ 1, %for.cond3.preheader ], [ %conv15, %for.end13 ]
  ret i16 %storemerge1
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  volatile store i32 -15, i32* @g_2, align 4
  %tmp.i = volatile load i32* @g_2, align 4
  %cmp.i = icmp eq i32 %tmp.i, 0
  br i1 %cmp.i, label %for.cond3.preheader.i, label %for.end13.i

for.cond3.preheader.i:                            ; preds = %entry
  volatile store i32 5, i32* @g_2, align 4
  br label %func_1.exit

for.end13.i:                                      ; preds = %entry
  %tmp14.i = volatile load i32* @g_2, align 4
  br label %func_1.exit

func_1.exit:                                      ; preds = %for.cond3.preheader.i, %for.end13.i
  %tmp = volatile load i32* @g_2, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
