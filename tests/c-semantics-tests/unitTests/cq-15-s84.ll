; ModuleID = '/home/david/src/c-semantics/tests/unitTests/cq-15-s84.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.defs = type { i32, i32, i32, i32, i32, i32, i32, float, float, i32, i32, i32, i32, i32, i32, [8 x i8] }

@setupTable.qs26 = internal global [8 x i8] c"s26    \00", align 1
@setupTable.s = internal global [18 x i8] c"%3d bits in %ss.\0A\00", align 16
@setupTable.s2 = internal global [54 x i8] c"%f is the least number that can be added to 1. (%s).\0A\00", align 16
@svtest.k = internal global i32 0, align 4
@zero.k = internal global i32 0, align 4
@extvar = common global i32 0, align 4
@sec.x3d = internal global [3 x [5 x [7 x i32]]] zeroinitializer, align 16
@sec.s84er = internal global [10 x i8] c"s84,er%d\0A\00", align 1
@sec.qs84 = internal global [8 x i8] c"s84    \00", align 1
@fip.y = internal global i32 0, align 4
@main.d0 = internal global %struct.defs zeroinitializer, align 4
@main.pd0 = internal global %struct.defs* null, align 8
@.str = private unnamed_addr constant [25 x i8] c"Section %s returned %d.\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"\0ANo errors detected.\0A\00", align 1
@.str2 = private unnamed_addr constant [10 x i8] c"\0AFailed.\0A\00", align 1

define i64 @pow2(i64 %n) nounwind uwtable {
entry:
  %n.addr = alloca i64, align 8
  %s = alloca i64, align 8
  store i64 %n, i64* %n.addr, align 8
  store i64 1, i64* %s, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i64* %n.addr, align 8
  %dec = add nsw i64 %0, -1
  store i64 %dec, i64* %n.addr, align 8
  %tobool = icmp ne i64 %0, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i64* %s, align 8
  %mul = mul nsw i64 %1, 2
  store i64 %mul, i64* %s, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %2 = load i64* %s, align 8
  ret i64 %2
}

