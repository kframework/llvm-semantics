; ModuleID = '/home/david/src/c-semantics/tests/unitTests/cq-12-s72.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.defs = type { i32, i32, i32, i32, i32, i32, i32, float, float, i32, i32, i32, i32, i32, i32, [8 x i8] }

@setupTable.qs26 = internal global [8 x i8] c"s26    \00", align 1
@setupTable.s = internal global [18 x i8] c"%3d bits in %ss.\0A\00", align 16
@setupTable.s2 = internal global [54 x i8] c"%f is the least number that can be added to 1. (%s).\0A\00", align 16
@svtest.k = internal global i32 0, align 4
@zero.k = internal global i32 0, align 4
@extvar = common global i32 0, align 4
@sec.s72er = internal global [10 x i8] c"s72,er%d\0A\00", align 1
@sec.qs72 = internal global [8 x i8] c"s72    \00", align 1
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
  %rc = alloca i32, align 4
  %ps = alloca i8*, align 8
  %pt = alloca i8*, align 8
  %k = alloca i32, align 4
  %j = alloca i32, align 4
  %i = alloca i32, align 4
  %lrc = alloca i32, align 4
  %c = alloca i8, align 1
  %s = alloca i16, align 2
  %l = alloca i64, align 8
  %u = alloca i32, align 4
  %d = alloca double, align 8
  %f = alloca float, align 4
  store %struct.defs* %pd0, %struct.defs** %pd0.addr, align 8
  %0 = load %struct.defs** %pd0.addr, align 8
  %call = call i32 (...)* bitcast (i32 (%struct.defs*)* @setupTable to i32 (...)*)(%struct.defs* %0)
  store i8* getelementptr inbounds ([8 x i8]* @sec.qs72, i32 0, i32 0), i8** %ps, align 8
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
  store i32 2, i32* %k, align 4
  %5 = load i32* %k, align 4
  %cmp = icmp ne i32 %5, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %while.end
  %6 = load i32* %rc, align 4
  %add = add nsw i32 %6, 1
  store i32 %add, i32* %rc, align 4
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s72er, i32 0, i32 0), i32 1)
  br label %if.end

if.end:                                           ; preds = %if.then, %while.end
  %7 = load i32* %k, align 4
  %8 = load i32* %k, align 4
  %sub = sub nsw i32 0, %8
  %add3 = add nsw i32 %7, %sub
  %cmp4 = icmp ne i32 %add3, 0
  br i1 %cmp4, label %if.then5, label %if.end8

if.then5:                                         ; preds = %if.end
  %9 = load i32* %rc, align 4
  %add6 = add nsw i32 %9, 2
  store i32 %add6, i32* %rc, align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s72er, i32 0, i32 0), i32 2)
  br label %if.end8

if.end8:                                          ; preds = %if.then5, %if.end
  store i32 0, i32* %k, align 4
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end8
  %10 = load i32* %j, align 4
  %11 = load %struct.defs** %pd0.addr, align 8
  %ibits = getelementptr inbounds %struct.defs* %11, i32 0, i32 1
  %12 = load i32* %ibits, align 4
  %sub9 = sub nsw i32 %12, 1
  %cmp10 = icmp slt i32 %10, %sub9
  br i1 %cmp10, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %13 = load i32* %k, align 4
  %shl = shl i32 %13, 1
  %or = or i32 %shl, 1
  store i32 %or, i32* %k, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %14 = load i32* %j, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %15 = load i32* %k, align 4
  %neg = xor i32 %15, -1
  %16 = load i32* %k, align 4
  %add11 = add nsw i32 %neg, %16
  %cmp12 = icmp ne i32 %add11, -1
  br i1 %cmp12, label %if.then13, label %if.end16

if.then13:                                        ; preds = %for.end
  %17 = load i32* %rc, align 4
  %add14 = add nsw i32 %17, 4
  store i32 %add14, i32* %rc, align 4
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s72er, i32 0, i32 0), i32 4)
  br label %if.end16

if.end16:                                         ; preds = %if.then13, %for.end
  store i32 5, i32* %k, align 4
  %18 = load i32* %k, align 4
  %inc17 = add nsw i32 %18, 1
  store i32 %inc17, i32* %k, align 4
  %cmp18 = icmp ne i32 %inc17, 6
  br i1 %cmp18, label %if.then28, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end16
  %19 = load i32* %k, align 4
  %dec = add nsw i32 %19, -1
  store i32 %dec, i32* %k, align 4
  %cmp19 = icmp ne i32 %dec, 5
  br i1 %cmp19, label %if.then28, label %lor.lhs.false20

