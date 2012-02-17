; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000572.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i16 18942, align 2
@g_3 = global i8 -7, align 1
@g_12 = global i32 171075558, align 4
@g_11 = constant [1 x i32*] [i32* @g_12], align 8
@g_24 = global i32* @g_12, align 8
@g_23 = constant [3 x i32**] [i32** @g_24, i32** @g_24, i32** @g_24], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_12 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
entry:
  %tmp = volatile load i16* @g_2, align 2
  %conv = trunc i16 %tmp to i8
  volatile store i8 %conv, i8* @g_3, align 1
  %tmp.i = volatile load i8* @g_3, align 1
  %tmp4.i = volatile load i8* @g_3, align 1
  %conv5.i = zext i8 %tmp4.i to i32
  store i32 %conv5.i, i32* @g_12, align 4
  volatile store i8 0, i8* @g_3, align 1
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.inc64.i, %entry
  %tmp7.i = volatile load i8* @g_3, align 1
  %cmp9.i = icmp ugt i8 %tmp7.i, 8
  br i1 %cmp9.i, label %for.cond14.preheader.i, label %return

for.cond14.preheader.i:                           ; preds = %for.cond.i
  volatile store i16 0, i16* @g_2, align 2
  %tmp34.i = volatile load i16* @g_2, align 2
  %cmp36.i = icmp ult i16 %tmp34.i, 7
  br i1 %cmp36.i, label %for.body38.i, label %for.inc64.i

for.body38.i:                                     ; preds = %for.cond14.preheader.i
  volatile store i8 6, i8* @g_3, align 1
  br label %for.cond39.i

for.cond39.i:                                     ; preds = %for.cond39.i, %for.body38.i
  %tmp40.i = volatile load i8* @g_3, align 1
  %tmp45.i = volatile load i32** getelementptr inbounds ([1 x i32*]* @g_11, i64 0, i64 0), align 8
  %cmp47.i = icmp ne i32* %tmp45.i, @g_12
  %conv48.i = zext i1 %cmp47.i to i32
  store i32 %conv48.i, i32* @g_12, align 4
  %tmp54.i = volatile load i8* @g_3, align 1
  %add.i = add i8 %tmp54.i, -10
  volatile store i8 %add.i, i8* @g_3, align 1
  br label %for.cond39.i

for.inc64.i:                                      ; preds = %for.cond14.preheader.i
  %tmp65.i = volatile load i8* @g_3, align 1
  %add.i.i = add i8 %tmp65.i, 1
  volatile store i8 %add.i.i, i8* @g_3, align 1
  br label %for.cond.i

return:                                           ; preds = %for.cond.i
  %tmp22 = volatile load i8* @g_3, align 1
  %conv23 = zext i8 %tmp22 to i16
  ret i16 %conv23
}

define i32* @func_4(i32* %p_5) nounwind uwtable {
entry:
  %tmp = volatile load i8* @g_3, align 1
  %tmp4 = volatile load i8* @g_3, align 1
  %conv5 = zext i8 %tmp4 to i32
  store i32 %conv5, i32* %p_5, align 4
  volatile store i8 0, i8* @g_3, align 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc64, %entry
  %tmp7 = volatile load i8* @g_3, align 1
  %cmp9 = icmp ugt i8 %tmp7, 8
  br i1 %cmp9, label %for.cond14.preheader, label %for.end69

for.cond14.preheader:                             ; preds = %for.cond
  volatile store i16 0, i16* @g_2, align 2
  %tmp34 = volatile load i16* @g_2, align 2
  %cmp36 = icmp ult i16 %tmp34, 7
  br i1 %cmp36, label %for.body38, label %for.inc64

for.body38:                                       ; preds = %for.cond14.preheader
  volatile store i8 6, i8* @g_3, align 1
  br label %for.cond39

for.cond39:                                       ; preds = %for.cond39, %for.body38
  %tmp40 = volatile load i8* @g_3, align 1
  %tmp45 = volatile load i32** getelementptr inbounds ([1 x i32*]* @g_11, i64 0, i64 0), align 8
  %cmp47 = icmp ne i32* %tmp45, %p_5
  %conv48 = zext i1 %cmp47 to i32
  store i32 %conv48, i32* %p_5, align 4
  %tmp54 = volatile load i8* @g_3, align 1
  %add = add i8 %tmp54, -10
  volatile store i8 %add, i8* @g_3, align 1
  br label %for.cond39

for.inc64:                                        ; preds = %for.cond14.preheader
  %tmp65 = volatile load i8* @g_3, align 1
  %add.i = add i8 %tmp65, 1
  volatile store i8 %add.i, i8* @g_3, align 1
  br label %for.cond

for.end69:                                        ; preds = %for.cond
  ret i32* @g_12
}

