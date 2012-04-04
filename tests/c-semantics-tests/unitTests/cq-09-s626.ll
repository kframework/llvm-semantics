; ModuleID = '/home/david/src/c-semantics/tests/unitTests/cq-09-s626.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.defs = type { i32, i32, i32, i32, i32, i32, i32, float, float, i32, i32, i32, i32, i32, i32, [8 x i8] }

@setupTable.qs26 = internal global [8 x i8] c"s26    \00", align 1
@setupTable.s = internal global [18 x i8] c"%3d bits in %ss.\0A\00", align 16
@setupTable.s2 = internal global [54 x i8] c"%f is the least number that can be added to 1. (%s).\0A\00", align 16
@svtest.k = internal global i32 0, align 4
@zero.k = internal global i32 0, align 4
@extvar = common global i32 0, align 4
@sec.s626er = internal global [11 x i8] c"s626,er%d\0A\00", align 1
@sec.qs626 = internal global [8 x i8] c"s626   \00", align 1
@.str = private unnamed_addr constant [8 x i8] c"   key=\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@main.d0 = internal global %struct.defs zeroinitializer, align 4
@main.pd0 = internal global %struct.defs* null, align 8
@.str3 = private unnamed_addr constant [25 x i8] c"Section %s returned %d.\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"\0ANo errors detected.\0A\00", align 1
@.str5 = private unnamed_addr constant [10 x i8] c"\0AFailed.\0A\00", align 1

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
  %eps = alloca float, align 4
  %f1 = alloca float, align 4
  %f2 = alloca float, align 4
  %f3 = alloca float, align 4
  %f4 = alloca float, align 4
  %f = alloca float, align 4
  %lint1 = alloca i64, align 8
  %lint2 = alloca i64, align 8
  %l = alloca i64, align 8
  %ls = alloca i64, align 8
  %c = alloca i8, align 1
  %t = alloca [28 x i8], align 16
  %t0 = alloca i8, align 1
  %s = alloca i16, align 2
  %is = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %u = alloca i32, align 4
  %us = alloca i32, align 4
  %d = alloca double, align 8
  %ds = alloca double, align 8
  store %struct.defs* %pd0, %struct.defs** %pd0.addr, align 8
  %0 = load %struct.defs** %pd0.addr, align 8
  %call = call i32 (...)* bitcast (i32 (%struct.defs*)* @setupTable to i32 (...)*)(%struct.defs* %0)
  store i8* getelementptr inbounds ([8 x i8]* @sec.qs626, i32 0, i32 0), i8** %ps, align 8
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
  store float 1.000000e+00, float* %f1, align 4
  store i64 1, i64* %lint1, align 8
  store i64 1, i64* %lint2, align 8
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %while.end
  %5 = load i32* %j, align 4
  %6 = load %struct.defs** %pd0.addr, align 8
  %lbits = getelementptr inbounds %struct.defs* %6, i32 0, i32 3
  %7 = load i32* %lbits, align 4
  %sub = sub nsw i32 %7, 2
  %cmp = icmp slt i32 %5, %sub
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %8 = load float* %f1, align 4
  %mul = fmul float %8, 2.000000e+00
  store float %mul, float* %f1, align 4
  %9 = load i64* %lint2, align 8
  %shl = shl i64 %9, 1
  %10 = load i64* %lint1, align 8
  %or = or i64 %shl, %10
  store i64 %or, i64* %lint2, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %11 = load i32* %j, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %12 = load i64* %lint2, align 8
  %conv = sitofp i64 %12 to float
  store float %conv, float* %f2, align 4
  %13 = load float* %f1, align 4
  %14 = load float* %f2, align 4
  %sub2 = fsub float %13, %14
  %15 = load float* %f1, align 4
  %div = fdiv float %sub2, %15
  store float %div, float* %f1, align 4
  %16 = load float* %f1, align 4
  %conv3 = fpext float %16 to double
  %17 = load %struct.defs** %pd0.addr, align 8
  %fprec = getelementptr inbounds %struct.defs* %17, i32 0, i32 7
  %18 = load float* %fprec, align 4
  %conv4 = fpext float %18 to double
  %mul5 = fmul double 2.000000e+00, %conv4
  %cmp6 = fcmp ogt double %conv3, %mul5
  br i1 %cmp6, label %if.then, label %if.end12