lor.lhs.false20:                                  ; preds = %lor.lhs.false
  %20 = load i32* %k, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %k, align 4
  %cmp22 = icmp ne i32 %20, 5
  br i1 %cmp22, label %if.then28, label %lor.lhs.false23

lor.lhs.false23:                                  ; preds = %lor.lhs.false20
  %21 = load i32* %k, align 4
  %dec24 = add nsw i32 %21, -1
  store i32 %dec24, i32* %k, align 4
  %cmp25 = icmp ne i32 %21, 6
  br i1 %cmp25, label %if.then28, label %lor.lhs.false26

lor.lhs.false26:                                  ; preds = %lor.lhs.false23
  %22 = load i32* %k, align 4
  %cmp27 = icmp ne i32 %22, 5
  br i1 %cmp27, label %if.then28, label %if.end31

if.then28:                                        ; preds = %lor.lhs.false26, %lor.lhs.false23, %lor.lhs.false20, %lor.lhs.false, %if.end16
  %23 = load i32* %rc, align 4
  %add29 = add nsw i32 %23, 8
  store i32 %add29, i32* %rc, align 4
  %call30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s72er, i32 0, i32 0), i32 8)
  br label %if.end31

if.end31:                                         ; preds = %if.then28, %lor.lhs.false26
  store i8 26, i8* %c, align 1
  store i64 26, i64* %l, align 8
  store double 2.600000e+01, double* %d, align 8
  store i16 26, i16* %s, align 2
  store i32 26, i32* %u, align 4
  store i32 26, i32* %i, align 4
  store float 2.600000e+01, float* %f, align 4
  store i32 0, i32* %lrc, align 4
  %24 = load i16* %s, align 2
  %conv = trunc i16 %24 to i8
  %conv32 = sext i8 %conv to i32
  %cmp33 = icmp ne i32 %conv32, 26
  br i1 %cmp33, label %if.then60, label %lor.lhs.false35

lor.lhs.false35:                                  ; preds = %if.end31
  %25 = load i32* %i, align 4
  %conv36 = trunc i32 %25 to i8
  %conv37 = sext i8 %conv36 to i32
  %cmp38 = icmp ne i32 %conv37, 26
  br i1 %cmp38, label %if.then60, label %lor.lhs.false40

lor.lhs.false40:                                  ; preds = %lor.lhs.false35
  %26 = load i64* %l, align 8
  %conv41 = trunc i64 %26 to i8
  %conv42 = sext i8 %conv41 to i32
  %cmp43 = icmp ne i32 %conv42, 26
  br i1 %cmp43, label %if.then60, label %lor.lhs.false45

lor.lhs.false45:                                  ; preds = %lor.lhs.false40
  %27 = load i32* %u, align 4
  %conv46 = trunc i32 %27 to i8
  %conv47 = sext i8 %conv46 to i32
  %cmp48 = icmp ne i32 %conv47, 26
  br i1 %cmp48, label %if.then60, label %lor.lhs.false50

lor.lhs.false50:                                  ; preds = %lor.lhs.false45
  %28 = load float* %f, align 4
  %conv51 = fptosi float %28 to i8
  %conv52 = sext i8 %conv51 to i32
  %cmp53 = icmp ne i32 %conv52, 26
  br i1 %cmp53, label %if.then60, label %lor.lhs.false55

lor.lhs.false55:                                  ; preds = %lor.lhs.false50
  %29 = load double* %d, align 8
  %conv56 = fptosi double %29 to i8
  %conv57 = sext i8 %conv56 to i32
  %cmp58 = icmp ne i32 %conv57, 26
  br i1 %cmp58, label %if.then60, label %if.end62

if.then60:                                        ; preds = %lor.lhs.false55, %lor.lhs.false50, %lor.lhs.false45, %lor.lhs.false40, %lor.lhs.false35, %if.end31
  %30 = load i32* %lrc, align 4
  %add61 = add nsw i32 %30, 1
  store i32 %add61, i32* %lrc, align 4
  br label %if.end62

if.end62:                                         ; preds = %if.then60, %lor.lhs.false55
  %31 = load i8* %c, align 1
  %conv63 = sext i8 %31 to i16
  %conv64 = sext i16 %conv63 to i32
  %cmp65 = icmp ne i32 %conv64, 26
  br i1 %cmp65, label %if.then92, label %lor.lhs.false67

