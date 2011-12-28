; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001343.c'
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
  %retval = alloca i8, align 1
  %l_2 = alloca [4 x [7 x [1 x [1 x i32]]]], align 16
  %l_10 = alloca i32*, align 8
  %l_20 = alloca i32, align 4
  %l_21 = alloca i16, align 2
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %l_7 = alloca i32**, align 8
  %l_9 = alloca i32*, align 8
  %l_8 = alloca [4 x [1 x i32**]], align 16
  %i56 = alloca i32, align 4
  %j58 = alloca i32, align 4
  %l_19 = alloca i32, align 4
  %l_14 = alloca i32, align 4
  %l_17 = alloca i32*, align 8
  store i32* @g_11, i32** %l_10, align 8
  store i32 2056334965, i32* %l_20, align 4
  store i16 -27884, i16* %l_21, align 2
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc32, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 4
  br i1 %cmp, label %for.body, label %for.end35

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc28, %for.body
  %tmp2 = load i32* %j, align 4
  %cmp3 = icmp slt i32 %tmp2, 7
  br i1 %cmp3, label %for.body4, label %for.end31

for.body4:                                        ; preds = %for.cond1
  store i32 0, i32* %k, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc24, %for.body4
  %tmp6 = load i32* %k, align 4
  %cmp7 = icmp slt i32 %tmp6, 1
  br i1 %cmp7, label %for.body8, label %for.end27

for.body8:                                        ; preds = %for.cond5
  store i32 0, i32* %l, align 4
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc, %for.body8
  %tmp10 = load i32* %l, align 4
  %cmp11 = icmp slt i32 %tmp10, 1
  br i1 %cmp11, label %for.body12, label %for.end

for.body12:                                       ; preds = %for.cond9
  %tmp13 = load i32* %l, align 4
  %idxprom = sext i32 %tmp13 to i64
  %tmp14 = load i32* %k, align 4
  %idxprom15 = sext i32 %tmp14 to i64
  %tmp16 = load i32* %j, align 4
  %idxprom17 = sext i32 %tmp16 to i64
  %tmp18 = load i32* %i, align 4
  %idxprom19 = sext i32 %tmp18 to i64
  %arrayidx = getelementptr inbounds [4 x [7 x [1 x [1 x i32]]]]* %l_2, i32 0, i64 %idxprom19
  %arrayidx20 = getelementptr inbounds [7 x [1 x [1 x i32]]]* %arrayidx, i32 0, i64 %idxprom17
  %arrayidx21 = getelementptr inbounds [1 x [1 x i32]]* %arrayidx20, i32 0, i64 %idxprom15
  %arrayidx22 = getelementptr inbounds [1 x i32]* %arrayidx21, i32 0, i64 %idxprom
  store i32 -862936225, i32* %arrayidx22, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body12
  %tmp23 = load i32* %l, align 4
  %inc = add nsw i32 %tmp23, 1
  store i32 %inc, i32* %l, align 4
  br label %for.cond9

for.end:                                          ; preds = %for.cond9
  br label %for.inc24

for.inc24:                                        ; preds = %for.end
  %tmp25 = load i32* %k, align 4
  %inc26 = add nsw i32 %tmp25, 1
  store i32 %inc26, i32* %k, align 4
  br label %for.cond5

for.end27:                                        ; preds = %for.cond5
  br label %for.inc28

for.inc28:                                        ; preds = %for.end27
  %tmp29 = load i32* %j, align 4
  %inc30 = add nsw i32 %tmp29, 1
  store i32 %inc30, i32* %j, align 4
  br label %for.cond1

for.end31:                                        ; preds = %for.cond1
  br label %for.inc32

for.inc32:                                        ; preds = %for.end31
  %tmp33 = load i32* %i, align 4
  %inc34 = add nsw i32 %tmp33, 1
  store i32 %inc34, i32* %i, align 4
  br label %for.cond

for.end35:                                        ; preds = %for.cond
  volatile store i32 2, i32* @g_3, align 4
  br label %for.cond36

for.cond36:                                       ; preds = %for.inc120, %for.end35
  %tmp37 = volatile load i32* @g_3, align 4
  %cmp38 = icmp slt i32 %tmp37, 4
  br i1 %cmp38, label %for.body39, label %for.end123

for.body39:                                       ; preds = %for.cond36
  store i32 3, i32* @g_4, align 4
  br label %for.cond40

