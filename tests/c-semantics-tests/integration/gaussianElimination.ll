; ModuleID = '/home/david/src/c-semantics/tests/integration/gaussianElimination.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.b = private unnamed_addr constant [3 x double] [double 2.000000e+02, double 0.000000e+00, double 0.000000e+00], align 16
@main.a = private unnamed_addr constant [3 x [3 x double]] [[3 x double] [double 1.000000e+02, double 1.000000e+02, double 1.000000e+02], [3 x double] [double -1.000000e+02, double 3.000000e+02, double -1.000000e+02], [3 x double] [double -1.000000e+02, double -1.000000e+02, double 3.000000e+02]], align 16
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str1 = private unnamed_addr constant [36 x i8] c"The matrix dimension is too large.\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca [3 x double], align 16
  %b = alloca [3 x double], align 16
  %a = alloca [3 x [3 x double]], align 16
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  %indx = alloca [3 x i32], align 4
  store i32 0, i32* %retval
  %0 = bitcast [3 x double]* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([3 x double]* @main.b to i8*), i64 24, i32 16, i1 false)
  %1 = bitcast [3 x [3 x double]]* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast ([3 x [3 x double]]* @main.a to i8*), i64 72, i32 16, i1 false)
  store i32 3, i32* %n, align 4
  %arraydecay = getelementptr inbounds [3 x [3 x double]]* %a, i32 0, i32 0
  %2 = load i32* %n, align 4
  %arraydecay1 = getelementptr inbounds [3 x double]* %b, i32 0, i32 0
  %arraydecay2 = getelementptr inbounds [3 x double]* %x, i32 0, i32 0
  %arraydecay3 = getelementptr inbounds [3 x i32]* %indx, i32 0, i32 0
  call void (...)* bitcast (void ([3 x double]*, i32, double*, double*, i32*)* @legs to void (...)*)([3 x double]* %arraydecay, i32 %2, double* %arraydecay1, double* %arraydecay2, i32* %arraydecay3)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32* %i, align 4
  %4 = load i32* %n, align 4
  %cmp = icmp slt i32 %3, %4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %5 = load i32* %i, align 4
  %idxprom = sext i32 %5 to i64
  %arrayidx = getelementptr inbounds [3 x double]* %x, i32 0, i64 %idxprom
  %6 = load double* %arrayidx, align 8
  %mul = fmul double %6, 1.000000e+04
  %conv = fptosi double %mul to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %conv)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %7 = load i32* %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @printf(i8*, ...)

