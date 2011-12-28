; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000219.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_5 = global i8 -118, align 1
@g_7 = global i32 -1, align 4
@g_6 = global i32* @g_7, align 8
@g_8 = global i32 -1, align 4
@func_1.l_15 = internal constant [6 x [7 x [1 x [1 x i32]]]] [[7 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]]], [7 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]]], [7 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]]], [7 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]]], [7 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]]], [7 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]]]], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [19 x i8] c"checksum g_8 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %retval = alloca i64, align 8
  %l_2 = alloca [6 x i32], align 16
  %l_25 = alloca i32*, align 8
  %i = alloca i32, align 4
  %l_11 = alloca i8, align 1
  %l_16 = alloca i32*, align 8
  %i67 = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %l_28 = alloca i32, align 4
  %l_33 = alloca [4 x [9 x i32*]], align 16
  %i109 = alloca i32, align 4
  %j111 = alloca i32, align 4
  %l_37 = alloca [3 x [3 x [2 x [5 x [1 x [1 x i32]]]]]], align 16
  %i144 = alloca i32, align 4
  %j146 = alloca i32, align 4
  %k148 = alloca i32, align 4
  %l150 = alloca i32, align 4
  %m = alloca i32, align 4
  %n = alloca i32, align 4
  %l_36 = alloca i8, align 1
  %l_38 = alloca [1 x [6 x [1 x [4 x i64]]]], align 16
  %i306 = alloca i32, align 4
  %j308 = alloca i32, align 4
  %k310 = alloca i32, align 4
  %l312 = alloca i32, align 4
  store i32* @g_7, i32** %l_25, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 6
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [6 x i32]* %l_2, i32 0, i64 %idxprom
  store i32 -4, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [6 x i32]* %l_2, i32 0, i64 3
  %tmp4 = load i32* %arrayidx3, align 4
  %arrayidx5 = getelementptr inbounds [6 x i32]* %l_2, i32 0, i64 3
  %tmp6 = load i32* %arrayidx5, align 4
  %tmp7 = volatile load i8* @g_5, align 1
  %conv = zext i8 %tmp7 to i32
  %cmp8 = icmp slt i32 %tmp6, %conv
  br i1 %cmp8, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %for.end
  %arrayidx10 = getelementptr inbounds [6 x i32]* %l_2, i32 0, i64 3
  %tmp11 = load i32* %arrayidx10, align 4
  %tmp12 = volatile load i8* @g_5, align 1
  %conv13 = zext i8 %tmp12 to i32
  %cmp14 = icmp sge i32 %tmp11, %conv13
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %for.end
  %0 = phi i1 [ true, %for.end ], [ %cmp14, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  %conv16 = trunc i32 %lor.ext to i16
  %call = call zeroext i16 @safe_lshift_func_uint16_t_u_s(i16 zeroext %conv16, i32 1152174884)
  %conv17 = zext i16 %call to i32
  %cmp18 = icmp eq i32 %tmp4, %conv17
  %conv19 = zext i1 %cmp18 to i32
  %arrayidx20 = getelementptr inbounds [6 x i32]* %l_2, i32 0, i64 3
  %tmp21 = load i32* %arrayidx20, align 4
  %cmp22 = icmp sle i32 %conv19, %tmp21
  %conv23 = zext i1 %cmp22 to i32
  %arrayidx24 = getelementptr inbounds [6 x i32]* %l_2, i32 0, i64 3
  %tmp25 = load i32* %arrayidx24, align 4
  %cmp26 = icmp sle i32 %conv23, %tmp25
  %conv27 = zext i1 %cmp26 to i32
  %tmp28 = volatile load i32** @g_6, align 8
  store i32 %conv27, i32* %tmp28
  %tmp29 = volatile load i32** @g_6, align 8
  %tmp30 = load i32* %tmp29
  %tmp31 = load i32* @g_8, align 4
  %or = or i32 %tmp31, %tmp30
  store i32 %or, i32* @g_8, align 4
  %tmp32 = volatile load i32** @g_6, align 8
  %tmp33 = load i32* %tmp32
  %tmp34 = load i32* @g_8, align 4
  %and = and i32 %tmp33, %tmp34
  %conv35 = trunc i32 %and to i16
  %tmp36 = load i32* @g_7, align 4
  %conv37 = sext i32 %tmp36 to i64
  %and38 = and i64 %conv37, 1
  %conv39 = trunc i64 %and38 to i16
  %call40 = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext %conv35, i16 zeroext %conv39)
  %tobool = icmp ne i16 %call40, 0
  br i1 %tobool, label %if.then, label %if.else303