if.then:                                          ; preds = %for.end
  %19 = load i32* %rc, align 4
  %add = add nsw i32 %19, 2
  store i32 %add, i32* %rc, align 4
  %20 = load %struct.defs** %pd0.addr, align 8
  %flgd = getelementptr inbounds %struct.defs* %20, i32 0, i32 11
  %21 = load i32* %flgd, align 4
  %cmp8 = icmp ne i32 %21, 0
  br i1 %cmp8, label %if.then10, label %if.end

if.then10:                                        ; preds = %if.then
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @sec.s626er, i32 0, i32 0), i32 2)
  br label %if.end

if.end:                                           ; preds = %if.then10, %if.then
  br label %if.end12

if.end12:                                         ; preds = %if.end, %for.end
  store i8 125, i8* %c, align 1
  store i16 125, i16* %s, align 2
  store i32 125, i32* %i, align 4
  store i32 15625, i32* %is, align 4
  store i32 125, i32* %u, align 4
  store i32 15625, i32* %us, align 4
  store i64 125, i64* %l, align 8
  store i64 15625, i64* %ls, align 8
  store float 1.250000e+02, float* %f, align 4
  store double 1.250000e+02, double* %d, align 8
  store double 1.562500e+04, double* %ds, align 8
  store i32 0, i32* %j, align 4
  br label %for.cond13

for.cond13:                                       ; preds = %for.inc17, %if.end12
  %22 = load i32* %j, align 4
  %cmp14 = icmp slt i32 %22, 28
  br i1 %cmp14, label %for.body16, label %for.end19

for.body16:                                       ; preds = %for.cond13
  %23 = load i32* %j, align 4
  %idxprom = sext i32 %23 to i64
  %arrayidx = getelementptr inbounds [28 x i8]* %t, i32 0, i64 %idxprom
  store i8 0, i8* %arrayidx, align 1
  br label %for.inc17

for.inc17:                                        ; preds = %for.body16
  %24 = load i32* %j, align 4
  %inc18 = add nsw i32 %24, 1
  store i32 %inc18, i32* %j, align 4
  br label %for.cond13

for.end19:                                        ; preds = %for.cond13
  %25 = load i8* %c, align 1
  %conv20 = sext i8 %25 to i32
  %26 = load i8* %c, align 1
  %conv21 = sext i8 %26 to i32
  %mul22 = mul nsw i32 %conv20, %conv21
  %27 = load i32* %is, align 4
  %cmp23 = icmp ne i32 %mul22, %27
  br i1 %cmp23, label %if.then25, label %if.end27

if.then25:                                        ; preds = %for.end19
  %arrayidx26 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 0
  store i8 1, i8* %arrayidx26, align 1
  br label %if.end27

if.end27:                                         ; preds = %if.then25, %for.end19
  %28 = load i16* %s, align 2
  %conv28 = sext i16 %28 to i32
  %29 = load i8* %c, align 1
  %conv29 = sext i8 %29 to i32
  %mul30 = mul nsw i32 %conv28, %conv29
  %30 = load i32* %is, align 4
  %cmp31 = icmp ne i32 %mul30, %30
  br i1 %cmp31, label %if.then33, label %if.end35

if.then33:                                        ; preds = %if.end27
  %arrayidx34 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 1
  store i8 1, i8* %arrayidx34, align 1
  br label %if.end35