define void @legs([3 x double]* %a, i32 %n, double* %b, double* %x, i32* %indx) nounwind uwtable {
entry:
  %a.addr = alloca [3 x double]*, align 8
  %n.addr = alloca i32, align 4
  %b.addr = alloca double*, align 8
  %x.addr = alloca double*, align 8
  %indx.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store [3 x double]* %a, [3 x double]** %a.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store double* %b, double** %b.addr, align 8
  store double* %x, double** %x.addr, align 8
  store i32* %indx, i32** %indx.addr, align 8
  %0 = load [3 x double]** %a.addr, align 8
  %1 = load i32* %n.addr, align 4
  %2 = load i32** %indx.addr, align 8
  call void (...)* bitcast (void ([3 x double]*, i32, i32*)* @elgs to void (...)*)([3 x double]* %0, i32 %1, i32* %2)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc21, %entry
  %3 = load i32* %i, align 4
  %4 = load i32* %n.addr, align 4
  %sub = sub nsw i32 %4, 1
  %cmp = icmp slt i32 %3, %sub
  br i1 %cmp, label %for.body, label %for.end23

for.body:                                         ; preds = %for.cond
  %5 = load i32* %i, align 4
  %add = add nsw i32 %5, 1
  store i32 %add, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %6 = load i32* %j, align 4
  %7 = load i32* %n.addr, align 4
  %cmp2 = icmp slt i32 %6, %7
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %8 = load i32* %j, align 4
  %idxprom = sext i32 %8 to i64
  %9 = load i32** %indx.addr, align 8
  %arrayidx = getelementptr inbounds i32* %9, i64 %idxprom
  %10 = load i32* %arrayidx, align 4
  %idxprom4 = sext i32 %10 to i64
  %11 = load double** %b.addr, align 8
  %arrayidx5 = getelementptr inbounds double* %11, i64 %idxprom4
  %12 = load double* %arrayidx5, align 8
  %13 = load i32* %i, align 4
  %idxprom6 = sext i32 %13 to i64
  %14 = load i32* %j, align 4
  %idxprom7 = sext i32 %14 to i64
  %15 = load i32** %indx.addr, align 8
  %arrayidx8 = getelementptr inbounds i32* %15, i64 %idxprom7
  %16 = load i32* %arrayidx8, align 4
  %idxprom9 = sext i32 %16 to i64
  %17 = load [3 x double]** %a.addr, align 8
  %arrayidx10 = getelementptr inbounds [3 x double]* %17, i64 %idxprom9
  %arrayidx11 = getelementptr inbounds [3 x double]* %arrayidx10, i32 0, i64 %idxprom6
  %18 = load double* %arrayidx11, align 8
  %19 = load i32* %i, align 4
  %idxprom12 = sext i32 %19 to i64
  %20 = load i32** %indx.addr, align 8
  %arrayidx13 = getelementptr inbounds i32* %20, i64 %idxprom12
  %21 = load i32* %arrayidx13, align 4
  %idxprom14 = sext i32 %21 to i64
  %22 = load double** %b.addr, align 8
  %arrayidx15 = getelementptr inbounds double* %22, i64 %idxprom14
  %23 = load double* %arrayidx15, align 8
  %mul = fmul double %18, %23
  %sub16 = fsub double %12, %mul
  %24 = load i32* %j, align 4
  %idxprom17 = sext i32 %24 to i64
  %25 = load i32** %indx.addr, align 8
  %arrayidx18 = getelementptr inbounds i32* %25, i64 %idxprom17
  %26 = load i32* %arrayidx18, align 4
  %idxprom19 = sext i32 %26 to i64
  %27 = load double** %b.addr, align 8
  %arrayidx20 = getelementptr inbounds double* %27, i64 %idxprom19
  store double %sub16, double* %arrayidx20, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %28 = load i32* %j, align 4
  %inc = add nsw i32 %28, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc21

for.inc21:                                        ; preds = %for.end
  %29 = load i32* %i, align 4
  %inc22 = add nsw i32 %29, 1
  store i32 %inc22, i32* %i, align 4
  br label %for.cond

for.end23:                                        ; preds = %for.cond
  %30 = load i32* %n.addr, align 4
  %sub24 = sub nsw i32 %30, 1
  %idxprom25 = sext i32 %sub24 to i64
  %31 = load i32** %indx.addr, align 8
  %arrayidx26 = getelementptr inbounds i32* %31, i64 %idxprom25
  %32 = load i32* %arrayidx26, align 4
  %idxprom27 = sext i32 %32 to i64
  %33 = load double** %b.addr, align 8
  %arrayidx28 = getelementptr inbounds double* %33, i64 %idxprom27
  %34 = load double* %arrayidx28, align 8
  %35 = load i32* %n.addr, align 4
  %sub29 = sub nsw i32 %35, 1
  %idxprom30 = sext i32 %sub29 to i64
  %36 = load i32* %n.addr, align 4
  %sub31 = sub nsw i32 %36, 1
  %idxprom32 = sext i32 %sub31 to i64
  %37 = load i32** %indx.addr, align 8
  %arrayidx33 = getelementptr inbounds i32* %37, i64 %idxprom32
  %38 = load i32* %arrayidx33, align 4
  %idxprom34 = sext i32 %38 to i64
  %39 = load [3 x double]** %a.addr, align 8
  %arrayidx35 = getelementptr inbounds [3 x double]* %39, i64 %idxprom34
  %arrayidx36 = getelementptr inbounds [3 x double]* %arrayidx35, i32 0, i64 %idxprom30
  %40 = load double* %arrayidx36, align 8
  %div = fdiv double %34, %40
  %41 = load i32* %n.addr, align 4
  %sub37 = sub nsw i32 %41, 1
  %idxprom38 = sext i32 %sub37 to i64
  %42 = load double** %x.addr, align 8
  %arrayidx39 = getelementptr inbounds double* %42, i64 %idxprom38
  store double %div, double* %arrayidx39, align 8
  %43 = load i32* %n.addr, align 4
  %sub40 = sub nsw i32 %43, 2
  store i32 %sub40, i32* %i, align 4
  br label %for.cond41

for.cond41:                                       ; preds = %for.inc82, %for.end23
  %44 = load i32* %i, align 4
  %cmp42 = icmp sge i32 %44, 0
  br i1 %cmp42, label %for.body43, label %for.end83

for.body43:                                       ; preds = %for.cond41
  %45 = load i32* %i, align 4
  %idxprom44 = sext i32 %45 to i64
  %46 = load i32** %indx.addr, align 8
  %arrayidx45 = getelementptr inbounds i32* %46, i64 %idxprom44
  %47 = load i32* %arrayidx45, align 4
  %idxprom46 = sext i32 %47 to i64
  %48 = load double** %b.addr, align 8
  %arrayidx47 = getelementptr inbounds double* %48, i64 %idxprom46
  %49 = load double* %arrayidx47, align 8
  %50 = load i32* %i, align 4
  %idxprom48 = sext i32 %50 to i64
  %51 = load double** %x.addr, align 8
  %arrayidx49 = getelementptr inbounds double* %51, i64 %idxprom48
  store double %49, double* %arrayidx49, align 8
  %52 = load i32* %i, align 4
  %add50 = add nsw i32 %52, 1
  store i32 %add50, i32* %j, align 4
  br label %for.cond51

for.cond51:                                       ; preds = %for.inc68, %for.body43
  %53 = load i32* %j, align 4
  %54 = load i32* %n.addr, align 4
  %cmp52 = icmp slt i32 %53, %54
  br i1 %cmp52, label %for.body53, label %for.end70

for.body53:                                       ; preds = %for.cond51
  %55 = load i32* %i, align 4
  %idxprom54 = sext i32 %55 to i64
  %56 = load double** %x.addr, align 8
  %arrayidx55 = getelementptr inbounds double* %56, i64 %idxprom54
  %57 = load double* %arrayidx55, align 8
  %58 = load i32* %j, align 4
  %idxprom56 = sext i32 %58 to i64
  %59 = load i32* %i, align 4
  %idxprom57 = sext i32 %59 to i64
  %60 = load i32** %indx.addr, align 8
  %arrayidx58 = getelementptr inbounds i32* %60, i64 %idxprom57
  %61 = load i32* %arrayidx58, align 4
  %idxprom59 = sext i32 %61 to i64
  %62 = load [3 x double]** %a.addr, align 8
  %arrayidx60 = getelementptr inbounds [3 x double]* %62, i64 %idxprom59
  %arrayidx61 = getelementptr inbounds [3 x double]* %arrayidx60, i32 0, i64 %idxprom56
  %63 = load double* %arrayidx61, align 8
  %64 = load i32* %j, align 4
  %idxprom62 = sext i32 %64 to i64
  %65 = load double** %x.addr, align 8
  %arrayidx63 = getelementptr inbounds double* %65, i64 %idxprom62
  %66 = load double* %arrayidx63, align 8
  %mul64 = fmul double %63, %66
  %sub65 = fsub double %57, %mul64
  %67 = load i32* %i, align 4
  %idxprom66 = sext i32 %67 to i64
  %68 = load double** %x.addr, align 8
  %arrayidx67 = getelementptr inbounds double* %68, i64 %idxprom66
  store double %sub65, double* %arrayidx67, align 8
  br label %for.inc68

for.inc68:                                        ; preds = %for.body53
  %69 = load i32* %j, align 4
  %inc69 = add nsw i32 %69, 1
  store i32 %inc69, i32* %j, align 4
  br label %for.cond51

for.end70:                                        ; preds = %for.cond51
  %70 = load i32* %i, align 4
  %idxprom71 = sext i32 %70 to i64
  %71 = load double** %x.addr, align 8
  %arrayidx72 = getelementptr inbounds double* %71, i64 %idxprom71
  %72 = load double* %arrayidx72, align 8
  %73 = load i32* %i, align 4
  %idxprom73 = sext i32 %73 to i64
  %74 = load i32* %i, align 4
  %idxprom74 = sext i32 %74 to i64
  %75 = load i32** %indx.addr, align 8
  %arrayidx75 = getelementptr inbounds i32* %75, i64 %idxprom74
  %76 = load i32* %arrayidx75, align 4
  %idxprom76 = sext i32 %76 to i64
  %77 = load [3 x double]** %a.addr, align 8
  %arrayidx77 = getelementptr inbounds [3 x double]* %77, i64 %idxprom76
  %arrayidx78 = getelementptr inbounds [3 x double]* %arrayidx77, i32 0, i64 %idxprom73
  %78 = load double* %arrayidx78, align 8
  %div79 = fdiv double %72, %78
  %79 = load i32* %i, align 4
  %idxprom80 = sext i32 %79 to i64
  %80 = load double** %x.addr, align 8
  %arrayidx81 = getelementptr inbounds double* %80, i64 %idxprom80
  store double %div79, double* %arrayidx81, align 8
  br label %for.inc82

for.inc82:                                        ; preds = %for.end70
  %81 = load i32* %i, align 4
  %dec = add nsw i32 %81, -1
  store i32 %dec, i32* %i, align 4
  br label %for.cond41

for.end83:                                        ; preds = %for.cond41
  ret void
}

