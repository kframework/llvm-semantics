; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000423.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_11 = global i32 -1824385567, align 4
@g_27 = global [1 x [4 x i32]] [[4 x i32] [i32 -1, i32 -1, i32 -1, i32 -1]], align 16
@g_26 = global [1 x i32*] [i32* bitcast (i8* getelementptr (i8* bitcast ([1 x [4 x i32]]* @g_27 to i8*), i64 8) to i32*)], align 8
@g_29 = global i32 -1414046302, align 4
@g_28 = global [6 x [8 x [1 x i32*]]] [[8 x [1 x i32*]] [[1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29]], [8 x [1 x i32*]] [[1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29]], [8 x [1 x i32*]] [[1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29]], [8 x [1 x i32*]] [[1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29]], [8 x [1 x i32*]] [[1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29]], [8 x [1 x i32*]] [[1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29]]], align 16
@g_30 = global i32* null, align 8
@g_35 = global i32* @g_29, align 8
@g_34 = global i32** @g_35, align 8
@g_57 = global i32* null, align 8
@g_56 = global i32** @g_57, align 8
@.str = private unnamed_addr constant [20 x i8] c"checksum g_11 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [26 x i8] c"checksum g_27[0][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [26 x i8] c"checksum g_27[0][1] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [26 x i8] c"checksum g_27[0][2] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [26 x i8] c"checksum g_27[0][3] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [20 x i8] c"checksum g_29 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %l_10 = alloca i64, align 8
  %l_62 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %l_65 = alloca i32, align 4
  %i99 = alloca i32, align 4
  %j101 = alloca i32, align 4
  %l_70 = alloca i8, align 1
  store i64 -1736893734999795570, i64* %l_10, align 8
  store i32 4, i32* %l_62, align 4
  %tmp = load i64* %l_10, align 8
  %conv = trunc i64 %tmp to i16
  %tmp1 = load i32* @g_11, align 4
  %conv2 = trunc i32 %tmp1 to i16
  %call = call signext i16 @safe_mod_func_int16_t_s_s(i16 signext %conv, i16 signext %conv2)
  %conv3 = sext i16 %call to i64
  %cmp = icmp ne i64 %conv3, 2401304733
  %conv4 = zext i1 %cmp to i32
  %conv5 = sext i32 %conv4 to i64
  %tmp6 = load i32* @g_11, align 4
  %conv7 = zext i32 %tmp6 to i64
  %call8 = call i64 @safe_sub_func_uint64_t_u_u(i64 %conv5, i64 %conv7)
  %tmp9 = load i32* @g_11, align 4
  %conv10 = zext i32 %tmp9 to i64
  %cmp11 = icmp ne i64 %call8, %conv10
  %conv12 = zext i1 %cmp11 to i32
  %conv13 = trunc i32 %conv12 to i16
  %tmp14 = load i32* @g_11, align 4
  %conv15 = zext i32 %tmp14 to i64
  %tmp16 = load i64* %l_10, align 8
  %call17 = call i64 @safe_div_func_uint64_t_u_u(i64 %conv15, i64 %tmp16)
  %tmp18 = load i64* %l_10, align 8
  %tmp19 = load i64* %l_10, align 8
  %cmp20 = icmp ule i64 %tmp18, %tmp19
  %conv21 = zext i1 %cmp20 to i32
  %conv22 = sext i32 %conv21 to i64
  %cmp23 = icmp ule i64 %call17, %conv22
  %conv24 = zext i1 %cmp23 to i32
  %tmp25 = load i64* %l_10, align 8
  %conv26 = trunc i64 %tmp25 to i8
  %tmp27 = load i32** @g_35, align 8
  %tmp28 = load i32* %tmp27
  %tmp29 = load i32* @g_29, align 4
  %conv30 = sext i32 %tmp29 to i64
  %tmp31 = load i64* %l_10, align 8
  %conv32 = trunc i64 %tmp31 to i16
  %call33 = call zeroext i16 @safe_div_func_uint16_t_u_u(i16 zeroext 4, i16 zeroext %conv32)
  %conv34 = zext i16 %call33 to i32
  %tmp35 = load i32* @g_11, align 4
  %call36 = call i32 @func_14(i8 signext %conv26, i32 %tmp28, i64 %conv30, i32 %conv34, i32 %tmp35)
  %cmp37 = icmp sle i32 %conv24, %call36
  %conv38 = zext i1 %cmp37 to i32
  %tmp39 = load i64* %l_10, align 8
  %tobool = icmp ne i64 %tmp39, 0
  br i1 %tobool, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %tmp40 = load i64* %l_10, align 8
  %conv41 = trunc i64 %tmp40 to i8
  %tmp42 = load i64* %l_10, align 8
  %conv43 = trunc i64 %tmp42 to i8
  %call44 = call zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %conv41, i8 zeroext %conv43)
  %conv45 = zext i8 %call44 to i32
  %cmp46 = icmp ne i32 %conv45, 4
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %0 = phi i1 [ true, %entry ], [ %cmp46, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  %cmp48 = icmp slt i32 %conv38, %lor.ext
  %conv49 = zext i1 %cmp48 to i32
  %conv50 = trunc i32 %conv49 to i16
  %call51 = call zeroext i16 @safe_sub_func_uint16_t_u_u(i16 zeroext %conv13, i16 zeroext %conv50)
  %call52 = call zeroext i16 @safe_lshift_func_uint16_t_u_u(i16 zeroext %call51, i32 -1723480469)
  %tobool53 = icmp ne i16 %call52, 0
  br i1 %tobool53, label %if.then, label %if.else

if.then:                                          ; preds = %lor.end
  store i32 -474292424, i32* %l_65, align 4
  %tmp55 = volatile load i32*** @g_34, align 8
  %tmp56 = load i32** %tmp55
  %tmp57 = load i32* %tmp56
  %conv58 = sext i32 %tmp57 to i64
  %and = and i64 4059292008, %conv58
  %tmp59 = load i32* @g_29, align 4
  %conv60 = trunc i32 %tmp59 to i8
  %tmp61 = load i32* %l_65, align 4
  %call62 = call i32* @func_20(i64 %and, i8 signext %conv60, i32 %tmp61)
  %tmp63 = load i32*** @g_56, align 8
  store i32* %call62, i32** %tmp63
  store i32 0, i32* %l_65, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc77, %if.then
  %tmp64 = load i32* %l_65, align 4
  %cmp65 = icmp slt i32 %tmp64, 1
  br i1 %cmp65, label %for.body, label %for.end80

for.body:                                         ; preds = %for.cond
  store i32 0, i32* @g_29, align 4
  br label %for.cond67

for.cond67:                                       ; preds = %for.inc, %for.body
  %tmp68 = load i32* @g_29, align 4
  %cmp69 = icmp slt i32 %tmp68, 4
  br i1 %cmp69, label %for.body71, label %for.end

for.body71:                                       ; preds = %for.cond67
  %tmp72 = load i32* @g_29, align 4
  %idxprom = sext i32 %tmp72 to i64
  %tmp73 = load i32* %l_65, align 4
  %idxprom74 = sext i32 %tmp73 to i64
  %arrayidx = getelementptr inbounds [1 x [4 x i32]]* @g_27, i32 0, i64 %idxprom74
  %arrayidx75 = getelementptr inbounds [4 x i32]* %arrayidx, i32 0, i64 %idxprom
  volatile store i32 -1, i32* %arrayidx75, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body71
  %tmp76 = load i32* @g_29, align 4
  %add = add nsw i32 %tmp76, 1
  store i32 %add, i32* @g_29, align 4
  br label %for.cond67

for.end:                                          ; preds = %for.cond67
  br label %for.inc77

for.inc77:                                        ; preds = %for.end
  %tmp78 = load i32* %l_65, align 4
  %add79 = add nsw i32 %tmp78, 1
  store i32 %add79, i32* %l_65, align 4
  br label %for.cond

for.end80:                                        ; preds = %for.cond
  store i32 12, i32* @g_11, align 4
  br label %for.cond81

for.cond81:                                       ; preds = %for.inc87, %for.end80
  %tmp82 = load i32* @g_11, align 4
  %cmp83 = icmp ne i32 %tmp82, 0
  br i1 %cmp83, label %for.body85, label %for.end92

for.body85:                                       ; preds = %for.cond81
  %tmp86 = load i32* %l_65, align 4
  store i32 %tmp86, i32* %retval
  br label %return

for.inc87:                                        ; No predecessors!
  %tmp88 = load i32* @g_11, align 4
  %conv89 = trunc i32 %tmp88 to i8
  %call90 = call signext i8 @safe_add_func_int8_t_s_s(i8 signext %conv89, i8 signext 1)
  %conv91 = sext i8 %call90 to i32
  store i32 %conv91, i32* @g_11, align 4
  br label %for.cond81

for.end92:                                        ; preds = %for.cond81
  store i32 0, i32* @g_29, align 4
  br label %for.cond93

for.cond93:                                       ; preds = %for.inc121, %for.end92
  %tmp94 = load i32* @g_29, align 4
  %cmp95 = icmp sle i32 %tmp94, 0
  br i1 %cmp95, label %for.body97, label %for.end126

for.body97:                                       ; preds = %for.cond93
  store i32 0, i32* @g_11, align 4
  br label %for.cond102

for.cond102:                                      ; preds = %for.inc117, %for.body97
  %tmp103 = load i32* @g_11, align 4
  %cmp104 = icmp ult i32 %tmp103, 1
  br i1 %cmp104, label %for.body106, label %for.end120

for.body106:                                      ; preds = %for.cond102
  store i32 1, i32* %l_65, align 4
  br label %for.cond107

for.cond107:                                      ; preds = %for.inc113, %for.body106
  %tmp108 = load i32* %l_65, align 4
  %cmp109 = icmp slt i32 %tmp108, 4
  br i1 %cmp109, label %for.body111, label %for.end116

for.body111:                                      ; preds = %for.cond107
  %tmp112 = load i32* @g_29, align 4
  store i32 %tmp112, i32* %retval
  br label %return

for.inc113:                                       ; No predecessors!
  %tmp114 = load i32* %l_65, align 4
  %add115 = add nsw i32 %tmp114, 3
  store i32 %add115, i32* %l_65, align 4
  br label %for.cond107

for.end116:                                       ; preds = %for.cond107
  br label %for.inc117

for.inc117:                                       ; preds = %for.end116
  %tmp118 = load i32* @g_11, align 4
  %add119 = add i32 %tmp118, 1
  store i32 %add119, i32* @g_11, align 4
  br label %for.cond102

for.end120:                                       ; preds = %for.cond102
  br label %for.inc121

for.inc121:                                       ; preds = %for.end120
  %tmp122 = load i32* @g_29, align 4
  %conv123 = sext i32 %tmp122 to i64
  %call124 = call i64 @safe_add_func_int64_t_s_s(i64 %conv123, i64 1)
  %conv125 = trunc i64 %call124 to i32
  store i32 %conv125, i32* @g_29, align 4
  br label %for.cond93

for.end126:                                       ; preds = %for.cond93
  br label %if.end

if.else:                                          ; preds = %lor.end
  store i8 -1, i8* %l_70, align 1
  %tmp128 = load i8* %l_70, align 1
  %conv129 = zext i8 %tmp128 to i32
  %call130 = call i32* @func_32(i32 %conv129)
  %tmp131 = load i32*** @g_56, align 8
  store i32* %call130, i32** %tmp131
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end126
  store i32 0, i32* @g_11, align 4
  br label %for.cond132

for.cond132:                                      ; preds = %for.inc147, %if.end
  %tmp133 = load i32* @g_11, align 4
  %cmp134 = icmp ult i32 %tmp133, 1
  br i1 %cmp134, label %for.body136, label %for.end150

for.body136:                                      ; preds = %for.cond132
  store i32 3, i32* @g_29, align 4
  br label %for.cond137

for.cond137:                                      ; preds = %for.inc143, %for.body136
  %tmp138 = load i32* @g_29, align 4
  %cmp139 = icmp sge i32 %tmp138, 0
  br i1 %cmp139, label %for.body141, label %for.end146

for.body141:                                      ; preds = %for.cond137
  %tmp142 = volatile load i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i32 0, i64 0, i64 3), align 4
  store i32 %tmp142, i32* %retval
  br label %return

