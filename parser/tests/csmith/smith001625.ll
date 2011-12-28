; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001625.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i8 91, align 1
@g_7 = global i32 1, align 4
@g_6 = global i32* @g_7, align 8
@g_18 = global i32 -1, align 4
@g_38 = constant i16 1, align 2
@g_39 = global [4 x [2 x i32]] [[2 x i32] [i32 6, i32 6], [2 x i32] [i32 6, i32 6], [2 x i32] [i32 6, i32 6], [2 x i32] [i32 6, i32 6]], align 16
@func_1.l_2 = internal constant [7 x i8] c"\01\01\01\01\01\01\01", align 1
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_18 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [20 x i8] c"checksum g_38 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [26 x i8] c"checksum g_39[0][0] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [26 x i8] c"checksum g_39[0][1] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [26 x i8] c"checksum g_39[1][0] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [26 x i8] c"checksum g_39[1][1] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [26 x i8] c"checksum g_39[2][0] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [26 x i8] c"checksum g_39[2][1] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [26 x i8] c"checksum g_39[3][0] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [26 x i8] c"checksum g_39[3][1] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %l_3 = alloca [3 x i32*], align 16
  %l_5 = alloca i64, align 8
  %i = alloca i32, align 4
  %l_8 = alloca i32**, align 8
  %l_15 = alloca i8, align 1
  %l_20 = alloca i32, align 4
  %l_19 = alloca i32, align 4
  %l_21 = alloca [3 x [10 x [1 x [2 x [1 x i8]]]]], align 16
  %i63 = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %m = alloca i32, align 4
  %l_26 = alloca i8, align 1
  %l_27 = alloca i32, align 4
  store i64 5703958251970127068, i64* %l_5, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [3 x i32*]* %l_3, i32 0, i64 %idxprom
  store i32* null, i32** %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp3 = load i8* getelementptr inbounds ([7 x i8]* @func_1.l_2, i32 0, i64 5), align 1
  store i8 %tmp3, i8* @g_4, align 1
  %tmp4 = load i64* %l_5, align 8
  %tobool = icmp ne i64 %tmp4, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %for.end
  store i32** @g_6, i32*** %l_8, align 8
  %tmp6 = load i32** @g_6, align 8
  %tmp7 = load i32*** %l_8, align 8
  store i32* %tmp6, i32** %tmp7
  store i8 27, i8* @g_4, align 1
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc14, %if.then
  %tmp9 = load i8* @g_4, align 1
  %conv = zext i8 %tmp9 to i32
  %cmp10 = icmp eq i32 %conv, 0
  br i1 %cmp10, label %for.body12, label %for.end18

for.body12:                                       ; preds = %for.cond8
  %tmp13 = volatile load i32* @g_7, align 4
  store i32 %tmp13, i32* %retval
  br label %return

for.inc14:                                        ; No predecessors!
  %tmp15 = load i8* @g_4, align 1
  %conv16 = zext i8 %tmp15 to i16
  %call = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %conv16, i16 signext 1)
  %conv17 = trunc i16 %call to i8
  store i8 %conv17, i8* @g_4, align 1
  br label %for.cond8

for.end18:                                        ; preds = %for.cond8
  volatile store i32 25, i32* @g_7, align 4
  br label %for.cond19

for.cond19:                                       ; preds = %for.inc55, %for.end18
  %tmp20 = volatile load i32* @g_7, align 4
  %cmp21 = icmp slt i32 %tmp20, 14
  br i1 %cmp21, label %for.body23, label %for.end60

for.body23:                                       ; preds = %for.cond19
  store i8 -72, i8* %l_15, align 1
  store i32 -1626839478, i32* %l_20, align 4
  %tmp26 = load i32*** %l_8, align 8
  %tmp27 = load i32** %tmp26
  %tmp28 = volatile load i32* %tmp27
  %tobool29 = icmp ne i32 %tmp28, 0
  br i1 %tobool29, label %if.then30, label %if.end

if.then30:                                        ; preds = %for.body23
  br label %for.end60

if.end:                                           ; preds = %for.body23
  store i64 0, i64* %l_5, align 8
  br label %for.cond31