define void @elgs([3 x double]* %a, i32 %n, i32* %indx) nounwind uwtable {
entry:
  %a.addr = alloca [3 x double]*, align 8
  %n.addr = alloca i32, align 4
  %indx.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %itmp = alloca i32, align 4
  %c1 = alloca double, align 8
  %pi = alloca double, align 8
  %pi1 = alloca double, align 8
  %pj = alloca double, align 8
  %c = alloca [3 x double], align 16
  store [3 x double]* %a, [3 x double]** %a.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i32* %indx, i32** %indx.addr, align 8
  %0 = load i32* %n.addr, align 4
  %cmp = icmp sgt i32 %0, 3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str1, i32 0, i32 0))
  call void @exit(i32 1) noreturn
  unreachable

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i32* %i, align 4
  %2 = load i32* %n.addr, align 4
  %cmp1 = icmp slt i32 %1, %2
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32* %i, align 4
  %4 = load i32* %i, align 4
  %idxprom = sext i32 %4 to i64
  %5 = load i32** %indx.addr, align 8
  %arrayidx = getelementptr inbounds i32* %5, i64 %idxprom
  store i32 %3, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load i32* %i, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc26, %for.end
  %7 = load i32* %i, align 4
  %8 = load i32* %n.addr, align 4
  %cmp3 = icmp slt i32 %7, %8
  br i1 %cmp3, label %for.body4, label %for.end28

