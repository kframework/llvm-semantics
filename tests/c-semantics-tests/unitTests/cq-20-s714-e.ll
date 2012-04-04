; ModuleID = '/home/david/src/c-semantics/tests/unitTests/cq-20-s714-e.c'
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
  store i32 2, i32* %ur, align 4
  %6 = load i32* %ur, align 4
  %7 = load i8* %cl, align 1
  %conv = sext i8 %7 to i32
  %div = udiv i32 %conv, %6
  %conv2 = trunc i32 %div to i8
  store i8 %conv2, i8* %cl, align 1
  %8 = load i8* %cl, align 1
  %conv3 = sext i8 %8 to i32
  %cmp = icmp ne i32 %conv3, 2
  br i1 %cmp, label %if.then, label %if.end7

if.then:                                          ; preds = %while.end
  store i32 201, i32* %lrc, align 4
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
  store float 2.000000e+00, float* %fr, align 4
  %11 = load float* %fr, align 4
  %12 = load i8* %cl, align 1
  %conv8 = sitofp i8 %12 to float
  %div9 = fdiv float %conv8, %11
  %conv10 = fptosi float %div9 to i8
  store i8 %conv10, i8* %cl, align 1
  %13 = load i8* %cl, align 1
  %conv11 = sext i8 %13 to i32
  %cmp12 = icmp ne i32 %conv11, 2
  br i1 %cmp12, label %if.then14, label %if.end19

if.then14:                                        ; preds = %if.end7
  store i32 202, i32* %lrc, align 4
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
  store double 2.000000e+00, double* %dr, align 8
  %16 = load double* %dr, align 8
  %17 = load i8* %cl, align 1
  %conv20 = sitofp i8 %17 to double
  %div21 = fdiv double %conv20, %16
  %conv22 = fptosi double %div21 to i8
  store i8 %conv22, i8* %cl, align 1
  %18 = load i8* %cl, align 1
  %conv23 = sext i8 %18 to i32
  %cmp24 = icmp ne i32 %conv23, 2
  br i1 %cmp24, label %if.then26, label %if.end31

if.then26:                                        ; preds = %if.end19
  store i32 203, i32* %lrc, align 4
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
  store i16 5, i16* %sl, align 2
  store i8 2, i8* %cr, align 1
  %21 = load i8* %cr, align 1
  %conv32 = sext i8 %21 to i32
  %22 = load i16* %sl, align 2
  %conv33 = sext i16 %22 to i32
  %div34 = sdiv i32 %conv33, %conv32
  %conv35 = trunc i32 %div34 to i16
  store i16 %conv35, i16* %sl, align 2
  %23 = load i16* %sl, align 2
  %conv36 = sext i16 %23 to i32
  %cmp37 = icmp ne i32 %conv36, 2
  br i1 %cmp37, label %if.then39, label %if.end44

if.then39:                                        ; preds = %if.end31
  store i32 204, i32* %lrc, align 4
  %24 = load i32* %prlc, align 4
  %tobool40 = icmp ne i32 %24, 0
  br i1 %tobool40, label %if.then41, label %if.end43

if.then41:                                        ; preds = %if.then39
  %25 = load i32* %lrc, align 4
  %call42 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %25)
  br label %if.end43

if.end43:                                         ; preds = %if.then41, %if.then39
  br label %if.end44

if.end44:                                         ; preds = %if.end43, %if.end31
  store i16 5, i16* %sl, align 2
  store i16 2, i16* %sr, align 2
  %26 = load i16* %sr, align 2
  %conv45 = sext i16 %26 to i32
  %27 = load i16* %sl, align 2
  %conv46 = sext i16 %27 to i32
  %div47 = sdiv i32 %conv46, %conv45
  %conv48 = trunc i32 %div47 to i16
  store i16 %conv48, i16* %sl, align 2
  %28 = load i16* %sl, align 2
  %conv49 = sext i16 %28 to i32
  %cmp50 = icmp ne i32 %conv49, 2
  br i1 %cmp50, label %if.then52, label %if.end57

if.then52:                                        ; preds = %if.end44
  store i32 205, i32* %lrc, align 4
  %29 = load i32* %prlc, align 4
  %tobool53 = icmp ne i32 %29, 0
  br i1 %tobool53, label %if.then54, label %if.end56

if.then54:                                        ; preds = %if.then52
  %30 = load i32* %lrc, align 4
  %call55 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %30)
  br label %if.end56

if.end56:                                         ; preds = %if.then54, %if.then52
  br label %if.end57

if.end57:                                         ; preds = %if.end56, %if.end44
  store i16 5, i16* %sl, align 2
  store i32 2, i32* %ir, align 4
  %31 = load i32* %ir, align 4
  %32 = load i16* %sl, align 2
  %conv58 = sext i16 %32 to i32
  %div59 = sdiv i32 %conv58, %31
  %conv60 = trunc i32 %div59 to i16
  store i16 %conv60, i16* %sl, align 2
  %33 = load i16* %sl, align 2
  %conv61 = sext i16 %33 to i32
  %cmp62 = icmp ne i32 %conv61, 2
  br i1 %cmp62, label %if.then64, label %if.end69

if.then64:                                        ; preds = %if.end57
  store i32 206, i32* %lrc, align 4
  %34 = load i32* %prlc, align 4
  %tobool65 = icmp ne i32 %34, 0
  br i1 %tobool65, label %if.then66, label %if.end68

if.then66:                                        ; preds = %if.then64
  %35 = load i32* %lrc, align 4
  %call67 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %35)
  br label %if.end68

if.end68:                                         ; preds = %if.then66, %if.then64
  br label %if.end69

if.end69:                                         ; preds = %if.end68, %if.end57
  store i16 5, i16* %sl, align 2
  store i64 2, i64* %lr, align 8
  %36 = load i64* %lr, align 8
  %37 = load i16* %sl, align 2
  %conv70 = sext i16 %37 to i64
  %div71 = sdiv i64 %conv70, %36
  %conv72 = trunc i64 %div71 to i16
  store i16 %conv72, i16* %sl, align 2
  %38 = load i16* %sl, align 2
  %conv73 = sext i16 %38 to i32
  %cmp74 = icmp ne i32 %conv73, 2
  br i1 %cmp74, label %if.then76, label %if.end81

