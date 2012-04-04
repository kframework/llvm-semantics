; ModuleID = '/home/david/src/c-semantics/tests/unitTests/cq-10-s71.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.defs = type { i32, i32, i32, i32, i32, i32, i32, float, float, i32, i32, i32, i32, i32, i32, [8 x i8] }

@setupTable.qs26 = internal global [8 x i8] c"s26    \00", align 1
@setupTable.s = internal global [18 x i8] c"%3d bits in %ss.\0A\00", align 16
@setupTable.s2 = internal global [54 x i8] c"%f is the least number that can be added to 1. (%s).\0A\00", align 16
@svtest.k = internal global i32 0, align 4
@zero.k = internal global i32 0, align 4
@extvar = common global i32 0, align 4
@sec.s71er = internal global [10 x i8] c"s71,er%d\0A\00", align 1
@sec.qs71 = internal global [8 x i8] c"s71    \00", align 1
@sec.q = internal global i8 113, align 1
@.str = private unnamed_addr constant [6 x i8] c"queep\00", align 1
@main.d0 = internal global %struct.defs zeroinitializer, align 4
@main.pd0 = internal global %struct.defs* null, align 8
@.str1 = private unnamed_addr constant [25 x i8] c"Section %s returned %d.\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"\0ANo errors detected.\0A\00", align 1
@.str3 = private unnamed_addr constant [10 x i8] c"\0AFailed.\0A\00", align 1

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
  %rc = alloca i32, align 4
  %ps = alloca i8*, align 8
  %pt = alloca i8*, align 8
  %x = alloca [10 x i32], align 16
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %p = alloca i32*, align 8
  store %struct.defs* %pd0, %struct.defs** %pd0.addr, align 8
  %0 = load %struct.defs** %pd0.addr, align 8
  %call = call i32 (...)* bitcast (i32 (%struct.defs*)* @setupTable to i32 (...)*)(%struct.defs* %0)
  store i8* getelementptr inbounds ([8 x i8]* @sec.qs71, i32 0, i32 0), i8** %ps, align 8
  %1 = load %struct.defs** %pd0.addr, align 8
  %rfs = getelementptr inbounds %struct.defs* %1, i32 0, i32 15
  %arraydecay = getelementptr inbounds [8 x i8]* %rfs, i32 0, i32 0
  store i8* %arraydecay, i8** %pt, align 8
  store i32 0, i32* %rc, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %2 = load i8** %ps, align 8
  %incdec.ptr = getelementptr inbounds i8* %2, i32 1
  store i8* %incdec.ptr, i8** %ps, align 8
  %3 = load i8* %2, align 1
  %4 = load i8** %pt, align 8
  %incdec.ptr1 = getelementptr inbounds i8* %4, i32 1
  store i8* %incdec.ptr1, i8** %pt, align 8
  store i8 %3, i8* %4, align 1
  %tobool = icmp ne i8 %3, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %5 = load i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), align 1
  %conv = sext i8 %5 to i32
  %6 = load i8* @sec.q, align 1
  %conv2 = sext i8 %6 to i32
  %cmp = icmp ne i32 %conv, %conv2
  br i1 %cmp, label %if.then, label %if.end8

if.then:                                          ; preds = %while.end
  %7 = load i32* %rc, align 4
  %add = add nsw i32 %7, 1
  store i32 %add, i32* %rc, align 4
  %8 = load %struct.defs** %pd0.addr, align 8
  %flgd = getelementptr inbounds %struct.defs* %8, i32 0, i32 11
  %9 = load i32* %flgd, align 4
  %cmp4 = icmp ne i32 %9, 0
  br i1 %cmp4, label %if.then6, label %if.end

if.then6:                                         ; preds = %if.then
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s71er, i32 0, i32 0), i32 1)
  br label %if.end

if.end:                                           ; preds = %if.then6, %if.then
  br label %if.end8

if.end8:                                          ; preds = %if.end, %while.end
  %arrayidx = getelementptr inbounds [10 x i32]* %x, i32 0, i64 5
  store i32 1942, i32* %arrayidx, align 4
  %arrayidx9 = getelementptr inbounds [10 x i32]* %x, i32 0, i64 5
  %10 = load i32* %arrayidx9, align 4
  %cmp10 = icmp ne i32 %10, 1942
  br i1 %cmp10, label %if.then16, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end8
  %arrayidx12 = getelementptr inbounds [10 x i32]* %x, i32 0, i64 5
  %11 = load i32* %arrayidx12, align 4
  %arraydecay13 = getelementptr inbounds [10 x i32]* %x, i32 0, i32 0
  %add.ptr = getelementptr inbounds i32* %arraydecay13, i64 5
  %12 = load i32* %add.ptr, align 4
  %cmp14 = icmp ne i32 %11, %12
  br i1 %cmp14, label %if.then16, label %if.end24

