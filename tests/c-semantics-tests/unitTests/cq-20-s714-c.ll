; ModuleID = '/home/david/src/c-semantics/tests/unitTests/cq-20-s714-c.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.defs = type { i32, i32, i32, i32, i32, i32, i32, float, float, i32, i32, i32, i32, i32, i32, [8 x i8] }

@setupTable.qs26 = internal global [8 x i8] c"s26    \00", align 1
@setupTable.s = internal global [18 x i8] c"%3d bits in %ss.\0A\00", align 16
@setupTable.s2 = internal global [54 x i8] c"%f is the least number that can be added to 1. (%s).\0A\00", align 16
@svtest.k = internal global i32 0, align 4
@zero.k = internal global i32 0, align 4
@extvar = common global i32 0, align 4
@sec.f = internal global [17 x i8] c"Local error %d.\0A\00", align 16
@sec.s714er = internal global [11 x i8] c"s714,er%d\0A\00", align 1
@sec.qs714 = internal global [8 x i8] c"s714   \00", align 1
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
  %prlc = alloca i32, align 4
  %lrc = alloca i32, align 4
  %rc = alloca i32, align 4
  %cl = alloca i8, align 1
  %cr = alloca i8, align 1
  %sl = alloca i16, align 2
  %sr = alloca i16, align 2
  %il = alloca i32, align 4
  %ir = alloca i32, align 4
  %ll = alloca i64, align 8
  %lr = alloca i64, align 8
  %ul = alloca i32, align 4
  %ur = alloca i32, align 4
  %fl = alloca float, align 4
  %fr = alloca float, align 4
  %dl = alloca double, align 8
  %dr = alloca double, align 8
  %ps = alloca i8*, align 8
  %pt = alloca i8*, align 8
  store %struct.defs* %pd0, %struct.defs** %pd0.addr, align 8
  store i8* getelementptr inbounds ([8 x i8]* @sec.qs714, i32 0, i32 0), i8** %ps, align 8
  %0 = load %struct.defs** %pd0.addr, align 8
  %rfs = getelementptr inbounds %struct.defs* %0, i32 0, i32 15
  %arraydecay = getelementptr inbounds [8 x i8]* %rfs, i32 0, i32 0
  store i8* %arraydecay, i8** %pt, align 8
  store i32 0, i32* %rc, align 4
  store i32 0, i32* %lrc, align 4
  %1 = load %struct.defs** %pd0.addr, align 8
  %flgl = getelementptr inbounds %struct.defs* %1, i32 0, i32 12
  %2 = load i32* %flgl, align 4
  store i32 %2, i32* %prlc, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %3 = load i8** %ps, align 8
  %incdec.ptr = getelementptr inbounds i8* %3, i32 1
  store i8* %incdec.ptr, i8** %ps, align 8
  %4 = load i8* %3, align 1
  %5 = load i8** %pt, align 8
  %incdec.ptr1 = getelementptr inbounds i8* %5, i32 1
  store i8* %incdec.ptr1, i8** %pt, align 8
  store i8 %4, i8* %5, align 1
  %tobool = icmp ne i8 %4, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  br label %while.cond

while.end:                                        ; preds = %while.cond
  store i8 5, i8* %cl, align 1
  store i32 2, i32* %ir, align 4
  %6 = load i32* %ir, align 4
  %7 = load i8* %cl, align 1
  %conv = sext i8 %7 to i32
  %sub = sub nsw i32 %conv, %6
  %conv2 = trunc i32 %sub to i8
  store i8 %conv2, i8* %cl, align 1
  %8 = load i8* %cl, align 1
  %conv3 = sext i8 %8 to i32
  %cmp = icmp ne i32 %conv3, 3
  br i1 %cmp, label %if.then, label %if.end7

if.then:                                          ; preds = %while.end
  store i32 101, i32* %lrc, align 4
  %9 = load i32* %prlc, align 4
  %tobool5 = icmp ne i32 %9, 0
  br i1 %tobool5, label %if.then6, label %if.end

if.then6:                                         ; preds = %if.then
  %10 = load i32* %lrc, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %10)
  br label %if.end

if.end:                                           ; preds = %if.then6, %if.then
  br label %if.end7

if.end7:                                          ; preds = %if.end, %while.end
  store i8 5, i8* %cl, align 1
  store i64 2, i64* %lr, align 8
  %11 = load i64* %lr, align 8
  %12 = load i8* %cl, align 1
  %conv8 = sext i8 %12 to i64
  %sub9 = sub nsw i64 %conv8, %11
  %conv10 = trunc i64 %sub9 to i8
  store i8 %conv10, i8* %cl, align 1
  %13 = load i8* %cl, align 1
  %conv11 = sext i8 %13 to i32
  %cmp12 = icmp ne i32 %conv11, 3
  br i1 %cmp12, label %if.then14, label %if.end19

if.then14:                                        ; preds = %if.end7
  store i32 102, i32* %lrc, align 4
  %14 = load i32* %prlc, align 4
  %tobool15 = icmp ne i32 %14, 0
  br i1 %tobool15, label %if.then16, label %if.end18

if.then16:                                        ; preds = %if.then14
  %15 = load i32* %lrc, align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %15)
  br label %if.end18

if.end18:                                         ; preds = %if.then16, %if.then14
  br label %if.end19

if.end19:                                         ; preds = %if.end18, %if.end7
  store i8 5, i8* %cl, align 1
  store i32 2, i32* %ur, align 4
  %16 = load i32* %ur, align 4
  %17 = load i8* %cl, align 1
  %conv20 = sext i8 %17 to i32
  %sub21 = sub i32 %conv20, %16
  %conv22 = trunc i32 %sub21 to i8
  store i8 %conv22, i8* %cl, align 1
  %18 = load i8* %cl, align 1
  %conv23 = sext i8 %18 to i32
  %cmp24 = icmp ne i32 %conv23, 3
  br i1 %cmp24, label %if.then26, label %if.end31

if.then26:                                        ; preds = %if.end19
  store i32 103, i32* %lrc, align 4
  %19 = load i32* %prlc, align 4
  %tobool27 = icmp ne i32 %19, 0
  br i1 %tobool27, label %if.then28, label %if.end30

if.then28:                                        ; preds = %if.then26
  %20 = load i32* %lrc, align 4
  %call29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %20)
  br label %if.end30

if.end30:                                         ; preds = %if.then28, %if.then26
  br label %if.end31

if.end31:                                         ; preds = %if.end30, %if.end19
  store i8 5, i8* %cl, align 1
  store float 2.000000e+00, float* %fr, align 4
  %21 = load float* %fr, align 4
  %22 = load i8* %cl, align 1
  %conv32 = sitofp i8 %22 to float
  %sub33 = fsub float %conv32, %21
  %conv34 = fptosi float %sub33 to i8
  store i8 %conv34, i8* %cl, align 1
  %23 = load i8* %cl, align 1
  %conv35 = sext i8 %23 to i32
  %cmp36 = icmp ne i32 %conv35, 3
  br i1 %cmp36, label %if.then38, label %if.end43

