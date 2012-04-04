; ModuleID = '/home/david/src/c-semantics/tests/unitTests/cq-02-s241.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.defs = type { i32, i32, i32, i32, i32, i32, i32, float, float, i32, i32, i32, i32, i32, i32, [8 x i8] }

@setupTable.qs26 = internal global [8 x i8] c"s26    \00", align 1
@setupTable.s = internal global [18 x i8] c"%3d bits in %ss.\0A\00", align 16
@setupTable.s2 = internal global [54 x i8] c"%f is the least number that can be added to 1. (%s).\0A\00", align 16
@svtest.k = internal global i32 0, align 4
@zero.k = internal global i32 0, align 4
@extvar = common global i32 0, align 4
@sec.s241er = internal global [11 x i8] c"s241,er%d\0A\00", align 1
@sec.qs241 = internal global [8 x i8] c"s241   \00", align 1
@sec.g = internal global [39 x i64] [i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 6, i64 0, i64 8, i64 0, i64 12, i64 0, i64 16, i64 0, i64 18, i64 0, i64 20, i64 0, i64 24, i64 0, i64 28, i64 0, i64 30, i64 0, i64 32, i64 0, i64 36], align 16
@.str = private unnamed_addr constant [48 x i8] c"Decimal and octal/hex constants sometimes give\0A\00", align 1
@.str1 = private unnamed_addr constant [46 x i8] c"   different results when assigned to longs.\0A\00", align 1
@main.d0 = internal global %struct.defs zeroinitializer, align 4
@main.pd0 = internal global %struct.defs* null, align 8
@.str2 = private unnamed_addr constant [25 x i8] c"Section %s returned %d.\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"\0ANo errors detected.\0A\00", align 1
@.str4 = private unnamed_addr constant [10 x i8] c"\0AFailed.\0A\00", align 1

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
  %ps = alloca i8*, align 8
  %pt = alloca i8*, align 8
  %rc = alloca i32, align 4
  %j = alloca i32, align 4
  %lrc = alloca i32, align 4
  %d = alloca [39 x i64], align 16
  %o = alloca [39 x i64], align 16
  %x = alloca [39 x i64], align 16
  store %struct.defs* %pd0, %struct.defs** %pd0.addr, align 8
  store i32 0, i32* %rc, align 4
  store i32 0, i32* %lrc, align 4
  store i8* getelementptr inbounds ([8 x i8]* @sec.qs241, i32 0, i32 0), i8** %ps, align 8
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
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %while.end
  %4 = load i32* %j, align 4
  %cmp = icmp slt i32 %4, 17
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %5 = load i32* %j, align 4
  %conv = sext i32 %5 to i64
  %6 = load i32* %j, align 4
  %idxprom = sext i32 %6 to i64
  %arrayidx = getelementptr inbounds [39 x i64]* @sec.g, i32 0, i64 %idxprom
  store i64 %conv, i64* %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %7 = load i32* %j, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 18, i32* %j, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.body5, %for.end
  %8 = load i32* %j, align 4
  %cmp3 = icmp slt i32 %8, 35
  br i1 %cmp3, label %for.body5, label %for.end15

for.body5:                                        ; preds = %for.cond2
  %9 = load i32* %j, align 4
  %idxprom6 = sext i32 %9 to i64
  %arrayidx7 = getelementptr inbounds [39 x i64]* @sec.g, i32 0, i64 %idxprom6
  %10 = load i64* %arrayidx7, align 8
  %call = call i64 @pow2(i64 %10)
  %11 = load i32* %j, align 4
  %idxprom8 = sext i32 %11 to i64
  %arrayidx9 = getelementptr inbounds [39 x i64]* @sec.g, i32 0, i64 %idxprom8
  store i64 %call, i64* %arrayidx9, align 8
  %12 = load i32* %j, align 4
  %idxprom10 = sext i32 %12 to i64
  %arrayidx11 = getelementptr inbounds [39 x i64]* @sec.g, i32 0, i64 %idxprom10
  %13 = load i64* %arrayidx11, align 8
  %sub = sub nsw i64 %13, 1
  %14 = load i32* %j, align 4
  %sub12 = sub nsw i32 %14, 1
  %idxprom13 = sext i32 %sub12 to i64
  %arrayidx14 = getelementptr inbounds [39 x i64]* @sec.g, i32 0, i64 %idxprom13
  store i64 %sub, i64* %arrayidx14, align 8
  %15 = load i32* %j, align 4
  %add = add nsw i32 %15, 2
  store i32 %add, i32* %j, align 4
  br label %for.cond2