if.end35:                                         ; preds = %if.then33, %if.end27
  %31 = load i16* %s, align 2
  %conv36 = sext i16 %31 to i32
  %32 = load i16* %s, align 2
  %conv37 = sext i16 %32 to i32
  %mul38 = mul nsw i32 %conv36, %conv37
  %33 = load i32* %is, align 4
  %cmp39 = icmp ne i32 %mul38, %33
  br i1 %cmp39, label %if.then41, label %if.end43

if.then41:                                        ; preds = %if.end35
  %arrayidx42 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 2
  store i8 1, i8* %arrayidx42, align 1
  br label %if.end43

if.end43:                                         ; preds = %if.then41, %if.end35
  %34 = load i32* %i, align 4
  %35 = load i8* %c, align 1
  %conv44 = sext i8 %35 to i32
  %mul45 = mul nsw i32 %34, %conv44
  %36 = load i32* %is, align 4
  %cmp46 = icmp ne i32 %mul45, %36
  br i1 %cmp46, label %if.then48, label %if.end50

if.then48:                                        ; preds = %if.end43
  %arrayidx49 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 3
  store i8 1, i8* %arrayidx49, align 1
  br label %if.end50

if.end50:                                         ; preds = %if.then48, %if.end43
  %37 = load i32* %i, align 4
  %38 = load i16* %s, align 2
  %conv51 = sext i16 %38 to i32
  %mul52 = mul nsw i32 %37, %conv51
  %39 = load i32* %is, align 4
  %cmp53 = icmp ne i32 %mul52, %39
  br i1 %cmp53, label %if.then55, label %if.end57

if.then55:                                        ; preds = %if.end50
  %arrayidx56 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 4
  store i8 1, i8* %arrayidx56, align 1
  br label %if.end57

if.end57:                                         ; preds = %if.then55, %if.end50
  %40 = load i32* %i, align 4
  %41 = load i32* %i, align 4
  %mul58 = mul nsw i32 %40, %41
  %42 = load i32* %is, align 4
  %cmp59 = icmp ne i32 %mul58, %42
  br i1 %cmp59, label %if.then61, label %if.end63

if.then61:                                        ; preds = %if.end57
  %arrayidx62 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 5
  store i8 1, i8* %arrayidx62, align 1
  br label %if.end63

if.end63:                                         ; preds = %if.then61, %if.end57
  %43 = load i32* %u, align 4
  %44 = load i8* %c, align 1
  %conv64 = sext i8 %44 to i32
  %mul65 = mul i32 %43, %conv64
  %45 = load i32* %us, align 4
  %cmp66 = icmp ne i32 %mul65, %45
  br i1 %cmp66, label %if.then68, label %if.end70

if.then68:                                        ; preds = %if.end63
  %arrayidx69 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 6
  store i8 1, i8* %arrayidx69, align 1
  br label %if.end70

if.end70:                                         ; preds = %if.then68, %if.end63
  %46 = load i32* %u, align 4
  %47 = load i16* %s, align 2
  %conv71 = sext i16 %47 to i32
  %mul72 = mul i32 %46, %conv71
  %48 = load i32* %us, align 4
  %cmp73 = icmp ne i32 %mul72, %48
  br i1 %cmp73, label %if.then75, label %if.end77

if.then75:                                        ; preds = %if.end70
  %arrayidx76 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 7
  store i8 1, i8* %arrayidx76, align 1
  br label %if.end77

if.end77:                                         ; preds = %if.then75, %if.end70
  %49 = load i32* %u, align 4
  %50 = load i32* %i, align 4
  %mul78 = mul i32 %49, %50
  %51 = load i32* %us, align 4
  %cmp79 = icmp ne i32 %mul78, %51
  br i1 %cmp79, label %if.then81, label %if.end83

if.then81:                                        ; preds = %if.end77
  %arrayidx82 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 8
  store i8 1, i8* %arrayidx82, align 1
  br label %if.end83

