; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001306.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 850513611, align 4
@g_4 = global i32 756326379, align 4
@g_6 = global i32 -2125761732, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  store i32 1, i32* @g_3, align 4
  %g_6.promoted6 = load i32* @g_6, align 4
  volatile store i32 1, i32* @g_4, align 4
  %tmp193 = volatile load i32* @g_4, align 4
  %cmp204 = icmp slt i32 %tmp193, 5
  br i1 %cmp204, label %for.body21, label %for.inc29

for.body21:                                       ; preds = %entry, %for.body21
  %tmp255 = phi i32 [ %or, %for.body21 ], [ %g_6.promoted6, %entry ]
  %tmp23 = volatile load i32* @g_4, align 4
  %or = or i32 %tmp255, %tmp23
  %tmp27 = volatile load i32* @g_4, align 4
  %add = add nsw i32 %tmp27, 2
  volatile store i32 %add, i32* @g_4, align 4
  %tmp19 = volatile load i32* @g_4, align 4
  %cmp20 = icmp slt i32 %tmp19, 5
  br i1 %cmp20, label %for.body21, label %for.inc29

for.inc29:                                        ; preds = %for.body21, %entry
  %or.lcssa7 = phi i32 [ %g_6.promoted6, %entry ], [ %or, %for.body21 ]
  volatile store i32 1, i32* @g_4, align 4
  %tmp193.1 = volatile load i32* @g_4, align 4
  %cmp204.1 = icmp slt i32 %tmp193.1, 5
  br i1 %cmp204.1, label %for.body21.1, label %for.inc29.1

for.inc29.1:                                      ; preds = %for.body21.1, %for.inc29
  %or.lcssa7.1 = phi i32 [ %or.lcssa7, %for.inc29 ], [ %or.1, %for.body21.1 ]
  volatile store i32 1, i32* @g_4, align 4
  %tmp193.2 = volatile load i32* @g_4, align 4
  %cmp204.2 = icmp slt i32 %tmp193.2, 5
  br i1 %cmp204.2, label %for.body21.2, label %for.inc29.2

for.body21.1:                                     ; preds = %for.inc29, %for.body21.1
  %tmp255.1 = phi i32 [ %or.1, %for.body21.1 ], [ %or.lcssa7, %for.inc29 ]
  %tmp23.1 = volatile load i32* @g_4, align 4
  %or.1 = or i32 %tmp255.1, %tmp23.1
  %tmp27.1 = volatile load i32* @g_4, align 4
  %add.1 = add nsw i32 %tmp27.1, 2
  volatile store i32 %add.1, i32* @g_4, align 4
  %tmp19.1 = volatile load i32* @g_4, align 4
  %cmp20.1 = icmp slt i32 %tmp19.1, 5
  br i1 %cmp20.1, label %for.body21.1, label %for.inc29.1

for.inc29.2:                                      ; preds = %for.body21.2, %for.inc29.1
  %or.lcssa7.2 = phi i32 [ %or.lcssa7.1, %for.inc29.1 ], [ %or.2, %for.body21.2 ]
  store i32 7, i32* @g_3, align 4
  store i32 %or.lcssa7.2, i32* @g_6, align 4
  ret i32 7

for.body21.2:                                     ; preds = %for.inc29.1, %for.body21.2
  %tmp255.2 = phi i32 [ %or.2, %for.body21.2 ], [ %or.lcssa7.1, %for.inc29.1 ]
  %tmp23.2 = volatile load i32* @g_4, align 4
  %or.2 = or i32 %tmp255.2, %tmp23.2
  %tmp27.2 = volatile load i32* @g_4, align 4
  %add.2 = add nsw i32 %tmp27.2, 2
  volatile store i32 %add.2, i32* @g_4, align 4
  %tmp19.2 = volatile load i32* @g_4, align 4
  %cmp20.2 = icmp slt i32 %tmp19.2, 5
  br i1 %cmp20.2, label %for.body21.2, label %for.inc29.2
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  store i32 1, i32* @g_3, align 4
  %g_6.promoted6.i = load i32* @g_6, align 4
  volatile store i32 1, i32* @g_4, align 4
  %tmp193.i = volatile load i32* @g_4, align 4
  %cmp204.i = icmp slt i32 %tmp193.i, 5
  br i1 %cmp204.i, label %for.body21.i, label %for.inc29.i