for.body4:                                        ; preds = %for.cond2
  store double 0.000000e+00, double* %c1, align 8
  store i32 0, i32* %j, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc21, %for.body4
  %9 = load i32* %j, align 4
  %10 = load i32* %n.addr, align 4
  %cmp6 = icmp slt i32 %9, %10
  br i1 %cmp6, label %for.body7, label %for.end23

for.body7:                                        ; preds = %for.cond5
  %11 = load i32* %j, align 4
  %idxprom8 = sext i32 %11 to i64
  %12 = load i32* %i, align 4
  %idxprom9 = sext i32 %12 to i64
  %13 = load [3 x double]** %a.addr, align 8
  %arrayidx10 = getelementptr inbounds [3 x double]* %13, i64 %idxprom9
  %arrayidx11 = getelementptr inbounds [3 x double]* %arrayidx10, i32 0, i64 %idxprom8
  %14 = load double* %arrayidx11, align 8
  %call12 = call double @fabs(double %14) nounwind readnone
  %15 = load double* %c1, align 8
  %cmp13 = fcmp ogt double %call12, %15
  br i1 %cmp13, label %if.then14, label %if.end20

if.then14:                                        ; preds = %for.body7
  %16 = load i32* %j, align 4
  %idxprom15 = sext i32 %16 to i64
  %17 = load i32* %i, align 4
  %idxprom16 = sext i32 %17 to i64
  %18 = load [3 x double]** %a.addr, align 8
  %arrayidx17 = getelementptr inbounds [3 x double]* %18, i64 %idxprom16
  %arrayidx18 = getelementptr inbounds [3 x double]* %arrayidx17, i32 0, i64 %idxprom15
  %19 = load double* %arrayidx18, align 8
  %call19 = call double @fabs(double %19) nounwind readnone
  store double %call19, double* %c1, align 8
  br label %if.end20