define i32 @func_17(i32** nocapture %p_18, i64 %p_19, i16 signext %p_20) nounwind uwtable {
entry:
  store i32 -46, i32* @g_12, align 4
  %conv = trunc i64 %p_19 to i32
  ret i32 %conv
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp.i = volatile load i16* @g_2, align 2
  %conv.i = trunc i16 %tmp.i to i8
  volatile store i8 %conv.i, i8* @g_3, align 1
  %tmp.i.i = volatile load i8* @g_3, align 1
  %tmp4.i.i = volatile load i8* @g_3, align 1
  %conv5.i.i = zext i8 %tmp4.i.i to i32
  store i32 %conv5.i.i, i32* @g_12, align 4
  volatile store i8 0, i8* @g_3, align 1
  br label %for.cond.i.i

for.cond.i.i:                                     ; preds = %for.inc64.i.i, %entry
  %tmp7.i.i = volatile load i8* @g_3, align 1
  %cmp9.i.i = icmp ugt i8 %tmp7.i.i, 8
  br i1 %cmp9.i.i, label %for.cond14.preheader.i.i, label %func_1.exit

for.cond14.preheader.i.i:                         ; preds = %for.cond.i.i
  volatile store i16 0, i16* @g_2, align 2
  %tmp34.i.i = volatile load i16* @g_2, align 2
  %cmp36.i.i = icmp ult i16 %tmp34.i.i, 7
  br i1 %cmp36.i.i, label %for.body38.i.i, label %for.inc64.i.i

for.body38.i.i:                                   ; preds = %for.cond14.preheader.i.i
  volatile store i8 6, i8* @g_3, align 1
  br label %for.cond39.i.i

for.cond39.i.i:                                   ; preds = %for.cond39.i.i, %for.body38.i.i
  %tmp40.i.i = volatile load i8* @g_3, align 1
  %tmp45.i.i = volatile load i32** getelementptr inbounds ([1 x i32*]* @g_11, i64 0, i64 0), align 8
  %cmp47.i.i = icmp ne i32* %tmp45.i.i, @g_12
  %conv48.i.i = zext i1 %cmp47.i.i to i32
  store i32 %conv48.i.i, i32* @g_12, align 4
  %tmp54.i.i = volatile load i8* @g_3, align 1
  %add.i.i = add i8 %tmp54.i.i, -10
  volatile store i8 %add.i.i, i8* @g_3, align 1
  br label %for.cond39.i.i

for.inc64.i.i:                                    ; preds = %for.cond14.preheader.i.i
  %tmp65.i.i = volatile load i8* @g_3, align 1
  %add.i.i.i = add i8 %tmp65.i.i, 1
  volatile store i8 %add.i.i.i, i8* @g_3, align 1
  br label %for.cond.i.i

func_1.exit:                                      ; preds = %for.cond.i.i
  %tmp22.i = volatile load i8* @g_3, align 1
  %tmp = volatile load i16* @g_2, align 2
  %conv = zext i16 %tmp to i32
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %conv) nounwind
  %tmp2 = volatile load i8* @g_3, align 1
  %conv3 = zext i8 %tmp2 to i32
  %call4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i64 0, i64 0), i32 %conv3) nounwind
  %tmp5 = load i32* @g_12, align 4
  %call6 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i64 0, i64 0), i32 %tmp5) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
