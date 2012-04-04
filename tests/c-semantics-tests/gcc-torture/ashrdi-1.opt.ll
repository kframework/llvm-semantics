; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/ashrdi-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@zext = internal unnamed_addr constant [64 x i64] [i64 8526495107234113920, i64 4263247553617056960, i64 2131623776808528480, i64 1065811888404264240, i64 532905944202132120, i64 266452972101066060, i64 133226486050533030, i64 66613243025266515, i64 33306621512633257, i64 16653310756316628, i64 8326655378158314, i64 4163327689079157, i64 2081663844539578, i64 1040831922269789, i64 520415961134894, i64 260207980567447, i64 130103990283723, i64 65051995141861, i64 32525997570930, i64 16262998785465, i64 8131499392732, i64 4065749696366, i64 2032874848183, i64 1016437424091, i64 508218712045, i64 254109356022, i64 127054678011, i64 63527339005, i64 31763669502, i64 15881834751, i64 7940917375, i64 3970458687, i64 1985229343, i64 992614671, i64 496307335, i64 248153667, i64 124076833, i64 62038416, i64 31019208, i64 15509604, i64 7754802, i64 3877401, i64 1938700, i64 969350, i64 484675, i64 242337, i64 121168, i64 60584, i64 30292, i64 15146, i64 7573, i64 3786, i64 1893, i64 946, i64 473, i64 236, i64 118, i64 59, i64 29, i64 14, i64 7, i64 3, i64 1, i64 0], align 16
@sext = internal unnamed_addr constant [64 x i64] [i64 -8152436031399644656, i64 -4076218015699822328, i64 -2038109007849911164, i64 -1019054503924955582, i64 -509527251962477791, i64 -254763625981238896, i64 -127381812990619448, i64 -63690906495309724, i64 -31845453247654862, i64 -15922726623827431, i64 -7961363311913716, i64 -3980681655956858, i64 -1990340827978429, i64 -995170413989215, i64 -497585206994608, i64 -248792603497304, i64 -124396301748652, i64 -62198150874326, i64 -31099075437163, i64 -15549537718582, i64 -7774768859291, i64 -3887384429646, i64 -1943692214823, i64 -971846107412, i64 -485923053706, i64 -242961526853, i64 -121480763427, i64 -60740381714, i64 -30370190857, i64 -15185095429, i64 -7592547715, i64 -3796273858, i64 -1898136929, i64 -949068465, i64 -474534233, i64 -237267117, i64 -118633559, i64 -59316780, i64 -29658390, i64 -14829195, i64 -7414598, i64 -3707299, i64 -1853650, i64 -926825, i64 -463413, i64 -231707, i64 -115854, i64 -57927, i64 -28964, i64 -14482, i64 -7241, i64 -3621, i64 -1811, i64 -906, i64 -453, i64 -227, i64 -114, i64 -57, i64 -29, i64 -15, i64 -8, i64 -4, i64 -2, i64 -1], align 16

define i32 @main() noreturn nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %for.body ], [ 0, %entry ]
  %0 = trunc i64 %indvars.iv47 to i32
  %cmp = icmp slt i32 %0, 64
  br i1 %cmp, label %for.body, label %for.cond2

for.body:                                         ; preds = %for.cond
  %sh_prom.i = and i64 %indvars.iv47, 4294967295
  %shr.i = lshr i64 8526495107234113920, %sh_prom.i
  %arrayidx = getelementptr inbounds [64 x i64]* @zext, i64 0, i64 %indvars.iv47
  %1 = load i64* %arrayidx, align 8, !tbaa !0
  %cmp1 = icmp eq i64 %shr.i, %1
  %indvars.iv.next48 = add i64 %indvars.iv47, 1
  br i1 %cmp1, label %for.cond, label %if.then

if.then:                                          ; preds = %for.body
  tail call void @abort() noreturn nounwind
  unreachable

for.cond2:                                        ; preds = %for.cond, %for.body4
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %for.body4 ], [ 0, %for.cond ]
  %2 = trunc i64 %indvars.iv45 to i32
  %cmp3 = icmp slt i32 %2, 64
  br i1 %cmp3, label %for.body4, label %for.cond15