if.then:                                          ; preds = %lor.end
  store i8 -9, i8* %l_11, align 1
  %tmp42 = volatile load i32** @g_6, align 8
  %tmp43 = load i32* %tmp42
  %conv44 = trunc i32 %tmp43 to i8
  store i8 %conv44, i8* %l_11, align 1
  br label %lbl_14

lbl_14:                                           ; preds = %if.then73, %if.then
  volatile store i8 0, i8* @g_5, align 1
  br label %for.cond45

for.cond45:                                       ; preds = %for.inc54, %lbl_14
  %tmp46 = volatile load i8* @g_5, align 1
  %conv47 = zext i8 %tmp46 to i32
  %cmp48 = icmp slt i32 %conv47, 6
  br i1 %cmp48, label %for.body50, label %for.end58

for.body50:                                       ; preds = %for.cond45
  %tmp51 = volatile load i8* @g_5, align 1
  %idxprom52 = zext i8 %tmp51 to i64
  %arrayidx53 = getelementptr inbounds [6 x i32]* %l_2, i32 0, i64 %idxprom52
  store i32 5369819, i32* %arrayidx53, align 4
  br label %for.inc54

for.inc54:                                        ; preds = %for.body50
  %tmp55 = volatile load i8* @g_5, align 1
  %conv56 = zext i8 %tmp55 to i32
  %add = add nsw i32 %conv56, 1
  %conv57 = trunc i32 %add to i8
  volatile store i8 %conv57, i8* @g_5, align 1
  br label %for.cond45

for.end58:                                        ; preds = %for.cond45
  store i8 22, i8* %l_11, align 1
  br label %for.cond59

for.cond59:                                       ; preds = %for.inc82, %for.end58
  %tmp60 = load i8* %l_11, align 1
  %conv61 = sext i8 %tmp60 to i32
  %cmp62 = icmp sge i32 %conv61, 15
  br i1 %cmp62, label %for.body64, label %for.end87

for.body64:                                       ; preds = %for.cond59
  store i32* @g_8, i32** %l_16, align 8
  %tmp71 = load i8* %l_11, align 1
  %tobool72 = icmp ne i8 %tmp71, 0
  br i1 %tobool72, label %if.then73, label %if.end

if.then73:                                        ; preds = %for.body64
  br label %lbl_14

if.end:                                           ; preds = %for.body64
  %tmp74 = volatile load i32** @g_6, align 8
  %tmp75 = load i32* %tmp74
  %tobool76 = icmp ne i32 %tmp75, 0
  br i1 %tobool76, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.end
  %tmp77 = load i32* getelementptr inbounds ([6 x [7 x [1 x [1 x i32]]]]* @func_1.l_15, i32 0, i64 3, i64 0, i64 0, i64 0), align 4
  %tobool78 = icmp ne i32 %tmp77, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.end
  %1 = phi i1 [ false, %if.end ], [ %tobool78, %land.rhs ]
  %land.ext = zext i1 %1 to i32
  %tmp79 = load i32** %l_16, align 8
  %tmp80 = load i32* %tmp79
  %or81 = or i32 %tmp80, %land.ext
  store i32 %or81, i32* %tmp79
  br label %for.inc82

for.inc82:                                        ; preds = %land.end
  %tmp83 = load i8* %l_11, align 1
  %conv84 = sext i8 %tmp83 to i32
  %call85 = call i32 @safe_sub_func_int32_t_s_s(i32 %conv84, i32 1)
  %conv86 = trunc i32 %call85 to i8
  store i8 %conv86, i8* %l_11, align 1
  br label %for.cond59

for.end87:                                        ; preds = %for.cond59
  %tmp88 = volatile load i32** @g_6, align 8
  %tmp89 = load i32* %tmp88
  %conv90 = trunc i32 %tmp89 to i8
  %call91 = call zeroext i8 @safe_rshift_func_uint8_t_u_s(i8 zeroext %conv90, i32 5)
  %tobool92 = icmp ne i8 %call91, 0
  br i1 %tobool92, label %if.then93, label %if.else

if.then93:                                        ; preds = %for.end87
  volatile store i8 15, i8* @g_5, align 1
  br label %for.cond94

for.cond94:                                       ; preds = %for.inc102, %if.then93
  %tmp95 = volatile load i8* @g_5, align 1
  %conv96 = zext i8 %tmp95 to i32
  %cmp97 = icmp ne i32 %conv96, 0
  br i1 %cmp97, label %for.body99, label %for.end105

for.body99:                                       ; preds = %for.cond94
  %tmp100 = load i32* @g_7, align 4
  %conv101 = sext i32 %tmp100 to i64
  store i64 %conv101, i64* %retval
  br label %return

