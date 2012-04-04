; ModuleID = '/home/david/src/c-semantics/tests/unitTests/cq-20-s714-f.c'
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
  store i16 5, i16* %sl, align 2
  store i8 2, i8* %cr, align 1
  %6 = load i8* %cr, align 1
  %conv = sext i8 %6 to i32
  %7 = load i16* %sl, align 2
  %conv2 = sext i16 %7 to i32
  %rem = srem i32 %conv2, %conv
  %conv3 = trunc i32 %rem to i16
  store i16 %conv3, i16* %sl, align 2
  %8 = load i16* %sl, align 2
  %conv4 = sext i16 %8 to i32
  %cmp = icmp ne i32 %conv4, 1
  br i1 %cmp, label %if.then, label %if.end8

if.then:                                          ; preds = %while.end
  store i32 251, i32* %lrc, align 4
  %9 = load i32* %prlc, align 4
  %tobool6 = icmp ne i32 %9, 0
  br i1 %tobool6, label %if.then7, label %if.end

if.then7:                                         ; preds = %if.then
  %10 = load i32* %lrc, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %10)
  br label %if.end

if.end:                                           ; preds = %if.then7, %if.then
  br label %if.end8

if.end8:                                          ; preds = %if.end, %while.end
  store i16 5, i16* %sl, align 2
  store i16 2, i16* %sr, align 2
  %11 = load i16* %sr, align 2
  %conv9 = sext i16 %11 to i32
  %12 = load i16* %sl, align 2
  %conv10 = sext i16 %12 to i32
  %rem11 = srem i32 %conv10, %conv9
  %conv12 = trunc i32 %rem11 to i16
  store i16 %conv12, i16* %sl, align 2
  %13 = load i16* %sl, align 2
  %conv13 = sext i16 %13 to i32
  %cmp14 = icmp ne i32 %conv13, 1
  br i1 %cmp14, label %if.then16, label %if.end21

if.then16:                                        ; preds = %if.end8
  store i32 252, i32* %lrc, align 4
  %14 = load i32* %prlc, align 4
  %tobool17 = icmp ne i32 %14, 0
  br i1 %tobool17, label %if.then18, label %if.end20

if.then18:                                        ; preds = %if.then16
  %15 = load i32* %lrc, align 4
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %15)
  br label %if.end20

if.end20:                                         ; preds = %if.then18, %if.then16
  br label %if.end21

if.end21:                                         ; preds = %if.end20, %if.end8
  store i16 5, i16* %sl, align 2
  store i32 2, i32* %ir, align 4
  %16 = load i32* %ir, align 4
  %17 = load i16* %sl, align 2
  %conv22 = sext i16 %17 to i32
  %rem23 = srem i32 %conv22, %16
  %conv24 = trunc i32 %rem23 to i16
  store i16 %conv24, i16* %sl, align 2
  %18 = load i16* %sl, align 2
  %conv25 = sext i16 %18 to i32
  %cmp26 = icmp ne i32 %conv25, 1
  br i1 %cmp26, label %if.then28, label %if.end33

if.then28:                                        ; preds = %if.end21
  store i32 253, i32* %lrc, align 4
  %19 = load i32* %prlc, align 4
  %tobool29 = icmp ne i32 %19, 0
  br i1 %tobool29, label %if.then30, label %if.end32

if.then30:                                        ; preds = %if.then28
  %20 = load i32* %lrc, align 4
  %call31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %20)
  br label %if.end32

if.end32:                                         ; preds = %if.then30, %if.then28
  br label %if.end33

if.end33:                                         ; preds = %if.end32, %if.end21
  store i16 5, i16* %sl, align 2
  store i64 2, i64* %lr, align 8
  %21 = load i64* %lr, align 8
  %22 = load i16* %sl, align 2
  %conv34 = sext i16 %22 to i64
  %rem35 = srem i64 %conv34, %21
  %conv36 = trunc i64 %rem35 to i16
  store i16 %conv36, i16* %sl, align 2
  %23 = load i16* %sl, align 2
  %conv37 = sext i16 %23 to i32
  %cmp38 = icmp ne i32 %conv37, 1
  br i1 %cmp38, label %if.then40, label %if.end45

if.then40:                                        ; preds = %if.end33
  store i32 254, i32* %lrc, align 4
  %24 = load i32* %prlc, align 4
  %tobool41 = icmp ne i32 %24, 0
  br i1 %tobool41, label %if.then42, label %if.end44

if.then42:                                        ; preds = %if.then40
  %25 = load i32* %lrc, align 4
  %call43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %25)
  br label %if.end44

if.end44:                                         ; preds = %if.then42, %if.then40
  br label %if.end45

if.end45:                                         ; preds = %if.end44, %if.end33
  store i16 5, i16* %sl, align 2
  store i32 2, i32* %ur, align 4
  %26 = load i32* %ur, align 4
  %27 = load i16* %sl, align 2
  %conv46 = sext i16 %27 to i32
  %rem47 = urem i32 %conv46, %26
  %conv48 = trunc i32 %rem47 to i16
  store i16 %conv48, i16* %sl, align 2
  %28 = load i16* %sl, align 2
  %conv49 = sext i16 %28 to i32
  %cmp50 = icmp ne i32 %conv49, 1
  br i1 %cmp50, label %if.then52, label %if.end57

if.then52:                                        ; preds = %if.end45
  store i32 255, i32* %lrc, align 4
  %29 = load i32* %prlc, align 4
  %tobool53 = icmp ne i32 %29, 0
  br i1 %tobool53, label %if.then54, label %if.end56

if.then54:                                        ; preds = %if.then52
  %30 = load i32* %lrc, align 4
  %call55 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %30)
  br label %if.end56

if.end56:                                         ; preds = %if.then54, %if.then52
  br label %if.end57

if.end57:                                         ; preds = %if.end56, %if.end45
  store i32 5, i32* %il, align 4
  store i8 2, i8* %cr, align 1
  %31 = load i8* %cr, align 1
  %conv58 = sext i8 %31 to i32
  %32 = load i32* %il, align 4
  %rem59 = srem i32 %32, %conv58
  store i32 %rem59, i32* %il, align 4
  %33 = load i32* %il, align 4
  %cmp60 = icmp ne i32 %33, 1
  br i1 %cmp60, label %if.then62, label %if.end67

if.then62:                                        ; preds = %if.end57
  store i32 256, i32* %lrc, align 4
  %34 = load i32* %prlc, align 4
  %tobool63 = icmp ne i32 %34, 0
  br i1 %tobool63, label %if.then64, label %if.end66

if.then64:                                        ; preds = %if.then62
  %35 = load i32* %lrc, align 4
  %call65 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %35)
  br label %if.end66

