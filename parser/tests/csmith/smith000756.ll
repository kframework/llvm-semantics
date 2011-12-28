; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000756.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global [3 x [7 x i32]] [[7 x i32] [i32 1249198880, i32 1249198880, i32 1249198880, i32 1249198880, i32 1249198880, i32 1249198880, i32 1249198880], [7 x i32] [i32 1249198880, i32 1249198880, i32 1249198880, i32 1249198880, i32 1249198880, i32 1249198880, i32 1249198880], [7 x i32] [i32 1249198880, i32 1249198880, i32 1249198880, i32 1249198880, i32 1249198880, i32 1249198880, i32 1249198880]], align 16
@g_4 = global i32 8, align 4
@.str = private unnamed_addr constant [25 x i8] c"checksum g_3[0][0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][6] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][1] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][2] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][3] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][4] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][5] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][6] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [25 x i8] c"checksum g_3[2][0] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [25 x i8] c"checksum g_3[2][1] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [25 x i8] c"checksum g_3[2][2] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [25 x i8] c"checksum g_3[2][3] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [25 x i8] c"checksum g_3[2][4] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [25 x i8] c"checksum g_3[2][5] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [25 x i8] c"checksum g_3[2][6] = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i8 @func_1() nounwind uwtable {
entry:
  %retval = alloca i8, align 1
  %l_2 = alloca [6 x i8], align 1
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 6
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [6 x i8]* %l_2, i32 0, i64 %idxprom
  store i8 -9, i8* %arrayidx, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 2, i64 0), align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc10, %for.end
  %tmp4 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 2, i64 0), align 4
  %cmp5 = icmp slt i32 %tmp4, 6
  br i1 %cmp5, label %for.body6, label %for.end12

for.body6:                                        ; preds = %for.cond3
  %tmp7 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 2, i64 0), align 4
  %idxprom8 = sext i32 %tmp7 to i64
  %arrayidx9 = getelementptr inbounds [6 x i8]* %l_2, i32 0, i64 %idxprom8
  store i8 -41, i8* %arrayidx9, align 1
  br label %for.inc10

for.inc10:                                        ; preds = %for.body6
  %tmp11 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 2, i64 0), align 4
  %add = add nsw i32 %tmp11, 1
  store i32 %add, i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 2, i64 0), align 4
  br label %for.cond3

for.end12:                                        ; preds = %for.cond3
  volatile store i32 0, i32* @g_4, align 4
  br label %for.cond13

for.cond13:                                       ; preds = %for.inc19, %for.end12
  %tmp14 = volatile load i32* @g_4, align 4
  %cmp15 = icmp sge i32 %tmp14, 0
  br i1 %cmp15, label %for.body16, label %for.end22

for.body16:                                       ; preds = %for.cond13
  %arrayidx17 = getelementptr inbounds [6 x i8]* %l_2, i32 0, i64 1
  %tmp18 = load i8* %arrayidx17, align 1
  store i8 %tmp18, i8* %retval
  br label %return

for.inc19:                                        ; No predecessors!
  %tmp20 = volatile load i32* @g_4, align 4
  %conv = sext i32 %tmp20 to i64
  %call = call i64 @safe_sub_func_uint64_t_u_u(i64 %conv, i64 1)
  %conv21 = trunc i64 %call to i32
  volatile store i32 %conv21, i32* @g_4, align 4
  br label %for.cond13

for.end22:                                        ; preds = %for.cond13
  %arrayidx23 = getelementptr inbounds [6 x i8]* %l_2, i32 0, i64 3
  %tmp24 = load i8* %arrayidx23, align 1
  store i8 %tmp24, i8* %retval
  br label %return

return:                                           ; preds = %for.end22, %for.body16
  %0 = load i8* %retval
  ret i8 %0
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
  %tmp = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 0, i64 0), align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 0, i64 1), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 0, i64 2), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 0, i64 3), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 0, i64 4), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %tmp10 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 0, i64 5), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i32 0, i32 0), i32 %tmp10)
  %tmp12 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 0, i64 6), align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i32 0, i32 0), i32 %tmp12)
  %tmp14 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 1, i64 0), align 4
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i32 0, i32 0), i32 %tmp14)
  %tmp16 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 1, i64 1), align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str8, i32 0, i32 0), i32 %tmp16)
  %tmp18 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 1, i64 2), align 4
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str9, i32 0, i32 0), i32 %tmp18)
  %tmp20 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 1, i64 3), align 4
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str10, i32 0, i32 0), i32 %tmp20)
  %tmp22 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 1, i64 4), align 4
  %call23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str11, i32 0, i32 0), i32 %tmp22)
  %tmp24 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 1, i64 5), align 4
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str12, i32 0, i32 0), i32 %tmp24)
  %tmp26 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 1, i64 6), align 4
  %call27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str13, i32 0, i32 0), i32 %tmp26)
  %tmp28 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 2, i64 0), align 4
  %call29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str14, i32 0, i32 0), i32 %tmp28)
  %tmp30 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 2, i64 1), align 4
  %call31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str15, i32 0, i32 0), i32 %tmp30)
  %tmp32 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 2, i64 2), align 4
  %call33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str16, i32 0, i32 0), i32 %tmp32)
  %tmp34 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 2, i64 3), align 4
  %call35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str17, i32 0, i32 0), i32 %tmp34)
  %tmp36 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 2, i64 4), align 4
  %call37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str18, i32 0, i32 0), i32 %tmp36)
  %tmp38 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 2, i64 5), align 4
  %call39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str19, i32 0, i32 0), i32 %tmp38)
  %tmp40 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 2, i64 6), align 4
  %call41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str20, i32 0, i32 0), i32 %tmp40)
  %tmp42 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 2, i64 0), align 4
  %call43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str14, i32 0, i32 0), i32 %tmp42)
  %tmp44 = volatile load i32* @g_4, align 4
  %call45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str21, i32 0, i32 0), i32 %tmp44)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
