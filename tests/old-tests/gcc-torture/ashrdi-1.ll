; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/ashrdi-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@zext = internal constant [64 x i64] [i64 8526495107234113920, i64 4263247553617056960, i64 2131623776808528480, i64 1065811888404264240, i64 532905944202132120, i64 266452972101066060, i64 133226486050533030, i64 66613243025266515, i64 33306621512633257, i64 16653310756316628, i64 8326655378158314, i64 4163327689079157, i64 2081663844539578, i64 1040831922269789, i64 520415961134894, i64 260207980567447, i64 130103990283723, i64 65051995141861, i64 32525997570930, i64 16262998785465, i64 8131499392732, i64 4065749696366, i64 2032874848183, i64 1016437424091, i64 508218712045, i64 254109356022, i64 127054678011, i64 63527339005, i64 31763669502, i64 15881834751, i64 7940917375, i64 3970458687, i64 1985229343, i64 992614671, i64 496307335, i64 248153667, i64 124076833, i64 62038416, i64 31019208, i64 15509604, i64 7754802, i64 3877401, i64 1938700, i64 969350, i64 484675, i64 242337, i64 121168, i64 60584, i64 30292, i64 15146, i64 7573, i64 3786, i64 1893, i64 946, i64 473, i64 236, i64 118, i64 59, i64 29, i64 14, i64 7, i64 3, i64 1, i64 0], align 16
@sext = internal constant [64 x i64] [i64 -8152436031399644656, i64 -4076218015699822328, i64 -2038109007849911164, i64 -1019054503924955582, i64 -509527251962477791, i64 -254763625981238896, i64 -127381812990619448, i64 -63690906495309724, i64 -31845453247654862, i64 -15922726623827431, i64 -7961363311913716, i64 -3980681655956858, i64 -1990340827978429, i64 -995170413989215, i64 -497585206994608, i64 -248792603497304, i64 -124396301748652, i64 -62198150874326, i64 -31099075437163, i64 -15549537718582, i64 -7774768859291, i64 -3887384429646, i64 -1943692214823, i64 -971846107412, i64 -485923053706, i64 -242961526853, i64 -121480763427, i64 -60740381714, i64 -30370190857, i64 -15185095429, i64 -7592547715, i64 -3796273858, i64 -1898136929, i64 -949068465, i64 -474534233, i64 -237267117, i64 -118633559, i64 -59316780, i64 -29658390, i64 -14829195, i64 -7414598, i64 -3707299, i64 -1853650, i64 -926825, i64 -463413, i64 -231707, i64 -115854, i64 -57927, i64 -28964, i64 -14482, i64 -7241, i64 -3621, i64 -1811, i64 -906, i64 -453, i64 -227, i64 -114, i64 -57, i64 -29, i64 -15, i64 -8, i64 -4, i64 -2, i64 -1], align 16

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %y = alloca i64, align 8
  %y14 = alloca i64, align 8
  %y35 = alloca i64, align 8
  %y56 = alloca i64, align 8
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 64
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = load i64* getelementptr inbounds ([64 x i64]* @zext, i32 0, i64 0), align 8
  %tmp3 = load i32* %i, align 4
  %call = call i64 @variable_shift(i64 %tmp2, i32 %tmp3)
  store i64 %call, i64* %y, align 8
  %tmp4 = load i64* %y, align 8
  %tmp5 = load i32* %i, align 4
  %idxprom = sext i32 %tmp5 to i64
  %arrayidx = getelementptr inbounds [64 x i64]* @zext, i32 0, i64 %idxprom
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
  %tmp15 = load i64* getelementptr inbounds ([64 x i64]* @sext, i32 0, i64 0), align 8
  %tmp16 = load i32* %i, align 4
  %call17 = call i64 @variable_shift(i64 %tmp15, i32 %tmp16)
  store i64 %call17, i64* %y14, align 8
  %tmp18 = load i64* %y14, align 8
  %tmp19 = load i32* %i, align 4
  %idxprom20 = sext i32 %tmp19 to i64
  %arrayidx21 = getelementptr inbounds [64 x i64]* @sext, i32 0, i64 %idxprom20
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
  store i32 0, i32* %i, align 4
  br label %for.cond30