for.inc143:                                       ; No predecessors!
  %tmp144 = load i32* @g_29, align 4
  %add145 = add nsw i32 %tmp144, -4
  store i32 %add145, i32* @g_29, align 4
  br label %for.cond137

for.end146:                                       ; preds = %for.cond137
  br label %for.inc147

for.inc147:                                       ; preds = %for.end146
  %tmp148 = load i32* @g_11, align 4
  %add149 = add i32 %tmp148, 1
  store i32 %add149, i32* @g_11, align 4
  br label %for.cond132

for.end150:                                       ; preds = %for.cond132
  store i64 0, i64* %l_10, align 8
  br label %for.cond151

for.cond151:                                      ; preds = %for.inc182, %for.end150
  %tmp152 = load i64* %l_10, align 8
  %cmp153 = icmp ult i64 %tmp152, 6
  br i1 %cmp153, label %for.body155, label %for.end185

for.body155:                                      ; preds = %for.cond151
  store i32 0, i32* @g_11, align 4
  br label %for.cond156

for.cond156:                                      ; preds = %for.inc178, %for.body155
  %tmp157 = load i32* @g_11, align 4
  %cmp158 = icmp ult i32 %tmp157, 8
  br i1 %cmp158, label %for.body160, label %for.end181

for.body160:                                      ; preds = %for.cond156
  store i32 0, i32* @g_29, align 4
  br label %for.cond161