define void @zerofill(i8* %x) nounwind uwtable {
entry:
  %x.addr = alloca i8*, align 8
  %j = alloca i32, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %j, align 4
  %cmp = icmp slt i32 %0, 256
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i8** %x.addr, align 8
  %incdec.ptr = getelementptr inbounds i8* %1, i32 1
  store i8* %incdec.ptr, i8** %x.addr, align 8
  store i8 0, i8* %1, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %2 = load i32* %j, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

define i32 @sumof(i8* %x) nounwind uwtable {
entry:
  %x.addr = alloca i8*, align 8
  %p = alloca i8*, align 8
  %total = alloca i32, align 4
  %j = alloca i32, align 4
  store i8* %x, i8** %x.addr, align 8
  %0 = load i8** %x.addr, align 8
  store i8* %0, i8** %p, align 8
  store i32 0, i32* %total, align 4
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32* %j, align 4
  %cmp = icmp slt i32 %1, 256
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32* %total, align 4
  %3 = load i8** %p, align 8
  %incdec.ptr = getelementptr inbounds i8* %3, i32 1
  store i8* %incdec.ptr, i8** %p, align 8
  %4 = load i8* %3, align 1
  %conv = sext i8 %4 to i32
  %add = add nsw i32 %2, %conv
  store i32 %add, i32* %total, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32* %j, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %6 = load i32* %total, align 4
  ret i32 %6
}

define i32 @setupTable(%struct.defs* %pd0) nounwind uwtable {
entry:
  %pd0.addr = alloca %struct.defs*, align 8
  %ps = alloca i8*, align 8
  %pt = alloca i8*, align 8
  %c0 = alloca i8, align 1
  %c1 = alloca i8, align 1
  %temp = alloca float, align 4
  %one = alloca float, align 4
  %delta = alloca float, align 4
  %tempd = alloca double, align 8
  %oned = alloca double, align 8
  store %struct.defs* %pd0, %struct.defs** %pd0.addr, align 8
  store i8* getelementptr inbounds ([8 x i8]* @setupTable.qs26, i32 0, i32 0), i8** %ps, align 8
  %0 = load %struct.defs** %pd0.addr, align 8
  %rfs = getelementptr inbounds %struct.defs* %0, i32 0, i32 15
  %arraydecay = getelementptr inbounds [8 x i8]* %rfs, i32 0, i32 0
  store i8* %arraydecay, i8** %pt, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %1 = load i8** %ps, align 8
  %incdec.ptr = getelementptr inbounds i8* %1, i32 1
  store i8* %incdec.ptr, i8** %ps, align 8
  %2 = load i8* %1, align 1
  %3 = load i8** %pt, align 8
  %incdec.ptr1 = getelementptr inbounds i8* %3, i32 1
  store i8* %incdec.ptr1, i8** %pt, align 8
  store i8 %2, i8* %3, align 1
  %tobool = icmp ne i8 %2, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %4 = load %struct.defs** %pd0.addr, align 8
  %cbits = getelementptr inbounds %struct.defs* %4, i32 0, i32 0
  store i32 0, i32* %cbits, align 4
  store i8 0, i8* %c0, align 1
  store i8 1, i8* %c1, align 1
  br label %while.cond2

while.cond2:                                      ; preds = %while.body5, %while.end
  %5 = load i8* %c0, align 1
  %conv = zext i8 %5 to i32
  %6 = load i8* %c1, align 1
  %conv3 = zext i8 %6 to i32
  %cmp = icmp ne i32 %conv, %conv3
  br i1 %cmp, label %while.body5, label %while.end10

while.body5:                                      ; preds = %while.cond2
  %7 = load i8* %c1, align 1
  %conv6 = zext i8 %7 to i32
  %shl = shl i32 %conv6, 1
  %conv7 = trunc i32 %shl to i8
  store i8 %conv7, i8* %c1, align 1
  %8 = load %struct.defs** %pd0.addr, align 8
  %cbits8 = getelementptr inbounds %struct.defs* %8, i32 0, i32 0
  %9 = load i32* %cbits8, align 4
  %add = add nsw i32 %9, 1
  %10 = load %struct.defs** %pd0.addr, align 8
  %cbits9 = getelementptr inbounds %struct.defs* %10, i32 0, i32 0
  store i32 %add, i32* %cbits9, align 4
  br label %while.cond2

while.end10:                                      ; preds = %while.cond2
  %11 = load %struct.defs** %pd0.addr, align 8
  %cbits11 = getelementptr inbounds %struct.defs* %11, i32 0, i32 0
  %12 = load i32* %cbits11, align 4
  %conv12 = sext i32 %12 to i64
  %mul = mul i64 %conv12, 4
  %conv13 = trunc i64 %mul to i32
  %13 = load %struct.defs** %pd0.addr, align 8
  %ibits = getelementptr inbounds %struct.defs* %13, i32 0, i32 1
  store i32 %conv13, i32* %ibits, align 4
  %14 = load %struct.defs** %pd0.addr, align 8
  %cbits14 = getelementptr inbounds %struct.defs* %14, i32 0, i32 0
  %15 = load i32* %cbits14, align 4
  %conv15 = sext i32 %15 to i64
  %mul16 = mul i64 %conv15, 2
  %conv17 = trunc i64 %mul16 to i32
  %16 = load %struct.defs** %pd0.addr, align 8
  %sbits = getelementptr inbounds %struct.defs* %16, i32 0, i32 2
  store i32 %conv17, i32* %sbits, align 4
  %17 = load %struct.defs** %pd0.addr, align 8
  %cbits18 = getelementptr inbounds %struct.defs* %17, i32 0, i32 0
  %18 = load i32* %cbits18, align 4
  %conv19 = sext i32 %18 to i64
  %mul20 = mul i64 %conv19, 8
  %conv21 = trunc i64 %mul20 to i32
  %19 = load %struct.defs** %pd0.addr, align 8
  %lbits = getelementptr inbounds %struct.defs* %19, i32 0, i32 3
  store i32 %conv21, i32* %lbits, align 4
  %20 = load %struct.defs** %pd0.addr, align 8
  %cbits22 = getelementptr inbounds %struct.defs* %20, i32 0, i32 0
  %21 = load i32* %cbits22, align 4
  %conv23 = sext i32 %21 to i64
  %mul24 = mul i64 %conv23, 4
  %conv25 = trunc i64 %mul24 to i32
  %22 = load %struct.defs** %pd0.addr, align 8
  %ubits = getelementptr inbounds %struct.defs* %22, i32 0, i32 4
  store i32 %conv25, i32* %ubits, align 4
  %23 = load %struct.defs** %pd0.addr, align 8
  %cbits26 = getelementptr inbounds %struct.defs* %23, i32 0, i32 0
  %24 = load i32* %cbits26, align 4
  %conv27 = sext i32 %24 to i64
  %mul28 = mul i64 %conv27, 4
  %conv29 = trunc i64 %mul28 to i32
  %25 = load %struct.defs** %pd0.addr, align 8
  %fbits = getelementptr inbounds %struct.defs* %25, i32 0, i32 5
  store i32 %conv29, i32* %fbits, align 4
  %26 = load %struct.defs** %pd0.addr, align 8
  %cbits30 = getelementptr inbounds %struct.defs* %26, i32 0, i32 0
  %27 = load i32* %cbits30, align 4
  %conv31 = sext i32 %27 to i64
  %mul32 = mul i64 %conv31, 8
  %conv33 = trunc i64 %mul32 to i32
  %28 = load %struct.defs** %pd0.addr, align 8
  %dbits = getelementptr inbounds %struct.defs* %28, i32 0, i32 6
  store i32 %conv33, i32* %dbits, align 4
  store float 1.000000e+00, float* %one, align 4
  store float 1.000000e+00, float* %delta, align 4
  store float 0.000000e+00, float* %temp, align 4
  br label %while.cond34

while.cond34:                                     ; preds = %while.body37, %while.end10
  %29 = load float* %temp, align 4
  %30 = load float* %one, align 4
  %cmp35 = fcmp une float %29, %30
  br i1 %cmp35, label %while.body37, label %while.end41

while.body37:                                     ; preds = %while.cond34
  %31 = load float* %one, align 4
  %32 = load float* %delta, align 4
  %add38 = fadd float %31, %32
  store float %add38, float* %temp, align 4
  %33 = load float* %delta, align 4
  %conv39 = fpext float %33 to double
  %div = fdiv double %conv39, 2.000000e+00
  %conv40 = fptrunc double %div to float
  store float %conv40, float* %delta, align 4
  br label %while.cond34

while.end41:                                      ; preds = %while.cond34
  %34 = load float* %delta, align 4
  %conv42 = fpext float %34 to double
  %mul43 = fmul double %conv42, 4.000000e+00
  %conv44 = fptrunc double %mul43 to float
  %35 = load %struct.defs** %pd0.addr, align 8
  %fprec = getelementptr inbounds %struct.defs* %35, i32 0, i32 7
  store float %conv44, float* %fprec, align 4
  store double 1.000000e+00, double* %oned, align 8
  store float 1.000000e+00, float* %delta, align 4
  store double 0.000000e+00, double* %tempd, align 8
  br label %while.cond45

while.cond45:                                     ; preds = %while.body48, %while.end41
  %36 = load double* %tempd, align 8
  %37 = load double* %oned, align 8
  %cmp46 = fcmp une double %36, %37
  br i1 %cmp46, label %while.body48, label %while.end54

while.body48:                                     ; preds = %while.cond45
  %38 = load double* %oned, align 8
  %39 = load float* %delta, align 4
  %conv49 = fpext float %39 to double
  %add50 = fadd double %38, %conv49
  store double %add50, double* %tempd, align 8
  %40 = load float* %delta, align 4
  %conv51 = fpext float %40 to double
  %div52 = fdiv double %conv51, 2.000000e+00
  %conv53 = fptrunc double %div52 to float
  store float %conv53, float* %delta, align 4
  br label %while.cond45

while.end54:                                      ; preds = %while.cond45
  %41 = load float* %delta, align 4
  %conv55 = fpext float %41 to double
  %mul56 = fmul double %conv55, 4.000000e+00
  %conv57 = fptrunc double %mul56 to float
  %42 = load %struct.defs** %pd0.addr, align 8
  %dprec = getelementptr inbounds %struct.defs* %42, i32 0, i32 8
  store float %conv57, float* %dprec, align 4
  ret i32 0
}

define i32 @svtest(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  %rc = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %0 = load i32* %n.addr, align 4
  switch i32 %0, label %sw.epilog [
    i32 0, label %sw.bb
    i32 1, label %sw.bb1
    i32 2, label %sw.bb2
  ]

sw.bb:                                            ; preds = %entry
  store i32 1978, i32* @svtest.k, align 4
  store i32 0, i32* %rc, align 4
  br label %sw.epilog

sw.bb1:                                           ; preds = %entry
  %1 = load i32* @svtest.k, align 4
  %cmp = icmp ne i32 %1, 1978
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %sw.bb1
  store i32 1, i32* %rc, align 4
  br label %if.end

if.else:                                          ; preds = %sw.bb1
  store i32 1929, i32* @svtest.k, align 4
  store i32 0, i32* %rc, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %sw.epilog

sw.bb2:                                           ; preds = %entry
  %2 = load i32* @svtest.k, align 4
  %cmp3 = icmp ne i32 %2, 1929
  br i1 %cmp3, label %if.then4, label %if.else5

if.then4:                                         ; preds = %sw.bb2
  store i32 1, i32* %rc, align 4
  br label %if.end6

if.else5:                                         ; preds = %sw.bb2
  store i32 0, i32* %rc, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  br label %sw.epilog

sw.epilog:                                        ; preds = %entry, %if.end6, %if.end, %sw.bb
  %3 = load i32* %rc, align 4
  ret i32 %3
}

define i32 @zero() nounwind uwtable {
entry:
  %rc = alloca i32, align 4
  store i32 2, i32* @zero.k, align 4
  store i32 0, i32* %rc, align 4
  %0 = load i32* %rc, align 4
  ret i32 %0
}

define i32 @testev() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %0 = load i32* @extvar, align 4
  %cmp = icmp ne i32 %0, 1066
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %1 = load i32* %retval
  ret i32 %1
}