lor.lhs.false67:                                  ; preds = %if.end62
  %32 = load i32* %i, align 4
  %conv68 = trunc i32 %32 to i16
  %conv69 = sext i16 %conv68 to i32
  %cmp70 = icmp ne i32 %conv69, 26
  br i1 %cmp70, label %if.then92, label %lor.lhs.false72

lor.lhs.false72:                                  ; preds = %lor.lhs.false67
  %33 = load i64* %l, align 8
  %conv73 = trunc i64 %33 to i16
  %conv74 = sext i16 %conv73 to i32
  %cmp75 = icmp ne i32 %conv74, 26
  br i1 %cmp75, label %if.then92, label %lor.lhs.false77

lor.lhs.false77:                                  ; preds = %lor.lhs.false72
  %34 = load i32* %u, align 4
  %conv78 = trunc i32 %34 to i16
  %conv79 = sext i16 %conv78 to i32
  %cmp80 = icmp ne i32 %conv79, 26
  br i1 %cmp80, label %if.then92, label %lor.lhs.false82

lor.lhs.false82:                                  ; preds = %lor.lhs.false77
  %35 = load float* %f, align 4
  %conv83 = fptosi float %35 to i16
  %conv84 = sext i16 %conv83 to i32
  %cmp85 = icmp ne i32 %conv84, 26
  br i1 %cmp85, label %if.then92, label %lor.lhs.false87

lor.lhs.false87:                                  ; preds = %lor.lhs.false82
  %36 = load double* %d, align 8
  %conv88 = fptosi double %36 to i16
  %conv89 = sext i16 %conv88 to i32
  %cmp90 = icmp ne i32 %conv89, 26
  br i1 %cmp90, label %if.then92, label %if.end94

if.then92:                                        ; preds = %lor.lhs.false87, %lor.lhs.false82, %lor.lhs.false77, %lor.lhs.false72, %lor.lhs.false67, %if.end62
  %37 = load i32* %lrc, align 4
  %add93 = add nsw i32 %37, 2
  store i32 %add93, i32* %lrc, align 4
  br label %if.end94

if.end94:                                         ; preds = %if.then92, %lor.lhs.false87
  %38 = load i8* %c, align 1
  %conv95 = sext i8 %38 to i32
  %cmp96 = icmp ne i32 %conv95, 26
  br i1 %cmp96, label %if.then117, label %lor.lhs.false98

lor.lhs.false98:                                  ; preds = %if.end94
  %39 = load i16* %s, align 2
  %conv99 = sext i16 %39 to i32
  %cmp100 = icmp ne i32 %conv99, 26
  br i1 %cmp100, label %if.then117, label %lor.lhs.false102

lor.lhs.false102:                                 ; preds = %lor.lhs.false98
  %40 = load i64* %l, align 8
  %conv103 = trunc i64 %40 to i32
  %cmp104 = icmp ne i32 %conv103, 26
  br i1 %cmp104, label %if.then117, label %lor.lhs.false106

lor.lhs.false106:                                 ; preds = %lor.lhs.false102
  %41 = load i32* %u, align 4
  %cmp107 = icmp ne i32 %41, 26
  br i1 %cmp107, label %if.then117, label %lor.lhs.false109

lor.lhs.false109:                                 ; preds = %lor.lhs.false106
  %42 = load float* %f, align 4
  %conv110 = fptosi float %42 to i32
  %cmp111 = icmp ne i32 %conv110, 26
  br i1 %cmp111, label %if.then117, label %lor.lhs.false113

lor.lhs.false113:                                 ; preds = %lor.lhs.false109
  %43 = load double* %d, align 8
  %conv114 = fptosi double %43 to i32
  %cmp115 = icmp ne i32 %conv114, 26
  br i1 %cmp115, label %if.then117, label %if.end119

if.then117:                                       ; preds = %lor.lhs.false113, %lor.lhs.false109, %lor.lhs.false106, %lor.lhs.false102, %lor.lhs.false98, %if.end94
  %44 = load i32* %lrc, align 4
  %add118 = add nsw i32 %44, 4
  store i32 %add118, i32* %lrc, align 4
  br label %if.end119

if.end119:                                        ; preds = %if.then117, %lor.lhs.false113
  %45 = load i8* %c, align 1
  %conv120 = sext i8 %45 to i64
  %cmp121 = icmp ne i64 %conv120, 26
  br i1 %cmp121, label %if.then143, label %lor.lhs.false123

lor.lhs.false123:                                 ; preds = %if.end119
  %46 = load i16* %s, align 2
  %conv124 = sext i16 %46 to i64
  %cmp125 = icmp ne i64 %conv124, 26
  br i1 %cmp125, label %if.then143, label %lor.lhs.false127

