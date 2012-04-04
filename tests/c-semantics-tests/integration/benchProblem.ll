; ModuleID = '/home/david/src/c-semantics/tests/integration/benchProblem.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"%d %d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %n = alloca i32, align 4
  %i = alloca i32, align 4
  %xl = alloca x86_fp80, align 16
  %h = alloca x86_fp80, align 16
  %h2 = alloca x86_fp80, align 16
  %y0 = alloca x86_fp80, align 16
  %x0 = alloca x86_fp80, align 16
  %xd = alloca x86_fp80, align 16
  %rho = alloca x86_fp80, align 16
  %g = alloca x86_fp80, align 16
  %d = alloca x86_fp80, align 16
  %e = alloca x86_fp80, align 16
  %e0 = alloca x86_fp80, align 16
  %f0 = alloca x86_fp80, align 16
  %b = alloca [20 x double], align 16
  %x = alloca [20 x double], align 16
  %y = alloca [20 x double], align 16
  %w = alloca [20 x double], align 16
  %u = alloca [20 x double], align 16
  store i32 0, i32* %retval
  store i32 20, i32* %n, align 4
  store x86_fp80 0xK4000C000000000000000, x86_fp80* %xl, align 16
  %0 = load x86_fp80* %xl, align 16
  %1 = load i32* %n, align 4
  %add = add nsw i32 %1, 1
  %conv = sitofp i32 %add to x86_fp80
  %div = fdiv x86_fp80 %0, %conv
  store x86_fp80 %div, x86_fp80* %h, align 16
  %2 = load x86_fp80* %h, align 16
  %3 = load x86_fp80* %h, align 16
  %mul = fmul x86_fp80 %2, %3
  store x86_fp80 %mul, x86_fp80* %h2, align 16
  %4 = call double @llvm.pow.f64(double 3.000000e-02, double 3.000000e+00)
  %mul1 = fmul double 1.000000e+09, %4
  %mul2 = fmul double %mul1, 2.000000e-01
  %div3 = fdiv double %mul2, 3.000000e+00
  %conv4 = fpext double %div3 to x86_fp80
  store x86_fp80 %conv4, x86_fp80* %y0, align 16
  store x86_fp80 0xK3FFD8000000000000000, x86_fp80* %x0, align 16
  store x86_fp80 0xK4000C000000000000000, x86_fp80* %rho, align 16
  store x86_fp80 0xK40029CCCCCCCCCCCD000, x86_fp80* %g, align 16
  store x86_fp80 0xK4006C800000000000000, x86_fp80* %f0, align 16
  store x86_fp80 0xK40008000000000000000, x86_fp80* %d, align 16
  store x86_fp80 0xKBFFF8000000000000000, x86_fp80* %e, align 16
  %call = call double @exp(double 1.000000e+00) nounwind
  %div5 = fdiv double 1.000000e+00, %call
  %conv6 = fpext double %div5 to x86_fp80
  store x86_fp80 %conv6, x86_fp80* %e0, align 16
  %5 = load x86_fp80* %d, align 16
  %conv7 = fptrunc x86_fp80 %5 to double
  %arrayidx = getelementptr inbounds [20 x double]* %w, i32 0, i64 0
  store double %conv7, double* %arrayidx, align 8
  %6 = load x86_fp80* %e, align 16
  %7 = load x86_fp80* %d, align 16
  %div8 = fdiv x86_fp80 %6, %7
  %conv9 = fptrunc x86_fp80 %div8 to double
  %arrayidx10 = getelementptr inbounds [20 x double]* %u, i32 0, i64 0
  store double %conv9, double* %arrayidx10, align 8
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i32* %i, align 4
  %9 = load i32* %n, align 4
  %cmp = icmp slt i32 %8, %9
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %10 = load x86_fp80* %d, align 16
  %11 = load x86_fp80* %e, align 16
  %12 = load i32* %i, align 4
  %sub = sub nsw i32 %12, 1
  %idxprom = sext i32 %sub to i64
  %arrayidx12 = getelementptr inbounds [20 x double]* %u, i32 0, i64 %idxprom
  %13 = load double* %arrayidx12, align 8
  %conv13 = fpext double %13 to x86_fp80
  %mul14 = fmul x86_fp80 %11, %conv13
  %sub15 = fsub x86_fp80 %10, %mul14
  %conv16 = fptrunc x86_fp80 %sub15 to double
  %14 = load i32* %i, align 4
  %idxprom17 = sext i32 %14 to i64
  %arrayidx18 = getelementptr inbounds [20 x double]* %w, i32 0, i64 %idxprom17
  store double %conv16, double* %arrayidx18, align 8
  %15 = load x86_fp80* %e, align 16
  %16 = load i32* %i, align 4
  %idxprom19 = sext i32 %16 to i64
  %arrayidx20 = getelementptr inbounds [20 x double]* %w, i32 0, i64 %idxprom19
  %17 = load double* %arrayidx20, align 8
  %conv21 = fpext double %17 to x86_fp80
  %div22 = fdiv x86_fp80 %15, %conv21
  %conv23 = fptrunc x86_fp80 %div22 to double
  %18 = load i32* %i, align 4
  %idxprom24 = sext i32 %18 to i64
  %arrayidx25 = getelementptr inbounds [20 x double]* %u, i32 0, i64 %idxprom24
  store double %conv23, double* %arrayidx25, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %19 = load i32* %i, align 4
  %inc = add nsw i32 %19, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond26