if.then38:                                        ; preds = %if.end31
  store i32 104, i32* %lrc, align 4
  %24 = load i32* %prlc, align 4
  %tobool39 = icmp ne i32 %24, 0
  br i1 %tobool39, label %if.then40, label %if.end42

if.then40:                                        ; preds = %if.then38
  %25 = load i32* %lrc, align 4
  %call41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %25)
  br label %if.end42

if.end42:                                         ; preds = %if.then40, %if.then38
  br label %if.end43

if.end43:                                         ; preds = %if.end42, %if.end31
  store i8 5, i8* %cl, align 1
  store double 2.000000e+00, double* %dr, align 8
  %26 = load double* %dr, align 8
  %27 = load i8* %cl, align 1
  %conv44 = sitofp i8 %27 to double
  %sub45 = fsub double %conv44, %26
  %conv46 = fptosi double %sub45 to i8
  store i8 %conv46, i8* %cl, align 1
  %28 = load i8* %cl, align 1
  %conv47 = sext i8 %28 to i32
  %cmp48 = icmp ne i32 %conv47, 3
  br i1 %cmp48, label %if.then50, label %if.end55

if.then50:                                        ; preds = %if.end43
  store i32 105, i32* %lrc, align 4
  %29 = load i32* %prlc, align 4
  %tobool51 = icmp ne i32 %29, 0
  br i1 %tobool51, label %if.then52, label %if.end54

if.then52:                                        ; preds = %if.then50
  %30 = load i32* %lrc, align 4
  %call53 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %30)
  br label %if.end54

if.end54:                                         ; preds = %if.then52, %if.then50
  br label %if.end55

if.end55:                                         ; preds = %if.end54, %if.end43
  store i16 5, i16* %sl, align 2
  store i8 2, i8* %cr, align 1
  %31 = load i8* %cr, align 1
  %conv56 = sext i8 %31 to i32
  %32 = load i16* %sl, align 2
  %conv57 = sext i16 %32 to i32
  %sub58 = sub nsw i32 %conv57, %conv56
  %conv59 = trunc i32 %sub58 to i16
  store i16 %conv59, i16* %sl, align 2
  %33 = load i16* %sl, align 2
  %conv60 = sext i16 %33 to i32
  %cmp61 = icmp ne i32 %conv60, 3
  br i1 %cmp61, label %if.then63, label %if.end68

if.then63:                                        ; preds = %if.end55
  store i32 106, i32* %lrc, align 4
  %34 = load i32* %prlc, align 4
  %tobool64 = icmp ne i32 %34, 0
  br i1 %tobool64, label %if.then65, label %if.end67

if.then65:                                        ; preds = %if.then63
  %35 = load i32* %lrc, align 4
  %call66 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %35)
  br label %if.end67

if.end67:                                         ; preds = %if.then65, %if.then63
  br label %if.end68

if.end68:                                         ; preds = %if.end67, %if.end55
  store i16 5, i16* %sl, align 2
  store i16 2, i16* %sr, align 2
  %36 = load i16* %sr, align 2
  %conv69 = sext i16 %36 to i32
  %37 = load i16* %sl, align 2
  %conv70 = sext i16 %37 to i32
  %sub71 = sub nsw i32 %conv70, %conv69
  %conv72 = trunc i32 %sub71 to i16
  store i16 %conv72, i16* %sl, align 2
  %38 = load i16* %sl, align 2
  %conv73 = sext i16 %38 to i32
  %cmp74 = icmp ne i32 %conv73, 3
  br i1 %cmp74, label %if.then76, label %if.end81

if.then76:                                        ; preds = %if.end68
  store i32 107, i32* %lrc, align 4
  %39 = load i32* %prlc, align 4
  %tobool77 = icmp ne i32 %39, 0
  br i1 %tobool77, label %if.then78, label %if.end80

if.then78:                                        ; preds = %if.then76
  %40 = load i32* %lrc, align 4
  %call79 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %40)
  br label %if.end80

if.end80:                                         ; preds = %if.then78, %if.then76
  br label %if.end81

if.end81:                                         ; preds = %if.end80, %if.end68
  store i16 5, i16* %sl, align 2
  store i32 2, i32* %ir, align 4
  %41 = load i32* %ir, align 4
  %42 = load i16* %sl, align 2
  %conv82 = sext i16 %42 to i32
  %sub83 = sub nsw i32 %conv82, %41
  %conv84 = trunc i32 %sub83 to i16
  store i16 %conv84, i16* %sl, align 2
  %43 = load i16* %sl, align 2
  %conv85 = sext i16 %43 to i32
  %cmp86 = icmp ne i32 %conv85, 3
  br i1 %cmp86, label %if.then88, label %if.end93

if.then88:                                        ; preds = %if.end81
  store i32 108, i32* %lrc, align 4
  %44 = load i32* %prlc, align 4
  %tobool89 = icmp ne i32 %44, 0
  br i1 %tobool89, label %if.then90, label %if.end92

if.then90:                                        ; preds = %if.then88
  %45 = load i32* %lrc, align 4
  %call91 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %45)
  br label %if.end92

if.end92:                                         ; preds = %if.then90, %if.then88
  br label %if.end93

if.end93:                                         ; preds = %if.end92, %if.end81
  store i16 5, i16* %sl, align 2
  store i64 2, i64* %lr, align 8
  %46 = load i64* %lr, align 8
  %47 = load i16* %sl, align 2
  %conv94 = sext i16 %47 to i64
  %sub95 = sub nsw i64 %conv94, %46
  %conv96 = trunc i64 %sub95 to i16
  store i16 %conv96, i16* %sl, align 2
  %48 = load i16* %sl, align 2
  %conv97 = sext i16 %48 to i32
  %cmp98 = icmp ne i32 %conv97, 3
  br i1 %cmp98, label %if.then100, label %if.end105

if.then100:                                       ; preds = %if.end93
  store i32 109, i32* %lrc, align 4
  %49 = load i32* %prlc, align 4
  %tobool101 = icmp ne i32 %49, 0
  br i1 %tobool101, label %if.then102, label %if.end104

if.then102:                                       ; preds = %if.then100
  %50 = load i32* %lrc, align 4
  %call103 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %50)
  br label %if.end104

if.end104:                                        ; preds = %if.then102, %if.then100
  br label %if.end105

if.end105:                                        ; preds = %if.end104, %if.end93
  store i16 5, i16* %sl, align 2
  store i32 2, i32* %ur, align 4
  %51 = load i32* %ur, align 4
  %52 = load i16* %sl, align 2
  %conv106 = sext i16 %52 to i32
  %sub107 = sub i32 %conv106, %51
  %conv108 = trunc i32 %sub107 to i16
  store i16 %conv108, i16* %sl, align 2
  %53 = load i16* %sl, align 2
  %conv109 = sext i16 %53 to i32
  %cmp110 = icmp ne i32 %conv109, 3
  br i1 %cmp110, label %if.then112, label %if.end117

if.then112:                                       ; preds = %if.end105
  store i32 110, i32* %lrc, align 4
  %54 = load i32* %prlc, align 4
  %tobool113 = icmp ne i32 %54, 0
  br i1 %tobool113, label %if.then114, label %if.end116

