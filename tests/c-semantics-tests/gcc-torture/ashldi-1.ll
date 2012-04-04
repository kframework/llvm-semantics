; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/ashldi-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@data = internal constant [64 x i64] [i64 81985529216486895, i64 163971058432973790, i64 327942116865947580, i64 655884233731895160, i64 1311768467463790320, i64 2623536934927580640, i64 5247073869855161280, i64 -7952596333999229056, i64 2541551405711093504, i64 5083102811422187008, i64 -8280538450865177600, i64 1885667171979196416, i64 3771334343958392832, i64 7542668687916785664, i64 -3361406697875980288, i64 -6722813395751960576, i64 5001117282205630464, i64 -8444509509298290688, i64 1557725055112970240, i64 3115450110225940480, i64 6230900220451880960, i64 -5984943632805789696, i64 6476856808097972224, i64 -5493030457513607168, i64 7460683158682337280, i64 -3525377756344877056, i64 -7050755512689754112, i64 4345233048330043392, i64 8690466096660086784, i64 -1065811880389378048, i64 -2131623760778756096, i64 -4263247521557512192, i64 -8526495043115024384, i64 1393753987479502848, i64 2787507974959005696, i64 5575015949918011392, i64 -7296712173873528832, i64 3853319725962493952, i64 7706639451924987904, i64 -3033465169859575808, i64 -6066930339719151616, i64 6312883394271248384, i64 -5820977285167054848, i64 6804789503375441920, i64 -4837165066958667776, i64 8772413939792216064, i64 -901916194125119488, i64 -1803832388250238976, i64 -3607664776500477952, i64 -7215329553000955904, i64 4016084967707639808, i64 8032169935415279616, i64 -2382404202878992384, i64 -4764808405757984768, i64 8917127262193582080, i64 -612489549322387456, i64 -1224979098644774912, i64 -2449958197289549824, i64 -4899916394579099648, i64 8646911284551352320, i64 -1152921504606846976, i64 -2305843009213693952, i64 -4611686018427387904, i64 -9223372036854775808], align 16

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
  %1 = load i64* getelementptr inbounds ([64 x i64]* @data, i32 0, i64 0), align 8
  %2 = load i32* %i, align 4
  %call = call i64 @variable_shift(i64 %1, i32 %2)
  store i64 %call, i64* %y, align 8
  %3 = load i64* %y, align 8
  %4 = load i32* %i, align 4
  %idxprom = sext i32 %4 to i64
  %arrayidx = getelementptr inbounds [64 x i64]* @data, i32 0, i64 %idxprom
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
  %8 = load i64* getelementptr inbounds ([64 x i64]* @data, i32 0, i64 0), align 8
  %9 = load i32* %i, align 4
  %call6 = call i64 @constant_shift(i64 %8, i32 %9)
  store i64 %call6, i64* %y5, align 8
  %10 = load i64* %y5, align 8
  %11 = load i32* %i, align 4
  %idxprom7 = sext i32 %11 to i64
  %arrayidx8 = getelementptr inbounds [64 x i64]* @data, i32 0, i64 %idxprom7
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
  %shl = shl i64 %0, %sh_prom
  ret i64 %shl
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
  %shl = shl i64 %1, 0
  store i64 %shl, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb1:                                           ; preds = %entry
  %2 = load i64* %x.addr, align 8
  %shl2 = shl i64 %2, 1
  store i64 %shl2, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb3:                                           ; preds = %entry
  %3 = load i64* %x.addr, align 8
  %shl4 = shl i64 %3, 2
  store i64 %shl4, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb5:                                           ; preds = %entry
  %4 = load i64* %x.addr, align 8
  %shl6 = shl i64 %4, 3
  store i64 %shl6, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb7:                                           ; preds = %entry
  %5 = load i64* %x.addr, align 8
  %shl8 = shl i64 %5, 4
  store i64 %shl8, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb9:                                           ; preds = %entry
  %6 = load i64* %x.addr, align 8
  %shl10 = shl i64 %6, 5
  store i64 %shl10, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb11:                                          ; preds = %entry
  %7 = load i64* %x.addr, align 8
  %shl12 = shl i64 %7, 6
  store i64 %shl12, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb13:                                          ; preds = %entry
  %8 = load i64* %x.addr, align 8
  %shl14 = shl i64 %8, 7
  store i64 %shl14, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb15:                                          ; preds = %entry
  %9 = load i64* %x.addr, align 8
  %shl16 = shl i64 %9, 8
  store i64 %shl16, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb17:                                          ; preds = %entry
  %10 = load i64* %x.addr, align 8
  %shl18 = shl i64 %10, 9
  store i64 %shl18, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb19:                                          ; preds = %entry
  %11 = load i64* %x.addr, align 8
  %shl20 = shl i64 %11, 10
  store i64 %shl20, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb21:                                          ; preds = %entry
  %12 = load i64* %x.addr, align 8
  %shl22 = shl i64 %12, 11
  store i64 %shl22, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb23:                                          ; preds = %entry
  %13 = load i64* %x.addr, align 8
  %shl24 = shl i64 %13, 12
  store i64 %shl24, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb25:                                          ; preds = %entry
  %14 = load i64* %x.addr, align 8
  %shl26 = shl i64 %14, 13
  store i64 %shl26, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb27:                                          ; preds = %entry
  %15 = load i64* %x.addr, align 8
  %shl28 = shl i64 %15, 14
  store i64 %shl28, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb29:                                          ; preds = %entry
  %16 = load i64* %x.addr, align 8
  %shl30 = shl i64 %16, 15
  store i64 %shl30, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb31:                                          ; preds = %entry
  %17 = load i64* %x.addr, align 8
  %shl32 = shl i64 %17, 16
  store i64 %shl32, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb33:                                          ; preds = %entry
  %18 = load i64* %x.addr, align 8
  %shl34 = shl i64 %18, 17
  store i64 %shl34, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb35:                                          ; preds = %entry
  %19 = load i64* %x.addr, align 8
  %shl36 = shl i64 %19, 18
  store i64 %shl36, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb37:                                          ; preds = %entry
  %20 = load i64* %x.addr, align 8
  %shl38 = shl i64 %20, 19
  store i64 %shl38, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb39:                                          ; preds = %entry
  %21 = load i64* %x.addr, align 8
  %shl40 = shl i64 %21, 20
  store i64 %shl40, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb41:                                          ; preds = %entry
  %22 = load i64* %x.addr, align 8
  %shl42 = shl i64 %22, 21
  store i64 %shl42, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb43:                                          ; preds = %entry
  %23 = load i64* %x.addr, align 8
  %shl44 = shl i64 %23, 22
  store i64 %shl44, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb45:                                          ; preds = %entry
  %24 = load i64* %x.addr, align 8
  %shl46 = shl i64 %24, 23
  store i64 %shl46, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb47:                                          ; preds = %entry
  %25 = load i64* %x.addr, align 8
  %shl48 = shl i64 %25, 24
  store i64 %shl48, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb49:                                          ; preds = %entry
  %26 = load i64* %x.addr, align 8
  %shl50 = shl i64 %26, 25
  store i64 %shl50, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb51:                                          ; preds = %entry
  %27 = load i64* %x.addr, align 8
  %shl52 = shl i64 %27, 26
  store i64 %shl52, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb53:                                          ; preds = %entry
  %28 = load i64* %x.addr, align 8
  %shl54 = shl i64 %28, 27
  store i64 %shl54, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb55:                                          ; preds = %entry
  %29 = load i64* %x.addr, align 8
  %shl56 = shl i64 %29, 28
  store i64 %shl56, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb57:                                          ; preds = %entry
  %30 = load i64* %x.addr, align 8
  %shl58 = shl i64 %30, 29
  store i64 %shl58, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb59:                                          ; preds = %entry
  %31 = load i64* %x.addr, align 8
  %shl60 = shl i64 %31, 30
  store i64 %shl60, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb61:                                          ; preds = %entry
  %32 = load i64* %x.addr, align 8
  %shl62 = shl i64 %32, 31
  store i64 %shl62, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb63:                                          ; preds = %entry
  %33 = load i64* %x.addr, align 8
  %shl64 = shl i64 %33, 32
  store i64 %shl64, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb65:                                          ; preds = %entry
  %34 = load i64* %x.addr, align 8
  %shl66 = shl i64 %34, 33
  store i64 %shl66, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb67:                                          ; preds = %entry
  %35 = load i64* %x.addr, align 8
  %shl68 = shl i64 %35, 34
  store i64 %shl68, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb69:                                          ; preds = %entry
  %36 = load i64* %x.addr, align 8
  %shl70 = shl i64 %36, 35
  store i64 %shl70, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb71:                                          ; preds = %entry
  %37 = load i64* %x.addr, align 8
  %shl72 = shl i64 %37, 36
  store i64 %shl72, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb73:                                          ; preds = %entry
  %38 = load i64* %x.addr, align 8
  %shl74 = shl i64 %38, 37
  store i64 %shl74, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb75:                                          ; preds = %entry
  %39 = load i64* %x.addr, align 8
  %shl76 = shl i64 %39, 38
  store i64 %shl76, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb77:                                          ; preds = %entry
  %40 = load i64* %x.addr, align 8
  %shl78 = shl i64 %40, 39
  store i64 %shl78, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb79:                                          ; preds = %entry
  %41 = load i64* %x.addr, align 8
  %shl80 = shl i64 %41, 40
  store i64 %shl80, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb81:                                          ; preds = %entry
  %42 = load i64* %x.addr, align 8
  %shl82 = shl i64 %42, 41
  store i64 %shl82, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb83:                                          ; preds = %entry
  %43 = load i64* %x.addr, align 8
  %shl84 = shl i64 %43, 42
  store i64 %shl84, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb85:                                          ; preds = %entry
  %44 = load i64* %x.addr, align 8
  %shl86 = shl i64 %44, 43
  store i64 %shl86, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb87:                                          ; preds = %entry
  %45 = load i64* %x.addr, align 8
  %shl88 = shl i64 %45, 44
  store i64 %shl88, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb89:                                          ; preds = %entry
  %46 = load i64* %x.addr, align 8
  %shl90 = shl i64 %46, 45
  store i64 %shl90, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb91:                                          ; preds = %entry
  %47 = load i64* %x.addr, align 8
  %shl92 = shl i64 %47, 46
  store i64 %shl92, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb93:                                          ; preds = %entry
  %48 = load i64* %x.addr, align 8
  %shl94 = shl i64 %48, 47
  store i64 %shl94, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb95:                                          ; preds = %entry
  %49 = load i64* %x.addr, align 8
  %shl96 = shl i64 %49, 48
  store i64 %shl96, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb97:                                          ; preds = %entry
  %50 = load i64* %x.addr, align 8
  %shl98 = shl i64 %50, 49
  store i64 %shl98, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb99:                                          ; preds = %entry
  %51 = load i64* %x.addr, align 8
  %shl100 = shl i64 %51, 50
  store i64 %shl100, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb101:                                         ; preds = %entry
  %52 = load i64* %x.addr, align 8
  %shl102 = shl i64 %52, 51
  store i64 %shl102, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb103:                                         ; preds = %entry
  %53 = load i64* %x.addr, align 8
  %shl104 = shl i64 %53, 52
  store i64 %shl104, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb105:                                         ; preds = %entry
  %54 = load i64* %x.addr, align 8
  %shl106 = shl i64 %54, 53
  store i64 %shl106, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb107:                                         ; preds = %entry
  %55 = load i64* %x.addr, align 8
  %shl108 = shl i64 %55, 54
  store i64 %shl108, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb109:                                         ; preds = %entry
  %56 = load i64* %x.addr, align 8
  %shl110 = shl i64 %56, 55
  store i64 %shl110, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb111:                                         ; preds = %entry
  %57 = load i64* %x.addr, align 8
  %shl112 = shl i64 %57, 56
  store i64 %shl112, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb113:                                         ; preds = %entry
  %58 = load i64* %x.addr, align 8
  %shl114 = shl i64 %58, 57
  store i64 %shl114, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb115:                                         ; preds = %entry
  %59 = load i64* %x.addr, align 8
  %shl116 = shl i64 %59, 58
  store i64 %shl116, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb117:                                         ; preds = %entry
  %60 = load i64* %x.addr, align 8
  %shl118 = shl i64 %60, 59
  store i64 %shl118, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb119:                                         ; preds = %entry
  %61 = load i64* %x.addr, align 8
  %shl120 = shl i64 %61, 60
  store i64 %shl120, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb121:                                         ; preds = %entry
  %62 = load i64* %x.addr, align 8
  %shl122 = shl i64 %62, 61
  store i64 %shl122, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb123:                                         ; preds = %entry
  %63 = load i64* %x.addr, align 8
  %shl124 = shl i64 %63, 62
  store i64 %shl124, i64* %x.addr, align 8
  br label %sw.epilog

