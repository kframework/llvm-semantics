; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001487.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_12 = constant i32 -2, align 4
@g_14 = global [9 x i32] [i32 -75465478, i32 -75465478, i32 -75465478, i32 -75465478, i32 -75465478, i32 -75465478, i32 -75465478, i32 -75465478, i32 -75465478], align 16
@g_22 = global [9 x [5 x i32*]] zeroinitializer, align 16
@g_24 = global i32 242716774, align 4
@g_23 = global i32* @g_24, align 8
@g_49 = global i32* null, align 8
@g_48 = global [7 x i32**] [i32** @g_49, i32** @g_49, i32** @g_49, i32** @g_49, i32** @g_49, i32** @g_49, i32** @g_49], align 16
@g_50 = global i32** null, align 8
@g_51 = global [9 x [1 x [6 x [1 x [1 x [1 x i32**]]]]]] [[1 x [6 x [1 x [1 x [1 x i32**]]]]] [[6 x [1 x [1 x [1 x i32**]]]] [[1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]]]], [1 x [6 x [1 x [1 x [1 x i32**]]]]] [[6 x [1 x [1 x [1 x i32**]]]] [[1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]]]], [1 x [6 x [1 x [1 x [1 x i32**]]]]] [[6 x [1 x [1 x [1 x i32**]]]] [[1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]]]], [1 x [6 x [1 x [1 x [1 x i32**]]]]] [[6 x [1 x [1 x [1 x i32**]]]] [[1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]]]], [1 x [6 x [1 x [1 x [1 x i32**]]]]] [[6 x [1 x [1 x [1 x i32**]]]] [[1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]]]], [1 x [6 x [1 x [1 x [1 x i32**]]]]] [[6 x [1 x [1 x [1 x i32**]]]] [[1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]]]], [1 x [6 x [1 x [1 x [1 x i32**]]]]] [[6 x [1 x [1 x [1 x i32**]]]] [[1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]]]], [1 x [6 x [1 x [1 x [1 x i32**]]]]] [[6 x [1 x [1 x [1 x i32**]]]] [[1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]]]], [1 x [6 x [1 x [1 x [1 x i32**]]]]] [[6 x [1 x [1 x [1 x i32**]]]] [[1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]]]]], align 16
@g_52 = global i32** null, align 8
@.str = private unnamed_addr constant [20 x i8] c"checksum g_12 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [23 x i8] c"checksum g_14[0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [23 x i8] c"checksum g_14[1] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"checksum g_14[2] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [23 x i8] c"checksum g_14[3] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [23 x i8] c"checksum g_14[4] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [23 x i8] c"checksum g_14[5] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [23 x i8] c"checksum g_14[6] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [23 x i8] c"checksum g_14[7] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [23 x i8] c"checksum g_14[8] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [20 x i8] c"checksum g_24 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
entry:
  %retval = alloca i8, align 1
  %l_13 = alloca i16, align 2
  %l_60 = alloca i32, align 4
  %l_63 = alloca i64, align 8
  %l_26 = alloca i32, align 4
  %l_30 = alloca i32, align 4
  %l_47 = alloca [5 x [6 x i32*]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %l_21 = alloca [9 x [1 x [10 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]]], align 16
  %l_35 = alloca i32*, align 8
  %l_53 = alloca i32**, align 8
  %i42 = alloca i32, align 4
  %j44 = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %m = alloca i32, align 4
  %n = alloca i32, align 4
  %o = alloca i32, align 4
  %p = alloca i32, align 4
  %l_25 = alloca [3 x i32*], align 16
  %l_27 = alloca i16, align 2
  %i192 = alloca i32, align 4
  store i16 -3, i16* %l_13, align 2
  store i32 1, i32* %l_60, align 4
  store i64 -3470062506014656151, i64* %l_63, align 8
  %tmp = load i16* %l_13, align 2
  %conv = sext i16 %tmp to i32
  %call = call i32 @func_7(i8 signext -2, i8 zeroext -2, i32 %conv)
  %neg = xor i32 %call, -1
  %tmp1 = load i16* %l_13, align 2
  %conv2 = sext i16 %tmp1 to i32
  %call3 = call i32 @func_7(i8 signext -2, i8 zeroext -2, i32 %conv2)
  %or = or i32 %call3, -2
  %cmp = icmp ult i32 %neg, %or
  %conv4 = zext i1 %cmp to i32
  %conv5 = trunc i32 %conv4 to i8
  %call6 = call signext i8 @safe_add_func_int8_t_s_s(i8 signext %conv5, i8 signext -2)
  %conv7 = sext i8 %call6 to i16
  %call8 = call zeroext i16 @safe_rshift_func_uint16_t_u_s(i16 zeroext %conv7, i32 -1139773754)
  %call9 = call zeroext i16 @safe_unary_minus_func_uint16_t_u(i16 zeroext %call8)
  %tobool = icmp ne i16 %call9, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i8 -2, i8* %retval
  br label %return

if.else:                                          ; preds = %entry
  store i32 1321722648, i32* %l_26, align 4
  store i32 1098880481, i32* %l_30, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc28, %if.else
  %tmp15 = load i32* %i, align 4
  %cmp16 = icmp slt i32 %tmp15, 5
  br i1 %cmp16, label %for.body, label %for.end31

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond18

for.cond18:                                       ; preds = %for.inc, %for.body
  %tmp19 = load i32* %j, align 4
  %cmp20 = icmp slt i32 %tmp19, 6
  br i1 %cmp20, label %for.body22, label %for.end

for.body22:                                       ; preds = %for.cond18
  %tmp23 = load i32* %j, align 4
  %idxprom = sext i32 %tmp23 to i64
  %tmp24 = load i32* %i, align 4
  %idxprom25 = sext i32 %tmp24 to i64
  %arrayidx = getelementptr inbounds [5 x [6 x i32*]]* %l_47, i32 0, i64 %idxprom25
  %arrayidx26 = getelementptr inbounds [6 x i32*]* %arrayidx, i32 0, i64 %idxprom
  store i32* @g_24, i32** %arrayidx26, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body22
  %tmp27 = load i32* %j, align 4
  %inc = add nsw i32 %tmp27, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond18

for.end:                                          ; preds = %for.cond18
  br label %for.inc28

for.inc28:                                        ; preds = %for.end
  %tmp29 = load i32* %i, align 4
  %inc30 = add nsw i32 %tmp29, 1
  store i32 %inc30, i32* %i, align 4
  br label %for.cond

for.end31:                                        ; preds = %for.cond
  store i16 2, i16* %l_13, align 2
  br label %for.cond32

for.cond32:                                       ; preds = %for.inc241, %for.end31
  %tmp33 = load i16* %l_13, align 2
  %conv34 = sext i16 %tmp33 to i32
  %cmp35 = icmp slt i32 %conv34, 9
  br i1 %cmp35, label %for.body37, label %for.end245

for.body37:                                       ; preds = %for.cond32
  store i32* %l_26, i32** %l_35, align 8
  store i32** %l_35, i32*** %l_53, align 8
  store i32 0, i32* %i42, align 4
  br label %for.cond51

for.cond51:                                       ; preds = %for.inc143, %for.body37
  %tmp52 = load i32* %i42, align 4
  %cmp53 = icmp slt i32 %tmp52, 9
  br i1 %cmp53, label %for.body55, label %for.end146

for.body55:                                       ; preds = %for.cond51
  store i32 0, i32* %j44, align 4
  br label %for.cond56

for.cond56:                                       ; preds = %for.inc139, %for.body55
  %tmp57 = load i32* %j44, align 4
  %cmp58 = icmp slt i32 %tmp57, 1
  br i1 %cmp58, label %for.body60, label %for.end142

for.body60:                                       ; preds = %for.cond56
  store i32 0, i32* %k, align 4
  br label %for.cond61

for.cond61:                                       ; preds = %for.inc135, %for.body60
  %tmp62 = load i32* %k, align 4
  %cmp63 = icmp slt i32 %tmp62, 10
  br i1 %cmp63, label %for.body65, label %for.end138

for.body65:                                       ; preds = %for.cond61
  store i32 0, i32* %l, align 4
  br label %for.cond66

for.cond66:                                       ; preds = %for.inc131, %for.body65
  %tmp67 = load i32* %l, align 4
  %cmp68 = icmp slt i32 %tmp67, 1
  br i1 %cmp68, label %for.body70, label %for.end134

for.body70:                                       ; preds = %for.cond66
  store i32 0, i32* %m, align 4
  br label %for.cond71

for.cond71:                                       ; preds = %for.inc127, %for.body70
  %tmp72 = load i32* %m, align 4
  %cmp73 = icmp slt i32 %tmp72, 1
  br i1 %cmp73, label %for.body75, label %for.end130

for.body75:                                       ; preds = %for.cond71
  store i32 0, i32* %n, align 4
  br label %for.cond76

for.cond76:                                       ; preds = %for.inc123, %for.body75
  %tmp77 = load i32* %n, align 4
  %cmp78 = icmp slt i32 %tmp77, 1
  br i1 %cmp78, label %for.body80, label %for.end126

for.body80:                                       ; preds = %for.cond76
  store i32 0, i32* %o, align 4
  br label %for.cond81

for.cond81:                                       ; preds = %for.inc119, %for.body80
  %tmp82 = load i32* %o, align 4
  %cmp83 = icmp slt i32 %tmp82, 1
  br i1 %cmp83, label %for.body85, label %for.end122

for.body85:                                       ; preds = %for.cond81
  store i32 0, i32* %p, align 4
  br label %for.cond86

for.cond86:                                       ; preds = %for.inc115, %for.body85
  %tmp87 = load i32* %p, align 4
  %cmp88 = icmp slt i32 %tmp87, 1
  br i1 %cmp88, label %for.body90, label %for.end118

for.body90:                                       ; preds = %for.cond86
  %tmp91 = load i32* %p, align 4
  %idxprom92 = sext i32 %tmp91 to i64
  %tmp93 = load i32* %o, align 4
  %idxprom94 = sext i32 %tmp93 to i64
  %tmp95 = load i32* %n, align 4
  %idxprom96 = sext i32 %tmp95 to i64
  %tmp97 = load i32* %m, align 4
  %idxprom98 = sext i32 %tmp97 to i64
  %tmp99 = load i32* %l, align 4
  %idxprom100 = sext i32 %tmp99 to i64
  %tmp101 = load i32* %k, align 4
  %idxprom102 = sext i32 %tmp101 to i64
  %tmp103 = load i32* %j44, align 4
  %idxprom104 = sext i32 %tmp103 to i64
  %tmp105 = load i32* %i42, align 4
  %idxprom106 = sext i32 %tmp105 to i64
  %arrayidx107 = getelementptr inbounds [9 x [1 x [10 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]]]* %l_21, i32 0, i64 %idxprom106
  %arrayidx108 = getelementptr inbounds [1 x [10 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]]* %arrayidx107, i32 0, i64 %idxprom104
  %arrayidx109 = getelementptr inbounds [10 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]* %arrayidx108, i32 0, i64 %idxprom102
  %arrayidx110 = getelementptr inbounds [1 x [1 x [1 x [1 x [1 x i32]]]]]* %arrayidx109, i32 0, i64 %idxprom100
  %arrayidx111 = getelementptr inbounds [1 x [1 x [1 x [1 x i32]]]]* %arrayidx110, i32 0, i64 %idxprom98
  %arrayidx112 = getelementptr inbounds [1 x [1 x [1 x i32]]]* %arrayidx111, i32 0, i64 %idxprom96
  %arrayidx113 = getelementptr inbounds [1 x [1 x i32]]* %arrayidx112, i32 0, i64 %idxprom94
  %arrayidx114 = getelementptr inbounds [1 x i32]* %arrayidx113, i32 0, i64 %idxprom92
  store i32 2044695681, i32* %arrayidx114, align 4
  br label %for.inc115

for.inc115:                                       ; preds = %for.body90
  %tmp116 = load i32* %p, align 4
  %inc117 = add nsw i32 %tmp116, 1
  store i32 %inc117, i32* %p, align 4
  br label %for.cond86

for.end118:                                       ; preds = %for.cond86
  br label %for.inc119

for.inc119:                                       ; preds = %for.end118
  %tmp120 = load i32* %o, align 4
  %inc121 = add nsw i32 %tmp120, 1
  store i32 %inc121, i32* %o, align 4
  br label %for.cond81

for.end122:                                       ; preds = %for.cond81
  br label %for.inc123

for.inc123:                                       ; preds = %for.end122
  %tmp124 = load i32* %n, align 4
  %inc125 = add nsw i32 %tmp124, 1
  store i32 %inc125, i32* %n, align 4
  br label %for.cond76

for.end126:                                       ; preds = %for.cond76
  br label %for.inc127

for.inc127:                                       ; preds = %for.end126
  %tmp128 = load i32* %m, align 4
  %inc129 = add nsw i32 %tmp128, 1
  store i32 %inc129, i32* %m, align 4
  br label %for.cond71

for.end130:                                       ; preds = %for.cond71
  br label %for.inc131

for.inc131:                                       ; preds = %for.end130
  %tmp132 = load i32* %l, align 4
  %inc133 = add nsw i32 %tmp132, 1
  store i32 %inc133, i32* %l, align 4
  br label %for.cond66

for.end134:                                       ; preds = %for.cond66
  br label %for.inc135

for.inc135:                                       ; preds = %for.end134
  %tmp136 = load i32* %k, align 4
  %inc137 = add nsw i32 %tmp136, 1
  store i32 %inc137, i32* %k, align 4
  br label %for.cond61

for.end138:                                       ; preds = %for.cond61
  br label %for.inc139

for.inc139:                                       ; preds = %for.end138
  %tmp140 = load i32* %j44, align 4
  %inc141 = add nsw i32 %tmp140, 1
  store i32 %inc141, i32* %j44, align 4
  br label %for.cond56

for.end142:                                       ; preds = %for.cond56
  br label %for.inc143

for.inc143:                                       ; preds = %for.end142
  %tmp144 = load i32* %i42, align 4
  %inc145 = add nsw i32 %tmp144, 1
  store i32 %inc145, i32* %i42, align 4
  br label %for.cond51

for.end146:                                       ; preds = %for.cond51
  %tmp147 = load i32* getelementptr inbounds ([9 x i32]* @g_14, i32 0, i64 7), align 4
  %tmp148 = load i16* %l_13, align 2
  %conv149 = zext i16 %tmp148 to i32
  %rem = srem i32 %conv149, 9
  %idxprom150 = sext i32 %rem to i64
  %arrayidx151 = getelementptr inbounds [9 x i32]* @g_14, i32 0, i64 %idxprom150
  %tmp152 = load i32* %arrayidx151, align 4
  %or153 = or i32 %tmp147, %tmp152
  %tmp154 = load i16* %l_13, align 2
  %conv155 = trunc i16 %tmp154 to i8
  %tmp156 = load i32* getelementptr inbounds ([9 x i32]* @g_14, i32 0, i64 5), align 4
  %xor = xor i32 -2, %tmp156
  %call157 = call zeroext i8 @safe_rshift_func_uint8_t_u_s(i8 zeroext %conv155, i32 %xor)
  %conv158 = zext i8 %call157 to i16
  %tmp159 = load i16* %l_13, align 2
  %conv160 = zext i16 %tmp159 to i32
  %rem161 = srem i32 %conv160, 9
  %idxprom162 = sext i32 %rem161 to i64
  %arrayidx163 = getelementptr inbounds [9 x i32]* @g_14, i32 0, i64 %idxprom162
  %tmp164 = load i32* %arrayidx163, align 4
  %conv165 = trunc i32 %tmp164 to i16
  %call166 = call signext i16 @safe_mod_func_int16_t_s_s(i16 signext %conv158, i16 signext %conv165)
  %conv167 = sext i16 %call166 to i32
  %arrayidx168 = getelementptr inbounds [9 x [1 x [10 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]]]* %l_21, i32 0, i64 1
  %arrayidx169 = getelementptr inbounds [1 x [10 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]]* %arrayidx168, i32 0, i64 0
  %arrayidx170 = getelementptr inbounds [10 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]* %arrayidx169, i32 0, i64 9
  %arrayidx171 = getelementptr inbounds [1 x [1 x [1 x [1 x [1 x i32]]]]]* %arrayidx170, i32 0, i64 0
  %arrayidx172 = getelementptr inbounds [1 x [1 x [1 x [1 x i32]]]]* %arrayidx171, i32 0, i64 0
  %arrayidx173 = getelementptr inbounds [1 x [1 x [1 x i32]]]* %arrayidx172, i32 0, i64 0
  %arrayidx174 = getelementptr inbounds [1 x [1 x i32]]* %arrayidx173, i32 0, i64 0
  %arrayidx175 = getelementptr inbounds [1 x i32]* %arrayidx174, i32 0, i64 0
  %tmp176 = load i32* %arrayidx175, align 4
  %cmp177 = icmp ne i32 %conv167, %tmp176
  %conv178 = zext i1 %cmp177 to i32
  %conv179 = trunc i32 %conv178 to i8
  %tmp180 = load i32* getelementptr inbounds ([9 x i32]* @g_14, i32 0, i64 3), align 4
  %call181 = call zeroext i8 @safe_rshift_func_uint8_t_u_s(i8 zeroext %conv179, i32 %tmp180)
  %conv182 = zext i8 %call181 to i32
  %cmp183 = icmp sgt i32 %or153, %conv182
  br i1 %cmp183, label %if.then185, label %if.else188

if.then185:                                       ; preds = %for.end146
  %tmp186 = load i16* %l_13, align 2
  %conv187 = trunc i16 %tmp186 to i8
  store i8 %conv187, i8* %retval
  br label %return

if.else188:                                       ; preds = %for.end146
  store i16 23165, i16* %l_27, align 2
  store i32 0, i32* %i192, align 4
  br label %for.cond193

for.cond193:                                      ; preds = %for.inc209, %if.else188
  %tmp194 = load i32* %i192, align 4
  %cmp195 = icmp slt i32 %tmp194, 3
  br i1 %cmp195, label %for.body197, label %for.end212

for.body197:                                      ; preds = %for.cond193
  %arrayidx198 = getelementptr inbounds [9 x [1 x [10 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]]]* %l_21, i32 0, i64 8
  %arrayidx199 = getelementptr inbounds [1 x [10 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]]* %arrayidx198, i32 0, i64 0
  %arrayidx200 = getelementptr inbounds [10 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]* %arrayidx199, i32 0, i64 4
  %arrayidx201 = getelementptr inbounds [1 x [1 x [1 x [1 x [1 x i32]]]]]* %arrayidx200, i32 0, i64 0
  %arrayidx202 = getelementptr inbounds [1 x [1 x [1 x [1 x i32]]]]* %arrayidx201, i32 0, i64 0
  %arrayidx203 = getelementptr inbounds [1 x [1 x [1 x i32]]]* %arrayidx202, i32 0, i64 0
  %arrayidx204 = getelementptr inbounds [1 x [1 x i32]]* %arrayidx203, i32 0, i64 0
  %arrayidx205 = getelementptr inbounds [1 x i32]* %arrayidx204, i32 0, i64 0
  %tmp206 = load i32* %i192, align 4
  %idxprom207 = sext i32 %tmp206 to i64
  %arrayidx208 = getelementptr inbounds [3 x i32*]* %l_25, i32 0, i64 %idxprom207
  store i32* %arrayidx205, i32** %arrayidx208, align 8
  br label %for.inc209

for.inc209:                                       ; preds = %for.body197
  %tmp210 = load i32* %i192, align 4
  %inc211 = add nsw i32 %tmp210, 1
  store i32 %inc211, i32* %i192, align 4
  br label %for.cond193

for.end212:                                       ; preds = %for.cond193
  %tmp213 = load i16* %l_13, align 2
  %conv214 = zext i16 %tmp213 to i32
  %rem215 = srem i32 %conv214, 9
  %idxprom216 = sext i32 %rem215 to i64
  %arrayidx217 = getelementptr inbounds [9 x i32]* @g_14, i32 0, i64 %idxprom216
  %tmp218 = load i32* %arrayidx217, align 4
  %tmp219 = volatile load i32** @g_23, align 8
  %tmp220 = load i32* %tmp219
  %xor221 = xor i32 %tmp220, %tmp218
  store i32 %xor221, i32* %tmp219
  %tmp222 = load i16* %l_13, align 2
  %conv223 = sext i16 %tmp222 to i32
  store i32 %conv223, i32* %l_26, align 4
  %tmp224 = load i16* %l_27, align 2
  %tobool225 = icmp ne i16 %tmp224, 0
  br i1 %tobool225, label %if.then226, label %if.end

if.then226:                                       ; preds = %for.end212
  br label %for.end245

if.end:                                           ; preds = %for.end212
  %arrayidx227 = getelementptr inbounds [9 x [1 x [10 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]]]* %l_21, i32 0, i64 1
  %arrayidx228 = getelementptr inbounds [1 x [10 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]]* %arrayidx227, i32 0, i64 0
  %arrayidx229 = getelementptr inbounds [10 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]* %arrayidx228, i32 0, i64 9
  %arrayidx230 = getelementptr inbounds [1 x [1 x [1 x [1 x [1 x i32]]]]]* %arrayidx229, i32 0, i64 0
  %arrayidx231 = getelementptr inbounds [1 x [1 x [1 x [1 x i32]]]]* %arrayidx230, i32 0, i64 0
  %arrayidx232 = getelementptr inbounds [1 x [1 x [1 x i32]]]* %arrayidx231, i32 0, i64 0
  %arrayidx233 = getelementptr inbounds [1 x [1 x i32]]* %arrayidx232, i32 0, i64 0
  %arrayidx234 = getelementptr inbounds [1 x i32]* %arrayidx233, i32 0, i64 0
  %tmp235 = load i32* %arrayidx234, align 4
  %tmp236 = load i16* %l_13, align 2
  %conv237 = sext i16 %tmp236 to i32
  %call238 = call signext i8 @safe_rshift_func_int8_t_s_u(i8 signext -88, i32 %conv237)
  %conv239 = sext i8 %call238 to i32
  %and = and i32 %tmp235, %conv239
  store i32 %and, i32* %l_30, align 4
  br label %if.end240

if.end240:                                        ; preds = %if.end
  br label %for.inc241

for.inc241:                                       ; preds = %if.end240
  %tmp242 = load i16* %l_13, align 2
  %conv243 = sext i16 %tmp242 to i32
  %add = add nsw i32 %conv243, 7
  %conv244 = trunc i32 %add to i16
  store i16 %conv244, i16* %l_13, align 2
  br label %for.cond32

for.end245:                                       ; preds = %if.then226, %for.cond32
  store i32 0, i32* %l_26, align 4
  br label %for.cond246

for.cond246:                                      ; preds = %for.inc255, %for.end245
  %tmp247 = load i32* %l_26, align 4
  %cmp248 = icmp eq i32 %tmp247, 2
  br i1 %cmp248, label %for.body250, label %for.end260

for.body250:                                      ; preds = %for.cond246
  %tmp251 = volatile load i32** @g_23, align 8
  %tmp252 = load i32* %tmp251
  store i32 %tmp252, i32* %l_60, align 4
  %tmp253 = load i32* getelementptr inbounds ([9 x i32]* @g_14, i32 0, i64 7), align 4
  %conv254 = trunc i32 %tmp253 to i8
  store i8 %conv254, i8* %retval
  br label %return

for.inc255:                                       ; No predecessors!
  %tmp256 = load i32* %l_26, align 4
  %conv257 = sext i32 %tmp256 to i64
  %call258 = call i64 @safe_add_func_uint64_t_u_u(i64 %conv257, i64 1)
  %conv259 = trunc i64 %call258 to i32
  store i32 %conv259, i32* %l_26, align 4
  br label %for.cond246

for.end260:                                       ; preds = %for.cond246
  %tmp261 = volatile load i32** @g_23, align 8
  %tmp262 = load i32* %tmp261
  %conv263 = trunc i32 %tmp262 to i8
  %call264 = call signext i8 @safe_rshift_func_int8_t_s_s(i8 signext %conv263, i32 -1223923600)
  %conv265 = sext i8 %call264 to i64
  store i64 %conv265, i64* %l_63, align 8
  br label %if.end266

if.end266:                                        ; preds = %for.end260
  %tmp267 = load i64* %l_63, align 8
  %conv268 = trunc i64 %tmp267 to i8
  store i8 %conv268, i8* %retval
  br label %return

return:                                           ; preds = %if.end266, %for.body250, %if.then185, %if.then
  %0 = load i8* %retval
  ret i8 %0
}

define internal zeroext i16 @safe_unary_minus_func_uint16_t_u(i16 zeroext %ui) nounwind uwtable {
entry:
  %ui.addr = alloca i16, align 2
  store i16 %ui, i16* %ui.addr, align 2
  %tmp = load i16* %ui.addr, align 2
  %conv = zext i16 %tmp to i32
  %sub = sub nsw i32 0, %conv
  %conv1 = trunc i32 %sub to i16
  ret i16 %conv1
}

define internal zeroext i16 @safe_rshift_func_uint16_t_u_s(i16 zeroext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i16, align 2
  %right.addr = alloca i32, align 4
  store i16 %left, i16* %left.addr, align 2
  store i32 %right, i32* %right.addr, align 4
  %tmp = load i32* %right.addr, align 4
  %cmp = icmp slt i32 %tmp, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load i32* %right.addr, align 4
  %cmp2 = icmp sge i32 %tmp1, 32
  br i1 %cmp2, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %entry
  %tmp3 = load i16* %left.addr, align 2
  %conv = zext i16 %tmp3 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %tmp4 = load i16* %left.addr, align 2
  %conv5 = zext i16 %tmp4 to i32
  %tmp6 = load i32* %right.addr, align 4
  %shr = ashr i32 %conv5, %tmp6
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv, %cond.true ], [ %shr, %cond.false ]
  %conv7 = trunc i32 %cond to i16
  ret i16 %conv7
}