for.inc102:                                       ; No predecessors!
  %tmp103 = volatile load i8* @g_5, align 1
  %call104 = call signext i8 @safe_sub_func_int8_t_s_s(i8 signext %tmp103, i8 signext 1)
  volatile store i8 %call104, i8* @g_5, align 1
  br label %for.cond94

for.end105:                                       ; preds = %for.cond94
  br label %if.end302

if.else:                                          ; preds = %for.end87
  store i32 0, i32* %l_28, align 4
  store i32 0, i32* %i109, align 4
  br label %for.cond112

for.cond112:                                      ; preds = %for.inc132, %if.else
  %tmp113 = load i32* %i109, align 4
  %cmp114 = icmp slt i32 %tmp113, 4
  br i1 %cmp114, label %for.body116, label %for.end135

for.body116:                                      ; preds = %for.cond112
  store i32 0, i32* %j111, align 4
  br label %for.cond117

for.cond117:                                      ; preds = %for.inc128, %for.body116
  %tmp118 = load i32* %j111, align 4
  %cmp119 = icmp slt i32 %tmp118, 9
  br i1 %cmp119, label %for.body121, label %for.end131

for.body121:                                      ; preds = %for.cond117
  %tmp122 = load i32* %j111, align 4
  %idxprom123 = sext i32 %tmp122 to i64
  %tmp124 = load i32* %i109, align 4
  %idxprom125 = sext i32 %tmp124 to i64
  %arrayidx126 = getelementptr inbounds [4 x [9 x i32*]]* %l_33, i32 0, i64 %idxprom125
  %arrayidx127 = getelementptr inbounds [9 x i32*]* %arrayidx126, i32 0, i64 %idxprom123
  store i32* null, i32** %arrayidx127, align 8
  br label %for.inc128

for.inc128:                                       ; preds = %for.body121
  %tmp129 = load i32* %j111, align 4
  %inc130 = add nsw i32 %tmp129, 1
  store i32 %inc130, i32* %j111, align 4
  br label %for.cond117

for.end131:                                       ; preds = %for.cond117
  br label %for.inc132

for.inc132:                                       ; preds = %for.end131
  %tmp133 = load i32* %i109, align 4
  %inc134 = add nsw i32 %tmp133, 1
  store i32 %inc134, i32* %i109, align 4
  br label %for.cond112

for.end135:                                       ; preds = %for.cond112
  volatile store i8 -29, i8* @g_5, align 1
  br label %for.cond136

for.cond136:                                      ; preds = %for.inc296, %for.end135
  %tmp137 = volatile load i8* @g_5, align 1
  %conv138 = zext i8 %tmp137 to i32
  %cmp139 = icmp slt i32 %conv138, -3
  br i1 %cmp139, label %for.body141, label %for.end301

for.body141:                                      ; preds = %for.cond136
  store i32 0, i32* %i144, align 4
  br label %for.cond153

for.cond153:                                      ; preds = %for.inc221, %for.body141
  %tmp154 = load i32* %i144, align 4
  %cmp155 = icmp slt i32 %tmp154, 3
  br i1 %cmp155, label %for.body157, label %for.end224

for.body157:                                      ; preds = %for.cond153
  store i32 0, i32* %j146, align 4
  br label %for.cond158

for.cond158:                                      ; preds = %for.inc217, %for.body157
  %tmp159 = load i32* %j146, align 4
  %cmp160 = icmp slt i32 %tmp159, 3
  br i1 %cmp160, label %for.body162, label %for.end220

for.body162:                                      ; preds = %for.cond158
  store i32 0, i32* %k148, align 4
  br label %for.cond163

for.cond163:                                      ; preds = %for.inc213, %for.body162
  %tmp164 = load i32* %k148, align 4
  %cmp165 = icmp slt i32 %tmp164, 2
  br i1 %cmp165, label %for.body167, label %for.end216

for.body167:                                      ; preds = %for.cond163
  store i32 0, i32* %l150, align 4
  br label %for.cond168

for.cond168:                                      ; preds = %for.inc209, %for.body167
  %tmp169 = load i32* %l150, align 4
  %cmp170 = icmp slt i32 %tmp169, 5
  br i1 %cmp170, label %for.body172, label %for.end212

for.body172:                                      ; preds = %for.cond168
  store i32 0, i32* %m, align 4
  br label %for.cond173

for.cond173:                                      ; preds = %for.inc205, %for.body172
  %tmp174 = load i32* %m, align 4
  %cmp175 = icmp slt i32 %tmp174, 1
  br i1 %cmp175, label %for.body177, label %for.end208