if.end66:                                         ; preds = %if.then64, %if.then62
  br label %if.end67

if.end67:                                         ; preds = %if.end66, %if.end57
  store i32 5, i32* %il, align 4
  store i16 2, i16* %sr, align 2
  %36 = load i16* %sr, align 2
  %conv68 = sext i16 %36 to i32
  %37 = load i32* %il, align 4
  %rem69 = srem i32 %37, %conv68
  store i32 %rem69, i32* %il, align 4
  %38 = load i32* %il, align 4
  %cmp70 = icmp ne i32 %38, 1
  br i1 %cmp70, label %if.then72, label %if.end77

if.then72:                                        ; preds = %if.end67
  store i32 257, i32* %lrc, align 4
  %39 = load i32* %prlc, align 4
  %tobool73 = icmp ne i32 %39, 0
  br i1 %tobool73, label %if.then74, label %if.end76

if.then74:                                        ; preds = %if.then72
  %40 = load i32* %lrc, align 4
  %call75 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %40)
  br label %if.end76

if.end76:                                         ; preds = %if.then74, %if.then72
  br label %if.end77

if.end77:                                         ; preds = %if.end76, %if.end67
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ir, align 4
  %41 = load i32* %ir, align 4
  %42 = load i32* %il, align 4
  %rem78 = srem i32 %42, %41
  store i32 %rem78, i32* %il, align 4
  %43 = load i32* %il, align 4
  %cmp79 = icmp ne i32 %43, 1
  br i1 %cmp79, label %if.then81, label %if.end86

if.then81:                                        ; preds = %if.end77
  store i32 258, i32* %lrc, align 4
  %44 = load i32* %prlc, align 4
  %tobool82 = icmp ne i32 %44, 0
  br i1 %tobool82, label %if.then83, label %if.end85

if.then83:                                        ; preds = %if.then81
  %45 = load i32* %lrc, align 4
  %call84 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %45)
  br label %if.end85

if.end85:                                         ; preds = %if.then83, %if.then81
  br label %if.end86

if.end86:                                         ; preds = %if.end85, %if.end77
  store i32 5, i32* %il, align 4
  store i64 2, i64* %lr, align 8
  %46 = load i64* %lr, align 8
  %47 = load i32* %il, align 4
  %conv87 = sext i32 %47 to i64
  %rem88 = srem i64 %conv87, %46
  %conv89 = trunc i64 %rem88 to i32
  store i32 %conv89, i32* %il, align 4
  %48 = load i32* %il, align 4
  %cmp90 = icmp ne i32 %48, 1
  br i1 %cmp90, label %if.then92, label %if.end97

if.then92:                                        ; preds = %if.end86
  store i32 259, i32* %lrc, align 4
  %49 = load i32* %prlc, align 4
  %tobool93 = icmp ne i32 %49, 0
  br i1 %tobool93, label %if.then94, label %if.end96

if.then94:                                        ; preds = %if.then92
  %50 = load i32* %lrc, align 4
  %call95 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %50)
  br label %if.end96

if.end96:                                         ; preds = %if.then94, %if.then92
  br label %if.end97

if.end97:                                         ; preds = %if.end96, %if.end86
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ur, align 4
  %51 = load i32* %ur, align 4
  %52 = load i32* %il, align 4
  %rem98 = urem i32 %52, %51
  store i32 %rem98, i32* %il, align 4
  %53 = load i32* %il, align 4
  %cmp99 = icmp ne i32 %53, 1
  br i1 %cmp99, label %if.then101, label %if.end106

if.then101:                                       ; preds = %if.end97
  store i32 260, i32* %lrc, align 4
  %54 = load i32* %prlc, align 4
  %tobool102 = icmp ne i32 %54, 0
  br i1 %tobool102, label %if.then103, label %if.end105

if.then103:                                       ; preds = %if.then101
  %55 = load i32* %lrc, align 4
  %call104 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %55)
  br label %if.end105

if.end105:                                        ; preds = %if.then103, %if.then101
  br label %if.end106

if.end106:                                        ; preds = %if.end105, %if.end97
  store i64 5, i64* %ll, align 8
  store i8 2, i8* %cr, align 1
  %56 = load i8* %cr, align 1
  %conv107 = sext i8 %56 to i64
  %57 = load i64* %ll, align 8
  %rem108 = srem i64 %57, %conv107
  store i64 %rem108, i64* %ll, align 8
  %58 = load i64* %ll, align 8
  %cmp109 = icmp ne i64 %58, 1
  br i1 %cmp109, label %if.then111, label %if.end116

if.then111:                                       ; preds = %if.end106
  store i32 261, i32* %lrc, align 4
  %59 = load i32* %prlc, align 4
  %tobool112 = icmp ne i32 %59, 0
  br i1 %tobool112, label %if.then113, label %if.end115

if.then113:                                       ; preds = %if.then111
  %60 = load i32* %lrc, align 4
  %call114 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %60)
  br label %if.end115

if.end115:                                        ; preds = %if.then113, %if.then111
  br label %if.end116

if.end116:                                        ; preds = %if.end115, %if.end106
  store i64 5, i64* %ll, align 8
  store i16 2, i16* %sr, align 2
  %61 = load i16* %sr, align 2
  %conv117 = sext i16 %61 to i64
  %62 = load i64* %ll, align 8
  %rem118 = srem i64 %62, %conv117
  store i64 %rem118, i64* %ll, align 8
  %63 = load i64* %ll, align 8
  %cmp119 = icmp ne i64 %63, 1
  br i1 %cmp119, label %if.then121, label %if.end126

if.then121:                                       ; preds = %if.end116
  store i32 262, i32* %lrc, align 4
  %64 = load i32* %prlc, align 4
  %tobool122 = icmp ne i32 %64, 0
  br i1 %tobool122, label %if.then123, label %if.end125

if.then123:                                       ; preds = %if.then121
  %65 = load i32* %lrc, align 4
  %call124 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %65)
  br label %if.end125

if.end125:                                        ; preds = %if.then123, %if.then121
  br label %if.end126

if.end126:                                        ; preds = %if.end125, %if.end116
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ir, align 4
  %66 = load i32* %ir, align 4
  %conv127 = sext i32 %66 to i64
  %67 = load i64* %ll, align 8
  %rem128 = srem i64 %67, %conv127
  store i64 %rem128, i64* %ll, align 8
  %68 = load i64* %ll, align 8
  %cmp129 = icmp ne i64 %68, 1
  br i1 %cmp129, label %if.then131, label %if.end136

if.then131:                                       ; preds = %if.end126
  store i32 263, i32* %lrc, align 4
  %69 = load i32* %prlc, align 4
  %tobool132 = icmp ne i32 %69, 0
  br i1 %tobool132, label %if.then133, label %if.end135

