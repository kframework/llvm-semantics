; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/ashrdi-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@zext = internal constant [64 x i64] [i64 8526495107234113920, i64 4263247553617056960, i64 2131623776808528480, i64 1065811888404264240, i64 532905944202132120, i64 266452972101066060, i64 133226486050533030, i64 66613243025266515, i64 33306621512633257, i64 16653310756316628, i64 8326655378158314, i64 4163327689079157, i64 2081663844539578, i64 1040831922269789, i64 520415961134894, i64 260207980567447, i64 130103990283723, i64 65051995141861, i64 32525997570930, i64 16262998785465, i64 8131499392732, i64 4065749696366, i64 2032874848183, i64 1016437424091, i64 508218712045, i64 254109356022, i64 127054678011, i64 63527339005, i64 31763669502, i64 15881834751, i64 7940917375, i64 3970458687, i64 1985229343, i64 992614671, i64 496307335, i64 248153667, i64 124076833, i64 62038416, i64 31019208, i64 15509604, i64 7754802, i64 3877401, i64 1938700, i64 969350, i64 484675, i64 242337, i64 121168, i64 60584, i64 30292, i64 15146, i64 7573, i64 3786, i64 1893, i64 946, i64 473, i64 236, i64 118, i64 59, i64 29, i64 14, i64 7, i64 3, i64 1, i64 0], align 16
@sext = internal constant [64 x i64] [i64 -8152436031399644656, i64 -4076218015699822328, i64 -2038109007849911164, i64 -1019054503924955582, i64 -509527251962477791, i64 -254763625981238896, i64 -127381812990619448, i64 -63690906495309724, i64 -31845453247654862, i64 -15922726623827431, i64 -7961363311913716, i64 -3980681655956858, i64 -1990340827978429, i64 -995170413989215, i64 -497585206994608, i64 -248792603497304, i64 -124396301748652, i64 -62198150874326, i64 -31099075437163, i64 -15549537718582, i64 -7774768859291, i64 -3887384429646, i64 -1943692214823, i64 -971846107412, i64 -485923053706, i64 -242961526853, i64 -121480763427, i64 -60740381714, i64 -30370190857, i64 -15185095429, i64 -7592547715, i64 -3796273858, i64 -1898136929, i64 -949068465, i64 -474534233, i64 -237267117, i64 -118633559, i64 -59316780, i64 -29658390, i64 -14829195, i64 -7414598, i64 -3707299, i64 -1853650, i64 -926825, i64 -463413, i64 -231707, i64 -115854, i64 -57927, i64 -28964, i64 -14482, i64 -7241, i64 -3621, i64 -1811, i64 -906, i64 -453, i64 -227, i64 -114, i64 -57, i64 -29, i64 -15, i64 -8, i64 -4, i64 -2, i64 -1], align 16

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %y = alloca i64, align 8
  %y5 = alloca i64, align 8
  %y18 = alloca i64, align 8
  %y31 = alloca i64, align 8
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 64
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i64* getelementptr inbounds ([64 x i64]* @zext, i32 0, i64 0), align 8
  %2 = load i32* %i, align 4
  %call = call i64 @variable_shift(i64 %1, i32 %2)
  store i64 %call, i64* %y, align 8
  %3 = load i64* %y, align 8
  %4 = load i32* %i, align 4
  %idxprom = sext i32 %4 to i64
  %arrayidx = getelementptr inbounds [64 x i64]* @zext, i32 0, i64 %idxprom
  %5 = load i64* %arrayidx, align 8
  %cmp1 = icmp ne i64 %3, %5
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %6 = load i32* %i, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc12, %for.end
  %7 = load i32* %i, align 4
  %cmp3 = icmp slt i32 %7, 64
  br i1 %cmp3, label %for.body4, label %for.end14

