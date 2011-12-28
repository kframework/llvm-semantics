; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000869.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global [5 x i32] [i32 5, i32 5, i32 5, i32 5, i32 5], align 16
@.str = private unnamed_addr constant [22 x i8] c"checksum g_2[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_2[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_2[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_2[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_2[4] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  volatile store i32 0, i32* getelementptr inbounds ([5 x i32]* @g_2, i64 0, i64 0), align 16
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = volatile load i32* getelementptr inbounds ([5 x i32]* @g_2, i64 0, i64 0), align 16
  %cmp = icmp sgt i32 %tmp, -1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = volatile load i32* getelementptr inbounds ([5 x i32]* @g_2, i64 0, i64 3), align 4
  %tobool = icmp eq i32 %tmp1, 0
  br i1 %tobool, label %for.inc, label %for.end

for.inc:                                          ; preds = %for.body
  %tmp2 = volatile load i32* getelementptr inbounds ([5 x i32]* @g_2, i64 0, i64 0), align 16
  %add.i = add i32 %tmp2, 5
  volatile store i32 %add.i, i32* getelementptr inbounds ([5 x i32]* @g_2, i64 0, i64 0), align 16
  br label %for.cond

for.end:                                          ; preds = %for.body, %for.cond
  ret i16 20955
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  volatile store i32 0, i32* getelementptr inbounds ([5 x i32]* @g_2, i64 0, i64 0), align 16
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.inc.i, %entry
  %tmp.i = volatile load i32* getelementptr inbounds ([5 x i32]* @g_2, i64 0, i64 0), align 16
  %cmp.i = icmp sgt i32 %tmp.i, -1
  br i1 %cmp.i, label %for.body.i, label %func_1.exit

for.body.i:                                       ; preds = %for.cond.i
  %tmp1.i = volatile load i32* getelementptr inbounds ([5 x i32]* @g_2, i64 0, i64 3), align 4
  %tobool.i = icmp eq i32 %tmp1.i, 0
  br i1 %tobool.i, label %for.inc.i, label %func_1.exit

for.inc.i:                                        ; preds = %for.body.i
  %tmp2.i = volatile load i32* getelementptr inbounds ([5 x i32]* @g_2, i64 0, i64 0), align 16
  %add.i.i = add i32 %tmp2.i, 5
  volatile store i32 %add.i.i, i32* getelementptr inbounds ([5 x i32]* @g_2, i64 0, i64 0), align 16
  br label %for.cond.i

func_1.exit:                                      ; preds = %for.cond.i, %for.body.i
  %tmp = volatile load i32* getelementptr inbounds ([5 x i32]* @g_2, i64 0, i64 0), align 16
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = volatile load i32* getelementptr inbounds ([5 x i32]* @g_2, i64 0, i64 1), align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = volatile load i32* getelementptr inbounds ([5 x i32]* @g_2, i64 0, i64 2), align 8
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = volatile load i32* getelementptr inbounds ([5 x i32]* @g_2, i64 0, i64 3), align 4
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = volatile load i32* getelementptr inbounds ([5 x i32]* @g_2, i64 0, i64 4), align 16
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i64 0, i64 0), i32 %tmp8) nounwind
  %tmp10 = volatile load i32* getelementptr inbounds ([5 x i32]* @g_2, i64 0, i64 0), align 16
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 %tmp10) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
