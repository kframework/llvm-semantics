; ModuleID = '/home/david/src/c-semantics/tests/unitTests/cq-20-s714-d.c'
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
  store i64 2, i64* %lr, align 8
  %6 = load i64* %lr, align 8
  %7 = load i8* %cl, align 1
  %conv = sext i8 %7 to i64
  %mul = mul nsw i64 %conv, %6
  %conv2 = trunc i64 %mul to i8
  store i8 %conv2, i8* %cl, align 1
  %8 = load i8* %cl, align 1
  %conv3 = sext i8 %8 to i32
  %cmp = icmp ne i32 %conv3, 10
  br i1 %cmp, label %if.then, label %if.end7

if.then:                                          ; preds = %while.end
  store i32 151, i32* %lrc, align 4
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
  store i32 2, i32* %ur, align 4
  %11 = load i32* %ur, align 4
  %12 = load i8* %cl, align 1
  %conv8 = sext i8 %12 to i32
  %mul9 = mul i32 %conv8, %11
  %conv10 = trunc i32 %mul9 to i8
  store i8 %conv10, i8* %cl, align 1
  %13 = load i8* %cl, align 1
  %conv11 = sext i8 %13 to i32
  %cmp12 = icmp ne i32 %conv11, 10
  br i1 %cmp12, label %if.then14, label %if.end19

if.then14:                                        ; preds = %if.end7
  store i32 152, i32* %lrc, align 4
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
  store float 2.000000e+00, float* %fr, align 4
  %16 = load float* %fr, align 4
  %17 = load i8* %cl, align 1
  %conv20 = sitofp i8 %17 to float
  %mul21 = fmul float %conv20, %16
  %conv22 = fptosi float %mul21 to i8
  store i8 %conv22, i8* %cl, align 1
  %18 = load i8* %cl, align 1
  %conv23 = sext i8 %18 to i32
  %cmp24 = icmp ne i32 %conv23, 10
  br i1 %cmp24, label %if.then26, label %if.end31

if.then26:                                        ; preds = %if.end19
  store i32 153, i32* %lrc, align 4
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
  store double 2.000000e+00, double* %dr, align 8
  %21 = load double* %dr, align 8
  %22 = load i8* %cl, align 1
  %conv32 = sitofp i8 %22 to double
  %mul33 = fmul double %conv32, %21
  %conv34 = fptosi double %mul33 to i8
  store i8 %conv34, i8* %cl, align 1
  %23 = load i8* %cl, align 1
  %conv35 = sext i8 %23 to i32
  %cmp36 = icmp ne i32 %conv35, 10
  br i1 %cmp36, label %if.then38, label %if.end43

if.then38:                                        ; preds = %if.end31
  store i32 154, i32* %lrc, align 4
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
  store i16 5, i16* %sl, align 2
  store i8 2, i8* %cr, align 1
  %26 = load i8* %cr, align 1
  %conv44 = sext i8 %26 to i32
  %27 = load i16* %sl, align 2
  %conv45 = sext i16 %27 to i32
  %mul46 = mul nsw i32 %conv45, %conv44
  %conv47 = trunc i32 %mul46 to i16
  store i16 %conv47, i16* %sl, align 2
  %28 = load i16* %sl, align 2
  %conv48 = sext i16 %28 to i32
  %cmp49 = icmp ne i32 %conv48, 10
  br i1 %cmp49, label %if.then51, label %if.end56

if.then51:                                        ; preds = %if.end43
  store i32 155, i32* %lrc, align 4
  %29 = load i32* %prlc, align 4
  %tobool52 = icmp ne i32 %29, 0
  br i1 %tobool52, label %if.then53, label %if.end55

if.then53:                                        ; preds = %if.then51
  %30 = load i32* %lrc, align 4
  %call54 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %30)
  br label %if.end55

if.end55:                                         ; preds = %if.then53, %if.then51
  br label %if.end56

if.end56:                                         ; preds = %if.end55, %if.end43
  store i16 5, i16* %sl, align 2
  store i16 2, i16* %sr, align 2
  %31 = load i16* %sr, align 2
  %conv57 = sext i16 %31 to i32
  %32 = load i16* %sl, align 2
  %conv58 = sext i16 %32 to i32
  %mul59 = mul nsw i32 %conv58, %conv57
  %conv60 = trunc i32 %mul59 to i16
  store i16 %conv60, i16* %sl, align 2
  %33 = load i16* %sl, align 2
  %conv61 = sext i16 %33 to i32
  %cmp62 = icmp ne i32 %conv61, 10
  br i1 %cmp62, label %if.then64, label %if.end69

if.then64:                                        ; preds = %if.end56
  store i32 156, i32* %lrc, align 4
  %34 = load i32* %prlc, align 4
  %tobool65 = icmp ne i32 %34, 0
  br i1 %tobool65, label %if.then66, label %if.end68

if.then66:                                        ; preds = %if.then64
  %35 = load i32* %lrc, align 4
  %call67 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %35)
  br label %if.end68

if.end68:                                         ; preds = %if.then66, %if.then64
  br label %if.end69

if.end69:                                         ; preds = %if.end68, %if.end56
  store i16 5, i16* %sl, align 2
  store i32 2, i32* %ir, align 4
  %36 = load i32* %ir, align 4
  %37 = load i16* %sl, align 2
  %conv70 = sext i16 %37 to i32
  %mul71 = mul nsw i32 %conv70, %36
  %conv72 = trunc i32 %mul71 to i16
  store i16 %conv72, i16* %sl, align 2
  %38 = load i16* %sl, align 2
  %conv73 = sext i16 %38 to i32
  %cmp74 = icmp ne i32 %conv73, 10
  br i1 %cmp74, label %if.then76, label %if.end81

if.then76:                                        ; preds = %if.end69
  store i32 157, i32* %lrc, align 4
  %39 = load i32* %prlc, align 4
  %tobool77 = icmp ne i32 %39, 0
  br i1 %tobool77, label %if.then78, label %if.end80

if.then78:                                        ; preds = %if.then76
  %40 = load i32* %lrc, align 4
  %call79 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %40)
  br label %if.end80

