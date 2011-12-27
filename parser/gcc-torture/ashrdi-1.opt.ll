; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/ashrdi-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@zext = internal unnamed_addr constant [64 x i64] [i64 8526495107234113920, i64 4263247553617056960, i64 2131623776808528480, i64 1065811888404264240, i64 532905944202132120, i64 266452972101066060, i64 133226486050533030, i64 66613243025266515, i64 33306621512633257, i64 16653310756316628, i64 8326655378158314, i64 4163327689079157, i64 2081663844539578, i64 1040831922269789, i64 520415961134894, i64 260207980567447, i64 130103990283723, i64 65051995141861, i64 32525997570930, i64 16262998785465, i64 8131499392732, i64 4065749696366, i64 2032874848183, i64 1016437424091, i64 508218712045, i64 254109356022, i64 127054678011, i64 63527339005, i64 31763669502, i64 15881834751, i64 7940917375, i64 3970458687, i64 1985229343, i64 992614671, i64 496307335, i64 248153667, i64 124076833, i64 62038416, i64 31019208, i64 15509604, i64 7754802, i64 3877401, i64 1938700, i64 969350, i64 484675, i64 242337, i64 121168, i64 60584, i64 30292, i64 15146, i64 7573, i64 3786, i64 1893, i64 946, i64 473, i64 236, i64 118, i64 59, i64 29, i64 14, i64 7, i64 3, i64 1, i64 0], align 16
@sext = internal unnamed_addr constant [64 x i64] [i64 -8152436031399644656, i64 -4076218015699822328, i64 -2038109007849911164, i64 -1019054503924955582, i64 -509527251962477791, i64 -254763625981238896, i64 -127381812990619448, i64 -63690906495309724, i64 -31845453247654862, i64 -15922726623827431, i64 -7961363311913716, i64 -3980681655956858, i64 -1990340827978429, i64 -995170413989215, i64 -497585206994608, i64 -248792603497304, i64 -124396301748652, i64 -62198150874326, i64 -31099075437163, i64 -15549537718582, i64 -7774768859291, i64 -3887384429646, i64 -1943692214823, i64 -971846107412, i64 -485923053706, i64 -242961526853, i64 -121480763427, i64 -60740381714, i64 -30370190857, i64 -15185095429, i64 -7592547715, i64 -3796273858, i64 -1898136929, i64 -949068465, i64 -474534233, i64 -237267117, i64 -118633559, i64 -59316780, i64 -29658390, i64 -14829195, i64 -7414598, i64 -3707299, i64 -1853650, i64 -926825, i64 -463413, i64 -231707, i64 -115854, i64 -57927, i64 -28964, i64 -14482, i64 -7241, i64 -3621, i64 -1811, i64 -906, i64 -453, i64 -227, i64 -114, i64 -57, i64 -29, i64 -15, i64 -8, i64 -4, i64 -2, i64 -1], align 16

define i32 @main() noreturn nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %sh_prom.i = phi i64 [ %indvar.next11, %for.inc ], [ 0, %entry ]
  %storemerge = trunc i64 %sh_prom.i to i32
  %cmp = icmp slt i32 %storemerge, 64
  br i1 %cmp, label %for.body, label %for.cond9

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr [64 x i64]* @zext, i64 0, i64 %sh_prom.i
  %shr.i = lshr i64 8526495107234113920, %sh_prom.i
  %tmp6 = load i64* %arrayidx, align 8
  %cmp7 = icmp eq i64 %shr.i, %tmp6
  br i1 %cmp7, label %for.inc, label %if.then

if.then:                                          ; preds = %for.body
  tail call void @abort() noreturn nounwind
  unreachable

for.inc:                                          ; preds = %for.body
  %indvar.next11 = add i64 %sh_prom.i, 1
  br label %for.cond

for.cond9:                                        ; preds = %for.cond, %for.inc26
  %sh_prom.i4 = phi i64 [ %indvar.next9, %for.inc26 ], [ 0, %for.cond ]
  %storemerge1 = trunc i64 %sh_prom.i4 to i32
  %cmp11 = icmp slt i32 %storemerge1, 64
  br i1 %cmp11, label %for.body12, label %for.cond30

for.body12:                                       ; preds = %for.cond9
  %arrayidx21 = getelementptr [64 x i64]* @sext, i64 0, i64 %sh_prom.i4
  %shr.i5 = ashr i64 -8152436031399644656, %sh_prom.i4
  %tmp22 = load i64* %arrayidx21, align 8
  %cmp23 = icmp eq i64 %shr.i5, %tmp22
  br i1 %cmp23, label %for.inc26, label %if.then24

if.then24:                                        ; preds = %for.body12
  tail call void @abort() noreturn nounwind
  unreachable

