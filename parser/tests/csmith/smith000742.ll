; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000742.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -4, align 4
@g_5 = global [10 x [10 x [1 x i32*]]] [[10 x [1 x i32*]] [[1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2]], [10 x [1 x i32*]] [[1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2]], [10 x [1 x i32*]] [[1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2]], [10 x [1 x i32*]] [[1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2]], [10 x [1 x i32*]] [[1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2]], [10 x [1 x i32*]] [[1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2]], [10 x [1 x i32*]] [[1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2]], [10 x [1 x i32*]] [[1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2]], [10 x [1 x i32*]] [[1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2]], [10 x [1 x i32*]] [[1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2]]], align 16
@g_6 = global [5 x [10 x [1 x [2 x [1 x [1 x i32*]]]]]] [[10 x [1 x [2 x [1 x [1 x i32*]]]]] [[1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]]], [10 x [1 x [2 x [1 x [1 x i32*]]]]] [[1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]]], [10 x [1 x [2 x [1 x [1 x i32*]]]]] [[1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]]], [10 x [1 x [2 x [1 x [1 x i32*]]]]] [[1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]]], [10 x [1 x [2 x [1 x [1 x i32*]]]]] [[1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]]]], align 16
@g_11 = global i32* @g_2, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_7 = alloca i8, align 1
  %l_10 = alloca [9 x [3 x [2 x [1 x i16]]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  store i32 -25, i32* @g_2, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* @g_2, align 4
  %cmp = icmp sgt i32 %tmp, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  store i8 -7, i8* %l_7, align 1
  %tmp2 = load i32* @g_2, align 4
  %conv = sext i32 %tmp2 to i64
  %cmp3 = icmp slt i64 799321460, %conv
  %conv4 = zext i1 %cmp3 to i32
  %conv5 = trunc i32 %conv4 to i8
  store i8 %conv5, i8* %l_7, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp6 = load i32* @g_2, align 4
  %conv7 = trunc i32 %tmp6 to i8
  %call = call zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %conv7, i8 zeroext 1)
  %conv8 = zext i8 %call to i32
  store i32 %conv8, i32* @g_2, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 -14, i32* @g_2, align 4
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc71, %for.end
  %tmp10 = load i32* @g_2, align 4
  %cmp11 = icmp eq i32 %tmp10, -21
  br i1 %cmp11, label %for.body13, label %for.end76

for.body13:                                       ; preds = %for.cond9
  store i32 0, i32* %i, align 4
  br label %for.cond19

for.cond19:                                       ; preds = %for.inc60, %for.body13
  %tmp20 = load i32* %i, align 4
  %cmp21 = icmp slt i32 %tmp20, 9
  br i1 %cmp21, label %for.body23, label %for.end63

for.body23:                                       ; preds = %for.cond19
  store i32 0, i32* %j, align 4
  br label %for.cond24

for.cond24:                                       ; preds = %for.inc56, %for.body23
  %tmp25 = load i32* %j, align 4
  %cmp26 = icmp slt i32 %tmp25, 3
  br i1 %cmp26, label %for.body28, label %for.end59

for.body28:                                       ; preds = %for.cond24
  store i32 0, i32* %k, align 4
  br label %for.cond29

for.cond29:                                       ; preds = %for.inc52, %for.body28
  %tmp30 = load i32* %k, align 4
  %cmp31 = icmp slt i32 %tmp30, 2
  br i1 %cmp31, label %for.body33, label %for.end55

for.body33:                                       ; preds = %for.cond29
  store i32 0, i32* %l, align 4
  br label %for.cond34

for.cond34:                                       ; preds = %for.inc49, %for.body33
  %tmp35 = load i32* %l, align 4
  %cmp36 = icmp slt i32 %tmp35, 1
  br i1 %cmp36, label %for.body38, label %for.end51

for.body38:                                       ; preds = %for.cond34
  %tmp39 = load i32* %l, align 4
  %idxprom = sext i32 %tmp39 to i64
  %tmp40 = load i32* %k, align 4
  %idxprom41 = sext i32 %tmp40 to i64
  %tmp42 = load i32* %j, align 4
  %idxprom43 = sext i32 %tmp42 to i64
  %tmp44 = load i32* %i, align 4
  %idxprom45 = sext i32 %tmp44 to i64
  %arrayidx = getelementptr inbounds [9 x [3 x [2 x [1 x i16]]]]* %l_10, i32 0, i64 %idxprom45
  %arrayidx46 = getelementptr inbounds [3 x [2 x [1 x i16]]]* %arrayidx, i32 0, i64 %idxprom43
  %arrayidx47 = getelementptr inbounds [2 x [1 x i16]]* %arrayidx46, i32 0, i64 %idxprom41
  %arrayidx48 = getelementptr inbounds [1 x i16]* %arrayidx47, i32 0, i64 %idxprom
  store i16 -7, i16* %arrayidx48, align 2
  br label %for.inc49

for.inc49:                                        ; preds = %for.body38
  %tmp50 = load i32* %l, align 4
  %inc = add nsw i32 %tmp50, 1
  store i32 %inc, i32* %l, align 4
  br label %for.cond34

for.end51:                                        ; preds = %for.cond34
  br label %for.inc52

for.inc52:                                        ; preds = %for.end51
  %tmp53 = load i32* %k, align 4
  %inc54 = add nsw i32 %tmp53, 1
  store i32 %inc54, i32* %k, align 4
  br label %for.cond29

for.end55:                                        ; preds = %for.cond29
  br label %for.inc56

for.inc56:                                        ; preds = %for.end55
  %tmp57 = load i32* %j, align 4
  %inc58 = add nsw i32 %tmp57, 1
  store i32 %inc58, i32* %j, align 4
  br label %for.cond24

for.end59:                                        ; preds = %for.cond24
  br label %for.inc60

for.inc60:                                        ; preds = %for.end59
  %tmp61 = load i32* %i, align 4
  %inc62 = add nsw i32 %tmp61, 1
  store i32 %inc62, i32* %i, align 4
  br label %for.cond19

for.end63:                                        ; preds = %for.cond19
  %arrayidx64 = getelementptr inbounds [9 x [3 x [2 x [1 x i16]]]]* %l_10, i32 0, i64 7
  %arrayidx65 = getelementptr inbounds [3 x [2 x [1 x i16]]]* %arrayidx64, i32 0, i64 0
  %arrayidx66 = getelementptr inbounds [2 x [1 x i16]]* %arrayidx65, i32 0, i64 1
  %arrayidx67 = getelementptr inbounds [1 x i16]* %arrayidx66, i32 0, i64 0
  %tmp68 = load i16* %arrayidx67, align 2
  %conv69 = sext i16 %tmp68 to i32
  %tmp70 = volatile load i32** @g_11, align 8
  store i32 %conv69, i32* %tmp70
  br label %for.inc71

for.inc71:                                        ; preds = %for.end63
  %tmp72 = load i32* @g_2, align 4
  %conv73 = trunc i32 %tmp72 to i16
  %call74 = call signext i16 @safe_add_func_int16_t_s_s(i16 signext %conv73, i16 signext 6)
  %conv75 = sext i16 %call74 to i32
  store i32 %conv75, i32* @g_2, align 4
  br label %for.cond9

for.end76:                                        ; preds = %for.cond9
  %tmp77 = volatile load i32** @g_11, align 8
  %tmp78 = load i32* %tmp77
  ret i32 %tmp78
}

define internal zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i8, align 1
  %ui2.addr = alloca i8, align 1
  store i8 %ui1, i8* %ui1.addr, align 1
  store i8 %ui2, i8* %ui2.addr, align 1
  %tmp = load i8* %ui1.addr, align 1
  %conv = zext i8 %tmp to i32
  %tmp1 = load i8* %ui2.addr, align 1
  %conv2 = zext i8 %tmp1 to i32
  %sub = sub nsw i32 %conv, %conv2
  %conv3 = trunc i32 %sub to i8
  ret i8 %conv3
}

define internal signext i16 @safe_add_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i16, align 2
  %si2.addr = alloca i16, align 2
  store i16 %si1, i16* %si1.addr, align 2
  store i16 %si2, i16* %si2.addr, align 2
  %tmp = load i16* %si1.addr, align 2
  %conv = sext i16 %tmp to i32
  %tmp1 = load i16* %si2.addr, align 2
  %conv2 = sext i16 %tmp1 to i32
  %add = add nsw i32 %conv, %conv2
  %conv3 = trunc i32 %add to i16
  ret i16 %conv3
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %m = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i32 @func_1()
  %tmp = load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
