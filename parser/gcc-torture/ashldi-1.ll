; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/ashldi-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@data = internal constant [64 x i64] [i64 81985529216486895, i64 163971058432973790, i64 327942116865947580, i64 655884233731895160, i64 1311768467463790320, i64 2623536934927580640, i64 5247073869855161280, i64 -7952596333999229056, i64 2541551405711093504, i64 5083102811422187008, i64 -8280538450865177600, i64 1885667171979196416, i64 3771334343958392832, i64 7542668687916785664, i64 -3361406697875980288, i64 -6722813395751960576, i64 5001117282205630464, i64 -8444509509298290688, i64 1557725055112970240, i64 3115450110225940480, i64 6230900220451880960, i64 -5984943632805789696, i64 6476856808097972224, i64 -5493030457513607168, i64 7460683158682337280, i64 -3525377756344877056, i64 -7050755512689754112, i64 4345233048330043392, i64 8690466096660086784, i64 -1065811880389378048, i64 -2131623760778756096, i64 -4263247521557512192, i64 -8526495043115024384, i64 1393753987479502848, i64 2787507974959005696, i64 5575015949918011392, i64 -7296712173873528832, i64 3853319725962493952, i64 7706639451924987904, i64 -3033465169859575808, i64 -6066930339719151616, i64 6312883394271248384, i64 -5820977285167054848, i64 6804789503375441920, i64 -4837165066958667776, i64 8772413939792216064, i64 -901916194125119488, i64 -1803832388250238976, i64 -3607664776500477952, i64 -7215329553000955904, i64 4016084967707639808, i64 8032169935415279616, i64 -2382404202878992384, i64 -4764808405757984768, i64 8917127262193582080, i64 -612489549322387456, i64 -1224979098644774912, i64 -2449958197289549824, i64 -4899916394579099648, i64 8646911284551352320, i64 -1152921504606846976, i64 -2305843009213693952, i64 -4611686018427387904, i64 -9223372036854775808], align 16

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %y = alloca i64, align 8
  %y14 = alloca i64, align 8
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 64
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = load i64* getelementptr inbounds ([64 x i64]* @data, i32 0, i64 0), align 8
  %tmp3 = load i32* %i, align 4
  %call = call i64 @variable_shift(i64 %tmp2, i32 %tmp3)
  store i64 %call, i64* %y, align 8
  %tmp4 = load i64* %y, align 8
  %tmp5 = load i32* %i, align 4
  %idxprom = sext i32 %tmp5 to i64
  %arrayidx = getelementptr inbounds [64 x i64]* @data, i32 0, i64 %idxprom
  %tmp6 = load i64* %arrayidx, align 8
  %cmp7 = icmp ne i64 %tmp4, %tmp6
  br i1 %cmp7, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp8 = load i32* %i, align 4
  %inc = add nsw i32 %tmp8, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc26, %for.end
  %tmp10 = load i32* %i, align 4
  %cmp11 = icmp slt i32 %tmp10, 64
  br i1 %cmp11, label %for.body12, label %for.end29

for.body12:                                       ; preds = %for.cond9
  %tmp15 = load i64* getelementptr inbounds ([64 x i64]* @data, i32 0, i64 0), align 8
  %tmp16 = load i32* %i, align 4
  %call17 = call i64 @constant_shift(i64 %tmp15, i32 %tmp16)
  store i64 %call17, i64* %y14, align 8
  %tmp18 = load i64* %y14, align 8
  %tmp19 = load i32* %i, align 4
  %idxprom20 = sext i32 %tmp19 to i64
  %arrayidx21 = getelementptr inbounds [64 x i64]* @data, i32 0, i64 %idxprom20
  %tmp22 = load i64* %arrayidx21, align 8
  %cmp23 = icmp ne i64 %tmp18, %tmp22
  br i1 %cmp23, label %if.then24, label %if.end25

if.then24:                                        ; preds = %for.body12
  call void @abort() noreturn
  unreachable

if.end25:                                         ; preds = %for.body12
  br label %for.inc26