for.cond40:                                       ; preds = %for.inc116, %for.body39
  %tmp41 = load i32* @g_4, align 4
  %cmp42 = icmp slt i32 %tmp41, 7
  br i1 %cmp42, label %for.body43, label %for.end119

for.body43:                                       ; preds = %for.cond40
  volatile store i32 0, i32* @g_5, align 4
  br label %for.cond44

for.cond44:                                       ; preds = %for.inc112, %for.body43
  %tmp45 = volatile load i32* @g_5, align 4
  %cmp46 = icmp slt i32 %tmp45, 1
  br i1 %cmp46, label %for.body47, label %for.end115

for.body47:                                       ; preds = %for.cond44
  volatile store i32 0, i32* @g_6, align 4
  br label %for.cond48

for.cond48:                                       ; preds = %for.inc109, %for.body47
  %tmp49 = volatile load i32* @g_6, align 4
  %cmp50 = icmp slt i32 %tmp49, 1
  br i1 %cmp50, label %for.body51, label %for.end111

for.body51:                                       ; preds = %for.cond48
  store i32** null, i32*** %l_7, align 8
  store i32* @g_6, i32** %l_9, align 8
  store i32 0, i32* %i56, align 4
  br label %for.cond59

for.cond59:                                       ; preds = %for.inc77, %for.body51
  %tmp60 = load i32* %i56, align 4
  %cmp61 = icmp slt i32 %tmp60, 4
  br i1 %cmp61, label %for.body62, label %for.end80

for.body62:                                       ; preds = %for.cond59
  store i32 0, i32* %j58, align 4
  br label %for.cond63

for.cond63:                                       ; preds = %for.inc73, %for.body62
  %tmp64 = load i32* %j58, align 4
  %cmp65 = icmp slt i32 %tmp64, 1
  br i1 %cmp65, label %for.body66, label %for.end76

for.body66:                                       ; preds = %for.cond63
  %tmp67 = load i32* %j58, align 4
  %idxprom68 = sext i32 %tmp67 to i64
  %tmp69 = load i32* %i56, align 4
  %idxprom70 = sext i32 %tmp69 to i64
  %arrayidx71 = getelementptr inbounds [4 x [1 x i32**]]* %l_8, i32 0, i64 %idxprom70
  %arrayidx72 = getelementptr inbounds [1 x i32**]* %arrayidx71, i32 0, i64 %idxprom68
  store i32** %l_9, i32*** %arrayidx72, align 8
  br label %for.inc73

for.inc73:                                        ; preds = %for.body66
  %tmp74 = load i32* %j58, align 4
  %inc75 = add nsw i32 %tmp74, 1
  store i32 %inc75, i32* %j58, align 4
  br label %for.cond63

for.end76:                                        ; preds = %for.cond63
  br label %for.inc77

for.inc77:                                        ; preds = %for.end76
  %tmp78 = load i32* %i56, align 4
  %inc79 = add nsw i32 %tmp78, 1
  store i32 %inc79, i32* %i56, align 4
  br label %for.cond59

for.end80:                                        ; preds = %for.cond59
  store i32* @g_5, i32** %l_10, align 8
  %tmp81 = load i32** %l_10, align 8
  %tmp82 = volatile load i32* %tmp81
  %tobool = icmp ne i32 %tmp82, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %for.end80
  store i32 2076750881, i32* %l_19, align 4
  volatile store i32 0, i32* @g_11, align 4
  br label %for.cond84

for.cond84:                                       ; preds = %for.inc90, %if.then
  %tmp85 = volatile load i32* @g_11, align 4
  %cmp86 = icmp sle i32 %tmp85, 0
  br i1 %cmp86, label %for.body87, label %for.end92

for.body87:                                       ; preds = %for.cond84
  store i32 -1, i32* %l_14, align 4
  %tmp89 = load i32* %l_14, align 4
  %conv = trunc i32 %tmp89 to i8
  store i8 %conv, i8* %retval
  br label %return

for.inc90:                                        ; No predecessors!
  %tmp91 = volatile load i32* @g_11, align 4
  %call = call i32 @safe_sub_func_int32_t_s_s(i32 %tmp91, i32 1)
  volatile store i32 %call, i32* @g_11, align 4
  br label %for.cond84

for.end92:                                        ; preds = %for.cond84
  volatile store i32 0, i32* @g_11, align 4
  br label %for.cond93

for.cond93:                                       ; preds = %for.inc104, %for.end92
  %tmp94 = volatile load i32* @g_11, align 4
  %cmp95 = icmp ne i32 %tmp94, 0
  br i1 %cmp95, label %for.body97, label %for.end107

