; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001653.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -3, align 4
@g_6 = global [1 x [3 x [1 x i32]]] [[3 x [1 x i32]] [[1 x i32] [i32 -10], [1 x i32] [i32 -10], [1 x i32] [i32 -10]]], align 4
@g_8 = global i32* getelementptr inbounds ([1 x [3 x [1 x i32]]]* @g_6, i64 0, i64 0, i64 1, i64 0), align 8
@g_7 = global i32** @g_8, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [28 x i8] c"checksum g_6[0][0][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [28 x i8] c"checksum g_6[0][1][0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [28 x i8] c"checksum g_6[0][2][0] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
entry:
  %tmp = load i32* @g_2, align 4
  %cmp = icmp ugt i32 %tmp, 5
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %tmp6 = load i32* getelementptr inbounds ([1 x [3 x [1 x i32]]]* @g_6, i64 0, i64 0, i64 1, i64 0), align 4
  %phitmp = trunc i32 %tmp6 to i8
  br label %return

if.else:                                          ; preds = %entry
  %tmp8 = load i32*** @g_7, align 8
  %cmp9 = icmp ne i32** %tmp8, null
  %conv10 = zext i1 %cmp9 to i32
  %tmp11 = load i32** @g_8, align 8
  store i32 %conv10, i32* %tmp11, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then
  %storemerge.in = phi i8 [ %phitmp, %if.then ], [ -8, %if.else ]
  ret i8 %storemerge.in
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp.i = load i32* @g_2, align 4
  %cmp.i = icmp ugt i32 %tmp.i, 5
  br i1 %cmp.i, label %func_1.exit, label %if.else.i

if.else.i:                                        ; preds = %entry
  %tmp8.i = load i32*** @g_7, align 8
  %cmp9.i = icmp ne i32** %tmp8.i, null
  %conv10.i = zext i1 %cmp9.i to i32
  %tmp11.i = load i32** @g_8, align 8
  store i32 %conv10.i, i32* %tmp11.i, align 4
  %tmp.pre = load i32* @g_2, align 4
  br label %func_1.exit

func_1.exit:                                      ; preds = %entry, %if.else.i
  %tmp = phi i32 [ %tmp.i, %entry ], [ %tmp.pre, %if.else.i ]
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* getelementptr inbounds ([1 x [3 x [1 x i32]]]* @g_6, i64 0, i64 0, i64 0, i64 0), align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* getelementptr inbounds ([1 x [3 x [1 x i32]]]* @g_6, i64 0, i64 0, i64 1, i64 0), align 4
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = load i32* getelementptr inbounds ([1 x [3 x [1 x i32]]]* @g_6, i64 0, i64 0, i64 2, i64 0), align 4
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = load i32* getelementptr inbounds ([1 x [3 x [1 x i32]]]* @g_6, i64 0, i64 0, i64 1, i64 0), align 4
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str2, i64 0, i64 0), i32 %tmp8) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