define internal signext i8 @safe_add_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i8, align 1
  %si2.addr = alloca i8, align 1
  store i8 %si1, i8* %si1.addr, align 1
  store i8 %si2, i8* %si2.addr, align 1
  %tmp = load i8* %si1.addr, align 1
  %conv = sext i8 %tmp to i32
  %tmp1 = load i8* %si2.addr, align 1
  %conv2 = sext i8 %tmp1 to i32
  %add = add nsw i32 %conv, %conv2
  %conv3 = trunc i32 %add to i8
  ret i8 %conv3
}

define i32 @func_7(i8 signext %p_8, i8 zeroext %p_9, i32 %p_10) nounwind uwtable {
entry:
  %p_8.addr = alloca i8, align 1
  %p_9.addr = alloca i8, align 1
  %p_10.addr = alloca i32, align 4
  %l_11 = alloca i16, align 2
  store i8 %p_8, i8* %p_8.addr, align 1
  store i8 %p_9, i8* %p_9.addr, align 1
  store i32 %p_10, i32* %p_10.addr, align 4
  store i16 0, i16* %l_11, align 2
  %tmp = load i16* %l_11, align 2
  %conv = sext i16 %tmp to i32
  ret i32 %conv
}

define internal zeroext i8 @safe_rshift_func_uint8_t_u_s(i8 zeroext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i8, align 1
  %right.addr = alloca i32, align 4
  store i8 %left, i8* %left.addr, align 1
  store i32 %right, i32* %right.addr, align 4
  %tmp = load i32* %right.addr, align 4
  %cmp = icmp slt i32 %tmp, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load i32* %right.addr, align 4
  %cmp2 = icmp sge i32 %tmp1, 32
  br i1 %cmp2, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %entry
  %tmp3 = load i8* %left.addr, align 1
  %conv = zext i8 %tmp3 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %tmp4 = load i8* %left.addr, align 1
  %conv5 = zext i8 %tmp4 to i32
  %tmp6 = load i32* %right.addr, align 4
  %shr = ashr i32 %conv5, %tmp6
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv, %cond.true ], [ %shr, %cond.false ]
  %conv7 = trunc i32 %cond to i8
  ret i8 %conv7
}

