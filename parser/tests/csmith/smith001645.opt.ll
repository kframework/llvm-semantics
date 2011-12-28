; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001645.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global [6 x i32] [i32 -7, i32 -7, i32 -7, i32 -7, i32 -7, i32 -7], align 16
@g_5 = global i32 535264726, align 4
@.str = private unnamed_addr constant [22 x i8] c"checksum g_3[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_3[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_3[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_3[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_3[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_3[5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  volatile store i32 9, i32* getelementptr inbounds ([6 x i32]* @g_3, i64 0, i64 0), align 16
  %tmp4 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_3, i64 0, i64 0), align 16
  %cmp5 = icmp sgt i32 %tmp4, -1
  %tmp8 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_3, i64 0, i64 4), align 16
  br i1 %cmp5, label %for.body6, label %return

for.body6:                                        ; preds = %entry
  %tmp10 = load i32* @g_5, align 4
  %xor = xor i32 %tmp10, %tmp8
  store i32 %xor, i32* @g_5, align 4
  br label %return

return:                                           ; preds = %entry, %for.body6
  %storemerge1.in = phi i32 [ %xor, %for.body6 ], [ %tmp8, %entry ]
  %storemerge1 = trunc i32 %storemerge1.in to i16
  ret i16 %storemerge1
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  volatile store i32 9, i32* getelementptr inbounds ([6 x i32]* @g_3, i64 0, i64 0), align 16
  %tmp4.i = volatile load i32* getelementptr inbounds ([6 x i32]* @g_3, i64 0, i64 0), align 16
  %cmp5.i = icmp sgt i32 %tmp4.i, -1
  %tmp8.i = volatile load i32* getelementptr inbounds ([6 x i32]* @g_3, i64 0, i64 4), align 16
  br i1 %cmp5.i, label %for.body6.i, label %func_1.exit

for.body6.i:                                      ; preds = %entry
  %tmp10.i = load i32* @g_5, align 4
  %xor.i = xor i32 %tmp10.i, %tmp8.i
  store i32 %xor.i, i32* @g_5, align 4
  br label %func_1.exit

func_1.exit:                                      ; preds = %entry, %for.body6.i
  %tmp = volatile load i32* getelementptr inbounds ([6 x i32]* @g_3, i64 0, i64 0), align 16
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_3, i64 0, i64 1), align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_3, i64 0, i64 2), align 8
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_3, i64 0, i64 3), align 4
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_3, i64 0, i64 4), align 16
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i64 0, i64 0), i32 %tmp8) nounwind
  %tmp10 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_3, i64 0, i64 5), align 4
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i64 0, i64 0), i32 %tmp10) nounwind
  %tmp12 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_3, i64 0, i64 0), align 16
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 %tmp12) nounwind
  %tmp14 = load i32* @g_5, align 4
  %call15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str6, i64 0, i64 0), i32 %tmp14) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