if.then133:                                       ; preds = %if.then131
  %70 = load i32* %lrc, align 4
  %call134 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %70)
  br label %if.end135

if.end135:                                        ; preds = %if.then133, %if.then131
  br label %if.end136

if.end136:                                        ; preds = %if.end135, %if.end126
  store i64 5, i64* %ll, align 8
  store i64 2, i64* %lr, align 8
  %71 = load i64* %lr, align 8
  %72 = load i64* %ll, align 8
  %rem137 = srem i64 %72, %71
  store i64 %rem137, i64* %ll, align 8
  %73 = load i64* %ll, align 8
  %cmp138 = icmp ne i64 %73, 1
  br i1 %cmp138, label %if.then140, label %if.end145

if.then140:                                       ; preds = %if.end136
  store i32 264, i32* %lrc, align 4
  %74 = load i32* %prlc, align 4
  %tobool141 = icmp ne i32 %74, 0
  br i1 %tobool141, label %if.then142, label %if.end144

if.then142:                                       ; preds = %if.then140
  %75 = load i32* %lrc, align 4
  %call143 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %75)
  br label %if.end144

if.end144:                                        ; preds = %if.then142, %if.then140
  br label %if.end145

if.end145:                                        ; preds = %if.end144, %if.end136
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ur, align 4
  %76 = load i32* %ur, align 4
  %conv146 = zext i32 %76 to i64
  %77 = load i64* %ll, align 8
  %rem147 = srem i64 %77, %conv146
  store i64 %rem147, i64* %ll, align 8
  %78 = load i64* %ll, align 8
  %cmp148 = icmp ne i64 %78, 1
  br i1 %cmp148, label %if.then150, label %if.end155

if.then150:                                       ; preds = %if.end145
  store i32 265, i32* %lrc, align 4
  %79 = load i32* %prlc, align 4
  %tobool151 = icmp ne i32 %79, 0
  br i1 %tobool151, label %if.then152, label %if.end154

if.then152:                                       ; preds = %if.then150
  %80 = load i32* %lrc, align 4
  %call153 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %80)
  br label %if.end154

if.end154:                                        ; preds = %if.then152, %if.then150
  br label %if.end155

if.end155:                                        ; preds = %if.end154, %if.end145
  store i32 5, i32* %ul, align 4
  store i8 2, i8* %cr, align 1
  %81 = load i8* %cr, align 1
  %conv156 = sext i8 %81 to i32
  %82 = load i32* %ul, align 4
  %rem157 = urem i32 %82, %conv156
  store i32 %rem157, i32* %ul, align 4
  %83 = load i32* %ul, align 4
  %cmp158 = icmp ne i32 %83, 1
  br i1 %cmp158, label %if.then160, label %if.end165

if.then160:                                       ; preds = %if.end155
  store i32 266, i32* %lrc, align 4
  %84 = load i32* %prlc, align 4
  %tobool161 = icmp ne i32 %84, 0
  br i1 %tobool161, label %if.then162, label %if.end164

if.then162:                                       ; preds = %if.then160
  %85 = load i32* %lrc, align 4
  %call163 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %85)
  br label %if.end164

if.end164:                                        ; preds = %if.then162, %if.then160
  br label %if.end165

if.end165:                                        ; preds = %if.end164, %if.end155
  store i32 5, i32* %ul, align 4
  store i16 2, i16* %sr, align 2
  %86 = load i16* %sr, align 2
  %conv166 = sext i16 %86 to i32
  %87 = load i32* %ul, align 4
  %rem167 = urem i32 %87, %conv166
  store i32 %rem167, i32* %ul, align 4
  %88 = load i32* %ul, align 4
  %cmp168 = icmp ne i32 %88, 1
  br i1 %cmp168, label %if.then170, label %if.end175

if.then170:                                       ; preds = %if.end165
  store i32 267, i32* %lrc, align 4
  %89 = load i32* %prlc, align 4
  %tobool171 = icmp ne i32 %89, 0
  br i1 %tobool171, label %if.then172, label %if.end174

if.then172:                                       ; preds = %if.then170
  %90 = load i32* %lrc, align 4
  %call173 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %90)
  br label %if.end174

if.end174:                                        ; preds = %if.then172, %if.then170
  br label %if.end175

if.end175:                                        ; preds = %if.end174, %if.end165
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ir, align 4
  %91 = load i32* %ir, align 4
  %92 = load i32* %ul, align 4
  %rem176 = urem i32 %92, %91
  store i32 %rem176, i32* %ul, align 4
  %93 = load i32* %ul, align 4
  %cmp177 = icmp ne i32 %93, 1
  br i1 %cmp177, label %if.then179, label %if.end184

if.then179:                                       ; preds = %if.end175
  store i32 268, i32* %lrc, align 4
  %94 = load i32* %prlc, align 4
  %tobool180 = icmp ne i32 %94, 0
  br i1 %tobool180, label %if.then181, label %if.end183

if.then181:                                       ; preds = %if.then179
  %95 = load i32* %lrc, align 4
  %call182 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %95)
  br label %if.end183

if.end183:                                        ; preds = %if.then181, %if.then179
  br label %if.end184

if.end184:                                        ; preds = %if.end183, %if.end175
  store i32 5, i32* %ul, align 4
  store i64 2, i64* %lr, align 8
  %96 = load i64* %lr, align 8
  %97 = load i32* %ul, align 4
  %conv185 = zext i32 %97 to i64
  %rem186 = srem i64 %conv185, %96
  %conv187 = trunc i64 %rem186 to i32
  store i32 %conv187, i32* %ul, align 4
  %98 = load i32* %ul, align 4
  %cmp188 = icmp ne i32 %98, 1
  br i1 %cmp188, label %if.then190, label %if.end195

if.then190:                                       ; preds = %if.end184
  store i32 269, i32* %lrc, align 4
  %99 = load i32* %prlc, align 4
  %tobool191 = icmp ne i32 %99, 0
  br i1 %tobool191, label %if.then192, label %if.end194

if.then192:                                       ; preds = %if.then190
  %100 = load i32* %lrc, align 4
  %call193 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %100)
  br label %if.end194

if.end194:                                        ; preds = %if.then192, %if.then190
  br label %if.end195

if.end195:                                        ; preds = %if.end194, %if.end184
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ur, align 4
  %101 = load i32* %ur, align 4
  %102 = load i32* %ul, align 4
  %rem196 = urem i32 %102, %101
  store i32 %rem196, i32* %ul, align 4
  %103 = load i32* %ul, align 4
  %cmp197 = icmp ne i32 %103, 1
  br i1 %cmp197, label %if.then199, label %if.end204

