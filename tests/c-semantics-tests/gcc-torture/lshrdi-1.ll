; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/lshrdi-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@zext = internal constant [64 x i64] [i64 -8690466092652643696, i64 4878138990528453960, i64 2439069495264226980, i64 1219534747632113490, i64 609767373816056745, i64 304883686908028372, i64 152441843454014186, i64 76220921727007093, i64 38110460863503546, i64 19055230431751773, i64 9527615215875886, i64 4763807607937943, i64 2381903803968971, i64 1190951901984485, i64 595475950992242, i64 297737975496121, i64 148868987748060, i64 74434493874030, i64 37217246937015, i64 18608623468507, i64 9304311734253, i64 4652155867126, i64 2326077933563, i64 1163038966781, i64 581519483390, i64 290759741695, i64 145379870847, i64 72689935423, i64 36344967711, i64 18172483855, i64 9086241927, i64 4543120963, i64 2271560481, i64 1135780240, i64 567890120, i64 283945060, i64 141972530, i64 70986265, i64 35493132, i64 17746566, i64 8873283, i64 4436641, i64 2218320, i64 1109160, i64 554580, i64 277290, i64 138645, i64 69322, i64 34661, i64 17330, i64 8665, i64 4332, i64 2166, i64 1083, i64 541, i64 270, i64 135, i64 67, i64 33, i64 16, i64 8, i64 4, i64 2, i64 1], align 16

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %y = alloca i64, align 8
  %y5 = alloca i64, align 8
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
  %8 = load i64* getelementptr inbounds ([64 x i64]* @zext, i32 0, i64 0), align 8
  %9 = load i32* %i, align 4
  %call6 = call i64 @constant_shift(i64 %8, i32 %9)
  store i64 %call6, i64* %y5, align 8
  %10 = load i64* %y5, align 8
  %11 = load i32* %i, align 4
  %idxprom7 = sext i32 %11 to i64
  %arrayidx8 = getelementptr inbounds [64 x i64]* @zext, i32 0, i64 %idxprom7
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
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %14 = load i32* %retval
  ret i32 %14
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
  %shr = lshr i64 %0, %sh_prom
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
  %shr = lshr i64 %1, 0
  store i64 %shr, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb1:                                           ; preds = %entry
  %2 = load i64* %x.addr, align 8
  %shr2 = lshr i64 %2, 1
  store i64 %shr2, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb3:                                           ; preds = %entry
  %3 = load i64* %x.addr, align 8
  %shr4 = lshr i64 %3, 2
  store i64 %shr4, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb5:                                           ; preds = %entry
  %4 = load i64* %x.addr, align 8
  %shr6 = lshr i64 %4, 3
  store i64 %shr6, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb7:                                           ; preds = %entry
  %5 = load i64* %x.addr, align 8
  %shr8 = lshr i64 %5, 4
  store i64 %shr8, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb9:                                           ; preds = %entry
  %6 = load i64* %x.addr, align 8
  %shr10 = lshr i64 %6, 5
  store i64 %shr10, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb11:                                          ; preds = %entry
  %7 = load i64* %x.addr, align 8
  %shr12 = lshr i64 %7, 6
  store i64 %shr12, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb13:                                          ; preds = %entry
  %8 = load i64* %x.addr, align 8
  %shr14 = lshr i64 %8, 7
  store i64 %shr14, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb15:                                          ; preds = %entry
  %9 = load i64* %x.addr, align 8
  %shr16 = lshr i64 %9, 8
  store i64 %shr16, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb17:                                          ; preds = %entry
  %10 = load i64* %x.addr, align 8
  %shr18 = lshr i64 %10, 9
  store i64 %shr18, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb19:                                          ; preds = %entry
  %11 = load i64* %x.addr, align 8
  %shr20 = lshr i64 %11, 10
  store i64 %shr20, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb21:                                          ; preds = %entry
  %12 = load i64* %x.addr, align 8
  %shr22 = lshr i64 %12, 11
  store i64 %shr22, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb23:                                          ; preds = %entry
  %13 = load i64* %x.addr, align 8
  %shr24 = lshr i64 %13, 12
  store i64 %shr24, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb25:                                          ; preds = %entry
  %14 = load i64* %x.addr, align 8
  %shr26 = lshr i64 %14, 13
  store i64 %shr26, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb27:                                          ; preds = %entry
  %15 = load i64* %x.addr, align 8
  %shr28 = lshr i64 %15, 14
  store i64 %shr28, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb29:                                          ; preds = %entry
  %16 = load i64* %x.addr, align 8
  %shr30 = lshr i64 %16, 15
  store i64 %shr30, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb31:                                          ; preds = %entry
  %17 = load i64* %x.addr, align 8
  %shr32 = lshr i64 %17, 16
  store i64 %shr32, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb33:                                          ; preds = %entry
  %18 = load i64* %x.addr, align 8
  %shr34 = lshr i64 %18, 17
  store i64 %shr34, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb35:                                          ; preds = %entry
  %19 = load i64* %x.addr, align 8
  %shr36 = lshr i64 %19, 18
  store i64 %shr36, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb37:                                          ; preds = %entry
  %20 = load i64* %x.addr, align 8
  %shr38 = lshr i64 %20, 19
  store i64 %shr38, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb39:                                          ; preds = %entry
  %21 = load i64* %x.addr, align 8
  %shr40 = lshr i64 %21, 20
  store i64 %shr40, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb41:                                          ; preds = %entry
  %22 = load i64* %x.addr, align 8
  %shr42 = lshr i64 %22, 21
  store i64 %shr42, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb43:                                          ; preds = %entry
  %23 = load i64* %x.addr, align 8
  %shr44 = lshr i64 %23, 22
  store i64 %shr44, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb45:                                          ; preds = %entry
  %24 = load i64* %x.addr, align 8
  %shr46 = lshr i64 %24, 23
  store i64 %shr46, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb47:                                          ; preds = %entry
  %25 = load i64* %x.addr, align 8
  %shr48 = lshr i64 %25, 24
  store i64 %shr48, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb49:                                          ; preds = %entry
  %26 = load i64* %x.addr, align 8
  %shr50 = lshr i64 %26, 25
  store i64 %shr50, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb51:                                          ; preds = %entry
  %27 = load i64* %x.addr, align 8
  %shr52 = lshr i64 %27, 26
  store i64 %shr52, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb53:                                          ; preds = %entry
  %28 = load i64* %x.addr, align 8
  %shr54 = lshr i64 %28, 27
  store i64 %shr54, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb55:                                          ; preds = %entry
  %29 = load i64* %x.addr, align 8
  %shr56 = lshr i64 %29, 28
  store i64 %shr56, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb57:                                          ; preds = %entry
  %30 = load i64* %x.addr, align 8
  %shr58 = lshr i64 %30, 29
  store i64 %shr58, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb59:                                          ; preds = %entry
  %31 = load i64* %x.addr, align 8
  %shr60 = lshr i64 %31, 30
  store i64 %shr60, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb61:                                          ; preds = %entry
  %32 = load i64* %x.addr, align 8
  %shr62 = lshr i64 %32, 31
  store i64 %shr62, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb63:                                          ; preds = %entry
  %33 = load i64* %x.addr, align 8
  %shr64 = lshr i64 %33, 32
  store i64 %shr64, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb65:                                          ; preds = %entry
  %34 = load i64* %x.addr, align 8
  %shr66 = lshr i64 %34, 33
  store i64 %shr66, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb67:                                          ; preds = %entry
  %35 = load i64* %x.addr, align 8
  %shr68 = lshr i64 %35, 34
  store i64 %shr68, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb69:                                          ; preds = %entry
  %36 = load i64* %x.addr, align 8
  %shr70 = lshr i64 %36, 35
  store i64 %shr70, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb71:                                          ; preds = %entry
  %37 = load i64* %x.addr, align 8
  %shr72 = lshr i64 %37, 36
  store i64 %shr72, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb73:                                          ; preds = %entry
  %38 = load i64* %x.addr, align 8
  %shr74 = lshr i64 %38, 37
  store i64 %shr74, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb75:                                          ; preds = %entry
  %39 = load i64* %x.addr, align 8
  %shr76 = lshr i64 %39, 38
  store i64 %shr76, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb77:                                          ; preds = %entry
  %40 = load i64* %x.addr, align 8
  %shr78 = lshr i64 %40, 39
  store i64 %shr78, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb79:                                          ; preds = %entry
  %41 = load i64* %x.addr, align 8
  %shr80 = lshr i64 %41, 40
  store i64 %shr80, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb81:                                          ; preds = %entry
  %42 = load i64* %x.addr, align 8
  %shr82 = lshr i64 %42, 41
  store i64 %shr82, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb83:                                          ; preds = %entry
  %43 = load i64* %x.addr, align 8
  %shr84 = lshr i64 %43, 42
  store i64 %shr84, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb85:                                          ; preds = %entry
  %44 = load i64* %x.addr, align 8
  %shr86 = lshr i64 %44, 43
  store i64 %shr86, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb87:                                          ; preds = %entry
  %45 = load i64* %x.addr, align 8
  %shr88 = lshr i64 %45, 44
  store i64 %shr88, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb89:                                          ; preds = %entry
  %46 = load i64* %x.addr, align 8
  %shr90 = lshr i64 %46, 45
  store i64 %shr90, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb91:                                          ; preds = %entry
  %47 = load i64* %x.addr, align 8
  %shr92 = lshr i64 %47, 46
  store i64 %shr92, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb93:                                          ; preds = %entry
  %48 = load i64* %x.addr, align 8
  %shr94 = lshr i64 %48, 47
  store i64 %shr94, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb95:                                          ; preds = %entry
  %49 = load i64* %x.addr, align 8
  %shr96 = lshr i64 %49, 48
  store i64 %shr96, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb97:                                          ; preds = %entry
  %50 = load i64* %x.addr, align 8
  %shr98 = lshr i64 %50, 49
  store i64 %shr98, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb99:                                          ; preds = %entry
  %51 = load i64* %x.addr, align 8
  %shr100 = lshr i64 %51, 50
  store i64 %shr100, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb101:                                         ; preds = %entry
  %52 = load i64* %x.addr, align 8
  %shr102 = lshr i64 %52, 51
  store i64 %shr102, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb103:                                         ; preds = %entry
  %53 = load i64* %x.addr, align 8
  %shr104 = lshr i64 %53, 52
  store i64 %shr104, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb105:                                         ; preds = %entry
  %54 = load i64* %x.addr, align 8
  %shr106 = lshr i64 %54, 53
  store i64 %shr106, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb107:                                         ; preds = %entry
  %55 = load i64* %x.addr, align 8
  %shr108 = lshr i64 %55, 54
  store i64 %shr108, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb109:                                         ; preds = %entry
  %56 = load i64* %x.addr, align 8
  %shr110 = lshr i64 %56, 55
  store i64 %shr110, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb111:                                         ; preds = %entry
  %57 = load i64* %x.addr, align 8
  %shr112 = lshr i64 %57, 56
  store i64 %shr112, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb113:                                         ; preds = %entry
  %58 = load i64* %x.addr, align 8
  %shr114 = lshr i64 %58, 57
  store i64 %shr114, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb115:                                         ; preds = %entry
  %59 = load i64* %x.addr, align 8
  %shr116 = lshr i64 %59, 58
  store i64 %shr116, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb117:                                         ; preds = %entry
  %60 = load i64* %x.addr, align 8
  %shr118 = lshr i64 %60, 59
  store i64 %shr118, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb119:                                         ; preds = %entry
  %61 = load i64* %x.addr, align 8
  %shr120 = lshr i64 %61, 60
  store i64 %shr120, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb121:                                         ; preds = %entry
  %62 = load i64* %x.addr, align 8
  %shr122 = lshr i64 %62, 61
  store i64 %shr122, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb123:                                         ; preds = %entry
  %63 = load i64* %x.addr, align 8
  %shr124 = lshr i64 %63, 62
  store i64 %shr124, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb125:                                         ; preds = %entry
  %64 = load i64* %x.addr, align 8
  %shr126 = lshr i64 %64, 63
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