for.cond31:                                       ; preds = %for.inc50, %if.end
  %tmp32 = load i64* %l_5, align 8
  %cmp33 = icmp ule i64 %tmp32, -30
  br i1 %cmp33, label %for.body35, label %for.end53

for.body35:                                       ; preds = %for.cond31
  store i32 1, i32* %l_19, align 4
  %tmp37 = load i8* %l_15, align 1
  %conv38 = sext i8 %tmp37 to i32
  %tmp39 = load i32** @g_6, align 8
  volatile store i32 %conv38, i32* %tmp39
  %tmp40 = load i32** @g_6, align 8
  %tmp41 = volatile load i32* %tmp40
  %conv42 = trunc i32 %tmp41 to i16
  %call43 = call zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext %conv42, i16 zeroext 1)
  %conv44 = zext i16 %call43 to i32
  %tmp45 = load i32* @g_18, align 4
  %xor = xor i32 %tmp45, %conv44
  store i32 %xor, i32* @g_18, align 4
  %tmp46 = load i32* %l_19, align 4
  %tobool47 = icmp ne i32 %tmp46, 0
  br i1 %tobool47, label %if.then48, label %if.end49

if.then48:                                        ; preds = %for.body35
  br label %for.inc50

if.end49:                                         ; preds = %for.body35
  br label %for.inc50

for.inc50:                                        ; preds = %if.end49, %if.then48
  %tmp51 = load i64* %l_5, align 8
  %call52 = call i64 @safe_sub_func_int64_t_s_s(i64 %tmp51, i64 1)
  store i64 %call52, i64* %l_5, align 8
  br label %for.cond31

for.end53:                                        ; preds = %for.cond31
  %tmp54 = load i32* %l_20, align 4
  store i32 %tmp54, i32* %retval
  br label %return

for.inc55:                                        ; No predecessors!
  %tmp56 = volatile load i32* @g_7, align 4
  %conv57 = trunc i32 %tmp56 to i8
  %call58 = call signext i8 @safe_add_func_int8_t_s_s(i8 signext %conv57, i8 signext 8)
  %conv59 = sext i8 %call58 to i32
  volatile store i32 %conv59, i32* @g_7, align 4
  br label %for.cond19

for.end60:                                        ; preds = %if.then30, %for.cond19
  br label %if.end135

if.else:                                          ; preds = %for.end
  store i32 0, i32* %i63, align 4
  br label %for.cond68

for.cond68:                                       ; preds = %for.inc124, %if.else
  %tmp69 = load i32* %i63, align 4
  %cmp70 = icmp slt i32 %tmp69, 3
  br i1 %cmp70, label %for.body72, label %for.end127

for.body72:                                       ; preds = %for.cond68
  store i32 0, i32* %j, align 4
  br label %for.cond73

for.cond73:                                       ; preds = %for.inc120, %for.body72
  %tmp74 = load i32* %j, align 4
  %cmp75 = icmp slt i32 %tmp74, 10
  br i1 %cmp75, label %for.body77, label %for.end123

for.body77:                                       ; preds = %for.cond73
  store i32 0, i32* %k, align 4
  br label %for.cond78

for.cond78:                                       ; preds = %for.inc116, %for.body77
  %tmp79 = load i32* %k, align 4
  %cmp80 = icmp slt i32 %tmp79, 1
  br i1 %cmp80, label %for.body82, label %for.end119

for.body82:                                       ; preds = %for.cond78
  store i32 0, i32* %l, align 4
  br label %for.cond83

for.cond83:                                       ; preds = %for.inc112, %for.body82
  %tmp84 = load i32* %l, align 4
  %cmp85 = icmp slt i32 %tmp84, 2
  br i1 %cmp85, label %for.body87, label %for.end115

for.body87:                                       ; preds = %for.cond83
  store i32 0, i32* %m, align 4
  br label %for.cond88

for.cond88:                                       ; preds = %for.inc108, %for.body87
  %tmp89 = load i32* %m, align 4
  %cmp90 = icmp slt i32 %tmp89, 1
  br i1 %cmp90, label %for.body92, label %for.end111