if.end80:                                         ; preds = %if.then78, %if.then76
  br label %if.end81

if.end81:                                         ; preds = %if.end80, %if.end69
  store i16 5, i16* %sl, align 2
  store i64 2, i64* %lr, align 8
  %41 = load i64* %lr, align 8
  %42 = load i16* %sl, align 2
  %conv82 = sext i16 %42 to i64
  %mul83 = mul nsw i64 %conv82, %41
  %conv84 = trunc i64 %mul83 to i16
  store i16 %conv84, i16* %sl, align 2
  %43 = load i16* %sl, align 2
  %conv85 = sext i16 %43 to i32
  %cmp86 = icmp ne i32 %conv85, 10
  br i1 %cmp86, label %if.then88, label %if.end93

if.then88:                                        ; preds = %if.end81
  store i32 158, i32* %lrc, align 4
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
  store i32 2, i32* %ur, align 4
  %46 = load i32* %ur, align 4
  %47 = load i16* %sl, align 2
  %conv94 = sext i16 %47 to i32
  %mul95 = mul i32 %conv94, %46
  %conv96 = trunc i32 %mul95 to i16
  store i16 %conv96, i16* %sl, align 2
  %48 = load i16* %sl, align 2
  %conv97 = sext i16 %48 to i32
  %cmp98 = icmp ne i32 %conv97, 10
  br i1 %cmp98, label %if.then100, label %if.end105

if.then100:                                       ; preds = %if.end93
  store i32 159, i32* %lrc, align 4
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
  store float 2.000000e+00, float* %fr, align 4
  %51 = load float* %fr, align 4
  %52 = load i16* %sl, align 2
  %conv106 = sitofp i16 %52 to float
  %mul107 = fmul float %conv106, %51
  %conv108 = fptosi float %mul107 to i16
  store i16 %conv108, i16* %sl, align 2
  %53 = load i16* %sl, align 2
  %conv109 = sext i16 %53 to i32
  %cmp110 = icmp ne i32 %conv109, 10
  br i1 %cmp110, label %if.then112, label %if.end117

if.then112:                                       ; preds = %if.end105
  store i32 160, i32* %lrc, align 4
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
  store double 2.000000e+00, double* %dr, align 8
  %56 = load double* %dr, align 8
  %57 = load i16* %sl, align 2
  %conv118 = sitofp i16 %57 to double
  %mul119 = fmul double %conv118, %56
  %conv120 = fptosi double %mul119 to i16
  store i16 %conv120, i16* %sl, align 2
  %58 = load i16* %sl, align 2
  %conv121 = sext i16 %58 to i32
  %cmp122 = icmp ne i32 %conv121, 10
  br i1 %cmp122, label %if.then124, label %if.end129

if.then124:                                       ; preds = %if.end117
  store i32 161, i32* %lrc, align 4
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
  store i32 5, i32* %il, align 4
  store i8 2, i8* %cr, align 1
  %61 = load i8* %cr, align 1
  %conv130 = sext i8 %61 to i32
  %62 = load i32* %il, align 4
  %mul131 = mul nsw i32 %62, %conv130
  store i32 %mul131, i32* %il, align 4
  %63 = load i32* %il, align 4
  %cmp132 = icmp ne i32 %63, 10
  br i1 %cmp132, label %if.then134, label %if.end139

if.then134:                                       ; preds = %if.end129
  store i32 162, i32* %lrc, align 4
  %64 = load i32* %prlc, align 4
  %tobool135 = icmp ne i32 %64, 0
  br i1 %tobool135, label %if.then136, label %if.end138

if.then136:                                       ; preds = %if.then134
  %65 = load i32* %lrc, align 4
  %call137 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %65)
  br label %if.end138

if.end138:                                        ; preds = %if.then136, %if.then134
  br label %if.end139

if.end139:                                        ; preds = %if.end138, %if.end129
  store i32 5, i32* %il, align 4
  store i16 2, i16* %sr, align 2
  %66 = load i16* %sr, align 2
  %conv140 = sext i16 %66 to i32
  %67 = load i32* %il, align 4
  %mul141 = mul nsw i32 %67, %conv140
  store i32 %mul141, i32* %il, align 4
  %68 = load i32* %il, align 4
  %cmp142 = icmp ne i32 %68, 10
  br i1 %cmp142, label %if.then144, label %if.end149

if.then144:                                       ; preds = %if.end139
  store i32 163, i32* %lrc, align 4
  %69 = load i32* %prlc, align 4
  %tobool145 = icmp ne i32 %69, 0
  br i1 %tobool145, label %if.then146, label %if.end148

if.then146:                                       ; preds = %if.then144
  %70 = load i32* %lrc, align 4
  %call147 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %70)
  br label %if.end148

if.end148:                                        ; preds = %if.then146, %if.then144
  br label %if.end149

if.end149:                                        ; preds = %if.end148, %if.end139
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ir, align 4
  %71 = load i32* %ir, align 4
  %72 = load i32* %il, align 4
  %mul150 = mul nsw i32 %72, %71
  store i32 %mul150, i32* %il, align 4
  %73 = load i32* %il, align 4
  %cmp151 = icmp ne i32 %73, 10
  br i1 %cmp151, label %if.then153, label %if.end158

if.then153:                                       ; preds = %if.end149
  store i32 164, i32* %lrc, align 4
  %74 = load i32* %prlc, align 4
  %tobool154 = icmp ne i32 %74, 0
  br i1 %tobool154, label %if.then155, label %if.end157

if.then155:                                       ; preds = %if.then153
  %75 = load i32* %lrc, align 4
  %call156 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %75)
  br label %if.end157

if.end157:                                        ; preds = %if.then155, %if.then153
  br label %if.end158

if.end158:                                        ; preds = %if.end157, %if.end149
  store i32 5, i32* %il, align 4
  store i64 2, i64* %lr, align 8
  %76 = load i64* %lr, align 8
  %77 = load i32* %il, align 4
  %conv159 = sext i32 %77 to i64
  %mul160 = mul nsw i64 %conv159, %76
  %conv161 = trunc i64 %mul160 to i32
  store i32 %conv161, i32* %il, align 4
  %78 = load i32* %il, align 4
  %cmp162 = icmp ne i32 %78, 10
  br i1 %cmp162, label %if.then164, label %if.end169