if.then199:                                       ; preds = %if.end195
  store i32 270, i32* %lrc, align 4
  %104 = load i32* %prlc, align 4
  %tobool200 = icmp ne i32 %104, 0
  br i1 %tobool200, label %if.then201, label %if.end203

if.then201:                                       ; preds = %if.then199
  %105 = load i32* %lrc, align 4
  %call202 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %105)
  br label %if.end203

if.end203:                                        ; preds = %if.then201, %if.then199
  br label %if.end204

if.end204:                                        ; preds = %if.end203, %if.end195
  store i8 5, i8* %cl, align 1
  store i8 2, i8* %cr, align 1
  %106 = load i8* %cr, align 1
  %conv205 = sext i8 %106 to i32
  %107 = load i8* %cl, align 1
  %conv206 = sext i8 %107 to i32
  %shr = ashr i32 %conv206, %conv205
  %conv207 = trunc i32 %shr to i8
  store i8 %conv207, i8* %cl, align 1
  %108 = load i8* %cl, align 1
  %conv208 = sext i8 %108 to i32
  %cmp209 = icmp ne i32 %conv208, 1
  br i1 %cmp209, label %if.then211, label %if.end216

if.then211:                                       ; preds = %if.end204
  store i32 271, i32* %lrc, align 4
  %109 = load i32* %prlc, align 4
  %tobool212 = icmp ne i32 %109, 0
  br i1 %tobool212, label %if.then213, label %if.end215

if.then213:                                       ; preds = %if.then211
  %110 = load i32* %lrc, align 4
  %call214 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %110)
  br label %if.end215

if.end215:                                        ; preds = %if.then213, %if.then211
  br label %if.end216

if.end216:                                        ; preds = %if.end215, %if.end204
  store i8 5, i8* %cl, align 1
  store i16 2, i16* %sr, align 2
  %111 = load i16* %sr, align 2
  %conv217 = sext i16 %111 to i32
  %112 = load i8* %cl, align 1
  %conv218 = sext i8 %112 to i32
  %shr219 = ashr i32 %conv218, %conv217
  %conv220 = trunc i32 %shr219 to i8
  store i8 %conv220, i8* %cl, align 1
  %113 = load i8* %cl, align 1
  %conv221 = sext i8 %113 to i32
  %cmp222 = icmp ne i32 %conv221, 1
  br i1 %cmp222, label %if.then224, label %if.end229

if.then224:                                       ; preds = %if.end216
  store i32 272, i32* %lrc, align 4
  %114 = load i32* %prlc, align 4
  %tobool225 = icmp ne i32 %114, 0
  br i1 %tobool225, label %if.then226, label %if.end228

if.then226:                                       ; preds = %if.then224
  %115 = load i32* %lrc, align 4
  %call227 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %115)
  br label %if.end228

if.end228:                                        ; preds = %if.then226, %if.then224
  br label %if.end229

if.end229:                                        ; preds = %if.end228, %if.end216
  store i8 5, i8* %cl, align 1
  store i32 2, i32* %ir, align 4
  %116 = load i32* %ir, align 4
  %117 = load i8* %cl, align 1
  %conv230 = sext i8 %117 to i32
  %shr231 = ashr i32 %conv230, %116
  %conv232 = trunc i32 %shr231 to i8
  store i8 %conv232, i8* %cl, align 1
  %118 = load i8* %cl, align 1
  %conv233 = sext i8 %118 to i32
  %cmp234 = icmp ne i32 %conv233, 1
  br i1 %cmp234, label %if.then236, label %if.end241

if.then236:                                       ; preds = %if.end229
  store i32 273, i32* %lrc, align 4
  %119 = load i32* %prlc, align 4
  %tobool237 = icmp ne i32 %119, 0
  br i1 %tobool237, label %if.then238, label %if.end240

if.then238:                                       ; preds = %if.then236
  %120 = load i32* %lrc, align 4
  %call239 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %120)
  br label %if.end240

if.end240:                                        ; preds = %if.then238, %if.then236
  br label %if.end241

if.end241:                                        ; preds = %if.end240, %if.end229
  store i8 5, i8* %cl, align 1
  store i64 2, i64* %lr, align 8
  %121 = load i64* %lr, align 8
  %122 = load i8* %cl, align 1
  %conv242 = sext i8 %122 to i32
  %sh_prom = trunc i64 %121 to i32
  %shr243 = ashr i32 %conv242, %sh_prom
  %conv244 = trunc i32 %shr243 to i8
  store i8 %conv244, i8* %cl, align 1
  %123 = load i8* %cl, align 1
  %conv245 = sext i8 %123 to i32
  %cmp246 = icmp ne i32 %conv245, 1
  br i1 %cmp246, label %if.then248, label %if.end253

if.then248:                                       ; preds = %if.end241
  store i32 274, i32* %lrc, align 4
  %124 = load i32* %prlc, align 4
  %tobool249 = icmp ne i32 %124, 0
  br i1 %tobool249, label %if.then250, label %if.end252

if.then250:                                       ; preds = %if.then248
  %125 = load i32* %lrc, align 4
  %call251 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %125)
  br label %if.end252

if.end252:                                        ; preds = %if.then250, %if.then248
  br label %if.end253

if.end253:                                        ; preds = %if.end252, %if.end241
  store i8 5, i8* %cl, align 1
  store i32 2, i32* %ur, align 4
  %126 = load i32* %ur, align 4
  %127 = load i8* %cl, align 1
  %conv254 = sext i8 %127 to i32
  %shr255 = ashr i32 %conv254, %126
  %conv256 = trunc i32 %shr255 to i8
  store i8 %conv256, i8* %cl, align 1
  %128 = load i8* %cl, align 1
  %conv257 = sext i8 %128 to i32
  %cmp258 = icmp ne i32 %conv257, 1
  br i1 %cmp258, label %if.then260, label %if.end265

if.then260:                                       ; preds = %if.end253
  store i32 275, i32* %lrc, align 4
  %129 = load i32* %prlc, align 4
  %tobool261 = icmp ne i32 %129, 0
  br i1 %tobool261, label %if.then262, label %if.end264

if.then262:                                       ; preds = %if.then260
  %130 = load i32* %lrc, align 4
  %call263 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %130)
  br label %if.end264

if.end264:                                        ; preds = %if.then262, %if.then260
  br label %if.end265