if.then76:                                        ; preds = %if.end69
  store i32 207, i32* %lrc, align 4
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
  store i32 2, i32* %ur, align 4
  %41 = load i32* %ur, align 4
  %42 = load i16* %sl, align 2
  %conv82 = sext i16 %42 to i32
  %div83 = udiv i32 %conv82, %41
  %conv84 = trunc i32 %div83 to i16
  store i16 %conv84, i16* %sl, align 2
  %43 = load i16* %sl, align 2
  %conv85 = sext i16 %43 to i32
  %cmp86 = icmp ne i32 %conv85, 2
  br i1 %cmp86, label %if.then88, label %if.end93

if.then88:                                        ; preds = %if.end81
  store i32 208, i32* %lrc, align 4
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
  store float 2.000000e+00, float* %fr, align 4
  %46 = load float* %fr, align 4
  %47 = load i16* %sl, align 2
  %conv94 = sitofp i16 %47 to float
  %div95 = fdiv float %conv94, %46
  %conv96 = fptosi float %div95 to i16
  store i16 %conv96, i16* %sl, align 2
  %48 = load i16* %sl, align 2
  %conv97 = sext i16 %48 to i32
  %cmp98 = icmp ne i32 %conv97, 2
  br i1 %cmp98, label %if.then100, label %if.end105

if.then100:                                       ; preds = %if.end93
  store i32 209, i32* %lrc, align 4
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
  store double 2.000000e+00, double* %dr, align 8
  %51 = load double* %dr, align 8
  %52 = load i16* %sl, align 2
  %conv106 = sitofp i16 %52 to double
  %div107 = fdiv double %conv106, %51
  %conv108 = fptosi double %div107 to i16
  store i16 %conv108, i16* %sl, align 2
  %53 = load i16* %sl, align 2
  %conv109 = sext i16 %53 to i32
  %cmp110 = icmp ne i32 %conv109, 2
  br i1 %cmp110, label %if.then112, label %if.end117

if.then112:                                       ; preds = %if.end105
  store i32 210, i32* %lrc, align 4
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
  store i32 5, i32* %il, align 4
  store i8 2, i8* %cr, align 1
  %56 = load i8* %cr, align 1
  %conv118 = sext i8 %56 to i32
  %57 = load i32* %il, align 4
  %div119 = sdiv i32 %57, %conv118
  store i32 %div119, i32* %il, align 4
  %58 = load i32* %il, align 4
  %cmp120 = icmp ne i32 %58, 2
  br i1 %cmp120, label %if.then122, label %if.end127

if.then122:                                       ; preds = %if.end117
  store i32 211, i32* %lrc, align 4
  %59 = load i32* %prlc, align 4
  %tobool123 = icmp ne i32 %59, 0
  br i1 %tobool123, label %if.then124, label %if.end126

if.then124:                                       ; preds = %if.then122
  %60 = load i32* %lrc, align 4
  %call125 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %60)
  br label %if.end126

if.end126:                                        ; preds = %if.then124, %if.then122
  br label %if.end127

if.end127:                                        ; preds = %if.end126, %if.end117
  store i32 5, i32* %il, align 4
  store i16 2, i16* %sr, align 2
  %61 = load i16* %sr, align 2
  %conv128 = sext i16 %61 to i32
  %62 = load i32* %il, align 4
  %div129 = sdiv i32 %62, %conv128
  store i32 %div129, i32* %il, align 4
  %63 = load i32* %il, align 4
  %cmp130 = icmp ne i32 %63, 2
  br i1 %cmp130, label %if.then132, label %if.end137

if.then132:                                       ; preds = %if.end127
  store i32 212, i32* %lrc, align 4
  %64 = load i32* %prlc, align 4
  %tobool133 = icmp ne i32 %64, 0
  br i1 %tobool133, label %if.then134, label %if.end136

if.then134:                                       ; preds = %if.then132
  %65 = load i32* %lrc, align 4
  %call135 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %65)
  br label %if.end136

if.end136:                                        ; preds = %if.then134, %if.then132
  br label %if.end137

if.end137:                                        ; preds = %if.end136, %if.end127
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ir, align 4
  %66 = load i32* %ir, align 4
  %67 = load i32* %il, align 4
  %div138 = sdiv i32 %67, %66
  store i32 %div138, i32* %il, align 4
  %68 = load i32* %il, align 4
  %cmp139 = icmp ne i32 %68, 2
  br i1 %cmp139, label %if.then141, label %if.end146

if.then141:                                       ; preds = %if.end137
  store i32 213, i32* %lrc, align 4
  %69 = load i32* %prlc, align 4
  %tobool142 = icmp ne i32 %69, 0
  br i1 %tobool142, label %if.then143, label %if.end145

if.then143:                                       ; preds = %if.then141
  %70 = load i32* %lrc, align 4
  %call144 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %70)
  br label %if.end145

if.end145:                                        ; preds = %if.then143, %if.then141
  br label %if.end146

if.end146:                                        ; preds = %if.end145, %if.end137
  store i32 5, i32* %il, align 4
  store i64 2, i64* %lr, align 8
  %71 = load i64* %lr, align 8
  %72 = load i32* %il, align 4
  %conv147 = sext i32 %72 to i64
  %div148 = sdiv i64 %conv147, %71
  %conv149 = trunc i64 %div148 to i32
  store i32 %conv149, i32* %il, align 4
  %73 = load i32* %il, align 4
  %cmp150 = icmp ne i32 %73, 2
  br i1 %cmp150, label %if.then152, label %if.end157

if.then152:                                       ; preds = %if.end146
  store i32 214, i32* %lrc, align 4
  %74 = load i32* %prlc, align 4
  %tobool153 = icmp ne i32 %74, 0
  br i1 %tobool153, label %if.then154, label %if.end156

if.then154:                                       ; preds = %if.then152
  %75 = load i32* %lrc, align 4
  %call155 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %75)
  br label %if.end156

if.end156:                                        ; preds = %if.then154, %if.then152
  br label %if.end157