for.cond161:                                      ; preds = %for.inc174, %for.body160
  %tmp162 = load i32* @g_29, align 4
  %cmp163 = icmp slt i32 %tmp162, 1
  br i1 %cmp163, label %for.body165, label %for.end177

for.body165:                                      ; preds = %for.cond161
  %tmp166 = load i32* @g_29, align 4
  %idxprom167 = sext i32 %tmp166 to i64
  %tmp168 = load i32* @g_11, align 4
  %idxprom169 = zext i32 %tmp168 to i64
  %tmp170 = load i64* %l_10, align 8
  %arrayidx171 = getelementptr inbounds [6 x [8 x [1 x i32*]]]* @g_28, i32 0, i64 %tmp170
  %arrayidx172 = getelementptr inbounds [8 x [1 x i32*]]* %arrayidx171, i32 0, i64 %idxprom169
  %arrayidx173 = getelementptr inbounds [1 x i32*]* %arrayidx172, i32 0, i64 %idxprom167
  volatile store i32* null, i32** %arrayidx173, align 8
  br label %for.inc174

for.inc174:                                       ; preds = %for.body165
  %tmp175 = load i32* @g_29, align 4
  %add176 = add nsw i32 %tmp175, 1
  store i32 %add176, i32* @g_29, align 4
  br label %for.cond161