if.end265:                                        ; preds = %if.end264, %if.end253
  store i16 5, i16* %sl, align 2
  store i8 2, i8* %cr, align 1
  %131 = load i8* %cr, align 1
  %conv266 = sext i8 %131 to i32
  %132 = load i16* %sl, align 2
  %conv267 = sext i16 %132 to i32
  %shr268 = ashr i32 %conv267, %conv266
  %conv269 = trunc i32 %shr268 to i16
  store i16 %conv269, i16* %sl, align 2
  %133 = load i16* %sl, align 2
  %conv270 = sext i16 %133 to i32
  %cmp271 = icmp ne i32 %conv270, 1
  br i1 %cmp271, label %if.then273, label %if.end278

if.then273:                                       ; preds = %if.end265
  store i32 276, i32* %lrc, align 4
  %134 = load i32* %prlc, align 4
  %tobool274 = icmp ne i32 %134, 0
  br i1 %tobool274, label %if.then275, label %if.end277

if.then275:                                       ; preds = %if.then273
  %135 = load i32* %lrc, align 4
  %call276 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %135)
  br label %if.end277

if.end277:                                        ; preds = %if.then275, %if.then273
  br label %if.end278

if.end278:                                        ; preds = %if.end277, %if.end265
  store i16 5, i16* %sl, align 2
  store i16 2, i16* %sr, align 2
  %136 = load i16* %sr, align 2
  %conv279 = sext i16 %136 to i32
  %137 = load i16* %sl, align 2
  %conv280 = sext i16 %137 to i32
  %shr281 = ashr i32 %conv280, %conv279
  %conv282 = trunc i32 %shr281 to i16
  store i16 %conv282, i16* %sl, align 2
  %138 = load i16* %sl, align 2
  %conv283 = sext i16 %138 to i32
  %cmp284 = icmp ne i32 %conv283, 1
  br i1 %cmp284, label %if.then286, label %if.end291

if.then286:                                       ; preds = %if.end278
  store i32 277, i32* %lrc, align 4
  %139 = load i32* %prlc, align 4
  %tobool287 = icmp ne i32 %139, 0
  br i1 %tobool287, label %if.then288, label %if.end290

if.then288:                                       ; preds = %if.then286
  %140 = load i32* %lrc, align 4
  %call289 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %140)
  br label %if.end290

if.end290:                                        ; preds = %if.then288, %if.then286
  br label %if.end291

if.end291:                                        ; preds = %if.end290, %if.end278
  store i16 5, i16* %sl, align 2
  store i32 2, i32* %ir, align 4
  %141 = load i32* %ir, align 4
  %142 = load i16* %sl, align 2
  %conv292 = sext i16 %142 to i32
  %shr293 = ashr i32 %conv292, %141
  %conv294 = trunc i32 %shr293 to i16
  store i16 %conv294, i16* %sl, align 2
  %143 = load i16* %sl, align 2
  %conv295 = sext i16 %143 to i32
  %cmp296 = icmp ne i32 %conv295, 1
  br i1 %cmp296, label %if.then298, label %if.end303

if.then298:                                       ; preds = %if.end291
  store i32 278, i32* %lrc, align 4
  %144 = load i32* %prlc, align 4
  %tobool299 = icmp ne i32 %144, 0
  br i1 %tobool299, label %if.then300, label %if.end302

if.then300:                                       ; preds = %if.then298
  %145 = load i32* %lrc, align 4
  %call301 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %145)
  br label %if.end302

if.end302:                                        ; preds = %if.then300, %if.then298
  br label %if.end303

if.end303:                                        ; preds = %if.end302, %if.end291
  store i16 5, i16* %sl, align 2
  store i64 2, i64* %lr, align 8
  %146 = load i64* %lr, align 8
  %147 = load i16* %sl, align 2
  %conv304 = sext i16 %147 to i32
  %sh_prom305 = trunc i64 %146 to i32
  %shr306 = ashr i32 %conv304, %sh_prom305
  %conv307 = trunc i32 %shr306 to i16
  store i16 %conv307, i16* %sl, align 2
  %148 = load i16* %sl, align 2
  %conv308 = sext i16 %148 to i32
  %cmp309 = icmp ne i32 %conv308, 1
  br i1 %cmp309, label %if.then311, label %if.end316

if.then311:                                       ; preds = %if.end303
  store i32 279, i32* %lrc, align 4
  %149 = load i32* %prlc, align 4
  %tobool312 = icmp ne i32 %149, 0
  br i1 %tobool312, label %if.then313, label %if.end315

if.then313:                                       ; preds = %if.then311
  %150 = load i32* %lrc, align 4
  %call314 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %150)
  br label %if.end315

if.end315:                                        ; preds = %if.then313, %if.then311
  br label %if.end316

if.end316:                                        ; preds = %if.end315, %if.end303
  store i16 5, i16* %sl, align 2
  store i32 2, i32* %ur, align 4
  %151 = load i32* %ur, align 4
  %152 = load i16* %sl, align 2
  %conv317 = sext i16 %152 to i32
  %shr318 = ashr i32 %conv317, %151
  %conv319 = trunc i32 %shr318 to i16
  store i16 %conv319, i16* %sl, align 2
  %153 = load i16* %sl, align 2
  %conv320 = sext i16 %153 to i32
  %cmp321 = icmp ne i32 %conv320, 1
  br i1 %cmp321, label %if.then323, label %if.end328

if.then323:                                       ; preds = %if.end316
  store i32 280, i32* %lrc, align 4
  %154 = load i32* %prlc, align 4
  %tobool324 = icmp ne i32 %154, 0
  br i1 %tobool324, label %if.then325, label %if.end327

if.then325:                                       ; preds = %if.then323
  %155 = load i32* %lrc, align 4
  %call326 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %155)
  br label %if.end327

if.end327:                                        ; preds = %if.then325, %if.then323
  br label %if.end328

if.end328:                                        ; preds = %if.end327, %if.end316
  store i32 5, i32* %il, align 4
  store i8 2, i8* %cr, align 1
  %156 = load i8* %cr, align 1
  %conv329 = sext i8 %156 to i32
  %157 = load i32* %il, align 4
  %shr330 = ashr i32 %157, %conv329
  store i32 %shr330, i32* %il, align 4
  %158 = load i32* %il, align 4
  %cmp331 = icmp ne i32 %158, 1
  br i1 %cmp331, label %if.then333, label %if.end338

if.then333:                                       ; preds = %if.end328
  store i32 281, i32* %lrc, align 4
  %159 = load i32* %prlc, align 4
  %tobool334 = icmp ne i32 %159, 0
  br i1 %tobool334, label %if.then335, label %if.end337

if.then335:                                       ; preds = %if.then333
  %160 = load i32* %lrc, align 4
  %call336 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %160)
  br label %if.end337

if.end337:                                        ; preds = %if.then335, %if.then333
  br label %if.end338

