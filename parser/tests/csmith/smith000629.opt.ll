; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000629.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 0, align 4
@g_6 = global i32 -2, align 4
@g_5 = global i32* @g_6, align 8
@g_8 = global i32* @g_2, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  store i32 0, i32* @g_2, align 4
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %tmp4 = volatile load i32** @g_5, align 8
  %tmp5 = load i32* %tmp4, align 4
  %and = and i32 %tmp5, 1
  store i32 %and, i32* %tmp4, align 4
  %tmp6 = load i32* @g_2, align 4
  %add.i = shl i32 %tmp6, 24
  %sext = add i32 %add.i, 67108864
  %conv8 = ashr exact i32 %sext, 24
  store i32 %conv8, i32* @g_2, align 4
  %cmp = icmp eq i32 %conv8, 0
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.body
  %tmp13 = volatile load i32** @g_8, align 8
  store i32 1, i32* %tmp13, align 4
  ret i32 924345666
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  store i32 0, i32* @g_2, align 4
  br label %for.body.i

for.body.i:                                       ; preds = %for.body.i, %entry
  %tmp4.i = volatile load i32** @g_5, align 8
  %tmp5.i = load i32* %tmp4.i, align 4
  %and.i = and i32 %tmp5.i, 1
  store i32 %and.i, i32* %tmp4.i, align 4
  %tmp6.i = load i32* @g_2, align 4
  %add.i.i = shl i32 %tmp6.i, 24
  %sext.i = add i32 %add.i.i, 67108864
  %conv8.i = ashr exact i32 %sext.i, 24
  store i32 %conv8.i, i32* @g_2, align 4
  %cmp.i = icmp eq i32 %conv8.i, 0
  br i1 %cmp.i, label %for.body.i, label %func_1.exit

func_1.exit:                                      ; preds = %for.body.i
  %tmp13.i = volatile load i32** @g_8, align 8
  store i32 1, i32* %tmp13.i, align 4
  %tmp = load i32* @g_2, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* @g_6, align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