if.then164:                                       ; preds = %if.end158
  store i32 165, i32* %lrc, align 4
  %79 = load i32* %prlc, align 4
  %tobool165 = icmp ne i32 %79, 0
  br i1 %tobool165, label %if.then166, label %if.end168

if.then166:                                       ; preds = %if.then164
  %80 = load i32* %lrc, align 4
  %call167 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %80)
  br label %if.end168

if.end168:                                        ; preds = %if.then166, %if.then164
  br label %if.end169

if.end169:                                        ; preds = %if.end168, %if.end158
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ur, align 4
  %81 = load i32* %ur, align 4
  %82 = load i32* %il, align 4
  %mul170 = mul i32 %82, %81
  store i32 %mul170, i32* %il, align 4
  %83 = load i32* %il, align 4
  %cmp171 = icmp ne i32 %83, 10
  br i1 %cmp171, label %if.then173, label %if.end178

if.then173:                                       ; preds = %if.end169
  store i32 166, i32* %lrc, align 4
  %84 = load i32* %prlc, align 4
  %tobool174 = icmp ne i32 %84, 0
  br i1 %tobool174, label %if.then175, label %if.end177

if.then175:                                       ; preds = %if.then173
  %85 = load i32* %lrc, align 4
  %call176 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %85)
  br label %if.end177

if.end177:                                        ; preds = %if.then175, %if.then173
  br label %if.end178

if.end178:                                        ; preds = %if.end177, %if.end169
  store i32 5, i32* %il, align 4
  store float 2.000000e+00, float* %fr, align 4
  %86 = load float* %fr, align 4
  %87 = load i32* %il, align 4
  %conv179 = sitofp i32 %87 to float
  %mul180 = fmul float %conv179, %86
  %conv181 = fptosi float %mul180 to i32
  store i32 %conv181, i32* %il, align 4
  %88 = load i32* %il, align 4
  %cmp182 = icmp ne i32 %88, 10
  br i1 %cmp182, label %if.then184, label %if.end189

if.then184:                                       ; preds = %if.end178
  store i32 167, i32* %lrc, align 4
  %89 = load i32* %prlc, align 4
  %tobool185 = icmp ne i32 %89, 0
  br i1 %tobool185, label %if.then186, label %if.end188

if.then186:                                       ; preds = %if.then184
  %90 = load i32* %lrc, align 4
  %call187 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %90)
  br label %if.end188

if.end188:                                        ; preds = %if.then186, %if.then184
  br label %if.end189

if.end189:                                        ; preds = %if.end188, %if.end178
  store i32 5, i32* %il, align 4
  store double 2.000000e+00, double* %dr, align 8
  %91 = load double* %dr, align 8
  %92 = load i32* %il, align 4
  %conv190 = sitofp i32 %92 to double
  %mul191 = fmul double %conv190, %91
  %conv192 = fptosi double %mul191 to i32
  store i32 %conv192, i32* %il, align 4
  %93 = load i32* %il, align 4
  %cmp193 = icmp ne i32 %93, 10
  br i1 %cmp193, label %if.then195, label %if.end200

if.then195:                                       ; preds = %if.end189
  store i32 168, i32* %lrc, align 4
  %94 = load i32* %prlc, align 4
  %tobool196 = icmp ne i32 %94, 0
  br i1 %tobool196, label %if.then197, label %if.end199

if.then197:                                       ; preds = %if.then195
  %95 = load i32* %lrc, align 4
  %call198 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %95)
  br label %if.end199

if.end199:                                        ; preds = %if.then197, %if.then195
  br label %if.end200

if.end200:                                        ; preds = %if.end199, %if.end189
  store i64 5, i64* %ll, align 8
  store i8 2, i8* %cr, align 1
  %96 = load i8* %cr, align 1
  %conv201 = sext i8 %96 to i64
  %97 = load i64* %ll, align 8
  %mul202 = mul nsw i64 %97, %conv201
  store i64 %mul202, i64* %ll, align 8
  %98 = load i64* %ll, align 8
  %cmp203 = icmp ne i64 %98, 10
  br i1 %cmp203, label %if.then205, label %if.end210

if.then205:                                       ; preds = %if.end200
  store i32 169, i32* %lrc, align 4
  %99 = load i32* %prlc, align 4
  %tobool206 = icmp ne i32 %99, 0
  br i1 %tobool206, label %if.then207, label %if.end209

if.then207:                                       ; preds = %if.then205
  %100 = load i32* %lrc, align 4
  %call208 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %100)
  br label %if.end209

if.end209:                                        ; preds = %if.then207, %if.then205
  br label %if.end210

if.end210:                                        ; preds = %if.end209, %if.end200
  store i64 5, i64* %ll, align 8
  store i16 2, i16* %sr, align 2
  %101 = load i16* %sr, align 2
  %conv211 = sext i16 %101 to i64
  %102 = load i64* %ll, align 8
  %mul212 = mul nsw i64 %102, %conv211
  store i64 %mul212, i64* %ll, align 8
  %103 = load i64* %ll, align 8
  %cmp213 = icmp ne i64 %103, 10
  br i1 %cmp213, label %if.then215, label %if.end220

if.then215:                                       ; preds = %if.end210
  store i32 170, i32* %lrc, align 4
  %104 = load i32* %prlc, align 4
  %tobool216 = icmp ne i32 %104, 0
  br i1 %tobool216, label %if.then217, label %if.end219

if.then217:                                       ; preds = %if.then215
  %105 = load i32* %lrc, align 4
  %call218 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %105)
  br label %if.end219

if.end219:                                        ; preds = %if.then217, %if.then215
  br label %if.end220

if.end220:                                        ; preds = %if.end219, %if.end210
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ir, align 4
  %106 = load i32* %ir, align 4
  %conv221 = sext i32 %106 to i64
  %107 = load i64* %ll, align 8
  %mul222 = mul nsw i64 %107, %conv221
  store i64 %mul222, i64* %ll, align 8
  %108 = load i64* %ll, align 8
  %cmp223 = icmp ne i64 %108, 10
  br i1 %cmp223, label %if.then225, label %if.end230