for.body4:                                        ; preds = %for.cond2
  %8 = load i64* getelementptr inbounds ([64 x i64]* @sext, i32 0, i64 0), align 8
  %9 = load i32* %i, align 4
  %call6 = call i64 @variable_shift(i64 %8, i32 %9)
  store i64 %call6, i64* %y5, align 8
  %10 = load i64* %y5, align 8
  %11 = load i32* %i, align 4
  %idxprom7 = sext i32 %11 to i64
  %arrayidx8 = getelementptr inbounds [64 x i64]* @sext, i32 0, i64 %idxprom7
  %12 = load i64* %arrayidx8, align 8
  %cmp9 = icmp ne i64 %10, %12
  br i1 %cmp9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %for.body4
  call void @abort() noreturn
  unreachable

if.end11:                                         ; preds = %for.body4
  br label %for.inc12

for.inc12:                                        ; preds = %if.end11
  %13 = load i32* %i, align 4
  %inc13 = add nsw i32 %13, 1
  store i32 %inc13, i32* %i, align 4
  br label %for.cond2

for.end14:                                        ; preds = %for.cond2
  store i32 0, i32* %i, align 4
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc25, %for.end14
  %14 = load i32* %i, align 4
  %cmp16 = icmp slt i32 %14, 64
  br i1 %cmp16, label %for.body17, label %for.end27

for.body17:                                       ; preds = %for.cond15
  %15 = load i64* getelementptr inbounds ([64 x i64]* @zext, i32 0, i64 0), align 8
  %16 = load i32* %i, align 4
  %call19 = call i64 @constant_shift(i64 %15, i32 %16)
  store i64 %call19, i64* %y18, align 8
  %17 = load i64* %y18, align 8
  %18 = load i32* %i, align 4
  %idxprom20 = sext i32 %18 to i64
  %arrayidx21 = getelementptr inbounds [64 x i64]* @zext, i32 0, i64 %idxprom20
  %19 = load i64* %arrayidx21, align 8
  %cmp22 = icmp ne i64 %17, %19
  br i1 %cmp22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %for.body17
  call void @abort() noreturn
  unreachable

if.end24:                                         ; preds = %for.body17
  br label %for.inc25

for.inc25:                                        ; preds = %if.end24
  %20 = load i32* %i, align 4
  %inc26 = add nsw i32 %20, 1
  store i32 %inc26, i32* %i, align 4
  br label %for.cond15

for.end27:                                        ; preds = %for.cond15
  store i32 0, i32* %i, align 4
  br label %for.cond28

for.cond28:                                       ; preds = %for.inc38, %for.end27
  %21 = load i32* %i, align 4
  %cmp29 = icmp slt i32 %21, 64
  br i1 %cmp29, label %for.body30, label %for.end40

for.body30:                                       ; preds = %for.cond28
  %22 = load i64* getelementptr inbounds ([64 x i64]* @sext, i32 0, i64 0), align 8
  %23 = load i32* %i, align 4
  %call32 = call i64 @constant_shift(i64 %22, i32 %23)
  store i64 %call32, i64* %y31, align 8
  %24 = load i64* %y31, align 8
  %25 = load i32* %i, align 4
  %idxprom33 = sext i32 %25 to i64
  %arrayidx34 = getelementptr inbounds [64 x i64]* @sext, i32 0, i64 %idxprom33
  %26 = load i64* %arrayidx34, align 8
  %cmp35 = icmp ne i64 %24, %26
  br i1 %cmp35, label %if.then36, label %if.end37

if.then36:                                        ; preds = %for.body30
  call void @abort() noreturn
  unreachable

if.end37:                                         ; preds = %for.body30
  br label %for.inc38

for.inc38:                                        ; preds = %if.end37
  %27 = load i32* %i, align 4
  %inc39 = add nsw i32 %27, 1
  store i32 %inc39, i32* %i, align 4
  br label %for.cond28

for.end40:                                        ; preds = %for.cond28
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %28 = load i32* %retval
  ret i32 %28
}

define internal i64 @variable_shift(i64 %x, i32 %i) nounwind uwtable {
entry:
  %x.addr = alloca i64, align 8
  %i.addr = alloca i32, align 4
  store i64 %x, i64* %x.addr, align 8
  store i32 %i, i32* %i.addr, align 4
  %0 = load i64* %x.addr, align 8
  %1 = load i32* %i.addr, align 4
  %sh_prom = zext i32 %1 to i64
  %shr = ashr i64 %0, %sh_prom
  ret i64 %shr
}