lor.lhs.false127:                                 ; preds = %lor.lhs.false123
  %47 = load i32* %i, align 4
  %conv128 = sext i32 %47 to i64
  %cmp129 = icmp ne i64 %conv128, 26
  br i1 %cmp129, label %if.then143, label %lor.lhs.false131

lor.lhs.false131:                                 ; preds = %lor.lhs.false127
  %48 = load i32* %u, align 4
  %conv132 = zext i32 %48 to i64
  %cmp133 = icmp ne i64 %conv132, 26
  br i1 %cmp133, label %if.then143, label %lor.lhs.false135

lor.lhs.false135:                                 ; preds = %lor.lhs.false131
  %49 = load float* %f, align 4
  %conv136 = fptosi float %49 to i64
  %cmp137 = icmp ne i64 %conv136, 26
  br i1 %cmp137, label %if.then143, label %lor.lhs.false139

lor.lhs.false139:                                 ; preds = %lor.lhs.false135
  %50 = load double* %d, align 8
  %conv140 = fptosi double %50 to i64
  %cmp141 = icmp ne i64 %conv140, 26
  br i1 %cmp141, label %if.then143, label %if.end145

if.then143:                                       ; preds = %lor.lhs.false139, %lor.lhs.false135, %lor.lhs.false131, %lor.lhs.false127, %lor.lhs.false123, %if.end119
  %51 = load i32* %lrc, align 4
  %add144 = add nsw i32 %51, 8
  store i32 %add144, i32* %lrc, align 4
  br label %if.end145

if.end145:                                        ; preds = %if.then143, %lor.lhs.false139
  %52 = load i8* %c, align 1
  %conv146 = sext i8 %52 to i32
  %cmp147 = icmp ne i32 %conv146, 26
  br i1 %cmp147, label %if.then168, label %lor.lhs.false149

lor.lhs.false149:                                 ; preds = %if.end145
  %53 = load i16* %s, align 2
  %conv150 = sext i16 %53 to i32
  %cmp151 = icmp ne i32 %conv150, 26
  br i1 %cmp151, label %if.then168, label %lor.lhs.false153

lor.lhs.false153:                                 ; preds = %lor.lhs.false149
  %54 = load i32* %i, align 4
  %cmp154 = icmp ne i32 %54, 26
  br i1 %cmp154, label %if.then168, label %lor.lhs.false156

lor.lhs.false156:                                 ; preds = %lor.lhs.false153
  %55 = load i64* %l, align 8
  %conv157 = trunc i64 %55 to i32
  %cmp158 = icmp ne i32 %conv157, 26
  br i1 %cmp158, label %if.then168, label %lor.lhs.false160

lor.lhs.false160:                                 ; preds = %lor.lhs.false156
  %56 = load float* %f, align 4
  %conv161 = fptoui float %56 to i32
  %cmp162 = icmp ne i32 %conv161, 26
  br i1 %cmp162, label %if.then168, label %lor.lhs.false164

lor.lhs.false164:                                 ; preds = %lor.lhs.false160
  %57 = load double* %d, align 8
  %conv165 = fptoui double %57 to i32
  %cmp166 = icmp ne i32 %conv165, 26
  br i1 %cmp166, label %if.then168, label %if.end170

if.then168:                                       ; preds = %lor.lhs.false164, %lor.lhs.false160, %lor.lhs.false156, %lor.lhs.false153, %lor.lhs.false149, %if.end145
  %58 = load i32* %lrc, align 4
  %add169 = add nsw i32 %58, 16
  store i32 %add169, i32* %lrc, align 4
  br label %if.end170

if.end170:                                        ; preds = %if.then168, %lor.lhs.false164
  %59 = load i8* %c, align 1
  %conv171 = sitofp i8 %59 to float
  %conv172 = fpext float %conv171 to double
  %cmp173 = fcmp une double %conv172, 2.600000e+01
  br i1 %cmp173, label %if.then200, label %lor.lhs.false175

lor.lhs.false175:                                 ; preds = %if.end170
  %60 = load i16* %s, align 2
  %conv176 = sitofp i16 %60 to float
  %conv177 = fpext float %conv176 to double
  %cmp178 = fcmp une double %conv177, 2.600000e+01
  br i1 %cmp178, label %if.then200, label %lor.lhs.false180

