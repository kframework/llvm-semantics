; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000485.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.S0 = type { i32, i32, i64, i32, i32, i64, i64, i8 }

@g_2 = global [2 x [6 x i32]] [[6 x i32] [i32 -8, i32 -8, i32 -8, i32 -8, i32 -8, i32 -8], [6 x i32] [i32 -8, i32 -8, i32 -8, i32 -8, i32 -8, i32 -8]], align 16
@g_7 = global %struct.S0* null, align 8
@func_1.l_5 = internal constant [6 x [10 x [1 x [1 x i32]]]] [[10 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]]], [10 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]]], [10 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]]], [10 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]]], [10 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]]], [10 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]]]], align 16
@.str = private unnamed_addr constant [25 x i8] c"checksum g_2[0][0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][0] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][1] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][2] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][3] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][4] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][5] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i8 @func_1() nounwind uwtable {
entry:
  %l_6 = alloca i32*, align 8
  %l_8 = alloca [10 x [4 x %struct.S0**]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  store i32 7, i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 1, i64 5), align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc29, %entry
  %tmp = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 1, i64 5), align 4
  %cmp = icmp sge i32 %tmp, 0
  br i1 %cmp, label %for.body, label %for.end32

for.body:                                         ; preds = %for.cond
  store i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 1, i64 5), i32** %l_6, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc20, %for.body
  %tmp8 = load i32* %i, align 4
  %cmp9 = icmp slt i32 %tmp8, 10
  br i1 %cmp9, label %for.body10, label %for.end23

for.body10:                                       ; preds = %for.cond7
  store i32 0, i32* %j, align 4
  br label %for.cond11

for.cond11:                                       ; preds = %for.inc, %for.body10
  %tmp12 = load i32* %j, align 4
  %cmp13 = icmp slt i32 %tmp12, 4
  br i1 %cmp13, label %for.body14, label %for.end

for.body14:                                       ; preds = %for.cond11
  %tmp15 = load i32* %j, align 4
  %idxprom = sext i32 %tmp15 to i64
  %tmp16 = load i32* %i, align 4
  %idxprom17 = sext i32 %tmp16 to i64
  %arrayidx = getelementptr inbounds [10 x [4 x %struct.S0**]]* %l_8, i32 0, i64 %idxprom17
  %arrayidx18 = getelementptr inbounds [4 x %struct.S0**]* %arrayidx, i32 0, i64 %idxprom
  store %struct.S0** @g_7, %struct.S0*** %arrayidx18, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body14
  %tmp19 = load i32* %j, align 4
  %inc = add nsw i32 %tmp19, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond11

for.end:                                          ; preds = %for.cond11
  br label %for.inc20

for.inc20:                                        ; preds = %for.end
  %tmp21 = load i32* %i, align 4
  %inc22 = add nsw i32 %tmp21, 1
  store i32 %inc22, i32* %i, align 4
  br label %for.cond7

for.end23:                                        ; preds = %for.cond7
  %tmp24 = load i32* getelementptr inbounds ([6 x [10 x [1 x [1 x i32]]]]* @func_1.l_5, i32 0, i64 0, i64 7, i64 0, i64 0), align 4
  %tmp25 = load i32** %l_6, align 8
  %tmp26 = load i32* %tmp25
  %and = and i32 %tmp26, %tmp24
  store i32 %and, i32* %tmp25
  %tmp27 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 1, i64 5), align 4
  %tobool = icmp ne i32 %tmp27, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.end23
  br label %for.end32

if.end:                                           ; preds = %for.end23
  %tmp28 = load %struct.S0** @g_7, align 8
  store %struct.S0* %tmp28, %struct.S0** @g_7, align 8
  br label %for.inc29

for.inc29:                                        ; preds = %if.end
  %tmp30 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 1, i64 5), align 4
  %conv = sext i32 %tmp30 to i64
  %call = call i64 @safe_sub_func_uint64_t_u_u(i64 %conv, i64 1)
  %conv31 = trunc i64 %call to i32
  store i32 %conv31, i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 1, i64 5), align 4
  br label %for.cond

for.end32:                                        ; preds = %if.then, %for.cond
  %tmp33 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 0, i64 4), align 4
  %conv34 = trunc i32 %tmp33 to i8
  ret i8 %conv34
}

define internal i64 @safe_sub_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i64, align 8
  %ui2.addr = alloca i64, align 8
  store i64 %ui1, i64* %ui1.addr, align 8
  store i64 %ui2, i64* %ui2.addr, align 8
  %tmp = load i64* %ui1.addr, align 8
  %tmp1 = load i64* %ui2.addr, align 8
  %sub = sub i64 %tmp, %tmp1
  ret i64 %sub
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call zeroext i8 @func_1()
  %tmp = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 0, i64 0), align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 0, i64 1), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 0, i64 2), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 0, i64 3), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 0, i64 4), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %tmp10 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 0, i64 5), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i32 0, i32 0), i32 %tmp10)
  %tmp12 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 1, i64 0), align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i32 0, i32 0), i32 %tmp12)
  %tmp14 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 1, i64 1), align 4
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i32 0, i32 0), i32 %tmp14)
  %tmp16 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 1, i64 2), align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str8, i32 0, i32 0), i32 %tmp16)
  %tmp18 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 1, i64 3), align 4
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str9, i32 0, i32 0), i32 %tmp18)
  %tmp20 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 1, i64 4), align 4
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str10, i32 0, i32 0), i32 %tmp20)
  %tmp22 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 1, i64 5), align 4
  %call23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str11, i32 0, i32 0), i32 %tmp22)
  %tmp24 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 1, i64 5), align 4
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str11, i32 0, i32 0), i32 %tmp24)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
