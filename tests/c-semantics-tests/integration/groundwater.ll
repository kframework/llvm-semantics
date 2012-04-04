; ModuleID = '/home/david/src/c-semantics/tests/integration/groundwater.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"%d %d %d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %nx = alloca i32, align 4
  %ny = alloca i32, align 4
  %istep = alloca i32, align 4
  %pi = alloca double, align 8
  %a0 = alloca double, align 8
  %b0 = alloca double, align 8
  %h0 = alloca double, align 8
  %ch = alloca double, align 8
  %sx = alloca double, align 8
  %sy = alloca double, align 8
  %hx = alloca double, align 8
  %hy = alloca double, align 8
  %p = alloca double, align 8
  %x = alloca double, align 8
  %y = alloca double, align 8
  %phi = alloca [6 x [3 x double]], align 16
  %ck = alloca [6 x [3 x double]], align 16
  %sn = alloca [6 x [3 x double]], align 16
  store i32 0, i32* %retval
  store i32 6, i32* %nx, align 4
  store i32 3, i32* %ny, align 4
  %call = call double @atan(double 1.000000e+00) nounwind
  %mul = fmul double 4.000000e+00, %call
  store double %mul, double* %pi, align 8
  store double 1.000000e+00, double* %a0, align 8
  store double -4.000000e-02, double* %b0, align 8
  store double 2.000000e+02, double* %h0, align 8
  store double -2.000000e+01, double* %ch, align 8
  store double 1.000000e+03, double* %sx, align 8
  store double 5.000000e+02, double* %sy, align 8
  %0 = load double* %sx, align 8
  %1 = load i32* %nx, align 4
  %sub = sub nsw i32 %1, 1
  %conv = sitofp i32 %sub to double
  %div = fdiv double %0, %conv
  store double %div, double* %hx, align 8
  %2 = load double* %sy, align 8
  %3 = load i32* %ny, align 4
  %sub1 = sub nsw i32 %3, 1
  %conv2 = sitofp i32 %sub1 to double
  %div3 = fdiv double %2, %conv2
  store double %div3, double* %hy, align 8
  store double 5.000000e-01, double* %p, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc31, %entry
  %4 = load i32* %i, align 4
  %5 = load i32* %nx, align 4
  %cmp = icmp slt i32 %4, %5
  br i1 %cmp, label %for.body, label %for.end33

for.body:                                         ; preds = %for.cond
  %6 = load i32* %i, align 4
  %conv5 = sitofp i32 %6 to double
  %7 = load double* %hx, align 8
  %mul6 = fmul double %conv5, %7
  store double %mul6, double* %x, align 8
  store i32 0, i32* %j, align 4
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc, %for.body
  %8 = load i32* %j, align 4
  %9 = load i32* %ny, align 4
  %cmp8 = icmp slt i32 %8, %9
  br i1 %cmp8, label %for.body10, label %for.end