if.end157:                                        ; preds = %if.end156, %if.end146
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ur, align 4
  %76 = load i32* %ur, align 4
  %77 = load i32* %il, align 4
  %div158 = udiv i32 %77, %76
  store i32 %div158, i32* %il, align 4
  %78 = load i32* %il, align 4
  %cmp159 = icmp ne i32 %78, 2
  br i1 %cmp159, label %if.then161, label %if.end166

if.then161:                                       ; preds = %if.end157
  store i32 215, i32* %lrc, align 4
  %79 = load i32* %prlc, align 4
  %tobool162 = icmp ne i32 %79, 0
  br i1 %tobool162, label %if.then163, label %if.end165

if.then163:                                       ; preds = %if.then161
  %80 = load i32* %lrc, align 4
  %call164 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %80)
  br label %if.end165

if.end165:                                        ; preds = %if.then163, %if.then161
  br label %if.end166

if.end166:                                        ; preds = %if.end165, %if.end157
  store i32 5, i32* %il, align 4
  store float 2.000000e+00, float* %fr, align 4
  %81 = load float* %fr, align 4
  %82 = load i32* %il, align 4
  %conv167 = sitofp i32 %82 to float
  %div168 = fdiv float %conv167, %81
  %conv169 = fptosi float %div168 to i32
  store i32 %conv169, i32* %il, align 4
  %83 = load i32* %il, align 4
  %cmp170 = icmp ne i32 %83, 2
  br i1 %cmp170, label %if.then172, label %if.end177

if.then172:                                       ; preds = %if.end166
  store i32 216, i32* %lrc, align 4
  %84 = load i32* %prlc, align 4
  %tobool173 = icmp ne i32 %84, 0
  br i1 %tobool173, label %if.then174, label %if.end176

if.then174:                                       ; preds = %if.then172
  %85 = load i32* %lrc, align 4
  %call175 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %85)
  br label %if.end176

if.end176:                                        ; preds = %if.then174, %if.then172
  br label %if.end177

if.end177:                                        ; preds = %if.end176, %if.end166
  store i32 5, i32* %il, align 4
  store double 2.000000e+00, double* %dr, align 8
  %86 = load double* %dr, align 8
  %87 = load i32* %il, align 4
  %conv178 = sitofp i32 %87 to double
  %div179 = fdiv double %conv178, %86
  %conv180 = fptosi double %div179 to i32
  store i32 %conv180, i32* %il, align 4
  %88 = load i32* %il, align 4
  %cmp181 = icmp ne i32 %88, 2
  br i1 %cmp181, label %if.then183, label %if.end188

if.then183:                                       ; preds = %if.end177
  store i32 217, i32* %lrc, align 4
  %89 = load i32* %prlc, align 4
  %tobool184 = icmp ne i32 %89, 0
  br i1 %tobool184, label %if.then185, label %if.end187

if.then185:                                       ; preds = %if.then183
  %90 = load i32* %lrc, align 4
  %call186 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %90)
  br label %if.end187

if.end187:                                        ; preds = %if.then185, %if.then183
  br label %if.end188

if.end188:                                        ; preds = %if.end187, %if.end177
  store i64 5, i64* %ll, align 8
  store i8 2, i8* %cr, align 1
  %91 = load i8* %cr, align 1
  %conv189 = sext i8 %91 to i64
  %92 = load i64* %ll, align 8
  %div190 = sdiv i64 %92, %conv189
  store i64 %div190, i64* %ll, align 8
  %93 = load i64* %ll, align 8
  %cmp191 = icmp ne i64 %93, 2
  br i1 %cmp191, label %if.then193, label %if.end198

if.then193:                                       ; preds = %if.end188
  store i32 218, i32* %lrc, align 4
  %94 = load i32* %prlc, align 4
  %tobool194 = icmp ne i32 %94, 0
  br i1 %tobool194, label %if.then195, label %if.end197

if.then195:                                       ; preds = %if.then193
  %95 = load i32* %lrc, align 4
  %call196 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %95)
  br label %if.end197

if.end197:                                        ; preds = %if.then195, %if.then193
  br label %if.end198

if.end198:                                        ; preds = %if.end197, %if.end188
  store i64 5, i64* %ll, align 8
  store i16 2, i16* %sr, align 2
  %96 = load i16* %sr, align 2
  %conv199 = sext i16 %96 to i64
  %97 = load i64* %ll, align 8
  %div200 = sdiv i64 %97, %conv199
  store i64 %div200, i64* %ll, align 8
  %98 = load i64* %ll, align 8
  %cmp201 = icmp ne i64 %98, 2
  br i1 %cmp201, label %if.then203, label %if.end208

if.then203:                                       ; preds = %if.end198
  store i32 219, i32* %lrc, align 4
  %99 = load i32* %prlc, align 4
  %tobool204 = icmp ne i32 %99, 0
  br i1 %tobool204, label %if.then205, label %if.end207

if.then205:                                       ; preds = %if.then203
  %100 = load i32* %lrc, align 4
  %call206 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %100)
  br label %if.end207

if.end207:                                        ; preds = %if.then205, %if.then203
  br label %if.end208

if.end208:                                        ; preds = %if.end207, %if.end198
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ir, align 4
  %101 = load i32* %ir, align 4
  %conv209 = sext i32 %101 to i64
  %102 = load i64* %ll, align 8
  %div210 = sdiv i64 %102, %conv209
  store i64 %div210, i64* %ll, align 8
  %103 = load i64* %ll, align 8
  %cmp211 = icmp ne i64 %103, 2
  br i1 %cmp211, label %if.then213, label %if.end218

if.then213:                                       ; preds = %if.end208
  store i32 220, i32* %lrc, align 4
  %104 = load i32* %prlc, align 4
  %tobool214 = icmp ne i32 %104, 0
  br i1 %tobool214, label %if.then215, label %if.end217

if.then215:                                       ; preds = %if.then213
  %105 = load i32* %lrc, align 4
  %call216 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %105)
  br label %if.end217

if.end217:                                        ; preds = %if.then215, %if.then213
  br label %if.end218

if.end218:                                        ; preds = %if.end217, %if.end208
  store i64 5, i64* %ll, align 8
  store i64 2, i64* %lr, align 8
  %106 = load i64* %lr, align 8
  %107 = load i64* %ll, align 8
  %div219 = sdiv i64 %107, %106
  store i64 %div219, i64* %ll, align 8
  %108 = load i64* %ll, align 8
  %cmp220 = icmp ne i64 %108, 2
  br i1 %cmp220, label %if.then222, label %if.end227