for.inc26:                                        ; preds = %if.end25
  %tmp27 = load i32* %i, align 4
  %inc28 = add nsw i32 %tmp27, 1
  store i32 %inc28, i32* %i, align 4
  br label %for.cond9

for.end29:                                        ; preds = %for.cond9
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

define internal i64 @variable_shift(i64 %x, i32 %i) nounwind uwtable {
entry:
  %x.addr = alloca i64, align 8
  %i.addr = alloca i32, align 4
  store i64 %x, i64* %x.addr, align 8
  store i32 %i, i32* %i.addr, align 4
  %tmp = load i64* %x.addr, align 8
  %tmp1 = load i32* %i.addr, align 4
  %sh_prom = zext i32 %tmp1 to i64
  %shl = shl i64 %tmp, %sh_prom
  ret i64 %shl
}

declare void @abort() noreturn

define internal i64 @constant_shift(i64 %x, i32 %i) nounwind uwtable {
entry:
  %x.addr = alloca i64, align 8
  %i.addr = alloca i32, align 4
  store i64 %x, i64* %x.addr, align 8
  store i32 %i, i32* %i.addr, align 4
  %tmp = load i32* %i.addr, align 4
  switch i32 %tmp, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb2
    i32 2, label %sw.bb5
    i32 3, label %sw.bb8
    i32 4, label %sw.bb11
    i32 5, label %sw.bb14
    i32 6, label %sw.bb17
    i32 7, label %sw.bb20
    i32 8, label %sw.bb23
    i32 9, label %sw.bb26
    i32 10, label %sw.bb29
    i32 11, label %sw.bb32
    i32 12, label %sw.bb35
    i32 13, label %sw.bb38
    i32 14, label %sw.bb41
    i32 15, label %sw.bb44
    i32 16, label %sw.bb47
    i32 17, label %sw.bb50
    i32 18, label %sw.bb53
    i32 19, label %sw.bb56
    i32 20, label %sw.bb59
    i32 21, label %sw.bb62
    i32 22, label %sw.bb65
    i32 23, label %sw.bb68
    i32 24, label %sw.bb71
    i32 25, label %sw.bb74
    i32 26, label %sw.bb77
    i32 27, label %sw.bb80
    i32 28, label %sw.bb83
    i32 29, label %sw.bb86
    i32 30, label %sw.bb89
    i32 31, label %sw.bb92
    i32 32, label %sw.bb95
    i32 33, label %sw.bb98
    i32 34, label %sw.bb101
    i32 35, label %sw.bb104
    i32 36, label %sw.bb107
    i32 37, label %sw.bb110
    i32 38, label %sw.bb113
    i32 39, label %sw.bb116
    i32 40, label %sw.bb119
    i32 41, label %sw.bb122
    i32 42, label %sw.bb125
    i32 43, label %sw.bb128
    i32 44, label %sw.bb131
    i32 45, label %sw.bb134
    i32 46, label %sw.bb137
    i32 47, label %sw.bb140
    i32 48, label %sw.bb143
    i32 49, label %sw.bb146
    i32 50, label %sw.bb149
    i32 51, label %sw.bb152
    i32 52, label %sw.bb155
    i32 53, label %sw.bb158
    i32 54, label %sw.bb161
    i32 55, label %sw.bb164
    i32 56, label %sw.bb167
    i32 57, label %sw.bb170
    i32 58, label %sw.bb173
    i32 59, label %sw.bb176
    i32 60, label %sw.bb179
    i32 61, label %sw.bb182
    i32 62, label %sw.bb185
    i32 63, label %sw.bb188
  ]