for.body10:                                       ; preds = %for.cond7
  %10 = load i32* %j, align 4
  %conv11 = sitofp i32 %10 to double
  %11 = load double* %hy, align 8
  %mul12 = fmul double %conv11, %11
  store double %mul12, double* %y, align 8
  %12 = load double* %a0, align 8
  %13 = load double* %b0, align 8
  %14 = load double* %y, align 8
  %mul13 = fmul double %13, %14
  %add = fadd double %12, %mul13
  %15 = load i32* %j, align 4
  %idxprom = sext i32 %15 to i64
  %16 = load i32* %i, align 4
  %idxprom14 = sext i32 %16 to i64
  %arrayidx = getelementptr inbounds [6 x [3 x double]]* %ck, i32 0, i64 %idxprom14
  %arrayidx15 = getelementptr inbounds [3 x double]* %arrayidx, i32 0, i64 %idxprom
  store double %add, double* %arrayidx15, align 8
  %17 = load double* %h0, align 8
  %18 = load double* %ch, align 8
  %19 = load double* %pi, align 8
  %20 = load double* %x, align 8
  %mul16 = fmul double %19, %20
  %21 = load double* %sx, align 8
  %div17 = fdiv double %mul16, %21
  %call18 = call double @cos(double %div17) nounwind readnone
  %mul19 = fmul double %18, %call18
  %22 = load double* %y, align 8
  %mul20 = fmul double %mul19, %22
  %23 = load double* %sy, align 8
  %div21 = fdiv double %mul20, %23
  %add22 = fadd double %17, %div21
  %24 = load i32* %j, align 4
  %idxprom23 = sext i32 %24 to i64
  %25 = load i32* %i, align 4
  %idxprom24 = sext i32 %25 to i64
  %arrayidx25 = getelementptr inbounds [6 x [3 x double]]* %phi, i32 0, i64 %idxprom24
  %arrayidx26 = getelementptr inbounds [3 x double]* %arrayidx25, i32 0, i64 %idxprom23
  store double %add22, double* %arrayidx26, align 8
  %26 = load i32* %j, align 4
  %idxprom27 = sext i32 %26 to i64
  %27 = load i32* %i, align 4
  %idxprom28 = sext i32 %27 to i64
  %arrayidx29 = getelementptr inbounds [6 x [3 x double]]* %sn, i32 0, i64 %idxprom28
  %arrayidx30 = getelementptr inbounds [3 x double]* %arrayidx29, i32 0, i64 %idxprom27
  store double 0.000000e+00, double* %arrayidx30, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body10
  %28 = load i32* %j, align 4
  %inc = add nsw i32 %28, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond7

for.end:                                          ; preds = %for.cond7
  br label %for.inc31

for.inc31:                                        ; preds = %for.end
  %29 = load i32* %i, align 4
  %inc32 = add nsw i32 %29, 1
  store i32 %inc32, i32* %i, align 4
  br label %for.cond

for.end33:                                        ; preds = %for.cond
  store i32 0, i32* %istep, align 4
  br label %for.cond34

for.cond34:                                       ; preds = %for.inc77, %for.end33
  %30 = load i32* %istep, align 4
  %cmp35 = icmp slt i32 %30, 2
  br i1 %cmp35, label %for.body37, label %for.end79

for.body37:                                       ; preds = %for.cond34
  store i32 0, i32* %j, align 4
  br label %for.cond38

for.cond38:                                       ; preds = %for.inc72, %for.body37
  %31 = load i32* %j, align 4
  %32 = load i32* %ny, align 4
  %cmp39 = icmp slt i32 %31, %32
  br i1 %cmp39, label %for.body41, label %for.end74