define void @setev() nounwind uwtable {
entry:
  store i32 1066, i32* @extvar, align 4
  ret void
}

define i32 @McCarthy(i32 %x) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %cmp = icmp sgt i32 %0, 100
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32* %x.addr, align 4
  %sub = sub nsw i32 %1, 10
  store i32 %sub, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  %2 = load i32* %x.addr, align 4
  %add = add nsw i32 %2, 11
  %call = call i32 (...)* bitcast (i32 (i32)* @McCarthy to i32 (...)*)(i32 %add)
  %call1 = call i32 (...)* bitcast (i32 (i32)* @McCarthy to i32 (...)*)(i32 %call)
  store i32 %call1, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %3 = load i32* %retval
  ret i32 %3
}

define i32 @clobber(i32 %x, i32* %y) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32*, align 8
  store i32 %x, i32* %x.addr, align 4
  store i32* %y, i32** %y.addr, align 8
  store i32 3, i32* %x.addr, align 4
  %0 = load i32** %y.addr, align 8
  store i32 2, i32* %0, align 4
  ret i32 0
}

define i32 @sec(%struct.defs* %pd0) nounwind uwtable {
entry:
  %pd0.addr = alloca %struct.defs*, align 8
  %ip = alloca i32*, align 8
  %i = alloca i32, align 4
  %pfi = alloca i32 (...)*, align 8
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %fa = alloca [17 x float], align 16
  %afp = alloca [17 x float*], align 16
  %sum = alloca float, align 4
  %rc = alloca i32, align 4
  %ps = alloca i8*, align 8
  %pt = alloca i8*, align 8
  store %struct.defs* %pd0, %struct.defs** %pd0.addr, align 8
  store i8* getelementptr inbounds ([8 x i8]* @sec.qs84, i32 0, i32 0), i8** %ps, align 8
  %0 = load %struct.defs** %pd0.addr, align 8
  %rfs = getelementptr inbounds %struct.defs* %0, i32 0, i32 15
  %arraydecay = getelementptr inbounds [8 x i8]* %rfs, i32 0, i32 0
  store i8* %arraydecay, i8** %pt, align 8
  store i32 0, i32* %rc, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %1 = load i8** %ps, align 8
  %incdec.ptr = getelementptr inbounds i8* %1, i32 1
  store i8* %incdec.ptr, i8** %ps, align 8
  %2 = load i8* %1, align 1
  %3 = load i8** %pt, align 8
  %incdec.ptr1 = getelementptr inbounds i8* %3, i32 1
  store i8* %incdec.ptr1, i8** %pt, align 8
  store i8 %2, i8* %3, align 1
  %tobool = icmp ne i8 %2, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %call = call i32* (...)* bitcast (i32* (i32)* @fip to i32* (...)*)(i32 3)
  store i32* %call, i32** %ip, align 8
  %4 = load i32** %ip, align 8
  %5 = load i32* %4, align 4
  %cmp = icmp ne i32 %5, 3
  br i1 %cmp, label %if.then, label %if.end5

if.then:                                          ; preds = %while.end
  %6 = load %struct.defs** %pd0.addr, align 8
  %flgd = getelementptr inbounds %struct.defs* %6, i32 0, i32 11
  %7 = load i32* %flgd, align 4
  %cmp2 = icmp ne i32 %7, 0
  br i1 %cmp2, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s84er, i32 0, i32 0), i32 1)
  br label %if.end