for.end177:                                       ; preds = %for.cond161
  br label %for.inc178

for.inc178:                                       ; preds = %for.end177
  %tmp179 = load i32* @g_11, align 4
  %add180 = add i32 %tmp179, 1
  store i32 %add180, i32* @g_11, align 4
  br label %for.cond156

for.end181:                                       ; preds = %for.cond156
  br label %for.inc182

for.inc182:                                       ; preds = %for.end181
  %tmp183 = load i64* %l_10, align 8
  %add184 = add i64 %tmp183, 1
  store i64 %add184, i64* %l_10, align 8
  br label %for.cond151

for.end185:                                       ; preds = %for.cond151
  %tmp186 = volatile load i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i32 0, i64 0, i64 2), align 4
  store i32 %tmp186, i32* %retval
  br label %return

return:                                           ; preds = %for.end185, %for.body141, %for.body111, %for.body85
  %1 = load i32* %retval
  ret i32 %1
}

define internal zeroext i16 @safe_lshift_func_uint16_t_u_u(i16 zeroext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i16, align 2
  %right.addr = alloca i32, align 4
  store i16 %left, i16* %left.addr, align 2
  store i32 %right, i32* %right.addr, align 4
  %tmp = load i32* %right.addr, align 4
  %cmp = icmp uge i32 %tmp, 32
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load i16* %left.addr, align 2
  %conv = zext i16 %tmp1 to i32
  %tmp2 = load i32* %right.addr, align 4
  %shr = ashr i32 65535, %tmp2
  %cmp3 = icmp sgt i32 %conv, %shr
  br i1 %cmp3, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %entry
  %tmp5 = load i16* %left.addr, align 2
  %conv6 = zext i16 %tmp5 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %tmp7 = load i16* %left.addr, align 2
  %conv8 = zext i16 %tmp7 to i32
  %tmp9 = load i32* %right.addr, align 4
  %shl = shl i32 %conv8, %tmp9
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv6, %cond.true ], [ %shl, %cond.false ]
  %conv10 = trunc i32 %cond to i16
  ret i16 %conv10
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