lor.lhs.false180:                                 ; preds = %lor.lhs.false175
  %61 = load i32* %i, align 4
  %conv181 = sitofp i32 %61 to float
  %conv182 = fpext float %conv181 to double
  %cmp183 = fcmp une double %conv182, 2.600000e+01
  br i1 %cmp183, label %if.then200, label %lor.lhs.false185

lor.lhs.false185:                                 ; preds = %lor.lhs.false180
  %62 = load i64* %l, align 8
  %conv186 = sitofp i64 %62 to float
  %conv187 = fpext float %conv186 to double
  %cmp188 = fcmp une double %conv187, 2.600000e+01
  br i1 %cmp188, label %if.then200, label %lor.lhs.false190

lor.lhs.false190:                                 ; preds = %lor.lhs.false185
  %63 = load i32* %u, align 4
  %conv191 = uitofp i32 %63 to float
  %conv192 = fpext float %conv191 to double
  %cmp193 = fcmp une double %conv192, 2.600000e+01
  br i1 %cmp193, label %if.then200, label %lor.lhs.false195

lor.lhs.false195:                                 ; preds = %lor.lhs.false190
  %64 = load double* %d, align 8
  %conv196 = fptrunc double %64 to float
  %conv197 = fpext float %conv196 to double
  %cmp198 = fcmp une double %conv197, 2.600000e+01
  br i1 %cmp198, label %if.then200, label %if.end202

if.then200:                                       ; preds = %lor.lhs.false195, %lor.lhs.false190, %lor.lhs.false185, %lor.lhs.false180, %lor.lhs.false175, %if.end170
  %65 = load i32* %lrc, align 4
  %add201 = add nsw i32 %65, 32
  store i32 %add201, i32* %lrc, align 4
  br label %if.end202

if.end202:                                        ; preds = %if.then200, %lor.lhs.false195
  %66 = load i8* %c, align 1
  %conv203 = sitofp i8 %66 to double
  %cmp204 = fcmp une double %conv203, 2.600000e+01
  br i1 %cmp204, label %if.then226, label %lor.lhs.false206

lor.lhs.false206:                                 ; preds = %if.end202
  %67 = load i16* %s, align 2
  %conv207 = sitofp i16 %67 to double
  %cmp208 = fcmp une double %conv207, 2.600000e+01
  br i1 %cmp208, label %if.then226, label %lor.lhs.false210

lor.lhs.false210:                                 ; preds = %lor.lhs.false206
  %68 = load i32* %i, align 4
  %conv211 = sitofp i32 %68 to double
  %cmp212 = fcmp une double %conv211, 2.600000e+01
  br i1 %cmp212, label %if.then226, label %lor.lhs.false214

lor.lhs.false214:                                 ; preds = %lor.lhs.false210
  %69 = load i64* %l, align 8
  %conv215 = sitofp i64 %69 to double
  %cmp216 = fcmp une double %conv215, 2.600000e+01
  br i1 %cmp216, label %if.then226, label %lor.lhs.false218

lor.lhs.false218:                                 ; preds = %lor.lhs.false214
  %70 = load i32* %u, align 4
  %conv219 = uitofp i32 %70 to double
  %cmp220 = fcmp une double %conv219, 2.600000e+01
  br i1 %cmp220, label %if.then226, label %lor.lhs.false222

lor.lhs.false222:                                 ; preds = %lor.lhs.false218
  %71 = load float* %f, align 4
  %conv223 = fpext float %71 to double
  %cmp224 = fcmp une double %conv223, 2.600000e+01
  br i1 %cmp224, label %if.then226, label %if.end228

if.then226:                                       ; preds = %lor.lhs.false222, %lor.lhs.false218, %lor.lhs.false214, %lor.lhs.false210, %lor.lhs.false206, %if.end202
  %72 = load i32* %lrc, align 4
  %add227 = add nsw i32 %72, 64
  store i32 %add227, i32* %lrc, align 4
  br label %if.end228

if.end228:                                        ; preds = %if.then226, %lor.lhs.false222
  %73 = load i32* %lrc, align 4
  %cmp229 = icmp ne i32 %73, 0
  br i1 %cmp229, label %if.then231, label %if.end234

if.then231:                                       ; preds = %if.end228
  %74 = load i32* %rc, align 4
  %add232 = add nsw i32 %74, 16
  store i32 %add232, i32* %rc, align 4
  %call233 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s72er, i32 0, i32 0), i32 16)
  br label %if.end234

if.end234:                                        ; preds = %if.then231, %if.end228
  %75 = load i32* %rc, align 4
  ret i32 %75
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