for.end15:                                        ; preds = %for.cond2
  %arrayidx16 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 0
  store i64 0, i64* %arrayidx16, align 8
  %arrayidx17 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 0
  store i64 0, i64* %arrayidx17, align 8
  %arrayidx18 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 0
  store i64 0, i64* %arrayidx18, align 8
  %arrayidx19 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 1
  store i64 1, i64* %arrayidx19, align 8
  %arrayidx20 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 1
  store i64 1, i64* %arrayidx20, align 8
  %arrayidx21 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 1
  store i64 1, i64* %arrayidx21, align 8
  %arrayidx22 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 2
  store i64 2, i64* %arrayidx22, align 8
  %arrayidx23 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 2
  store i64 2, i64* %arrayidx23, align 8
  %arrayidx24 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 2
  store i64 2, i64* %arrayidx24, align 8
  %arrayidx25 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 3
  store i64 3, i64* %arrayidx25, align 8
  %arrayidx26 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 3
  store i64 3, i64* %arrayidx26, align 8
  %arrayidx27 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 3
  store i64 3, i64* %arrayidx27, align 8
  %arrayidx28 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 4
  store i64 4, i64* %arrayidx28, align 8
  %arrayidx29 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 4
  store i64 4, i64* %arrayidx29, align 8
  %arrayidx30 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 4
  store i64 4, i64* %arrayidx30, align 8
  %arrayidx31 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 5
  store i64 5, i64* %arrayidx31, align 8
  %arrayidx32 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 5
  store i64 5, i64* %arrayidx32, align 8
  %arrayidx33 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 5
  store i64 5, i64* %arrayidx33, align 8
  %arrayidx34 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 6
  store i64 6, i64* %arrayidx34, align 8
  %arrayidx35 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 6
  store i64 6, i64* %arrayidx35, align 8
  %arrayidx36 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 6
  store i64 6, i64* %arrayidx36, align 8
  %arrayidx37 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 7
  store i64 7, i64* %arrayidx37, align 8
  %arrayidx38 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 7
  store i64 7, i64* %arrayidx38, align 8
  %arrayidx39 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 7
  store i64 7, i64* %arrayidx39, align 8
  %arrayidx40 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 8
  store i64 8, i64* %arrayidx40, align 8
  %arrayidx41 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 8
  store i64 8, i64* %arrayidx41, align 8
  %arrayidx42 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 8
  store i64 8, i64* %arrayidx42, align 8
  %arrayidx43 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 9
  store i64 9, i64* %arrayidx43, align 8
  %arrayidx44 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 9
  store i64 9, i64* %arrayidx44, align 8
  %arrayidx45 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 9
  store i64 9, i64* %arrayidx45, align 8
  %arrayidx46 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 10
  store i64 10, i64* %arrayidx46, align 8
  %arrayidx47 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 10
  store i64 10, i64* %arrayidx47, align 8
  %arrayidx48 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 10
  store i64 10, i64* %arrayidx48, align 8
  %arrayidx49 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 11
  store i64 11, i64* %arrayidx49, align 8
  %arrayidx50 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 11
  store i64 11, i64* %arrayidx50, align 8
  %arrayidx51 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 11
  store i64 11, i64* %arrayidx51, align 8
  %arrayidx52 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 12
  store i64 12, i64* %arrayidx52, align 8
  %arrayidx53 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 12
  store i64 12, i64* %arrayidx53, align 8
  %arrayidx54 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 12
  store i64 12, i64* %arrayidx54, align 8
  %arrayidx55 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 13
  store i64 13, i64* %arrayidx55, align 8
  %arrayidx56 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 13
  store i64 13, i64* %arrayidx56, align 8
  %arrayidx57 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 13
  store i64 13, i64* %arrayidx57, align 8
  %arrayidx58 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 14
  store i64 14, i64* %arrayidx58, align 8
  %arrayidx59 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 14
  store i64 14, i64* %arrayidx59, align 8
  %arrayidx60 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 14
  store i64 14, i64* %arrayidx60, align 8
  %arrayidx61 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 15
  store i64 15, i64* %arrayidx61, align 8
  %arrayidx62 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 15
  store i64 15, i64* %arrayidx62, align 8
  %arrayidx63 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 15
  store i64 15, i64* %arrayidx63, align 8
  %arrayidx64 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 16
  store i64 16, i64* %arrayidx64, align 8
  %arrayidx65 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 16
  store i64 16, i64* %arrayidx65, align 8
  %arrayidx66 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 16
  store i64 16, i64* %arrayidx66, align 8
  %arrayidx67 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 17
  store i64 63, i64* %arrayidx67, align 8
  %arrayidx68 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 17
  store i64 63, i64* %arrayidx68, align 8
  %arrayidx69 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 17
  store i64 63, i64* %arrayidx69, align 8
  %arrayidx70 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 18
  store i64 64, i64* %arrayidx70, align 8
  %arrayidx71 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 18
  store i64 64, i64* %arrayidx71, align 8
  %arrayidx72 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 18
  store i64 64, i64* %arrayidx72, align 8
  %arrayidx73 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 19
  store i64 255, i64* %arrayidx73, align 8
  %arrayidx74 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 19
  store i64 255, i64* %arrayidx74, align 8
  %arrayidx75 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 19
  store i64 255, i64* %arrayidx75, align 8
  %arrayidx76 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 20
  store i64 256, i64* %arrayidx76, align 8
  %arrayidx77 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 20
  store i64 256, i64* %arrayidx77, align 8
  %arrayidx78 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 20
  store i64 256, i64* %arrayidx78, align 8
  %arrayidx79 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 21
  store i64 4095, i64* %arrayidx79, align 8
  %arrayidx80 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 21
  store i64 4095, i64* %arrayidx80, align 8
  %arrayidx81 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 21
  store i64 4095, i64* %arrayidx81, align 8
  %arrayidx82 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 22
  store i64 4096, i64* %arrayidx82, align 8
  %arrayidx83 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 22
  store i64 4096, i64* %arrayidx83, align 8
  %arrayidx84 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 22
  store i64 4096, i64* %arrayidx84, align 8
  %arrayidx85 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 23
  store i64 65535, i64* %arrayidx85, align 8
  %arrayidx86 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 23
  store i64 65535, i64* %arrayidx86, align 8
  %arrayidx87 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 23
  store i64 65535, i64* %arrayidx87, align 8
  %arrayidx88 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 24
  store i64 65536, i64* %arrayidx88, align 8
  %arrayidx89 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 24
  store i64 65536, i64* %arrayidx89, align 8
  %arrayidx90 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 24
  store i64 65536, i64* %arrayidx90, align 8
  %arrayidx91 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 25
  store i64 262143, i64* %arrayidx91, align 8
  %arrayidx92 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 25
  store i64 262143, i64* %arrayidx92, align 8
  %arrayidx93 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 25
  store i64 262143, i64* %arrayidx93, align 8
  %arrayidx94 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 26
  store i64 262144, i64* %arrayidx94, align 8
  %arrayidx95 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 26
  store i64 262144, i64* %arrayidx95, align 8
  %arrayidx96 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 26
  store i64 262144, i64* %arrayidx96, align 8
  %arrayidx97 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 27
  store i64 1048575, i64* %arrayidx97, align 8
  %arrayidx98 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 27
  store i64 1048575, i64* %arrayidx98, align 8
  %arrayidx99 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 27
  store i64 1048575, i64* %arrayidx99, align 8
  %arrayidx100 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 28
  store i64 1048576, i64* %arrayidx100, align 8
  %arrayidx101 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 28
  store i64 1048576, i64* %arrayidx101, align 8
  %arrayidx102 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 28
  store i64 1048576, i64* %arrayidx102, align 8
  %arrayidx103 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 29
  store i64 16777215, i64* %arrayidx103, align 8
  %arrayidx104 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 29
  store i64 16777215, i64* %arrayidx104, align 8
  %arrayidx105 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 29
  store i64 16777215, i64* %arrayidx105, align 8
  %arrayidx106 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 30
  store i64 16777216, i64* %arrayidx106, align 8
  %arrayidx107 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 30
  store i64 16777216, i64* %arrayidx107, align 8
  %arrayidx108 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 30
  store i64 16777216, i64* %arrayidx108, align 8
  %arrayidx109 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 31
  store i64 268435455, i64* %arrayidx109, align 8
  %arrayidx110 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 31
  store i64 268435455, i64* %arrayidx110, align 8
  %arrayidx111 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 31
  store i64 268435455, i64* %arrayidx111, align 8
  %arrayidx112 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 32
  store i64 268435456, i64* %arrayidx112, align 8
  %arrayidx113 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 32
  store i64 268435456, i64* %arrayidx113, align 8
  %arrayidx114 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 32
  store i64 268435456, i64* %arrayidx114, align 8
  %arrayidx115 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 33
  store i64 1073741823, i64* %arrayidx115, align 8
  %arrayidx116 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 33
  store i64 1073741823, i64* %arrayidx116, align 8
  %arrayidx117 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 33
  store i64 1073741823, i64* %arrayidx117, align 8
  %arrayidx118 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 34
  store i64 1073741824, i64* %arrayidx118, align 8
  %arrayidx119 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 34
  store i64 1073741824, i64* %arrayidx119, align 8
  %arrayidx120 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 34
  store i64 1073741824, i64* %arrayidx120, align 8
  store i32 0, i32* %j, align 4
  br label %for.cond121