if.end20:                                         ; preds = %if.then14, %for.body7
  br label %for.inc21

for.inc21:                                        ; preds = %if.end20
  %20 = load i32* %j, align 4
  %inc22 = add nsw i32 %20, 1
  store i32 %inc22, i32* %j, align 4
  br label %for.cond5

for.end23:                                        ; preds = %for.cond5
  %21 = load double* %c1, align 8
  %22 = load i32* %i, align 4
  %idxprom24 = sext i32 %22 to i64
  %arrayidx25 = getelementptr inbounds [3 x double]* %c, i32 0, i64 %idxprom24
  store double %21, double* %arrayidx25, align 8
  br label %for.inc26

for.inc26:                                        ; preds = %for.end23
  %23 = load i32* %i, align 4
  %inc27 = add nsw i32 %23, 1
  store i32 %inc27, i32* %i, align 4
  br label %for.cond2

for.end28:                                        ; preds = %for.cond2
  store i32 0, i32* %j, align 4
  br label %for.cond29

for.cond29:                                       ; preds = %for.inc111, %for.end28
  %24 = load i32* %j, align 4
  %25 = load i32* %n.addr, align 4
  %sub = sub nsw i32 %25, 1
  %cmp30 = icmp slt i32 %24, %sub
  br i1 %cmp30, label %for.body31, label %for.end113

for.body31:                                       ; preds = %for.cond29
  store double 0.000000e+00, double* %pi1, align 8
  %26 = load i32* %j, align 4
  store i32 %26, i32* %i, align 4
  br label %for.cond32

for.cond32:                                       ; preds = %for.inc49, %for.body31
  %27 = load i32* %i, align 4
  %28 = load i32* %n.addr, align 4
  %cmp33 = icmp slt i32 %27, %28
  br i1 %cmp33, label %for.body34, label %for.end51

for.body34:                                       ; preds = %for.cond32
  %29 = load i32* %j, align 4
  %idxprom35 = sext i32 %29 to i64
  %30 = load i32* %i, align 4
  %idxprom36 = sext i32 %30 to i64
  %31 = load i32** %indx.addr, align 8
  %arrayidx37 = getelementptr inbounds i32* %31, i64 %idxprom36
  %32 = load i32* %arrayidx37, align 4
  %idxprom38 = sext i32 %32 to i64
  %33 = load [3 x double]** %a.addr, align 8
  %arrayidx39 = getelementptr inbounds [3 x double]* %33, i64 %idxprom38
  %arrayidx40 = getelementptr inbounds [3 x double]* %arrayidx39, i32 0, i64 %idxprom35
  %34 = load double* %arrayidx40, align 8
  %call41 = call double @fabs(double %34) nounwind readnone
  %35 = load i32* %i, align 4
  %idxprom42 = sext i32 %35 to i64
  %36 = load i32** %indx.addr, align 8
  %arrayidx43 = getelementptr inbounds i32* %36, i64 %idxprom42
  %37 = load i32* %arrayidx43, align 4
  %idxprom44 = sext i32 %37 to i64
  %arrayidx45 = getelementptr inbounds [3 x double]* %c, i32 0, i64 %idxprom44
  %38 = load double* %arrayidx45, align 8
  %div = fdiv double %call41, %38
  store double %div, double* %pi, align 8
  %39 = load double* %pi, align 8
  %40 = load double* %pi1, align 8
  %cmp46 = fcmp ogt double %39, %40
  br i1 %cmp46, label %if.then47, label %if.end48

if.then47:                                        ; preds = %for.body34
  %41 = load double* %pi, align 8
  store double %41, double* %pi1, align 8
  %42 = load i32* %i, align 4
  store i32 %42, i32* %k, align 4
  br label %if.end48