for.body92:                                       ; preds = %for.cond88
  %tmp93 = load i32* %m, align 4
  %idxprom94 = sext i32 %tmp93 to i64
  %tmp95 = load i32* %l, align 4
  %idxprom96 = sext i32 %tmp95 to i64
  %tmp97 = load i32* %k, align 4
  %idxprom98 = sext i32 %tmp97 to i64
  %tmp99 = load i32* %j, align 4
  %idxprom100 = sext i32 %tmp99 to i64
  %tmp101 = load i32* %i63, align 4
  %idxprom102 = sext i32 %tmp101 to i64
  %arrayidx103 = getelementptr inbounds [3 x [10 x [1 x [2 x [1 x i8]]]]]* %l_21, i32 0, i64 %idxprom102
  %arrayidx104 = getelementptr inbounds [10 x [1 x [2 x [1 x i8]]]]* %arrayidx103, i32 0, i64 %idxprom100
  %arrayidx105 = getelementptr inbounds [1 x [2 x [1 x i8]]]* %arrayidx104, i32 0, i64 %idxprom98
  %arrayidx106 = getelementptr inbounds [2 x [1 x i8]]* %arrayidx105, i32 0, i64 %idxprom96
  %arrayidx107 = getelementptr inbounds [1 x i8]* %arrayidx106, i32 0, i64 %idxprom94
  store i8 98, i8* %arrayidx107, align 1
  br label %for.inc108

for.inc108:                                       ; preds = %for.body92
  %tmp109 = load i32* %m, align 4
  %inc110 = add nsw i32 %tmp109, 1
  store i32 %inc110, i32* %m, align 4
  br label %for.cond88

for.end111:                                       ; preds = %for.cond88
  br label %for.inc112

for.inc112:                                       ; preds = %for.end111
  %tmp113 = load i32* %l, align 4
  %inc114 = add nsw i32 %tmp113, 1
  store i32 %inc114, i32* %l, align 4
  br label %for.cond83

for.end115:                                       ; preds = %for.cond83
  br label %for.inc116

for.inc116:                                       ; preds = %for.end115
  %tmp117 = load i32* %k, align 4
  %inc118 = add nsw i32 %tmp117, 1
  store i32 %inc118, i32* %k, align 4
  br label %for.cond78

for.end119:                                       ; preds = %for.cond78
  br label %for.inc120

for.inc120:                                       ; preds = %for.end119
  %tmp121 = load i32* %j, align 4
  %inc122 = add nsw i32 %tmp121, 1
  store i32 %inc122, i32* %j, align 4
  br label %for.cond73

for.end123:                                       ; preds = %for.cond73
  br label %for.inc124

for.inc124:                                       ; preds = %for.end123
  %tmp125 = load i32* %i63, align 4
  %inc126 = add nsw i32 %tmp125, 1
  store i32 %inc126, i32* %i63, align 4
  br label %for.cond68

for.end127:                                       ; preds = %for.cond68
  %arrayidx128 = getelementptr inbounds [3 x [10 x [1 x [2 x [1 x i8]]]]]* %l_21, i32 0, i64 0
  %arrayidx129 = getelementptr inbounds [10 x [1 x [2 x [1 x i8]]]]* %arrayidx128, i32 0, i64 2
  %arrayidx130 = getelementptr inbounds [1 x [2 x [1 x i8]]]* %arrayidx129, i32 0, i64 0
  %arrayidx131 = getelementptr inbounds [2 x [1 x i8]]* %arrayidx130, i32 0, i64 0
  %arrayidx132 = getelementptr inbounds [1 x i8]* %arrayidx131, i32 0, i64 0
  %tmp133 = load i8* %arrayidx132, align 1
  %conv134 = sext i8 %tmp133 to i32
  store i32 %conv134, i32* %retval
  br label %return

if.end135:                                        ; preds = %for.end60
  store i32* @g_7, i32** @g_6, align 8
  store i32 0, i32* @g_18, align 4
  br label %for.cond136

for.cond136:                                      ; preds = %for.inc208, %if.end135
  %tmp137 = load i32* @g_18, align 4
  %cmp138 = icmp ult i32 %tmp137, 0
  br i1 %cmp138, label %for.body140, label %for.end213

for.body140:                                      ; preds = %for.cond136
  store i8 6, i8* %l_26, align 1
  store i32 -627628233, i32* %l_27, align 4
  store i64 -1, i64* %l_5, align 8
  br label %for.cond143