for.cond30:                                       ; preds = %for.inc47, %for.end29
  %tmp31 = load i32* %i, align 4
  %cmp32 = icmp slt i32 %tmp31, 64
  br i1 %cmp32, label %for.body33, label %for.end50

for.body33:                                       ; preds = %for.cond30
  %tmp36 = load i64* getelementptr inbounds ([64 x i64]* @zext, i32 0, i64 0), align 8
  %tmp37 = load i32* %i, align 4
  %call38 = call i64 @constant_shift(i64 %tmp36, i32 %tmp37)
  store i64 %call38, i64* %y35, align 8
  %tmp39 = load i64* %y35, align 8
  %tmp40 = load i32* %i, align 4
  %idxprom41 = sext i32 %tmp40 to i64
  %arrayidx42 = getelementptr inbounds [64 x i64]* @zext, i32 0, i64 %idxprom41
  %tmp43 = load i64* %arrayidx42, align 8
  %cmp44 = icmp ne i64 %tmp39, %tmp43
  br i1 %cmp44, label %if.then45, label %if.end46

if.then45:                                        ; preds = %for.body33
  call void @abort() noreturn
  unreachable

if.end46:                                         ; preds = %for.body33
  br label %for.inc47

for.inc47:                                        ; preds = %if.end46
  %tmp48 = load i32* %i, align 4
  %inc49 = add nsw i32 %tmp48, 1
  store i32 %inc49, i32* %i, align 4
  br label %for.cond30

for.end50:                                        ; preds = %for.cond30
  store i32 0, i32* %i, align 4
  br label %for.cond51

for.cond51:                                       ; preds = %for.inc68, %for.end50
  %tmp52 = load i32* %i, align 4
  %cmp53 = icmp slt i32 %tmp52, 64
  br i1 %cmp53, label %for.body54, label %for.end71

for.body54:                                       ; preds = %for.cond51
  %tmp57 = load i64* getelementptr inbounds ([64 x i64]* @sext, i32 0, i64 0), align 8
  %tmp58 = load i32* %i, align 4
  %call59 = call i64 @constant_shift(i64 %tmp57, i32 %tmp58)
  store i64 %call59, i64* %y56, align 8
  %tmp60 = load i64* %y56, align 8
  %tmp61 = load i32* %i, align 4
  %idxprom62 = sext i32 %tmp61 to i64
  %arrayidx63 = getelementptr inbounds [64 x i64]* @sext, i32 0, i64 %idxprom62
  %tmp64 = load i64* %arrayidx63, align 8
  %cmp65 = icmp ne i64 %tmp60, %tmp64
  br i1 %cmp65, label %if.then66, label %if.end67

if.then66:                                        ; preds = %for.body54
  call void @abort() noreturn
  unreachable

if.end67:                                         ; preds = %for.body54
  br label %for.inc68

for.inc68:                                        ; preds = %if.end67
  %tmp69 = load i32* %i, align 4
  %inc70 = add nsw i32 %tmp69, 1
  store i32 %inc70, i32* %i, align 4
  br label %for.cond51

