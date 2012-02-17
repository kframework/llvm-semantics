; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000894.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.S0 = type { i32, i16, i8, i32, i8, i8, i16, i32 }

@g_9 = global i16 -27904, align 2
@g_11 = global i32 -4, align 4
@g_10 = global i32* @g_11, align 8
@g_12 = global [8 x [1 x i32**]] [[1 x i32**] [i32** @g_10], [1 x i32**] [i32** @g_10], [1 x i32**] [i32** @g_10], [1 x i32**] [i32** @g_10], [1 x i32**] [i32** @g_10], [1 x i32**] [i32** @g_10], [1 x i32**] [i32** @g_10], [1 x i32**] [i32** @g_10]], align 16
@g_18 = global i32 1, align 4
@g_19 = global [9 x i32] [i32 -471375082, i32 -471375082, i32 -471375082, i32 -471375082, i32 -471375082, i32 -471375082, i32 -471375082, i32 -471375082, i32 -471375082], align 16
@g_49 = global i32* @g_18, align 8
@g_51 = global i32** @g_10, align 8
@g_58 = global i32** @g_10, align 8
@g_57 = global i32*** @g_58, align 8
@g_59 = global %struct.S0 { i32 -1, i16 26275, i8 -113, i32 -1, i8 -41, i8 74, i16 0, i32 1 }, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_11 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_18 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"checksum g_19[0] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [23 x i8] c"checksum g_19[1] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [23 x i8] c"checksum g_19[2] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [23 x i8] c"checksum g_19[3] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [23 x i8] c"checksum g_19[4] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [23 x i8] c"checksum g_19[5] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [23 x i8] c"checksum g_19[6] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [23 x i8] c"checksum g_19[7] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [23 x i8] c"checksum g_19[8] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [23 x i8] c"checksum g_59.f0 = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [23 x i8] c"checksum g_59.f1 = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [23 x i8] c"checksum g_59.f2 = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [23 x i8] c"checksum g_59.f3 = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [23 x i8] c"checksum g_59.f4 = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [23 x i8] c"checksum g_59.f5 = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [23 x i8] c"checksum g_59.f6 = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [23 x i8] c"checksum g_59.f7 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define void @func_1(%struct.S0* sret %agg.result) nounwind uwtable {
entry:
  %l_13 = alloca i32*, align 8
  %l_31 = alloca i32*, align 8
  %l_34 = alloca [1 x i64], align 8
  %l_50 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* @g_11, i32** %l_13, align 8
  store i32* @g_18, i32** %l_31, align 8
  store i32 -8, i32* %l_50, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [1 x i64]* %l_34, i32 0, i64 %idxprom
  store i64 1, i64* %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp3 = load i16* @g_9, align 2
  %conv = sext i16 %tmp3 to i32
  %tmp4 = load i32** @g_10, align 8
  %call = call i32* @func_2(i32 %conv, i32* %tmp4)
  store i32* %call, i32** %l_13, align 8
  %tmp5 = load i32** %l_13, align 8
  %tmp6 = load i32* %tmp5
  %tmp7 = load i32** %l_31, align 8
  %call8 = call i32* @func_2(i32 %tmp6, i32* %tmp7)
  %tmp9 = volatile load i32*** @g_51, align 8
  store i32* %call8, i32** %tmp9
  %tmp10 = load i32**** @g_57, align 8
  %call11 = call i32 @func_52(i32*** %tmp10, i32 376620625)
  %tmp12 = load i32** %l_13, align 8
  %tmp13 = load i32* %tmp12
  %or = or i32 %tmp13, %call11
  store i32 %or, i32* %tmp12
  %tmp14 = bitcast %struct.S0* %agg.result to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp14, i8* bitcast (%struct.S0* @g_59 to i8*), i64 20, i32 4, i1 false)
  ret void
}

