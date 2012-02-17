; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000506.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 966279603, align 4
@g_6 = global i32 7, align 4
@g_7 = global i32 -10, align 4
@g_8 = global i32 1013135427, align 4
@g_9 = global i32 -1, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [19 x i8] c"checksum g_8 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  br label %for.cond47

for.cond47:                                       ; preds = %entry, %for.inc102
  %storemerge1 = phi i32 [ %conv105, %for.inc102 ], [ 0, %entry ]
  %cmp49 = icmp sgt i32 %storemerge1, -29
  br i1 %cmp49, label %for.cond62, label %for.end106

for.cond62:                                       ; preds = %for.cond47, %for.inc98
  %indvar25 = phi i32 [ %indvar.next26, %for.inc98 ], [ 0, %for.cond47 ]
  %tmp27 = mul i32 %indvar25, -5
  %storemerge2 = add i32 %tmp27, 7
  %cmp64 = icmp sgt i32 %storemerge2, -1
  br i1 %cmp64, label %for.cond66, label %for.inc102

for.cond66:                                       ; preds = %for.cond62, %for.inc94
  %indvar = phi i32 [ %indvar.next, %for.inc94 ], [ 0, %for.cond62 ]
  %tmp = mul i32 %indvar, 3
  %storemerge3 = add i32 %tmp, 2
  %cmp68 = icmp slt i32 %storemerge3, 7
  br i1 %cmp68, label %for.cond70, label %for.inc98

for.cond70:                                       ; preds = %for.cond66, %for.inc90
  %0 = phi i32 [ %add92, %for.inc90 ], [ 0, %for.cond66 ]
  %cmp72 = icmp slt i32 %0, 1
  br i1 %cmp72, label %for.body73, label %for.inc94

for.body73:                                       ; preds = %for.cond70
  volatile store i32 0, i32* @g_8, align 4
  br label %for.cond74

for.cond74:                                       ; preds = %for.inc86, %for.body73
  %tmp75 = volatile load i32* @g_8, align 4
  %cmp76 = icmp slt i32 %tmp75, 1
  br i1 %cmp76, label %for.body77, label %for.inc90

for.body77:                                       ; preds = %for.cond74
  volatile store i32 0, i32* @g_9, align 4
  %tmp79 = volatile load i32* @g_9, align 4
  %cmp80 = icmp slt i32 %tmp79, 1
  br i1 %cmp80, label %return.loopexit, label %for.inc86

for.inc86:                                        ; preds = %for.body77
  %tmp87 = volatile load i32* @g_8, align 4
  %add88 = add nsw i32 %tmp87, 1
  volatile store i32 %add88, i32* @g_8, align 4
  br label %for.cond74

for.inc90:                                        ; preds = %for.cond74
  %add92 = add nsw i32 %0, 1
  br label %for.cond70

for.inc94:                                        ; preds = %for.cond70
  store i32 %0, i32* @g_7, align 4
  %indvar.next = add i32 %indvar, 1
  br label %for.cond66

for.inc98:                                        ; preds = %for.cond66
  store i32 %storemerge3, i32* @g_6, align 4
  %indvar.next26 = add i32 %indvar25, 1
  br label %for.cond62

for.inc102:                                       ; preds = %for.cond62
  %add.i = shl i32 %storemerge2, 24
  %sext = add i32 %add.i, 67108864
  %conv105 = ashr exact i32 %sext, 24
  br label %for.cond47

for.end106:                                       ; preds = %for.cond47
  store i32 %storemerge1, i32* @g_2, align 4
  volatile store i32 1, i32* @g_9, align 4
  %phitmp = trunc i32 %storemerge1 to i16
  br label %return

return.loopexit:                                  ; preds = %for.body77
  store i32 %storemerge2, i32* @g_2, align 4
  store i32 %storemerge3, i32* @g_6, align 4
  store i32 %0, i32* @g_7, align 4
  br label %return

return:                                           ; preds = %return.loopexit, %for.end106
  %storemerge5.in = phi i16 [ %phitmp, %for.end106 ], [ 17999, %return.loopexit ]
  ret i16 %storemerge5.in
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %call = tail call zeroext i16 @func_1()
  %tmp = load i32* @g_2, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* @g_6, align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* @g_7, align 4
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = volatile load i32* @g_8, align 4
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = volatile load i32* @g_9, align 4
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str4, i64 0, i64 0), i32 %tmp8) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