for.body4:                                        ; preds = %for.cond2
  %sh_prom.i41 = and i64 %indvars.iv45, 4294967295
  %shr.i42 = ashr i64 -8152436031399644656, %sh_prom.i41
  %arrayidx8 = getelementptr inbounds [64 x i64]* @sext, i64 0, i64 %indvars.iv45
  %3 = load i64* %arrayidx8, align 8, !tbaa !0
  %cmp9 = icmp eq i64 %shr.i42, %3
  %indvars.iv.next46 = add i64 %indvars.iv45, 1
  br i1 %cmp9, label %for.cond2, label %if.then10

if.then10:                                        ; preds = %for.body4
  tail call void @abort() noreturn nounwind
  unreachable

for.cond15:                                       ; preds = %for.cond2, %for.body17
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %for.body17 ], [ 0, %for.cond2 ]
  %4 = trunc i64 %indvars.iv43 to i32
  %cmp16 = icmp slt i32 %4, 64
  br i1 %cmp16, label %for.body17, label %for.cond28

for.body17:                                       ; preds = %for.cond15
  %call19 = tail call fastcc i64 @constant_shift(i64 8526495107234113920, i32 %4)
  %arrayidx21 = getelementptr inbounds [64 x i64]* @zext, i64 0, i64 %indvars.iv43
  %5 = load i64* %arrayidx21, align 8, !tbaa !0
  %cmp22 = icmp eq i64 %call19, %5
  %indvars.iv.next44 = add i64 %indvars.iv43, 1
  br i1 %cmp22, label %for.cond15, label %if.then23

if.then23:                                        ; preds = %for.body17
  tail call void @abort() noreturn nounwind
  unreachable

for.cond28:                                       ; preds = %for.cond15, %for.body30
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body30 ], [ 0, %for.cond15 ]
  %6 = trunc i64 %indvars.iv to i32
  %cmp29 = icmp slt i32 %6, 64
  br i1 %cmp29, label %for.body30, label %for.end40

for.body30:                                       ; preds = %for.cond28
  %call32 = tail call fastcc i64 @constant_shift(i64 -8152436031399644656, i32 %6)
  %arrayidx34 = getelementptr inbounds [64 x i64]* @sext, i64 0, i64 %indvars.iv
  %7 = load i64* %arrayidx34, align 8, !tbaa !0
  %cmp35 = icmp eq i64 %call32, %7
  %indvars.iv.next = add i64 %indvars.iv, 1
  br i1 %cmp35, label %for.cond28, label %if.then36

if.then36:                                        ; preds = %for.body30
  tail call void @abort() noreturn nounwind
  unreachable

for.end40:                                        ; preds = %for.cond28
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn

define internal fastcc i64 @constant_shift(i64 %x, i32 %i) nounwind uwtable {
entry:
  switch i32 %i, label %sw.default [
    i32 0, label %sw.epilog
    i32 1, label %sw.bb1
    i32 2, label %sw.bb3
    i32 3, label %sw.bb5
    i32 4, label %sw.bb7
    i32 5, label %sw.bb9
    i32 6, label %sw.bb11
    i32 7, label %sw.bb13
    i32 8, label %sw.bb15
    i32 9, label %sw.bb17
    i32 10, label %sw.bb19
    i32 11, label %sw.bb21
    i32 12, label %sw.bb23
    i32 13, label %sw.bb25
    i32 14, label %sw.bb27
    i32 15, label %sw.bb29
    i32 16, label %sw.bb31
    i32 17, label %sw.bb33
    i32 18, label %sw.bb35
    i32 19, label %sw.bb37
    i32 20, label %sw.bb39
    i32 21, label %sw.bb41
    i32 22, label %sw.bb43
    i32 23, label %sw.bb45
    i32 24, label %sw.bb47
    i32 25, label %sw.bb49
    i32 26, label %sw.bb51
    i32 27, label %sw.bb53
    i32 28, label %sw.bb55
    i32 29, label %sw.bb57
    i32 30, label %sw.bb59
    i32 31, label %sw.bb61
    i32 32, label %sw.bb63
    i32 33, label %sw.bb65
    i32 34, label %sw.bb67
    i32 35, label %sw.bb69
    i32 36, label %sw.bb71
    i32 37, label %sw.bb73
    i32 38, label %sw.bb75
    i32 39, label %sw.bb77
    i32 40, label %sw.bb79
    i32 41, label %sw.bb81
    i32 42, label %sw.bb83
    i32 43, label %sw.bb85
    i32 44, label %sw.bb87
    i32 45, label %sw.bb89
    i32 46, label %sw.bb91
    i32 47, label %sw.bb93
    i32 48, label %sw.bb95
    i32 49, label %sw.bb97
    i32 50, label %sw.bb99
    i32 51, label %sw.bb101
    i32 52, label %sw.bb103
    i32 53, label %sw.bb105
    i32 54, label %sw.bb107
    i32 55, label %sw.bb109
    i32 56, label %sw.bb111
    i32 57, label %sw.bb113
    i32 58, label %sw.bb115
    i32 59, label %sw.bb117
    i32 60, label %sw.bb119
    i32 61, label %sw.bb121
    i32 62, label %sw.bb123
    i32 63, label %sw.bb125
  ]

sw.bb1:                                           ; preds = %entry
  %shr2 = ashr i64 %x, 1
  br label %sw.epilog

sw.bb3:                                           ; preds = %entry
  %shr4 = ashr i64 %x, 2
  br label %sw.epilog

sw.bb5:                                           ; preds = %entry
  %shr6 = ashr i64 %x, 3
  br label %sw.epilog

sw.bb7:                                           ; preds = %entry
  %shr8 = ashr i64 %x, 4
  br label %sw.epilog

sw.bb9:                                           ; preds = %entry
  %shr10 = ashr i64 %x, 5
  br label %sw.epilog

sw.bb11:                                          ; preds = %entry
  %shr12 = ashr i64 %x, 6
  br label %sw.epilog

sw.bb13:                                          ; preds = %entry
  %shr14 = ashr i64 %x, 7
  br label %sw.epilog

sw.bb15:                                          ; preds = %entry
  %shr16 = ashr i64 %x, 8
  br label %sw.epilog

sw.bb17:                                          ; preds = %entry
  %shr18 = ashr i64 %x, 9
  br label %sw.epilog

sw.bb19:                                          ; preds = %entry
  %shr20 = ashr i64 %x, 10
  br label %sw.epilog

sw.bb21:                                          ; preds = %entry
  %shr22 = ashr i64 %x, 11
  br label %sw.epilog

sw.bb23:                                          ; preds = %entry
  %shr24 = ashr i64 %x, 12
  br label %sw.epilog

sw.bb25:                                          ; preds = %entry
  %shr26 = ashr i64 %x, 13
  br label %sw.epilog

sw.bb27:                                          ; preds = %entry
  %shr28 = ashr i64 %x, 14
  br label %sw.epilog

sw.bb29:                                          ; preds = %entry
  %shr30 = ashr i64 %x, 15
  br label %sw.epilog

sw.bb31:                                          ; preds = %entry
  %shr32 = ashr i64 %x, 16
  br label %sw.epilog

sw.bb33:                                          ; preds = %entry
  %shr34 = ashr i64 %x, 17
  br label %sw.epilog

sw.bb35:                                          ; preds = %entry
  %shr36 = ashr i64 %x, 18
  br label %sw.epilog

sw.bb37:                                          ; preds = %entry
  %shr38 = ashr i64 %x, 19
  br label %sw.epilog

sw.bb39:                                          ; preds = %entry
  %shr40 = ashr i64 %x, 20
  br label %sw.epilog

sw.bb41:                                          ; preds = %entry
  %shr42 = ashr i64 %x, 21
  br label %sw.epilog

sw.bb43:                                          ; preds = %entry
  %shr44 = ashr i64 %x, 22
  br label %sw.epilog

sw.bb45:                                          ; preds = %entry
  %shr46 = ashr i64 %x, 23
  br label %sw.epilog

sw.bb47:                                          ; preds = %entry
  %shr48 = ashr i64 %x, 24
  br label %sw.epilog

sw.bb49:                                          ; preds = %entry
  %shr50 = ashr i64 %x, 25
  br label %sw.epilog

sw.bb51:                                          ; preds = %entry
  %shr52 = ashr i64 %x, 26
  br label %sw.epilog

sw.bb53:                                          ; preds = %entry
  %shr54 = ashr i64 %x, 27
  br label %sw.epilog

sw.bb55:                                          ; preds = %entry
  %shr56 = ashr i64 %x, 28
  br label %sw.epilog

sw.bb57:                                          ; preds = %entry
  %shr58 = ashr i64 %x, 29
  br label %sw.epilog

sw.bb59:                                          ; preds = %entry
  %shr60 = ashr i64 %x, 30
  br label %sw.epilog

sw.bb61:                                          ; preds = %entry
  %shr62 = ashr i64 %x, 31
  br label %sw.epilog

sw.bb63:                                          ; preds = %entry
  %shr64 = ashr i64 %x, 32
  br label %sw.epilog

sw.bb65:                                          ; preds = %entry
  %shr66 = ashr i64 %x, 33
  br label %sw.epilog

sw.bb67:                                          ; preds = %entry
  %shr68 = ashr i64 %x, 34
  br label %sw.epilog

sw.bb69:                                          ; preds = %entry
  %shr70 = ashr i64 %x, 35
  br label %sw.epilog

sw.bb71:                                          ; preds = %entry
  %shr72 = ashr i64 %x, 36
  br label %sw.epilog

sw.bb73:                                          ; preds = %entry
  %shr74 = ashr i64 %x, 37
  br label %sw.epilog

sw.bb75:                                          ; preds = %entry
  %shr76 = ashr i64 %x, 38
  br label %sw.epilog

sw.bb77:                                          ; preds = %entry
  %shr78 = ashr i64 %x, 39
  br label %sw.epilog

sw.bb79:                                          ; preds = %entry
  %shr80 = ashr i64 %x, 40
  br label %sw.epilog

sw.bb81:                                          ; preds = %entry
  %shr82 = ashr i64 %x, 41
  br label %sw.epilog

sw.bb83:                                          ; preds = %entry
  %shr84 = ashr i64 %x, 42
  br label %sw.epilog

sw.bb85:                                          ; preds = %entry
  %shr86 = ashr i64 %x, 43
  br label %sw.epilog

sw.bb87:                                          ; preds = %entry
  %shr88 = ashr i64 %x, 44
  br label %sw.epilog

sw.bb89:                                          ; preds = %entry
  %shr90 = ashr i64 %x, 45
  br label %sw.epilog

sw.bb91:                                          ; preds = %entry
  %shr92 = ashr i64 %x, 46
  br label %sw.epilog

sw.bb93:                                          ; preds = %entry
  %shr94 = ashr i64 %x, 47
  br label %sw.epilog

sw.bb95:                                          ; preds = %entry
  %shr96 = ashr i64 %x, 48
  br label %sw.epilog

sw.bb97:                                          ; preds = %entry
  %shr98 = ashr i64 %x, 49
  br label %sw.epilog

sw.bb99:                                          ; preds = %entry
  %shr100 = ashr i64 %x, 50
  br label %sw.epilog

sw.bb101:                                         ; preds = %entry
  %shr102 = ashr i64 %x, 51
  br label %sw.epilog

sw.bb103:                                         ; preds = %entry
  %shr104 = ashr i64 %x, 52
  br label %sw.epilog

sw.bb105:                                         ; preds = %entry
  %shr106 = ashr i64 %x, 53
  br label %sw.epilog

sw.bb107:                                         ; preds = %entry
  %shr108 = ashr i64 %x, 54
  br label %sw.epilog

sw.bb109:                                         ; preds = %entry
  %shr110 = ashr i64 %x, 55
  br label %sw.epilog

sw.bb111:                                         ; preds = %entry
  %shr112 = ashr i64 %x, 56
  br label %sw.epilog

sw.bb113:                                         ; preds = %entry
  %shr114 = ashr i64 %x, 57
  br label %sw.epilog

sw.bb115:                                         ; preds = %entry
  %shr116 = ashr i64 %x, 58
  br label %sw.epilog

sw.bb117:                                         ; preds = %entry
  %shr118 = ashr i64 %x, 59
  br label %sw.epilog

sw.bb119:                                         ; preds = %entry
  %shr120 = ashr i64 %x, 60
  br label %sw.epilog

sw.bb121:                                         ; preds = %entry
  %shr122 = ashr i64 %x, 61
  br label %sw.epilog

sw.bb123:                                         ; preds = %entry
  %shr124 = ashr i64 %x, 62
  br label %sw.epilog

sw.bb125:                                         ; preds = %entry
  %shr126 = ashr i64 %x, 63
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

sw.epilog:                                        ; preds = %entry, %sw.bb125, %sw.bb123, %sw.bb121, %sw.bb119, %sw.bb117, %sw.bb115, %sw.bb113, %sw.bb111, %sw.bb109, %sw.bb107, %sw.bb105, %sw.bb103, %sw.bb101, %sw.bb99, %sw.bb97, %sw.bb95, %sw.bb93, %sw.bb91, %sw.bb89, %sw.bb87, %sw.bb85, %sw.bb83, %sw.bb81, %sw.bb79, %sw.bb77, %sw.bb75, %sw.bb73, %sw.bb71, %sw.bb69, %sw.bb67, %sw.bb65, %sw.bb63, %sw.bb61, %sw.bb59, %sw.bb57, %sw.bb55, %sw.bb53, %sw.bb51, %sw.bb49, %sw.bb47, %sw.bb45, %sw.bb43, %sw.bb41, %sw.bb39, %sw.bb37, %sw.bb35, %sw.bb33, %sw.bb31, %sw.bb29, %sw.bb27, %sw.bb25, %sw.bb23, %sw.bb21, %sw.bb19, %sw.bb17, %sw.bb15, %sw.bb13, %sw.bb11, %sw.bb9, %sw.bb7, %sw.bb5, %sw.bb3, %sw.bb1
  %x.addr.0 = phi i64 [ %shr126, %sw.bb125 ], [ %shr124, %sw.bb123 ], [ %shr122, %sw.bb121 ], [ %shr120, %sw.bb119 ], [ %shr118, %sw.bb117 ], [ %shr116, %sw.bb115 ], [ %shr114, %sw.bb113 ], [ %shr112, %sw.bb111 ], [ %shr110, %sw.bb109 ], [ %shr108, %sw.bb107 ], [ %shr106, %sw.bb105 ], [ %shr104, %sw.bb103 ], [ %shr102, %sw.bb101 ], [ %shr100, %sw.bb99 ], [ %shr98, %sw.bb97 ], [ %shr96, %sw.bb95 ], [ %shr94, %sw.bb93 ], [ %shr92, %sw.bb91 ], [ %shr90, %sw.bb89 ], [ %shr88, %sw.bb87 ], [ %shr86, %sw.bb85 ], [ %shr84, %sw.bb83 ], [ %shr82, %sw.bb81 ], [ %shr80, %sw.bb79 ], [ %shr78, %sw.bb77 ], [ %shr76, %sw.bb75 ], [ %shr74, %sw.bb73 ], [ %shr72, %sw.bb71 ], [ %shr70, %sw.bb69 ], [ %shr68, %sw.bb67 ], [ %shr66, %sw.bb65 ], [ %shr64, %sw.bb63 ], [ %shr62, %sw.bb61 ], [ %shr60, %sw.bb59 ], [ %shr58, %sw.bb57 ], [ %shr56, %sw.bb55 ], [ %shr54, %sw.bb53 ], [ %shr52, %sw.bb51 ], [ %shr50, %sw.bb49 ], [ %shr48, %sw.bb47 ], [ %shr46, %sw.bb45 ], [ %shr44, %sw.bb43 ], [ %shr42, %sw.bb41 ], [ %shr40, %sw.bb39 ], [ %shr38, %sw.bb37 ], [ %shr36, %sw.bb35 ], [ %shr34, %sw.bb33 ], [ %shr32, %sw.bb31 ], [ %shr30, %sw.bb29 ], [ %shr28, %sw.bb27 ], [ %shr26, %sw.bb25 ], [ %shr24, %sw.bb23 ], [ %shr22, %sw.bb21 ], [ %shr20, %sw.bb19 ], [ %shr18, %sw.bb17 ], [ %shr16, %sw.bb15 ], [ %shr14, %sw.bb13 ], [ %shr12, %sw.bb11 ], [ %shr10, %sw.bb9 ], [ %shr8, %sw.bb7 ], [ %shr6, %sw.bb5 ], [ %shr4, %sw.bb3 ], [ %shr2, %sw.bb1 ], [ %x, %entry ]
  ret i64 %x.addr.0
}

declare void @exit(i32) noreturn

!0 = metadata !{metadata !"long long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