for.body177:                                      ; preds = %for.cond173
  store i32 0, i32* %n, align 4
  br label %for.cond178

for.cond178:                                      ; preds = %for.inc201, %for.body177
  %tmp179 = load i32* %n, align 4
  %cmp180 = icmp slt i32 %tmp179, 1
  br i1 %cmp180, label %for.body182, label %for.end204

for.body182:                                      ; preds = %for.cond178
  %tmp183 = load i32* %n, align 4
  %idxprom184 = sext i32 %tmp183 to i64
  %tmp185 = load i32* %m, align 4
  %idxprom186 = sext i32 %tmp185 to i64
  %tmp187 = load i32* %l150, align 4
  %idxprom188 = sext i32 %tmp187 to i64
  %tmp189 = load i32* %k148, align 4
  %idxprom190 = sext i32 %tmp189 to i64
  %tmp191 = load i32* %j146, align 4
  %idxprom192 = sext i32 %tmp191 to i64
  %tmp193 = load i32* %i144, align 4
  %idxprom194 = sext i32 %tmp193 to i64
  %arrayidx195 = getelementptr inbounds [3 x [3 x [2 x [5 x [1 x [1 x i32]]]]]]* %l_37, i32 0, i64 %idxprom194
  %arrayidx196 = getelementptr inbounds [3 x [2 x [5 x [1 x [1 x i32]]]]]* %arrayidx195, i32 0, i64 %idxprom192
  %arrayidx197 = getelementptr inbounds [2 x [5 x [1 x [1 x i32]]]]* %arrayidx196, i32 0, i64 %idxprom190
  %arrayidx198 = getelementptr inbounds [5 x [1 x [1 x i32]]]* %arrayidx197, i32 0, i64 %idxprom188
  %arrayidx199 = getelementptr inbounds [1 x [1 x i32]]* %arrayidx198, i32 0, i64 %idxprom186
  %arrayidx200 = getelementptr inbounds [1 x i32]* %arrayidx199, i32 0, i64 %idxprom184
  store i32 -1, i32* %arrayidx200, align 4
  br label %for.inc201

for.inc201:                                       ; preds = %for.body182
  %tmp202 = load i32* %n, align 4
  %inc203 = add nsw i32 %tmp202, 1
  store i32 %inc203, i32* %n, align 4
  br label %for.cond178

for.end204:                                       ; preds = %for.cond178
  br label %for.inc205

for.inc205:                                       ; preds = %for.end204
  %tmp206 = load i32* %m, align 4
  %inc207 = add nsw i32 %tmp206, 1
  store i32 %inc207, i32* %m, align 4
  br label %for.cond173

for.end208:                                       ; preds = %for.cond173
  br label %for.inc209

for.inc209:                                       ; preds = %for.end208
  %tmp210 = load i32* %l150, align 4
  %inc211 = add nsw i32 %tmp210, 1
  store i32 %inc211, i32* %l150, align 4
  br label %for.cond168

for.end212:                                       ; preds = %for.cond168
  br label %for.inc213

for.inc213:                                       ; preds = %for.end212
  %tmp214 = load i32* %k148, align 4
  %inc215 = add nsw i32 %tmp214, 1
  store i32 %inc215, i32* %k148, align 4
  br label %for.cond163

for.end216:                                       ; preds = %for.cond163
  br label %for.inc217

for.inc217:                                       ; preds = %for.end216
  %tmp218 = load i32* %j146, align 4
  %inc219 = add nsw i32 %tmp218, 1
  store i32 %inc219, i32* %j146, align 4
  br label %for.cond158

for.end220:                                       ; preds = %for.cond158
  br label %for.inc221

for.inc221:                                       ; preds = %for.end220
  %tmp222 = load i32* %i144, align 4
  %inc223 = add nsw i32 %tmp222, 1
  store i32 %inc223, i32* %i144, align 4
  br label %for.cond153

for.end224:                                       ; preds = %for.cond153
  %tmp225 = load i32** %l_25, align 8
  %cmp226 = icmp ne i32* @g_8, %tmp225
  %conv227 = zext i1 %cmp226 to i32
  %tmp228 = volatile load i32** @g_6, align 8
  %tmp229 = load i32* %tmp228
  %conv230 = trunc i32 %tmp229 to i8
  %call231 = call signext i8 @safe_div_func_int8_t_s_s(i8 signext 0, i8 signext %conv230)
  %conv232 = sext i8 %call231 to i32
  %cmp233 = icmp sle i32 %conv227, %conv232
  %conv234 = zext i1 %cmp233 to i32
  %tmp235 = load i8* %l_11, align 1
  %conv236 = sext i8 %tmp235 to i32
  %tmp237 = load i32** %l_25, align 8
  %tmp238 = load i32* %tmp237
  %xor = xor i32 %conv236, %tmp238
  %tobool239 = icmp ne i32 %xor, 0
  br i1 %tobool239, label %land.rhs240, label %land.end241

