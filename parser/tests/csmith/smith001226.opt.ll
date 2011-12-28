; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001226.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 0, align 4
@g_19 = global i32 -758613387, align 4
@g_36 = global i32* @g_2, align 8
@g_35 = global i32** @g_36, align 8
@g_38 = global i32* @g_19, align 8
@g_37 = global [4 x i32**] [i32** @g_38, i32** @g_38, i32** @g_38, i32** @g_38], align 16
@g_40 = global [2 x i32**] [i32** @g_38, i32** @g_38], align 16
@g_41 = global i32** @g_38, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_19 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_45 = alloca [10 x [8 x [1 x i16]]], align 16
  br label %for.inc17.7

for.cond25:                                       ; preds = %for.inc17.7
  volatile store i32 0, i32* @g_2, align 4
  %tmp26 = volatile load i32* @g_2, align 4
  %cmp27 = icmp sgt i32 %tmp26, 26
  br i1 %cmp27, label %for.body28, label %for.end108

for.body28:                                       ; preds = %for.cond25
  volatile store i32 18, i32* @g_2, align 4
  %tmp31 = volatile load i32* @g_2, align 4
  %cmp32 = icmp sgt i32 %tmp31, 0
  br i1 %cmp32, label %return, label %if.then

if.then:                                          ; preds = %for.body28
  %tmp40 = volatile load i32* @g_2, align 4
  %tmp50 = volatile load i32* @g_2, align 4
  %cmp52 = icmp eq i32 %tmp50, -1
  br i1 %cmp52, label %lor.rhs, label %if.end83

lor.rhs:                                          ; preds = %if.then
  %tmp58 = volatile load i32* @g_2, align 4
  store i32 1, i32* @g_19, align 4
  br label %if.end83

if.end83:                                         ; preds = %if.then, %lor.rhs
  store i32 -10, i32* @g_19, align 4
  %tmp75 = volatile load i32*** @g_35, align 8
  store i32* @g_2, i32** %tmp75, align 8
  br label %return

for.end108:                                       ; preds = %for.cond25
  store i32 0, i32* @g_19, align 4
  %arrayidx111 = getelementptr inbounds [10 x [8 x [1 x i16]]]* %l_45, i64 0, i64 6, i64 5, i64 0
  %tmp112 = load i16* %arrayidx111, align 2
  %conv113 = sext i16 %tmp112 to i32
  br label %return

return:                                           ; preds = %for.body28, %for.end108, %if.end83
  %0 = phi i32 [ %conv113, %for.end108 ], [ -10, %if.end83 ], [ -10, %for.body28 ]
  ret i32 %0

for.inc17.7:                                      ; preds = %for.inc17.7, %entry
  %indvar7 = phi i64 [ 0, %entry ], [ %indvar.next8, %for.inc17.7 ]
  %scevgep = getelementptr [10 x [8 x [1 x i16]]]* %l_45, i64 0, i64 %indvar7, i64 7, i64 0
  %scevgep15 = getelementptr [10 x [8 x [1 x i16]]]* %l_45, i64 0, i64 %indvar7, i64 6, i64 0
  %scevgep17 = getelementptr [10 x [8 x [1 x i16]]]* %l_45, i64 0, i64 %indvar7, i64 5, i64 0
  %scevgep19 = getelementptr [10 x [8 x [1 x i16]]]* %l_45, i64 0, i64 %indvar7, i64 4, i64 0
  %scevgep21 = getelementptr [10 x [8 x [1 x i16]]]* %l_45, i64 0, i64 %indvar7, i64 3, i64 0
  %scevgep23 = getelementptr [10 x [8 x [1 x i16]]]* %l_45, i64 0, i64 %indvar7, i64 2, i64 0
  %scevgep25 = getelementptr [10 x [8 x [1 x i16]]]* %l_45, i64 0, i64 %indvar7, i64 1, i64 0
  %arrayidx15 = getelementptr [10 x [8 x [1 x i16]]]* %l_45, i64 0, i64 %indvar7, i64 0, i64 0
  store i16 -25014, i16* %arrayidx15, align 16
  store i16 -25014, i16* %scevgep25, align 2
  store i16 -25014, i16* %scevgep23, align 4
  store i16 -25014, i16* %scevgep21, align 2
  store i16 -25014, i16* %scevgep19, align 8
  store i16 -25014, i16* %scevgep17, align 2
  store i16 -25014, i16* %scevgep15, align 4
  store i16 -25014, i16* %scevgep, align 2
  %indvar.next8 = add i64 %indvar7, 1
  %exitcond = icmp eq i64 %indvar.next8, 10
  br i1 %exitcond, label %for.cond25, label %for.inc17.7
}

define i32 @func_10(i64 %p_11, i8 signext %p_12) nounwind uwtable readnone {
entry:
  ret i32 -29
}