if.then114:                                       ; preds = %if.then112
  %55 = load i32* %lrc, align 4
  %call115 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %55)
  br label %if.end116

if.end116:                                        ; preds = %if.then114, %if.then112
  br label %if.end117

if.end117:                                        ; preds = %if.end116, %if.end105
  store i16 5, i16* %sl, align 2
  store float 2.000000e+00, float* %fr, align 4
  %56 = load float* %fr, align 4
  %57 = load i16* %sl, align 2
  %conv118 = sitofp i16 %57 to float
  %sub119 = fsub float %conv118, %56
  %conv120 = fptosi float %sub119 to i16
  store i16 %conv120, i16* %sl, align 2
  %58 = load i16* %sl, align 2
  %conv121 = sext i16 %58 to i32
  %cmp122 = icmp ne i32 %conv121, 3
  br i1 %cmp122, label %if.then124, label %if.end129

if.then124:                                       ; preds = %if.end117
  store i32 111, i32* %lrc, align 4
  %59 = load i32* %prlc, align 4
  %tobool125 = icmp ne i32 %59, 0
  br i1 %tobool125, label %if.then126, label %if.end128

if.then126:                                       ; preds = %if.then124
  %60 = load i32* %lrc, align 4
  %call127 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %60)
  br label %if.end128

if.end128:                                        ; preds = %if.then126, %if.then124
  br label %if.end129

if.end129:                                        ; preds = %if.end128, %if.end117
  store i16 5, i16* %sl, align 2
  store double 2.000000e+00, double* %dr, align 8
  %61 = load double* %dr, align 8
  %62 = load i16* %sl, align 2
  %conv130 = sitofp i16 %62 to double
  %sub131 = fsub double %conv130, %61
  %conv132 = fptosi double %sub131 to i16
  store i16 %conv132, i16* %sl, align 2
  %63 = load i16* %sl, align 2
  %conv133 = sext i16 %63 to i32
  %cmp134 = icmp ne i32 %conv133, 3
  br i1 %cmp134, label %if.then136, label %if.end141

if.then136:                                       ; preds = %if.end129
  store i32 112, i32* %lrc, align 4
  %64 = load i32* %prlc, align 4
  %tobool137 = icmp ne i32 %64, 0
  br i1 %tobool137, label %if.then138, label %if.end140

if.then138:                                       ; preds = %if.then136
  %65 = load i32* %lrc, align 4
  %call139 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %65)
  br label %if.end140

if.end140:                                        ; preds = %if.then138, %if.then136
  br label %if.end141

if.end141:                                        ; preds = %if.end140, %if.end129
  store i32 5, i32* %il, align 4
  store i8 2, i8* %cr, align 1
  %66 = load i8* %cr, align 1
  %conv142 = sext i8 %66 to i32
  %67 = load i32* %il, align 4
  %sub143 = sub nsw i32 %67, %conv142
  store i32 %sub143, i32* %il, align 4
  %68 = load i32* %il, align 4
  %cmp144 = icmp ne i32 %68, 3
  br i1 %cmp144, label %if.then146, label %if.end151

if.then146:                                       ; preds = %if.end141
  store i32 113, i32* %lrc, align 4
  %69 = load i32* %prlc, align 4
  %tobool147 = icmp ne i32 %69, 0
  br i1 %tobool147, label %if.then148, label %if.end150

if.then148:                                       ; preds = %if.then146
  %70 = load i32* %lrc, align 4
  %call149 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %70)
  br label %if.end150

if.end150:                                        ; preds = %if.then148, %if.then146
  br label %if.end151

if.end151:                                        ; preds = %if.end150, %if.end141
  store i32 5, i32* %il, align 4
  store i16 2, i16* %sr, align 2
  %71 = load i16* %sr, align 2
  %conv152 = sext i16 %71 to i32
  %72 = load i32* %il, align 4
  %sub153 = sub nsw i32 %72, %conv152
  store i32 %sub153, i32* %il, align 4
  %73 = load i32* %il, align 4
  %cmp154 = icmp ne i32 %73, 3
  br i1 %cmp154, label %if.then156, label %if.end161

if.then156:                                       ; preds = %if.end151
  store i32 114, i32* %lrc, align 4
  %74 = load i32* %prlc, align 4
  %tobool157 = icmp ne i32 %74, 0
  br i1 %tobool157, label %if.then158, label %if.end160

if.then158:                                       ; preds = %if.then156
  %75 = load i32* %lrc, align 4
  %call159 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %75)
  br label %if.end160

if.end160:                                        ; preds = %if.then158, %if.then156
  br label %if.end161

if.end161:                                        ; preds = %if.end160, %if.end151
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ir, align 4
  %76 = load i32* %ir, align 4
  %77 = load i32* %il, align 4
  %sub162 = sub nsw i32 %77, %76
  store i32 %sub162, i32* %il, align 4
  %78 = load i32* %il, align 4
  %cmp163 = icmp ne i32 %78, 3
  br i1 %cmp163, label %if.then165, label %if.end170

if.then165:                                       ; preds = %if.end161
  store i32 115, i32* %lrc, align 4
  %79 = load i32* %prlc, align 4
  %tobool166 = icmp ne i32 %79, 0
  br i1 %tobool166, label %if.then167, label %if.end169

if.then167:                                       ; preds = %if.then165
  %80 = load i32* %lrc, align 4
  %call168 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %80)
  br label %if.end169

if.end169:                                        ; preds = %if.then167, %if.then165
  br label %if.end170

if.end170:                                        ; preds = %if.end169, %if.end161
  store i32 5, i32* %il, align 4
  store i64 2, i64* %lr, align 8
  %81 = load i64* %lr, align 8
  %82 = load i32* %il, align 4
  %conv171 = sext i32 %82 to i64
  %sub172 = sub nsw i64 %conv171, %81
  %conv173 = trunc i64 %sub172 to i32
  store i32 %conv173, i32* %il, align 4
  %83 = load i32* %il, align 4
  %cmp174 = icmp ne i32 %83, 3
  br i1 %cmp174, label %if.then176, label %if.end181

if.then176:                                       ; preds = %if.end170
  store i32 116, i32* %lrc, align 4
  %84 = load i32* %prlc, align 4
  %tobool177 = icmp ne i32 %84, 0
  br i1 %tobool177, label %if.then178, label %if.end180

if.then178:                                       ; preds = %if.then176
  %85 = load i32* %lrc, align 4
  %call179 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %85)
  br label %if.end180

if.end180:                                        ; preds = %if.then178, %if.then176
  br label %if.end181

if.end181:                                        ; preds = %if.end180, %if.end170
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ur, align 4
  %86 = load i32* %ur, align 4
  %87 = load i32* %il, align 4
  %sub182 = sub i32 %87, %86
  store i32 %sub182, i32* %il, align 4
  %88 = load i32* %il, align 4
  %cmp183 = icmp ne i32 %88, 3
  br i1 %cmp183, label %if.then185, label %if.end190

if.then185:                                       ; preds = %if.end181
  store i32 117, i32* %lrc, align 4
  %89 = load i32* %prlc, align 4
  %tobool186 = icmp ne i32 %89, 0
  br i1 %tobool186, label %if.then187, label %if.end189