if.then222:                                       ; preds = %if.end218
  store i32 221, i32* %lrc, align 4
  %109 = load i32* %prlc, align 4
  %tobool223 = icmp ne i32 %109, 0
  br i1 %tobool223, label %if.then224, label %if.end226

if.then224:                                       ; preds = %if.then222
  %110 = load i32* %lrc, align 4
  %call225 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %110)
  br label %if.end226

if.end226:                                        ; preds = %if.then224, %if.then222
  br label %if.end227

if.end227:                                        ; preds = %if.end226, %if.end218
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ur, align 4
  %111 = load i32* %ur, align 4
  %conv228 = zext i32 %111 to i64
  %112 = load i64* %ll, align 8
  %div229 = sdiv i64 %112, %conv228
  store i64 %div229, i64* %ll, align 8
  %113 = load i64* %ll, align 8
  %cmp230 = icmp ne i64 %113, 2
  br i1 %cmp230, label %if.then232, label %if.end237

if.then232:                                       ; preds = %if.end227
  store i32 222, i32* %lrc, align 4
  %114 = load i32* %prlc, align 4
  %tobool233 = icmp ne i32 %114, 0
  br i1 %tobool233, label %if.then234, label %if.end236

if.then234:                                       ; preds = %if.then232
  %115 = load i32* %lrc, align 4
  %call235 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %115)
  br label %if.end236

if.end236:                                        ; preds = %if.then234, %if.then232
  br label %if.end237

if.end237:                                        ; preds = %if.end236, %if.end227
  store i64 5, i64* %ll, align 8
  store float 2.000000e+00, float* %fr, align 4
  %116 = load float* %fr, align 4
  %117 = load i64* %ll, align 8
  %conv238 = sitofp i64 %117 to float
  %div239 = fdiv float %conv238, %116
  %conv240 = fptosi float %div239 to i64
  store i64 %conv240, i64* %ll, align 8
  %118 = load i64* %ll, align 8
  %cmp241 = icmp ne i64 %118, 2
  br i1 %cmp241, label %if.then243, label %if.end248

if.then243:                                       ; preds = %if.end237
  store i32 223, i32* %lrc, align 4
  %119 = load i32* %prlc, align 4
  %tobool244 = icmp ne i32 %119, 0
  br i1 %tobool244, label %if.then245, label %if.end247

if.then245:                                       ; preds = %if.then243
  %120 = load i32* %lrc, align 4
  %call246 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %120)
  br label %if.end247

if.end247:                                        ; preds = %if.then245, %if.then243
  br label %if.end248

if.end248:                                        ; preds = %if.end247, %if.end237
  store i64 5, i64* %ll, align 8
  store double 2.000000e+00, double* %dr, align 8
  %121 = load double* %dr, align 8
  %122 = load i64* %ll, align 8
  %conv249 = sitofp i64 %122 to double
  %div250 = fdiv double %conv249, %121
  %conv251 = fptosi double %div250 to i64
  store i64 %conv251, i64* %ll, align 8
  %123 = load i64* %ll, align 8
  %cmp252 = icmp ne i64 %123, 2
  br i1 %cmp252, label %if.then254, label %if.end259

if.then254:                                       ; preds = %if.end248
  store i32 224, i32* %lrc, align 4
  %124 = load i32* %prlc, align 4
  %tobool255 = icmp ne i32 %124, 0
  br i1 %tobool255, label %if.then256, label %if.end258

if.then256:                                       ; preds = %if.then254
  %125 = load i32* %lrc, align 4
  %call257 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %125)
  br label %if.end258

if.end258:                                        ; preds = %if.then256, %if.then254
  br label %if.end259

if.end259:                                        ; preds = %if.end258, %if.end248
  store i32 5, i32* %ul, align 4
  store i8 2, i8* %cr, align 1
  %126 = load i8* %cr, align 1
  %conv260 = sext i8 %126 to i32
  %127 = load i32* %ul, align 4
  %div261 = udiv i32 %127, %conv260
  store i32 %div261, i32* %ul, align 4
  %128 = load i32* %ul, align 4
  %cmp262 = icmp ne i32 %128, 2
  br i1 %cmp262, label %if.then264, label %if.end269

if.then264:                                       ; preds = %if.end259
  store i32 225, i32* %lrc, align 4
  %129 = load i32* %prlc, align 4
  %tobool265 = icmp ne i32 %129, 0
  br i1 %tobool265, label %if.then266, label %if.end268

if.then266:                                       ; preds = %if.then264
  %130 = load i32* %lrc, align 4
  %call267 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %130)
  br label %if.end268

if.end268:                                        ; preds = %if.then266, %if.then264
  br label %if.end269

if.end269:                                        ; preds = %if.end268, %if.end259
  store i32 5, i32* %ul, align 4
  store i16 2, i16* %sr, align 2
  %131 = load i16* %sr, align 2
  %conv270 = sext i16 %131 to i32
  %132 = load i32* %ul, align 4
  %div271 = udiv i32 %132, %conv270
  store i32 %div271, i32* %ul, align 4
  %133 = load i32* %ul, align 4
  %cmp272 = icmp ne i32 %133, 2
  br i1 %cmp272, label %if.then274, label %if.end279

if.then274:                                       ; preds = %if.end269
  store i32 226, i32* %lrc, align 4
  %134 = load i32* %prlc, align 4
  %tobool275 = icmp ne i32 %134, 0
  br i1 %tobool275, label %if.then276, label %if.end278

if.then276:                                       ; preds = %if.then274
  %135 = load i32* %lrc, align 4
  %call277 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %135)
  br label %if.end278

if.end278:                                        ; preds = %if.then276, %if.then274
  br label %if.end279

if.end279:                                        ; preds = %if.end278, %if.end269
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ir, align 4
  %136 = load i32* %ir, align 4
  %137 = load i32* %ul, align 4
  %div280 = udiv i32 %137, %136
  store i32 %div280, i32* %ul, align 4
  %138 = load i32* %ul, align 4
  %cmp281 = icmp ne i32 %138, 2
  br i1 %cmp281, label %if.then283, label %if.end288