for.body41:                                       ; preds = %for.cond38
  %33 = load i32* %j, align 4
  %idxprom42 = sext i32 %33 to i64
  %arrayidx43 = getelementptr inbounds [6 x [3 x double]]* %phi, i32 0, i64 1
  %arrayidx44 = getelementptr inbounds [3 x double]* %arrayidx43, i32 0, i64 %idxprom42
  %34 = load double* %arrayidx44, align 8
  %mul45 = fmul double 4.000000e+00, %34
  %35 = load i32* %j, align 4
  %idxprom46 = sext i32 %35 to i64
  %arrayidx47 = getelementptr inbounds [6 x [3 x double]]* %phi, i32 0, i64 2
  %arrayidx48 = getelementptr inbounds [3 x double]* %arrayidx47, i32 0, i64 %idxprom46
  %36 = load double* %arrayidx48, align 8
  %sub49 = fsub double %mul45, %36
  %div50 = fdiv double %sub49, 3.000000e+00
  %37 = load i32* %j, align 4
  %idxprom51 = sext i32 %37 to i64
  %arrayidx52 = getelementptr inbounds [6 x [3 x double]]* %phi, i32 0, i64 0
  %arrayidx53 = getelementptr inbounds [3 x double]* %arrayidx52, i32 0, i64 %idxprom51
  store double %div50, double* %arrayidx53, align 8
  %38 = load i32* %j, align 4
  %idxprom54 = sext i32 %38 to i64
  %39 = load i32* %nx, align 4
  %sub55 = sub nsw i32 %39, 2
  %idxprom56 = sext i32 %sub55 to i64
  %arrayidx57 = getelementptr inbounds [6 x [3 x double]]* %phi, i32 0, i64 %idxprom56
  %arrayidx58 = getelementptr inbounds [3 x double]* %arrayidx57, i32 0, i64 %idxprom54
  %40 = load double* %arrayidx58, align 8
  %mul59 = fmul double 4.000000e+00, %40
  %41 = load i32* %j, align 4
  %idxprom60 = sext i32 %41 to i64
  %42 = load i32* %nx, align 4
  %sub61 = sub nsw i32 %42, 3
  %idxprom62 = sext i32 %sub61 to i64
  %arrayidx63 = getelementptr inbounds [6 x [3 x double]]* %phi, i32 0, i64 %idxprom62
  %arrayidx64 = getelementptr inbounds [3 x double]* %arrayidx63, i32 0, i64 %idxprom60
  %43 = load double* %arrayidx64, align 8
  %sub65 = fsub double %mul59, %43
  %div66 = fdiv double %sub65, 3.000000e+00
  %44 = load i32* %j, align 4
  %idxprom67 = sext i32 %44 to i64
  %45 = load i32* %nx, align 4
  %sub68 = sub nsw i32 %45, 1
  %idxprom69 = sext i32 %sub68 to i64
  %arrayidx70 = getelementptr inbounds [6 x [3 x double]]* %phi, i32 0, i64 %idxprom69
  %arrayidx71 = getelementptr inbounds [3 x double]* %arrayidx70, i32 0, i64 %idxprom67
  store double %div66, double* %arrayidx71, align 8
  br label %for.inc72

for.inc72:                                        ; preds = %for.body41
  %46 = load i32* %j, align 4
  %inc73 = add nsw i32 %46, 1
  store i32 %inc73, i32* %j, align 4
  br label %for.cond38

for.end74:                                        ; preds = %for.cond38
  %arraydecay = getelementptr inbounds [6 x [3 x double]]* %phi, i32 0, i32 0
  %arraydecay75 = getelementptr inbounds [6 x [3 x double]]* %ck, i32 0, i32 0
  %arraydecay76 = getelementptr inbounds [6 x [3 x double]]* %sn, i32 0, i32 0
  %47 = load i32* %nx, align 4
  %48 = load i32* %ny, align 4
  %49 = load double* %p, align 8
  %50 = load double* %hx, align 8
  %51 = load double* %hy, align 8
  call void (...)* bitcast (void ([3 x double]*, [3 x double]*, [3 x double]*, i32, i32, double, double, double)* @rx2d to void (...)*)([3 x double]* %arraydecay, [3 x double]* %arraydecay75, [3 x double]* %arraydecay76, i32 %47, i32 %48, double %49, double %50, double %51)
  br label %for.inc77

for.inc77:                                        ; preds = %for.end74
  %52 = load i32* %istep, align 4
  %inc78 = add nsw i32 %52, 1
  store i32 %inc78, i32* %istep, align 4
  br label %for.cond34

for.end79:                                        ; preds = %for.cond34
  store i32 0, i32* %i, align 4
  br label %for.cond80

for.cond80:                                       ; preds = %for.inc106, %for.end79
  %53 = load i32* %i, align 4
  %54 = load i32* %nx, align 4
  %cmp81 = icmp slt i32 %53, %54
  br i1 %cmp81, label %for.body83, label %for.end108

for.body83:                                       ; preds = %for.cond80
  %55 = load i32* %i, align 4
  %conv84 = sitofp i32 %55 to double
  %56 = load double* %hx, align 8
  %mul85 = fmul double %conv84, %56
  store double %mul85, double* %x, align 8
  store i32 0, i32* %j, align 4
  br label %for.cond86