if.end338:                                        ; preds = %if.end337, %if.end328
  store i32 5, i32* %il, align 4
  store i16 2, i16* %sr, align 2
  %161 = load i16* %sr, align 2
  %conv339 = sext i16 %161 to i32
  %162 = load i32* %il, align 4
  %shr340 = ashr i32 %162, %conv339
  store i32 %shr340, i32* %il, align 4
  %163 = load i32* %il, align 4
  %cmp341 = icmp ne i32 %163, 1
  br i1 %cmp341, label %if.then343, label %if.end348

if.then343:                                       ; preds = %if.end338
  store i32 282, i32* %lrc, align 4
  %164 = load i32* %prlc, align 4
  %tobool344 = icmp ne i32 %164, 0
  br i1 %tobool344, label %if.then345, label %if.end347

if.then345:                                       ; preds = %if.then343
  %165 = load i32* %lrc, align 4
  %call346 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %165)
  br label %if.end347

if.end347:                                        ; preds = %if.then345, %if.then343
  br label %if.end348

if.end348:                                        ; preds = %if.end347, %if.end338
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ir, align 4
  %166 = load i32* %ir, align 4
  %167 = load i32* %il, align 4
  %shr349 = ashr i32 %167, %166
  store i32 %shr349, i32* %il, align 4
  %168 = load i32* %il, align 4
  %cmp350 = icmp ne i32 %168, 1
  br i1 %cmp350, label %if.then352, label %if.end357

if.then352:                                       ; preds = %if.end348
  store i32 283, i32* %lrc, align 4
  %169 = load i32* %prlc, align 4
  %tobool353 = icmp ne i32 %169, 0
  br i1 %tobool353, label %if.then354, label %if.end356

if.then354:                                       ; preds = %if.then352
  %170 = load i32* %lrc, align 4
  %call355 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %170)
  br label %if.end356

if.end356:                                        ; preds = %if.then354, %if.then352
  br label %if.end357

if.end357:                                        ; preds = %if.end356, %if.end348
  store i32 5, i32* %il, align 4
  store i64 2, i64* %lr, align 8
  %171 = load i64* %lr, align 8
  %172 = load i32* %il, align 4
  %sh_prom358 = trunc i64 %171 to i32
  %shr359 = ashr i32 %172, %sh_prom358
  store i32 %shr359, i32* %il, align 4
  %173 = load i32* %il, align 4
  %cmp360 = icmp ne i32 %173, 1
  br i1 %cmp360, label %if.then362, label %if.end367

if.then362:                                       ; preds = %if.end357
  store i32 284, i32* %lrc, align 4
  %174 = load i32* %prlc, align 4
  %tobool363 = icmp ne i32 %174, 0
  br i1 %tobool363, label %if.then364, label %if.end366

if.then364:                                       ; preds = %if.then362
  %175 = load i32* %lrc, align 4
  %call365 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %175)
  br label %if.end366

if.end366:                                        ; preds = %if.then364, %if.then362
  br label %if.end367

if.end367:                                        ; preds = %if.end366, %if.end357
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ur, align 4
  %176 = load i32* %ur, align 4
  %177 = load i32* %il, align 4
  %shr368 = ashr i32 %177, %176
  store i32 %shr368, i32* %il, align 4
  %178 = load i32* %il, align 4
  %cmp369 = icmp ne i32 %178, 1
  br i1 %cmp369, label %if.then371, label %if.end376

if.then371:                                       ; preds = %if.end367
  store i32 285, i32* %lrc, align 4
  %179 = load i32* %prlc, align 4
  %tobool372 = icmp ne i32 %179, 0
  br i1 %tobool372, label %if.then373, label %if.end375

if.then373:                                       ; preds = %if.then371
  %180 = load i32* %lrc, align 4
  %call374 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %180)
  br label %if.end375

if.end375:                                        ; preds = %if.then373, %if.then371
  br label %if.end376

if.end376:                                        ; preds = %if.end375, %if.end367
  store i64 5, i64* %ll, align 8
  store i8 2, i8* %cr, align 1
  %181 = load i8* %cr, align 1
  %conv377 = sext i8 %181 to i32
  %182 = load i64* %ll, align 8
  %sh_prom378 = zext i32 %conv377 to i64
  %shr379 = ashr i64 %182, %sh_prom378
  store i64 %shr379, i64* %ll, align 8
  %183 = load i64* %ll, align 8
  %cmp380 = icmp ne i64 %183, 1
  br i1 %cmp380, label %if.then382, label %if.end387

if.then382:                                       ; preds = %if.end376
  store i32 286, i32* %lrc, align 4
  %184 = load i32* %prlc, align 4
  %tobool383 = icmp ne i32 %184, 0
  br i1 %tobool383, label %if.then384, label %if.end386

if.then384:                                       ; preds = %if.then382
  %185 = load i32* %lrc, align 4
  %call385 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %185)
  br label %if.end386

if.end386:                                        ; preds = %if.then384, %if.then382
  br label %if.end387

if.end387:                                        ; preds = %if.end386, %if.end376
  store i64 5, i64* %ll, align 8
  store i16 2, i16* %sr, align 2
  %186 = load i16* %sr, align 2
  %conv388 = sext i16 %186 to i32
  %187 = load i64* %ll, align 8
  %sh_prom389 = zext i32 %conv388 to i64
  %shr390 = ashr i64 %187, %sh_prom389
  store i64 %shr390, i64* %ll, align 8
  %188 = load i64* %ll, align 8
  %cmp391 = icmp ne i64 %188, 1
  br i1 %cmp391, label %if.then393, label %if.end398

if.then393:                                       ; preds = %if.end387
  store i32 287, i32* %lrc, align 4
  %189 = load i32* %prlc, align 4
  %tobool394 = icmp ne i32 %189, 0
  br i1 %tobool394, label %if.then395, label %if.end397

if.then395:                                       ; preds = %if.then393
  %190 = load i32* %lrc, align 4
  %call396 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %190)
  br label %if.end397

if.end397:                                        ; preds = %if.then395, %if.then393
  br label %if.end398

if.end398:                                        ; preds = %if.end397, %if.end387
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ir, align 4
  %191 = load i32* %ir, align 4
  %192 = load i64* %ll, align 8
  %sh_prom399 = zext i32 %191 to i64
  %shr400 = ashr i64 %192, %sh_prom399
  store i64 %shr400, i64* %ll, align 8
  %193 = load i64* %ll, align 8
  %cmp401 = icmp ne i64 %193, 1
  br i1 %cmp401, label %if.then403, label %if.end408

if.then403:                                       ; preds = %if.end398
  store i32 288, i32* %lrc, align 4
  %194 = load i32* %prlc, align 4
  %tobool404 = icmp ne i32 %194, 0
  br i1 %tobool404, label %if.then405, label %if.end407