declare void @abort() noreturn

define internal i64 @constant_shift(i64 %x, i32 %i) nounwind uwtable {
entry:
  %x.addr = alloca i64, align 8
  %i.addr = alloca i32, align 4
  store i64 %x, i64* %x.addr, align 8
  store i32 %i, i32* %i.addr, align 4
  %0 = load i32* %i.addr, align 4
  switch i32 %0, label %sw.default [
    i32 0, label %sw.bb
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

sw.bb:                                            ; preds = %entry
  %1 = load i64* %x.addr, align 8
  %shr = ashr i64 %1, 0
  store i64 %shr, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb1:                                           ; preds = %entry
  %2 = load i64* %x.addr, align 8
  %shr2 = ashr i64 %2, 1
  store i64 %shr2, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb3:                                           ; preds = %entry
  %3 = load i64* %x.addr, align 8
  %shr4 = ashr i64 %3, 2
  store i64 %shr4, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb5:                                           ; preds = %entry
  %4 = load i64* %x.addr, align 8
  %shr6 = ashr i64 %4, 3
  store i64 %shr6, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb7:                                           ; preds = %entry
  %5 = load i64* %x.addr, align 8
  %shr8 = ashr i64 %5, 4
  store i64 %shr8, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb9:                                           ; preds = %entry
  %6 = load i64* %x.addr, align 8
  %shr10 = ashr i64 %6, 5
  store i64 %shr10, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb11:                                          ; preds = %entry
  %7 = load i64* %x.addr, align 8
  %shr12 = ashr i64 %7, 6
  store i64 %shr12, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb13:                                          ; preds = %entry
  %8 = load i64* %x.addr, align 8
  %shr14 = ashr i64 %8, 7
  store i64 %shr14, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb15:                                          ; preds = %entry
  %9 = load i64* %x.addr, align 8
  %shr16 = ashr i64 %9, 8
  store i64 %shr16, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb17:                                          ; preds = %entry
  %10 = load i64* %x.addr, align 8
  %shr18 = ashr i64 %10, 9
  store i64 %shr18, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb19:                                          ; preds = %entry
  %11 = load i64* %x.addr, align 8
  %shr20 = ashr i64 %11, 10
  store i64 %shr20, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb21:                                          ; preds = %entry
  %12 = load i64* %x.addr, align 8
  %shr22 = ashr i64 %12, 11
  store i64 %shr22, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb23:                                          ; preds = %entry
  %13 = load i64* %x.addr, align 8
  %shr24 = ashr i64 %13, 12
  store i64 %shr24, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb25:                                          ; preds = %entry
  %14 = load i64* %x.addr, align 8
  %shr26 = ashr i64 %14, 13
  store i64 %shr26, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb27:                                          ; preds = %entry
  %15 = load i64* %x.addr, align 8
  %shr28 = ashr i64 %15, 14
  store i64 %shr28, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb29:                                          ; preds = %entry
  %16 = load i64* %x.addr, align 8
  %shr30 = ashr i64 %16, 15
  store i64 %shr30, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb31:                                          ; preds = %entry
  %17 = load i64* %x.addr, align 8
  %shr32 = ashr i64 %17, 16
  store i64 %shr32, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb33:                                          ; preds = %entry
  %18 = load i64* %x.addr, align 8
  %shr34 = ashr i64 %18, 17
  store i64 %shr34, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb35:                                          ; preds = %entry
  %19 = load i64* %x.addr, align 8
  %shr36 = ashr i64 %19, 18
  store i64 %shr36, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb37:                                          ; preds = %entry
  %20 = load i64* %x.addr, align 8
  %shr38 = ashr i64 %20, 19
  store i64 %shr38, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb39:                                          ; preds = %entry
  %21 = load i64* %x.addr, align 8
  %shr40 = ashr i64 %21, 20
  store i64 %shr40, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb41:                                          ; preds = %entry
  %22 = load i64* %x.addr, align 8
  %shr42 = ashr i64 %22, 21
  store i64 %shr42, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb43:                                          ; preds = %entry
  %23 = load i64* %x.addr, align 8
  %shr44 = ashr i64 %23, 22
  store i64 %shr44, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb45:                                          ; preds = %entry
  %24 = load i64* %x.addr, align 8
  %shr46 = ashr i64 %24, 23
  store i64 %shr46, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb47:                                          ; preds = %entry
  %25 = load i64* %x.addr, align 8
  %shr48 = ashr i64 %25, 24
  store i64 %shr48, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb49:                                          ; preds = %entry
  %26 = load i64* %x.addr, align 8
  %shr50 = ashr i64 %26, 25
  store i64 %shr50, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb51:                                          ; preds = %entry
  %27 = load i64* %x.addr, align 8
  %shr52 = ashr i64 %27, 26
  store i64 %shr52, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb53:                                          ; preds = %entry
  %28 = load i64* %x.addr, align 8
  %shr54 = ashr i64 %28, 27
  store i64 %shr54, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb55:                                          ; preds = %entry
  %29 = load i64* %x.addr, align 8
  %shr56 = ashr i64 %29, 28
  store i64 %shr56, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb57:                                          ; preds = %entry
  %30 = load i64* %x.addr, align 8
  %shr58 = ashr i64 %30, 29
  store i64 %shr58, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb59:                                          ; preds = %entry
  %31 = load i64* %x.addr, align 8
  %shr60 = ashr i64 %31, 30
  store i64 %shr60, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb61:                                          ; preds = %entry
  %32 = load i64* %x.addr, align 8
  %shr62 = ashr i64 %32, 31
  store i64 %shr62, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb63:                                          ; preds = %entry
  %33 = load i64* %x.addr, align 8
  %shr64 = ashr i64 %33, 32
  store i64 %shr64, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb65:                                          ; preds = %entry
  %34 = load i64* %x.addr, align 8
  %shr66 = ashr i64 %34, 33
  store i64 %shr66, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb67:                                          ; preds = %entry
  %35 = load i64* %x.addr, align 8
  %shr68 = ashr i64 %35, 34
  store i64 %shr68, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb69:                                          ; preds = %entry
  %36 = load i64* %x.addr, align 8
  %shr70 = ashr i64 %36, 35
  store i64 %shr70, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb71:                                          ; preds = %entry
  %37 = load i64* %x.addr, align 8
  %shr72 = ashr i64 %37, 36
  store i64 %shr72, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb73:                                          ; preds = %entry
  %38 = load i64* %x.addr, align 8
  %shr74 = ashr i64 %38, 37
  store i64 %shr74, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb75:                                          ; preds = %entry
  %39 = load i64* %x.addr, align 8
  %shr76 = ashr i64 %39, 38
  store i64 %shr76, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb77:                                          ; preds = %entry
  %40 = load i64* %x.addr, align 8
  %shr78 = ashr i64 %40, 39
  store i64 %shr78, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb79:                                          ; preds = %entry
  %41 = load i64* %x.addr, align 8
  %shr80 = ashr i64 %41, 40
  store i64 %shr80, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb81:                                          ; preds = %entry
  %42 = load i64* %x.addr, align 8
  %shr82 = ashr i64 %42, 41
  store i64 %shr82, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb83:                                          ; preds = %entry
  %43 = load i64* %x.addr, align 8
  %shr84 = ashr i64 %43, 42
  store i64 %shr84, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb85:                                          ; preds = %entry
  %44 = load i64* %x.addr, align 8
  %shr86 = ashr i64 %44, 43
  store i64 %shr86, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb87:                                          ; preds = %entry
  %45 = load i64* %x.addr, align 8
  %shr88 = ashr i64 %45, 44
  store i64 %shr88, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb89:                                          ; preds = %entry
  %46 = load i64* %x.addr, align 8
  %shr90 = ashr i64 %46, 45
  store i64 %shr90, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb91:                                          ; preds = %entry
  %47 = load i64* %x.addr, align 8
  %shr92 = ashr i64 %47, 46
  store i64 %shr92, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb93:                                          ; preds = %entry
  %48 = load i64* %x.addr, align 8
  %shr94 = ashr i64 %48, 47
  store i64 %shr94, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb95:                                          ; preds = %entry
  %49 = load i64* %x.addr, align 8
  %shr96 = ashr i64 %49, 48
  store i64 %shr96, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb97:                                          ; preds = %entry
  %50 = load i64* %x.addr, align 8
  %shr98 = ashr i64 %50, 49
  store i64 %shr98, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb99:                                          ; preds = %entry
  %51 = load i64* %x.addr, align 8
  %shr100 = ashr i64 %51, 50
  store i64 %shr100, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb101:                                         ; preds = %entry
  %52 = load i64* %x.addr, align 8
  %shr102 = ashr i64 %52, 51
  store i64 %shr102, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb103:                                         ; preds = %entry
  %53 = load i64* %x.addr, align 8
  %shr104 = ashr i64 %53, 52
  store i64 %shr104, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb105:                                         ; preds = %entry
  %54 = load i64* %x.addr, align 8
  %shr106 = ashr i64 %54, 53
  store i64 %shr106, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb107:                                         ; preds = %entry
  %55 = load i64* %x.addr, align 8
  %shr108 = ashr i64 %55, 54
  store i64 %shr108, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb109:                                         ; preds = %entry
  %56 = load i64* %x.addr, align 8
  %shr110 = ashr i64 %56, 55
  store i64 %shr110, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb111:                                         ; preds = %entry
  %57 = load i64* %x.addr, align 8
  %shr112 = ashr i64 %57, 56
  store i64 %shr112, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb113:                                         ; preds = %entry
  %58 = load i64* %x.addr, align 8
  %shr114 = ashr i64 %58, 57
  store i64 %shr114, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb115:                                         ; preds = %entry
  %59 = load i64* %x.addr, align 8
  %shr116 = ashr i64 %59, 58
  store i64 %shr116, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb117:                                         ; preds = %entry
  %60 = load i64* %x.addr, align 8
  %shr118 = ashr i64 %60, 59
  store i64 %shr118, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb119:                                         ; preds = %entry
  %61 = load i64* %x.addr, align 8
  %shr120 = ashr i64 %61, 60
  store i64 %shr120, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb121:                                         ; preds = %entry
  %62 = load i64* %x.addr, align 8
  %shr122 = ashr i64 %62, 61
  store i64 %shr122, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb123:                                         ; preds = %entry
  %63 = load i64* %x.addr, align 8
  %shr124 = ashr i64 %63, 62
  store i64 %shr124, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb125:                                         ; preds = %entry
  %64 = load i64* %x.addr, align 8
  %shr126 = ashr i64 %64, 63
  store i64 %shr126, i64* %x.addr, align 8
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  call void @abort() noreturn
  unreachable

sw.epilog:                                        ; preds = %sw.bb125, %sw.bb123, %sw.bb121, %sw.bb119, %sw.bb117, %sw.bb115, %sw.bb113, %sw.bb111, %sw.bb109, %sw.bb107, %sw.bb105, %sw.bb103, %sw.bb101, %sw.bb99, %sw.bb97, %sw.bb95, %sw.bb93, %sw.bb91, %sw.bb89, %sw.bb87, %sw.bb85, %sw.bb83, %sw.bb81, %sw.bb79, %sw.bb77, %sw.bb75, %sw.bb73, %sw.bb71, %sw.bb69, %sw.bb67, %sw.bb65, %sw.bb63, %sw.bb61, %sw.bb59, %sw.bb57, %sw.bb55, %sw.bb53, %sw.bb51, %sw.bb49, %sw.bb47, %sw.bb45, %sw.bb43, %sw.bb41, %sw.bb39, %sw.bb37, %sw.bb35, %sw.bb33, %sw.bb31, %sw.bb29, %sw.bb27, %sw.bb25, %sw.bb23, %sw.bb21, %sw.bb19, %sw.bb17, %sw.bb15, %sw.bb13, %sw.bb11, %sw.bb9, %sw.bb7, %sw.bb5, %sw.bb3, %sw.bb1, %sw.bb
  %65 = load i64* %x.addr, align 8
  ret i64 %65
}

declare void @exit(i32) noreturn