if.end:                                           ; preds = %if.then3, %if.then
  %8 = load i32* %rc, align 4
  %add = add nsw i32 %8, 1
  store i32 %add, i32* %rc, align 4
  br label %if.end5

if.end5:                                          ; preds = %if.end, %while.end
  store i32 (...)* bitcast (i32 (i32)* @glork to i32 (...)*), i32 (...)** %pfi, align 8
  %9 = load i32 (...)** %pfi, align 8
  %call6 = call i32 (...)* %9(i32 4)
  %cmp7 = icmp ne i32 %call6, 4
  br i1 %cmp7, label %if.then8, label %if.end15

if.then8:                                         ; preds = %if.end5
  %10 = load %struct.defs** %pd0.addr, align 8
  %flgd9 = getelementptr inbounds %struct.defs* %10, i32 0, i32 11
  %11 = load i32* %flgd9, align 4
  %cmp10 = icmp ne i32 %11, 0
  br i1 %cmp10, label %if.then11, label %if.end13

if.then11:                                        ; preds = %if.then8
  %call12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s84er, i32 0, i32 0), i32 2)
  br label %if.end13

if.end13:                                         ; preds = %if.then11, %if.then8
  %12 = load i32* %rc, align 4
  %add14 = add nsw i32 %12, 2
  store i32 %add14, i32* %rc, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.end13, %if.end5
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end15
  %13 = load i32* %j, align 4
  %cmp16 = icmp slt i32 %13, 17
  br i1 %cmp16, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %14 = load i32* %j, align 4
  %conv = sitofp i32 %14 to float
  %15 = load i32* %j, align 4
  %idxprom = sext i32 %15 to i64
  %arrayidx = getelementptr inbounds [17 x float]* %fa, i32 0, i64 %idxprom
  store float %conv, float* %arrayidx, align 4
  %16 = load i32* %j, align 4
  %idxprom17 = sext i32 %16 to i64
  %arrayidx18 = getelementptr inbounds [17 x float]* %fa, i32 0, i64 %idxprom17
  %17 = load i32* %j, align 4
  %idxprom19 = sext i32 %17 to i64
  %arrayidx20 = getelementptr inbounds [17 x float*]* %afp, i32 0, i64 %idxprom19
  store float* %arrayidx18, float** %arrayidx20, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %18 = load i32* %j, align 4
  %inc = add nsw i32 %18, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store float 0.000000e+00, float* %sum, align 4
  store i32 0, i32* %j, align 4
  br label %for.cond21