if.then225:                                       ; preds = %if.end220
  store i32 171, i32* %lrc, align 4
  %109 = load i32* %prlc, align 4
  %tobool226 = icmp ne i32 %109, 0
  br i1 %tobool226, label %if.then227, label %if.end229

if.then227:                                       ; preds = %if.then225
  %110 = load i32* %lrc, align 4
  %call228 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %110)
  br label %if.end229

if.end229:                                        ; preds = %if.then227, %if.then225
  br label %if.end230

if.end230:                                        ; preds = %if.end229, %if.end220
  store i64 5, i64* %ll, align 8
  store i64 2, i64* %lr, align 8
  %111 = load i64* %lr, align 8
  %112 = load i64* %ll, align 8
  %mul231 = mul nsw i64 %112, %111
  store i64 %mul231, i64* %ll, align 8
  %113 = load i64* %ll, align 8
  %cmp232 = icmp ne i64 %113, 10
  br i1 %cmp232, label %if.then234, label %if.end239

if.then234:                                       ; preds = %if.end230
  store i32 172, i32* %lrc, align 4
  %114 = load i32* %prlc, align 4
  %tobool235 = icmp ne i32 %114, 0
  br i1 %tobool235, label %if.then236, label %if.end238

if.then236:                                       ; preds = %if.then234
  %115 = load i32* %lrc, align 4
  %call237 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %115)
  br label %if.end238

if.end238:                                        ; preds = %if.then236, %if.then234
  br label %if.end239

if.end239:                                        ; preds = %if.end238, %if.end230
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ur, align 4
  %116 = load i32* %ur, align 4
  %conv240 = zext i32 %116 to i64
  %117 = load i64* %ll, align 8
  %mul241 = mul nsw i64 %117, %conv240
  store i64 %mul241, i64* %ll, align 8
  %118 = load i64* %ll, align 8
  %cmp242 = icmp ne i64 %118, 10
  br i1 %cmp242, label %if.then244, label %if.end249

if.then244:                                       ; preds = %if.end239
  store i32 173, i32* %lrc, align 4
  %119 = load i32* %prlc, align 4
  %tobool245 = icmp ne i32 %119, 0
  br i1 %tobool245, label %if.then246, label %if.end248

if.then246:                                       ; preds = %if.then244
  %120 = load i32* %lrc, align 4
  %call247 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %120)
  br label %if.end248

if.end248:                                        ; preds = %if.then246, %if.then244
  br label %if.end249

if.end249:                                        ; preds = %if.end248, %if.end239
  store i64 5, i64* %ll, align 8
  store float 2.000000e+00, float* %fr, align 4
  %121 = load float* %fr, align 4
  %122 = load i64* %ll, align 8
  %conv250 = sitofp i64 %122 to float
  %mul251 = fmul float %conv250, %121
  %conv252 = fptosi float %mul251 to i64
  store i64 %conv252, i64* %ll, align 8
  %123 = load i64* %ll, align 8
  %cmp253 = icmp ne i64 %123, 10
  br i1 %cmp253, label %if.then255, label %if.end260

if.then255:                                       ; preds = %if.end249
  store i32 174, i32* %lrc, align 4
  %124 = load i32* %prlc, align 4
  %tobool256 = icmp ne i32 %124, 0
  br i1 %tobool256, label %if.then257, label %if.end259

if.then257:                                       ; preds = %if.then255
  %125 = load i32* %lrc, align 4
  %call258 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %125)
  br label %if.end259

if.end259:                                        ; preds = %if.then257, %if.then255
  br label %if.end260

if.end260:                                        ; preds = %if.end259, %if.end249
  store i64 5, i64* %ll, align 8
  store double 2.000000e+00, double* %dr, align 8
  %126 = load double* %dr, align 8
  %127 = load i64* %ll, align 8
  %conv261 = sitofp i64 %127 to double
  %mul262 = fmul double %conv261, %126
  %conv263 = fptosi double %mul262 to i64
  store i64 %conv263, i64* %ll, align 8
  %128 = load i64* %ll, align 8
  %cmp264 = icmp ne i64 %128, 10
  br i1 %cmp264, label %if.then266, label %if.end271

if.then266:                                       ; preds = %if.end260
  store i32 175, i32* %lrc, align 4
  %129 = load i32* %prlc, align 4
  %tobool267 = icmp ne i32 %129, 0
  br i1 %tobool267, label %if.then268, label %if.end270

if.then268:                                       ; preds = %if.then266
  %130 = load i32* %lrc, align 4
  %call269 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %130)
  br label %if.end270

if.end270:                                        ; preds = %if.then268, %if.then266
  br label %if.end271

if.end271:                                        ; preds = %if.end270, %if.end260
  store i32 5, i32* %ul, align 4
  store i8 2, i8* %cr, align 1
  %131 = load i8* %cr, align 1
  %conv272 = sext i8 %131 to i32
  %132 = load i32* %ul, align 4
  %mul273 = mul i32 %132, %conv272
  store i32 %mul273, i32* %ul, align 4
  %133 = load i32* %ul, align 4
  %cmp274 = icmp ne i32 %133, 10
  br i1 %cmp274, label %if.then276, label %if.end281

if.then276:                                       ; preds = %if.end271
  store i32 176, i32* %lrc, align 4
  %134 = load i32* %prlc, align 4
  %tobool277 = icmp ne i32 %134, 0
  br i1 %tobool277, label %if.then278, label %if.end280

if.then278:                                       ; preds = %if.then276
  %135 = load i32* %lrc, align 4
  %call279 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %135)
  br label %if.end280

if.end280:                                        ; preds = %if.then278, %if.then276
  br label %if.end281

if.end281:                                        ; preds = %if.end280, %if.end271
  store i32 5, i32* %ul, align 4
  store i16 2, i16* %sr, align 2
  %136 = load i16* %sr, align 2
  %conv282 = sext i16 %136 to i32
  %137 = load i32* %ul, align 4
  %mul283 = mul i32 %137, %conv282
  store i32 %mul283, i32* %ul, align 4
  %138 = load i32* %ul, align 4
  %cmp284 = icmp ne i32 %138, 10
  br i1 %cmp284, label %if.then286, label %if.end291