if.then187:                                       ; preds = %if.then185
  %90 = load i32* %lrc, align 4
  %call188 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %90)
  br label %if.end189

if.end189:                                        ; preds = %if.then187, %if.then185
  br label %if.end190

if.end190:                                        ; preds = %if.end189, %if.end181
  store i32 5, i32* %il, align 4
  store float 2.000000e+00, float* %fr, align 4
  %91 = load float* %fr, align 4
  %92 = load i32* %il, align 4
  %conv191 = sitofp i32 %92 to float
  %sub192 = fsub float %conv191, %91
  %conv193 = fptosi float %sub192 to i32
  store i32 %conv193, i32* %il, align 4
  %93 = load i32* %il, align 4
  %cmp194 = icmp ne i32 %93, 3
  br i1 %cmp194, label %if.then196, label %if.end201

if.then196:                                       ; preds = %if.end190
  store i32 118, i32* %lrc, align 4
  %94 = load i32* %prlc, align 4
  %tobool197 = icmp ne i32 %94, 0
  br i1 %tobool197, label %if.then198, label %if.end200

if.then198:                                       ; preds = %if.then196
  %95 = load i32* %lrc, align 4
  %call199 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %95)
  br label %if.end200

if.end200:                                        ; preds = %if.then198, %if.then196
  br label %if.end201

if.end201:                                        ; preds = %if.end200, %if.end190
  store i32 5, i32* %il, align 4
  store double 2.000000e+00, double* %dr, align 8
  %96 = load double* %dr, align 8
  %97 = load i32* %il, align 4
  %conv202 = sitofp i32 %97 to double
  %sub203 = fsub double %conv202, %96
  %conv204 = fptosi double %sub203 to i32
  store i32 %conv204, i32* %il, align 4
  %98 = load i32* %il, align 4
  %cmp205 = icmp ne i32 %98, 3
  br i1 %cmp205, label %if.then207, label %if.end212

if.then207:                                       ; preds = %if.end201
  store i32 119, i32* %lrc, align 4
  %99 = load i32* %prlc, align 4
  %tobool208 = icmp ne i32 %99, 0
  br i1 %tobool208, label %if.then209, label %if.end211

if.then209:                                       ; preds = %if.then207
  %100 = load i32* %lrc, align 4
  %call210 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %100)
  br label %if.end211

if.end211:                                        ; preds = %if.then209, %if.then207
  br label %if.end212

if.end212:                                        ; preds = %if.end211, %if.end201
  store i64 5, i64* %ll, align 8
  store i8 2, i8* %cr, align 1
  %101 = load i8* %cr, align 1
  %conv213 = sext i8 %101 to i64
  %102 = load i64* %ll, align 8
  %sub214 = sub nsw i64 %102, %conv213
  store i64 %sub214, i64* %ll, align 8
  %103 = load i64* %ll, align 8
  %cmp215 = icmp ne i64 %103, 3
  br i1 %cmp215, label %if.then217, label %if.end222

if.then217:                                       ; preds = %if.end212
  store i32 120, i32* %lrc, align 4
  %104 = load i32* %prlc, align 4
  %tobool218 = icmp ne i32 %104, 0
  br i1 %tobool218, label %if.then219, label %if.end221

if.then219:                                       ; preds = %if.then217
  %105 = load i32* %lrc, align 4
  %call220 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %105)
  br label %if.end221

if.end221:                                        ; preds = %if.then219, %if.then217
  br label %if.end222

if.end222:                                        ; preds = %if.end221, %if.end212
  store i64 5, i64* %ll, align 8
  store i16 2, i16* %sr, align 2
  %106 = load i16* %sr, align 2
  %conv223 = sext i16 %106 to i64
  %107 = load i64* %ll, align 8
  %sub224 = sub nsw i64 %107, %conv223
  store i64 %sub224, i64* %ll, align 8
  %108 = load i64* %ll, align 8
  %cmp225 = icmp ne i64 %108, 3
  br i1 %cmp225, label %if.then227, label %if.end232

if.then227:                                       ; preds = %if.end222
  store i32 121, i32* %lrc, align 4
  %109 = load i32* %prlc, align 4
  %tobool228 = icmp ne i32 %109, 0
  br i1 %tobool228, label %if.then229, label %if.end231

if.then229:                                       ; preds = %if.then227
  %110 = load i32* %lrc, align 4
  %call230 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %110)
  br label %if.end231

if.end231:                                        ; preds = %if.then229, %if.then227
  br label %if.end232

if.end232:                                        ; preds = %if.end231, %if.end222
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ir, align 4
  %111 = load i32* %ir, align 4
  %conv233 = sext i32 %111 to i64
  %112 = load i64* %ll, align 8
  %sub234 = sub nsw i64 %112, %conv233
  store i64 %sub234, i64* %ll, align 8
  %113 = load i64* %ll, align 8
  %cmp235 = icmp ne i64 %113, 3
  br i1 %cmp235, label %if.then237, label %if.end242

if.then237:                                       ; preds = %if.end232
  store i32 122, i32* %lrc, align 4
  %114 = load i32* %prlc, align 4
  %tobool238 = icmp ne i32 %114, 0
  br i1 %tobool238, label %if.then239, label %if.end241

if.then239:                                       ; preds = %if.then237
  %115 = load i32* %lrc, align 4
  %call240 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %115)
  br label %if.end241

if.end241:                                        ; preds = %if.then239, %if.then237
  br label %if.end242

if.end242:                                        ; preds = %if.end241, %if.end232
  store i64 5, i64* %ll, align 8
  store i64 2, i64* %lr, align 8
  %116 = load i64* %lr, align 8
  %117 = load i64* %ll, align 8
  %sub243 = sub nsw i64 %117, %116
  store i64 %sub243, i64* %ll, align 8
  %118 = load i64* %ll, align 8
  %cmp244 = icmp ne i64 %118, 3
  br i1 %cmp244, label %if.then246, label %if.end251

if.then246:                                       ; preds = %if.end242
  store i32 123, i32* %lrc, align 4
  %119 = load i32* %prlc, align 4
  %tobool247 = icmp ne i32 %119, 0
  br i1 %tobool247, label %if.then248, label %if.end250

if.then248:                                       ; preds = %if.then246
  %120 = load i32* %lrc, align 4
  %call249 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %120)
  br label %if.end250

if.end250:                                        ; preds = %if.then248, %if.then246
  br label %if.end251

if.end251:                                        ; preds = %if.end250, %if.end242
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ur, align 4
  %121 = load i32* %ur, align 4
  %conv252 = zext i32 %121 to i64
  %122 = load i64* %ll, align 8
  %sub253 = sub nsw i64 %122, %conv252
  store i64 %sub253, i64* %ll, align 8
  %123 = load i64* %ll, align 8
  %cmp254 = icmp ne i64 %123, 3
  br i1 %cmp254, label %if.then256, label %if.end261

if.then256:                                       ; preds = %if.end251
  store i32 124, i32* %lrc, align 4
  %124 = load i32* %prlc, align 4
  %tobool257 = icmp ne i32 %124, 0
  br i1 %tobool257, label %if.then258, label %if.end260