define i32* @func_2(i32 %p_3, i32* %p_4) nounwind uwtable {
entry:
  %p_3.addr = alloca i32, align 4
  %p_4.addr = alloca i32*, align 8
  %l_5 = alloca [4 x i32], align 16
  %i = alloca i32, align 4
  %l_8 = alloca i32*, align 8
  %l_7 = alloca i32**, align 8
  %l_6 = alloca i32***, align 8
  store i32 %p_3, i32* %p_3.addr, align 4
  store i32* %p_4, i32** %p_4.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [4 x i32]* %l_5, i32 0, i64 %idxprom
  store i32 3, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 1, i32* %p_3.addr, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc14, %for.end
  %tmp4 = load i32* %p_3.addr, align 4
  %cmp5 = icmp slt i32 %tmp4, 4
  br i1 %cmp5, label %for.body6, label %for.end16

for.body6:                                        ; preds = %for.cond3
  %tmp8 = load i32* %p_3.addr, align 4
  %rem = urem i32 %tmp8, 4
  %idxprom9 = zext i32 %rem to i64
  %arrayidx10 = getelementptr inbounds [4 x i32]* %l_5, i32 0, i64 %idxprom9
  store i32* %arrayidx10, i32** %l_8, align 8
  store i32** %l_8, i32*** %l_7, align 8
  store i32*** %l_7, i32**** %l_6, align 8
  %tmp13 = load i32**** %l_6, align 8
  store i32** null, i32*** %tmp13
  br label %for.inc14

for.inc14:                                        ; preds = %for.body6
  %tmp15 = load i32* %p_3.addr, align 4
  %add = add nsw i32 %tmp15, 3
  store i32 %add, i32* %p_3.addr, align 4
  br label %for.cond3

for.end16:                                        ; preds = %for.cond3
  %tmp17 = load i16* @g_9, align 2
  %conv = sext i16 %tmp17 to i32
  %tmp18 = load i32** %p_4.addr, align 8
  %tmp19 = load i32* %tmp18
  %xor = xor i32 %tmp19, %conv
  store i32 %xor, i32* %tmp18
  %tmp20 = load i32** %p_4.addr, align 8
  ret i32* %tmp20
}

define i32 @func_52(i32*** %p_53, i32 %p_54) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %p_53.addr = alloca i32***, align 8
  %p_54.addr = alloca i32, align 4
  %l_55 = alloca i16, align 2
  %l_56 = alloca i32, align 4
  store i32*** %p_53, i32**** %p_53.addr, align 8
  store i32 %p_54, i32* %p_54.addr, align 4
  %tmp = load i32** @g_10, align 8
  %tmp1 = load i32* %tmp
  %tobool = icmp ne i32 %tmp1, 0
  br i1 %tobool, label %if.else9, label %if.then

if.then:                                          ; preds = %entry
  %tmp2 = load i32* %p_54.addr, align 4
  %tobool3 = icmp ne i32 %tmp2, 0
  br i1 %tobool3, label %if.then4, label %if.else

if.then4:                                         ; preds = %if.then
  store i16 15157, i16* %l_55, align 2
  store i32 15157, i32* %retval
  br label %return

if.else:                                          ; preds = %if.then
  %tmp6 = volatile load i32*** @g_51, align 8
  %tmp7 = load i32** %tmp6
  %tmp8 = load i32* %tmp7
  store i32 %tmp8, i32* %retval
  br label %return

if.else9:                                         ; preds = %entry
  store i32 -1263399019, i32* %l_56, align 4
  store i32 -1263399019, i32* %retval
  br label %return

