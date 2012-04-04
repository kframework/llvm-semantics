; ModuleID = '/home/david/src/c-semantics/tests/integration/pendulum.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@q = constant double 5.000000e-01, align 8
@b = constant double 9.000000e-01, align 8
@w = constant double 0x3FE5555555555555, align 8
@.str = private unnamed_addr constant [7 x i8] c"%d %d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  %m = alloca i32, align 4
  %l = alloca i32, align 4
  %np = alloca i32, align 4
  %pi = alloca double, align 8
  %h = alloca double, align 8
  %t = alloca double, align 8
  %dk11 = alloca double, align 8
  %dk21 = alloca double, align 8
  %dk12 = alloca double, align 8
  %dk22 = alloca double, align 8
  %dk13 = alloca double, align 8
  %dk23 = alloca double, align 8
  %dk14 = alloca double, align 8
  %dk24 = alloca double, align 8
  %y1 = alloca double, align 8
  %y2 = alloca double, align 8
  %y = alloca [2 x [60 x double]], align 16
  store i32 0, i32* %retval
  store i32 60, i32* %n, align 4
  store i32 14, i32* %m, align 4
  store i32 10, i32* %l, align 4
  %call = call double @atan(double 1.000000e+00) nounwind
  %mul = fmul double 4.000000e+00, %call
  store double %mul, double* %pi, align 8
  %0 = load double* %pi, align 8
  %mul1 = fmul double 3.000000e+00, %0
  %1 = load i32* %m, align 4
  %conv = sitofp i32 %1 to double
  %div = fdiv double %mul1, %conv
  store double %div, double* %h, align 8
  %arrayidx = getelementptr inbounds [2 x [60 x double]]* %y, i32 0, i64 0
  %arrayidx2 = getelementptr inbounds [60 x double]* %arrayidx, i32 0, i64 0
  store double 0.000000e+00, double* %arrayidx2, align 8
  %arrayidx3 = getelementptr inbounds [2 x [60 x double]]* %y, i32 0, i64 1
  %arrayidx4 = getelementptr inbounds [60 x double]* %arrayidx3, i32 0, i64 0
  store double 2.000000e+00, double* %arrayidx4, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32* %i, align 4
  %3 = load i32* %n, align 4
  %sub = sub nsw i32 %3, 1
  %cmp = icmp slt i32 %2, %sub
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load double* %h, align 8
  %5 = load i32* %i, align 4
  %add = add nsw i32 %5, 1
  %conv6 = sitofp i32 %add to double
  %mul7 = fmul double %4, %conv6
  store double %mul7, double* %t, align 8
  %6 = load i32* %i, align 4
  %idxprom = sext i32 %6 to i64
  %arrayidx8 = getelementptr inbounds [2 x [60 x double]]* %y, i32 0, i64 0
  %arrayidx9 = getelementptr inbounds [60 x double]* %arrayidx8, i32 0, i64 %idxprom
  %7 = load double* %arrayidx9, align 8
  store double %7, double* %y1, align 8
  %8 = load i32* %i, align 4
  %idxprom10 = sext i32 %8 to i64
  %arrayidx11 = getelementptr inbounds [2 x [60 x double]]* %y, i32 0, i64 1
  %arrayidx12 = getelementptr inbounds [60 x double]* %arrayidx11, i32 0, i64 %idxprom10
  %9 = load double* %arrayidx12, align 8
  store double %9, double* %y2, align 8
  %10 = load double* %h, align 8
  %11 = load double* %y2, align 8
  %mul13 = fmul double %10, %11
  store double %mul13, double* %dk11, align 8
  %12 = load double* %h, align 8
  %13 = load double* %y2, align 8
  %mul14 = fmul double -5.000000e-01, %13
  %14 = load double* %y1, align 8
  %call15 = call double @sin(double %14) nounwind readnone
  %sub16 = fsub double %mul14, %call15
  %15 = load double* %t, align 8
  %mul17 = fmul double 0x3FE5555555555555, %15
  %call18 = call double @cos(double %mul17) nounwind readnone
  %mul19 = fmul double 9.000000e-01, %call18
  %add20 = fadd double %sub16, %mul19
  %mul21 = fmul double %12, %add20
  store double %mul21, double* %dk21, align 8
  %16 = load double* %h, align 8
  %17 = load double* %y2, align 8
  %18 = load double* %dk21, align 8
  %div22 = fdiv double %18, 2.000000e+00
  %add23 = fadd double %17, %div22
  %mul24 = fmul double %16, %add23
  store double %mul24, double* %dk12, align 8
  %19 = load double* %h, align 8
  %20 = load double* %y2, align 8
  %21 = load double* %dk21, align 8
  %div25 = fdiv double %21, 2.000000e+00
  %add26 = fadd double %20, %div25
  %mul27 = fmul double -5.000000e-01, %add26
  %22 = load double* %y1, align 8
  %23 = load double* %dk11, align 8
  %div28 = fdiv double %23, 2.000000e+00
  %add29 = fadd double %22, %div28
  %call30 = call double @sin(double %add29) nounwind readnone
  %sub31 = fsub double %mul27, %call30
  %24 = load double* %t, align 8
  %25 = load double* %h, align 8
  %div32 = fdiv double %25, 2.000000e+00
  %add33 = fadd double %24, %div32
  %mul34 = fmul double 0x3FE5555555555555, %add33
  %call35 = call double @cos(double %mul34) nounwind readnone
  %mul36 = fmul double 9.000000e-01, %call35
  %add37 = fadd double %sub31, %mul36
  %mul38 = fmul double %19, %add37
  store double %mul38, double* %dk22, align 8
  %26 = load double* %h, align 8
  %27 = load double* %y2, align 8
  %28 = load double* %dk22, align 8
  %div39 = fdiv double %28, 2.000000e+00
  %add40 = fadd double %27, %div39
  %mul41 = fmul double %26, %add40
  store double %mul41, double* %dk13, align 8
  %29 = load double* %h, align 8
  %30 = load double* %y2, align 8
  %31 = load double* %dk22, align 8
  %div42 = fdiv double %31, 2.000000e+00
  %add43 = fadd double %30, %div42
  %mul44 = fmul double -5.000000e-01, %add43
  %32 = load double* %y1, align 8
  %33 = load double* %dk12, align 8
  %div45 = fdiv double %33, 2.000000e+00
  %add46 = fadd double %32, %div45
  %call47 = call double @sin(double %add46) nounwind readnone
  %sub48 = fsub double %mul44, %call47
  %34 = load double* %t, align 8
  %35 = load double* %h, align 8
  %div49 = fdiv double %35, 2.000000e+00
  %add50 = fadd double %34, %div49
  %mul51 = fmul double 0x3FE5555555555555, %add50
  %call52 = call double @cos(double %mul51) nounwind readnone
  %mul53 = fmul double 9.000000e-01, %call52
  %add54 = fadd double %sub48, %mul53
  %mul55 = fmul double %29, %add54
  store double %mul55, double* %dk23, align 8
  %36 = load double* %h, align 8
  %37 = load double* %y2, align 8
  %38 = load double* %dk23, align 8
  %add56 = fadd double %37, %38
  %mul57 = fmul double %36, %add56
  store double %mul57, double* %dk14, align 8
  %39 = load double* %h, align 8
  %40 = load double* %y2, align 8
  %41 = load double* %dk23, align 8
  %add58 = fadd double %40, %41
  %mul59 = fmul double -5.000000e-01, %add58
  %42 = load double* %y1, align 8
  %43 = load double* %dk13, align 8
  %add60 = fadd double %42, %43
  %call61 = call double @sin(double %add60) nounwind readnone
  %sub62 = fsub double %mul59, %call61
  %44 = load double* %t, align 8
  %45 = load double* %h, align 8
  %add63 = fadd double %44, %45
  %mul64 = fmul double 0x3FE5555555555555, %add63
  %call65 = call double @cos(double %mul64) nounwind readnone
  %mul66 = fmul double 9.000000e-01, %call65
  %add67 = fadd double %sub62, %mul66
  %mul68 = fmul double %39, %add67
  store double %mul68, double* %dk24, align 8
  %46 = load i32* %i, align 4
  %idxprom69 = sext i32 %46 to i64
  %arrayidx70 = getelementptr inbounds [2 x [60 x double]]* %y, i32 0, i64 0
  %arrayidx71 = getelementptr inbounds [60 x double]* %arrayidx70, i32 0, i64 %idxprom69
  %47 = load double* %arrayidx71, align 8
  %48 = load double* %dk11, align 8
  %49 = load double* %dk12, align 8
  %50 = load double* %dk13, align 8
  %add72 = fadd double %49, %50
  %mul73 = fmul double 2.000000e+00, %add72
  %add74 = fadd double %48, %mul73
  %51 = load double* %dk14, align 8
  %add75 = fadd double %add74, %51
  %div76 = fdiv double %add75, 6.000000e+00
  %add77 = fadd double %47, %div76
  %52 = load i32* %i, align 4
  %add78 = add nsw i32 %52, 1
  %idxprom79 = sext i32 %add78 to i64
  %arrayidx80 = getelementptr inbounds [2 x [60 x double]]* %y, i32 0, i64 0
  %arrayidx81 = getelementptr inbounds [60 x double]* %arrayidx80, i32 0, i64 %idxprom79
  store double %add77, double* %arrayidx81, align 8
  %53 = load i32* %i, align 4
  %idxprom82 = sext i32 %53 to i64
  %arrayidx83 = getelementptr inbounds [2 x [60 x double]]* %y, i32 0, i64 1
  %arrayidx84 = getelementptr inbounds [60 x double]* %arrayidx83, i32 0, i64 %idxprom82
  %54 = load double* %arrayidx84, align 8
  %55 = load double* %dk21, align 8
  %56 = load double* %dk22, align 8
  %57 = load double* %dk23, align 8
  %add85 = fadd double %56, %57
  %mul86 = fmul double 2.000000e+00, %add85
  %add87 = fadd double %55, %mul86
  %58 = load double* %dk24, align 8
  %add88 = fadd double %add87, %58
  %div89 = fdiv double %add88, 6.000000e+00
  %add90 = fadd double %54, %div89
  %59 = load i32* %i, align 4
  %add91 = add nsw i32 %59, 1
  %idxprom92 = sext i32 %add91 to i64
  %arrayidx93 = getelementptr inbounds [2 x [60 x double]]* %y, i32 0, i64 1
  %arrayidx94 = getelementptr inbounds [60 x double]* %arrayidx93, i32 0, i64 %idxprom92
  store double %add90, double* %arrayidx94, align 8
  %60 = load i32* %i, align 4
  %add95 = add nsw i32 %60, 1
  %idxprom96 = sext i32 %add95 to i64
  %arrayidx97 = getelementptr inbounds [2 x [60 x double]]* %y, i32 0, i64 0
  %arrayidx98 = getelementptr inbounds [60 x double]* %arrayidx97, i32 0, i64 %idxprom96
  %61 = load double* %arrayidx98, align 8
  %62 = load double* %pi, align 8
  %mul99 = fmul double 2.000000e+00, %62
  %div100 = fdiv double %61, %mul99
  %add101 = fadd double %div100, 5.000000e-01
  %conv102 = fptosi double %add101 to i32
  store i32 %conv102, i32* %np, align 4
  %63 = load i32* %i, align 4
  %add103 = add nsw i32 %63, 1
  %idxprom104 = sext i32 %add103 to i64
  %arrayidx105 = getelementptr inbounds [2 x [60 x double]]* %y, i32 0, i64 0
  %arrayidx106 = getelementptr inbounds [60 x double]* %arrayidx105, i32 0, i64 %idxprom104
  %64 = load double* %arrayidx106, align 8
  %65 = load double* %pi, align 8
  %mul107 = fmul double 2.000000e+00, %65
  %66 = load i32* %np, align 4
  %conv108 = sitofp i32 %66 to double
  %mul109 = fmul double %mul107, %conv108
  %sub110 = fsub double %64, %mul109
  %67 = load i32* %i, align 4
  %add111 = add nsw i32 %67, 1
  %idxprom112 = sext i32 %add111 to i64
  %arrayidx113 = getelementptr inbounds [2 x [60 x double]]* %y, i32 0, i64 0
  %arrayidx114 = getelementptr inbounds [60 x double]* %arrayidx113, i32 0, i64 %idxprom112
  store double %sub110, double* %arrayidx114, align 8
  %68 = load i32* %i, align 4
  %cmp115 = icmp eq i32 %68, 0
  br i1 %cmp115, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body
  %69 = load i32* %i, align 4
  %add117 = add nsw i32 %69, 1
  %70 = load i32* %l, align 4
  %rem = srem i32 %add117, %70
  %cmp118 = icmp eq i32 %rem, 0
  br i1 %cmp118, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %for.body
  %71 = load i32* %i, align 4
  %idxprom120 = sext i32 %71 to i64
  %arrayidx121 = getelementptr inbounds [2 x [60 x double]]* %y, i32 0, i64 0
  %arrayidx122 = getelementptr inbounds [60 x double]* %arrayidx121, i32 0, i64 %idxprom120
  %72 = load double* %arrayidx122, align 8
  %mul123 = fmul double %72, 1.000000e+04
  %conv124 = fptosi double %mul123 to i32
  %73 = load i32* %i, align 4
  %idxprom125 = sext i32 %73 to i64
  %arrayidx126 = getelementptr inbounds [2 x [60 x double]]* %y, i32 0, i64 1
  %arrayidx127 = getelementptr inbounds [60 x double]* %arrayidx126, i32 0, i64 %idxprom125
  %74 = load double* %arrayidx127, align 8
  %mul128 = fmul double %74, 1.000000e+04
  %conv129 = fptosi double %mul128 to i32
  %call130 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str, i32 0, i32 0), i32 %conv124, i32 %conv129)
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %75 = load i32* %i, align 4
  %inc = add nsw i32 %75, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}

declare double @atan(double) nounwind

declare double @sin(double) nounwind readnone

declare double @cos(double) nounwind readnone

declare i32 @printf(i8*, ...)