if.then405:                                       ; preds = %if.then403
  %195 = load i32* %lrc, align 4
  %call406 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %195)
  br label %if.end407

if.end407:                                        ; preds = %if.then405, %if.then403
  br label %if.end408

if.end408:                                        ; preds = %if.end407, %if.end398
  store i64 5, i64* %ll, align 8
  store i64 2, i64* %lr, align 8
  %196 = load i64* %lr, align 8
  %197 = load i64* %ll, align 8
  %shr409 = ashr i64 %197, %196
  store i64 %shr409, i64* %ll, align 8
  %198 = load i64* %ll, align 8
  %cmp410 = icmp ne i64 %198, 1
  br i1 %cmp410, label %if.then412, label %if.end417

if.then412:                                       ; preds = %if.end408
  store i32 289, i32* %lrc, align 4
  %199 = load i32* %prlc, align 4
  %tobool413 = icmp ne i32 %199, 0
  br i1 %tobool413, label %if.then414, label %if.end416

if.then414:                                       ; preds = %if.then412
  %200 = load i32* %lrc, align 4
  %call415 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %200)
  br label %if.end416

if.end416:                                        ; preds = %if.then414, %if.then412
  br label %if.end417

if.end417:                                        ; preds = %if.end416, %if.end408
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ur, align 4
  %201 = load i32* %ur, align 4
  %202 = load i64* %ll, align 8
  %sh_prom418 = zext i32 %201 to i64
  %shr419 = ashr i64 %202, %sh_prom418
  store i64 %shr419, i64* %ll, align 8
  %203 = load i64* %ll, align 8
  %cmp420 = icmp ne i64 %203, 1
  br i1 %cmp420, label %if.then422, label %if.end427

if.then422:                                       ; preds = %if.end417
  store i32 290, i32* %lrc, align 4
  %204 = load i32* %prlc, align 4
  %tobool423 = icmp ne i32 %204, 0
  br i1 %tobool423, label %if.then424, label %if.end426

if.then424:                                       ; preds = %if.then422
  %205 = load i32* %lrc, align 4
  %call425 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %205)
  br label %if.end426

if.end426:                                        ; preds = %if.then424, %if.then422
  br label %if.end427

if.end427:                                        ; preds = %if.end426, %if.end417
  store i32 5, i32* %ul, align 4
  store i8 2, i8* %cr, align 1
  %206 = load i8* %cr, align 1
  %conv428 = sext i8 %206 to i32
  %207 = load i32* %ul, align 4
  %shr429 = lshr i32 %207, %conv428
  store i32 %shr429, i32* %ul, align 4
  %208 = load i32* %ul, align 4
  %cmp430 = icmp ne i32 %208, 1
  br i1 %cmp430, label %if.then432, label %if.end437

if.then432:                                       ; preds = %if.end427
  store i32 291, i32* %lrc, align 4
  %209 = load i32* %prlc, align 4
  %tobool433 = icmp ne i32 %209, 0
  br i1 %tobool433, label %if.then434, label %if.end436

if.then434:                                       ; preds = %if.then432
  %210 = load i32* %lrc, align 4
  %call435 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %210)
  br label %if.end436

if.end436:                                        ; preds = %if.then434, %if.then432
  br label %if.end437

if.end437:                                        ; preds = %if.end436, %if.end427
  store i32 5, i32* %ul, align 4
  store i16 2, i16* %sr, align 2
  %211 = load i16* %sr, align 2
  %conv438 = sext i16 %211 to i32
  %212 = load i32* %ul, align 4
  %shr439 = lshr i32 %212, %conv438
  store i32 %shr439, i32* %ul, align 4
  %213 = load i32* %ul, align 4
  %cmp440 = icmp ne i32 %213, 1
  br i1 %cmp440, label %if.then442, label %if.end447

if.then442:                                       ; preds = %if.end437
  store i32 292, i32* %lrc, align 4
  %214 = load i32* %prlc, align 4
  %tobool443 = icmp ne i32 %214, 0
  br i1 %tobool443, label %if.then444, label %if.end446

if.then444:                                       ; preds = %if.then442
  %215 = load i32* %lrc, align 4
  %call445 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %215)
  br label %if.end446

if.end446:                                        ; preds = %if.then444, %if.then442
  br label %if.end447

if.end447:                                        ; preds = %if.end446, %if.end437
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ir, align 4
  %216 = load i32* %ir, align 4
  %217 = load i32* %ul, align 4
  %shr448 = lshr i32 %217, %216
  store i32 %shr448, i32* %ul, align 4
  %218 = load i32* %ul, align 4
  %cmp449 = icmp ne i32 %218, 1
  br i1 %cmp449, label %if.then451, label %if.end456

if.then451:                                       ; preds = %if.end447
  store i32 293, i32* %lrc, align 4
  %219 = load i32* %prlc, align 4
  %tobool452 = icmp ne i32 %219, 0
  br i1 %tobool452, label %if.then453, label %if.end455

if.then453:                                       ; preds = %if.then451
  %220 = load i32* %lrc, align 4
  %call454 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %220)
  br label %if.end455

if.end455:                                        ; preds = %if.then453, %if.then451
  br label %if.end456

if.end456:                                        ; preds = %if.end455, %if.end447
  store i32 5, i32* %ul, align 4
  store i64 2, i64* %lr, align 8
  %221 = load i64* %lr, align 8
  %222 = load i32* %ul, align 4
  %sh_prom457 = trunc i64 %221 to i32
  %shr458 = lshr i32 %222, %sh_prom457
  store i32 %shr458, i32* %ul, align 4
  %223 = load i32* %ul, align 4
  %cmp459 = icmp ne i32 %223, 1
  br i1 %cmp459, label %if.then461, label %if.end466

if.then461:                                       ; preds = %if.end456
  store i32 294, i32* %lrc, align 4
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
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ur, align 4
  %226 = load i32* %ur, align 4
  %227 = load i32* %ul, align 4
  %shr467 = lshr i32 %227, %226
  store i32 %shr467, i32* %ul, align 4
  %228 = load i32* %ul, align 4
  %cmp468 = icmp ne i32 %228, 1
  br i1 %cmp468, label %if.then470, label %if.end475

if.then470:                                       ; preds = %if.end466
  store i32 295, i32* %lrc, align 4
  %229 = load i32* %prlc, align 4
  %tobool471 = icmp ne i32 %229, 0
  br i1 %tobool471, label %if.then472, label %if.end474

if.then472:                                       ; preds = %if.then470
  %230 = load i32* %lrc, align 4
  %call473 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %230)
  br label %if.end474

if.end474:                                        ; preds = %if.then472, %if.then470
  br label %if.end475