for.cond26:                                       ; preds = %for.inc70, %for.end
  %20 = load i32* %i, align 4
  %21 = load i32* %n, align 4
  %cmp27 = icmp slt i32 %20, %21
  br i1 %cmp27, label %for.body29, label %for.end72

for.body29:                                       ; preds = %for.cond26
  %22 = load x86_fp80* %h, align 16
  %23 = load i32* %i, align 4
  %add30 = add nsw i32 %23, 1
  %conv31 = sitofp i32 %add30 to x86_fp80
  %mul32 = fmul x86_fp80 %22, %conv31
  store x86_fp80 %mul32, x86_fp80* %xd, align 16
  %24 = load x86_fp80* %h2, align 16
  %sub33 = fsub x86_fp80 0xK80000000000000000000, %24
  %25 = load x86_fp80* %rho, align 16
  %mul34 = fmul x86_fp80 %sub33, %25
  %26 = load x86_fp80* %g, align 16
  %mul35 = fmul x86_fp80 %mul34, %26
  %conv36 = fptrunc x86_fp80 %mul35 to double
  %27 = load i32* %i, align 4
  %idxprom37 = sext i32 %27 to i64
  %arrayidx38 = getelementptr inbounds [20 x double]* %b, i32 0, i64 %idxprom37
  store double %conv36, double* %arrayidx38, align 8
  %28 = load x86_fp80* %xd, align 16
  %29 = load x86_fp80* %xl, align 16
  %div39 = fdiv x86_fp80 %29, 0xK40008000000000000000
  %sub40 = fsub x86_fp80 %28, %div39
  %conv41 = fptrunc x86_fp80 %sub40 to double
  %call42 = call double @fabs(double %conv41) nounwind readnone
  %conv43 = fpext double %call42 to x86_fp80
  %30 = load x86_fp80* %x0, align 16
  %cmp44 = fcmp olt x86_fp80 %conv43, %30
  br i1 %cmp44, label %if.then, label %if.end