for.body97:                                       ; preds = %for.cond93
  store i32* @g_18, i32** %l_17, align 8
  %tmp99 = volatile load i32* @g_6, align 4
  %tmp100 = load i32** %l_17, align 8
  %tmp101 = load i32* %tmp100
  %xor = xor i32 %tmp101, %tmp99
  store i32 %xor, i32* %tmp100
  %tmp102 = load i32* @g_18, align 4
  %conv103 = trunc i32 %tmp102 to i8
  store i8 %conv103, i8* %retval
  br label %return

for.inc104:                                       ; No predecessors!
  %tmp105 = volatile load i32* @g_11, align 4
  %call106 = call i32 @safe_add_func_int32_t_s_s(i32 %tmp105, i32 1)
  volatile store i32 %call106, i32* @g_11, align 4
  br label %for.cond93

for.end107:                                       ; preds = %for.cond93
  %tmp108 = load i32* %l_19, align 4
  store i32 %tmp108, i32* %l_20, align 4
  br label %if.end

if.else:                                          ; preds = %for.end80
  volatile store i32 1999738600, i32* @g_11, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end107
  br label %for.inc109

for.inc109:                                       ; preds = %if.end
  %tmp110 = volatile load i32* @g_6, align 4
  %add = add nsw i32 %tmp110, 1
  volatile store i32 %add, i32* @g_6, align 4
  br label %for.cond48

for.end111:                                       ; preds = %for.cond48
  br label %for.inc112

for.inc112:                                       ; preds = %for.end111
  %tmp113 = volatile load i32* @g_5, align 4
  %add114 = add nsw i32 %tmp113, 1
  volatile store i32 %add114, i32* @g_5, align 4
  br label %for.cond44

for.end115:                                       ; preds = %for.cond44
  br label %for.inc116

for.inc116:                                       ; preds = %for.end115
  %tmp117 = load i32* @g_4, align 4
  %add118 = add nsw i32 %tmp117, 1
  store i32 %add118, i32* @g_4, align 4
  br label %for.cond40

for.end119:                                       ; preds = %for.cond40
  br label %for.inc120

for.inc120:                                       ; preds = %for.end119
  %tmp121 = volatile load i32* @g_3, align 4
  %add122 = add nsw i32 %tmp121, 3
  volatile store i32 %add122, i32* @g_3, align 4
  br label %for.cond36

for.end123:                                       ; preds = %for.cond36
  %tmp124 = load i16* %l_21, align 2
  %conv125 = trunc i16 %tmp124 to i8
  store i8 %conv125, i8* %retval
  br label %return

return:                                           ; preds = %for.end123, %for.body97, %for.body87
  %0 = load i8* %retval
  ret i8 %0
}

define internal i32 @safe_sub_func_int32_t_s_s(i32 %si1, i32 %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i32, align 4
  %si2.addr = alloca i32, align 4
  store i32 %si1, i32* %si1.addr, align 4
  store i32 %si2, i32* %si2.addr, align 4
  %tmp = load i32* %si1.addr, align 4
  %tmp1 = load i32* %si2.addr, align 4
  %xor = xor i32 %tmp, %tmp1
  %tmp2 = load i32* %si1.addr, align 4
  %tmp3 = load i32* %si1.addr, align 4
  %tmp4 = load i32* %si2.addr, align 4
  %xor5 = xor i32 %tmp3, %tmp4
  %and = and i32 %xor5, -2147483648
  %xor6 = xor i32 %tmp2, %and
  %tmp7 = load i32* %si2.addr, align 4
  %sub = sub nsw i32 %xor6, %tmp7
  %tmp8 = load i32* %si2.addr, align 4
  %xor9 = xor i32 %sub, %tmp8
  %and10 = and i32 %xor, %xor9
  %cmp = icmp slt i32 %and10, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp11 = load i32* %si1.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp12 = load i32* %si1.addr, align 4
  %tmp13 = load i32* %si2.addr, align 4
  %sub14 = sub nsw i32 %tmp12, %tmp13
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %tmp11, %cond.true ], [ %sub14, %cond.false ]
  ret i32 %cond
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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call signext i8 @func_1()
  %tmp = volatile load i32* @g_3, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* @g_4, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = volatile load i32* @g_5, align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = volatile load i32* @g_6, align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = volatile load i32* @g_11, align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %tmp10 = load i32* @g_18, align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str5, i32 0, i32 0), i32 %tmp10)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