if.then286:                                       ; preds = %if.end281
  store i32 177, i32* %lrc, align 4
  %139 = load i32* %prlc, align 4
  %tobool287 = icmp ne i32 %139, 0
  br i1 %tobool287, label %if.then288, label %if.end290

if.then288:                                       ; preds = %if.then286
  %140 = load i32* %lrc, align 4
  %call289 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %140)
  br label %if.end290

if.end290:                                        ; preds = %if.then288, %if.then286
  br label %if.end291

if.end291:                                        ; preds = %if.end290, %if.end281
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ir, align 4
  %141 = load i32* %ir, align 4
  %142 = load i32* %ul, align 4
  %mul292 = mul i32 %142, %141
  store i32 %mul292, i32* %ul, align 4
  %143 = load i32* %ul, align 4
  %cmp293 = icmp ne i32 %143, 10
  br i1 %cmp293, label %if.then295, label %if.end300

if.then295:                                       ; preds = %if.end291
  store i32 178, i32* %lrc, align 4
  %144 = load i32* %prlc, align 4
  %tobool296 = icmp ne i32 %144, 0
  br i1 %tobool296, label %if.then297, label %if.end299

if.then297:                                       ; preds = %if.then295
  %145 = load i32* %lrc, align 4
  %call298 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %145)
  br label %if.end299

if.end299:                                        ; preds = %if.then297, %if.then295
  br label %if.end300

if.end300:                                        ; preds = %if.end299, %if.end291
  store i32 5, i32* %ul, align 4
  store i64 2, i64* %lr, align 8
  %146 = load i64* %lr, align 8
  %147 = load i32* %ul, align 4
  %conv301 = zext i32 %147 to i64
  %mul302 = mul nsw i64 %conv301, %146
  %conv303 = trunc i64 %mul302 to i32
  store i32 %conv303, i32* %ul, align 4
  %148 = load i32* %ul, align 4
  %cmp304 = icmp ne i32 %148, 10
  br i1 %cmp304, label %if.then306, label %if.end311

if.then306:                                       ; preds = %if.end300
  store i32 179, i32* %lrc, align 4
  %149 = load i32* %prlc, align 4
  %tobool307 = icmp ne i32 %149, 0
  br i1 %tobool307, label %if.then308, label %if.end310

if.then308:                                       ; preds = %if.then306
  %150 = load i32* %lrc, align 4
  %call309 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %150)
  br label %if.end310

if.end310:                                        ; preds = %if.then308, %if.then306
  br label %if.end311

if.end311:                                        ; preds = %if.end310, %if.end300
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ur, align 4
  %151 = load i32* %ur, align 4
  %152 = load i32* %ul, align 4
  %mul312 = mul i32 %152, %151
  store i32 %mul312, i32* %ul, align 4
  %153 = load i32* %ul, align 4
  %cmp313 = icmp ne i32 %153, 10
  br i1 %cmp313, label %if.then315, label %if.end320

if.then315:                                       ; preds = %if.end311
  store i32 180, i32* %lrc, align 4
  %154 = load i32* %prlc, align 4
  %tobool316 = icmp ne i32 %154, 0
  br i1 %tobool316, label %if.then317, label %if.end319

if.then317:                                       ; preds = %if.then315
  %155 = load i32* %lrc, align 4
  %call318 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %155)
  br label %if.end319

if.end319:                                        ; preds = %if.then317, %if.then315
  br label %if.end320

if.end320:                                        ; preds = %if.end319, %if.end311
  store i32 5, i32* %ul, align 4
  store float 2.000000e+00, float* %fr, align 4
  %156 = load float* %fr, align 4
  %157 = load i32* %ul, align 4
  %conv321 = uitofp i32 %157 to float
  %mul322 = fmul float %conv321, %156
  %conv323 = fptoui float %mul322 to i32
  store i32 %conv323, i32* %ul, align 4
  %158 = load i32* %ul, align 4
  %cmp324 = icmp ne i32 %158, 10
  br i1 %cmp324, label %if.then326, label %if.end331

if.then326:                                       ; preds = %if.end320
  store i32 181, i32* %lrc, align 4
  %159 = load i32* %prlc, align 4
  %tobool327 = icmp ne i32 %159, 0
  br i1 %tobool327, label %if.then328, label %if.end330

if.then328:                                       ; preds = %if.then326
  %160 = load i32* %lrc, align 4
  %call329 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %160)
  br label %if.end330

if.end330:                                        ; preds = %if.then328, %if.then326
  br label %if.end331

if.end331:                                        ; preds = %if.end330, %if.end320
  store i32 5, i32* %ul, align 4
  store double 2.000000e+00, double* %dr, align 8
  %161 = load double* %dr, align 8
  %162 = load i32* %ul, align 4
  %conv332 = uitofp i32 %162 to double
  %mul333 = fmul double %conv332, %161
  %conv334 = fptoui double %mul333 to i32
  store i32 %conv334, i32* %ul, align 4
  %163 = load i32* %ul, align 4
  %cmp335 = icmp ne i32 %163, 10
  br i1 %cmp335, label %if.then337, label %if.end342

if.then337:                                       ; preds = %if.end331
  store i32 182, i32* %lrc, align 4
  %164 = load i32* %prlc, align 4
  %tobool338 = icmp ne i32 %164, 0
  br i1 %tobool338, label %if.then339, label %if.end341

if.then339:                                       ; preds = %if.then337
  %165 = load i32* %lrc, align 4
  %call340 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %165)
  br label %if.end341

if.end341:                                        ; preds = %if.then339, %if.then337
  br label %if.end342

if.end342:                                        ; preds = %if.end341, %if.end331
  store float 5.000000e+00, float* %fl, align 4
  store i8 2, i8* %cr, align 1
  %166 = load i8* %cr, align 1
  %conv343 = sext i8 %166 to i32
  %conv344 = sitofp i32 %conv343 to float
  %167 = load float* %fl, align 4
  %mul345 = fmul float %167, %conv344
  store float %mul345, float* %fl, align 4
  %168 = load float* %fl, align 4
  %cmp346 = fcmp une float %168, 1.000000e+01
  br i1 %cmp346, label %if.then348, label %if.end353