return:                                           ; preds = %if.else9, %if.else, %if.then4
  %0 = load i32* %retval
  ret i32 %0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32* @func_14(i32* %p_15, i32* %p_16, i32 %p_17) nounwind uwtable {
entry:
  %retval = alloca i32*, align 8
  %p_15.addr = alloca i32*, align 8
  %p_16.addr = alloca i32*, align 8
  %p_17.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %l_28 = alloca i8, align 1
  %l_25 = alloca i32, align 4
  %l_29 = alloca [8 x [8 x i32*]], align 16
  %i97 = alloca i32, align 4
  %j99 = alloca i32, align 4
  %l_30 = alloca i32, align 4
  store i32* %p_15, i32** %p_15.addr, align 8
  store i32* %p_16, i32** %p_16.addr, align 8
  store i32 %p_17, i32* %p_17.addr, align 4
  br label %lbl_20

lbl_20:                                           ; preds = %if.then, %entry
  store i32 3, i32* %p_17.addr, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc36, %lbl_20
  %tmp = load i32* %p_17.addr, align 4
  %cmp = icmp ult i32 %tmp, 8
  br i1 %cmp, label %for.body, label %for.end39

for.body:                                         ; preds = %for.cond
  store i16 0, i16* @g_9, align 2
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc30, %for.body
  %tmp2 = load i16* @g_9, align 2
  %conv = sext i16 %tmp2 to i32
  %cmp3 = icmp slt i32 %conv, 1
  br i1 %cmp3, label %for.body5, label %for.end35

for.body5:                                        ; preds = %for.cond1
  store i32 0, i32* @g_18, align 4
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc21, %for.body5
  %tmp7 = load i32* @g_18, align 4
  %cmp8 = icmp slt i32 %tmp7, 8
  br i1 %cmp8, label %for.body10, label %for.end24

for.body10:                                       ; preds = %for.cond6
  store i32 0, i32* getelementptr inbounds ([9 x i32]* @g_19, i32 0, i64 5), align 4
  br label %for.cond11

for.cond11:                                       ; preds = %for.inc, %for.body10
  %tmp12 = load i32* getelementptr inbounds ([9 x i32]* @g_19, i32 0, i64 5), align 4
  %cmp13 = icmp slt i32 %tmp12, 1
  br i1 %cmp13, label %for.body15, label %for.end

for.body15:                                       ; preds = %for.cond11
  %tmp16 = load i32* getelementptr inbounds ([9 x i32]* @g_19, i32 0, i64 5), align 4
  %idxprom = sext i32 %tmp16 to i64
  %tmp17 = load i32* @g_18, align 4
  %idxprom18 = sext i32 %tmp17 to i64
  %arrayidx = getelementptr inbounds [8 x [1 x i32**]]* @g_12, i32 0, i64 %idxprom18
  %arrayidx19 = getelementptr inbounds [1 x i32**]* %arrayidx, i32 0, i64 %idxprom
  volatile store i32** @g_10, i32*** %arrayidx19, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body15
  %tmp20 = load i32* getelementptr inbounds ([9 x i32]* @g_19, i32 0, i64 5), align 4
  %add = add nsw i32 %tmp20, 1
  store i32 %add, i32* getelementptr inbounds ([9 x i32]* @g_19, i32 0, i64 5), align 4
  br label %for.cond11

for.end:                                          ; preds = %for.cond11
  br label %for.inc21

for.inc21:                                        ; preds = %for.end
  %tmp22 = load i32* @g_18, align 4
  %add23 = add nsw i32 %tmp22, 1
  store i32 %add23, i32* @g_18, align 4
  br label %for.cond6

for.end24:                                        ; preds = %for.cond6
  %tmp25 = load i32** @g_10, align 8
  %tmp26 = load i32* %tmp25
  %tmp27 = load i32** %p_16.addr, align 8
  %tmp28 = load i32* %tmp27
  %or = or i32 %tmp28, %tmp26
  store i32 %or, i32* %tmp27
  %tmp29 = load i32** %p_15.addr, align 8
  store i32* %tmp29, i32** %retval
  br label %return

for.inc30:                                        ; No predecessors!
  %tmp31 = load i16* @g_9, align 2
  %conv32 = sext i16 %tmp31 to i32
  %add33 = add nsw i32 %conv32, 1
  %conv34 = trunc i32 %add33 to i16
  store i16 %conv34, i16* @g_9, align 2
  br label %for.cond1

for.end35:                                        ; preds = %for.cond1
  br label %for.inc36

for.inc36:                                        ; preds = %for.end35
  %tmp37 = load i32* %p_17.addr, align 4
  %add38 = add i32 %tmp37, 4
  store i32 %add38, i32* %p_17.addr, align 4
  br label %for.cond

for.end39:                                        ; preds = %for.cond
  store i16 3, i16* @g_9, align 2
  br label %for.cond40

for.cond40:                                       ; preds = %for.inc57, %for.end39
  %tmp41 = load i16* @g_9, align 2
  %conv42 = sext i16 %tmp41 to i32
  %cmp43 = icmp slt i32 %conv42, 8
  br i1 %cmp43, label %for.body45, label %for.end62

for.body45:                                       ; preds = %for.cond40
  store i32 0, i32* %p_17.addr, align 4
  br label %for.cond46

for.cond46:                                       ; preds = %for.inc53, %for.body45
  %tmp47 = load i32* %p_17.addr, align 4
  %cmp48 = icmp ult i32 %tmp47, 1
  br i1 %cmp48, label %for.body50, label %for.end56

for.body50:                                       ; preds = %for.cond46
  %tmp51 = load i32* @g_11, align 4
  %tobool = icmp ne i32 %tmp51, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.body50
  br label %lbl_20

if.end:                                           ; preds = %for.body50
  %tmp52 = load i32** %p_16.addr, align 8
  store i32* %tmp52, i32** %retval
  br label %return

for.inc53:                                        ; No predecessors!
  %tmp54 = load i32* %p_17.addr, align 4
  %add55 = add i32 %tmp54, 1
  store i32 %add55, i32* %p_17.addr, align 4
  br label %for.cond46

for.end56:                                        ; preds = %for.cond46
  br label %for.inc57

for.inc57:                                        ; preds = %for.end56
  %tmp58 = load i16* @g_9, align 2
  %conv59 = sext i16 %tmp58 to i32
  %add60 = add nsw i32 %conv59, 1
  %conv61 = trunc i32 %add60 to i16
  store i16 %conv61, i16* @g_9, align 2
  br label %for.cond40

for.end62:                                        ; preds = %for.cond40
  %tmp63 = load i32** %p_16.addr, align 8
  %tmp64 = load i32* %tmp63
  %tobool65 = icmp ne i32 %tmp64, 0
  br i1 %tobool65, label %if.then66, label %if.else

if.then66:                                        ; preds = %for.end62
  store i8 4, i8* %l_28, align 1
  store i32 0, i32* %p_17.addr, align 4
  br label %for.cond68

for.cond68:                                       ; preds = %for.inc91, %if.then66
  %tmp69 = load i32* %p_17.addr, align 4
  %cmp70 = icmp ult i32 %tmp69, -6
  br i1 %cmp70, label %for.body72, label %for.end94

for.body72:                                       ; preds = %for.cond68
  store i32 1283171315, i32* %l_25, align 4
  %cmp74 = icmp ne i32** %p_15.addr, %p_15.addr
  br i1 %cmp74, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.body72
  %tmp76 = load i32** %p_15.addr, align 8
  %tmp77 = load i32* %tmp76
  %tmp78 = load i32* %l_25, align 4
  %call = call i32 @safe_add_func_int32_t_s_s(i32 %tmp77, i32 %tmp78)
  %tobool79 = icmp ne i32 %call, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.body72
  %0 = phi i1 [ false, %for.body72 ], [ %tobool79, %land.rhs ]
  %land.ext = zext i1 %0 to i32
  %conv80 = sext i32 %land.ext to i64
  %tmp81 = load i32** %p_15.addr, align 8
  %tmp82 = load i32* %tmp81
  %conv83 = sext i32 %tmp82 to i64
  %tmp84 = load i8* %l_28, align 1
  %conv85 = zext i8 %tmp84 to i64
  %call86 = call i64 @safe_add_func_uint64_t_u_u(i64 %conv83, i64 %conv85)
  %or87 = or i64 %conv80, %call86
  %tobool88 = icmp ne i64 %or87, 0
  %lnot = xor i1 %tobool88, true
  %lnot.ext = zext i1 %lnot to i32
  %tmp89 = load i32* %l_25, align 4
  %and = and i32 %lnot.ext, %tmp89
  %neg = xor i32 %and, -1
  %tmp90 = load i32** %p_15.addr, align 8
  store i32 %neg, i32* %tmp90
  br label %for.inc91

for.inc91:                                        ; preds = %land.end
  %tmp92 = load i32* %p_17.addr, align 4
  %call93 = call i32 @safe_add_func_uint32_t_u_u(i32 %tmp92, i32 3)
  store i32 %call93, i32* %p_17.addr, align 4
  br label %for.cond68

for.end94:                                        ; preds = %for.cond68
  br label %if.end126

if.else:                                          ; preds = %for.end62
  store i32 0, i32* %i97, align 4
  br label %for.cond100

for.cond100:                                      ; preds = %for.inc119, %if.else
  %tmp101 = load i32* %i97, align 4
  %cmp102 = icmp slt i32 %tmp101, 8
  br i1 %cmp102, label %for.body104, label %for.end122

for.body104:                                      ; preds = %for.cond100
  store i32 0, i32* %j99, align 4
  br label %for.cond105

for.cond105:                                      ; preds = %for.inc116, %for.body104
  %tmp106 = load i32* %j99, align 4
  %cmp107 = icmp slt i32 %tmp106, 8
  br i1 %cmp107, label %for.body109, label %for.end118

for.body109:                                      ; preds = %for.cond105
  %tmp110 = load i32* %j99, align 4
  %idxprom111 = sext i32 %tmp110 to i64
  %tmp112 = load i32* %i97, align 4
  %idxprom113 = sext i32 %tmp112 to i64
  %arrayidx114 = getelementptr inbounds [8 x [8 x i32*]]* %l_29, i32 0, i64 %idxprom113
  %arrayidx115 = getelementptr inbounds [8 x i32*]* %arrayidx114, i32 0, i64 %idxprom111
  store i32* @g_11, i32** %arrayidx115, align 8
  br label %for.inc116

for.inc116:                                       ; preds = %for.body109
  %tmp117 = load i32* %j99, align 4
  %inc = add nsw i32 %tmp117, 1
  store i32 %inc, i32* %j99, align 4
  br label %for.cond105

for.end118:                                       ; preds = %for.cond105
  br label %for.inc119

for.inc119:                                       ; preds = %for.end118
  %tmp120 = load i32* %i97, align 4
  %inc121 = add nsw i32 %tmp120, 1
  store i32 %inc121, i32* %i97, align 4
  br label %for.cond100

for.end122:                                       ; preds = %for.cond100
  %arrayidx123 = getelementptr inbounds [8 x [8 x i32*]]* %l_29, i32 0, i64 1
  %arrayidx124 = getelementptr inbounds [8 x i32*]* %arrayidx123, i32 0, i64 2
  %tmp125 = load i32** %arrayidx124, align 8
  store i32* %tmp125, i32** %retval
  br label %return

if.end126:                                        ; preds = %for.end94
  store i32 3, i32* @g_18, align 4
  br label %for.cond127

for.cond127:                                      ; preds = %for.inc138, %if.end126
  %tmp128 = load i32* @g_18, align 4
  %cmp129 = icmp slt i32 %tmp128, 9
  br i1 %cmp129, label %for.body131, label %for.end141

for.body131:                                      ; preds = %for.cond127
  store i32 -8, i32* %l_30, align 4
  %tmp133 = load i32* %l_30, align 4
  %tmp134 = load i32** %p_15.addr, align 8
  store i32 %tmp133, i32* %tmp134
  %tmp135 = load i32** @g_10, align 8
  %tmp136 = load i32* %tmp135
  %tmp137 = load i32** %p_16.addr, align 8
  store i32 %tmp136, i32* %tmp137
  br label %for.inc138

for.inc138:                                       ; preds = %for.body131
  %tmp139 = load i32* @g_18, align 4
  %add140 = add nsw i32 %tmp139, 5
  store i32 %add140, i32* @g_18, align 4
  br label %for.cond127

for.end141:                                       ; preds = %for.cond127
  %tmp142 = load i32* @g_18, align 4
  %rem = urem i32 %tmp142, 9
  %idxprom143 = zext i32 %rem to i64
  %arrayidx144 = getelementptr inbounds [9 x i32]* @g_19, i32 0, i64 %idxprom143
  store i32* %arrayidx144, i32** %retval
  br label %return

return:                                           ; preds = %for.end141, %for.end122, %if.end, %for.end24
  %1 = load i32** %retval
  ret i32* %1
}