for.body21.i:                                     ; preds = %entry, %for.body21.i
  %tmp255.i = phi i32 [ %or.i, %for.body21.i ], [ %g_6.promoted6.i, %entry ]
  %tmp23.i = volatile load i32* @g_4, align 4
  %or.i = or i32 %tmp23.i, %tmp255.i
  %tmp27.i = volatile load i32* @g_4, align 4
  %add.i = add nsw i32 %tmp27.i, 2
  volatile store i32 %add.i, i32* @g_4, align 4
  %tmp19.i = volatile load i32* @g_4, align 4
  %cmp20.i = icmp slt i32 %tmp19.i, 5
  br i1 %cmp20.i, label %for.body21.i, label %for.inc29.i

for.inc29.i:                                      ; preds = %for.body21.i, %entry
  %or.lcssa7.i = phi i32 [ %g_6.promoted6.i, %entry ], [ %or.i, %for.body21.i ]
  volatile store i32 1, i32* @g_4, align 4
  %tmp193.1.i = volatile load i32* @g_4, align 4
  %cmp204.1.i = icmp slt i32 %tmp193.1.i, 5
  br i1 %cmp204.1.i, label %for.body21.1.i, label %for.inc29.1.i

for.inc29.1.i:                                    ; preds = %for.body21.1.i, %for.inc29.i
  %or.lcssa7.1.i = phi i32 [ %or.lcssa7.i, %for.inc29.i ], [ %or.1.i, %for.body21.1.i ]
  volatile store i32 1, i32* @g_4, align 4
  %tmp193.2.i = volatile load i32* @g_4, align 4
  %cmp204.2.i = icmp slt i32 %tmp193.2.i, 5
  br i1 %cmp204.2.i, label %for.body21.2.i, label %func_1.exit

for.body21.1.i:                                   ; preds = %for.inc29.i, %for.body21.1.i
  %tmp255.1.i = phi i32 [ %or.1.i, %for.body21.1.i ], [ %or.lcssa7.i, %for.inc29.i ]
  %tmp23.1.i = volatile load i32* @g_4, align 4
  %or.1.i = or i32 %tmp23.1.i, %tmp255.1.i
  %tmp27.1.i = volatile load i32* @g_4, align 4
  %add.1.i = add nsw i32 %tmp27.1.i, 2
  volatile store i32 %add.1.i, i32* @g_4, align 4
  %tmp19.1.i = volatile load i32* @g_4, align 4
  %cmp20.1.i = icmp slt i32 %tmp19.1.i, 5
  br i1 %cmp20.1.i, label %for.body21.1.i, label %for.inc29.1.i

for.body21.2.i:                                   ; preds = %for.inc29.1.i, %for.body21.2.i
  %tmp255.2.i = phi i32 [ %or.2.i, %for.body21.2.i ], [ %or.lcssa7.1.i, %for.inc29.1.i ]
  %tmp23.2.i = volatile load i32* @g_4, align 4
  %or.2.i = or i32 %tmp23.2.i, %tmp255.2.i
  %tmp27.2.i = volatile load i32* @g_4, align 4
  %add.2.i = add nsw i32 %tmp27.2.i, 2
  volatile store i32 %add.2.i, i32* @g_4, align 4
  %tmp19.2.i = volatile load i32* @g_4, align 4
  %cmp20.2.i = icmp slt i32 %tmp19.2.i, 5
  br i1 %cmp20.2.i, label %for.body21.2.i, label %func_1.exit

func_1.exit:                                      ; preds = %for.body21.2.i, %for.inc29.1.i
  %or.lcssa7.2.i = phi i32 [ %or.lcssa7.1.i, %for.inc29.1.i ], [ %or.2.i, %for.body21.2.i ]
  store i32 7, i32* @g_3, align 4
  store i32 %or.lcssa7.2.i, i32* @g_6, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 7) nounwind
  %tmp2 = volatile load i32* @g_4, align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* @g_6, align 4
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
