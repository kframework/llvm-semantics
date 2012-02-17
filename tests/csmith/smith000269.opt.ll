; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000269.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = constant [8 x i32] [i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1], align 16
@g_8 = global i32* null, align 8
@g_10 = global i32 5, align 4
@.str = private unnamed_addr constant [22 x i8] c"checksum g_4[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_4[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_4[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_4[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_4[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_4[5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_4[6] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [22 x i8] c"checksum g_4[7] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [20 x i8] c"checksum g_10 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i8 @func_1() nounwind uwtable {
entry:
  %tmp14 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_4, i64 0, i64 5), align 4
  %conv = trunc i32 %tmp14 to i8
  %tobool = icmp eq i8 %conv, 0
  br i1 %tobool, label %lor.lhs.false, label %for.body38

lor.lhs.false:                                    ; preds = %entry
  %tmp16 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_4, i64 0, i64 6), align 8
  %conv17 = trunc i32 %tmp16 to i8
  %tobool20 = icmp eq i8 %conv17, -108
  br i1 %tobool20, label %return, label %for.body38

for.body38:                                       ; preds = %lor.lhs.false, %entry
  store i32 0, i32* @g_10, align 4
  %tmp39 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_4, i64 0, i64 7), align 4
  %conv40 = trunc i32 %tmp39 to i8
  br label %return

return:                                           ; preds = %lor.lhs.false, %for.body38
  %0 = phi i8 [ %conv40, %for.body38 ], [ 100, %lor.lhs.false ]
  ret i8 %0
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp14.i = volatile load i32* getelementptr inbounds ([8 x i32]* @g_4, i64 0, i64 5), align 4
  %conv.i = trunc i32 %tmp14.i to i8
  %tobool.i = icmp eq i8 %conv.i, 0
  br i1 %tobool.i, label %lor.lhs.false.i, label %for.body38.i

lor.lhs.false.i:                                  ; preds = %entry
  %tmp16.i = volatile load i32* getelementptr inbounds ([8 x i32]* @g_4, i64 0, i64 6), align 8
  %conv17.i = trunc i32 %tmp16.i to i8
  %tobool20.i = icmp eq i8 %conv17.i, -108
  br i1 %tobool20.i, label %func_1.exit, label %for.body38.i

for.body38.i:                                     ; preds = %lor.lhs.false.i, %entry
  store i32 0, i32* @g_10, align 4
  %tmp39.i = volatile load i32* getelementptr inbounds ([8 x i32]* @g_4, i64 0, i64 7), align 4
  br label %func_1.exit

func_1.exit:                                      ; preds = %lor.lhs.false.i, %for.body38.i
  %tmp = volatile load i32* getelementptr inbounds ([8 x i32]* @g_4, i64 0, i64 0), align 16
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_4, i64 0, i64 1), align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_4, i64 0, i64 2), align 8
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_4, i64 0, i64 3), align 4
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_4, i64 0, i64 4), align 16
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i64 0, i64 0), i32 %tmp8) nounwind
  %tmp10 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_4, i64 0, i64 5), align 4
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i64 0, i64 0), i32 %tmp10) nounwind
  %tmp12 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_4, i64 0, i64 6), align 8
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i64 0, i64 0), i32 %tmp12) nounwind
  %tmp14 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_4, i64 0, i64 7), align 4
  %call15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str7, i64 0, i64 0), i32 %tmp14) nounwind
  %tmp16 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_4, i64 0, i64 5), align 4
  %call17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i64 0, i64 0), i32 %tmp16) nounwind
  %tmp18 = load i32* @g_10, align 4
  %call19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str8, i64 0, i64 0), i32 %tmp18) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