define i32 @func_14(i8 signext %p_15, i32 %p_16, i64 %p_17, i32 %p_18, i32 %p_19) nounwind uwtable {
entry:
  %p_15.addr = alloca i8, align 1
  %p_16.addr = alloca i32, align 4
  %p_17.addr = alloca i64, align 8
  %p_18.addr = alloca i32, align 4
  %p_19.addr = alloca i32, align 4
  %l_36 = alloca i32, align 4
  %l_37 = alloca i32**, align 8
  %l_58 = alloca i32*, align 8
  %l_59 = alloca i8, align 1
  store i8 %p_15, i8* %p_15.addr, align 1
  store i32 %p_16, i32* %p_16.addr, align 4
  store i64 %p_17, i64* %p_17.addr, align 8
  store i32 %p_18, i32* %p_18.addr, align 4
  store i32 %p_19, i32* %p_19.addr, align 4
  store i32 2, i32* %l_36, align 4
  store i32** @g_35, i32*** %l_37, align 8
  store i32* null, i32** %l_58, align 8
  store i8 -4, i8* %l_59, align 1
  %tmp = load i32* %p_19.addr, align 4
  %conv = zext i32 %tmp to i64
  %tmp1 = volatile load i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i32 0, i64 0, i64 2), align 4
  %conv2 = trunc i32 %tmp1 to i8
  %tmp3 = load i32* %l_36, align 4
  %call = call i32* @func_20(i64 %conv, i8 signext %conv2, i32 %tmp3)
  %tmp4 = load i32*** %l_37, align 8
  store i32* %call, i32** %tmp4
  %tmp5 = load i32* @g_11, align 4
  %tmp6 = load i32*** %l_37, align 8
  %tmp7 = load i32** %tmp6
  %call8 = call i32 @func_42(i32 %tmp5, i32* %tmp7)
  %tobool = icmp ne i32 %call8, 0
  %lnot = xor i1 %tobool, true
  %lnot.ext = zext i1 %lnot to i32
  %conv9 = sext i32 %lnot.ext to i64
  %tmp10 = load i32* %p_18.addr, align 4
  %tmp11 = load i8* %l_59, align 1
  %conv12 = sext i8 %tmp11 to i32
  %or = or i32 %tmp10, %conv12
  %conv13 = zext i32 %or to i64
  %tmp14 = load i32*** %l_37, align 8
  %tmp15 = load i32** %tmp14
  %tmp16 = load i32* %tmp15
  %conv17 = sext i32 %tmp16 to i64
  %call18 = call i64 @safe_div_func_uint64_t_u_u(i64 %conv13, i64 %conv17)
  %call19 = call i64 @safe_add_func_int64_t_s_s(i64 %conv9, i64 %call18)
  %conv20 = trunc i64 %call19 to i16
  %call21 = call signext i16 @safe_mul_func_int16_t_s_s(i16 signext %conv20, i16 signext 0)
  %conv22 = sext i16 %call21 to i32
  %tmp23 = load i32** @g_35, align 8
  store i32 %conv22, i32* %tmp23
  %tmp24 = load i8* %p_15.addr, align 1
  %conv25 = sext i8 %tmp24 to i32
  ret i32 %conv25
}