sw.bb:                                            ; preds = %entry
  %tmp1 = load i64* %x.addr, align 8
  %shl = shl i64 %tmp1, 0
  store i64 %shl, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb2:                                           ; preds = %entry
  %tmp3 = load i64* %x.addr, align 8
  %shl4 = shl i64 %tmp3, 1
  store i64 %shl4, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb5:                                           ; preds = %entry
  %tmp6 = load i64* %x.addr, align 8
  %shl7 = shl i64 %tmp6, 2
  store i64 %shl7, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb8:                                           ; preds = %entry
  %tmp9 = load i64* %x.addr, align 8
  %shl10 = shl i64 %tmp9, 3
  store i64 %shl10, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb11:                                          ; preds = %entry
  %tmp12 = load i64* %x.addr, align 8
  %shl13 = shl i64 %tmp12, 4
  store i64 %shl13, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb14:                                          ; preds = %entry
  %tmp15 = load i64* %x.addr, align 8
  %shl16 = shl i64 %tmp15, 5
  store i64 %shl16, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb17:                                          ; preds = %entry
  %tmp18 = load i64* %x.addr, align 8
  %shl19 = shl i64 %tmp18, 6
  store i64 %shl19, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb20:                                          ; preds = %entry
  %tmp21 = load i64* %x.addr, align 8
  %shl22 = shl i64 %tmp21, 7
  store i64 %shl22, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb23:                                          ; preds = %entry
  %tmp24 = load i64* %x.addr, align 8
  %shl25 = shl i64 %tmp24, 8
  store i64 %shl25, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb26:                                          ; preds = %entry
  %tmp27 = load i64* %x.addr, align 8
  %shl28 = shl i64 %tmp27, 9
  store i64 %shl28, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb29:                                          ; preds = %entry
  %tmp30 = load i64* %x.addr, align 8
  %shl31 = shl i64 %tmp30, 10
  store i64 %shl31, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb32:                                          ; preds = %entry
  %tmp33 = load i64* %x.addr, align 8
  %shl34 = shl i64 %tmp33, 11
  store i64 %shl34, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb35:                                          ; preds = %entry
  %tmp36 = load i64* %x.addr, align 8
  %shl37 = shl i64 %tmp36, 12
  store i64 %shl37, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb38:                                          ; preds = %entry
  %tmp39 = load i64* %x.addr, align 8
  %shl40 = shl i64 %tmp39, 13
  store i64 %shl40, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb41:                                          ; preds = %entry
  %tmp42 = load i64* %x.addr, align 8
  %shl43 = shl i64 %tmp42, 14
  store i64 %shl43, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb44:                                          ; preds = %entry
  %tmp45 = load i64* %x.addr, align 8
  %shl46 = shl i64 %tmp45, 15
  store i64 %shl46, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb47:                                          ; preds = %entry
  %tmp48 = load i64* %x.addr, align 8
  %shl49 = shl i64 %tmp48, 16
  store i64 %shl49, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb50:                                          ; preds = %entry
  %tmp51 = load i64* %x.addr, align 8
  %shl52 = shl i64 %tmp51, 17
  store i64 %shl52, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb53:                                          ; preds = %entry
  %tmp54 = load i64* %x.addr, align 8
  %shl55 = shl i64 %tmp54, 18
  store i64 %shl55, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb56:                                          ; preds = %entry
  %tmp57 = load i64* %x.addr, align 8
  %shl58 = shl i64 %tmp57, 19
  store i64 %shl58, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb59:                                          ; preds = %entry
  %tmp60 = load i64* %x.addr, align 8
  %shl61 = shl i64 %tmp60, 20
  store i64 %shl61, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb62:                                          ; preds = %entry
  %tmp63 = load i64* %x.addr, align 8
  %shl64 = shl i64 %tmp63, 21
  store i64 %shl64, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb65:                                          ; preds = %entry
  %tmp66 = load i64* %x.addr, align 8
  %shl67 = shl i64 %tmp66, 22
  store i64 %shl67, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb68:                                          ; preds = %entry
  %tmp69 = load i64* %x.addr, align 8
  %shl70 = shl i64 %tmp69, 23
  store i64 %shl70, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb71:                                          ; preds = %entry
  %tmp72 = load i64* %x.addr, align 8
  %shl73 = shl i64 %tmp72, 24
  store i64 %shl73, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb74:                                          ; preds = %entry
  %tmp75 = load i64* %x.addr, align 8
  %shl76 = shl i64 %tmp75, 25
  store i64 %shl76, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb77:                                          ; preds = %entry
  %tmp78 = load i64* %x.addr, align 8
  %shl79 = shl i64 %tmp78, 26
  store i64 %shl79, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb80:                                          ; preds = %entry
  %tmp81 = load i64* %x.addr, align 8
  %shl82 = shl i64 %tmp81, 27
  store i64 %shl82, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb83:                                          ; preds = %entry
  %tmp84 = load i64* %x.addr, align 8
  %shl85 = shl i64 %tmp84, 28
  store i64 %shl85, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb86:                                          ; preds = %entry
  %tmp87 = load i64* %x.addr, align 8
  %shl88 = shl i64 %tmp87, 29
  store i64 %shl88, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb89:                                          ; preds = %entry
  %tmp90 = load i64* %x.addr, align 8
  %shl91 = shl i64 %tmp90, 30
  store i64 %shl91, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb92:                                          ; preds = %entry
  %tmp93 = load i64* %x.addr, align 8
  %shl94 = shl i64 %tmp93, 31
  store i64 %shl94, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb95:                                          ; preds = %entry
  %tmp96 = load i64* %x.addr, align 8
  %shl97 = shl i64 %tmp96, 32
  store i64 %shl97, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb98:                                          ; preds = %entry
  %tmp99 = load i64* %x.addr, align 8
  %shl100 = shl i64 %tmp99, 33
  store i64 %shl100, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb101:                                         ; preds = %entry
  %tmp102 = load i64* %x.addr, align 8
  %shl103 = shl i64 %tmp102, 34
  store i64 %shl103, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb104:                                         ; preds = %entry
  %tmp105 = load i64* %x.addr, align 8
  %shl106 = shl i64 %tmp105, 35
  store i64 %shl106, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb107:                                         ; preds = %entry
  %tmp108 = load i64* %x.addr, align 8
  %shl109 = shl i64 %tmp108, 36
  store i64 %shl109, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb110:                                         ; preds = %entry
  %tmp111 = load i64* %x.addr, align 8
  %shl112 = shl i64 %tmp111, 37
  store i64 %shl112, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb113:                                         ; preds = %entry
  %tmp114 = load i64* %x.addr, align 8
  %shl115 = shl i64 %tmp114, 38
  store i64 %shl115, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb116:                                         ; preds = %entry
  %tmp117 = load i64* %x.addr, align 8
  %shl118 = shl i64 %tmp117, 39
  store i64 %shl118, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb119:                                         ; preds = %entry
  %tmp120 = load i64* %x.addr, align 8
  %shl121 = shl i64 %tmp120, 40
  store i64 %shl121, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb122:                                         ; preds = %entry
  %tmp123 = load i64* %x.addr, align 8
  %shl124 = shl i64 %tmp123, 41
  store i64 %shl124, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb125:                                         ; preds = %entry
  %tmp126 = load i64* %x.addr, align 8
  %shl127 = shl i64 %tmp126, 42
  store i64 %shl127, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb128:                                         ; preds = %entry
  %tmp129 = load i64* %x.addr, align 8
  %shl130 = shl i64 %tmp129, 43
  store i64 %shl130, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb131:                                         ; preds = %entry
  %tmp132 = load i64* %x.addr, align 8
  %shl133 = shl i64 %tmp132, 44
  store i64 %shl133, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb134:                                         ; preds = %entry
  %tmp135 = load i64* %x.addr, align 8
  %shl136 = shl i64 %tmp135, 45
  store i64 %shl136, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb137:                                         ; preds = %entry
  %tmp138 = load i64* %x.addr, align 8
  %shl139 = shl i64 %tmp138, 46
  store i64 %shl139, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb140:                                         ; preds = %entry
  %tmp141 = load i64* %x.addr, align 8
  %shl142 = shl i64 %tmp141, 47
  store i64 %shl142, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb143:                                         ; preds = %entry
  %tmp144 = load i64* %x.addr, align 8
  %shl145 = shl i64 %tmp144, 48
  store i64 %shl145, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb146:                                         ; preds = %entry
  %tmp147 = load i64* %x.addr, align 8
  %shl148 = shl i64 %tmp147, 49
  store i64 %shl148, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb149:                                         ; preds = %entry
  %tmp150 = load i64* %x.addr, align 8
  %shl151 = shl i64 %tmp150, 50
  store i64 %shl151, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb152:                                         ; preds = %entry
  %tmp153 = load i64* %x.addr, align 8
  %shl154 = shl i64 %tmp153, 51
  store i64 %shl154, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb155:                                         ; preds = %entry
  %tmp156 = load i64* %x.addr, align 8
  %shl157 = shl i64 %tmp156, 52
  store i64 %shl157, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb158:                                         ; preds = %entry
  %tmp159 = load i64* %x.addr, align 8
  %shl160 = shl i64 %tmp159, 53
  store i64 %shl160, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb161:                                         ; preds = %entry
  %tmp162 = load i64* %x.addr, align 8
  %shl163 = shl i64 %tmp162, 54
  store i64 %shl163, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb164:                                         ; preds = %entry
  %tmp165 = load i64* %x.addr, align 8
  %shl166 = shl i64 %tmp165, 55
  store i64 %shl166, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb167:                                         ; preds = %entry
  %tmp168 = load i64* %x.addr, align 8
  %shl169 = shl i64 %tmp168, 56
  store i64 %shl169, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb170:                                         ; preds = %entry
  %tmp171 = load i64* %x.addr, align 8
  %shl172 = shl i64 %tmp171, 57
  store i64 %shl172, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb173:                                         ; preds = %entry
  %tmp174 = load i64* %x.addr, align 8
  %shl175 = shl i64 %tmp174, 58
  store i64 %shl175, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb176:                                         ; preds = %entry
  %tmp177 = load i64* %x.addr, align 8
  %shl178 = shl i64 %tmp177, 59
  store i64 %shl178, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb179:                                         ; preds = %entry
  %tmp180 = load i64* %x.addr, align 8
  %shl181 = shl i64 %tmp180, 60
  store i64 %shl181, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb182:                                         ; preds = %entry
  %tmp183 = load i64* %x.addr, align 8
  %shl184 = shl i64 %tmp183, 61
  store i64 %shl184, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb185:                                         ; preds = %entry
  %tmp186 = load i64* %x.addr, align 8
  %shl187 = shl i64 %tmp186, 62
  store i64 %shl187, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb188:                                         ; preds = %entry
  %tmp189 = load i64* %x.addr, align 8
  %shl190 = shl i64 %tmp189, 63
  store i64 %shl190, i64* %x.addr, align 8
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  call void @abort() noreturn
  unreachable