if.then258:                                       ; preds = %if.then256
  %125 = load i32* %lrc, align 4
  %call259 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %125)
  br label %if.end260

if.end260:                                        ; preds = %if.then258, %if.then256
  br label %if.end261

if.end261:                                        ; preds = %if.end260, %if.end251
  store i64 5, i64* %ll, align 8
  store float 2.000000e+00, float* %fr, align 4
  %126 = load float* %fr, align 4
  %127 = load i64* %ll, align 8
  %conv262 = sitofp i64 %127 to float
  %sub263 = fsub float %conv262, %126
  %conv264 = fptosi float %sub263 to i64
  store i64 %conv264, i64* %ll, align 8
  %128 = load i64* %ll, align 8
  %cmp265 = icmp ne i64 %128, 3
  br i1 %cmp265, label %if.then267, label %if.end272

if.then267:                                       ; preds = %if.end261
  store i32 125, i32* %lrc, align 4
  %129 = load i32* %prlc, align 4
  %tobool268 = icmp ne i32 %129, 0
  br i1 %tobool268, label %if.then269, label %if.end271

if.then269:                                       ; preds = %if.then267
  %130 = load i32* %lrc, align 4
  %call270 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %130)
  br label %if.end271

if.end271:                                        ; preds = %if.then269, %if.then267
  br label %if.end272

if.end272:                                        ; preds = %if.end271, %if.end261
  store i64 5, i64* %ll, align 8
  store double 2.000000e+00, double* %dr, align 8
  %131 = load double* %dr, align 8
  %132 = load i64* %ll, align 8
  %conv273 = sitofp i64 %132 to double
  %sub274 = fsub double %conv273, %131
  %conv275 = fptosi double %sub274 to i64
  store i64 %conv275, i64* %ll, align 8
  %133 = load i64* %ll, align 8
  %cmp276 = icmp ne i64 %133, 3
  br i1 %cmp276, label %if.then278, label %if.end283

if.then278:                                       ; preds = %if.end272
  store i32 126, i32* %lrc, align 4
  %134 = load i32* %prlc, align 4
  %tobool279 = icmp ne i32 %134, 0
  br i1 %tobool279, label %if.then280, label %if.end282

if.then280:                                       ; preds = %if.then278
  %135 = load i32* %lrc, align 4
  %call281 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %135)
  br label %if.end282

if.end282:                                        ; preds = %if.then280, %if.then278
  br label %if.end283

if.end283:                                        ; preds = %if.end282, %if.end272
  store i32 5, i32* %ul, align 4
  store i8 2, i8* %cr, align 1
  %136 = load i8* %cr, align 1
  %conv284 = sext i8 %136 to i32
  %137 = load i32* %ul, align 4
  %sub285 = sub i32 %137, %conv284
  store i32 %sub285, i32* %ul, align 4
  %138 = load i32* %ul, align 4
  %cmp286 = icmp ne i32 %138, 3
  br i1 %cmp286, label %if.then288, label %if.end293

if.then288:                                       ; preds = %if.end283
  store i32 127, i32* %lrc, align 4
  %139 = load i32* %prlc, align 4
  %tobool289 = icmp ne i32 %139, 0
  br i1 %tobool289, label %if.then290, label %if.end292

if.then290:                                       ; preds = %if.then288
  %140 = load i32* %lrc, align 4
  %call291 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %140)
  br label %if.end292

if.end292:                                        ; preds = %if.then290, %if.then288
  br label %if.end293

if.end293:                                        ; preds = %if.end292, %if.end283
  store i32 5, i32* %ul, align 4
  store i16 2, i16* %sr, align 2
  %141 = load i16* %sr, align 2
  %conv294 = sext i16 %141 to i32
  %142 = load i32* %ul, align 4
  %sub295 = sub i32 %142, %conv294
  store i32 %sub295, i32* %ul, align 4
  %143 = load i32* %ul, align 4
  %cmp296 = icmp ne i32 %143, 3
  br i1 %cmp296, label %if.then298, label %if.end303

if.then298:                                       ; preds = %if.end293
  store i32 128, i32* %lrc, align 4
  %144 = load i32* %prlc, align 4
  %tobool299 = icmp ne i32 %144, 0
  br i1 %tobool299, label %if.then300, label %if.end302

if.then300:                                       ; preds = %if.then298
  %145 = load i32* %lrc, align 4
  %call301 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %145)
  br label %if.end302

if.end302:                                        ; preds = %if.then300, %if.then298
  br label %if.end303

if.end303:                                        ; preds = %if.end302, %if.end293
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ir, align 4
  %146 = load i32* %ir, align 4
  %147 = load i32* %ul, align 4
  %sub304 = sub i32 %147, %146
  store i32 %sub304, i32* %ul, align 4
  %148 = load i32* %ul, align 4
  %cmp305 = icmp ne i32 %148, 3
  br i1 %cmp305, label %if.then307, label %if.end312

if.then307:                                       ; preds = %if.end303
  store i32 129, i32* %lrc, align 4
  %149 = load i32* %prlc, align 4
  %tobool308 = icmp ne i32 %149, 0
  br i1 %tobool308, label %if.then309, label %if.end311

if.then309:                                       ; preds = %if.then307
  %150 = load i32* %lrc, align 4
  %call310 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %150)
  br label %if.end311

if.end311:                                        ; preds = %if.then309, %if.then307
  br label %if.end312

if.end312:                                        ; preds = %if.end311, %if.end303
  store i32 5, i32* %ul, align 4
  store i64 2, i64* %lr, align 8
  %151 = load i64* %lr, align 8
  %152 = load i32* %ul, align 4
  %conv313 = zext i32 %152 to i64
  %sub314 = sub nsw i64 %conv313, %151
  %conv315 = trunc i64 %sub314 to i32
  store i32 %conv315, i32* %ul, align 4
  %153 = load i32* %ul, align 4
  %cmp316 = icmp ne i32 %153, 3
  br i1 %cmp316, label %if.then318, label %if.end323

if.then318:                                       ; preds = %if.end312
  store i32 130, i32* %lrc, align 4
  %154 = load i32* %prlc, align 4
  %tobool319 = icmp ne i32 %154, 0
  br i1 %tobool319, label %if.then320, label %if.end322

if.then320:                                       ; preds = %if.then318
  %155 = load i32* %lrc, align 4
  %call321 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %155)
  br label %if.end322

if.end322:                                        ; preds = %if.then320, %if.then318
  br label %if.end323

if.end323:                                        ; preds = %if.end322, %if.end312
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ur, align 4
  %156 = load i32* %ur, align 4
  %157 = load i32* %ul, align 4
  %sub324 = sub i32 %157, %156
  store i32 %sub324, i32* %ul, align 4
  %158 = load i32* %ul, align 4
  %cmp325 = icmp ne i32 %158, 3
  br i1 %cmp325, label %if.then327, label %if.end332

if.then327:                                       ; preds = %if.end323
  store i32 131, i32* %lrc, align 4
  %159 = load i32* %prlc, align 4
  %tobool328 = icmp ne i32 %159, 0
  br i1 %tobool328, label %if.then329, label %if.end331

if.then329:                                       ; preds = %if.then327
  %160 = load i32* %lrc, align 4
  %call330 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %160)
  br label %if.end331