if.end48:                                         ; preds = %if.then47, %for.body34
  br label %for.inc49

for.inc49:                                        ; preds = %if.end48
  %43 = load i32* %i, align 4
  %inc50 = add nsw i32 %43, 1
  store i32 %inc50, i32* %i, align 4
  br label %for.cond32

for.end51:                                        ; preds = %for.cond32
  %44 = load i32* %j, align 4
  %idxprom52 = sext i32 %44 to i64
  %45 = load i32** %indx.addr, align 8
  %arrayidx53 = getelementptr inbounds i32* %45, i64 %idxprom52
  %46 = load i32* %arrayidx53, align 4
  store i32 %46, i32* %itmp, align 4
  %47 = load i32* %k, align 4
  %idxprom54 = sext i32 %47 to i64
  %48 = load i32** %indx.addr, align 8
  %arrayidx55 = getelementptr inbounds i32* %48, i64 %idxprom54
  %49 = load i32* %arrayidx55, align 4
  %50 = load i32* %j, align 4
  %idxprom56 = sext i32 %50 to i64
  %51 = load i32** %indx.addr, align 8
  %arrayidx57 = getelementptr inbounds i32* %51, i64 %idxprom56
  store i32 %49, i32* %arrayidx57, align 4
  %52 = load i32* %itmp, align 4
  %53 = load i32* %k, align 4
  %idxprom58 = sext i32 %53 to i64
  %54 = load i32** %indx.addr, align 8
  %arrayidx59 = getelementptr inbounds i32* %54, i64 %idxprom58
  store i32 %52, i32* %arrayidx59, align 4
  %55 = load i32* %j, align 4
  %add = add nsw i32 %55, 1
  store i32 %add, i32* %i, align 4
  br label %for.cond60

for.cond60:                                       ; preds = %for.inc108, %for.end51
  %56 = load i32* %i, align 4
  %57 = load i32* %n.addr, align 4
  %cmp61 = icmp slt i32 %56, %57
  br i1 %cmp61, label %for.body62, label %for.end110

for.body62:                                       ; preds = %for.cond60
  %58 = load i32* %j, align 4
  %idxprom63 = sext i32 %58 to i64
  %59 = load i32* %i, align 4
  %idxprom64 = sext i32 %59 to i64
  %60 = load i32** %indx.addr, align 8
  %arrayidx65 = getelementptr inbounds i32* %60, i64 %idxprom64
  %61 = load i32* %arrayidx65, align 4
  %idxprom66 = sext i32 %61 to i64
  %62 = load [3 x double]** %a.addr, align 8
  %arrayidx67 = getelementptr inbounds [3 x double]* %62, i64 %idxprom66
  %arrayidx68 = getelementptr inbounds [3 x double]* %arrayidx67, i32 0, i64 %idxprom63
  %63 = load double* %arrayidx68, align 8
  %64 = load i32* %j, align 4
  %idxprom69 = sext i32 %64 to i64
  %65 = load i32* %j, align 4
  %idxprom70 = sext i32 %65 to i64
  %66 = load i32** %indx.addr, align 8
  %arrayidx71 = getelementptr inbounds i32* %66, i64 %idxprom70
  %67 = load i32* %arrayidx71, align 4
  %idxprom72 = sext i32 %67 to i64
  %68 = load [3 x double]** %a.addr, align 8
  %arrayidx73 = getelementptr inbounds [3 x double]* %68, i64 %idxprom72
  %arrayidx74 = getelementptr inbounds [3 x double]* %arrayidx73, i32 0, i64 %idxprom69
  %69 = load double* %arrayidx74, align 8
  %div75 = fdiv double %63, %69
  store double %div75, double* %pj, align 8
  %70 = load double* %pj, align 8
  %71 = load i32* %j, align 4
  %idxprom76 = sext i32 %71 to i64
  %72 = load i32* %i, align 4
  %idxprom77 = sext i32 %72 to i64
  %73 = load i32** %indx.addr, align 8
  %arrayidx78 = getelementptr inbounds i32* %73, i64 %idxprom77
  %74 = load i32* %arrayidx78, align 4
  %idxprom79 = sext i32 %74 to i64
  %75 = load [3 x double]** %a.addr, align 8
  %arrayidx80 = getelementptr inbounds [3 x double]* %75, i64 %idxprom79
  %arrayidx81 = getelementptr inbounds [3 x double]* %arrayidx80, i32 0, i64 %idxprom76
  store double %70, double* %arrayidx81, align 8
  %76 = load i32* %j, align 4
  %add82 = add nsw i32 %76, 1
  store i32 %add82, i32* %k, align 4
  br label %for.cond83