land.rhs240:                                      ; preds = %for.end224
  br label %land.end241

land.end241:                                      ; preds = %land.rhs240, %for.end224
  %2 = phi i1 [ false, %for.end224 ], [ false, %land.rhs240 ]
  %land.ext242 = zext i1 %2 to i32
  %conv243 = sext i32 %land.ext242 to i64
  %arrayidx244 = getelementptr inbounds [4 x [9 x i32*]]* %l_33, i32 0, i64 3
  %arrayidx245 = getelementptr inbounds [9 x i32*]* %arrayidx244, i32 0, i64 1
  %tmp246 = load i32** %arrayidx245, align 8
  %cmp247 = icmp eq i32* @g_8, %tmp246
  %conv248 = zext i1 %cmp247 to i32
  %conv249 = sext i32 %conv248 to i64
  %tmp250 = load i32* @g_7, align 4
  %conv251 = sext i32 %tmp250 to i64
  %call252 = call i64 @safe_add_func_int64_t_s_s(i64 %conv249, i64 %conv251)
  %cmp253 = icmp sgt i64 %conv243, %call252
  %conv254 = zext i1 %cmp253 to i32
  %conv255 = sext i32 %conv254 to i64
  %or256 = or i64 %conv255, -6
  %conv257 = trunc i64 %or256 to i32
  %tmp258 = load i32** %l_25, align 8
  %tmp259 = load i32* %tmp258
  %call260 = call i32 @safe_mod_func_uint32_t_u_u(i32 %conv257, i32 %tmp259)
  %call261 = call i32 @safe_div_func_uint32_t_u_u(i32 %conv234, i32 %call260)
  %tobool262 = icmp ne i32 %call261, 0
  br i1 %tobool262, label %if.then263, label %if.else284

if.then263:                                       ; preds = %land.end241
  store i32 12, i32* @g_7, align 4
  br label %for.cond264

for.cond264:                                      ; preds = %for.inc272, %if.then263
  %tmp265 = load i32* @g_7, align 4
  %cmp266 = icmp sle i32 %tmp265, -8
  br i1 %cmp266, label %for.body268, label %for.end275

for.body268:                                      ; preds = %for.cond264
  store i8 0, i8* %l_36, align 1
  store i8 0, i8* %l_36, align 1
  %tmp270 = load i8* %l_36, align 1
  %conv271 = sext i8 %tmp270 to i64
  store i64 %conv271, i64* %retval
  br label %return

for.inc272:                                       ; No predecessors!
  %tmp273 = load i32* @g_7, align 4
  %call274 = call i32 @safe_sub_func_int32_t_s_s(i32 %tmp273, i32 9)
  store i32 %call274, i32* @g_7, align 4
  br label %for.cond264

for.end275:                                       ; preds = %for.cond264
  %arrayidx276 = getelementptr inbounds [3 x [3 x [2 x [5 x [1 x [1 x i32]]]]]]* %l_37, i32 0, i64 0
  %arrayidx277 = getelementptr inbounds [3 x [2 x [5 x [1 x [1 x i32]]]]]* %arrayidx276, i32 0, i64 1
  %arrayidx278 = getelementptr inbounds [2 x [5 x [1 x [1 x i32]]]]* %arrayidx277, i32 0, i64 1
  %arrayidx279 = getelementptr inbounds [5 x [1 x [1 x i32]]]* %arrayidx278, i32 0, i64 1
  %arrayidx280 = getelementptr inbounds [1 x [1 x i32]]* %arrayidx279, i32 0, i64 0
  %arrayidx281 = getelementptr inbounds [1 x i32]* %arrayidx280, i32 0, i64 0
  %tmp282 = load i32* %arrayidx281, align 4
  %conv283 = sext i32 %tmp282 to i64
  store i64 %conv283, i64* %retval
  br label %return

