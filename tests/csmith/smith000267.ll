; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000267.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.S0 = type { i16 }

@g_2 = global [3 x %struct.S0] [%struct.S0 { i16 -7 }, %struct.S0 { i16 -7 }, %struct.S0 { i16 -7 }], align 2
@g_3 = global [8 x [5 x i32]] [[5 x i32] [i32 -500997070, i32 -500997070, i32 -500997070, i32 -500997070, i32 -500997070], [5 x i32] [i32 -500997070, i32 -500997070, i32 -500997070, i32 -500997070, i32 -500997070], [5 x i32] [i32 -500997070, i32 -500997070, i32 -500997070, i32 -500997070, i32 -500997070], [5 x i32] [i32 -500997070, i32 -500997070, i32 -500997070, i32 -500997070, i32 -500997070], [5 x i32] [i32 -500997070, i32 -500997070, i32 -500997070, i32 -500997070, i32 -500997070], [5 x i32] [i32 -500997070, i32 -500997070, i32 -500997070, i32 -500997070, i32 -500997070], [5 x i32] [i32 -500997070, i32 -500997070, i32 -500997070, i32 -500997070, i32 -500997070], [5 x i32] [i32 -500997070, i32 -500997070, i32 -500997070, i32 -500997070, i32 -500997070]], align 16
@g_4 = global [7 x [2 x i32]] [[2 x i32] [i32 -1, i32 -1], [2 x i32] [i32 -1, i32 -1], [2 x i32] [i32 -1, i32 -1], [2 x i32] [i32 -1, i32 -1], [2 x i32] [i32 -1, i32 -1], [2 x i32] [i32 -1, i32 -1], [2 x i32] [i32 -1, i32 -1]], align 16
@g_7 = global i32 -1472885804, align 4
@.str = private unnamed_addr constant [25 x i8] c"checksum g_2[0].f0 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_2[1].f0 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"checksum g_2[2].f0 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][0] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][1] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][2] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][3] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][4] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][0] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][1] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][2] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][3] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][4] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [25 x i8] c"checksum g_3[2][0] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [25 x i8] c"checksum g_3[2][1] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [25 x i8] c"checksum g_3[2][2] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [25 x i8] c"checksum g_3[2][3] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [25 x i8] c"checksum g_3[2][4] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [25 x i8] c"checksum g_3[3][0] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [25 x i8] c"checksum g_3[3][1] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [25 x i8] c"checksum g_3[3][2] = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [25 x i8] c"checksum g_3[3][3] = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [25 x i8] c"checksum g_3[3][4] = %d\0A\00", align 1
@.str23 = private unnamed_addr constant [25 x i8] c"checksum g_3[4][0] = %d\0A\00", align 1
@.str24 = private unnamed_addr constant [25 x i8] c"checksum g_3[4][1] = %d\0A\00", align 1
@.str25 = private unnamed_addr constant [25 x i8] c"checksum g_3[4][2] = %d\0A\00", align 1
@.str26 = private unnamed_addr constant [25 x i8] c"checksum g_3[4][3] = %d\0A\00", align 1
@.str27 = private unnamed_addr constant [25 x i8] c"checksum g_3[4][4] = %d\0A\00", align 1
@.str28 = private unnamed_addr constant [25 x i8] c"checksum g_3[5][0] = %d\0A\00", align 1
@.str29 = private unnamed_addr constant [25 x i8] c"checksum g_3[5][1] = %d\0A\00", align 1
@.str30 = private unnamed_addr constant [25 x i8] c"checksum g_3[5][2] = %d\0A\00", align 1
@.str31 = private unnamed_addr constant [25 x i8] c"checksum g_3[5][3] = %d\0A\00", align 1
@.str32 = private unnamed_addr constant [25 x i8] c"checksum g_3[5][4] = %d\0A\00", align 1
@.str33 = private unnamed_addr constant [25 x i8] c"checksum g_3[6][0] = %d\0A\00", align 1
@.str34 = private unnamed_addr constant [25 x i8] c"checksum g_3[6][1] = %d\0A\00", align 1
@.str35 = private unnamed_addr constant [25 x i8] c"checksum g_3[6][2] = %d\0A\00", align 1
@.str36 = private unnamed_addr constant [25 x i8] c"checksum g_3[6][3] = %d\0A\00", align 1
@.str37 = private unnamed_addr constant [25 x i8] c"checksum g_3[6][4] = %d\0A\00", align 1
@.str38 = private unnamed_addr constant [25 x i8] c"checksum g_3[7][0] = %d\0A\00", align 1
@.str39 = private unnamed_addr constant [25 x i8] c"checksum g_3[7][1] = %d\0A\00", align 1
@.str40 = private unnamed_addr constant [25 x i8] c"checksum g_3[7][2] = %d\0A\00", align 1
@.str41 = private unnamed_addr constant [25 x i8] c"checksum g_3[7][3] = %d\0A\00", align 1
@.str42 = private unnamed_addr constant [25 x i8] c"checksum g_3[7][4] = %d\0A\00", align 1
@.str43 = private unnamed_addr constant [25 x i8] c"checksum g_4[0][0] = %d\0A\00", align 1
@.str44 = private unnamed_addr constant [25 x i8] c"checksum g_4[0][1] = %d\0A\00", align 1
@.str45 = private unnamed_addr constant [25 x i8] c"checksum g_4[1][0] = %d\0A\00", align 1
@.str46 = private unnamed_addr constant [25 x i8] c"checksum g_4[1][1] = %d\0A\00", align 1
@.str47 = private unnamed_addr constant [25 x i8] c"checksum g_4[2][0] = %d\0A\00", align 1
@.str48 = private unnamed_addr constant [25 x i8] c"checksum g_4[2][1] = %d\0A\00", align 1
@.str49 = private unnamed_addr constant [25 x i8] c"checksum g_4[3][0] = %d\0A\00", align 1
@.str50 = private unnamed_addr constant [25 x i8] c"checksum g_4[3][1] = %d\0A\00", align 1
@.str51 = private unnamed_addr constant [25 x i8] c"checksum g_4[4][0] = %d\0A\00", align 1
@.str52 = private unnamed_addr constant [25 x i8] c"checksum g_4[4][1] = %d\0A\00", align 1
@.str53 = private unnamed_addr constant [25 x i8] c"checksum g_4[5][0] = %d\0A\00", align 1
@.str54 = private unnamed_addr constant [25 x i8] c"checksum g_4[5][1] = %d\0A\00", align 1
@.str55 = private unnamed_addr constant [25 x i8] c"checksum g_4[6][0] = %d\0A\00", align 1
@.str56 = private unnamed_addr constant [25 x i8] c"checksum g_4[6][1] = %d\0A\00", align 1
@.str57 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 1, i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 0, i64 2), align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc20, %entry
  %tmp = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 0, i64 2), align 4
  %cmp = icmp slt i32 %tmp, 3
  br i1 %cmp, label %for.body, label %for.end22

