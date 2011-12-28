; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001645.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global [6 x i32] [i32 -7, i32 -7, i32 -7, i32 -7, i32 -7, i32 -7], align 16
@g_5 = global i32 535264726, align 4
@.str = private unnamed_addr constant [22 x i8] c"checksum g_3[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_3[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_3[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_3[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_3[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_3[5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  %retval = alloca i16, align 2
  %l_2 = alloca [10 x i16], align 16
  %i = alloca i32, align 4
  %l_4 = alloca i32*, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [10 x i16]* %l_2, i32 0, i64 %idxprom
  store i16 16074, i16* %arrayidx, align 2
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  volatile store i32 9, i32* getelementptr inbounds ([6 x i32]* @g_3, i32 0, i64 0), align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc13, %for.end
  %tmp4 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_3, i32 0, i64 0), align 4
  %cmp5 = icmp sge i32 %tmp4, 0
  br i1 %cmp5, label %for.body6, label %for.end15

for.body6:                                        ; preds = %for.cond3
  store i32* @g_5, i32** %l_4, align 8
  %tmp8 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_3, i32 0, i64 4), align 4
  %tmp9 = load i32** %l_4, align 8
  %tmp10 = load i32* %tmp9
  %xor = xor i32 %tmp10, %tmp8
  store i32 %xor, i32* %tmp9
  %tmp11 = load i32** %l_4, align 8
  %tmp12 = load i32* %tmp11
  %conv = trunc i32 %tmp12 to i16
  store i16 %conv, i16* %retval
  br label %return

for.inc13:                                        ; No predecessors!
  %tmp14 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_3, i32 0, i64 0), align 4
  %add = add nsw i32 %tmp14, -4
  volatile store i32 %add, i32* getelementptr inbounds ([6 x i32]* @g_3, i32 0, i64 0), align 4
  br label %for.cond3

for.end15:                                        ; preds = %for.cond3
  %tmp16 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_3, i32 0, i64 4), align 4
  %conv17 = trunc i32 %tmp16 to i16
  store i16 %conv17, i16* %retval
  br label %return

return:                                           ; preds = %for.end15, %for.body6
  %0 = load i16* %retval
  ret i16 %0
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call zeroext i16 @func_1()
  %tmp = volatile load i32* getelementptr inbounds ([6 x i32]* @g_3, i32 0, i64 0), align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_3, i32 0, i64 1), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_3, i32 0, i64 2), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_3, i32 0, i64 3), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_3, i32 0, i64 4), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %tmp10 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_3, i32 0, i64 5), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %tmp10)
  %tmp12 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_3, i32 0, i64 0), align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %tmp12)
  %tmp14 = load i32* @g_5, align 4
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str6, i32 0, i32 0), i32 %tmp14)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
