; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000963.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.S0 = type { i32 }

@g_3 = global [2 x i32] [i32 -1, i32 -1], align 4
@g_2 = global [5 x [10 x i32*]] [[10 x i32*] [i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*)], [10 x i32*] [i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*)], [10 x i32*] [i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*)], [10 x i32*] [i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*)], [10 x i32*] [i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*)]], align 16
@g_7 = constant %struct.S0 { i32 -1180962629 }, align 4
@.str = private unnamed_addr constant [22 x i8] c"checksum g_3[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_3[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_7.f0 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %retval = alloca %struct.S0, align 4
  %l_4 = alloca [1 x [6 x i32**]], align 16
  %l_5 = alloca i64, align 8
  %l_6 = alloca i16, align 2
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i64 -3, i64* %l_5, align 8
  store i16 0, i16* %l_6, align 2
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc10, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 1
  br i1 %cmp, label %for.body, label %for.end13

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %tmp2 = load i32* %j, align 4
  %cmp3 = icmp slt i32 %tmp2, 6
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond1
  %tmp5 = load i32* %j, align 4
  %idxprom = sext i32 %tmp5 to i64
  %tmp6 = load i32* %i, align 4
  %idxprom7 = sext i32 %tmp6 to i64
  %arrayidx = getelementptr inbounds [1 x [6 x i32**]]* %l_4, i32 0, i64 %idxprom7
  %arrayidx8 = getelementptr inbounds [6 x i32**]* %arrayidx, i32 0, i64 %idxprom
  store i32** null, i32*** %arrayidx8, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body4
  %tmp9 = load i32* %j, align 4
  %inc = add nsw i32 %tmp9, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc10

for.inc10:                                        ; preds = %for.end
  %tmp11 = load i32* %i, align 4
  %inc12 = add nsw i32 %tmp11, 1
  store i32 %inc12, i32* %i, align 4
  br label %for.cond

for.end13:                                        ; preds = %for.cond
  %tmp14 = load i32** getelementptr inbounds ([5 x [10 x i32*]]* @g_2, i32 0, i64 1, i64 6), align 8
  store i32* %tmp14, i32** getelementptr inbounds ([5 x [10 x i32*]]* @g_2, i32 0, i64 1, i64 6), align 8
  %tmp15 = load i64* %l_5, align 8
  %tmp16 = load i16* %l_6, align 2
  %conv = sext i16 %tmp16 to i64
  %xor = xor i64 %conv, %tmp15
  %conv17 = trunc i64 %xor to i16
  store i16 %conv17, i16* %l_6, align 2
  %tmp18 = bitcast %struct.S0* %retval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp18, i8* bitcast (%struct.S0* @g_7 to i8*), i64 4, i32 4, i1 false)
  %coerce.dive = getelementptr %struct.S0* %retval, i32 0, i32 0
  %0 = load i32* %coerce.dive
  ret i32 %0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %coerce = alloca %struct.S0, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i32 @func_1()
  %coerce.dive = getelementptr %struct.S0* %coerce, i32 0, i32 0
  store i32 %call, i32* %coerce.dive
  %tmp = volatile load i32* getelementptr inbounds ([2 x i32]* @g_3, i32 0, i64 0), align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = volatile load i32* getelementptr inbounds ([2 x i32]* @g_3, i32 0, i64 1), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = volatile load i32* getelementptr inbounds ([2 x i32]* @g_3, i32 0, i64 1), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %tmp4)
  %tmp6 = volatile load i32* getelementptr inbounds (%struct.S0* @g_7, i32 0, i32 0), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %tmp6)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