if.else284:                                       ; preds = %land.end241
  %arrayidx285 = getelementptr inbounds [3 x [3 x [2 x [5 x [1 x [1 x i32]]]]]]* %l_37, i32 0, i64 2
  %arrayidx286 = getelementptr inbounds [3 x [2 x [5 x [1 x [1 x i32]]]]]* %arrayidx285, i32 0, i64 1
  %arrayidx287 = getelementptr inbounds [2 x [5 x [1 x [1 x i32]]]]* %arrayidx286, i32 0, i64 0
  %arrayidx288 = getelementptr inbounds [5 x [1 x [1 x i32]]]* %arrayidx287, i32 0, i64 2
  %arrayidx289 = getelementptr inbounds [1 x [1 x i32]]* %arrayidx288, i32 0, i64 0
  %arrayidx290 = getelementptr inbounds [1 x i32]* %arrayidx289, i32 0, i64 0
  %tmp291 = load i32* %arrayidx290, align 4
  %tobool292 = icmp ne i32 %tmp291, 0
  br i1 %tobool292, label %if.then293, label %if.end294

if.then293:                                       ; preds = %if.else284
  br label %for.end301

if.end294:                                        ; preds = %if.else284
  br label %if.end295

if.end295:                                        ; preds = %if.end294
  br label %for.inc296

for.inc296:                                       ; preds = %if.end295
  %tmp297 = volatile load i8* @g_5, align 1
  %conv298 = zext i8 %tmp297 to i64
  %call299 = call i64 @safe_sub_func_int64_t_s_s(i64 %conv298, i64 1)
  %conv300 = trunc i64 %call299 to i8
  volatile store i8 %conv300, i8* @g_5, align 1
  br label %for.cond136

for.end301:                                       ; preds = %if.then293, %for.cond136
  br label %if.end302

if.end302:                                        ; preds = %for.end301, %for.end105
  br label %if.end381

if.else303:                                       ; preds = %lor.end
  store i32 0, i32* %i306, align 4
  br label %for.cond313

for.cond313:                                      ; preds = %for.inc357, %if.else303
  %tmp314 = load i32* %i306, align 4
  %cmp315 = icmp slt i32 %tmp314, 1
  br i1 %cmp315, label %for.body317, label %for.end360

for.body317:                                      ; preds = %for.cond313
  store i32 0, i32* %j308, align 4
  br label %for.cond318

for.cond318:                                      ; preds = %for.inc353, %for.body317
  %tmp319 = load i32* %j308, align 4
  %cmp320 = icmp slt i32 %tmp319, 6
  br i1 %cmp320, label %for.body322, label %for.end356

for.body322:                                      ; preds = %for.cond318
  store i32 0, i32* %k310, align 4
  br label %for.cond323

for.cond323:                                      ; preds = %for.inc349, %for.body322
  %tmp324 = load i32* %k310, align 4
  %cmp325 = icmp slt i32 %tmp324, 1
  br i1 %cmp325, label %for.body327, label %for.end352

for.body327:                                      ; preds = %for.cond323
  store i32 0, i32* %l312, align 4
  br label %for.cond328

for.cond328:                                      ; preds = %for.inc345, %for.body327
  %tmp329 = load i32* %l312, align 4
  %cmp330 = icmp slt i32 %tmp329, 4
  br i1 %cmp330, label %for.body332, label %for.end348

for.body332:                                      ; preds = %for.cond328
  %tmp333 = load i32* %l312, align 4
  %idxprom334 = sext i32 %tmp333 to i64
  %tmp335 = load i32* %k310, align 4
  %idxprom336 = sext i32 %tmp335 to i64
  %tmp337 = load i32* %j308, align 4
  %idxprom338 = sext i32 %tmp337 to i64
  %tmp339 = load i32* %i306, align 4
  %idxprom340 = sext i32 %tmp339 to i64
  %arrayidx341 = getelementptr inbounds [1 x [6 x [1 x [4 x i64]]]]* %l_38, i32 0, i64 %idxprom340
  %arrayidx342 = getelementptr inbounds [6 x [1 x [4 x i64]]]* %arrayidx341, i32 0, i64 %idxprom338
  %arrayidx343 = getelementptr inbounds [1 x [4 x i64]]* %arrayidx342, i32 0, i64 %idxprom336
  %arrayidx344 = getelementptr inbounds [4 x i64]* %arrayidx343, i32 0, i64 %idxprom334
  store i64 -1, i64* %arrayidx344, align 8
  br label %for.inc345

for.inc345:                                       ; preds = %for.body332
  %tmp346 = load i32* %l312, align 4
  %inc347 = add nsw i32 %tmp346, 1
  store i32 %inc347, i32* %l312, align 4
  br label %for.cond328

for.end348:                                       ; preds = %for.cond328
  br label %for.inc349

for.inc349:                                       ; preds = %for.end348
  %tmp350 = load i32* %k310, align 4
  %inc351 = add nsw i32 %tmp350, 1
  store i32 %inc351, i32* %k310, align 4
  br label %for.cond323

for.end352:                                       ; preds = %for.cond323
  br label %for.inc353