if.end475:                                        ; preds = %if.end474, %if.end466
  store i8 5, i8* %cl, align 1
  store i8 2, i8* %cr, align 1
  %231 = load i8* %cr, align 1
  %conv476 = sext i8 %231 to i32
  %232 = load i8* %cl, align 1
  %conv477 = sext i8 %232 to i32
  %shl = shl i32 %conv477, %conv476
  %conv478 = trunc i32 %shl to i8
  store i8 %conv478, i8* %cl, align 1
  %233 = load i8* %cl, align 1
  %conv479 = sext i8 %233 to i32
  %cmp480 = icmp ne i32 %conv479, 20
  br i1 %cmp480, label %if.then482, label %if.end487

if.then482:                                       ; preds = %if.end475
  store i32 296, i32* %lrc, align 4
  %234 = load i32* %prlc, align 4
  %tobool483 = icmp ne i32 %234, 0
  br i1 %tobool483, label %if.then484, label %if.end486

if.then484:                                       ; preds = %if.then482
  %235 = load i32* %lrc, align 4
  %call485 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %235)
  br label %if.end486

if.end486:                                        ; preds = %if.then484, %if.then482
  br label %if.end487

if.end487:                                        ; preds = %if.end486, %if.end475
  store i8 5, i8* %cl, align 1
  store i16 2, i16* %sr, align 2
  %236 = load i16* %sr, align 2
  %conv488 = sext i16 %236 to i32
  %237 = load i8* %cl, align 1
  %conv489 = sext i8 %237 to i32
  %shl490 = shl i32 %conv489, %conv488
  %conv491 = trunc i32 %shl490 to i8
  store i8 %conv491, i8* %cl, align 1
  %238 = load i8* %cl, align 1
  %conv492 = sext i8 %238 to i32
  %cmp493 = icmp ne i32 %conv492, 20
  br i1 %cmp493, label %if.then495, label %if.end500

if.then495:                                       ; preds = %if.end487
  store i32 297, i32* %lrc, align 4
  %239 = load i32* %prlc, align 4
  %tobool496 = icmp ne i32 %239, 0
  br i1 %tobool496, label %if.then497, label %if.end499

if.then497:                                       ; preds = %if.then495
  %240 = load i32* %lrc, align 4
  %call498 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %240)
  br label %if.end499

if.end499:                                        ; preds = %if.then497, %if.then495
  br label %if.end500

if.end500:                                        ; preds = %if.end499, %if.end487
  store i8 5, i8* %cl, align 1
  store i32 2, i32* %ir, align 4
  %241 = load i32* %ir, align 4
  %242 = load i8* %cl, align 1
  %conv501 = sext i8 %242 to i32
  %shl502 = shl i32 %conv501, %241
  %conv503 = trunc i32 %shl502 to i8
  store i8 %conv503, i8* %cl, align 1
  %243 = load i8* %cl, align 1
  %conv504 = sext i8 %243 to i32
  %cmp505 = icmp ne i32 %conv504, 20
  br i1 %cmp505, label %if.then507, label %if.end512

if.then507:                                       ; preds = %if.end500
  store i32 298, i32* %lrc, align 4
  %244 = load i32* %prlc, align 4
  %tobool508 = icmp ne i32 %244, 0
  br i1 %tobool508, label %if.then509, label %if.end511

if.then509:                                       ; preds = %if.then507
  %245 = load i32* %lrc, align 4
  %call510 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %245)
  br label %if.end511

if.end511:                                        ; preds = %if.then509, %if.then507
  br label %if.end512

if.end512:                                        ; preds = %if.end511, %if.end500
  store i8 5, i8* %cl, align 1
  store i64 2, i64* %lr, align 8
  %246 = load i64* %lr, align 8
  %247 = load i8* %cl, align 1
  %conv513 = sext i8 %247 to i32
  %sh_prom514 = trunc i64 %246 to i32
  %shl515 = shl i32 %conv513, %sh_prom514
  %conv516 = trunc i32 %shl515 to i8
  store i8 %conv516, i8* %cl, align 1
  %248 = load i8* %cl, align 1
  %conv517 = sext i8 %248 to i32
  %cmp518 = icmp ne i32 %conv517, 20
  br i1 %cmp518, label %if.then520, label %if.end525

if.then520:                                       ; preds = %if.end512
  store i32 299, i32* %lrc, align 4
  %249 = load i32* %prlc, align 4
  %tobool521 = icmp ne i32 %249, 0
  br i1 %tobool521, label %if.then522, label %if.end524

if.then522:                                       ; preds = %if.then520
  %250 = load i32* %lrc, align 4
  %call523 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %250)
  br label %if.end524

if.end524:                                        ; preds = %if.then522, %if.then520
  br label %if.end525

if.end525:                                        ; preds = %if.end524, %if.end512
  store i8 5, i8* %cl, align 1
  store i32 2, i32* %ur, align 4
  %251 = load i32* %ur, align 4
  %252 = load i8* %cl, align 1
  %conv526 = sext i8 %252 to i32
  %shl527 = shl i32 %conv526, %251
  %conv528 = trunc i32 %shl527 to i8
  store i8 %conv528, i8* %cl, align 1
  %253 = load i8* %cl, align 1
  %conv529 = sext i8 %253 to i32
  %cmp530 = icmp ne i32 %conv529, 20
  br i1 %cmp530, label %if.then532, label %if.end537

if.then532:                                       ; preds = %if.end525
  store i32 300, i32* %lrc, align 4
  %254 = load i32* %prlc, align 4
  %tobool533 = icmp ne i32 %254, 0
  br i1 %tobool533, label %if.then534, label %if.end536

if.then534:                                       ; preds = %if.then532
  %255 = load i32* %lrc, align 4
  %call535 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %255)
  br label %if.end536

if.end536:                                        ; preds = %if.then534, %if.then532
  br label %if.end537

if.end537:                                        ; preds = %if.end536, %if.end525
  %256 = load i32* %lrc, align 4
  %cmp538 = icmp ne i32 %256, 0
  br i1 %cmp538, label %if.then540, label %if.end546

if.then540:                                       ; preds = %if.end537
  store i32 1, i32* %rc, align 4
  %257 = load %struct.defs** %pd0.addr, align 8
  %flgd = getelementptr inbounds %struct.defs* %257, i32 0, i32 11
  %258 = load i32* %flgd, align 4
  %cmp541 = icmp ne i32 %258, 0
  br i1 %cmp541, label %if.then543, label %if.end545

if.then543:                                       ; preds = %if.then540
  %call544 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @sec.s714er, i32 0, i32 0), i32 1)
  br label %if.end545

if.end545:                                        ; preds = %if.then543, %if.then540
  br label %if.end546

if.end546:                                        ; preds = %if.end545, %if.end537
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