define internal i32 @safe_add_func_int32_t_s_s(i32 %si1, i32 %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i32, align 4
  %si2.addr = alloca i32, align 4
  store i32 %si1, i32* %si1.addr, align 4
  store i32 %si2, i32* %si2.addr, align 4
  %tmp = load i32* %si1.addr, align 4
  %cmp = icmp sgt i32 %tmp, 0
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %tmp1 = load i32* %si2.addr, align 4
  %cmp2 = icmp sgt i32 %tmp1, 0
  br i1 %cmp2, label %land.lhs.true3, label %lor.lhs.false

land.lhs.true3:                                   ; preds = %land.lhs.true
  %tmp4 = load i32* %si1.addr, align 4
  %tmp5 = load i32* %si2.addr, align 4
  %sub = sub nsw i32 2147483647, %tmp5
  %cmp6 = icmp sgt i32 %tmp4, %sub
  br i1 %cmp6, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true3, %land.lhs.true, %entry
  %tmp7 = load i32* %si1.addr, align 4
  %cmp8 = icmp slt i32 %tmp7, 0
  br i1 %cmp8, label %land.lhs.true9, label %cond.false

land.lhs.true9:                                   ; preds = %lor.lhs.false
  %tmp10 = load i32* %si2.addr, align 4
  %cmp11 = icmp slt i32 %tmp10, 0
  br i1 %cmp11, label %land.lhs.true12, label %cond.false

land.lhs.true12:                                  ; preds = %land.lhs.true9
  %tmp13 = load i32* %si1.addr, align 4
  %tmp14 = load i32* %si2.addr, align 4
  %sub15 = sub nsw i32 -2147483648, %tmp14
  %cmp16 = icmp slt i32 %tmp13, %sub15
  br i1 %cmp16, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true12, %land.lhs.true3
  %tmp17 = load i32* %si1.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true12, %land.lhs.true9, %lor.lhs.false
  %tmp18 = load i32* %si1.addr, align 4
  %tmp19 = load i32* %si2.addr, align 4
  %add = add nsw i32 %tmp18, %tmp19
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %tmp17, %cond.true ], [ %add, %cond.false ]
  ret i32 %cond
}