define internal signext i16 @safe_mod_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i16, align 2
  %si2.addr = alloca i16, align 2
  store i16 %si1, i16* %si1.addr, align 2
  store i16 %si2, i16* %si2.addr, align 2
  %tmp = load i16* %si2.addr, align 2
  %conv = sext i16 %tmp to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp2 = load i16* %si1.addr, align 2
  %conv3 = sext i16 %tmp2 to i32
  %cmp4 = icmp eq i32 %conv3, -32768
  br i1 %cmp4, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %lor.lhs.false
  %tmp6 = load i16* %si2.addr, align 2
  %conv7 = sext i16 %tmp6 to i32
  %cmp8 = icmp eq i32 %conv7, -1
  br i1 %cmp8, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true, %entry
  %tmp10 = load i16* %si1.addr, align 2
  %conv11 = sext i16 %tmp10 to i32
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %lor.lhs.false
  %tmp12 = load i16* %si1.addr, align 2
  %conv13 = sext i16 %tmp12 to i32
  %tmp14 = load i16* %si2.addr, align 2
  %conv15 = sext i16 %tmp14 to i32
  %rem = srem i32 %conv13, %conv15
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv11, %cond.true ], [ %rem, %cond.false ]
  %conv16 = trunc i32 %cond to i16
  ret i16 %conv16
}