sw.bb125:                                         ; preds = %entry
  %64 = load i64* %x.addr, align 8
  %shl126 = shl i64 %64, 63
  store i64 %shl126, i64* %x.addr, align 8
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  call void @abort() noreturn
  unreachable

sw.epilog:                                        ; preds = %sw.bb125, %sw.bb123, %sw.bb121, %sw.bb119, %sw.bb117, %sw.bb115, %sw.bb113, %sw.bb111, %sw.bb109, %sw.bb107, %sw.bb105, %sw.bb103, %sw.bb101, %sw.bb99, %sw.bb97, %sw.bb95, %sw.bb93, %sw.bb91, %sw.bb89, %sw.bb87, %sw.bb85, %sw.bb83, %sw.bb81, %sw.bb79, %sw.bb77, %sw.bb75, %sw.bb73, %sw.bb71, %sw.bb69, %sw.bb67, %sw.bb65, %sw.bb63, %sw.bb61, %sw.bb59, %sw.bb57, %sw.bb55, %sw.bb53, %sw.bb51, %sw.bb49, %sw.bb47, %sw.bb45, %sw.bb43, %sw.bb41, %sw.bb39, %sw.bb37, %sw.bb35, %sw.bb33, %sw.bb31, %sw.bb29, %sw.bb27, %sw.bb25, %sw.bb23, %sw.bb21, %sw.bb19, %sw.bb17, %sw.bb15, %sw.bb13, %sw.bb11, %sw.bb9, %sw.bb7, %sw.bb5, %sw.bb3, %sw.bb1, %sw.bb
  %65 = load i64* %x.addr, align 8
  ret i64 %65
}

declare void @exit(i32) noreturn