for.cond21:                                       ; preds = %for.inc28, %for.end
  %19 = load i32* %j, align 4
  %cmp22 = icmp slt i32 %19, 17
  br i1 %cmp22, label %for.body24, label %for.end30

for.body24:                                       ; preds = %for.cond21
  %20 = load i32* %j, align 4
  %idxprom25 = sext i32 %20 to i64
  %arrayidx26 = getelementptr inbounds [17 x float*]* %afp, i32 0, i64 %idxprom25
  %21 = load float** %arrayidx26, align 8
  %22 = load float* %21, align 4
  %23 = load float* %sum, align 4
  %add27 = fadd float %23, %22
  store float %add27, float* %sum, align 4
  br label %for.inc28

for.inc28:                                        ; preds = %for.body24
  %24 = load i32* %j, align 4
  %inc29 = add nsw i32 %24, 1
  store i32 %inc29, i32* %j, align 4
  br label %for.cond21

for.end30:                                        ; preds = %for.cond21
  %25 = load float* %sum, align 4
  %cmp31 = fcmp une float %25, 1.360000e+02
  br i1 %cmp31, label %if.then33, label %if.end41

if.then33:                                        ; preds = %for.end30
  %26 = load %struct.defs** %pd0.addr, align 8
  %flgd34 = getelementptr inbounds %struct.defs* %26, i32 0, i32 11
  %27 = load i32* %flgd34, align 4
  %cmp35 = icmp ne i32 %27, 0
  br i1 %cmp35, label %if.then37, label %if.end39