if.end83:                                         ; preds = %if.then81, %if.end77
  %52 = load i32* %u, align 4
  %53 = load i32* %u, align 4
  %mul84 = mul i32 %52, %53
  %54 = load i32* %us, align 4
  %cmp85 = icmp ne i32 %mul84, %54
  br i1 %cmp85, label %if.then87, label %if.end89

if.then87:                                        ; preds = %if.end83
  %arrayidx88 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 9
  store i8 1, i8* %arrayidx88, align 1
  br label %if.end89

if.end89:                                         ; preds = %if.then87, %if.end83
  %55 = load i64* %l, align 8
  %56 = load i8* %c, align 1
  %conv90 = sext i8 %56 to i64
  %mul91 = mul nsw i64 %55, %conv90
  %57 = load i64* %ls, align 8
  %cmp92 = icmp ne i64 %mul91, %57
  br i1 %cmp92, label %if.then94, label %if.end96

if.then94:                                        ; preds = %if.end89
  %arrayidx95 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 10
  store i8 1, i8* %arrayidx95, align 1
  br label %if.end96

if.end96:                                         ; preds = %if.then94, %if.end89
  %58 = load i64* %l, align 8
  %59 = load i16* %s, align 2
  %conv97 = sext i16 %59 to i64
  %mul98 = mul nsw i64 %58, %conv97
  %60 = load i64* %ls, align 8
  %cmp99 = icmp ne i64 %mul98, %60
  br i1 %cmp99, label %if.then101, label %if.end103

if.then101:                                       ; preds = %if.end96
  %arrayidx102 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 11
  store i8 1, i8* %arrayidx102, align 1
  br label %if.end103

if.end103:                                        ; preds = %if.then101, %if.end96
  %61 = load i64* %l, align 8
  %62 = load i32* %i, align 4
  %conv104 = sext i32 %62 to i64
  %mul105 = mul nsw i64 %61, %conv104
  %63 = load i64* %ls, align 8
  %cmp106 = icmp ne i64 %mul105, %63
  br i1 %cmp106, label %if.then108, label %if.end110

if.then108:                                       ; preds = %if.end103
  %arrayidx109 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 12
  store i8 1, i8* %arrayidx109, align 1
  br label %if.end110

if.end110:                                        ; preds = %if.then108, %if.end103
  %64 = load i64* %l, align 8
  %65 = load i32* %u, align 4
  %conv111 = zext i32 %65 to i64
  %mul112 = mul nsw i64 %64, %conv111
  %66 = load i32* %us, align 4
  %conv113 = zext i32 %66 to i64
  %cmp114 = icmp ne i64 %mul112, %conv113
  br i1 %cmp114, label %if.then116, label %if.end118

if.then116:                                       ; preds = %if.end110
  %arrayidx117 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 13
  store i8 1, i8* %arrayidx117, align 1
  br label %if.end118

if.end118:                                        ; preds = %if.then116, %if.end110
  %67 = load i64* %l, align 8
  %68 = load i64* %l, align 8
  %mul119 = mul nsw i64 %67, %68
  %69 = load i64* %ls, align 8
  %cmp120 = icmp ne i64 %mul119, %69
  br i1 %cmp120, label %if.then122, label %if.end124

if.then122:                                       ; preds = %if.end118
  %arrayidx123 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 14
  store i8 1, i8* %arrayidx123, align 1
  br label %if.end124

if.end124:                                        ; preds = %if.then122, %if.end118
  %70 = load float* %f, align 4
  %71 = load i8* %c, align 1
  %conv125 = sext i8 %71 to i32
  %conv126 = sitofp i32 %conv125 to float
  %mul127 = fmul float %70, %conv126
  %conv128 = fpext float %mul127 to double
  %72 = load double* %ds, align 8
  %cmp129 = fcmp une double %conv128, %72
  br i1 %cmp129, label %if.then131, label %if.end133

if.then131:                                       ; preds = %if.end124
  %arrayidx132 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 15
  store i8 1, i8* %arrayidx132, align 1
  br label %if.end133