if.then283:                                       ; preds = %if.end279
  store i32 227, i32* %lrc, align 4
  %139 = load i32* %prlc, align 4
  %tobool284 = icmp ne i32 %139, 0
  br i1 %tobool284, label %if.then285, label %if.end287

if.then285:                                       ; preds = %if.then283
  %140 = load i32* %lrc, align 4
  %call286 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %140)
  br label %if.end287

if.end287:                                        ; preds = %if.then285, %if.then283
  br label %if.end288

if.end288:                                        ; preds = %if.end287, %if.end279
  store i32 5, i32* %ul, align 4
  store i64 2, i64* %lr, align 8
  %141 = load i64* %lr, align 8
  %142 = load i32* %ul, align 4
  %conv289 = zext i32 %142 to i64
  %div290 = sdiv i64 %conv289, %141
  %conv291 = trunc i64 %div290 to i32
  store i32 %conv291, i32* %ul, align 4
  %143 = load i32* %ul, align 4
  %cmp292 = icmp ne i32 %143, 2
  br i1 %cmp292, label %if.then294, label %if.end299

if.then294:                                       ; preds = %if.end288
  store i32 228, i32* %lrc, align 4
  %144 = load i32* %prlc, align 4
  %tobool295 = icmp ne i32 %144, 0
  br i1 %tobool295, label %if.then296, label %if.end298

if.then296:                                       ; preds = %if.then294
  %145 = load i32* %lrc, align 4
  %call297 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %145)
  br label %if.end298

if.end298:                                        ; preds = %if.then296, %if.then294
  br label %if.end299

if.end299:                                        ; preds = %if.end298, %if.end288
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ur, align 4
  %146 = load i32* %ur, align 4
  %147 = load i32* %ul, align 4
  %div300 = udiv i32 %147, %146
  store i32 %div300, i32* %ul, align 4
  %148 = load i32* %ul, align 4
  %cmp301 = icmp ne i32 %148, 2
  br i1 %cmp301, label %if.then303, label %if.end308

if.then303:                                       ; preds = %if.end299
  store i32 229, i32* %lrc, align 4
  %149 = load i32* %prlc, align 4
  %tobool304 = icmp ne i32 %149, 0
  br i1 %tobool304, label %if.then305, label %if.end307

if.then305:                                       ; preds = %if.then303
  %150 = load i32* %lrc, align 4
  %call306 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %150)
  br label %if.end307

if.end307:                                        ; preds = %if.then305, %if.then303
  br label %if.end308

if.end308:                                        ; preds = %if.end307, %if.end299
  store i32 5, i32* %ul, align 4
  store float 2.000000e+00, float* %fr, align 4
  %151 = load float* %fr, align 4
  %152 = load i32* %ul, align 4
  %conv309 = uitofp i32 %152 to float
  %div310 = fdiv float %conv309, %151
  %conv311 = fptoui float %div310 to i32
  store i32 %conv311, i32* %ul, align 4
  %153 = load i32* %ul, align 4
  %cmp312 = icmp ne i32 %153, 2
  br i1 %cmp312, label %if.then314, label %if.end319

if.then314:                                       ; preds = %if.end308
  store i32 230, i32* %lrc, align 4
  %154 = load i32* %prlc, align 4
  %tobool315 = icmp ne i32 %154, 0
  br i1 %tobool315, label %if.then316, label %if.end318

if.then316:                                       ; preds = %if.then314
  %155 = load i32* %lrc, align 4
  %call317 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %155)
  br label %if.end318

if.end318:                                        ; preds = %if.then316, %if.then314
  br label %if.end319

if.end319:                                        ; preds = %if.end318, %if.end308
  store i32 5, i32* %ul, align 4
  store double 2.000000e+00, double* %dr, align 8
  %156 = load double* %dr, align 8
  %157 = load i32* %ul, align 4
  %conv320 = uitofp i32 %157 to double
  %div321 = fdiv double %conv320, %156
  %conv322 = fptoui double %div321 to i32
  store i32 %conv322, i32* %ul, align 4
  %158 = load i32* %ul, align 4
  %cmp323 = icmp ne i32 %158, 2
  br i1 %cmp323, label %if.then325, label %if.end330

if.then325:                                       ; preds = %if.end319
  store i32 231, i32* %lrc, align 4
  %159 = load i32* %prlc, align 4
  %tobool326 = icmp ne i32 %159, 0
  br i1 %tobool326, label %if.then327, label %if.end329

if.then327:                                       ; preds = %if.then325
  %160 = load i32* %lrc, align 4
  %call328 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %160)
  br label %if.end329

if.end329:                                        ; preds = %if.then327, %if.then325
  br label %if.end330

if.end330:                                        ; preds = %if.end329, %if.end319
  store float 5.000000e+00, float* %fl, align 4
  store i8 2, i8* %cr, align 1
  %161 = load i8* %cr, align 1
  %conv331 = sext i8 %161 to i32
  %conv332 = sitofp i32 %conv331 to float
  %162 = load float* %fl, align 4
  %div333 = fdiv float %162, %conv332
  store float %div333, float* %fl, align 4
  %163 = load float* %fl, align 4
  %conv334 = fpext float %163 to double
  %cmp335 = fcmp une double %conv334, 2.500000e+00
  br i1 %cmp335, label %if.then337, label %if.end342

if.then337:                                       ; preds = %if.end330
  store i32 232, i32* %lrc, align 4
  %164 = load i32* %prlc, align 4
  %tobool338 = icmp ne i32 %164, 0
  br i1 %tobool338, label %if.then339, label %if.end341

if.then339:                                       ; preds = %if.then337
  %165 = load i32* %lrc, align 4
  %call340 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %165)
  br label %if.end341

if.end341:                                        ; preds = %if.then339, %if.then337
  br label %if.end342

if.end342:                                        ; preds = %if.end341, %if.end330
  store float 5.000000e+00, float* %fl, align 4
  store i16 2, i16* %sr, align 2
  %166 = load i16* %sr, align 2
  %conv343 = sext i16 %166 to i32
  %conv344 = sitofp i32 %conv343 to float
  %167 = load float* %fl, align 4
  %div345 = fdiv float %167, %conv344
  store float %div345, float* %fl, align 4
  %168 = load float* %fl, align 4
  %conv346 = fpext float %168 to double
  %cmp347 = fcmp une double %conv346, 2.500000e+00
  br i1 %cmp347, label %if.then349, label %if.end354