for.inc353:                                       ; preds = %for.end352
  %tmp354 = load i32* %j308, align 4
  %inc355 = add nsw i32 %tmp354, 1
  store i32 %inc355, i32* %j308, align 4
  br label %for.cond318

for.end356:                                       ; preds = %for.cond318
  br label %for.inc357

for.inc357:                                       ; preds = %for.end356
  %tmp358 = load i32* %i306, align 4
  %inc359 = add nsw i32 %tmp358, 1
  store i32 %inc359, i32* %i306, align 4
  br label %for.cond313

for.end360:                                       ; preds = %for.cond313
  store i32 3, i32* @g_8, align 4
  br label %for.cond361

for.cond361:                                      ; preds = %for.inc371, %for.end360
  %tmp362 = load i32* @g_8, align 4
  %cmp363 = icmp slt i32 %tmp362, 6
  br i1 %cmp363, label %for.body365, label %for.end374

for.body365:                                      ; preds = %for.cond361
  %arrayidx366 = getelementptr inbounds [1 x [6 x [1 x [4 x i64]]]]* %l_38, i32 0, i64 0
  %arrayidx367 = getelementptr inbounds [6 x [1 x [4 x i64]]]* %arrayidx366, i32 0, i64 4
  %arrayidx368 = getelementptr inbounds [1 x [4 x i64]]* %arrayidx367, i32 0, i64 0
  %arrayidx369 = getelementptr inbounds [4 x i64]* %arrayidx368, i32 0, i64 1
  %tmp370 = load i64* %arrayidx369, align 8
  store i64 %tmp370, i64* %retval
  br label %return

for.inc371:                                       ; No predecessors!
  %tmp372 = load i32* @g_8, align 4
  %add373 = add nsw i32 %tmp372, 4
  store i32 %add373, i32* @g_8, align 4
  br label %for.cond361

for.end374:                                       ; preds = %for.cond361
  %tmp375 = load i32** %l_25, align 8
  %cmp376 = icmp eq i32* %tmp375, null
  %conv377 = zext i1 %cmp376 to i32
  %tmp378 = load i32** %l_25, align 8
  %tmp379 = load i32* %tmp378
  %and380 = and i32 %tmp379, %conv377
  store i32 %and380, i32* %tmp378
  br label %if.end381

if.end381:                                        ; preds = %for.end374, %if.end302
  %tmp382 = load i32** %l_25, align 8
  %tmp383 = load i32* %tmp382
  %conv384 = sext i32 %tmp383 to i64
  store i64 %conv384, i64* %retval
  br label %return

return:                                           ; preds = %if.end381, %for.body365, %for.end275, %for.body268, %for.body99
  %3 = load i64* %retval
  ret i64 %3
}

define internal zeroext i16 @safe_lshift_func_uint16_t_u_s(i16 zeroext %left, i32 %right) nounwind uwtable {
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
  br i1 %cmp2, label %cond.true, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %tmp4 = load i16* %left.addr, align 2
  %conv = zext i16 %tmp4 to i32
  %tmp5 = load i32* %right.addr, align 4
  %shr = ashr i32 65535, %tmp5
  %cmp6 = icmp sgt i32 %conv, %shr
  br i1 %cmp6, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false3, %lor.lhs.false, %entry
  %tmp8 = load i16* %left.addr, align 2
  %conv9 = zext i16 %tmp8 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false3
  %tmp10 = load i16* %left.addr, align 2
  %conv11 = zext i16 %tmp10 to i32
  %tmp12 = load i32* %right.addr, align 4
  %shl = shl i32 %conv11, %tmp12
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv9, %cond.true ], [ %shl, %cond.false ]
  %conv13 = trunc i32 %cond to i16
  ret i16 %conv13
}

define internal zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i16, align 2
  %ui2.addr = alloca i16, align 2
  store i16 %ui1, i16* %ui1.addr, align 2
  store i16 %ui2, i16* %ui2.addr, align 2
  %tmp = load i16* %ui1.addr, align 2
  %conv = zext i16 %tmp to i32
  %tmp1 = load i16* %ui2.addr, align 2
  %conv2 = zext i16 %tmp1 to i32
  %mul = mul i32 %conv, %conv2
  %conv3 = trunc i32 %mul to i16
  ret i16 %conv3
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

define internal i32 @safe_div_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i32, align 4
  %ui2.addr = alloca i32, align 4
  store i32 %ui1, i32* %ui1.addr, align 4
  store i32 %ui2, i32* %ui2.addr, align 4
  %tmp = load i32* %ui2.addr, align 4
  %cmp = icmp eq i32 %tmp, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp1 = load i32* %ui1.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp2 = load i32* %ui1.addr, align 4
  %tmp3 = load i32* %ui2.addr, align 4
  %div = udiv i32 %tmp2, %tmp3
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %tmp1, %cond.true ], [ %div, %cond.false ]
  ret i32 %cond
}