define internal signext i8 @safe_rshift_func_int8_t_s_u(i8 signext %left, i32 %right) nounwind uwtable {
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
  br i1 %cmp3, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %entry
  %tmp5 = load i8* %left.addr, align 1
  %conv6 = sext i8 %tmp5 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %tmp7 = load i8* %left.addr, align 1
  %conv8 = sext i8 %tmp7 to i32
  %tmp9 = load i32* %right.addr, align 4
  %shr = ashr i32 %conv8, %tmp9
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv6, %cond.true ], [ %shr, %cond.false ]
  %conv10 = trunc i32 %cond to i8
  ret i8 %conv10
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

define internal signext i8 @safe_rshift_func_int8_t_s_s(i8 signext %left, i32 %right) nounwind uwtable {
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
  %cmp3 = icmp slt i32 %tmp2, 0
  br i1 %cmp3, label %cond.true, label %lor.lhs.false5

lor.lhs.false5:                                   ; preds = %lor.lhs.false
  %tmp6 = load i32* %right.addr, align 4
  %cmp7 = icmp sge i32 %tmp6, 32
  br i1 %cmp7, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false5, %lor.lhs.false, %entry
  %tmp9 = load i8* %left.addr, align 1
  %conv10 = sext i8 %tmp9 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false5
  %tmp11 = load i8* %left.addr, align 1
  %conv12 = sext i8 %tmp11 to i32
  %tmp13 = load i32* %right.addr, align 4
  %shr = ashr i32 %conv12, %tmp13
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv10, %cond.true ], [ %shr, %cond.false ]
  %conv14 = trunc i32 %cond to i8
  ret i8 %conv14
}