for.body:                                         ; preds = %for.cond
  store i32 -25, i32* getelementptr inbounds ([7 x [2 x i32]]* @g_4, i32 0, i64 1, i64 1), align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc15, %for.body
  %tmp2 = load i32* getelementptr inbounds ([7 x [2 x i32]]* @g_4, i32 0, i64 1, i64 1), align 4
  %cmp3 = icmp sge i32 %tmp2, 9
  br i1 %cmp3, label %for.body4, label %for.end19

for.body4:                                        ; preds = %for.cond1
  volatile store i32 29, i32* @g_7, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc, %for.body4
  %tmp6 = volatile load i32* @g_7, align 4
  %cmp7 = icmp sgt i32 %tmp6, 0
  br i1 %cmp7, label %for.body8, label %for.end

for.body8:                                        ; preds = %for.cond5
  %tmp9 = volatile load i32* @g_7, align 4
  %tobool = icmp ne i32 %tmp9, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.body8
  br label %for.end

if.end:                                           ; preds = %for.body8
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp10 = volatile load i32* @g_7, align 4
  %call = call i32 @safe_sub_func_uint32_t_u_u(i32 %tmp10, i32 1)
  volatile store i32 %call, i32* @g_7, align 4
  br label %for.cond5

for.end:                                          ; preds = %if.then, %for.cond5
  %tmp11 = load i32* getelementptr inbounds ([7 x [2 x i32]]* @g_4, i32 0, i64 4, i64 1), align 4
  %tobool12 = icmp ne i32 %tmp11, 0
  br i1 %tobool12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %for.end
  br label %for.inc15

if.end14:                                         ; preds = %for.end
  br label %for.inc15