sw.epilog:                                        ; preds = %sw.bb188, %sw.bb185, %sw.bb182, %sw.bb179, %sw.bb176, %sw.bb173, %sw.bb170, %sw.bb167, %sw.bb164, %sw.bb161, %sw.bb158, %sw.bb155, %sw.bb152, %sw.bb149, %sw.bb146, %sw.bb143, %sw.bb140, %sw.bb137, %sw.bb134, %sw.bb131, %sw.bb128, %sw.bb125, %sw.bb122, %sw.bb119, %sw.bb116, %sw.bb113, %sw.bb110, %sw.bb107, %sw.bb104, %sw.bb101, %sw.bb98, %sw.bb95, %sw.bb92, %sw.bb89, %sw.bb86, %sw.bb83, %sw.bb80, %sw.bb77, %sw.bb74, %sw.bb71, %sw.bb68, %sw.bb65, %sw.bb62, %sw.bb59, %sw.bb56, %sw.bb53, %sw.bb50, %sw.bb47, %sw.bb44, %sw.bb41, %sw.bb38, %sw.bb35, %sw.bb32, %sw.bb29, %sw.bb26, %sw.bb23, %sw.bb20, %sw.bb17, %sw.bb14, %sw.bb11, %sw.bb8, %sw.bb5, %sw.bb2, %sw.bb
  %tmp191 = load i64* %x.addr, align 8
  ret i64 %tmp191
}

declare void @exit(i32) noreturn