define i32* @func_16(i8 signext %p_17) nounwind uwtable {
entry:
  store i32 1561159054, i32* @g_19, align 4
  ret i32* @g_19
}

define i32 @func_23(i32 %p_24, i64 %p_25, i32 %p_26, i32 %p_27, i32* nocapture %p_28) nounwind uwtable {
entry:
  store i32 1, i32* %p_28, align 4
  ret i32 1
}

define i32 @func_30(i32 %p_31) nounwind uwtable readonly {
entry:
  %tmp = load i32* @g_19, align 4
  ret i32 %tmp
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %l_45.i = alloca [10 x [8 x [1 x i16]]], align 16
  %0 = bitcast [10 x [8 x [1 x i16]]]* %l_45.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  br label %for.inc17.7.i

for.cond25.i:                                     ; preds = %for.inc17.7.i
  volatile store i32 0, i32* @g_2, align 4
  %tmp26.i = volatile load i32* @g_2, align 4
  %cmp27.i = icmp sgt i32 %tmp26.i, 26
  br i1 %cmp27.i, label %for.body28.i, label %for.end108.i

for.body28.i:                                     ; preds = %for.cond25.i
  volatile store i32 18, i32* @g_2, align 4
  %tmp31.i = volatile load i32* @g_2, align 4
  %cmp32.i = icmp sgt i32 %tmp31.i, 0
  br i1 %cmp32.i, label %func_1.exit, label %if.then.i

if.then.i:                                        ; preds = %for.body28.i
  %tmp40.i = volatile load i32* @g_2, align 4
  %tmp50.i = volatile load i32* @g_2, align 4
  %cmp52.i = icmp eq i32 %tmp50.i, -1
  br i1 %cmp52.i, label %lor.rhs.i, label %if.end83.i

lor.rhs.i:                                        ; preds = %if.then.i
  %tmp58.i = volatile load i32* @g_2, align 4
  store i32 1, i32* @g_19, align 4
  br label %if.end83.i

if.end83.i:                                       ; preds = %lor.rhs.i, %if.then.i
  store i32 -10, i32* @g_19, align 4
  %tmp75.i = volatile load i32*** @g_35, align 8
  store i32* @g_2, i32** %tmp75.i, align 8
  br label %func_1.exit

for.end108.i:                                     ; preds = %for.cond25.i
  store i32 0, i32* @g_19, align 4
  br label %func_1.exit

for.inc17.7.i:                                    ; preds = %for.inc17.7.i, %entry
  %indvar7.i = phi i64 [ 0, %entry ], [ %1, %for.inc17.7.i ]
  %arrayidx15.i = getelementptr [10 x [8 x [1 x i16]]]* %l_45.i, i64 0, i64 %indvar7.i, i64 0, i64 0
  %scevgep25.i = getelementptr [10 x [8 x [1 x i16]]]* %l_45.i, i64 0, i64 %indvar7.i, i64 1, i64 0
  %scevgep23.i = getelementptr [10 x [8 x [1 x i16]]]* %l_45.i, i64 0, i64 %indvar7.i, i64 2, i64 0
  %scevgep21.i = getelementptr [10 x [8 x [1 x i16]]]* %l_45.i, i64 0, i64 %indvar7.i, i64 3, i64 0
  %scevgep19.i = getelementptr [10 x [8 x [1 x i16]]]* %l_45.i, i64 0, i64 %indvar7.i, i64 4, i64 0
  %scevgep17.i = getelementptr [10 x [8 x [1 x i16]]]* %l_45.i, i64 0, i64 %indvar7.i, i64 5, i64 0
  %scevgep15.i = getelementptr [10 x [8 x [1 x i16]]]* %l_45.i, i64 0, i64 %indvar7.i, i64 6, i64 0
  %scevgep.i = getelementptr [10 x [8 x [1 x i16]]]* %l_45.i, i64 0, i64 %indvar7.i, i64 7, i64 0
  store i16 -25014, i16* %arrayidx15.i, align 16
  store i16 -25014, i16* %scevgep25.i, align 2
  store i16 -25014, i16* %scevgep23.i, align 4
  store i16 -25014, i16* %scevgep21.i, align 2
  store i16 -25014, i16* %scevgep19.i, align 8
  store i16 -25014, i16* %scevgep17.i, align 2
  store i16 -25014, i16* %scevgep15.i, align 4
  store i16 -25014, i16* %scevgep.i, align 2
  %1 = add i64 %indvar7.i, 1
  %exitcond = icmp eq i64 %1, 10
  br i1 %exitcond, label %for.cond25.i, label %for.inc17.7.i

func_1.exit:                                      ; preds = %for.body28.i, %if.end83.i, %for.end108.i
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  %tmp = volatile load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* @g_19, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