if.then37:                                        ; preds = %if.then33
  %call38 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s84er, i32 0, i32 0), i32 4)
  br label %if.end39

if.end39:                                         ; preds = %if.then37, %if.then33
  %28 = load i32* %rc, align 4
  %add40 = add nsw i32 %28, 4
  store i32 %add40, i32* %rc, align 4
  br label %if.end41

if.end41:                                         ; preds = %if.end39, %for.end30
  store i32 0, i32* %i, align 4
  br label %for.cond42

for.cond42:                                       ; preds = %for.inc69, %if.end41
  %29 = load i32* %i, align 4
  %cmp43 = icmp slt i32 %29, 3
  br i1 %cmp43, label %for.body45, label %for.end71

for.body45:                                       ; preds = %for.cond42
  store i32 0, i32* %j, align 4
  br label %for.cond46

for.cond46:                                       ; preds = %for.inc66, %for.body45
  %30 = load i32* %j, align 4
  %cmp47 = icmp slt i32 %30, 5
  br i1 %cmp47, label %for.body49, label %for.end68

for.body49:                                       ; preds = %for.cond46
  store i32 0, i32* %k, align 4
  br label %for.cond50

for.cond50:                                       ; preds = %for.inc63, %for.body49
  %31 = load i32* %k, align 4
  %cmp51 = icmp slt i32 %31, 7
  br i1 %cmp51, label %for.body53, label %for.end65

for.body53:                                       ; preds = %for.cond50
  %32 = load i32* %i, align 4
  %mul = mul nsw i32 %32, 35
  %33 = load i32* %j, align 4
  %mul54 = mul nsw i32 %33, 7
  %add55 = add nsw i32 %mul, %mul54
  %34 = load i32* %k, align 4
  %add56 = add nsw i32 %add55, %34
  %35 = load i32* %k, align 4
  %idxprom57 = sext i32 %35 to i64
  %36 = load i32* %j, align 4
  %idxprom58 = sext i32 %36 to i64
  %37 = load i32* %i, align 4
  %idxprom59 = sext i32 %37 to i64
  %arrayidx60 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i32 0, i64 %idxprom59
  %arrayidx61 = getelementptr inbounds [5 x [7 x i32]]* %arrayidx60, i32 0, i64 %idxprom58
  %arrayidx62 = getelementptr inbounds [7 x i32]* %arrayidx61, i32 0, i64 %idxprom57
  store i32 %add56, i32* %arrayidx62, align 4
  br label %for.inc63

for.inc63:                                        ; preds = %for.body53
  %38 = load i32* %k, align 4
  %inc64 = add nsw i32 %38, 1
  store i32 %inc64, i32* %k, align 4
  br label %for.cond50

for.end65:                                        ; preds = %for.cond50
  br label %for.inc66

for.inc66:                                        ; preds = %for.end65
  %39 = load i32* %j, align 4
  %inc67 = add nsw i32 %39, 1
  store i32 %inc67, i32* %j, align 4
  br label %for.cond46

for.end68:                                        ; preds = %for.cond46
  br label %for.inc69

for.inc69:                                        ; preds = %for.end68
  %40 = load i32* %i, align 4
  %inc70 = add nsw i32 %40, 1
  store i32 %inc70, i32* %i, align 4
  br label %for.cond42