for.cond143:                                      ; preds = %for.inc150, %for.body140
  %tmp144 = load i64* %l_5, align 8
  %cmp145 = icmp ugt i64 %tmp144, 22
  br i1 %cmp145, label %for.body147, label %for.end155

for.body147:                                      ; preds = %for.cond143
  %tmp148 = load i8* %l_26, align 1
  %conv149 = zext i8 %tmp148 to i32
  store i32 %conv149, i32* %retval
  br label %return

for.inc150:                                       ; No predecessors!
  %tmp151 = load i64* %l_5, align 8
  %conv152 = trunc i64 %tmp151 to i32
  %call153 = call i32 @safe_add_func_uint32_t_u_u(i32 %conv152, i32 5)
  %conv154 = zext i32 %call153 to i64
  store i64 %conv154, i64* %l_5, align 8
  br label %for.cond143

for.end155:                                       ; preds = %for.cond143
  %tmp156 = load i32** @g_6, align 8
  %tmp157 = volatile load i32* %tmp156
  %tmp158 = load i32* %l_27, align 4
  %xor159 = xor i32 %tmp158, %tmp157
  store i32 %xor159, i32* %l_27, align 4
  %tmp160 = load i32** @g_6, align 8
  %tmp161 = volatile load i32* %tmp160
  %tmp162 = load i32* @g_18, align 4
  %or = or i32 %tmp161, %tmp162
  %tobool163 = icmp ne i32 %or, 0
  br i1 %tobool163, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.end155
  %tmp164 = load i32** @g_6, align 8
  %tmp165 = volatile load i32* %tmp164
  %conv166 = trunc i32 %tmp165 to i8
  %call167 = call zeroext i8 @safe_rshift_func_uint8_t_u_u(i8 zeroext %conv166, i32 7)
  %conv168 = zext i8 %call167 to i32
  %tobool169 = icmp ne i32 %conv168, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.end155
  %0 = phi i1 [ false, %for.end155 ], [ %tobool169, %land.rhs ]
  %land.ext = zext i1 %0 to i32
  %call170 = call zeroext i16 @safe_rshift_func_uint16_t_u_s(i16 zeroext -13198, i32 %land.ext)
  %conv171 = trunc i16 %call170 to i8
  %arrayidx172 = getelementptr inbounds [3 x i32*]* %l_3, i32 0, i64 1
  %tmp173 = load i32** %arrayidx172, align 8
  %arrayidx174 = getelementptr inbounds [3 x i32*]* %l_3, i32 0, i64 1
  %tmp175 = load i32** %arrayidx174, align 8
  %cmp176 = icmp eq i32* %tmp173, %tmp175
  %conv177 = zext i1 %cmp176 to i32
  %tmp178 = load i32* @g_18, align 4
  %and = and i32 %conv177, %tmp178
  %conv179 = trunc i32 %and to i8
  %call180 = call signext i8 @safe_sub_func_int8_t_s_s(i8 signext %conv171, i8 signext %conv179)
  %tmp181 = load i8* %l_26, align 1
  %tmp182 = load i8* %l_26, align 1
  %conv183 = zext i8 %tmp182 to i32
  %call184 = call zeroext i8 @safe_rshift_func_uint8_t_u_u(i8 zeroext %tmp181, i32 %conv183)
  %conv185 = zext i8 %call184 to i32
  %tmp186 = load i32* %l_27, align 4
  %cmp187 = icmp ne i32 %tmp186, 1
  %conv188 = zext i1 %cmp187 to i32
  %xor189 = xor i32 %conv185, %conv188
  %tmp190 = load i8* @g_4, align 1
  %conv191 = zext i8 %tmp190 to i32
  %tobool192 = icmp ne i32 %conv191, 0
  br i1 %tobool192, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.end
  %tmp193 = load i32* %l_27, align 4
  %tobool194 = icmp ne i32 %tmp193, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.end
  %1 = phi i1 [ true, %land.end ], [ %tobool194, %lor.rhs ]
  %lor.ext = zext i1 %1 to i32
  %conv195 = sext i32 %lor.ext to i64
  %cmp196 = icmp sge i64 1, %conv195
  %conv197 = zext i1 %cmp196 to i32
  %cmp198 = icmp slt i32 %xor189, %conv197
  %conv199 = zext i1 %cmp198 to i32
  %neg = xor i32 %conv199, -1
  %conv200 = sext i32 %neg to i64
  %cmp201 = icmp slt i64 1343611072, %conv200
  %conv202 = zext i1 %cmp201 to i32
  %conv203 = trunc i32 %conv202 to i8
  %call204 = call zeroext i8 @safe_mod_func_uint8_t_u_u(i8 zeroext %call180, i8 zeroext %conv203)
  %conv205 = zext i8 %call204 to i32
  %tmp206 = load i32* getelementptr inbounds ([4 x [2 x i32]]* @g_39, i32 0, i64 0, i64 1), align 4
  %xor207 = xor i32 %tmp206, %conv205
  store i32 %xor207, i32* getelementptr inbounds ([4 x [2 x i32]]* @g_39, i32 0, i64 0, i64 1), align 4
  br label %for.inc208

