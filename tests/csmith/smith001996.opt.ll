; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001996.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -1, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
entry:
  %tmp = volatile load i32* @g_2, align 4
  %tobool = icmp eq i32 %tmp, 0
  br i1 %tobool, label %return, label %if.then

if.then:                                          ; preds = %entry
  %tmp1 = volatile load i32* @g_2, align 4
  %conv = trunc i32 %tmp1 to i8
  br label %return

return:                                           ; preds = %entry, %if.then
  %storemerge = phi i8 [ %conv, %if.then ], [ -61, %entry ]
  ret i8 %storemerge
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp.i = volatile load i32* @g_2, align 4
  %tobool.i = icmp eq i32 %tmp.i, 0
  br i1 %tobool.i, label %func_1.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  %tmp1.i = volatile load i32* @g_2, align 4
  br label %func_1.exit

func_1.exit:                                      ; preds = %entry, %if.then.i
  %tmp = volatile load i32* @g_2, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