if.end331:                                        ; preds = %if.then329, %if.then327
  br label %if.end332

if.end332:                                        ; preds = %if.end331, %if.end323
  store i32 5, i32* %ul, align 4
  store float 2.000000e+00, float* %fr, align 4
  %161 = load float* %fr, align 4
  %162 = load i32* %ul, align 4
  %conv333 = uitofp i32 %162 to float
  %sub334 = fsub float %conv333, %161
  %conv335 = fptoui float %sub334 to i32
  store i32 %conv335, i32* %ul, align 4
  %163 = load i32* %ul, align 4
  %cmp336 = icmp ne i32 %163, 3
  br i1 %cmp336, label %if.then338, label %if.end343

if.then338:                                       ; preds = %if.end332
  store i32 132, i32* %lrc, align 4
  %164 = load i32* %prlc, align 4
  %tobool339 = icmp ne i32 %164, 0
  br i1 %tobool339, label %if.then340, label %if.end342

if.then340:                                       ; preds = %if.then338
  %165 = load i32* %lrc, align 4
  %call341 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %165)
  br label %if.end342

if.end342:                                        ; preds = %if.then340, %if.then338
  br label %if.end343

if.end343:                                        ; preds = %if.end342, %if.end332
  store i32 5, i32* %ul, align 4
  store double 2.000000e+00, double* %dr, align 8
  %166 = load double* %dr, align 8
  %167 = load i32* %ul, align 4
  %conv344 = uitofp i32 %167 to double
  %sub345 = fsub double %conv344, %166
  %conv346 = fptoui double %sub345 to i32
  store i32 %conv346, i32* %ul, align 4
  %168 = load i32* %ul, align 4
  %cmp347 = icmp ne i32 %168, 3
  br i1 %cmp347, label %if.then349, label %if.end354

if.then349:                                       ; preds = %if.end343
  store i32 133, i32* %lrc, align 4
  %169 = load i32* %prlc, align 4
  %tobool350 = icmp ne i32 %169, 0
  br i1 %tobool350, label %if.then351, label %if.end353

if.then351:                                       ; preds = %if.then349
  %170 = load i32* %lrc, align 4
  %call352 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %170)
  br label %if.end353

if.end353:                                        ; preds = %if.then351, %if.then349
  br label %if.end354

if.end354:                                        ; preds = %if.end353, %if.end343
  store float 5.000000e+00, float* %fl, align 4
  store i8 2, i8* %cr, align 1
  %171 = load i8* %cr, align 1
  %conv355 = sext i8 %171 to i32
  %conv356 = sitofp i32 %conv355 to float
  %172 = load float* %fl, align 4
  %sub357 = fsub float %172, %conv356
  store float %sub357, float* %fl, align 4
  %173 = load float* %fl, align 4
  %cmp358 = fcmp une float %173, 3.000000e+00
  br i1 %cmp358, label %if.then360, label %if.end365

if.then360:                                       ; preds = %if.end354
  store i32 134, i32* %lrc, align 4
  %174 = load i32* %prlc, align 4
  %tobool361 = icmp ne i32 %174, 0
  br i1 %tobool361, label %if.then362, label %if.end364

if.then362:                                       ; preds = %if.then360
  %175 = load i32* %lrc, align 4
  %call363 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %175)
  br label %if.end364

if.end364:                                        ; preds = %if.then362, %if.then360
  br label %if.end365

if.end365:                                        ; preds = %if.end364, %if.end354
  store float 5.000000e+00, float* %fl, align 4
  store i16 2, i16* %sr, align 2
  %176 = load i16* %sr, align 2
  %conv366 = sext i16 %176 to i32
  %conv367 = sitofp i32 %conv366 to float
  %177 = load float* %fl, align 4
  %sub368 = fsub float %177, %conv367
  store float %sub368, float* %fl, align 4
  %178 = load float* %fl, align 4
  %cmp369 = fcmp une float %178, 3.000000e+00
  br i1 %cmp369, label %if.then371, label %if.end376

if.then371:                                       ; preds = %if.end365
  store i32 135, i32* %lrc, align 4
  %179 = load i32* %prlc, align 4
  %tobool372 = icmp ne i32 %179, 0
  br i1 %tobool372, label %if.then373, label %if.end375

if.then373:                                       ; preds = %if.then371
  %180 = load i32* %lrc, align 4
  %call374 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %180)
  br label %if.end375

if.end375:                                        ; preds = %if.then373, %if.then371
  br label %if.end376

if.end376:                                        ; preds = %if.end375, %if.end365
  store float 5.000000e+00, float* %fl, align 4
  store i32 2, i32* %ir, align 4
  %181 = load i32* %ir, align 4
  %conv377 = sitofp i32 %181 to float
  %182 = load float* %fl, align 4
  %sub378 = fsub float %182, %conv377
  store float %sub378, float* %fl, align 4
  %183 = load float* %fl, align 4
  %cmp379 = fcmp une float %183, 3.000000e+00
  br i1 %cmp379, label %if.then381, label %if.end386

if.then381:                                       ; preds = %if.end376
  store i32 136, i32* %lrc, align 4
  %184 = load i32* %prlc, align 4
  %tobool382 = icmp ne i32 %184, 0
  br i1 %tobool382, label %if.then383, label %if.end385

if.then383:                                       ; preds = %if.then381
  %185 = load i32* %lrc, align 4
  %call384 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %185)
  br label %if.end385

if.end385:                                        ; preds = %if.then383, %if.then381
  br label %if.end386

if.end386:                                        ; preds = %if.end385, %if.end376
  store float 5.000000e+00, float* %fl, align 4
  store i64 2, i64* %lr, align 8
  %186 = load i64* %lr, align 8
  %conv387 = sitofp i64 %186 to float
  %187 = load float* %fl, align 4
  %sub388 = fsub float %187, %conv387
  store float %sub388, float* %fl, align 4
  %188 = load float* %fl, align 4
  %cmp389 = fcmp une float %188, 3.000000e+00
  br i1 %cmp389, label %if.then391, label %if.end396

if.then391:                                       ; preds = %if.end386
  store i32 137, i32* %lrc, align 4
  %189 = load i32* %prlc, align 4
  %tobool392 = icmp ne i32 %189, 0
  br i1 %tobool392, label %if.then393, label %if.end395

if.then393:                                       ; preds = %if.then391
  %190 = load i32* %lrc, align 4
  %call394 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %190)
  br label %if.end395

if.end395:                                        ; preds = %if.then393, %if.then391
  br label %if.end396

if.end396:                                        ; preds = %if.end395, %if.end386
  store float 5.000000e+00, float* %fl, align 4
  store i32 2, i32* %ur, align 4
  %191 = load i32* %ur, align 4
  %conv397 = uitofp i32 %191 to float
  %192 = load float* %fl, align 4
  %sub398 = fsub float %192, %conv397
  store float %sub398, float* %fl, align 4
  %193 = load float* %fl, align 4
  %cmp399 = fcmp une float %193, 3.000000e+00
  br i1 %cmp399, label %if.then401, label %if.end406

