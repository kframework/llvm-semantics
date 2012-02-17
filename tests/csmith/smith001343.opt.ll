; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001343.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 6, align 4
@g_4 = global i32 -667774086, align 4
@g_5 = global i32 -1, align 4
@g_6 = global i32 1152217815, align 4
@g_11 = global i32 5, align 4
@g_18 = global i32 0, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [20 x i8] c"checksum g_11 = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [20 x i8] c"checksum g_18 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
entry:
  volatile store i32 2, i32* @g_3, align 4
  br label %for.cond36

for.cond36:                                       ; preds = %for.inc120, %entry
  %tmp37 = volatile load i32* @g_3, align 4
  %cmp38 = icmp slt i32 %tmp37, 4
  br i1 %cmp38, label %for.cond40, label %return

for.cond40:                                       ; preds = %for.cond36, %for.inc116
  %indvar = phi i32 [ %indvar.next, %for.inc116 ], [ 0, %for.cond36 ]
  %storemerge1 = add i32 %indvar, 3
  %cmp42 = icmp slt i32 %storemerge1, 7
  br i1 %cmp42, label %for.body43, label %for.inc120

for.body43:                                       ; preds = %for.cond40
  volatile store i32 0, i32* @g_5, align 4
  br label %for.cond44

for.cond44:                                       ; preds = %for.inc112, %for.body43
  %tmp45 = volatile load i32* @g_5, align 4
  %cmp46 = icmp slt i32 %tmp45, 1
  br i1 %cmp46, label %for.body47, label %for.inc116

for.body47:                                       ; preds = %for.cond44
  volatile store i32 0, i32* @g_6, align 4
  br label %for.cond48

for.cond48:                                       ; preds = %for.inc109, %for.body47
  %tmp49 = volatile load i32* @g_6, align 4
  %cmp50 = icmp slt i32 %tmp49, 1
  %tmp82 = volatile load i32* @g_5, align 4
  br i1 %cmp50, label %for.cond59.preheader, label %for.inc112

for.cond59.preheader:                             ; preds = %for.cond48
  %tobool = icmp eq i32 %tmp82, 0
  br i1 %tobool, label %if.else, label %if.then

if.then:                                          ; preds = %for.cond59.preheader
  volatile store i32 0, i32* @g_11, align 4
  %tmp85 = volatile load i32* @g_11, align 4
  %cmp86 = icmp slt i32 %tmp85, 1
  br i1 %cmp86, label %return.loopexit, label %for.end92

for.end92:                                        ; preds = %if.then
  volatile store i32 0, i32* @g_11, align 4
  %tmp94 = volatile load i32* @g_11, align 4
  %cmp95 = icmp eq i32 %tmp94, 0
  br i1 %cmp95, label %for.inc109, label %for.body97

for.body97:                                       ; preds = %for.end92
  store i32 %storemerge1, i32* @g_4, align 4
  %tmp99 = volatile load i32* @g_6, align 4
  %tmp101 = load i32* @g_18, align 4
  %xor = xor i32 %tmp101, %tmp99
  store i32 %xor, i32* @g_18, align 4
  %conv103 = trunc i32 %xor to i8
  br label %return

if.else:                                          ; preds = %for.cond59.preheader
  volatile store i32 1999738600, i32* @g_11, align 4
  br label %for.inc109

for.inc109:                                       ; preds = %for.end92, %if.else
  %tmp110 = volatile load i32* @g_6, align 4
  %add = add nsw i32 %tmp110, 1
  volatile store i32 %add, i32* @g_6, align 4
  br label %for.cond48

for.inc112:                                       ; preds = %for.cond48
  %add114 = add nsw i32 %tmp82, 1
  volatile store i32 %add114, i32* @g_5, align 4
  br label %for.cond44

for.inc116:                                       ; preds = %for.cond44
  %indvar.next = add i32 %indvar, 1
  br label %for.cond40

for.inc120:                                       ; preds = %for.cond40
  store i32 %storemerge1, i32* @g_4, align 4
  %tmp121 = volatile load i32* @g_3, align 4
  %add122 = add nsw i32 %tmp121, 3
  volatile store i32 %add122, i32* @g_3, align 4
  br label %for.cond36

return.loopexit:                                  ; preds = %if.then
  store i32 %storemerge1, i32* @g_4, align 4
  br label %return

return:                                           ; preds = %for.cond36, %return.loopexit, %for.body97
  %0 = phi i8 [ %conv103, %for.body97 ], [ -1, %return.loopexit ], [ 20, %for.cond36 ]
  ret i8 %0
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %call = tail call signext i8 @func_1()
  %tmp = volatile load i32* @g_3, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* @g_4, align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = volatile load i32* @g_5, align 4
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = volatile load i32* @g_6, align 4
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = volatile load i32* @g_11, align 4
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str4, i64 0, i64 0), i32 %tmp8) nounwind
  %tmp10 = load i32* @g_18, align 4
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str5, i64 0, i64 0), i32 %tmp10) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
