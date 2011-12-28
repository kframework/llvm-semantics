; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000000.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 -1649564615, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  volatile store i32 0, i32* @g_3, align 4
  %tmp4 = volatile load i32* @g_3, align 4
  %cmp5 = icmp slt i32 %tmp4, 2
  br i1 %cmp5, label %return, label %for.end11

for.end11:                                        ; preds = %entry
  %tmp12 = volatile load i32* @g_3, align 4
  br label %return

return:                                           ; preds = %entry, %for.end11
  %storemerge1 = phi i32 [ %tmp12, %for.end11 ], [ 6, %entry ]
  ret i32 %storemerge1
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  volatile store i32 0, i32* @g_3, align 4
  %tmp4.i = volatile load i32* @g_3, align 4
  %cmp5.i = icmp slt i32 %tmp4.i, 2
  br i1 %cmp5.i, label %func_1.exit, label %for.end11.i

for.end11.i:                                      ; preds = %entry
  %tmp12.i = volatile load i32* @g_3, align 4
  br label %func_1.exit

func_1.exit:                                      ; preds = %entry, %for.end11.i
  %tmp = volatile load i32* @g_3, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