define internal i64 @safe_add_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i64, align 8
  %ui2.addr = alloca i64, align 8
  store i64 %ui1, i64* %ui1.addr, align 8
  store i64 %ui2, i64* %ui2.addr, align 8
  %tmp = load i64* %ui1.addr, align 8
  %tmp1 = load i64* %ui2.addr, align 8
  %add = add i64 %tmp, %tmp1
  ret i64 %add
}

define internal i32 @safe_add_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i32, align 4
  %ui2.addr = alloca i32, align 4
  store i32 %ui1, i32* %ui1.addr, align 4
  store i32 %ui2, i32* %ui2.addr, align 4
  %tmp = load i32* %ui1.addr, align 4
  %tmp1 = load i32* %ui2.addr, align 4
  %add = add i32 %tmp, %tmp1
  ret i32 %add
}

define i32 @func_35(i16 zeroext %p_36) nounwind uwtable {
entry:
  %p_36.addr = alloca i16, align 2
  %l_43 = alloca i32, align 4
  %l_48 = alloca i32*, align 8
  store i16 %p_36, i16* %p_36.addr, align 2
  store i32 1647115108, i32* %l_43, align 4
  store i32* null, i32** %l_48, align 8
  %tmp = load i16* %p_36.addr, align 2
  %conv = trunc i16 %tmp to i8
  %call = call signext i8 @safe_lshift_func_int8_t_s_u(i8 signext %conv, i32 -7)
  %conv1 = sext i8 %call to i32
  %call2 = call i64 @safe_div_func_uint64_t_u_u(i64 1647115108, i64 1647115108)
  %tobool = icmp ne i64 %call2, 0
  br i1 %tobool, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %tmp3 = load i16* %p_36.addr, align 2
  %conv4 = zext i16 %tmp3 to i32
  %tobool5 = icmp ne i32 %conv4, 0
  br i1 %tobool5, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %lor.rhs
  %tmp6 = load i32** @g_10, align 8
  %tmp7 = load i32* %tmp6
  %tobool8 = icmp ne i32 %tmp7, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.rhs
  %0 = phi i1 [ false, %lor.rhs ], [ %tobool8, %land.rhs ]
  br label %lor.end

lor.end:                                          ; preds = %land.end, %entry
  %1 = phi i1 [ true, %entry ], [ %0, %land.end ]
  %lor.ext = zext i1 %1 to i32
  %cmp = icmp sgt i32 1647115108, %lor.ext
  %conv9 = zext i1 %cmp to i32
  %call10 = call zeroext i8 @safe_lshift_func_uint8_t_u_u(i8 zeroext 0, i32 %conv9)
  %conv11 = zext i8 %call10 to i16
  %tmp12 = load i16* %p_36.addr, align 2
  %conv13 = zext i16 %tmp12 to i64
  %call14 = call i64 @safe_div_func_uint64_t_u_u(i64 %conv13, i64 130151609)
  %or = or i64 %call14, 1647115108
  %conv15 = trunc i64 %or to i16
  %call16 = call zeroext i16 @safe_mod_func_uint16_t_u_u(i16 zeroext %conv11, i16 zeroext %conv15)
  %conv17 = zext i16 %call16 to i32
  %cmp18 = icmp sle i32 %conv1, %conv17
  %conv19 = zext i1 %cmp18 to i32
  %tmp20 = volatile load i32** @g_49, align 8
  %tmp21 = load i32* %tmp20
  %xor = xor i32 %tmp21, %conv19
  store i32 %xor, i32* %tmp20
  %tmp22 = load i16* %p_36.addr, align 2
  %conv23 = zext i16 %tmp22 to i32
  ret i32 %conv23
}