for.cond83:                                       ; preds = %for.inc105, %for.body62
  %77 = load i32* %k, align 4
  %78 = load i32* %n.addr, align 4
  %cmp84 = icmp slt i32 %77, %78
  br i1 %cmp84, label %for.body85, label %for.end107

for.body85:                                       ; preds = %for.cond83
  %79 = load i32* %k, align 4
  %idxprom86 = sext i32 %79 to i64
  %80 = load i32* %i, align 4
  %idxprom87 = sext i32 %80 to i64
  %81 = load i32** %indx.addr, align 8
  %arrayidx88 = getelementptr inbounds i32* %81, i64 %idxprom87
  %82 = load i32* %arrayidx88, align 4
  %idxprom89 = sext i32 %82 to i64
  %83 = load [3 x double]** %a.addr, align 8
  %arrayidx90 = getelementptr inbounds [3 x double]* %83, i64 %idxprom89
  %arrayidx91 = getelementptr inbounds [3 x double]* %arrayidx90, i32 0, i64 %idxprom86
  %84 = load double* %arrayidx91, align 8
  %85 = load double* %pj, align 8
  %86 = load i32* %k, align 4
  %idxprom92 = sext i32 %86 to i64
  %87 = load i32* %j, align 4
  %idxprom93 = sext i32 %87 to i64
  %88 = load i32** %indx.addr, align 8
  %arrayidx94 = getelementptr inbounds i32* %88, i64 %idxprom93
  %89 = load i32* %arrayidx94, align 4
  %idxprom95 = sext i32 %89 to i64
  %90 = load [3 x double]** %a.addr, align 8
  %arrayidx96 = getelementptr inbounds [3 x double]* %90, i64 %idxprom95
  %arrayidx97 = getelementptr inbounds [3 x double]* %arrayidx96, i32 0, i64 %idxprom92
  %91 = load double* %arrayidx97, align 8
  %mul = fmul double %85, %91
  %sub98 = fsub double %84, %mul
  %92 = load i32* %k, align 4
  %idxprom99 = sext i32 %92 to i64
  %93 = load i32* %i, align 4
  %idxprom100 = sext i32 %93 to i64
  %94 = load i32** %indx.addr, align 8
  %arrayidx101 = getelementptr inbounds i32* %94, i64 %idxprom100
  %95 = load i32* %arrayidx101, align 4
  %idxprom102 = sext i32 %95 to i64
  %96 = load [3 x double]** %a.addr, align 8
  %arrayidx103 = getelementptr inbounds [3 x double]* %96, i64 %idxprom102
  %arrayidx104 = getelementptr inbounds [3 x double]* %arrayidx103, i32 0, i64 %idxprom99
  store double %sub98, double* %arrayidx104, align 8
  br label %for.inc105

for.inc105:                                       ; preds = %for.body85
  %97 = load i32* %k, align 4
  %inc106 = add nsw i32 %97, 1
  store i32 %inc106, i32* %k, align 4
  br label %for.cond83

for.end107:                                       ; preds = %for.cond83
  br label %for.inc108

for.inc108:                                       ; preds = %for.end107
  %98 = load i32* %i, align 4
  %inc109 = add nsw i32 %98, 1
  store i32 %inc109, i32* %i, align 4
  br label %for.cond60

for.end110:                                       ; preds = %for.cond60
  br label %for.inc111

for.inc111:                                       ; preds = %for.end110
  %99 = load i32* %j, align 4
  %inc112 = add nsw i32 %99, 1
  store i32 %inc112, i32* %j, align 4
  br label %for.cond29

for.end113:                                       ; preds = %for.cond29
  ret void
}

declare void @exit(i32) noreturn

declare double @fabs(double) nounwind readnone