define i32* @func_36(i32* %p_37) nounwind uwtable {
entry:
  %p_37.addr = alloca i32*, align 8
  %l_38 = alloca i32, align 4
  %l_46 = alloca i32*, align 8
  %l_39 = alloca i32*, align 8
  store i32* %p_37, i32** %p_37.addr, align 8
  store i32 -5, i32* %l_38, align 4
  store i32* @g_24, i32** %l_46, align 8
  store i32* @g_24, i32** %l_39, align 8
  %tmp = load i32** %l_39, align 8
  ret i32* %tmp
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
  %call = call signext i8 @func_1()
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str, i32 0, i32 0), i32 -2)
  %tmp = load i32* getelementptr inbounds ([9 x i32]* @g_14, i32 0, i64 0), align 4
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str1, i32 0, i32 0), i32 %tmp)
  %tmp3 = load i32* getelementptr inbounds ([9 x i32]* @g_14, i32 0, i64 1), align 4
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i32 0, i32 0), i32 %tmp3)
  %tmp5 = load i32* getelementptr inbounds ([9 x i32]* @g_14, i32 0, i64 2), align 4
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0), i32 %tmp5)
  %tmp7 = load i32* getelementptr inbounds ([9 x i32]* @g_14, i32 0, i64 3), align 4
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str4, i32 0, i32 0), i32 %tmp7)
  %tmp9 = load i32* getelementptr inbounds ([9 x i32]* @g_14, i32 0, i64 4), align 4
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str5, i32 0, i32 0), i32 %tmp9)
  %tmp11 = load i32* getelementptr inbounds ([9 x i32]* @g_14, i32 0, i64 5), align 4
  %call12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str6, i32 0, i32 0), i32 %tmp11)
  %tmp13 = load i32* getelementptr inbounds ([9 x i32]* @g_14, i32 0, i64 6), align 4
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str7, i32 0, i32 0), i32 %tmp13)
  %tmp15 = load i32* getelementptr inbounds ([9 x i32]* @g_14, i32 0, i64 7), align 4
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str8, i32 0, i32 0), i32 %tmp15)
  %tmp17 = load i32* getelementptr inbounds ([9 x i32]* @g_14, i32 0, i64 8), align 4
  %call18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str9, i32 0, i32 0), i32 %tmp17)
  %tmp19 = load i32* @g_24, align 4
  %call20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str10, i32 0, i32 0), i32 %tmp19)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