for.cond86:                                       ; preds = %for.inc103, %for.body83
  %57 = load i32* %j, align 4
  %58 = load i32* %ny, align 4
  %cmp87 = icmp slt i32 %57, %58
  br i1 %cmp87, label %for.body89, label %for.end105

for.body89:                                       ; preds = %for.cond86
  %59 = load i32* %j, align 4
  %conv90 = sitofp i32 %59 to double
  %60 = load double* %hy, align 8
  %mul91 = fmul double %conv90, %60
  store double %mul91, double* %y, align 8
  %61 = load double* %x, align 8
  %mul92 = fmul double %61, 1.000000e+01
  %conv93 = fptosi double %mul92 to i32
  %62 = load double* %y, align 8
  %mul94 = fmul double %62, 1.000000e+01
  %conv95 = fptosi double %mul94 to i32
  %63 = load i32* %j, align 4
  %idxprom96 = sext i32 %63 to i64
  %64 = load i32* %i, align 4
  %idxprom97 = sext i32 %64 to i64
  %arrayidx98 = getelementptr inbounds [6 x [3 x double]]* %phi, i32 0, i64 %idxprom97
  %arrayidx99 = getelementptr inbounds [3 x double]* %arrayidx98, i32 0, i64 %idxprom96
  %65 = load double* %arrayidx99, align 8
  %conv100 = fptosi double %65 to i32
  %mul101 = mul nsw i32 %conv100, 10
  %call102 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0), i32 %conv93, i32 %conv95, i32 %mul101)
  br label %for.inc103

for.inc103:                                       ; preds = %for.body89
  %66 = load i32* %j, align 4
  %inc104 = add nsw i32 %66, 1
  store i32 %inc104, i32* %j, align 4
  br label %for.cond86

for.end105:                                       ; preds = %for.cond86
  br label %for.inc106

for.inc106:                                       ; preds = %for.end105
  %67 = load i32* %i, align 4
  %inc107 = add nsw i32 %67, 1
  store i32 %inc107, i32* %i, align 4
  br label %for.cond80

for.end108:                                       ; preds = %for.cond80
  ret i32 0
}

declare double @atan(double) nounwind

declare double @cos(double) nounwind readnone

declare i32 @printf(i8*, ...)