for.inc208:                                       ; preds = %lor.end
  %tmp209 = load i32* @g_18, align 4
  %conv210 = trunc i32 %tmp209 to i8
  %call211 = call zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %conv210, i8 zeroext 3)
  %conv212 = zext i8 %call211 to i32
  store i32 %conv212, i32* @g_18, align 4
  br label %for.cond136

for.end213:                                       ; preds = %for.cond136
  %tmp214 = load i32* getelementptr inbounds ([4 x [2 x i32]]* @g_39, i32 0, i64 2, i64 1), align 4
  store i32 %tmp214, i32* %retval
  br label %return

return:                                           ; preds = %for.end213, %for.body147, %for.end127, %for.end53, %for.body12
  %2 = load i32* %retval
  ret i32 %2
}

define internal signext i16 @safe_sub_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i16, align 2
  %si2.addr = alloca i16, align 2
  store i16 %si1, i16* %si1.addr, align 2
  store i16 %si2, i16* %si2.addr, align 2
  %tmp = load i16* %si1.addr, align 2
  %conv = sext i16 %tmp to i32
  %tmp1 = load i16* %si2.addr, align 2
  %conv2 = sext i16 %tmp1 to i32
  %sub = sub nsw i32 %conv, %conv2
  %conv3 = trunc i32 %sub to i16
  ret i16 %conv3
}

define internal zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i16, align 2
  %ui2.addr = alloca i16, align 2
  store i16 %ui1, i16* %ui1.addr, align 2
  store i16 %ui2, i16* %ui2.addr, align 2
  %tmp = load i16* %ui1.addr, align 2
  %conv = zext i16 %tmp to i32
  %tmp1 = load i16* %ui2.addr, align 2
  %conv2 = zext i16 %tmp1 to i32
  %add = add nsw i32 %conv, %conv2
  %conv3 = trunc i32 %add to i16
  ret i16 %conv3
}

define internal i64 @safe_sub_func_int64_t_s_s(i64 %si1, i64 %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i64, align 8
  %si2.addr = alloca i64, align 8
  store i64 %si1, i64* %si1.addr, align 8
  store i64 %si2, i64* %si2.addr, align 8
  %tmp = load i64* %si1.addr, align 8
  %tmp1 = load i64* %si2.addr, align 8
  %xor = xor i64 %tmp, %tmp1
  %tmp2 = load i64* %si1.addr, align 8
  %tmp3 = load i64* %si1.addr, align 8
  %tmp4 = load i64* %si2.addr, align 8
  %xor5 = xor i64 %tmp3, %tmp4
  %and = and i64 %xor5, -9223372036854775808
  %xor6 = xor i64 %tmp2, %and
  %tmp7 = load i64* %si2.addr, align 8
  %sub = sub nsw i64 %xor6, %tmp7
  %tmp8 = load i64* %si2.addr, align 8
  %xor9 = xor i64 %sub, %tmp8
  %and10 = and i64 %xor, %xor9
  %cmp = icmp slt i64 %and10, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp11 = load i64* %si1.addr, align 8
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp12 = load i64* %si1.addr, align 8
  %tmp13 = load i64* %si2.addr, align 8
  %sub14 = sub nsw i64 %tmp12, %tmp13
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %tmp11, %cond.true ], [ %sub14, %cond.false ]
  ret i64 %cond
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