define internal signext i8 @safe_div_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i8, align 1
  %si2.addr = alloca i8, align 1
  store i8 %si1, i8* %si1.addr, align 1
  store i8 %si2, i8* %si2.addr, align 1
  %tmp = load i8* %si2.addr, align 1
  %conv = sext i8 %tmp to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp2 = load i8* %si1.addr, align 1
  %conv3 = sext i8 %tmp2 to i32
  %cmp4 = icmp eq i32 %conv3, -128
  br i1 %cmp4, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %lor.lhs.false
  %tmp6 = load i8* %si2.addr, align 1
  %conv7 = sext i8 %tmp6 to i32
  %cmp8 = icmp eq i32 %conv7, -1
  br i1 %cmp8, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true, %entry
  %tmp10 = load i8* %si1.addr, align 1
  %conv11 = sext i8 %tmp10 to i32
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %lor.lhs.false
  %tmp12 = load i8* %si1.addr, align 1
  %conv13 = sext i8 %tmp12 to i32
  %tmp14 = load i8* %si2.addr, align 1
  %conv15 = sext i8 %tmp14 to i32
  %div = sdiv i32 %conv13, %conv15
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv11, %cond.true ], [ %div, %cond.false ]
  %conv16 = trunc i32 %cond to i8
  ret i8 %conv16
}

define internal i32 @safe_mod_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i32, align 4
  %ui2.addr = alloca i32, align 4
  store i32 %ui1, i32* %ui1.addr, align 4
  store i32 %ui2, i32* %ui2.addr, align 4
  %tmp = load i32* %ui2.addr, align 4
  %cmp = icmp eq i32 %tmp, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp1 = load i32* %ui1.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp2 = load i32* %ui1.addr, align 4
  %tmp3 = load i32* %ui2.addr, align 4
  %rem = urem i32 %tmp2, %tmp3
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %tmp1, %cond.true ], [ %rem, %cond.false ]
  ret i32 %cond
}

define internal i64 @safe_add_func_int64_t_s_s(i64 %si1, i64 %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i64, align 8
  %si2.addr = alloca i64, align 8
  store i64 %si1, i64* %si1.addr, align 8
  store i64 %si2, i64* %si2.addr, align 8
  %tmp = load i64* %si1.addr, align 8
  %cmp = icmp sgt i64 %tmp, 0
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %tmp1 = load i64* %si2.addr, align 8
  %cmp2 = icmp sgt i64 %tmp1, 0
  br i1 %cmp2, label %land.lhs.true3, label %lor.lhs.false

land.lhs.true3:                                   ; preds = %land.lhs.true
  %tmp4 = load i64* %si1.addr, align 8
  %tmp5 = load i64* %si2.addr, align 8
  %sub = sub nsw i64 9223372036854775807, %tmp5
  %cmp6 = icmp sgt i64 %tmp4, %sub
  br i1 %cmp6, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true3, %land.lhs.true, %entry
  %tmp7 = load i64* %si1.addr, align 8
  %cmp8 = icmp slt i64 %tmp7, 0
  br i1 %cmp8, label %land.lhs.true9, label %cond.false

land.lhs.true9:                                   ; preds = %lor.lhs.false
  %tmp10 = load i64* %si2.addr, align 8
  %cmp11 = icmp slt i64 %tmp10, 0
  br i1 %cmp11, label %land.lhs.true12, label %cond.false

land.lhs.true12:                                  ; preds = %land.lhs.true9
  %tmp13 = load i64* %si1.addr, align 8
  %tmp14 = load i64* %si2.addr, align 8
  %sub15 = sub nsw i64 -9223372036854775808, %tmp14
  %cmp16 = icmp slt i64 %tmp13, %sub15
  br i1 %cmp16, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true12, %land.lhs.true3
  %tmp17 = load i64* %si1.addr, align 8
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true12, %land.lhs.true9, %lor.lhs.false
  %tmp18 = load i64* %si1.addr, align 8
  %tmp19 = load i64* %si2.addr, align 8
  %add = add nsw i64 %tmp18, %tmp19
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %tmp17, %cond.true ], [ %add, %cond.false ]
  ret i64 %cond
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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i64 @func_1()
  %tmp = volatile load i8* @g_5, align 1
  %conv = zext i8 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %tmp2 = load i32* @g_7, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* @g_8, align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