if.then349:                                       ; preds = %if.end342
  store i32 233, i32* %lrc, align 4
  %169 = load i32* %prlc, align 4
  %tobool350 = icmp ne i32 %169, 0
  br i1 %tobool350, label %if.then351, label %if.end353

if.then351:                                       ; preds = %if.then349
  %170 = load i32* %lrc, align 4
  %call352 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %170)
  br label %if.end353

if.end353:                                        ; preds = %if.then351, %if.then349
  br label %if.end354

if.end354:                                        ; preds = %if.end353, %if.end342
  store float 5.000000e+00, float* %fl, align 4
  store i32 2, i32* %ir, align 4
  %171 = load i32* %ir, align 4
  %conv355 = sitofp i32 %171 to float
  %172 = load float* %fl, align 4
  %div356 = fdiv float %172, %conv355
  store float %div356, float* %fl, align 4
  %173 = load float* %fl, align 4
  %conv357 = fpext float %173 to double
  %cmp358 = fcmp une double %conv357, 2.500000e+00
  br i1 %cmp358, label %if.then360, label %if.end365

if.then360:                                       ; preds = %if.end354
  store i32 234, i32* %lrc, align 4
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
  store i64 2, i64* %lr, align 8
  %176 = load i64* %lr, align 8
  %conv366 = sitofp i64 %176 to float
  %177 = load float* %fl, align 4
  %div367 = fdiv float %177, %conv366
  store float %div367, float* %fl, align 4
  %178 = load float* %fl, align 4
  %conv368 = fpext float %178 to double
  %cmp369 = fcmp une double %conv368, 2.500000e+00
  br i1 %cmp369, label %if.then371, label %if.end376

if.then371:                                       ; preds = %if.end365
  store i32 235, i32* %lrc, align 4
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
  store i32 2, i32* %ur, align 4
  %181 = load i32* %ur, align 4
  %conv377 = uitofp i32 %181 to float
  %182 = load float* %fl, align 4
  %div378 = fdiv float %182, %conv377
  store float %div378, float* %fl, align 4
  %183 = load float* %fl, align 4
  %conv379 = fpext float %183 to double
  %cmp380 = fcmp une double %conv379, 2.500000e+00
  br i1 %cmp380, label %if.then382, label %if.end387

if.then382:                                       ; preds = %if.end376
  store i32 236, i32* %lrc, align 4
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
  store float 5.000000e+00, float* %fl, align 4
  store float 2.000000e+00, float* %fr, align 4
  %186 = load float* %fr, align 4
  %187 = load float* %fl, align 4
  %div388 = fdiv float %187, %186
  store float %div388, float* %fl, align 4
  %188 = load float* %fl, align 4
  %conv389 = fpext float %188 to double
  %cmp390 = fcmp une double %conv389, 2.500000e+00
  br i1 %cmp390, label %if.then392, label %if.end397

if.then392:                                       ; preds = %if.end387
  store i32 237, i32* %lrc, align 4
  %189 = load i32* %prlc, align 4
  %tobool393 = icmp ne i32 %189, 0
  br i1 %tobool393, label %if.then394, label %if.end396

if.then394:                                       ; preds = %if.then392
  %190 = load i32* %lrc, align 4
  %call395 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %190)
  br label %if.end396

if.end396:                                        ; preds = %if.then394, %if.then392
  br label %if.end397

if.end397:                                        ; preds = %if.end396, %if.end387
  store float 5.000000e+00, float* %fl, align 4
  store double 2.000000e+00, double* %dr, align 8
  %191 = load double* %dr, align 8
  %192 = load float* %fl, align 4
  %conv398 = fpext float %192 to double
  %div399 = fdiv double %conv398, %191
  %conv400 = fptrunc double %div399 to float
  store float %conv400, float* %fl, align 4
  %193 = load float* %fl, align 4
  %conv401 = fpext float %193 to double
  %cmp402 = fcmp une double %conv401, 2.500000e+00
  br i1 %cmp402, label %if.then404, label %if.end409

if.then404:                                       ; preds = %if.end397
  store i32 238, i32* %lrc, align 4
  %194 = load i32* %prlc, align 4
  %tobool405 = icmp ne i32 %194, 0
  br i1 %tobool405, label %if.then406, label %if.end408

if.then406:                                       ; preds = %if.then404
  %195 = load i32* %lrc, align 4
  %call407 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %195)
  br label %if.end408

if.end408:                                        ; preds = %if.then406, %if.then404
  br label %if.end409

if.end409:                                        ; preds = %if.end408, %if.end397
  store double 5.000000e+00, double* %dl, align 8
  store i8 2, i8* %cr, align 1
  %196 = load i8* %cr, align 1
  %conv410 = sext i8 %196 to i32
  %conv411 = sitofp i32 %conv410 to double
  %197 = load double* %dl, align 8
  %div412 = fdiv double %197, %conv411
  store double %div412, double* %dl, align 8
  %198 = load double* %dl, align 8
  %cmp413 = fcmp une double %198, 2.500000e+00
  br i1 %cmp413, label %if.then415, label %if.end420

if.then415:                                       ; preds = %if.end409
  store i32 239, i32* %lrc, align 4
  %199 = load i32* %prlc, align 4
  %tobool416 = icmp ne i32 %199, 0
  br i1 %tobool416, label %if.then417, label %if.end419

if.then417:                                       ; preds = %if.then415
  %200 = load i32* %lrc, align 4
  %call418 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %200)
  br label %if.end419

if.end419:                                        ; preds = %if.then417, %if.then415
  br label %if.end420

if.end420:                                        ; preds = %if.end419, %if.end409
  store double 5.000000e+00, double* %dl, align 8
  store i16 2, i16* %sr, align 2
  %201 = load i16* %sr, align 2
  %conv421 = sext i16 %201 to i32
  %conv422 = sitofp i32 %conv421 to double
  %202 = load double* %dl, align 8
  %div423 = fdiv double %202, %conv422
  store double %div423, double* %dl, align 8
  %203 = load double* %dl, align 8
  %cmp424 = fcmp une double %203, 2.500000e+00
  br i1 %cmp424, label %if.then426, label %if.end431