define internal zeroext i8 @safe_mod_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i8, align 1
  %ui2.addr = alloca i8, align 1
  store i8 %ui1, i8* %ui1.addr, align 1
  store i8 %ui2, i8* %ui2.addr, align 1
  %tmp = load i8* %ui2.addr, align 1
  %conv = zext i8 %tmp to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp2 = load i8* %ui1.addr, align 1
  %conv3 = zext i8 %tmp2 to i32
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp4 = load i8* %ui1.addr, align 1
  %conv5 = zext i8 %tmp4 to i32
  %tmp6 = load i8* %ui2.addr, align 1
  %conv7 = zext i8 %tmp6 to i32
  %rem = srem i32 %conv5, %conv7
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv3, %cond.true ], [ %rem, %cond.false ]
  %conv8 = trunc i32 %cond to i8
  ret i8 %conv8
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

define internal zeroext i8 @safe_rshift_func_uint8_t_u_u(i8 zeroext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i8, align 1
  %right.addr = alloca i32, align 4
  store i8 %left, i8* %left.addr, align 1
  store i32 %right, i32* %right.addr, align 4
  %tmp = load i32* %right.addr, align 4
  %cmp = icmp uge i32 %tmp, 32
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp1 = load i8* %left.addr, align 1
  %conv = zext i8 %tmp1 to i32
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp2 = load i8* %left.addr, align 1
  %conv3 = zext i8 %tmp2 to i32
  %tmp4 = load i32* %right.addr, align 4
  %shr = ashr i32 %conv3, %tmp4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv, %cond.true ], [ %shr, %cond.false ]
  %conv5 = trunc i32 %cond to i8
  ret i8 %conv5
}

define internal zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i8, align 1
  %ui2.addr = alloca i8, align 1
  store i8 %ui1, i8* %ui1.addr, align 1
  store i8 %ui2, i8* %ui2.addr, align 1
  %tmp = load i8* %ui1.addr, align 1
  %conv = zext i8 %tmp to i32
  %tmp1 = load i8* %ui2.addr, align 1
  %conv2 = zext i8 %tmp1 to i32
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
  %tmp = load i8* @g_4, align 1
  %conv = zext i8 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %tmp2 = volatile load i32* @g_7, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* @g_18, align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str3, i32 0, i32 0), i32 1)
  %tmp7 = load i32* getelementptr inbounds ([4 x [2 x i32]]* @g_39, i32 0, i64 0, i64 0), align 4
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str4, i32 0, i32 0), i32 %tmp7)
  %tmp9 = load i32* getelementptr inbounds ([4 x [2 x i32]]* @g_39, i32 0, i64 0, i64 1), align 4
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str5, i32 0, i32 0), i32 %tmp9)
  %tmp11 = load i32* getelementptr inbounds ([4 x [2 x i32]]* @g_39, i32 0, i64 1, i64 0), align 4
  %call12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str6, i32 0, i32 0), i32 %tmp11)
  %tmp13 = load i32* getelementptr inbounds ([4 x [2 x i32]]* @g_39, i32 0, i64 1, i64 1), align 4
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str7, i32 0, i32 0), i32 %tmp13)
  %tmp15 = load i32* getelementptr inbounds ([4 x [2 x i32]]* @g_39, i32 0, i64 2, i64 0), align 4
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str8, i32 0, i32 0), i32 %tmp15)
  %tmp17 = load i32* getelementptr inbounds ([4 x [2 x i32]]* @g_39, i32 0, i64 2, i64 1), align 4
  %call18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str9, i32 0, i32 0), i32 %tmp17)
  %tmp19 = load i32* getelementptr inbounds ([4 x [2 x i32]]* @g_39, i32 0, i64 3, i64 0), align 4
  %call20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str10, i32 0, i32 0), i32 %tmp19)
  %tmp21 = load i32* getelementptr inbounds ([4 x [2 x i32]]* @g_39, i32 0, i64 3, i64 1), align 4
  %call22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str11, i32 0, i32 0), i32 %tmp21)
  %tmp23 = load i32* getelementptr inbounds ([4 x [2 x i32]]* @g_39, i32 0, i64 0, i64 1), align 4
  %call24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str5, i32 0, i32 0), i32 %tmp23)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