if.then348:                                       ; preds = %if.end342
  store i32 183, i32* %lrc, align 4
  %169 = load i32* %prlc, align 4
  %tobool349 = icmp ne i32 %169, 0
  br i1 %tobool349, label %if.then350, label %if.end352

if.then350:                                       ; preds = %if.then348
  %170 = load i32* %lrc, align 4
  %call351 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %170)
  br label %if.end352

if.end352:                                        ; preds = %if.then350, %if.then348
  br label %if.end353

if.end353:                                        ; preds = %if.end352, %if.end342
  store float 5.000000e+00, float* %fl, align 4
  store i16 2, i16* %sr, align 2
  %171 = load i16* %sr, align 2
  %conv354 = sext i16 %171 to i32
  %conv355 = sitofp i32 %conv354 to float
  %172 = load float* %fl, align 4
  %mul356 = fmul float %172, %conv355
  store float %mul356, float* %fl, align 4
  %173 = load float* %fl, align 4
  %cmp357 = fcmp une float %173, 1.000000e+01
  br i1 %cmp357, label %if.then359, label %if.end364

if.then359:                                       ; preds = %if.end353
  store i32 184, i32* %lrc, align 4
  %174 = load i32* %prlc, align 4
  %tobool360 = icmp ne i32 %174, 0
  br i1 %tobool360, label %if.then361, label %if.end363

if.then361:                                       ; preds = %if.then359
  %175 = load i32* %lrc, align 4
  %call362 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %175)
  br label %if.end363

if.end363:                                        ; preds = %if.then361, %if.then359
  br label %if.end364

if.end364:                                        ; preds = %if.end363, %if.end353
  store float 5.000000e+00, float* %fl, align 4
  store i32 2, i32* %ir, align 4
  %176 = load i32* %ir, align 4
  %conv365 = sitofp i32 %176 to float
  %177 = load float* %fl, align 4
  %mul366 = fmul float %177, %conv365
  store float %mul366, float* %fl, align 4
  %178 = load float* %fl, align 4
  %cmp367 = fcmp une float %178, 1.000000e+01
  br i1 %cmp367, label %if.then369, label %if.end374

if.then369:                                       ; preds = %if.end364
  store i32 185, i32* %lrc, align 4
  %179 = load i32* %prlc, align 4
  %tobool370 = icmp ne i32 %179, 0
  br i1 %tobool370, label %if.then371, label %if.end373

if.then371:                                       ; preds = %if.then369
  %180 = load i32* %lrc, align 4
  %call372 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %180)
  br label %if.end373

if.end373:                                        ; preds = %if.then371, %if.then369
  br label %if.end374

if.end374:                                        ; preds = %if.end373, %if.end364
  store float 5.000000e+00, float* %fl, align 4
  store i64 2, i64* %lr, align 8
  %181 = load i64* %lr, align 8
  %conv375 = sitofp i64 %181 to float
  %182 = load float* %fl, align 4
  %mul376 = fmul float %182, %conv375
  store float %mul376, float* %fl, align 4
  %183 = load float* %fl, align 4
  %cmp377 = fcmp une float %183, 1.000000e+01
  br i1 %cmp377, label %if.then379, label %if.end384

if.then379:                                       ; preds = %if.end374
  store i32 186, i32* %lrc, align 4
  %184 = load i32* %prlc, align 4
  %tobool380 = icmp ne i32 %184, 0
  br i1 %tobool380, label %if.then381, label %if.end383

if.then381:                                       ; preds = %if.then379
  %185 = load i32* %lrc, align 4
  %call382 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %185)
  br label %if.end383

if.end383:                                        ; preds = %if.then381, %if.then379
  br label %if.end384

if.end384:                                        ; preds = %if.end383, %if.end374
  store float 5.000000e+00, float* %fl, align 4
  store i32 2, i32* %ur, align 4
  %186 = load i32* %ur, align 4
  %conv385 = uitofp i32 %186 to float
  %187 = load float* %fl, align 4
  %mul386 = fmul float %187, %conv385
  store float %mul386, float* %fl, align 4
  %188 = load float* %fl, align 4
  %cmp387 = fcmp une float %188, 1.000000e+01
  br i1 %cmp387, label %if.then389, label %if.end394

if.then389:                                       ; preds = %if.end384
  store i32 187, i32* %lrc, align 4
  %189 = load i32* %prlc, align 4
  %tobool390 = icmp ne i32 %189, 0
  br i1 %tobool390, label %if.then391, label %if.end393

if.then391:                                       ; preds = %if.then389
  %190 = load i32* %lrc, align 4
  %call392 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %190)
  br label %if.end393

if.end393:                                        ; preds = %if.then391, %if.then389
  br label %if.end394

if.end394:                                        ; preds = %if.end393, %if.end384
  store float 5.000000e+00, float* %fl, align 4
  store float 2.000000e+00, float* %fr, align 4
  %191 = load float* %fr, align 4
  %192 = load float* %fl, align 4
  %mul395 = fmul float %192, %191
  store float %mul395, float* %fl, align 4
  %193 = load float* %fl, align 4
  %cmp396 = fcmp une float %193, 1.000000e+01
  br i1 %cmp396, label %if.then398, label %if.end403

if.then398:                                       ; preds = %if.end394
  store i32 188, i32* %lrc, align 4
  %194 = load i32* %prlc, align 4
  %tobool399 = icmp ne i32 %194, 0
  br i1 %tobool399, label %if.then400, label %if.end402

if.then400:                                       ; preds = %if.then398
  %195 = load i32* %lrc, align 4
  %call401 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %195)
  br label %if.end402

if.end402:                                        ; preds = %if.then400, %if.then398
  br label %if.end403

if.end403:                                        ; preds = %if.end402, %if.end394
  store float 5.000000e+00, float* %fl, align 4
  store double 2.000000e+00, double* %dr, align 8
  %196 = load double* %dr, align 8
  %197 = load float* %fl, align 4
  %conv404 = fpext float %197 to double
  %mul405 = fmul double %conv404, %196
  %conv406 = fptrunc double %mul405 to float
  store float %conv406, float* %fl, align 4
  %198 = load float* %fl, align 4
  %cmp407 = fcmp une float %198, 1.000000e+01
  br i1 %cmp407, label %if.then409, label %if.end414