define internal zeroext i16 @safe_div_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
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
  %div = sdiv i32 %conv5, %conv7
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv3, %cond.true ], [ %div, %cond.false ]
  %conv8 = trunc i32 %cond to i16
  ret i16 %conv8
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

define i32* @func_20(i64 %p_21, i8 signext %p_22, i32 %p_23) nounwind uwtable {
entry:
  %p_21.addr = alloca i64, align 8
  %p_22.addr = alloca i8, align 1
  %p_23.addr = alloca i32, align 4
  %l_31 = alloca i32*, align 8
  store i64 %p_21, i64* %p_21.addr, align 8
  store i8 %p_22, i8* %p_22.addr, align 1
  store i32 %p_23, i32* %p_23.addr, align 4
  store i32* @g_29, i32** %l_31, align 8
  %tmp = load i32** getelementptr inbounds ([1 x i32*]* @g_26, i32 0, i64 0), align 8
  %cmp = icmp ne i32* %tmp, getelementptr inbounds ([1 x [4 x i32]]* @g_27, i32 0, i64 0, i64 2)
  %conv = zext i1 %cmp to i32
  %conv1 = sext i32 %conv to i64
  %xor = xor i64 %conv1, -1
  %conv2 = trunc i64 %xor to i8
  %call = call signext i8 @safe_rshift_func_int8_t_s_s(i8 signext %conv2, i32 1)
  %conv3 = sext i8 %call to i32
  %tmp4 = load i32** %l_31, align 8
  store i32 %conv3, i32* %tmp4
  %tmp5 = volatile load i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i32 0, i64 0, i64 2), align 4
  %call6 = call i32* @func_32(i32 %tmp5)
  %tmp7 = volatile load i32*** @g_34, align 8
  store i32* %call6, i32** %tmp7
  %tmp8 = volatile load i32*** @g_34, align 8
  %tmp9 = load i32** %tmp8
  ret i32* %tmp9
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

define i32* @func_32(i32 %p_33) nounwind uwtable {
entry:
  %p_33.addr = alloca i32, align 4
  store i32 %p_33, i32* %p_33.addr, align 4
  ret i32* @g_29
}

define internal signext i16 @safe_mul_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i16, align 2
  %si2.addr = alloca i16, align 2
  store i16 %si1, i16* %si1.addr, align 2
  store i16 %si2, i16* %si2.addr, align 2
  %tmp = load i16* %si1.addr, align 2
  %conv = sext i16 %tmp to i32
  %tmp1 = load i16* %si2.addr, align 2
  %conv2 = sext i16 %tmp1 to i32
  %mul = mul nsw i32 %conv, %conv2
  %conv3 = trunc i32 %mul to i16
  ret i16 %conv3
}