for.inc15:                                        ; preds = %if.end14, %if.then13
  %tmp16 = load i32* getelementptr inbounds ([7 x [2 x i32]]* @g_4, i32 0, i64 1, i64 1), align 4
  %conv = trunc i32 %tmp16 to i16
  %call17 = call zeroext i16 @safe_sub_func_uint16_t_u_u(i16 zeroext %conv, i16 zeroext 1)
  %conv18 = zext i16 %call17 to i32
  store i32 %conv18, i32* getelementptr inbounds ([7 x [2 x i32]]* @g_4, i32 0, i64 1, i64 1), align 4
  br label %for.cond1

for.end19:                                        ; preds = %for.cond1
  br label %for.inc20

for.inc20:                                        ; preds = %for.end19
  %tmp21 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 0, i64 2), align 4
  %add = add nsw i32 %tmp21, 3
  store i32 %add, i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 0, i64 2), align 4
  br label %for.cond

for.end22:                                        ; preds = %for.cond
  volatile store i32 0, i32* @g_7, align 4
  br label %for.cond23

for.cond23:                                       ; preds = %for.inc29, %for.end22
  %tmp24 = volatile load i32* @g_7, align 4
  %cmp25 = icmp slt i32 %tmp24, 24
  br i1 %cmp25, label %for.body27, label %for.end34

for.body27:                                       ; preds = %for.cond23
  %tmp28 = load i32* getelementptr inbounds ([7 x [2 x i32]]* @g_4, i32 0, i64 5, i64 0), align 4
  store i32 %tmp28, i32* %retval
  br label %return

for.inc29:                                        ; No predecessors!
  %tmp30 = volatile load i32* @g_7, align 4
  %conv31 = trunc i32 %tmp30 to i8
  %call32 = call signext i8 @safe_sub_func_int8_t_s_s(i8 signext %conv31, i8 signext 1)
  %conv33 = sext i8 %call32 to i32
  volatile store i32 %conv33, i32* @g_7, align 4
  br label %for.cond23

for.end34:                                        ; preds = %for.cond23
  %tmp35 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 0, i64 2), align 4
  %rem = urem i32 %tmp35, 3
  %idxprom = zext i32 %rem to i64
  %arrayidx = getelementptr inbounds [3 x %struct.S0]* @g_2, i32 0, i64 %idxprom
  %f0 = getelementptr inbounds %struct.S0* %arrayidx, i32 0, i32 0
  %tmp36 = load i16* %f0, align 2
  %conv37 = sext i16 %tmp36 to i32
  store i32 %conv37, i32* %retval
  br label %return

return:                                           ; preds = %for.end34, %for.body27
  %0 = load i32* %retval
  ret i32 %0
}

define internal i32 @safe_sub_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i32, align 4
  %ui2.addr = alloca i32, align 4
  store i32 %ui1, i32* %ui1.addr, align 4
  store i32 %ui2, i32* %ui2.addr, align 4
  %tmp = load i32* %ui1.addr, align 4
  %tmp1 = load i32* %ui2.addr, align 4
  %sub = sub i32 %tmp, %tmp1
  ret i32 %sub
}

define internal zeroext i16 @safe_sub_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i16, align 2
  %ui2.addr = alloca i16, align 2
  store i16 %ui1, i16* %ui1.addr, align 2
  store i16 %ui2, i16* %ui2.addr, align 2
  %tmp = load i16* %ui1.addr, align 2
  %conv = zext i16 %tmp to i32
  %tmp1 = load i16* %ui2.addr, align 2
  %conv2 = zext i16 %tmp1 to i32
  %sub = sub nsw i32 %conv, %conv2
  %conv3 = trunc i32 %sub to i16
  ret i16 %conv3
}