if.end133:                                        ; preds = %if.then131, %if.end124
  %73 = load float* %f, align 4
  %74 = load i16* %s, align 2
  %conv134 = sext i16 %74 to i32
  %conv135 = sitofp i32 %conv134 to float
  %mul136 = fmul float %73, %conv135
  %conv137 = fpext float %mul136 to double
  %75 = load double* %ds, align 8
  %cmp138 = fcmp une double %conv137, %75
  br i1 %cmp138, label %if.then140, label %if.end142

if.then140:                                       ; preds = %if.end133
  %arrayidx141 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 16
  store i8 1, i8* %arrayidx141, align 1
  br label %if.end142

if.end142:                                        ; preds = %if.then140, %if.end133
  %76 = load float* %f, align 4
  %77 = load i32* %i, align 4
  %conv143 = sitofp i32 %77 to float
  %mul144 = fmul float %76, %conv143
  %conv145 = fpext float %mul144 to double
  %78 = load double* %ds, align 8
  %cmp146 = fcmp une double %conv145, %78
  br i1 %cmp146, label %if.then148, label %if.end150

if.then148:                                       ; preds = %if.end142
  %arrayidx149 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 17
  store i8 1, i8* %arrayidx149, align 1
  br label %if.end150

if.end150:                                        ; preds = %if.then148, %if.end142
  %79 = load float* %f, align 4
  %80 = load i32* %u, align 4
  %conv151 = uitofp i32 %80 to float
  %mul152 = fmul float %79, %conv151
  %conv153 = fpext float %mul152 to double
  %81 = load double* %ds, align 8
  %cmp154 = fcmp une double %conv153, %81
  br i1 %cmp154, label %if.then156, label %if.end158

if.then156:                                       ; preds = %if.end150
  %arrayidx157 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 18
  store i8 1, i8* %arrayidx157, align 1
  br label %if.end158

if.end158:                                        ; preds = %if.then156, %if.end150
  %82 = load float* %f, align 4
  %83 = load i64* %l, align 8
  %conv159 = sitofp i64 %83 to float
  %mul160 = fmul float %82, %conv159
  %conv161 = fpext float %mul160 to double
  %84 = load double* %ds, align 8
  %cmp162 = fcmp une double %conv161, %84
  br i1 %cmp162, label %if.then164, label %if.end166

if.then164:                                       ; preds = %if.end158
  %arrayidx165 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 19
  store i8 1, i8* %arrayidx165, align 1
  br label %if.end166

if.end166:                                        ; preds = %if.then164, %if.end158
  %85 = load float* %f, align 4
  %86 = load float* %f, align 4
  %mul167 = fmul float %85, %86
  %conv168 = fpext float %mul167 to double
  %87 = load double* %ds, align 8
  %cmp169 = fcmp une double %conv168, %87
  br i1 %cmp169, label %if.then171, label %if.end173

if.then171:                                       ; preds = %if.end166
  %arrayidx172 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 20
  store i8 1, i8* %arrayidx172, align 1
  br label %if.end173

if.end173:                                        ; preds = %if.then171, %if.end166
  %88 = load double* %d, align 8
  %89 = load i8* %c, align 1
  %conv174 = sext i8 %89 to i32
  %conv175 = sitofp i32 %conv174 to double
  %mul176 = fmul double %88, %conv175
  %90 = load double* %ds, align 8
  %cmp177 = fcmp une double %mul176, %90
  br i1 %cmp177, label %if.then179, label %if.end181

if.then179:                                       ; preds = %if.end173
  %arrayidx180 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 21
  store i8 1, i8* %arrayidx180, align 1
  br label %if.end181

if.end181:                                        ; preds = %if.then179, %if.end173
  %91 = load double* %d, align 8
  %92 = load i16* %s, align 2
  %conv182 = sext i16 %92 to i32
  %conv183 = sitofp i32 %conv182 to double
  %mul184 = fmul double %91, %conv183
  %93 = load double* %ds, align 8
  %cmp185 = fcmp une double %mul184, %93
  br i1 %cmp185, label %if.then187, label %if.end189