if.then401:                                       ; preds = %if.end396
  store i32 138, i32* %lrc, align 4
  %194 = load i32* %prlc, align 4
  %tobool402 = icmp ne i32 %194, 0
  br i1 %tobool402, label %if.then403, label %if.end405

if.then403:                                       ; preds = %if.then401
  %195 = load i32* %lrc, align 4
  %call404 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %195)
  br label %if.end405

if.end405:                                        ; preds = %if.then403, %if.then401
  br label %if.end406

if.end406:                                        ; preds = %if.end405, %if.end396
  store float 5.000000e+00, float* %fl, align 4
  store float 2.000000e+00, float* %fr, align 4
  %196 = load float* %fr, align 4
  %197 = load float* %fl, align 4
  %sub407 = fsub float %197, %196
  store float %sub407, float* %fl, align 4
  %198 = load float* %fl, align 4
  %cmp408 = fcmp une float %198, 3.000000e+00
  br i1 %cmp408, label %if.then410, label %if.end415

if.then410:                                       ; preds = %if.end406
  store i32 139, i32* %lrc, align 4
  %199 = load i32* %prlc, align 4
  %tobool411 = icmp ne i32 %199, 0
  br i1 %tobool411, label %if.then412, label %if.end414

if.then412:                                       ; preds = %if.then410
  %200 = load i32* %lrc, align 4
  %call413 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %200)
  br label %if.end414

if.end414:                                        ; preds = %if.then412, %if.then410
  br label %if.end415

if.end415:                                        ; preds = %if.end414, %if.end406
  store float 5.000000e+00, float* %fl, align 4
  store double 2.000000e+00, double* %dr, align 8
  %201 = load double* %dr, align 8
  %202 = load float* %fl, align 4
  %conv416 = fpext float %202 to double
  %sub417 = fsub double %conv416, %201
  %conv418 = fptrunc double %sub417 to float
  store float %conv418, float* %fl, align 4
  %203 = load float* %fl, align 4
  %cmp419 = fcmp une float %203, 3.000000e+00
  br i1 %cmp419, label %if.then421, label %if.end426

if.then421:                                       ; preds = %if.end415
  store i32 140, i32* %lrc, align 4
  %204 = load i32* %prlc, align 4
  %tobool422 = icmp ne i32 %204, 0
  br i1 %tobool422, label %if.then423, label %if.end425

if.then423:                                       ; preds = %if.then421
  %205 = load i32* %lrc, align 4
  %call424 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %205)
  br label %if.end425

if.end425:                                        ; preds = %if.then423, %if.then421
  br label %if.end426

if.end426:                                        ; preds = %if.end425, %if.end415
  store double 5.000000e+00, double* %dl, align 8
  store i8 2, i8* %cr, align 1
  %206 = load i8* %cr, align 1
  %conv427 = sext i8 %206 to i32
  %conv428 = sitofp i32 %conv427 to double
  %207 = load double* %dl, align 8
  %sub429 = fsub double %207, %conv428
  store double %sub429, double* %dl, align 8
  %208 = load double* %dl, align 8
  %cmp430 = fcmp une double %208, 3.000000e+00
  br i1 %cmp430, label %if.then432, label %if.end437

if.then432:                                       ; preds = %if.end426
  store i32 141, i32* %lrc, align 4
  %209 = load i32* %prlc, align 4
  %tobool433 = icmp ne i32 %209, 0
  br i1 %tobool433, label %if.then434, label %if.end436

if.then434:                                       ; preds = %if.then432
  %210 = load i32* %lrc, align 4
  %call435 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %210)
  br label %if.end436

if.end436:                                        ; preds = %if.then434, %if.then432
  br label %if.end437

if.end437:                                        ; preds = %if.end436, %if.end426
  store double 5.000000e+00, double* %dl, align 8
  store i16 2, i16* %sr, align 2
  %211 = load i16* %sr, align 2
  %conv438 = sext i16 %211 to i32
  %conv439 = sitofp i32 %conv438 to double
  %212 = load double* %dl, align 8
  %sub440 = fsub double %212, %conv439
  store double %sub440, double* %dl, align 8
  %213 = load double* %dl, align 8
  %cmp441 = fcmp une double %213, 3.000000e+00
  br i1 %cmp441, label %if.then443, label %if.end448

if.then443:                                       ; preds = %if.end437
  store i32 142, i32* %lrc, align 4
  %214 = load i32* %prlc, align 4
  %tobool444 = icmp ne i32 %214, 0
  br i1 %tobool444, label %if.then445, label %if.end447

if.then445:                                       ; preds = %if.then443
  %215 = load i32* %lrc, align 4
  %call446 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %215)
  br label %if.end447

if.end447:                                        ; preds = %if.then445, %if.then443
  br label %if.end448

if.end448:                                        ; preds = %if.end447, %if.end437
  store double 5.000000e+00, double* %dl, align 8
  store i32 2, i32* %ir, align 4
  %216 = load i32* %ir, align 4
  %conv449 = sitofp i32 %216 to double
  %217 = load double* %dl, align 8
  %sub450 = fsub double %217, %conv449
  store double %sub450, double* %dl, align 8
  %218 = load double* %dl, align 8
  %cmp451 = fcmp une double %218, 3.000000e+00
  br i1 %cmp451, label %if.then453, label %if.end458

if.then453:                                       ; preds = %if.end448
  store i32 143, i32* %lrc, align 4
  %219 = load i32* %prlc, align 4
  %tobool454 = icmp ne i32 %219, 0
  br i1 %tobool454, label %if.then455, label %if.end457

if.then455:                                       ; preds = %if.then453
  %220 = load i32* %lrc, align 4
  %call456 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %220)
  br label %if.end457

if.end457:                                        ; preds = %if.then455, %if.then453
  br label %if.end458

if.end458:                                        ; preds = %if.end457, %if.end448
  store double 5.000000e+00, double* %dl, align 8
  store i64 2, i64* %lr, align 8
  %221 = load i64* %lr, align 8
  %conv459 = sitofp i64 %221 to double
  %222 = load double* %dl, align 8
  %sub460 = fsub double %222, %conv459
  store double %sub460, double* %dl, align 8
  %223 = load double* %dl, align 8
  %cmp461 = fcmp une double %223, 3.000000e+00
  br i1 %cmp461, label %if.then463, label %if.end468

if.then463:                                       ; preds = %if.end458
  store i32 144, i32* %lrc, align 4
  %224 = load i32* %prlc, align 4
  %tobool464 = icmp ne i32 %224, 0
  br i1 %tobool464, label %if.then465, label %if.end467

if.then465:                                       ; preds = %if.then463
  %225 = load i32* %lrc, align 4
  %call466 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %225)
  br label %if.end467

if.end467:                                        ; preds = %if.then465, %if.then463
  br label %if.end468

if.end468:                                        ; preds = %if.end467, %if.end458
  store double 5.000000e+00, double* %dl, align 8
  store i32 2, i32* %ur, align 4
  %226 = load i32* %ur, align 4
  %conv469 = uitofp i32 %226 to double
  %227 = load double* %dl, align 8
  %sub470 = fsub double %227, %conv469
  store double %sub470, double* %dl, align 8
  %228 = load double* %dl, align 8
  %cmp471 = fcmp une double %228, 3.000000e+00
  br i1 %cmp471, label %if.then473, label %if.end478