define internal signext i8 @safe_sub_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i8, align 1
  %si2.addr = alloca i8, align 1
  store i8 %si1, i8* %si1.addr, align 1
  store i8 %si2, i8* %si2.addr, align 1
  %tmp = load i8* %si1.addr, align 1
  %conv = sext i8 %tmp to i32
  %tmp1 = load i8* %si2.addr, align 1
  %conv2 = sext i8 %tmp1 to i32
  %sub = sub nsw i32 %conv, %conv2
  %conv3 = trunc i32 %sub to i8
  ret i8 %conv3
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
  %call = call i32 @func_1()
  %tmp = load i16* getelementptr inbounds ([3 x %struct.S0]* @g_2, i32 0, i64 0, i32 0), align 2
  %conv = sext i16 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %tmp2 = load i16* getelementptr inbounds ([3 x %struct.S0]* @g_2, i32 0, i64 1, i32 0), align 2
  %conv3 = sext i16 %tmp2 to i32
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i32 %conv3)
  %tmp5 = load i16* getelementptr inbounds ([3 x %struct.S0]* @g_2, i32 0, i64 2, i32 0), align 2
  %conv6 = sext i16 %tmp5 to i32
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i32 0, i32 0), i32 %conv6)
  %tmp8 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 0, i64 0), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i32 0, i32 0), i32 %tmp8)
  %tmp10 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 0, i64 1), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i32 0, i32 0), i32 %tmp10)
  %tmp12 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 0, i64 2), align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i32 0, i32 0), i32 %tmp12)
  %tmp14 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 0, i64 3), align 4
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i32 0, i32 0), i32 %tmp14)
  %tmp16 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 0, i64 4), align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i32 0, i32 0), i32 %tmp16)
  %tmp18 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 1, i64 0), align 4
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str8, i32 0, i32 0), i32 %tmp18)
  %tmp20 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 1, i64 1), align 4
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str9, i32 0, i32 0), i32 %tmp20)
  %tmp22 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 1, i64 2), align 4
  %call23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str10, i32 0, i32 0), i32 %tmp22)
  %tmp24 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 1, i64 3), align 4
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str11, i32 0, i32 0), i32 %tmp24)
  %tmp26 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 1, i64 4), align 4
  %call27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str12, i32 0, i32 0), i32 %tmp26)
  %tmp28 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 2, i64 0), align 4
  %call29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str13, i32 0, i32 0), i32 %tmp28)
  %tmp30 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 2, i64 1), align 4
  %call31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str14, i32 0, i32 0), i32 %tmp30)
  %tmp32 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 2, i64 2), align 4
  %call33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str15, i32 0, i32 0), i32 %tmp32)
  %tmp34 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 2, i64 3), align 4
  %call35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str16, i32 0, i32 0), i32 %tmp34)
  %tmp36 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 2, i64 4), align 4
  %call37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str17, i32 0, i32 0), i32 %tmp36)
  %tmp38 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 3, i64 0), align 4
  %call39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str18, i32 0, i32 0), i32 %tmp38)
  %tmp40 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 3, i64 1), align 4
  %call41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str19, i32 0, i32 0), i32 %tmp40)
  %tmp42 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 3, i64 2), align 4
  %call43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str20, i32 0, i32 0), i32 %tmp42)
  %tmp44 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 3, i64 3), align 4
  %call45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str21, i32 0, i32 0), i32 %tmp44)
  %tmp46 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 3, i64 4), align 4
  %call47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str22, i32 0, i32 0), i32 %tmp46)
  %tmp48 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 4, i64 0), align 4
  %call49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str23, i32 0, i32 0), i32 %tmp48)
  %tmp50 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 4, i64 1), align 4
  %call51 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str24, i32 0, i32 0), i32 %tmp50)
  %tmp52 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 4, i64 2), align 4
  %call53 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str25, i32 0, i32 0), i32 %tmp52)
  %tmp54 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 4, i64 3), align 4
  %call55 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str26, i32 0, i32 0), i32 %tmp54)
  %tmp56 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 4, i64 4), align 4
  %call57 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str27, i32 0, i32 0), i32 %tmp56)
  %tmp58 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 5, i64 0), align 4
  %call59 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str28, i32 0, i32 0), i32 %tmp58)
  %tmp60 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 5, i64 1), align 4
  %call61 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str29, i32 0, i32 0), i32 %tmp60)
  %tmp62 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 5, i64 2), align 4
  %call63 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str30, i32 0, i32 0), i32 %tmp62)
  %tmp64 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 5, i64 3), align 4
  %call65 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str31, i32 0, i32 0), i32 %tmp64)
  %tmp66 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 5, i64 4), align 4
  %call67 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str32, i32 0, i32 0), i32 %tmp66)
  %tmp68 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 6, i64 0), align 4
  %call69 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str33, i32 0, i32 0), i32 %tmp68)
  %tmp70 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 6, i64 1), align 4
  %call71 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str34, i32 0, i32 0), i32 %tmp70)
  %tmp72 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 6, i64 2), align 4
  %call73 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str35, i32 0, i32 0), i32 %tmp72)
  %tmp74 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 6, i64 3), align 4
  %call75 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str36, i32 0, i32 0), i32 %tmp74)
  %tmp76 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 6, i64 4), align 4
  %call77 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str37, i32 0, i32 0), i32 %tmp76)
  %tmp78 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 7, i64 0), align 4
  %call79 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str38, i32 0, i32 0), i32 %tmp78)
  %tmp80 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 7, i64 1), align 4
  %call81 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str39, i32 0, i32 0), i32 %tmp80)
  %tmp82 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 7, i64 2), align 4
  %call83 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str40, i32 0, i32 0), i32 %tmp82)
  %tmp84 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 7, i64 3), align 4
  %call85 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str41, i32 0, i32 0), i32 %tmp84)
  %tmp86 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 7, i64 4), align 4
  %call87 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str42, i32 0, i32 0), i32 %tmp86)
  %tmp88 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 0, i64 2), align 4
  %call89 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i32 0, i32 0), i32 %tmp88)
  %tmp90 = load i32* getelementptr inbounds ([7 x [2 x i32]]* @g_4, i32 0, i64 0, i64 0), align 4
  %call91 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str43, i32 0, i32 0), i32 %tmp90)
  %tmp92 = load i32* getelementptr inbounds ([7 x [2 x i32]]* @g_4, i32 0, i64 0, i64 1), align 4
  %call93 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str44, i32 0, i32 0), i32 %tmp92)
  %tmp94 = load i32* getelementptr inbounds ([7 x [2 x i32]]* @g_4, i32 0, i64 1, i64 0), align 4
  %call95 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str45, i32 0, i32 0), i32 %tmp94)
  %tmp96 = load i32* getelementptr inbounds ([7 x [2 x i32]]* @g_4, i32 0, i64 1, i64 1), align 4
  %call97 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str46, i32 0, i32 0), i32 %tmp96)
  %tmp98 = load i32* getelementptr inbounds ([7 x [2 x i32]]* @g_4, i32 0, i64 2, i64 0), align 4
  %call99 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str47, i32 0, i32 0), i32 %tmp98)
  %tmp100 = load i32* getelementptr inbounds ([7 x [2 x i32]]* @g_4, i32 0, i64 2, i64 1), align 4
  %call101 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str48, i32 0, i32 0), i32 %tmp100)
  %tmp102 = load i32* getelementptr inbounds ([7 x [2 x i32]]* @g_4, i32 0, i64 3, i64 0), align 4
  %call103 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str49, i32 0, i32 0), i32 %tmp102)
  %tmp104 = load i32* getelementptr inbounds ([7 x [2 x i32]]* @g_4, i32 0, i64 3, i64 1), align 4
  %call105 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str50, i32 0, i32 0), i32 %tmp104)
  %tmp106 = load i32* getelementptr inbounds ([7 x [2 x i32]]* @g_4, i32 0, i64 4, i64 0), align 4
  %call107 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str51, i32 0, i32 0), i32 %tmp106)
  %tmp108 = load i32* getelementptr inbounds ([7 x [2 x i32]]* @g_4, i32 0, i64 4, i64 1), align 4
  %call109 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str52, i32 0, i32 0), i32 %tmp108)
  %tmp110 = load i32* getelementptr inbounds ([7 x [2 x i32]]* @g_4, i32 0, i64 5, i64 0), align 4
  %call111 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str53, i32 0, i32 0), i32 %tmp110)
  %tmp112 = load i32* getelementptr inbounds ([7 x [2 x i32]]* @g_4, i32 0, i64 5, i64 1), align 4
  %call113 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str54, i32 0, i32 0), i32 %tmp112)
  %tmp114 = load i32* getelementptr inbounds ([7 x [2 x i32]]* @g_4, i32 0, i64 6, i64 0), align 4
  %call115 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str55, i32 0, i32 0), i32 %tmp114)
  %tmp116 = load i32* getelementptr inbounds ([7 x [2 x i32]]* @g_4, i32 0, i64 6, i64 1), align 4
  %call117 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str56, i32 0, i32 0), i32 %tmp116)
  %tmp118 = load i32* getelementptr inbounds ([7 x [2 x i32]]* @g_4, i32 0, i64 1, i64 1), align 4
  %call119 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str46, i32 0, i32 0), i32 %tmp118)
  %tmp120 = volatile load i32* @g_7, align 4
  %call121 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str57, i32 0, i32 0), i32 %tmp120)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