if.then:                                          ; preds = %for.body29
  %31 = load i32* %i, align 4
  %idxprom46 = sext i32 %31 to i64
  %arrayidx47 = getelementptr inbounds [20 x double]* %b, i32 0, i64 %idxprom46
  %32 = load double* %arrayidx47, align 8
  %conv48 = fpext double %32 to x86_fp80
  %33 = load x86_fp80* %h2, align 16
  %34 = load x86_fp80* %f0, align 16
  %mul49 = fmul x86_fp80 %33, %34
  %35 = load x86_fp80* %xd, align 16
  %36 = load x86_fp80* %xl, align 16
  %div50 = fdiv x86_fp80 %36, 0xK40008000000000000000
  %sub51 = fsub x86_fp80 %35, %div50
  %37 = load x86_fp80* %x0, align 16
  %div52 = fdiv x86_fp80 %sub51, %37
  %conv53 = fptrunc x86_fp80 %div52 to double
  %38 = call double @llvm.pow.f64(double %conv53, double 2.000000e+00)
  %sub54 = fsub double -0.000000e+00, %38
  %call55 = call double @exp(double %sub54) nounwind
  %conv56 = fpext double %call55 to x86_fp80
  %39 = load x86_fp80* %e0, align 16
  %sub57 = fsub x86_fp80 %conv56, %39
  %mul58 = fmul x86_fp80 %mul49, %sub57
  %sub59 = fsub x86_fp80 %conv48, %mul58
  %conv60 = fptrunc x86_fp80 %sub59 to double
  %40 = load i32* %i, align 4
  %idxprom61 = sext i32 %40 to i64
  %arrayidx62 = getelementptr inbounds [20 x double]* %b, i32 0, i64 %idxprom61
  store double %conv60, double* %arrayidx62, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body29
  %41 = load i32* %i, align 4
  %idxprom63 = sext i32 %41 to i64
  %arrayidx64 = getelementptr inbounds [20 x double]* %b, i32 0, i64 %idxprom63
  %42 = load double* %arrayidx64, align 8
  %conv65 = fpext double %42 to x86_fp80
  %43 = load x86_fp80* %y0, align 16
  %div66 = fdiv x86_fp80 %conv65, %43
  %conv67 = fptrunc x86_fp80 %div66 to double
  %44 = load i32* %i, align 4
  %idxprom68 = sext i32 %44 to i64
  %arrayidx69 = getelementptr inbounds [20 x double]* %b, i32 0, i64 %idxprom68
  store double %conv67, double* %arrayidx69, align 8
  br label %for.inc70

for.inc70:                                        ; preds = %if.end
  %45 = load i32* %i, align 4
  %inc71 = add nsw i32 %45, 1
  store i32 %inc71, i32* %i, align 4
  br label %for.cond26

for.end72:                                        ; preds = %for.cond26
  %arrayidx73 = getelementptr inbounds [20 x double]* %b, i32 0, i64 0
  %46 = load double* %arrayidx73, align 8
  %arrayidx74 = getelementptr inbounds [20 x double]* %w, i32 0, i64 0
  %47 = load double* %arrayidx74, align 8
  %div75 = fdiv double %46, %47
  %arrayidx76 = getelementptr inbounds [20 x double]* %y, i32 0, i64 0
  store double %div75, double* %arrayidx76, align 8
  store i32 1, i32* %i, align 4
  br label %for.cond77

for.cond77:                                       ; preds = %for.inc92, %for.end72
  %48 = load i32* %i, align 4
  %49 = load i32* %n, align 4
  %cmp78 = icmp slt i32 %48, %49
  br i1 %cmp78, label %for.body80, label %for.end94

for.body80:                                       ; preds = %for.cond77
  %50 = load i32* %i, align 4
  %idxprom81 = sext i32 %50 to i64
  %arrayidx82 = getelementptr inbounds [20 x double]* %b, i32 0, i64 %idxprom81
  %51 = load double* %arrayidx82, align 8
  %52 = load i32* %i, align 4
  %sub83 = sub nsw i32 %52, 1
  %idxprom84 = sext i32 %sub83 to i64
  %arrayidx85 = getelementptr inbounds [20 x double]* %y, i32 0, i64 %idxprom84
  %53 = load double* %arrayidx85, align 8
  %add86 = fadd double %51, %53
  %54 = load i32* %i, align 4
  %idxprom87 = sext i32 %54 to i64
  %arrayidx88 = getelementptr inbounds [20 x double]* %w, i32 0, i64 %idxprom87
  %55 = load double* %arrayidx88, align 8
  %div89 = fdiv double %add86, %55
  %56 = load i32* %i, align 4
  %idxprom90 = sext i32 %56 to i64
  %arrayidx91 = getelementptr inbounds [20 x double]* %y, i32 0, i64 %idxprom90
  store double %div89, double* %arrayidx91, align 8
  br label %for.inc92

for.inc92:                                        ; preds = %for.body80
  %57 = load i32* %i, align 4
  %inc93 = add nsw i32 %57, 1
  store i32 %inc93, i32* %i, align 4
  br label %for.cond77