if.then473:                                       ; preds = %if.end468
  store i32 145, i32* %lrc, align 4
  %229 = load i32* %prlc, align 4
  %tobool474 = icmp ne i32 %229, 0
  br i1 %tobool474, label %if.then475, label %if.end477

if.then475:                                       ; preds = %if.then473
  %230 = load i32* %lrc, align 4
  %call476 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %230)
  br label %if.end477

if.end477:                                        ; preds = %if.then475, %if.then473
  br label %if.end478

if.end478:                                        ; preds = %if.end477, %if.end468
  store double 5.000000e+00, double* %dl, align 8
  store float 2.000000e+00, float* %fr, align 4
  %231 = load float* %fr, align 4
  %conv479 = fpext float %231 to double
  %232 = load double* %dl, align 8
  %sub480 = fsub double %232, %conv479
  store double %sub480, double* %dl, align 8
  %233 = load double* %dl, align 8
  %cmp481 = fcmp une double %233, 3.000000e+00
  br i1 %cmp481, label %if.then483, label %if.end488

if.then483:                                       ; preds = %if.end478
  store i32 146, i32* %lrc, align 4
  %234 = load i32* %prlc, align 4
  %tobool484 = icmp ne i32 %234, 0
  br i1 %tobool484, label %if.then485, label %if.end487

if.then485:                                       ; preds = %if.then483
  %235 = load i32* %lrc, align 4
  %call486 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %235)
  br label %if.end487

if.end487:                                        ; preds = %if.then485, %if.then483
  br label %if.end488

if.end488:                                        ; preds = %if.end487, %if.end478
  store double 5.000000e+00, double* %dl, align 8
  store double 2.000000e+00, double* %dr, align 8
  %236 = load double* %dr, align 8
  %237 = load double* %dl, align 8
  %sub489 = fsub double %237, %236
  store double %sub489, double* %dl, align 8
  %238 = load double* %dl, align 8
  %cmp490 = fcmp une double %238, 3.000000e+00
  br i1 %cmp490, label %if.then492, label %if.end497

if.then492:                                       ; preds = %if.end488
  store i32 147, i32* %lrc, align 4
  %239 = load i32* %prlc, align 4
  %tobool493 = icmp ne i32 %239, 0
  br i1 %tobool493, label %if.then494, label %if.end496

if.then494:                                       ; preds = %if.then492
  %240 = load i32* %lrc, align 4
  %call495 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %240)
  br label %if.end496

if.end496:                                        ; preds = %if.then494, %if.then492
  br label %if.end497

if.end497:                                        ; preds = %if.end496, %if.end488
  store i8 5, i8* %cl, align 1
  store i8 2, i8* %cr, align 1
  %241 = load i8* %cr, align 1
  %conv498 = sext i8 %241 to i32
  %242 = load i8* %cl, align 1
  %conv499 = sext i8 %242 to i32
  %mul = mul nsw i32 %conv499, %conv498
  %conv500 = trunc i32 %mul to i8
  store i8 %conv500, i8* %cl, align 1
  %243 = load i8* %cl, align 1
  %conv501 = sext i8 %243 to i32
  %cmp502 = icmp ne i32 %conv501, 10
  br i1 %cmp502, label %if.then504, label %if.end509

if.then504:                                       ; preds = %if.end497
  store i32 148, i32* %lrc, align 4
  %244 = load i32* %prlc, align 4
  %tobool505 = icmp ne i32 %244, 0
  br i1 %tobool505, label %if.then506, label %if.end508

if.then506:                                       ; preds = %if.then504
  %245 = load i32* %lrc, align 4
  %call507 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %245)
  br label %if.end508

if.end508:                                        ; preds = %if.then506, %if.then504
  br label %if.end509

if.end509:                                        ; preds = %if.end508, %if.end497
  store i8 5, i8* %cl, align 1
  store i16 2, i16* %sr, align 2
  %246 = load i16* %sr, align 2
  %conv510 = sext i16 %246 to i32
  %247 = load i8* %cl, align 1
  %conv511 = sext i8 %247 to i32
  %mul512 = mul nsw i32 %conv511, %conv510
  %conv513 = trunc i32 %mul512 to i8
  store i8 %conv513, i8* %cl, align 1
  %248 = load i8* %cl, align 1
  %conv514 = sext i8 %248 to i32
  %cmp515 = icmp ne i32 %conv514, 10
  br i1 %cmp515, label %if.then517, label %if.end522

if.then517:                                       ; preds = %if.end509
  store i32 149, i32* %lrc, align 4
  %249 = load i32* %prlc, align 4
  %tobool518 = icmp ne i32 %249, 0
  br i1 %tobool518, label %if.then519, label %if.end521

if.then519:                                       ; preds = %if.then517
  %250 = load i32* %lrc, align 4
  %call520 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %250)
  br label %if.end521

if.end521:                                        ; preds = %if.then519, %if.then517
  br label %if.end522

if.end522:                                        ; preds = %if.end521, %if.end509
  store i8 5, i8* %cl, align 1
  store i32 2, i32* %ir, align 4
  %251 = load i32* %ir, align 4
  %252 = load i8* %cl, align 1
  %conv523 = sext i8 %252 to i32
  %mul524 = mul nsw i32 %conv523, %251
  %conv525 = trunc i32 %mul524 to i8
  store i8 %conv525, i8* %cl, align 1
  %253 = load i8* %cl, align 1
  %conv526 = sext i8 %253 to i32
  %cmp527 = icmp ne i32 %conv526, 10
  br i1 %cmp527, label %if.then529, label %if.end534

if.then529:                                       ; preds = %if.end522
  store i32 150, i32* %lrc, align 4
  %254 = load i32* %prlc, align 4
  %tobool530 = icmp ne i32 %254, 0
  br i1 %tobool530, label %if.then531, label %if.end533

if.then531:                                       ; preds = %if.then529
  %255 = load i32* %lrc, align 4
  %call532 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %255)
  br label %if.end533

if.end533:                                        ; preds = %if.then531, %if.then529
  br label %if.end534

if.end534:                                        ; preds = %if.end533, %if.end522
  %256 = load i32* %lrc, align 4
  %cmp535 = icmp ne i32 %256, 0
  br i1 %cmp535, label %if.then537, label %if.end543

if.then537:                                       ; preds = %if.end534
  store i32 1, i32* %rc, align 4
  %257 = load %struct.defs** %pd0.addr, align 8
  %flgd = getelementptr inbounds %struct.defs* %257, i32 0, i32 11
  %258 = load i32* %flgd, align 4
  %cmp538 = icmp ne i32 %258, 0
  br i1 %cmp538, label %if.then540, label %if.end542

if.then540:                                       ; preds = %if.then537
  %call541 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @sec.s714er, i32 0, i32 0), i32 1)
  br label %if.end542

if.end542:                                        ; preds = %if.then540, %if.then537
  br label %if.end543

if.end543:                                        ; preds = %if.end542, %if.end534
  %259 = load i32* %rc, align 4
  ret i32 %259
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