for.end71:                                        ; preds = %for.cond51
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
  %shr = ashr i64 %tmp, %sh_prom
  ret i64 %shr
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
  %shr = ashr i64 %tmp1, 0
  store i64 %shr, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb2:                                           ; preds = %entry
  %tmp3 = load i64* %x.addr, align 8
  %shr4 = ashr i64 %tmp3, 1
  store i64 %shr4, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb5:                                           ; preds = %entry
  %tmp6 = load i64* %x.addr, align 8
  %shr7 = ashr i64 %tmp6, 2
  store i64 %shr7, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb8:                                           ; preds = %entry
  %tmp9 = load i64* %x.addr, align 8
  %shr10 = ashr i64 %tmp9, 3
  store i64 %shr10, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb11:                                          ; preds = %entry
  %tmp12 = load i64* %x.addr, align 8
  %shr13 = ashr i64 %tmp12, 4
  store i64 %shr13, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb14:                                          ; preds = %entry
  %tmp15 = load i64* %x.addr, align 8
  %shr16 = ashr i64 %tmp15, 5
  store i64 %shr16, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb17:                                          ; preds = %entry
  %tmp18 = load i64* %x.addr, align 8
  %shr19 = ashr i64 %tmp18, 6
  store i64 %shr19, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb20:                                          ; preds = %entry
  %tmp21 = load i64* %x.addr, align 8
  %shr22 = ashr i64 %tmp21, 7
  store i64 %shr22, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb23:                                          ; preds = %entry
  %tmp24 = load i64* %x.addr, align 8
  %shr25 = ashr i64 %tmp24, 8
  store i64 %shr25, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb26:                                          ; preds = %entry
  %tmp27 = load i64* %x.addr, align 8
  %shr28 = ashr i64 %tmp27, 9
  store i64 %shr28, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb29:                                          ; preds = %entry
  %tmp30 = load i64* %x.addr, align 8
  %shr31 = ashr i64 %tmp30, 10
  store i64 %shr31, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb32:                                          ; preds = %entry
  %tmp33 = load i64* %x.addr, align 8
  %shr34 = ashr i64 %tmp33, 11
  store i64 %shr34, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb35:                                          ; preds = %entry
  %tmp36 = load i64* %x.addr, align 8
  %shr37 = ashr i64 %tmp36, 12
  store i64 %shr37, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb38:                                          ; preds = %entry
  %tmp39 = load i64* %x.addr, align 8
  %shr40 = ashr i64 %tmp39, 13
  store i64 %shr40, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb41:                                          ; preds = %entry
  %tmp42 = load i64* %x.addr, align 8
  %shr43 = ashr i64 %tmp42, 14
  store i64 %shr43, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb44:                                          ; preds = %entry
  %tmp45 = load i64* %x.addr, align 8
  %shr46 = ashr i64 %tmp45, 15
  store i64 %shr46, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb47:                                          ; preds = %entry
  %tmp48 = load i64* %x.addr, align 8
  %shr49 = ashr i64 %tmp48, 16
  store i64 %shr49, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb50:                                          ; preds = %entry
  %tmp51 = load i64* %x.addr, align 8
  %shr52 = ashr i64 %tmp51, 17
  store i64 %shr52, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb53:                                          ; preds = %entry
  %tmp54 = load i64* %x.addr, align 8
  %shr55 = ashr i64 %tmp54, 18
  store i64 %shr55, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb56:                                          ; preds = %entry
  %tmp57 = load i64* %x.addr, align 8
  %shr58 = ashr i64 %tmp57, 19
  store i64 %shr58, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb59:                                          ; preds = %entry
  %tmp60 = load i64* %x.addr, align 8
  %shr61 = ashr i64 %tmp60, 20
  store i64 %shr61, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb62:                                          ; preds = %entry
  %tmp63 = load i64* %x.addr, align 8
  %shr64 = ashr i64 %tmp63, 21
  store i64 %shr64, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb65:                                          ; preds = %entry
  %tmp66 = load i64* %x.addr, align 8
  %shr67 = ashr i64 %tmp66, 22
  store i64 %shr67, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb68:                                          ; preds = %entry
  %tmp69 = load i64* %x.addr, align 8
  %shr70 = ashr i64 %tmp69, 23
  store i64 %shr70, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb71:                                          ; preds = %entry
  %tmp72 = load i64* %x.addr, align 8
  %shr73 = ashr i64 %tmp72, 24
  store i64 %shr73, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb74:                                          ; preds = %entry
  %tmp75 = load i64* %x.addr, align 8
  %shr76 = ashr i64 %tmp75, 25
  store i64 %shr76, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb77:                                          ; preds = %entry
  %tmp78 = load i64* %x.addr, align 8
  %shr79 = ashr i64 %tmp78, 26
  store i64 %shr79, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb80:                                          ; preds = %entry
  %tmp81 = load i64* %x.addr, align 8
  %shr82 = ashr i64 %tmp81, 27
  store i64 %shr82, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb83:                                          ; preds = %entry
  %tmp84 = load i64* %x.addr, align 8
  %shr85 = ashr i64 %tmp84, 28
  store i64 %shr85, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb86:                                          ; preds = %entry
  %tmp87 = load i64* %x.addr, align 8
  %shr88 = ashr i64 %tmp87, 29
  store i64 %shr88, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb89:                                          ; preds = %entry
  %tmp90 = load i64* %x.addr, align 8
  %shr91 = ashr i64 %tmp90, 30
  store i64 %shr91, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb92:                                          ; preds = %entry
  %tmp93 = load i64* %x.addr, align 8
  %shr94 = ashr i64 %tmp93, 31
  store i64 %shr94, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb95:                                          ; preds = %entry
  %tmp96 = load i64* %x.addr, align 8
  %shr97 = ashr i64 %tmp96, 32
  store i64 %shr97, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb98:                                          ; preds = %entry
  %tmp99 = load i64* %x.addr, align 8
  %shr100 = ashr i64 %tmp99, 33
  store i64 %shr100, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb101:                                         ; preds = %entry
  %tmp102 = load i64* %x.addr, align 8
  %shr103 = ashr i64 %tmp102, 34
  store i64 %shr103, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb104:                                         ; preds = %entry
  %tmp105 = load i64* %x.addr, align 8
  %shr106 = ashr i64 %tmp105, 35
  store i64 %shr106, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb107:                                         ; preds = %entry
  %tmp108 = load i64* %x.addr, align 8
  %shr109 = ashr i64 %tmp108, 36
  store i64 %shr109, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb110:                                         ; preds = %entry
  %tmp111 = load i64* %x.addr, align 8
  %shr112 = ashr i64 %tmp111, 37
  store i64 %shr112, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb113:                                         ; preds = %entry
  %tmp114 = load i64* %x.addr, align 8
  %shr115 = ashr i64 %tmp114, 38
  store i64 %shr115, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb116:                                         ; preds = %entry
  %tmp117 = load i64* %x.addr, align 8
  %shr118 = ashr i64 %tmp117, 39
  store i64 %shr118, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb119:                                         ; preds = %entry
  %tmp120 = load i64* %x.addr, align 8
  %shr121 = ashr i64 %tmp120, 40
  store i64 %shr121, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb122:                                         ; preds = %entry
  %tmp123 = load i64* %x.addr, align 8
  %shr124 = ashr i64 %tmp123, 41
  store i64 %shr124, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb125:                                         ; preds = %entry
  %tmp126 = load i64* %x.addr, align 8
  %shr127 = ashr i64 %tmp126, 42
  store i64 %shr127, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb128:                                         ; preds = %entry
  %tmp129 = load i64* %x.addr, align 8
  %shr130 = ashr i64 %tmp129, 43
  store i64 %shr130, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb131:                                         ; preds = %entry
  %tmp132 = load i64* %x.addr, align 8
  %shr133 = ashr i64 %tmp132, 44
  store i64 %shr133, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb134:                                         ; preds = %entry
  %tmp135 = load i64* %x.addr, align 8
  %shr136 = ashr i64 %tmp135, 45
  store i64 %shr136, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb137:                                         ; preds = %entry
  %tmp138 = load i64* %x.addr, align 8
  %shr139 = ashr i64 %tmp138, 46
  store i64 %shr139, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb140:                                         ; preds = %entry
  %tmp141 = load i64* %x.addr, align 8
  %shr142 = ashr i64 %tmp141, 47
  store i64 %shr142, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb143:                                         ; preds = %entry
  %tmp144 = load i64* %x.addr, align 8
  %shr145 = ashr i64 %tmp144, 48
  store i64 %shr145, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb146:                                         ; preds = %entry
  %tmp147 = load i64* %x.addr, align 8
  %shr148 = ashr i64 %tmp147, 49
  store i64 %shr148, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb149:                                         ; preds = %entry
  %tmp150 = load i64* %x.addr, align 8
  %shr151 = ashr i64 %tmp150, 50
  store i64 %shr151, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb152:                                         ; preds = %entry
  %tmp153 = load i64* %x.addr, align 8
  %shr154 = ashr i64 %tmp153, 51
  store i64 %shr154, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb155:                                         ; preds = %entry
  %tmp156 = load i64* %x.addr, align 8
  %shr157 = ashr i64 %tmp156, 52
  store i64 %shr157, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb158:                                         ; preds = %entry
  %tmp159 = load i64* %x.addr, align 8
  %shr160 = ashr i64 %tmp159, 53
  store i64 %shr160, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb161:                                         ; preds = %entry
  %tmp162 = load i64* %x.addr, align 8
  %shr163 = ashr i64 %tmp162, 54
  store i64 %shr163, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb164:                                         ; preds = %entry
  %tmp165 = load i64* %x.addr, align 8
  %shr166 = ashr i64 %tmp165, 55
  store i64 %shr166, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb167:                                         ; preds = %entry
  %tmp168 = load i64* %x.addr, align 8
  %shr169 = ashr i64 %tmp168, 56
  store i64 %shr169, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb170:                                         ; preds = %entry
  %tmp171 = load i64* %x.addr, align 8
  %shr172 = ashr i64 %tmp171, 57
  store i64 %shr172, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb173:                                         ; preds = %entry
  %tmp174 = load i64* %x.addr, align 8
  %shr175 = ashr i64 %tmp174, 58
  store i64 %shr175, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb176:                                         ; preds = %entry
  %tmp177 = load i64* %x.addr, align 8
  %shr178 = ashr i64 %tmp177, 59
  store i64 %shr178, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb179:                                         ; preds = %entry
  %tmp180 = load i64* %x.addr, align 8
  %shr181 = ashr i64 %tmp180, 60
  store i64 %shr181, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb182:                                         ; preds = %entry
  %tmp183 = load i64* %x.addr, align 8
  %shr184 = ashr i64 %tmp183, 61
  store i64 %shr184, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb185:                                         ; preds = %entry
  %tmp186 = load i64* %x.addr, align 8
  %shr187 = ashr i64 %tmp186, 62
  store i64 %shr187, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb188:                                         ; preds = %entry
  %tmp189 = load i64* %x.addr, align 8
  %shr190 = ashr i64 %tmp189, 63
  store i64 %shr190, i64* %x.addr, align 8
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  call void @abort() noreturn
  unreachable