for.cond121:                                      ; preds = %for.inc150, %for.end15
  %16 = load i32* %j, align 4
  %cmp122 = icmp slt i32 %16, 35
  br i1 %cmp122, label %for.body124, label %for.end152

for.body124:                                      ; preds = %for.cond121
  %17 = load i32* %j, align 4
  %idxprom125 = sext i32 %17 to i64
  %arrayidx126 = getelementptr inbounds [39 x i64]* @sec.g, i32 0, i64 %idxprom125
  %18 = load i64* %arrayidx126, align 8
  %19 = load i32* %j, align 4
  %idxprom127 = sext i32 %19 to i64
  %arrayidx128 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 %idxprom127
  %20 = load i64* %arrayidx128, align 8
  %cmp129 = icmp ne i64 %18, %20
  br i1 %cmp129, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body124
  %21 = load i32* %j, align 4
  %idxprom131 = sext i32 %21 to i64
  %arrayidx132 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 %idxprom131
  %22 = load i64* %arrayidx132, align 8
  %23 = load i32* %j, align 4
  %idxprom133 = sext i32 %23 to i64
  %arrayidx134 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 %idxprom133
  %24 = load i64* %arrayidx134, align 8
  %cmp135 = icmp ne i64 %22, %24
  br i1 %cmp135, label %if.then, label %lor.lhs.false137

