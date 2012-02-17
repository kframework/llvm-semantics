; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001769.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 1825462207, align 4
@g_6 = constant [8 x [3 x [1 x [1 x i32*]]]] [[3 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]], [3 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]], [3 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]], [3 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]], [3 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]], [3 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]], [3 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]], [3 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], align 16
@g_10 = global i32 0, align 4
@g_9 = global i32* @g_10, align 8
@g_19 = global [4 x i16] zeroinitializer, align 2
@g_32 = global i32 1904985752, align 4
@g_57 = global i32 -1, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_10 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [23 x i8] c"checksum g_19[0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"checksum g_19[1] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [23 x i8] c"checksum g_19[2] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [23 x i8] c"checksum g_19[3] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [20 x i8] c"checksum g_32 = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [20 x i8] c"checksum g_57 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  volatile store i32 23, i32* @g_2, align 4
  %tmp51 = volatile load i32* @g_2, align 4
  %cmp62 = icmp slt i32 %tmp51, 1
  br i1 %cmp62, label %for.body7, label %for.end15

for.body7:                                        ; preds = %entry, %for.body7
  %tmp10 = volatile load i32* @g_2, align 4
  volatile store i32 %tmp10, i32* @g_2, align 4
  %tmp13 = volatile load i32* @g_2, align 4
  %sub.i = add i32 %tmp13, 248
  %conv14 = and i32 %sub.i, 255
  volatile store i32 %conv14, i32* @g_2, align 4
  %tmp5 = volatile load i32* @g_2, align 4
  %cmp6 = icmp slt i32 %tmp5, 1
  br i1 %cmp6, label %for.body7, label %for.end15

for.end15:                                        ; preds = %for.body7, %entry
  %tmp17 = volatile load i32** @g_9, align 8
  %tmp18 = load i32* %tmp17, align 4
  %or = or i32 %tmp18, 1720983497
  store i32 %or, i32* %tmp17, align 4
  %tmp22 = load i32* @g_32, align 4
  %conv23 = sext i32 %tmp22 to i64
  ret i64 %conv23
}

define i32* @func_11(i32 %p_12, i64 %p_13, i16 zeroext %p_14, i32* %p_15) nounwind uwtable {
entry:
  %tmp37 = load i32* %p_15, align 4
  store i32 1, i32* @g_10, align 4
  volatile store i32 0, i32* @g_2, align 4
  %tmp31.i = volatile load i32* @g_2, align 4
  %cmp42.i = icmp slt i32 %tmp31.i, -29
  br i1 %cmp42.i, label %for.inc.i, label %func_16.exit

for.inc.i:                                        ; preds = %entry, %for.inc.i
  %tmp8.i = volatile load i32* @g_2, align 4
  %sub.i.i = add i32 %tmp8.i, 65535
  %conv9.i = and i32 %sub.i.i, 65535
  volatile store i32 %conv9.i, i32* @g_2, align 4
  %tmp3.i = volatile load i32* @g_2, align 4
  %cmp4.i = icmp slt i32 %tmp3.i, -29
  br i1 %cmp4.i, label %for.inc.i, label %func_16.exit

func_16.exit:                                     ; preds = %for.inc.i, %entry
  store i32 4, i32* @g_10, align 4
  %cmp39 = icmp sgt i32 %tmp37, 4
  %conv = zext i1 %cmp39 to i32
  %tmp41 = load i32* %p_15, align 4
  %xor = xor i32 %tmp41, %conv
  store i32 %xor, i32* %p_15, align 4
  ret i32* @g_32
}

define i32 @func_16(i32 %p_17, i32* %p_18) nounwind uwtable {
entry:
  store i32 1, i32* @g_10, align 4
  br label %for.body

for.body:                                         ; preds = %entry, %for.end
  volatile store i32 0, i32* @g_2, align 4
  %tmp31 = volatile load i32* @g_2, align 4
  %cmp42 = icmp slt i32 %tmp31, -29
  br i1 %cmp42, label %for.inc, label %for.end

for.inc:                                          ; preds = %for.body, %for.inc
  %tmp8 = volatile load i32* @g_2, align 4
  %sub.i = add i32 %tmp8, 65535
  %conv9 = and i32 %sub.i, 65535
  volatile store i32 %conv9, i32* @g_2, align 4
  %tmp3 = volatile load i32* @g_2, align 4
  %cmp4 = icmp slt i32 %tmp3, -29
  br i1 %cmp4, label %for.inc, label %for.end

for.end:                                          ; preds = %for.inc, %for.body
  store i32 0, i32* %p_18, align 4
  %tmp14 = load i32* @g_10, align 4
  %add = add nsw i32 %tmp14, 4
  store i32 %add, i32* @g_10, align 4
  %cmp = icmp slt i32 %tmp14, 0
  br i1 %cmp, label %for.body, label %for.end15

for.end15:                                        ; preds = %for.end
  %tmp17 = load i32* %p_18, align 4
  ret i32 %tmp17
}

define i32 @func_33(i32 %p_34, i32* nocapture %p_35) nounwind uwtable readnone {
entry:
  ret i32 22
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  volatile store i32 23, i32* @g_2, align 4
  %tmp51.i = volatile load i32* @g_2, align 4
  %cmp62.i = icmp slt i32 %tmp51.i, 1
  br i1 %cmp62.i, label %for.body7.i, label %func_1.exit

for.body7.i:                                      ; preds = %entry, %for.body7.i
  %tmp10.i = volatile load i32* @g_2, align 4
  volatile store i32 %tmp10.i, i32* @g_2, align 4
  %tmp13.i = volatile load i32* @g_2, align 4
  %sub.i.i = add i32 %tmp13.i, 248
  %conv14.i = and i32 %sub.i.i, 255
  volatile store i32 %conv14.i, i32* @g_2, align 4
  %tmp5.i = volatile load i32* @g_2, align 4
  %cmp6.i = icmp slt i32 %tmp5.i, 1
  br i1 %cmp6.i, label %for.body7.i, label %func_1.exit

func_1.exit:                                      ; preds = %for.body7.i, %entry
  %tmp17.i = volatile load i32** @g_9, align 8
  %tmp18.i = load i32* %tmp17.i, align 4
  %or.i = or i32 %tmp18.i, 1720983497
  store i32 %or.i, i32* %tmp17.i, align 4
  %tmp = volatile load i32* @g_2, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* @g_10, align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i16* getelementptr inbounds ([4 x i16]* @g_19, i64 0, i64 0), align 2
  %conv = zext i16 %tmp4 to i32
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i64 0, i64 0), i32 %conv) nounwind
  %tmp6 = load i16* getelementptr inbounds ([4 x i16]* @g_19, i64 0, i64 1), align 2
  %conv7 = zext i16 %tmp6 to i32
  %call8 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i64 0, i64 0), i32 %conv7) nounwind
  %tmp9 = load i16* getelementptr inbounds ([4 x i16]* @g_19, i64 0, i64 2), align 2
  %conv10 = zext i16 %tmp9 to i32
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str4, i64 0, i64 0), i32 %conv10) nounwind
  %tmp12 = load i16* getelementptr inbounds ([4 x i16]* @g_19, i64 0, i64 3), align 2
  %conv13 = zext i16 %tmp12 to i32
  %call14 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str5, i64 0, i64 0), i32 %conv13) nounwind
  %tmp15 = load i32* @g_32, align 4
  %call16 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str6, i64 0, i64 0), i32 %tmp15) nounwind
  %tmp17 = load i32* @g_57, align 4
  %call18 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str7, i64 0, i64 0), i32 %tmp17) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
