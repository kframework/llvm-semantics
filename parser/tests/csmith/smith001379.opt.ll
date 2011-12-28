; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001379.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global [8 x i32] zeroinitializer, align 16
@g_5 = global i32 1, align 4
@g_39 = global i32* @g_5, align 8
@g_38 = global i32** @g_39, align 8
@g_37 = global i32*** @g_38, align 8
@.str = private unnamed_addr constant [22 x i8] c"checksum g_2[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_2[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_2[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_2[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_2[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_2[5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_2[6] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [22 x i8] c"checksum g_2[7] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  volatile store i32 -7, i32* getelementptr inbounds ([8 x i32]* @g_2, i64 0, i64 1), align 4
  %tmp = volatile load i32* getelementptr inbounds ([8 x i32]* @g_2, i64 0, i64 1), align 4
  %cmp = icmp slt i32 %tmp, 4
  br i1 %cmp, label %for.body12, label %for.end80

for.body12:                                       ; preds = %entry
  store i32 -30, i32* @g_5, align 4
  br label %return

for.end80:                                        ; preds = %entry
  %tmp81 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_2, i64 0, i64 1), align 4
  %conv82 = sext i32 %tmp81 to i64
  br label %return

return:                                           ; preds = %for.end80, %for.body12
  %0 = phi i64 [ %conv82, %for.end80 ], [ 1, %for.body12 ]
  ret i64 %0
}

define i32** @func_29(i64 %p_30, i8 zeroext %p_31, i32 %p_32, i32** %p_33, i32 %p_34) nounwind uwtable readnone {
entry:
  ret i32** %p_33
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  volatile store i32 -7, i32* getelementptr inbounds ([8 x i32]* @g_2, i64 0, i64 1), align 4
  %tmp.i = volatile load i32* getelementptr inbounds ([8 x i32]* @g_2, i64 0, i64 1), align 4
  %cmp.i = icmp slt i32 %tmp.i, 4
  br i1 %cmp.i, label %for.body12.i, label %for.end80.i

for.body12.i:                                     ; preds = %entry
  store i32 -30, i32* @g_5, align 4
  br label %func_1.exit

for.end80.i:                                      ; preds = %entry
  %tmp81.i = volatile load i32* getelementptr inbounds ([8 x i32]* @g_2, i64 0, i64 1), align 4
  br label %func_1.exit

func_1.exit:                                      ; preds = %for.body12.i, %for.end80.i
  %tmp = volatile load i32* getelementptr inbounds ([8 x i32]* @g_2, i64 0, i64 0), align 16
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_2, i64 0, i64 1), align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_2, i64 0, i64 2), align 8
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_2, i64 0, i64 3), align 4
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_2, i64 0, i64 4), align 16
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i64 0, i64 0), i32 %tmp8) nounwind
  %tmp10 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_2, i64 0, i64 5), align 4
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i64 0, i64 0), i32 %tmp10) nounwind
  %tmp12 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_2, i64 0, i64 6), align 8
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i64 0, i64 0), i32 %tmp12) nounwind
  %tmp14 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_2, i64 0, i64 7), align 4
  %call15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str7, i64 0, i64 0), i32 %tmp14) nounwind
  %tmp16 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_2, i64 0, i64 1), align 4
  %call17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i64 0, i64 0), i32 %tmp16) nounwind
  %tmp18 = load i32* @g_5, align 4
  %call19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str8, i64 0, i64 0), i32 %tmp18) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
