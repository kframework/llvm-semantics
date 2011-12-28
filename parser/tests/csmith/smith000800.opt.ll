; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000800.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -599044590, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  volatile store i32 0, i32* @g_2, align 4
  %tmp = volatile load i32* @g_2, align 4
  %cmp = icmp eq i32 %tmp, 0
  br i1 %cmp, label %for.end, label %return

for.end:                                          ; preds = %entry
  %tmp5 = volatile load i32* @g_2, align 4
  %conv6 = sext i32 %tmp5 to i64
  br label %return

return:                                           ; preds = %entry, %for.end
  %storemerge = phi i64 [ %conv6, %for.end ], [ -18002, %entry ]
  ret i64 %storemerge
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  volatile store i32 0, i32* @g_2, align 4
  %tmp.i = volatile load i32* @g_2, align 4
  %cmp.i = icmp eq i32 %tmp.i, 0
  br i1 %cmp.i, label %for.end.i, label %func_1.exit

for.end.i:                                        ; preds = %entry
  %tmp5.i = volatile load i32* @g_2, align 4
  br label %func_1.exit

func_1.exit:                                      ; preds = %entry, %for.end.i
  %tmp = volatile load i32* @g_2, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