define void @rx2d([3 x double]* %fn, [3 x double]* %dn, [3 x double]* %s, i32 %nx, i32 %ny, double %p, double %hx, double %hy) nounwind uwtable {
entry:
  %fn.addr = alloca [3 x double]*, align 8
  %dn.addr = alloca [3 x double]*, align 8
  %s.addr = alloca [3 x double]*, align 8
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  %p.addr = alloca double, align 8
  %hx.addr = alloca double, align 8
  %hy.addr = alloca double, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %hx2 = alloca double, align 8
  %a = alloca double, align 8
  %b = alloca double, align 8
  %q = alloca double, align 8
  %cip = alloca double, align 8
  %cim = alloca double, align 8
  %cjp = alloca double, align 8
  %cjm = alloca double, align 8
  store [3 x double]* %fn, [3 x double]** %fn.addr, align 8
  store [3 x double]* %dn, [3 x double]** %dn.addr, align 8
  store [3 x double]* %s, [3 x double]** %s.addr, align 8
  store i32 %nx, i32* %nx.addr, align 4
  store i32 %ny, i32* %ny.addr, align 4
  store double %p, double* %p.addr, align 8
  store double %hx, double* %hx.addr, align 8
  store double %hy, double* %hy.addr, align 8
  %0 = load double* %hx.addr, align 8
  %1 = load double* %hx.addr, align 8
  %mul = fmul double %0, %1
  store double %mul, double* %hx2, align 8
  %2 = load double* %hx2, align 8
  %3 = load double* %hy.addr, align 8
  %4 = load double* %hy.addr, align 8
  %mul1 = fmul double %3, %4
  %div = fdiv double %2, %mul1
  store double %div, double* %a, align 8
  %5 = load double* %a, align 8
  %add = fadd double 1.000000e+00, %5
  %mul2 = fmul double 4.000000e+00, %add
  %div3 = fdiv double 1.000000e+00, %mul2
  store double %div3, double* %b, align 8
  %6 = load double* %p.addr, align 8
  %sub = fsub double 1.000000e+00, %6
  store double %sub, double* %q, align 8
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc101, %entry
  %7 = load i32* %i, align 4
  %8 = load i32* %nx.addr, align 4
  %sub4 = sub nsw i32 %8, 1
  %cmp = icmp slt i32 %7, %sub4
  br i1 %cmp, label %for.body, label %for.end103

for.body:                                         ; preds = %for.cond
  store i32 1, i32* %j, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc, %for.body
  %9 = load i32* %j, align 4
  %10 = load i32* %ny.addr, align 4
  %sub6 = sub nsw i32 %10, 1
  %cmp7 = icmp slt i32 %9, %sub6
  br i1 %cmp7, label %for.body8, label %for.end

for.body8:                                        ; preds = %for.cond5
  %11 = load double* %b, align 8
  %12 = load i32* %j, align 4
  %idxprom = sext i32 %12 to i64
  %13 = load i32* %i, align 4
  %add9 = add nsw i32 %13, 1
  %idxprom10 = sext i32 %add9 to i64
  %14 = load [3 x double]** %dn.addr, align 8
  %arrayidx = getelementptr inbounds [3 x double]* %14, i64 %idxprom10
  %arrayidx11 = getelementptr inbounds [3 x double]* %arrayidx, i32 0, i64 %idxprom
  %15 = load double* %arrayidx11, align 8
  %16 = load i32* %j, align 4
  %idxprom12 = sext i32 %16 to i64
  %17 = load i32* %i, align 4
  %idxprom13 = sext i32 %17 to i64
  %18 = load [3 x double]** %dn.addr, align 8
  %arrayidx14 = getelementptr inbounds [3 x double]* %18, i64 %idxprom13
  %arrayidx15 = getelementptr inbounds [3 x double]* %arrayidx14, i32 0, i64 %idxprom12
  %19 = load double* %arrayidx15, align 8
  %div16 = fdiv double %15, %19
  %add17 = fadd double %div16, 1.000000e+00
  %mul18 = fmul double %11, %add17
  store double %mul18, double* %cip, align 8
  %20 = load double* %b, align 8
  %21 = load i32* %j, align 4
  %idxprom19 = sext i32 %21 to i64
  %22 = load i32* %i, align 4
  %sub20 = sub nsw i32 %22, 1
  %idxprom21 = sext i32 %sub20 to i64
  %23 = load [3 x double]** %dn.addr, align 8
  %arrayidx22 = getelementptr inbounds [3 x double]* %23, i64 %idxprom21
  %arrayidx23 = getelementptr inbounds [3 x double]* %arrayidx22, i32 0, i64 %idxprom19
  %24 = load double* %arrayidx23, align 8
  %25 = load i32* %j, align 4
  %idxprom24 = sext i32 %25 to i64
  %26 = load i32* %i, align 4
  %idxprom25 = sext i32 %26 to i64
  %27 = load [3 x double]** %dn.addr, align 8
  %arrayidx26 = getelementptr inbounds [3 x double]* %27, i64 %idxprom25
  %arrayidx27 = getelementptr inbounds [3 x double]* %arrayidx26, i32 0, i64 %idxprom24
  %28 = load double* %arrayidx27, align 8
  %div28 = fdiv double %24, %28
  %add29 = fadd double %div28, 1.000000e+00
  %mul30 = fmul double %20, %add29
  store double %mul30, double* %cim, align 8
  %29 = load double* %a, align 8
  %30 = load double* %b, align 8
  %mul31 = fmul double %29, %30
  %31 = load i32* %j, align 4
  %add32 = add nsw i32 %31, 1
  %idxprom33 = sext i32 %add32 to i64
  %32 = load i32* %i, align 4
  %idxprom34 = sext i32 %32 to i64
  %33 = load [3 x double]** %dn.addr, align 8
  %arrayidx35 = getelementptr inbounds [3 x double]* %33, i64 %idxprom34
  %arrayidx36 = getelementptr inbounds [3 x double]* %arrayidx35, i32 0, i64 %idxprom33
  %34 = load double* %arrayidx36, align 8
  %35 = load i32* %j, align 4
  %idxprom37 = sext i32 %35 to i64
  %36 = load i32* %i, align 4
  %idxprom38 = sext i32 %36 to i64
  %37 = load [3 x double]** %dn.addr, align 8
  %arrayidx39 = getelementptr inbounds [3 x double]* %37, i64 %idxprom38
  %arrayidx40 = getelementptr inbounds [3 x double]* %arrayidx39, i32 0, i64 %idxprom37
  %38 = load double* %arrayidx40, align 8
  %div41 = fdiv double %34, %38
  %add42 = fadd double %div41, 1.000000e+00
  %mul43 = fmul double %mul31, %add42
  store double %mul43, double* %cjp, align 8
  %39 = load double* %a, align 8
  %40 = load double* %b, align 8
  %mul44 = fmul double %39, %40
  %41 = load i32* %j, align 4
  %sub45 = sub nsw i32 %41, 1
  %idxprom46 = sext i32 %sub45 to i64
  %42 = load i32* %i, align 4
  %idxprom47 = sext i32 %42 to i64
  %43 = load [3 x double]** %dn.addr, align 8
  %arrayidx48 = getelementptr inbounds [3 x double]* %43, i64 %idxprom47
  %arrayidx49 = getelementptr inbounds [3 x double]* %arrayidx48, i32 0, i64 %idxprom46
  %44 = load double* %arrayidx49, align 8
  %45 = load i32* %j, align 4
  %idxprom50 = sext i32 %45 to i64
  %46 = load i32* %i, align 4
  %idxprom51 = sext i32 %46 to i64
  %47 = load [3 x double]** %dn.addr, align 8
  %arrayidx52 = getelementptr inbounds [3 x double]* %47, i64 %idxprom51
  %arrayidx53 = getelementptr inbounds [3 x double]* %arrayidx52, i32 0, i64 %idxprom50
  %48 = load double* %arrayidx53, align 8
  %div54 = fdiv double %44, %48
  %add55 = fadd double %div54, 1.000000e+00
  %mul56 = fmul double %mul44, %add55
  store double %mul56, double* %cjm, align 8
  %49 = load double* %q, align 8
  %50 = load i32* %j, align 4
  %idxprom57 = sext i32 %50 to i64
  %51 = load i32* %i, align 4
  %idxprom58 = sext i32 %51 to i64
  %52 = load [3 x double]** %fn.addr, align 8
  %arrayidx59 = getelementptr inbounds [3 x double]* %52, i64 %idxprom58
  %arrayidx60 = getelementptr inbounds [3 x double]* %arrayidx59, i32 0, i64 %idxprom57
  %53 = load double* %arrayidx60, align 8
  %mul61 = fmul double %49, %53
  %54 = load double* %p.addr, align 8
  %55 = load double* %cip, align 8
  %56 = load i32* %j, align 4
  %idxprom62 = sext i32 %56 to i64
  %57 = load i32* %i, align 4
  %add63 = add nsw i32 %57, 1
  %idxprom64 = sext i32 %add63 to i64
  %58 = load [3 x double]** %fn.addr, align 8
  %arrayidx65 = getelementptr inbounds [3 x double]* %58, i64 %idxprom64
  %arrayidx66 = getelementptr inbounds [3 x double]* %arrayidx65, i32 0, i64 %idxprom62
  %59 = load double* %arrayidx66, align 8
  %mul67 = fmul double %55, %59
  %60 = load double* %cim, align 8
  %61 = load i32* %j, align 4
  %idxprom68 = sext i32 %61 to i64
  %62 = load i32* %i, align 4
  %sub69 = sub nsw i32 %62, 1
  %idxprom70 = sext i32 %sub69 to i64
  %63 = load [3 x double]** %fn.addr, align 8
  %arrayidx71 = getelementptr inbounds [3 x double]* %63, i64 %idxprom70
  %arrayidx72 = getelementptr inbounds [3 x double]* %arrayidx71, i32 0, i64 %idxprom68
  %64 = load double* %arrayidx72, align 8
  %mul73 = fmul double %60, %64
  %add74 = fadd double %mul67, %mul73
  %65 = load double* %cjp, align 8
  %66 = load i32* %j, align 4
  %add75 = add nsw i32 %66, 1
  %idxprom76 = sext i32 %add75 to i64
  %67 = load i32* %i, align 4
  %idxprom77 = sext i32 %67 to i64
  %68 = load [3 x double]** %fn.addr, align 8
  %arrayidx78 = getelementptr inbounds [3 x double]* %68, i64 %idxprom77
  %arrayidx79 = getelementptr inbounds [3 x double]* %arrayidx78, i32 0, i64 %idxprom76
  %69 = load double* %arrayidx79, align 8
  %mul80 = fmul double %65, %69
  %add81 = fadd double %add74, %mul80
  %70 = load double* %cjm, align 8
  %71 = load i32* %j, align 4
  %sub82 = sub nsw i32 %71, 1
  %idxprom83 = sext i32 %sub82 to i64
  %72 = load i32* %i, align 4
  %idxprom84 = sext i32 %72 to i64
  %73 = load [3 x double]** %fn.addr, align 8
  %arrayidx85 = getelementptr inbounds [3 x double]* %73, i64 %idxprom84
  %arrayidx86 = getelementptr inbounds [3 x double]* %arrayidx85, i32 0, i64 %idxprom83
  %74 = load double* %arrayidx86, align 8
  %mul87 = fmul double %70, %74
  %add88 = fadd double %add81, %mul87
  %75 = load double* %hx2, align 8
  %76 = load i32* %j, align 4
  %idxprom89 = sext i32 %76 to i64
  %77 = load i32* %i, align 4
  %idxprom90 = sext i32 %77 to i64
  %78 = load [3 x double]** %s.addr, align 8
  %arrayidx91 = getelementptr inbounds [3 x double]* %78, i64 %idxprom90
  %arrayidx92 = getelementptr inbounds [3 x double]* %arrayidx91, i32 0, i64 %idxprom89
  %79 = load double* %arrayidx92, align 8
  %mul93 = fmul double %75, %79
  %add94 = fadd double %add88, %mul93
  %mul95 = fmul double %54, %add94
  %add96 = fadd double %mul61, %mul95
  %80 = load i32* %j, align 4
  %idxprom97 = sext i32 %80 to i64
  %81 = load i32* %i, align 4
  %idxprom98 = sext i32 %81 to i64
  %82 = load [3 x double]** %fn.addr, align 8
  %arrayidx99 = getelementptr inbounds [3 x double]* %82, i64 %idxprom98
  %arrayidx100 = getelementptr inbounds [3 x double]* %arrayidx99, i32 0, i64 %idxprom97
  store double %add96, double* %arrayidx100, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body8
  %83 = load i32* %j, align 4
  %inc = add nsw i32 %83, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond5

for.end:                                          ; preds = %for.cond5
  br label %for.inc101

for.inc101:                                       ; preds = %for.end
  %84 = load i32* %i, align 4
  %inc102 = add nsw i32 %84, 1
  store i32 %inc102, i32* %i, align 4
  br label %for.cond

for.end103:                                       ; preds = %for.cond
  ret void
}
