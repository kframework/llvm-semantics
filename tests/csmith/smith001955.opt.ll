; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001955.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global [7 x i32] [i32 -512397033, i32 -512397033, i32 -512397033, i32 -512397033, i32 -512397033, i32 -512397033, i32 -512397033], align 16
@g_5 = global i32* getelementptr inbounds ([7 x i32]* @g_2, i64 0, i64 4), align 8
@.str = private unnamed_addr constant [22 x i8] c"checksum g_2[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_2[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_2[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_2[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_2[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_2[5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_2[6] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  volatile store i32 -3, i32* getelementptr inbounds ([7 x i32]* @g_2, i64 0, i64 3), align 4
  %tmp = volatile load i32* getelementptr inbounds ([7 x i32]* @g_2, i64 0, i64 3), align 4
  %cmp = icmp slt i32 %tmp, -7
  br i1 %cmp, label %for.body, label %return

for.body:                                         ; preds = %entry
  %tmp1 = volatile load i32* getelementptr inbounds ([7 x i32]* @g_2, i64 0, i64 3), align 4
  %tmp2 = volatile load i32** @g_5, align 8
  volatile store i32 %tmp1, i32* %tmp2, align 4
  br label %return

return:                                           ; preds = %entry, %for.body
  %storemerge.in = volatile load i32* getelementptr inbounds ([7 x i32]* @g_2, i64 0, i64 3), align 4
  %storemerge = sext i32 %storemerge.in to i64
  ret i64 %storemerge
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  volatile store i32 -3, i32* getelementptr inbounds ([7 x i32]* @g_2, i64 0, i64 3), align 4
  %tmp.i = volatile load i32* getelementptr inbounds ([7 x i32]* @g_2, i64 0, i64 3), align 4
  %cmp.i = icmp slt i32 %tmp.i, -7
  br i1 %cmp.i, label %for.body.i, label %func_1.exit

for.body.i:                                       ; preds = %entry
  %tmp1.i = volatile load i32* getelementptr inbounds ([7 x i32]* @g_2, i64 0, i64 3), align 4
  %tmp2.i = volatile load i32** @g_5, align 8
  volatile store i32 %tmp1.i, i32* %tmp2.i, align 4
  br label %func_1.exit

func_1.exit:                                      ; preds = %entry, %for.body.i
  %storemerge.in.i = volatile load i32* getelementptr inbounds ([7 x i32]* @g_2, i64 0, i64 3), align 4
  %tmp = volatile load i32* getelementptr inbounds ([7 x i32]* @g_2, i64 0, i64 0), align 16
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = volatile load i32* getelementptr inbounds ([7 x i32]* @g_2, i64 0, i64 1), align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = volatile load i32* getelementptr inbounds ([7 x i32]* @g_2, i64 0, i64 2), align 8
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = volatile load i32* getelementptr inbounds ([7 x i32]* @g_2, i64 0, i64 3), align 4
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = volatile load i32* getelementptr inbounds ([7 x i32]* @g_2, i64 0, i64 4), align 16
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i64 0, i64 0), i32 %tmp8) nounwind
  %tmp10 = volatile load i32* getelementptr inbounds ([7 x i32]* @g_2, i64 0, i64 5), align 4
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i64 0, i64 0), i32 %tmp10) nounwind
  %tmp12 = volatile load i32* getelementptr inbounds ([7 x i32]* @g_2, i64 0, i64 6), align 8
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i64 0, i64 0), i32 %tmp12) nounwind
  %tmp14 = volatile load i32* getelementptr inbounds ([7 x i32]* @g_2, i64 0, i64 3), align 4
  %call15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i64 0, i64 0), i32 %tmp14) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