for.end71:                                        ; preds = %for.cond42
  store i32 1, i32* %i, align 4
  store i32 2, i32* %j, align 4
  store i32 3, i32* %k, align 4
  %call72 = call i32 (...)* bitcast (i32 (i32*, i32, i32)* @array to i32 (...)*)([5 x [7 x i32]]* getelementptr inbounds ([3 x [5 x [7 x i32]]]* @sec.x3d, i32 0, i32 0), i32 105, i32 0)
  %41 = load i32* %i, align 4
  %idxprom73 = sext i32 %41 to i64
  %arrayidx74 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i32 0, i64 %idxprom73
  %arraydecay75 = getelementptr inbounds [5 x [7 x i32]]* %arrayidx74, i32 0, i32 0
  %call76 = call i32 (...)* bitcast (i32 (i32*, i32, i32)* @array to i32 (...)*)([7 x i32]* %arraydecay75, i32 35, i32 35)
  %add77 = add nsw i32 %call72, %call76
  %42 = load i32* %j, align 4
  %idxprom78 = sext i32 %42 to i64
  %43 = load i32* %i, align 4
  %idxprom79 = sext i32 %43 to i64
  %arrayidx80 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i32 0, i64 %idxprom79
  %arrayidx81 = getelementptr inbounds [5 x [7 x i32]]* %arrayidx80, i32 0, i64 %idxprom78
  %arraydecay82 = getelementptr inbounds [7 x i32]* %arrayidx81, i32 0, i32 0
  %call83 = call i32 (...)* bitcast (i32 (i32*, i32, i32)* @array to i32 (...)*)(i32* %arraydecay82, i32 7, i32 49)
  %add84 = add nsw i32 %add77, %call83
  %44 = load i32* %k, align 4
  %idxprom85 = sext i32 %44 to i64
  %45 = load i32* %j, align 4
  %idxprom86 = sext i32 %45 to i64
  %46 = load i32* %i, align 4
  %idxprom87 = sext i32 %46 to i64
  %arrayidx88 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i32 0, i64 %idxprom87
  %arrayidx89 = getelementptr inbounds [5 x [7 x i32]]* %arrayidx88, i32 0, i64 %idxprom86
  %arrayidx90 = getelementptr inbounds [7 x i32]* %arrayidx89, i32 0, i64 %idxprom85
  %47 = load i32* %arrayidx90, align 4
  %add91 = add nsw i32 %add84, %47
  %sub = sub nsw i32 %add91, 52
  %tobool92 = icmp ne i32 %sub, 0
  br i1 %tobool92, label %if.then93, label %if.end101

if.then93:                                        ; preds = %for.end71
  %48 = load %struct.defs** %pd0.addr, align 8
  %flgd94 = getelementptr inbounds %struct.defs* %48, i32 0, i32 11
  %49 = load i32* %flgd94, align 4
  %cmp95 = icmp ne i32 %49, 0
  br i1 %cmp95, label %if.then97, label %if.end99

if.then97:                                        ; preds = %if.then93
  %call98 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s84er, i32 0, i32 0), i32 8)
  br label %if.end99

if.end99:                                         ; preds = %if.then97, %if.then93
  %50 = load i32* %rc, align 4
  %add100 = add nsw i32 %50, 8
  store i32 %add100, i32* %rc, align 4
  br label %if.end101

if.end101:                                        ; preds = %if.end99, %for.end71
  %51 = load i32* %rc, align 4
  ret i32 %51
}

declare i32 @printf(i8*, ...)

define i32 @glork(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  ret i32 %0
}

define i32 @array(i32* %a, i32 %size, i32 %start) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32*, align 8
  %size.addr = alloca i32, align 4
  %start.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %a, i32** %a.addr, align 8
  store i32 %size, i32* %size.addr, align 4
  store i32 %start, i32* %start.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %1 = load i32* %size.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %3 = load i32** %a.addr, align 8
  %arrayidx = getelementptr inbounds i32* %3, i64 %idxprom
  %4 = load i32* %arrayidx, align 4
  %5 = load i32* %i, align 4
  %6 = load i32* %start.addr, align 4
  %add = add nsw i32 %5, %6
  %cmp1 = icmp ne i32 %4, %add
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %7 = load i32* %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %for.end, %if.then
  %8 = load i32* %retval
  ret i32 %8
}

define i32* @fip(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  store i32 %0, i32* @fip.y, align 4
  ret i32* @fip.y
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 1, i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 9), align 4
  store i32 1, i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 10), align 4
  store i32 1, i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 11), align 4
  store i32 1, i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 12), align 4
  store %struct.defs* @main.d0, %struct.defs** @main.pd0, align 8
  %0 = load %struct.defs** @main.pd0, align 8
  %call = call i32 (...)* bitcast (i32 (%struct.defs*)* @sec to i32 (...)*)(%struct.defs* %0)
  store i32 %call, i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 13), align 4
  %1 = load i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 14), align 4
  %2 = load i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 13), align 4
  %add = add nsw i32 %1, %2
  store i32 %add, i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 14), align 4
  %3 = load i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 9), align 4
  %cmp = icmp ne i32 %3, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 13), align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 15, i32 0), i32 %4)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %5 = load i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 14), align 4
  %cmp2 = icmp eq i32 %5, 0
  br i1 %cmp2, label %if.then3, label %if.else

if.then3:                                         ; preds = %if.end
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0))
  br label %if.end6

if.else:                                          ; preds = %if.end
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0))
  br label %if.end6

if.end6:                                          ; preds = %if.else, %if.then3
  ret i32 0
}