if.then409:                                       ; preds = %if.end403
  store i32 189, i32* %lrc, align 4
  %199 = load i32* %prlc, align 4
  %tobool410 = icmp ne i32 %199, 0
  br i1 %tobool410, label %if.then411, label %if.end413

if.then411:                                       ; preds = %if.then409
  %200 = load i32* %lrc, align 4
  %call412 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %200)
  br label %if.end413

if.end413:                                        ; preds = %if.then411, %if.then409
  br label %if.end414

if.end414:                                        ; preds = %if.end413, %if.end403
  store double 5.000000e+00, double* %dl, align 8
  store i8 2, i8* %cr, align 1
  %201 = load i8* %cr, align 1
  %conv415 = sext i8 %201 to i32
  %conv416 = sitofp i32 %conv415 to double
  %202 = load double* %dl, align 8
  %mul417 = fmul double %202, %conv416
  store double %mul417, double* %dl, align 8
  %203 = load double* %dl, align 8
  %cmp418 = fcmp une double %203, 1.000000e+01
  br i1 %cmp418, label %if.then420, label %if.end425

if.then420:                                       ; preds = %if.end414
  store i32 190, i32* %lrc, align 4
  %204 = load i32* %prlc, align 4
  %tobool421 = icmp ne i32 %204, 0
  br i1 %tobool421, label %if.then422, label %if.end424

if.then422:                                       ; preds = %if.then420
  %205 = load i32* %lrc, align 4
  %call423 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %205)
  br label %if.end424

if.end424:                                        ; preds = %if.then422, %if.then420
  br label %if.end425

if.end425:                                        ; preds = %if.end424, %if.end414
  store double 5.000000e+00, double* %dl, align 8
  store i16 2, i16* %sr, align 2
  %206 = load i16* %sr, align 2
  %conv426 = sext i16 %206 to i32
  %conv427 = sitofp i32 %conv426 to double
  %207 = load double* %dl, align 8
  %mul428 = fmul double %207, %conv427
  store double %mul428, double* %dl, align 8
  %208 = load double* %dl, align 8
  %cmp429 = fcmp une double %208, 1.000000e+01
  br i1 %cmp429, label %if.then431, label %if.end436

if.then431:                                       ; preds = %if.end425
  store i32 191, i32* %lrc, align 4
  %209 = load i32* %prlc, align 4
  %tobool432 = icmp ne i32 %209, 0
  br i1 %tobool432, label %if.then433, label %if.end435

if.then433:                                       ; preds = %if.then431
  %210 = load i32* %lrc, align 4
  %call434 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %210)
  br label %if.end435

if.end435:                                        ; preds = %if.then433, %if.then431
  br label %if.end436

if.end436:                                        ; preds = %if.end435, %if.end425
  store double 5.000000e+00, double* %dl, align 8
  store i32 2, i32* %ir, align 4
  %211 = load i32* %ir, align 4
  %conv437 = sitofp i32 %211 to double
  %212 = load double* %dl, align 8
  %mul438 = fmul double %212, %conv437
  store double %mul438, double* %dl, align 8
  %213 = load double* %dl, align 8
  %cmp439 = fcmp une double %213, 1.000000e+01
  br i1 %cmp439, label %if.then441, label %if.end446

if.then441:                                       ; preds = %if.end436
  store i32 192, i32* %lrc, align 4
  %214 = load i32* %prlc, align 4
  %tobool442 = icmp ne i32 %214, 0
  br i1 %tobool442, label %if.then443, label %if.end445

if.then443:                                       ; preds = %if.then441
  %215 = load i32* %lrc, align 4
  %call444 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %215)
  br label %if.end445

if.end445:                                        ; preds = %if.then443, %if.then441
  br label %if.end446

if.end446:                                        ; preds = %if.end445, %if.end436
  store double 5.000000e+00, double* %dl, align 8
  store i64 2, i64* %lr, align 8
  %216 = load i64* %lr, align 8
  %conv447 = sitofp i64 %216 to double
  %217 = load double* %dl, align 8
  %mul448 = fmul double %217, %conv447
  store double %mul448, double* %dl, align 8
  %218 = load double* %dl, align 8
  %cmp449 = fcmp une double %218, 1.000000e+01
  br i1 %cmp449, label %if.then451, label %if.end456

if.then451:                                       ; preds = %if.end446
  store i32 193, i32* %lrc, align 4
  %219 = load i32* %prlc, align 4
  %tobool452 = icmp ne i32 %219, 0
  br i1 %tobool452, label %if.then453, label %if.end455

if.then453:                                       ; preds = %if.then451
  %220 = load i32* %lrc, align 4
  %call454 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %220)
  br label %if.end455

if.end455:                                        ; preds = %if.then453, %if.then451
  br label %if.end456

if.end456:                                        ; preds = %if.end455, %if.end446
  store double 5.000000e+00, double* %dl, align 8
  store i32 2, i32* %ur, align 4
  %221 = load i32* %ur, align 4
  %conv457 = uitofp i32 %221 to double
  %222 = load double* %dl, align 8
  %mul458 = fmul double %222, %conv457
  store double %mul458, double* %dl, align 8
  %223 = load double* %dl, align 8
  %cmp459 = fcmp une double %223, 1.000000e+01
  br i1 %cmp459, label %if.then461, label %if.end466

if.then461:                                       ; preds = %if.end456
  store i32 194, i32* %lrc, align 4
  %224 = load i32* %prlc, align 4
  %tobool462 = icmp ne i32 %224, 0
  br i1 %tobool462, label %if.then463, label %if.end465

if.then463:                                       ; preds = %if.then461
  %225 = load i32* %lrc, align 4
  %call464 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %225)
  br label %if.end465

if.end465:                                        ; preds = %if.then463, %if.then461
  br label %if.end466