for.inc26:                                        ; preds = %for.body12
  %indvar.next9 = add i64 %sh_prom.i4, 1
  br label %for.cond9

for.cond30:                                       ; preds = %for.cond9, %for.inc47
  %indvar6 = phi i64 [ %indvar.next7, %for.inc47 ], [ 0, %for.cond9 ]
  %storemerge2 = trunc i64 %indvar6 to i32
  %cmp32 = icmp slt i32 %storemerge2, 64
  br i1 %cmp32, label %for.body33, label %for.cond51

for.body33:                                       ; preds = %for.cond30
  %arrayidx42 = getelementptr [64 x i64]* @zext, i64 0, i64 %indvar6
  %call38 = tail call fastcc i64 @constant_shift(i64 8526495107234113920, i32 %storemerge2)
  %tmp43 = load i64* %arrayidx42, align 8
  %cmp44 = icmp eq i64 %call38, %tmp43
  br i1 %cmp44, label %for.inc47, label %if.then45

if.then45:                                        ; preds = %for.body33
  tail call void @abort() noreturn nounwind
  unreachable

for.inc47:                                        ; preds = %for.body33
  %indvar.next7 = add i64 %indvar6, 1
  br label %for.cond30

for.cond51:                                       ; preds = %for.cond30, %for.inc68
  %indvar = phi i64 [ %indvar.next, %for.inc68 ], [ 0, %for.cond30 ]
  %storemerge3 = trunc i64 %indvar to i32
  %cmp53 = icmp slt i32 %storemerge3, 64
  br i1 %cmp53, label %for.body54, label %for.end71

for.body54:                                       ; preds = %for.cond51
  %arrayidx63 = getelementptr [64 x i64]* @sext, i64 0, i64 %indvar
  %call59 = tail call fastcc i64 @constant_shift(i64 -8152436031399644656, i32 %storemerge3)
  %tmp64 = load i64* %arrayidx63, align 8
  %cmp65 = icmp eq i64 %call59, %tmp64
  br i1 %cmp65, label %for.inc68, label %if.then66

if.then66:                                        ; preds = %for.body54
  tail call void @abort() noreturn nounwind
  unreachable

for.inc68:                                        ; preds = %for.body54
  %indvar.next = add i64 %indvar, 1
  br label %for.cond51

for.end71:                                        ; preds = %for.cond51
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn

define internal fastcc i64 @constant_shift(i64 %x, i32 %i) nounwind uwtable {
entry:
  switch i32 %i, label %sw.default [
    i32 0, label %sw.epilog
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

sw.bb2:                                           ; preds = %entry
  %shr4 = ashr i64 %x, 1
  br label %sw.epilog

sw.bb5:                                           ; preds = %entry
  %shr7 = ashr i64 %x, 2
  br label %sw.epilog

sw.bb8:                                           ; preds = %entry
  %shr10 = ashr i64 %x, 3
  br label %sw.epilog

sw.bb11:                                          ; preds = %entry
  %shr13 = ashr i64 %x, 4
  br label %sw.epilog

sw.bb14:                                          ; preds = %entry
  %shr16 = ashr i64 %x, 5
  br label %sw.epilog

sw.bb17:                                          ; preds = %entry
  %shr19 = ashr i64 %x, 6
  br label %sw.epilog

sw.bb20:                                          ; preds = %entry
  %shr22 = ashr i64 %x, 7
  br label %sw.epilog

sw.bb23:                                          ; preds = %entry
  %shr25 = ashr i64 %x, 8
  br label %sw.epilog

sw.bb26:                                          ; preds = %entry
  %shr28 = ashr i64 %x, 9
  br label %sw.epilog

sw.bb29:                                          ; preds = %entry
  %shr31 = ashr i64 %x, 10
  br label %sw.epilog

sw.bb32:                                          ; preds = %entry
  %shr34 = ashr i64 %x, 11
  br label %sw.epilog

sw.bb35:                                          ; preds = %entry
  %shr37 = ashr i64 %x, 12
  br label %sw.epilog

sw.bb38:                                          ; preds = %entry
  %shr40 = ashr i64 %x, 13
  br label %sw.epilog

sw.bb41:                                          ; preds = %entry
  %shr43 = ashr i64 %x, 14
  br label %sw.epilog

sw.bb44:                                          ; preds = %entry
  %shr46 = ashr i64 %x, 15
  br label %sw.epilog

sw.bb47:                                          ; preds = %entry
  %shr49 = ashr i64 %x, 16
  br label %sw.epilog

sw.bb50:                                          ; preds = %entry
  %shr52 = ashr i64 %x, 17
  br label %sw.epilog

sw.bb53:                                          ; preds = %entry
  %shr55 = ashr i64 %x, 18
  br label %sw.epilog

sw.bb56:                                          ; preds = %entry
  %shr58 = ashr i64 %x, 19
  br label %sw.epilog

sw.bb59:                                          ; preds = %entry
  %shr61 = ashr i64 %x, 20
  br label %sw.epilog

sw.bb62:                                          ; preds = %entry
  %shr64 = ashr i64 %x, 21
  br label %sw.epilog

sw.bb65:                                          ; preds = %entry
  %shr67 = ashr i64 %x, 22
  br label %sw.epilog

sw.bb68:                                          ; preds = %entry
  %shr70 = ashr i64 %x, 23
  br label %sw.epilog

sw.bb71:                                          ; preds = %entry
  %shr73 = ashr i64 %x, 24
  br label %sw.epilog

sw.bb74:                                          ; preds = %entry
  %shr76 = ashr i64 %x, 25
  br label %sw.epilog

sw.bb77:                                          ; preds = %entry
  %shr79 = ashr i64 %x, 26
  br label %sw.epilog

sw.bb80:                                          ; preds = %entry
  %shr82 = ashr i64 %x, 27
  br label %sw.epilog

sw.bb83:                                          ; preds = %entry
  %shr85 = ashr i64 %x, 28
  br label %sw.epilog

sw.bb86:                                          ; preds = %entry
  %shr88 = ashr i64 %x, 29
  br label %sw.epilog

sw.bb89:                                          ; preds = %entry
  %shr91 = ashr i64 %x, 30
  br label %sw.epilog

sw.bb92:                                          ; preds = %entry
  %shr94 = ashr i64 %x, 31
  br label %sw.epilog

sw.bb95:                                          ; preds = %entry
  %shr97 = ashr i64 %x, 32
  br label %sw.epilog

sw.bb98:                                          ; preds = %entry
  %shr100 = ashr i64 %x, 33
  br label %sw.epilog

sw.bb101:                                         ; preds = %entry
  %shr103 = ashr i64 %x, 34
  br label %sw.epilog

sw.bb104:                                         ; preds = %entry
  %shr106 = ashr i64 %x, 35
  br label %sw.epilog

sw.bb107:                                         ; preds = %entry
  %shr109 = ashr i64 %x, 36
  br label %sw.epilog

sw.bb110:                                         ; preds = %entry
  %shr112 = ashr i64 %x, 37
  br label %sw.epilog

sw.bb113:                                         ; preds = %entry
  %shr115 = ashr i64 %x, 38
  br label %sw.epilog

sw.bb116:                                         ; preds = %entry
  %shr118 = ashr i64 %x, 39
  br label %sw.epilog

sw.bb119:                                         ; preds = %entry
  %shr121 = ashr i64 %x, 40
  br label %sw.epilog

sw.bb122:                                         ; preds = %entry
  %shr124 = ashr i64 %x, 41
  br label %sw.epilog

sw.bb125:                                         ; preds = %entry
  %shr127 = ashr i64 %x, 42
  br label %sw.epilog

sw.bb128:                                         ; preds = %entry
  %shr130 = ashr i64 %x, 43
  br label %sw.epilog

sw.bb131:                                         ; preds = %entry
  %shr133 = ashr i64 %x, 44
  br label %sw.epilog

sw.bb134:                                         ; preds = %entry
  %shr136 = ashr i64 %x, 45
  br label %sw.epilog

sw.bb137:                                         ; preds = %entry
  %shr139 = ashr i64 %x, 46
  br label %sw.epilog

sw.bb140:                                         ; preds = %entry
  %shr142 = ashr i64 %x, 47
  br label %sw.epilog

sw.bb143:                                         ; preds = %entry
  %shr145 = ashr i64 %x, 48
  br label %sw.epilog

sw.bb146:                                         ; preds = %entry
  %shr148 = ashr i64 %x, 49
  br label %sw.epilog

sw.bb149:                                         ; preds = %entry
  %shr151 = ashr i64 %x, 50
  br label %sw.epilog

sw.bb152:                                         ; preds = %entry
  %shr154 = ashr i64 %x, 51
  br label %sw.epilog

sw.bb155:                                         ; preds = %entry
  %shr157 = ashr i64 %x, 52
  br label %sw.epilog

sw.bb158:                                         ; preds = %entry
  %shr160 = ashr i64 %x, 53
  br label %sw.epilog

sw.bb161:                                         ; preds = %entry
  %shr163 = ashr i64 %x, 54
  br label %sw.epilog

sw.bb164:                                         ; preds = %entry
  %shr166 = ashr i64 %x, 55
  br label %sw.epilog

sw.bb167:                                         ; preds = %entry
  %shr169 = ashr i64 %x, 56
  br label %sw.epilog

sw.bb170:                                         ; preds = %entry
  %shr172 = ashr i64 %x, 57
  br label %sw.epilog

sw.bb173:                                         ; preds = %entry
  %shr175 = ashr i64 %x, 58
  br label %sw.epilog

sw.bb176:                                         ; preds = %entry
  %shr178 = ashr i64 %x, 59
  br label %sw.epilog

sw.bb179:                                         ; preds = %entry
  %shr181 = ashr i64 %x, 60
  br label %sw.epilog

sw.bb182:                                         ; preds = %entry
  %shr184 = ashr i64 %x, 61
  br label %sw.epilog

sw.bb185:                                         ; preds = %entry
  %shr187 = ashr i64 %x, 62
  br label %sw.epilog

sw.bb188:                                         ; preds = %entry
  %shr190 = ashr i64 %x, 63
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

sw.epilog:                                        ; preds = %entry, %sw.bb188, %sw.bb185, %sw.bb182, %sw.bb179, %sw.bb176, %sw.bb173, %sw.bb170, %sw.bb167, %sw.bb164, %sw.bb161, %sw.bb158, %sw.bb155, %sw.bb152, %sw.bb149, %sw.bb146, %sw.bb143, %sw.bb140, %sw.bb137, %sw.bb134, %sw.bb131, %sw.bb128, %sw.bb125, %sw.bb122, %sw.bb119, %sw.bb116, %sw.bb113, %sw.bb110, %sw.bb107, %sw.bb104, %sw.bb101, %sw.bb98, %sw.bb95, %sw.bb92, %sw.bb89, %sw.bb86, %sw.bb83, %sw.bb80, %sw.bb77, %sw.bb74, %sw.bb71, %sw.bb68, %sw.bb65, %sw.bb62, %sw.bb59, %sw.bb56, %sw.bb53, %sw.bb50, %sw.bb47, %sw.bb44, %sw.bb41, %sw.bb38, %sw.bb35, %sw.bb32, %sw.bb29, %sw.bb26, %sw.bb23, %sw.bb20, %sw.bb17, %sw.bb14, %sw.bb11, %sw.bb8, %sw.bb5, %sw.bb2
  %tmp1911 = phi i64 [ %x, %entry ], [ %shr190, %sw.bb188 ], [ %shr187, %sw.bb185 ], [ %shr184, %sw.bb182 ], [ %shr181, %sw.bb179 ], [ %shr178, %sw.bb176 ], [ %shr175, %sw.bb173 ], [ %shr172, %sw.bb170 ], [ %shr169, %sw.bb167 ], [ %shr166, %sw.bb164 ], [ %shr163, %sw.bb161 ], [ %shr160, %sw.bb158 ], [ %shr157, %sw.bb155 ], [ %shr154, %sw.bb152 ], [ %shr151, %sw.bb149 ], [ %shr148, %sw.bb146 ], [ %shr145, %sw.bb143 ], [ %shr142, %sw.bb140 ], [ %shr139, %sw.bb137 ], [ %shr136, %sw.bb134 ], [ %shr133, %sw.bb131 ], [ %shr130, %sw.bb128 ], [ %shr127, %sw.bb125 ], [ %shr124, %sw.bb122 ], [ %shr121, %sw.bb119 ], [ %shr118, %sw.bb116 ], [ %shr115, %sw.bb113 ], [ %shr112, %sw.bb110 ], [ %shr109, %sw.bb107 ], [ %shr106, %sw.bb104 ], [ %shr103, %sw.bb101 ], [ %shr100, %sw.bb98 ], [ %shr97, %sw.bb95 ], [ %shr94, %sw.bb92 ], [ %shr91, %sw.bb89 ], [ %shr88, %sw.bb86 ], [ %shr85, %sw.bb83 ], [ %shr82, %sw.bb80 ], [ %shr79, %sw.bb77 ], [ %shr76, %sw.bb74 ], [ %shr73, %sw.bb71 ], [ %shr70, %sw.bb68 ], [ %shr67, %sw.bb65 ], [ %shr64, %sw.bb62 ], [ %shr61, %sw.bb59 ], [ %shr58, %sw.bb56 ], [ %shr55, %sw.bb53 ], [ %shr52, %sw.bb50 ], [ %shr49, %sw.bb47 ], [ %shr46, %sw.bb44 ], [ %shr43, %sw.bb41 ], [ %shr40, %sw.bb38 ], [ %shr37, %sw.bb35 ], [ %shr34, %sw.bb32 ], [ %shr31, %sw.bb29 ], [ %shr28, %sw.bb26 ], [ %shr25, %sw.bb23 ], [ %shr22, %sw.bb20 ], [ %shr19, %sw.bb17 ], [ %shr16, %sw.bb14 ], [ %shr13, %sw.bb11 ], [ %shr10, %sw.bb8 ], [ %shr7, %sw.bb5 ], [ %shr4, %sw.bb2 ]
  ret i64 %tmp1911
}

declare void @exit(i32) noreturn