if.then426:                                       ; preds = %if.end420
  store i32 240, i32* %lrc, align 4
  %204 = load i32* %prlc, align 4
  %tobool427 = icmp ne i32 %204, 0
  br i1 %tobool427, label %if.then428, label %if.end430

if.then428:                                       ; preds = %if.then426
  %205 = load i32* %lrc, align 4
  %call429 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %205)
  br label %if.end430

if.end430:                                        ; preds = %if.then428, %if.then426
  br label %if.end431

if.end431:                                        ; preds = %if.end430, %if.end420
  store double 5.000000e+00, double* %dl, align 8
  store i32 2, i32* %ir, align 4
  %206 = load i32* %ir, align 4
  %conv432 = sitofp i32 %206 to double
  %207 = load double* %dl, align 8
  %div433 = fdiv double %207, %conv432
  store double %div433, double* %dl, align 8
  %208 = load double* %dl, align 8
  %cmp434 = fcmp une double %208, 2.500000e+00
  br i1 %cmp434, label %if.then436, label %if.end441

if.then436:                                       ; preds = %if.end431
  store i32 241, i32* %lrc, align 4
  %209 = load i32* %prlc, align 4
  %tobool437 = icmp ne i32 %209, 0
  br i1 %tobool437, label %if.then438, label %if.end440

if.then438:                                       ; preds = %if.then436
  %210 = load i32* %lrc, align 4
  %call439 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %210)
  br label %if.end440

if.end440:                                        ; preds = %if.then438, %if.then436
  br label %if.end441

if.end441:                                        ; preds = %if.end440, %if.end431
  store double 5.000000e+00, double* %dl, align 8
  store i64 2, i64* %lr, align 8
  %211 = load i64* %lr, align 8
  %conv442 = sitofp i64 %211 to double
  %212 = load double* %dl, align 8
  %div443 = fdiv double %212, %conv442
  store double %div443, double* %dl, align 8
  %213 = load double* %dl, align 8
  %cmp444 = fcmp une double %213, 2.500000e+00
  br i1 %cmp444, label %if.then446, label %if.end451

if.then446:                                       ; preds = %if.end441
  store i32 242, i32* %lrc, align 4
  %214 = load i32* %prlc, align 4
  %tobool447 = icmp ne i32 %214, 0
  br i1 %tobool447, label %if.then448, label %if.end450

if.then448:                                       ; preds = %if.then446
  %215 = load i32* %lrc, align 4
  %call449 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %215)
  br label %if.end450

if.end450:                                        ; preds = %if.then448, %if.then446
  br label %if.end451

if.end451:                                        ; preds = %if.end450, %if.end441
  store double 5.000000e+00, double* %dl, align 8
  store i32 2, i32* %ur, align 4
  %216 = load i32* %ur, align 4
  %conv452 = uitofp i32 %216 to double
  %217 = load double* %dl, align 8
  %div453 = fdiv double %217, %conv452
  store double %div453, double* %dl, align 8
  %218 = load double* %dl, align 8
  %cmp454 = fcmp une double %218, 2.500000e+00
  br i1 %cmp454, label %if.then456, label %if.end461

if.then456:                                       ; preds = %if.end451
  store i32 243, i32* %lrc, align 4
  %219 = load i32* %prlc, align 4
  %tobool457 = icmp ne i32 %219, 0
  br i1 %tobool457, label %if.then458, label %if.end460

if.then458:                                       ; preds = %if.then456
  %220 = load i32* %lrc, align 4
  %call459 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %220)
  br label %if.end460

if.end460:                                        ; preds = %if.then458, %if.then456
  br label %if.end461

if.end461:                                        ; preds = %if.end460, %if.end451
  store double 5.000000e+00, double* %dl, align 8
  store float 2.000000e+00, float* %fr, align 4
  %221 = load float* %fr, align 4
  %conv462 = fpext float %221 to double
  %222 = load double* %dl, align 8
  %div463 = fdiv double %222, %conv462
  store double %div463, double* %dl, align 8
  %223 = load double* %dl, align 8
  %cmp464 = fcmp une double %223, 2.500000e+00
  br i1 %cmp464, label %if.then466, label %if.end471

if.then466:                                       ; preds = %if.end461
  store i32 244, i32* %lrc, align 4
  %224 = load i32* %prlc, align 4
  %tobool467 = icmp ne i32 %224, 0
  br i1 %tobool467, label %if.then468, label %if.end470

if.then468:                                       ; preds = %if.then466
  %225 = load i32* %lrc, align 4
  %call469 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %225)
  br label %if.end470

if.end470:                                        ; preds = %if.then468, %if.then466
  br label %if.end471

if.end471:                                        ; preds = %if.end470, %if.end461
  store double 5.000000e+00, double* %dl, align 8
  store double 2.000000e+00, double* %dr, align 8
  %226 = load double* %dr, align 8
  %227 = load double* %dl, align 8
  %div472 = fdiv double %227, %226
  store double %div472, double* %dl, align 8
  %228 = load double* %dl, align 8
  %cmp473 = fcmp une double %228, 2.500000e+00
  br i1 %cmp473, label %if.then475, label %if.end480

if.then475:                                       ; preds = %if.end471
  store i32 245, i32* %lrc, align 4
  %229 = load i32* %prlc, align 4
  %tobool476 = icmp ne i32 %229, 0
  br i1 %tobool476, label %if.then477, label %if.end479

if.then477:                                       ; preds = %if.then475
  %230 = load i32* %lrc, align 4
  %call478 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %230)
  br label %if.end479

if.end479:                                        ; preds = %if.then477, %if.then475
  br label %if.end480

if.end480:                                        ; preds = %if.end479, %if.end471
  store i8 5, i8* %cl, align 1
  store i8 2, i8* %cr, align 1
  %231 = load i8* %cr, align 1
  %conv481 = sext i8 %231 to i32
  %232 = load i8* %cl, align 1
  %conv482 = sext i8 %232 to i32
  %rem = srem i32 %conv482, %conv481
  %conv483 = trunc i32 %rem to i8
  store i8 %conv483, i8* %cl, align 1
  %233 = load i8* %cl, align 1
  %conv484 = sext i8 %233 to i32
  %cmp485 = icmp ne i32 %conv484, 1
  br i1 %cmp485, label %if.then487, label %if.end492