if.then187:                                       ; preds = %if.end181
  %arrayidx188 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 22
  store i8 1, i8* %arrayidx188, align 1
  br label %if.end189

if.end189:                                        ; preds = %if.then187, %if.end181
  %94 = load double* %d, align 8
  %95 = load i32* %i, align 4
  %conv190 = sitofp i32 %95 to double
  %mul191 = fmul double %94, %conv190
  %96 = load double* %ds, align 8
  %cmp192 = fcmp une double %mul191, %96
  br i1 %cmp192, label %if.then194, label %if.end196

if.then194:                                       ; preds = %if.end189
  %arrayidx195 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 23
  store i8 1, i8* %arrayidx195, align 1
  br label %if.end196

if.end196:                                        ; preds = %if.then194, %if.end189
  %97 = load double* %d, align 8
  %98 = load i32* %u, align 4
  %conv197 = uitofp i32 %98 to double
  %mul198 = fmul double %97, %conv197
  %99 = load double* %ds, align 8
  %cmp199 = fcmp une double %mul198, %99
  br i1 %cmp199, label %if.then201, label %if.end203

if.then201:                                       ; preds = %if.end196
  %arrayidx202 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 24
  store i8 1, i8* %arrayidx202, align 1
  br label %if.end203

if.end203:                                        ; preds = %if.then201, %if.end196
  %100 = load double* %d, align 8
  %101 = load i64* %l, align 8
  %conv204 = sitofp i64 %101 to double
  %mul205 = fmul double %100, %conv204
  %102 = load double* %ds, align 8
  %cmp206 = fcmp une double %mul205, %102
  br i1 %cmp206, label %if.then208, label %if.end210

if.then208:                                       ; preds = %if.end203
  %arrayidx209 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 25
  store i8 1, i8* %arrayidx209, align 1
  br label %if.end210

if.end210:                                        ; preds = %if.then208, %if.end203
  %103 = load double* %d, align 8
  %104 = load float* %f, align 4
  %conv211 = fpext float %104 to double
  %mul212 = fmul double %103, %conv211
  %105 = load double* %ds, align 8
  %cmp213 = fcmp une double %mul212, %105
  br i1 %cmp213, label %if.then215, label %if.end217

if.then215:                                       ; preds = %if.end210
  %arrayidx216 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 26
  store i8 1, i8* %arrayidx216, align 1
  br label %if.end217

if.end217:                                        ; preds = %if.then215, %if.end210
  %106 = load double* %d, align 8
  %107 = load double* %d, align 8
  %mul218 = fmul double %106, %107
  %108 = load double* %ds, align 8
  %cmp219 = fcmp une double %mul218, %108
  br i1 %cmp219, label %if.then221, label %if.end223

if.then221:                                       ; preds = %if.end217
  %arrayidx222 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 27
  store i8 1, i8* %arrayidx222, align 1
  br label %if.end223

if.end223:                                        ; preds = %if.then221, %if.end217
  store i8 0, i8* %t0, align 1
  store i32 0, i32* %j, align 4
  br label %for.cond224

for.cond224:                                      ; preds = %for.inc234, %if.end223
  %109 = load i32* %j, align 4
  %cmp225 = icmp slt i32 %109, 28
  br i1 %cmp225, label %for.body227, label %for.end236

for.body227:                                      ; preds = %for.cond224
  %110 = load i8* %t0, align 1
  %conv228 = sext i8 %110 to i32
  %111 = load i32* %j, align 4
  %idxprom229 = sext i32 %111 to i64
  %arrayidx230 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 %idxprom229
  %112 = load i8* %arrayidx230, align 1
  %conv231 = sext i8 %112 to i32
  %add232 = add nsw i32 %conv228, %conv231
  %conv233 = trunc i32 %add232 to i8
  store i8 %conv233, i8* %t0, align 1
  br label %for.inc234