define i32 @func_42(i32 %p_43, i32* %p_44) nounwind uwtable {
entry:
  %p_43.addr = alloca i32, align 4
  %p_44.addr = alloca i32*, align 8
  store i32 %p_43, i32* %p_43.addr, align 4
  store i32* %p_44, i32** %p_44.addr, align 8
  %tmp = load i32** %p_44.addr, align 8
  %tmp1 = load i32* %tmp
  ret i32 %tmp1
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

define i32* @func_47(i32** %p_48, i32 %p_49, i32** %p_50, i32 %p_51) nounwind uwtable {
entry:
  %p_48.addr = alloca i32**, align 8
  %p_49.addr = alloca i32, align 4
  %p_50.addr = alloca i32**, align 8
  %p_51.addr = alloca i32, align 4
  %l_54 = alloca [1 x i32], align 4
  %l_55 = alloca i8, align 1
  %i = alloca i32, align 4
  store i32** %p_48, i32*** %p_48.addr, align 8
  store i32 %p_49, i32* %p_49.addr, align 4
  store i32** %p_50, i32*** %p_50.addr, align 8
  store i32 %p_51, i32* %p_51.addr, align 4
  store i8 1, i8* %l_55, align 1
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [1 x i32]* %l_54, i32 0, i64 %idxprom
  store i32 -1024458125, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %p_49.addr, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc9, %for.end
  %tmp4 = load i32* %p_49.addr, align 4
  %cmp5 = icmp ult i32 %tmp4, 0
  br i1 %cmp5, label %for.body6, label %for.end13

for.body6:                                        ; preds = %for.cond3
  %tmp7 = volatile load i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i32 0, i64 0, i64 2), align 4
  %call = call i32* @func_32(i32 %tmp7)
  %tmp8 = load i32*** %p_48.addr, align 8
  store i32* %call, i32** %tmp8
  br label %for.inc9

for.inc9:                                         ; preds = %for.body6
  %tmp10 = load i32* %p_49.addr, align 4
  %conv = trunc i32 %tmp10 to i16
  %call11 = call signext i16 @safe_add_func_int16_t_s_s(i16 signext %conv, i16 signext 7)
  %conv12 = sext i16 %call11 to i32
  store i32 %conv12, i32* %p_49.addr, align 4
  br label %for.cond3

for.end13:                                        ; preds = %for.cond3
  %arrayidx14 = getelementptr inbounds [1 x i32]* %l_54, i32 0, i64 0
  %tmp15 = load i32* %arrayidx14, align 4
  %tmp16 = load i8* %l_55, align 1
  %conv17 = zext i8 %tmp16 to i32
  %xor = xor i32 %conv17, %tmp15
  %conv18 = trunc i32 %xor to i8
  store i8 %conv18, i8* %l_55, align 1
  %tmp19 = load i32*** %p_48.addr, align 8
  %tmp20 = load i32** %tmp19
  ret i32* %tmp20
}

define internal signext i16 @safe_add_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i16, align 2
  %si2.addr = alloca i16, align 2
  store i16 %si1, i16* %si1.addr, align 2
  store i16 %si2, i16* %si2.addr, align 2
  %tmp = load i16* %si1.addr, align 2
  %conv = sext i16 %tmp to i32
  %tmp1 = load i16* %si2.addr, align 2
  %conv2 = sext i16 %tmp1 to i32
  %add = add nsw i32 %conv, %conv2
  %conv3 = trunc i32 %add to i16
  ret i16 %conv3
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i32 @func_1()
  %tmp = load i32* @g_11, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = volatile load i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i32 0, i64 0, i64 0), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = volatile load i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i32 0, i64 0, i64 1), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = volatile load i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i32 0, i64 0, i64 2), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = volatile load i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i32 0, i64 0, i64 3), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %tmp10 = volatile load i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i32 0, i64 0, i64 2), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str3, i32 0, i32 0), i32 %tmp10)
  %tmp12 = load i32* @g_29, align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str5, i32 0, i32 0), i32 %tmp12)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