if.end466:                                        ; preds = %if.end465, %if.end456
  store double 5.000000e+00, double* %dl, align 8
  store float 2.000000e+00, float* %fr, align 4
  %226 = load float* %fr, align 4
  %conv467 = fpext float %226 to double
  %227 = load double* %dl, align 8
  %mul468 = fmul double %227, %conv467
  store double %mul468, double* %dl, align 8
  %228 = load double* %dl, align 8
  %cmp469 = fcmp une double %228, 1.000000e+01
  br i1 %cmp469, label %if.then471, label %if.end476

if.then471:                                       ; preds = %if.end466
  store i32 195, i32* %lrc, align 4
  %229 = load i32* %prlc, align 4
  %tobool472 = icmp ne i32 %229, 0
  br i1 %tobool472, label %if.then473, label %if.end475

if.then473:                                       ; preds = %if.then471
  %230 = load i32* %lrc, align 4
  %call474 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %230)
  br label %if.end475

if.end475:                                        ; preds = %if.then473, %if.then471
  br label %if.end476

if.end476:                                        ; preds = %if.end475, %if.end466
  store double 5.000000e+00, double* %dl, align 8
  store double 2.000000e+00, double* %dr, align 8
  %231 = load double* %dr, align 8
  %232 = load double* %dl, align 8
  %mul477 = fmul double %232, %231
  store double %mul477, double* %dl, align 8
  %233 = load double* %dl, align 8
  %cmp478 = fcmp une double %233, 1.000000e+01
  br i1 %cmp478, label %if.then480, label %if.end485

if.then480:                                       ; preds = %if.end476
  store i32 196, i32* %lrc, align 4
  %234 = load i32* %prlc, align 4
  %tobool481 = icmp ne i32 %234, 0
  br i1 %tobool481, label %if.then482, label %if.end484

if.then482:                                       ; preds = %if.then480
  %235 = load i32* %lrc, align 4
  %call483 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %235)
  br label %if.end484

if.end484:                                        ; preds = %if.then482, %if.then480
  br label %if.end485

if.end485:                                        ; preds = %if.end484, %if.end476
  store i8 5, i8* %cl, align 1
  store i8 2, i8* %cr, align 1
  %236 = load i8* %cr, align 1
  %conv486 = sext i8 %236 to i32
  %237 = load i8* %cl, align 1
  %conv487 = sext i8 %237 to i32
  %div = sdiv i32 %conv487, %conv486
  %conv488 = trunc i32 %div to i8
  store i8 %conv488, i8* %cl, align 1
  %238 = load i8* %cl, align 1
  %conv489 = sext i8 %238 to i32
  %cmp490 = icmp ne i32 %conv489, 2
  br i1 %cmp490, label %if.then492, label %if.end497

if.then492:                                       ; preds = %if.end485
  store i32 197, i32* %lrc, align 4
  %239 = load i32* %prlc, align 4
  %tobool493 = icmp ne i32 %239, 0
  br i1 %tobool493, label %if.then494, label %if.end496

if.then494:                                       ; preds = %if.then492
  %240 = load i32* %lrc, align 4
  %call495 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %240)
  br label %if.end496

if.end496:                                        ; preds = %if.then494, %if.then492
  br label %if.end497

if.end497:                                        ; preds = %if.end496, %if.end485
  store i8 5, i8* %cl, align 1
  store i16 2, i16* %sr, align 2
  %241 = load i16* %sr, align 2
  %conv498 = sext i16 %241 to i32
  %242 = load i8* %cl, align 1
  %conv499 = sext i8 %242 to i32
  %div500 = sdiv i32 %conv499, %conv498
  %conv501 = trunc i32 %div500 to i8
  store i8 %conv501, i8* %cl, align 1
  %243 = load i8* %cl, align 1
  %conv502 = sext i8 %243 to i32
  %cmp503 = icmp ne i32 %conv502, 2
  br i1 %cmp503, label %if.then505, label %if.end510

if.then505:                                       ; preds = %if.end497
  store i32 198, i32* %lrc, align 4
  %244 = load i32* %prlc, align 4
  %tobool506 = icmp ne i32 %244, 0
  br i1 %tobool506, label %if.then507, label %if.end509

if.then507:                                       ; preds = %if.then505
  %245 = load i32* %lrc, align 4
  %call508 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %245)
  br label %if.end509

if.end509:                                        ; preds = %if.then507, %if.then505
  br label %if.end510

if.end510:                                        ; preds = %if.end509, %if.end497
  store i8 5, i8* %cl, align 1
  store i32 2, i32* %ir, align 4
  %246 = load i32* %ir, align 4
  %247 = load i8* %cl, align 1
  %conv511 = sext i8 %247 to i32
  %div512 = sdiv i32 %conv511, %246
  %conv513 = trunc i32 %div512 to i8
  store i8 %conv513, i8* %cl, align 1
  %248 = load i8* %cl, align 1
  %conv514 = sext i8 %248 to i32
  %cmp515 = icmp ne i32 %conv514, 2
  br i1 %cmp515, label %if.then517, label %if.end522

if.then517:                                       ; preds = %if.end510
  store i32 199, i32* %lrc, align 4
  %249 = load i32* %prlc, align 4
  %tobool518 = icmp ne i32 %249, 0
  br i1 %tobool518, label %if.then519, label %if.end521

if.then519:                                       ; preds = %if.then517
  %250 = load i32* %lrc, align 4
  %call520 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %250)
  br label %if.end521

if.end521:                                        ; preds = %if.then519, %if.then517
  br label %if.end522

if.end522:                                        ; preds = %if.end521, %if.end510
  store i8 5, i8* %cl, align 1
  store i64 2, i64* %lr, align 8
  %251 = load i64* %lr, align 8
  %252 = load i8* %cl, align 1
  %conv523 = sext i8 %252 to i64
  %div524 = sdiv i64 %conv523, %251
  %conv525 = trunc i64 %div524 to i8
  store i8 %conv525, i8* %cl, align 1
  %253 = load i8* %cl, align 1
  %conv526 = sext i8 %253 to i32
  %cmp527 = icmp ne i32 %conv526, 2
  br i1 %cmp527, label %if.then529, label %if.end534

if.then529:                                       ; preds = %if.end522
  store i32 200, i32* %lrc, align 4
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