for.inc234:                                       ; preds = %for.body227
  %113 = load i32* %j, align 4
  %inc235 = add nsw i32 %113, 1
  store i32 %inc235, i32* %j, align 4
  br label %for.cond224

for.end236:                                       ; preds = %for.cond224
  %114 = load i8* %t0, align 1
  %conv237 = sext i8 %114 to i32
  %cmp238 = icmp ne i32 %conv237, 0
  br i1 %cmp238, label %if.then240, label %if.end261

if.then240:                                       ; preds = %for.end236
  %115 = load i32* %rc, align 4
  %add241 = add nsw i32 %115, 4
  store i32 %add241, i32* %rc, align 4
  %116 = load %struct.defs** %pd0.addr, align 8
  %flgd242 = getelementptr inbounds %struct.defs* %116, i32 0, i32 11
  %117 = load i32* %flgd242, align 4
  %cmp243 = icmp ne i32 %117, 0
  br i1 %cmp243, label %if.then245, label %if.end260

if.then245:                                       ; preds = %if.then240
  %call246 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @sec.s626er, i32 0, i32 0), i32 4)
  %call247 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0))
  store i32 0, i32* %j, align 4
  br label %for.cond248

for.cond248:                                      ; preds = %for.inc256, %if.then245
  %118 = load i32* %j, align 4
  %cmp249 = icmp slt i32 %118, 28
  br i1 %cmp249, label %for.body251, label %for.end258

for.body251:                                      ; preds = %for.cond248
  %119 = load i32* %j, align 4
  %idxprom252 = sext i32 %119 to i64
  %arrayidx253 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 %idxprom252
  %120 = load i8* %arrayidx253, align 1
  %conv254 = sext i8 %120 to i32
  %call255 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0), i32 %conv254)
  br label %for.inc256

for.inc256:                                       ; preds = %for.body251
  %121 = load i32* %j, align 4
  %inc257 = add nsw i32 %121, 1
  store i32 %inc257, i32* %j, align 4
  br label %for.cond248

for.end258:                                       ; preds = %for.cond248
  %call259 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0))
  br label %if.end260

if.end260:                                        ; preds = %for.end258, %if.then240
  br label %if.end261

if.end261:                                        ; preds = %if.end260, %for.end236
  store i64 32768, i64* %l, align 8
  %122 = load i64* %l, align 8
  %cmp262 = icmp sgt i64 %122, 32768
  br i1 %cmp262, label %if.then264, label %if.end272

if.then264:                                       ; preds = %if.end261
  %123 = load i32* %rc, align 4
  %add265 = add nsw i32 %123, 8
  store i32 %add265, i32* %rc, align 4
  %124 = load %struct.defs** %pd0.addr, align 8
  %flgd266 = getelementptr inbounds %struct.defs* %124, i32 0, i32 11
  %125 = load i32* %flgd266, align 4
  %cmp267 = icmp ne i32 %125, 0
  br i1 %cmp267, label %if.then269, label %if.end271

if.then269:                                       ; preds = %if.then264
  %call270 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @sec.s626er, i32 0, i32 0), i32 8)
  br label %if.end271

if.end271:                                        ; preds = %if.then269, %if.then264
  br label %if.end272

if.end272:                                        ; preds = %if.end271, %if.end261
  %126 = load i32* %rc, align 4
  ret i32 %126
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
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 15, i32 0), i32 %4)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %5 = load i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 14), align 4
  %cmp2 = icmp eq i32 %5, 0
  br i1 %cmp2, label %if.then3, label %if.else

if.then3:                                         ; preds = %if.end
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0))
  br label %if.end6

if.else:                                          ; preds = %if.end
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str5, i32 0, i32 0))
  br label %if.end6

if.end6:                                          ; preds = %if.else, %if.then3
  ret i32 0
}