if.then487:                                       ; preds = %if.end480
  store i32 246, i32* %lrc, align 4
  %234 = load i32* %prlc, align 4
  %tobool488 = icmp ne i32 %234, 0
  br i1 %tobool488, label %if.then489, label %if.end491

if.then489:                                       ; preds = %if.then487
  %235 = load i32* %lrc, align 4
  %call490 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %235)
  br label %if.end491

if.end491:                                        ; preds = %if.then489, %if.then487
  br label %if.end492

if.end492:                                        ; preds = %if.end491, %if.end480
  store i8 5, i8* %cl, align 1
  store i16 2, i16* %sr, align 2
  %236 = load i16* %sr, align 2
  %conv493 = sext i16 %236 to i32
  %237 = load i8* %cl, align 1
  %conv494 = sext i8 %237 to i32
  %rem495 = srem i32 %conv494, %conv493
  %conv496 = trunc i32 %rem495 to i8
  store i8 %conv496, i8* %cl, align 1
  %238 = load i8* %cl, align 1
  %conv497 = sext i8 %238 to i32
  %cmp498 = icmp ne i32 %conv497, 1
  br i1 %cmp498, label %if.then500, label %if.end505

if.then500:                                       ; preds = %if.end492
  store i32 247, i32* %lrc, align 4
  %239 = load i32* %prlc, align 4
  %tobool501 = icmp ne i32 %239, 0
  br i1 %tobool501, label %if.then502, label %if.end504

if.then502:                                       ; preds = %if.then500
  %240 = load i32* %lrc, align 4
  %call503 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %240)
  br label %if.end504

if.end504:                                        ; preds = %if.then502, %if.then500
  br label %if.end505

if.end505:                                        ; preds = %if.end504, %if.end492
  store i8 5, i8* %cl, align 1
  store i32 2, i32* %ir, align 4
  %241 = load i32* %ir, align 4
  %242 = load i8* %cl, align 1
  %conv506 = sext i8 %242 to i32
  %rem507 = srem i32 %conv506, %241
  %conv508 = trunc i32 %rem507 to i8
  store i8 %conv508, i8* %cl, align 1
  %243 = load i8* %cl, align 1
  %conv509 = sext i8 %243 to i32
  %cmp510 = icmp ne i32 %conv509, 1
  br i1 %cmp510, label %if.then512, label %if.end517

if.then512:                                       ; preds = %if.end505
  store i32 248, i32* %lrc, align 4
  %244 = load i32* %prlc, align 4
  %tobool513 = icmp ne i32 %244, 0
  br i1 %tobool513, label %if.then514, label %if.end516

if.then514:                                       ; preds = %if.then512
  %245 = load i32* %lrc, align 4
  %call515 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %245)
  br label %if.end516

if.end516:                                        ; preds = %if.then514, %if.then512
  br label %if.end517

if.end517:                                        ; preds = %if.end516, %if.end505
  store i8 5, i8* %cl, align 1
  store i64 2, i64* %lr, align 8
  %246 = load i64* %lr, align 8
  %247 = load i8* %cl, align 1
  %conv518 = sext i8 %247 to i64
  %rem519 = srem i64 %conv518, %246
  %conv520 = trunc i64 %rem519 to i8
  store i8 %conv520, i8* %cl, align 1
  %248 = load i8* %cl, align 1
  %conv521 = sext i8 %248 to i32
  %cmp522 = icmp ne i32 %conv521, 1
  br i1 %cmp522, label %if.then524, label %if.end529

if.then524:                                       ; preds = %if.end517
  store i32 249, i32* %lrc, align 4
  %249 = load i32* %prlc, align 4
  %tobool525 = icmp ne i32 %249, 0
  br i1 %tobool525, label %if.then526, label %if.end528

if.then526:                                       ; preds = %if.then524
  %250 = load i32* %lrc, align 4
  %call527 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %250)
  br label %if.end528

if.end528:                                        ; preds = %if.then526, %if.then524
  br label %if.end529

if.end529:                                        ; preds = %if.end528, %if.end517
  store i8 5, i8* %cl, align 1
  store i32 2, i32* %ur, align 4
  %251 = load i32* %ur, align 4
  %252 = load i8* %cl, align 1
  %conv530 = sext i8 %252 to i32
  %rem531 = urem i32 %conv530, %251
  %conv532 = trunc i32 %rem531 to i8
  store i8 %conv532, i8* %cl, align 1
  %253 = load i8* %cl, align 1
  %conv533 = sext i8 %253 to i32
  %cmp534 = icmp ne i32 %conv533, 1
  br i1 %cmp534, label %if.then536, label %if.end541

if.then536:                                       ; preds = %if.end529
  store i32 250, i32* %lrc, align 4
  %254 = load i32* %prlc, align 4
  %tobool537 = icmp ne i32 %254, 0
  br i1 %tobool537, label %if.then538, label %if.end540

if.then538:                                       ; preds = %if.then536
  %255 = load i32* %lrc, align 4
  %call539 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %255)
  br label %if.end540

if.end540:                                        ; preds = %if.then538, %if.then536
  br label %if.end541

if.end541:                                        ; preds = %if.end540, %if.end529
  %256 = load i32* %lrc, align 4
  %cmp542 = icmp ne i32 %256, 0
  br i1 %cmp542, label %if.then544, label %if.end550

if.then544:                                       ; preds = %if.end541
  store i32 1, i32* %rc, align 4
  %257 = load %struct.defs** %pd0.addr, align 8
  %flgd = getelementptr inbounds %struct.defs* %257, i32 0, i32 11
  %258 = load i32* %flgd, align 4
  %cmp545 = icmp ne i32 %258, 0
  br i1 %cmp545, label %if.then547, label %if.end549

if.then547:                                       ; preds = %if.then544
  %call548 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @sec.s714er, i32 0, i32 0), i32 1)
  br label %if.end549

if.end549:                                        ; preds = %if.then547, %if.then544
  br label %if.end550

if.end550:                                        ; preds = %if.end549, %if.end541
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