define internal signext i8 @safe_lshift_func_int8_t_s_u(i8 signext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i8, align 1
  %right.addr = alloca i32, align 4
  store i8 %left, i8* %left.addr, align 1
  store i32 %right, i32* %right.addr, align 4
  %tmp = load i8* %left.addr, align 1
  %conv = sext i8 %tmp to i32
  %cmp = icmp slt i32 %conv, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp2 = load i32* %right.addr, align 4
  %cmp3 = icmp uge i32 %tmp2, 32
  br i1 %cmp3, label %cond.true, label %lor.lhs.false5

lor.lhs.false5:                                   ; preds = %lor.lhs.false
  %tmp6 = load i8* %left.addr, align 1
  %conv7 = sext i8 %tmp6 to i32
  %tmp8 = load i32* %right.addr, align 4
  %shr = ashr i32 127, %tmp8
  %cmp9 = icmp sgt i32 %conv7, %shr
  br i1 %cmp9, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false5, %lor.lhs.false, %entry
  %tmp11 = load i8* %left.addr, align 1
  %conv12 = sext i8 %tmp11 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false5
  %tmp13 = load i8* %left.addr, align 1
  %conv14 = sext i8 %tmp13 to i32
  %tmp15 = load i32* %right.addr, align 4
  %shl = shl i32 %conv14, %tmp15
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv12, %cond.true ], [ %shl, %cond.false ]
  %conv16 = trunc i32 %cond to i8
  ret i8 %conv16
}