if.then16:                                        ; preds = %lor.lhs.false, %if.end8
  %13 = load i32* %rc, align 4
  %add17 = add nsw i32 %13, 4
  store i32 %add17, i32* %rc, align 4
  %14 = load %struct.defs** %pd0.addr, align 8
  %flgd18 = getelementptr inbounds %struct.defs* %14, i32 0, i32 11
  %15 = load i32* %flgd18, align 4
  %cmp19 = icmp ne i32 %15, 0
  br i1 %cmp19, label %if.then21, label %if.end23

if.then21:                                        ; preds = %if.then16
  %call22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s71er, i32 0, i32 0), i32 4)
  br label %if.end23

if.end23:                                         ; preds = %if.then21, %if.then16
  br label %if.end24

if.end24:                                         ; preds = %if.end23, %lor.lhs.false
  %call25 = call i32 @McCarthy(i32 -5)
  %cmp26 = icmp ne i32 %call25, 91
  br i1 %cmp26, label %if.then28, label %if.end36

if.then28:                                        ; preds = %if.end24
  %16 = load i32* %rc, align 4
  %add29 = add nsw i32 %16, 8
  store i32 %add29, i32* %rc, align 4
  %17 = load %struct.defs** %pd0.addr, align 8
  %flgd30 = getelementptr inbounds %struct.defs* %17, i32 0, i32 11
  %18 = load i32* %flgd30, align 4
  %cmp31 = icmp ne i32 %18, 0
  br i1 %cmp31, label %if.then33, label %if.end35

if.then33:                                        ; preds = %if.then28
  %call34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s71er, i32 0, i32 0), i32 8)
  br label %if.end35

if.end35:                                         ; preds = %if.then33, %if.then28
  br label %if.end36

if.end36:                                         ; preds = %if.end35, %if.end24
  store i32 2, i32* %a, align 4
  store i32 3, i32* %b, align 4
  store i32* %b, i32** %p, align 8
  %19 = load i32* %a, align 4
  %20 = load i32** %p, align 8
  %call37 = call i32 @clobber(i32 %19, i32* %20)
  %21 = load i32* %a, align 4
  %cmp38 = icmp ne i32 %21, 2
  br i1 %cmp38, label %if.then43, label %lor.lhs.false40

lor.lhs.false40:                                  ; preds = %if.end36
  %22 = load i32* %b, align 4
  %cmp41 = icmp ne i32 %22, 2
  br i1 %cmp41, label %if.then43, label %if.end51

if.then43:                                        ; preds = %lor.lhs.false40, %if.end36
  %23 = load i32* %rc, align 4
  %add44 = add nsw i32 %23, 16
  store i32 %add44, i32* %rc, align 4
  %24 = load %struct.defs** %pd0.addr, align 8
  %flgd45 = getelementptr inbounds %struct.defs* %24, i32 0, i32 11
  %25 = load i32* %flgd45, align 4
  %cmp46 = icmp ne i32 %25, 0
  br i1 %cmp46, label %if.then48, label %if.end50

if.then48:                                        ; preds = %if.then43
  %call49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s71er, i32 0, i32 0), i32 16)
  br label %if.end50

if.end50:                                         ; preds = %if.then48, %if.then43
  br label %if.end51

if.end51:                                         ; preds = %if.end50, %lor.lhs.false40
  %26 = load %struct.defs** %pd0.addr, align 8
  %dprec = getelementptr inbounds %struct.defs* %26, i32 0, i32 8
  %27 = load float* %dprec, align 4
  %28 = load %struct.defs** %pd0.addr, align 8
  %dprec52 = getelementptr inbounds %struct.defs* %28, i32 0, i32 8
  %29 = load float* %dprec52, align 4
  %cmp53 = fcmp une float %27, %29
  br i1 %cmp53, label %if.then55, label %if.end63

if.then55:                                        ; preds = %if.end51
  %30 = load i32* %rc, align 4
  %add56 = add nsw i32 %30, 32
  store i32 %add56, i32* %rc, align 4
  %31 = load %struct.defs** %pd0.addr, align 8
  %flgd57 = getelementptr inbounds %struct.defs* %31, i32 0, i32 11
  %32 = load i32* %flgd57, align 4
  %cmp58 = icmp ne i32 %32, 0
  br i1 %cmp58, label %if.then60, label %if.end62

if.then60:                                        ; preds = %if.then55
  %call61 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s71er, i32 0, i32 0), i32 32)
  br label %if.end62

if.end62:                                         ; preds = %if.then60, %if.then55
  br label %if.end63

if.end63:                                         ; preds = %if.end62, %if.end51
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
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 15, i32 0), i32 %4)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %5 = load i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 14), align 4
  %cmp2 = icmp eq i32 %5, 0
  br i1 %cmp2, label %if.then3, label %if.else

if.then3:                                         ; preds = %if.end
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0))
  br label %if.end6

if.else:                                          ; preds = %if.end
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str3, i32 0, i32 0))
  br label %if.end6

if.end6:                                          ; preds = %if.else, %if.then3
  ret i32 0
}