for.end94:                                        ; preds = %for.cond77
  %58 = load i32* %n, align 4
  %sub95 = sub nsw i32 %58, 1
  %idxprom96 = sext i32 %sub95 to i64
  %arrayidx97 = getelementptr inbounds [20 x double]* %y, i32 0, i64 %idxprom96
  %59 = load double* %arrayidx97, align 8
  %60 = load i32* %n, align 4
  %sub98 = sub nsw i32 %60, 1
  %idxprom99 = sext i32 %sub98 to i64
  %arrayidx100 = getelementptr inbounds [20 x double]* %x, i32 0, i64 %idxprom99
  store double %59, double* %arrayidx100, align 8
  %61 = load i32* %n, align 4
  %sub101 = sub nsw i32 %61, 2
  store i32 %sub101, i32* %i, align 4
  br label %for.cond102

for.cond102:                                      ; preds = %for.inc117, %for.end94
  %62 = load i32* %i, align 4
  %cmp103 = icmp sge i32 %62, 0
  br i1 %cmp103, label %for.body105, label %for.end119

for.body105:                                      ; preds = %for.cond102
  %63 = load i32* %i, align 4
  %idxprom106 = sext i32 %63 to i64
  %arrayidx107 = getelementptr inbounds [20 x double]* %y, i32 0, i64 %idxprom106
  %64 = load double* %arrayidx107, align 8
  %65 = load i32* %i, align 4
  %idxprom108 = sext i32 %65 to i64
  %arrayidx109 = getelementptr inbounds [20 x double]* %u, i32 0, i64 %idxprom108
  %66 = load double* %arrayidx109, align 8
  %67 = load i32* %i, align 4
  %add110 = add nsw i32 %67, 1
  %idxprom111 = sext i32 %add110 to i64
  %arrayidx112 = getelementptr inbounds [20 x double]* %x, i32 0, i64 %idxprom111
  %68 = load double* %arrayidx112, align 8
  %mul113 = fmul double %66, %68
  %sub114 = fsub double %64, %mul113
  %69 = load i32* %i, align 4
  %idxprom115 = sext i32 %69 to i64
  %arrayidx116 = getelementptr inbounds [20 x double]* %x, i32 0, i64 %idxprom115
  store double %sub114, double* %arrayidx116, align 8
  br label %for.inc117

for.inc117:                                       ; preds = %for.body105
  %70 = load i32* %i, align 4
  %sub118 = sub nsw i32 %70, 1
  store i32 %sub118, i32* %i, align 4
  br label %for.cond102

for.end119:                                       ; preds = %for.cond102
  store i32 0, i32* %i, align 4
  br label %for.cond120

for.cond120:                                      ; preds = %for.inc135, %for.end119
  %71 = load i32* %i, align 4
  %72 = load i32* %n, align 4
  %cmp121 = icmp slt i32 %71, %72
  br i1 %cmp121, label %for.body123, label %for.end137

for.body123:                                      ; preds = %for.cond120
  %73 = load x86_fp80* %h, align 16
  %74 = load i32* %i, align 4
  %add124 = add nsw i32 %74, 1
  %conv125 = sitofp i32 %add124 to x86_fp80
  %mul126 = fmul x86_fp80 %73, %conv125
  %mul127 = fmul x86_fp80 %mul126, 0xK4008FA00000000000000
  %conv128 = fptosi x86_fp80 %mul127 to i32
  %75 = load i32* %i, align 4
  %idxprom129 = sext i32 %75 to i64
  %arrayidx130 = getelementptr inbounds [20 x double]* %x, i32 0, i64 %idxprom129
  %76 = load double* %arrayidx130, align 8
  %mul131 = fmul double 1.000000e+02, %76
  %mul132 = fmul double %mul131, 1.000000e+03
  %conv133 = fptosi double %mul132 to i32
  %call134 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str, i32 0, i32 0), i32 %conv128, i32 %conv133)
  br label %for.inc135

for.inc135:                                       ; preds = %for.body123
  %77 = load i32* %i, align 4
  %inc136 = add nsw i32 %77, 1
  store i32 %inc136, i32* %i, align 4
  br label %for.cond120

for.end137:                                       ; preds = %for.cond120
  ret i32 0
}

declare double @llvm.pow.f64(double, double) nounwind readonly

declare double @exp(double) nounwind

declare double @fabs(double) nounwind readnone

declare i32 @printf(i8*, ...)