define internal zeroext i16 @safe_mod_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i16, align 2
  %ui2.addr = alloca i16, align 2
  store i16 %ui1, i16* %ui1.addr, align 2
  store i16 %ui2, i16* %ui2.addr, align 2
  %tmp = load i16* %ui2.addr, align 2
  %conv = zext i16 %tmp to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp2 = load i16* %ui1.addr, align 2
  %conv3 = zext i16 %tmp2 to i32
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp4 = load i16* %ui1.addr, align 2
  %conv5 = zext i16 %tmp4 to i32
  %tmp6 = load i16* %ui2.addr, align 2
  %conv7 = zext i16 %tmp6 to i32
  %rem = srem i32 %conv5, %conv7
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv3, %cond.true ], [ %rem, %cond.false ]
  %conv8 = trunc i32 %cond to i16
  ret i16 %conv8
}

define internal zeroext i8 @safe_lshift_func_uint8_t_u_u(i8 zeroext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i8, align 1
  %right.addr = alloca i32, align 4
  store i8 %left, i8* %left.addr, align 1
  store i32 %right, i32* %right.addr, align 4
  %tmp = load i32* %right.addr, align 4
  %cmp = icmp uge i32 %tmp, 32
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load i8* %left.addr, align 1
  %conv = zext i8 %tmp1 to i32
  %tmp2 = load i32* %right.addr, align 4
  %shr = ashr i32 255, %tmp2
  %cmp3 = icmp sgt i32 %conv, %shr
  br i1 %cmp3, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %entry
  %tmp5 = load i8* %left.addr, align 1
  %conv6 = zext i8 %tmp5 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %tmp7 = load i8* %left.addr, align 1
  %conv8 = zext i8 %tmp7 to i32
  %tmp9 = load i32* %right.addr, align 4
  %shl = shl i32 %conv8, %tmp9
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv6, %cond.true ], [ %shl, %cond.false ]
  %conv10 = trunc i32 %cond to i8
  ret i8 %conv10
}