lor.lhs.false137:                                 ; preds = %lor.lhs.false
  %25 = load i32* %j, align 4
  %idxprom138 = sext i32 %25 to i64
  %arrayidx139 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 %idxprom138
  %26 = load i64* %arrayidx139, align 8
  %27 = load i32* %j, align 4
  %idxprom140 = sext i32 %27 to i64
  %arrayidx141 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 %idxprom140
  %28 = load i64* %arrayidx141, align 8
  %cmp142 = icmp ne i64 %26, %28
  br i1 %cmp142, label %if.then, label %if.end149

if.then:                                          ; preds = %lor.lhs.false137, %lor.lhs.false, %for.body124
  %29 = load %struct.defs** %pd0.addr, align 8
  %flgm = getelementptr inbounds %struct.defs* %29, i32 0, i32 10
  %30 = load i32* %flgm, align 4
  %cmp144 = icmp ne i32 %30, 0
  br i1 %cmp144, label %if.then146, label %if.end

if.then146:                                       ; preds = %if.then
  %call147 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([48 x i8]* @.str, i32 0, i32 0))
  %call148 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([46 x i8]* @.str1, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then146, %if.then
  br label %if.end149

if.end149:                                        ; preds = %if.end, %lor.lhs.false137
  br label %for.inc150

for.inc150:                                       ; preds = %if.end149
  %31 = load i32* %j, align 4
  %inc151 = add nsw i32 %31, 1
  store i32 %inc151, i32* %j, align 4
  br label %for.cond121

for.end152:                                       ; preds = %for.cond121
  %32 = load i32* %lrc, align 4
  %cmp153 = icmp ne i32 %32, 0
  br i1 %cmp153, label %if.then155, label %if.end156

if.then155:                                       ; preds = %for.end152
  store i32 16, i32* %rc, align 4
  br label %if.end156

if.end156:                                        ; preds = %if.then155, %for.end152
  %33 = load i32* %rc, align 4
  ret i32 %33
}

declare i32 @printf(i8*, ...)

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
  %call = call i32 @sec(%struct.defs* %0)
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
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 15, i32 0), i32 %4)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %5 = load i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 14), align 4
  %cmp2 = icmp eq i32 %5, 0
  br i1 %cmp2, label %if.then3, label %if.else

if.then3:                                         ; preds = %if.end
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0))
  br label %if.end6

if.else:                                          ; preds = %if.end
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str4, i32 0, i32 0))
  br label %if.end6

if.end6:                                          ; preds = %if.else, %if.then3
  ret i32 0
}