sw.epilog:                                        ; preds = %sw.bb188, %sw.bb185, %sw.bb182, %sw.bb179, %sw.bb176, %sw.bb173, %sw.bb170, %sw.bb167, %sw.bb164, %sw.bb161, %sw.bb158, %sw.bb155, %sw.bb152, %sw.bb149, %sw.bb146, %sw.bb143, %sw.bb140, %sw.bb137, %sw.bb134, %sw.bb131, %sw.bb128, %sw.bb125, %sw.bb122, %sw.bb119, %sw.bb116, %sw.bb113, %sw.bb110, %sw.bb107, %sw.bb104, %sw.bb101, %sw.bb98, %sw.bb95, %sw.bb92, %sw.bb89, %sw.bb86, %sw.bb83, %sw.bb80, %sw.bb77, %sw.bb74, %sw.bb71, %sw.bb68, %sw.bb65, %sw.bb62, %sw.bb59, %sw.bb56, %sw.bb53, %sw.bb50, %sw.bb47, %sw.bb44, %sw.bb41, %sw.bb38, %sw.bb35, %sw.bb32, %sw.bb29, %sw.bb26, %sw.bb23, %sw.bb20, %sw.bb17, %sw.bb14, %sw.bb11, %sw.bb8, %sw.bb5, %sw.bb2, %sw.bb
  %tmp191 = load i64* %x.addr, align 8
  ret i64 %tmp191
}

declare void @exit(i32) noreturn