define internal i64 @safe_div_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i64, align 8
  %ui2.addr = alloca i64, align 8
  store i64 %ui1, i64* %ui1.addr, align 8
  store i64 %ui2, i64* %ui2.addr, align 8
  %tmp = load i64* %ui2.addr, align 8
  %cmp = icmp eq i64 %tmp, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp1 = load i64* %ui1.addr, align 8
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp2 = load i64* %ui1.addr, align 8
  %tmp3 = load i64* %ui2.addr, align 8
  %div = udiv i64 %tmp2, %tmp3
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %tmp1, %cond.true ], [ %div, %cond.false ]
  ret i64 %cond
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %tmp = alloca %struct.S0, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  call void @func_1(%struct.S0* sret %tmp)
  %tmp1 = load i16* @g_9, align 2
  %conv = sext i16 %tmp1 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %tmp2 = load i32* @g_11, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* @g_18, align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = load i32* getelementptr inbounds ([9 x i32]* @g_19, i32 0, i64 0), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = load i32* getelementptr inbounds ([9 x i32]* @g_19, i32 0, i64 1), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %tmp10 = load i32* getelementptr inbounds ([9 x i32]* @g_19, i32 0, i64 2), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str5, i32 0, i32 0), i32 %tmp10)
  %tmp12 = load i32* getelementptr inbounds ([9 x i32]* @g_19, i32 0, i64 3), align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str6, i32 0, i32 0), i32 %tmp12)
  %tmp14 = load i32* getelementptr inbounds ([9 x i32]* @g_19, i32 0, i64 4), align 4
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str7, i32 0, i32 0), i32 %tmp14)
  %tmp16 = load i32* getelementptr inbounds ([9 x i32]* @g_19, i32 0, i64 5), align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str8, i32 0, i32 0), i32 %tmp16)
  %tmp18 = load i32* getelementptr inbounds ([9 x i32]* @g_19, i32 0, i64 6), align 4
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str9, i32 0, i32 0), i32 %tmp18)
  %tmp20 = load i32* getelementptr inbounds ([9 x i32]* @g_19, i32 0, i64 7), align 4
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str10, i32 0, i32 0), i32 %tmp20)
  %tmp22 = load i32* getelementptr inbounds ([9 x i32]* @g_19, i32 0, i64 8), align 4
  %call23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str11, i32 0, i32 0), i32 %tmp22)
  %tmp24 = load i32* getelementptr inbounds ([9 x i32]* @g_19, i32 0, i64 5), align 4
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str8, i32 0, i32 0), i32 %tmp24)
  %tmp26 = volatile load i32* getelementptr inbounds (%struct.S0* @g_59, i32 0, i32 0), align 4
  %call27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str12, i32 0, i32 0), i32 %tmp26)
  %tmp28 = load i16* getelementptr inbounds (%struct.S0* @g_59, i32 0, i32 1), align 2
  %conv29 = zext i16 %tmp28 to i32
  %call30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str13, i32 0, i32 0), i32 %conv29)
  %tmp31 = load i8* getelementptr inbounds (%struct.S0* @g_59, i32 0, i32 2), align 1
  %conv32 = zext i8 %tmp31 to i32
  %call33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str14, i32 0, i32 0), i32 %conv32)
  %tmp34 = load i32* getelementptr inbounds (%struct.S0* @g_59, i32 0, i32 3), align 4
  %call35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str15, i32 0, i32 0), i32 %tmp34)
  %tmp36 = volatile load i8* getelementptr inbounds (%struct.S0* @g_59, i32 0, i32 4), align 1
  %conv37 = zext i8 %tmp36 to i32
  %call38 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str16, i32 0, i32 0), i32 %conv37)
  %tmp39 = load i8* getelementptr inbounds (%struct.S0* @g_59, i32 0, i32 5), align 1
  %conv40 = sext i8 %tmp39 to i32
  %call41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str17, i32 0, i32 0), i32 %conv40)
  %tmp42 = load i16* getelementptr inbounds (%struct.S0* @g_59, i32 0, i32 6), align 2
  %conv43 = zext i16 %tmp42 to i32
  %call44 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str18, i32 0, i32 0), i32 %conv43)
  %tmp45 = load i32* getelementptr inbounds (%struct.S0* @g_59, i32 0, i32 7), align 4
  %call46 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str19, i32 0, i32 0), i32 %tmp45)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
