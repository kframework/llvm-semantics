; ModuleID = '/home/david/src/c-semantics/tests/unitTests/cq-20-s714-a.c'
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
  store i8 2, i8* %cr, align 1
  %6 = load i8* %cr, align 1
  store i8 %6, i8* %cl, align 1
  %7 = load i8* %cl, align 1
  %conv = sext i8 %7 to i32
  %cmp = icmp ne i32 %conv, 2
  br i1 %cmp, label %if.then, label %if.end5

if.then:                                          ; preds = %while.end
  store i32 1, i32* %lrc, align 4
  %8 = load i32* %prlc, align 4
  %tobool3 = icmp ne i32 %8, 0
  br i1 %tobool3, label %if.then4, label %if.end

if.then4:                                         ; preds = %if.then
  %9 = load i32* %lrc, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %9)
  br label %if.end

if.end:                                           ; preds = %if.then4, %if.then
  br label %if.end5

if.end5:                                          ; preds = %if.end, %while.end
  store i8 5, i8* %cl, align 1
  store i16 2, i16* %sr, align 2
  %10 = load i16* %sr, align 2
  %conv6 = trunc i16 %10 to i8
  store i8 %conv6, i8* %cl, align 1
  %11 = load i8* %cl, align 1
  %conv7 = sext i8 %11 to i32
  %cmp8 = icmp ne i32 %conv7, 2
  br i1 %cmp8, label %if.then10, label %if.end15

if.then10:                                        ; preds = %if.end5
  store i32 2, i32* %lrc, align 4
  %12 = load i32* %prlc, align 4
  %tobool11 = icmp ne i32 %12, 0
  br i1 %tobool11, label %if.then12, label %if.end14

if.then12:                                        ; preds = %if.then10
  %13 = load i32* %lrc, align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %13)
  br label %if.end14

if.end14:                                         ; preds = %if.then12, %if.then10
  br label %if.end15

if.end15:                                         ; preds = %if.end14, %if.end5
  store i8 5, i8* %cl, align 1
  store i32 2, i32* %ir, align 4
  %14 = load i32* %ir, align 4
  %conv16 = trunc i32 %14 to i8
  store i8 %conv16, i8* %cl, align 1
  %15 = load i8* %cl, align 1
  %conv17 = sext i8 %15 to i32
  %cmp18 = icmp ne i32 %conv17, 2
  br i1 %cmp18, label %if.then20, label %if.end25

if.then20:                                        ; preds = %if.end15
  store i32 3, i32* %lrc, align 4
  %16 = load i32* %prlc, align 4
  %tobool21 = icmp ne i32 %16, 0
  br i1 %tobool21, label %if.then22, label %if.end24

if.then22:                                        ; preds = %if.then20
  %17 = load i32* %lrc, align 4
  %call23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %17)
  br label %if.end24

if.end24:                                         ; preds = %if.then22, %if.then20
  br label %if.end25

if.end25:                                         ; preds = %if.end24, %if.end15
  store i8 5, i8* %cl, align 1
  store i64 2, i64* %lr, align 8
  %18 = load i64* %lr, align 8
  %conv26 = trunc i64 %18 to i8
  store i8 %conv26, i8* %cl, align 1
  %19 = load i8* %cl, align 1
  %conv27 = sext i8 %19 to i32
  %cmp28 = icmp ne i32 %conv27, 2
  br i1 %cmp28, label %if.then30, label %if.end35

if.then30:                                        ; preds = %if.end25
  store i32 4, i32* %lrc, align 4
  %20 = load i32* %prlc, align 4
  %tobool31 = icmp ne i32 %20, 0
  br i1 %tobool31, label %if.then32, label %if.end34

if.then32:                                        ; preds = %if.then30
  %21 = load i32* %lrc, align 4
  %call33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %21)
  br label %if.end34

if.end34:                                         ; preds = %if.then32, %if.then30
  br label %if.end35

if.end35:                                         ; preds = %if.end34, %if.end25
  store i8 5, i8* %cl, align 1
  store i32 2, i32* %ur, align 4
  %22 = load i32* %ur, align 4
  %conv36 = trunc i32 %22 to i8
  store i8 %conv36, i8* %cl, align 1
  %23 = load i8* %cl, align 1
  %conv37 = sext i8 %23 to i32
  %cmp38 = icmp ne i32 %conv37, 2
  br i1 %cmp38, label %if.then40, label %if.end45

if.then40:                                        ; preds = %if.end35
  store i32 5, i32* %lrc, align 4
  %24 = load i32* %prlc, align 4
  %tobool41 = icmp ne i32 %24, 0
  br i1 %tobool41, label %if.then42, label %if.end44

if.then42:                                        ; preds = %if.then40
  %25 = load i32* %lrc, align 4
  %call43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %25)
  br label %if.end44

if.end44:                                         ; preds = %if.then42, %if.then40
  br label %if.end45

if.end45:                                         ; preds = %if.end44, %if.end35
  store i8 5, i8* %cl, align 1
  store float 2.000000e+00, float* %fr, align 4
  %26 = load float* %fr, align 4
  %conv46 = fptosi float %26 to i8
  store i8 %conv46, i8* %cl, align 1
  %27 = load i8* %cl, align 1
  %conv47 = sext i8 %27 to i32
  %cmp48 = icmp ne i32 %conv47, 2
  br i1 %cmp48, label %if.then50, label %if.end55

if.then50:                                        ; preds = %if.end45
  store i32 6, i32* %lrc, align 4
  %28 = load i32* %prlc, align 4
  %tobool51 = icmp ne i32 %28, 0
  br i1 %tobool51, label %if.then52, label %if.end54

if.then52:                                        ; preds = %if.then50
  %29 = load i32* %lrc, align 4
  %call53 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %29)
  br label %if.end54

if.end54:                                         ; preds = %if.then52, %if.then50
  br label %if.end55

if.end55:                                         ; preds = %if.end54, %if.end45
  store i8 5, i8* %cl, align 1
  store double 2.000000e+00, double* %dr, align 8
  %30 = load double* %dr, align 8
  %conv56 = fptosi double %30 to i8
  store i8 %conv56, i8* %cl, align 1
  %31 = load i8* %cl, align 1
  %conv57 = sext i8 %31 to i32
  %cmp58 = icmp ne i32 %conv57, 2
  br i1 %cmp58, label %if.then60, label %if.end65

if.then60:                                        ; preds = %if.end55
  store i32 7, i32* %lrc, align 4
  %32 = load i32* %prlc, align 4
  %tobool61 = icmp ne i32 %32, 0
  br i1 %tobool61, label %if.then62, label %if.end64

if.then62:                                        ; preds = %if.then60
  %33 = load i32* %lrc, align 4
  %call63 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %33)
  br label %if.end64

if.end64:                                         ; preds = %if.then62, %if.then60
  br label %if.end65

if.end65:                                         ; preds = %if.end64, %if.end55
  store i16 5, i16* %sl, align 2
  store i8 2, i8* %cr, align 1
  %34 = load i8* %cr, align 1
  %conv66 = sext i8 %34 to i16
  store i16 %conv66, i16* %sl, align 2
  %35 = load i16* %sl, align 2
  %conv67 = sext i16 %35 to i32
  %cmp68 = icmp ne i32 %conv67, 2
  br i1 %cmp68, label %if.then70, label %if.end75

if.then70:                                        ; preds = %if.end65
  store i32 8, i32* %lrc, align 4
  %36 = load i32* %prlc, align 4
  %tobool71 = icmp ne i32 %36, 0
  br i1 %tobool71, label %if.then72, label %if.end74

if.then72:                                        ; preds = %if.then70
  %37 = load i32* %lrc, align 4
  %call73 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %37)
  br label %if.end74

if.end74:                                         ; preds = %if.then72, %if.then70
  br label %if.end75

if.end75:                                         ; preds = %if.end74, %if.end65
  store i16 5, i16* %sl, align 2
  store i16 2, i16* %sr, align 2
  %38 = load i16* %sr, align 2
  store i16 %38, i16* %sl, align 2
  %39 = load i16* %sl, align 2
  %conv76 = sext i16 %39 to i32
  %cmp77 = icmp ne i32 %conv76, 2
  br i1 %cmp77, label %if.then79, label %if.end84

if.then79:                                        ; preds = %if.end75
  store i32 9, i32* %lrc, align 4
  %40 = load i32* %prlc, align 4
  %tobool80 = icmp ne i32 %40, 0
  br i1 %tobool80, label %if.then81, label %if.end83

if.then81:                                        ; preds = %if.then79
  %41 = load i32* %lrc, align 4
  %call82 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %41)
  br label %if.end83

if.end83:                                         ; preds = %if.then81, %if.then79
  br label %if.end84

if.end84:                                         ; preds = %if.end83, %if.end75
  store i16 5, i16* %sl, align 2
  store i32 2, i32* %ir, align 4
  %42 = load i32* %ir, align 4
  %conv85 = trunc i32 %42 to i16
  store i16 %conv85, i16* %sl, align 2
  %43 = load i16* %sl, align 2
  %conv86 = sext i16 %43 to i32
  %cmp87 = icmp ne i32 %conv86, 2
  br i1 %cmp87, label %if.then89, label %if.end94

if.then89:                                        ; preds = %if.end84
  store i32 10, i32* %lrc, align 4
  %44 = load i32* %prlc, align 4
  %tobool90 = icmp ne i32 %44, 0
  br i1 %tobool90, label %if.then91, label %if.end93

if.then91:                                        ; preds = %if.then89
  %45 = load i32* %lrc, align 4
  %call92 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %45)
  br label %if.end93

if.end93:                                         ; preds = %if.then91, %if.then89
  br label %if.end94

if.end94:                                         ; preds = %if.end93, %if.end84
  store i16 5, i16* %sl, align 2
  store i64 2, i64* %lr, align 8
  %46 = load i64* %lr, align 8
  %conv95 = trunc i64 %46 to i16
  store i16 %conv95, i16* %sl, align 2
  %47 = load i16* %sl, align 2
  %conv96 = sext i16 %47 to i32
  %cmp97 = icmp ne i32 %conv96, 2
  br i1 %cmp97, label %if.then99, label %if.end104

if.then99:                                        ; preds = %if.end94
  store i32 11, i32* %lrc, align 4
  %48 = load i32* %prlc, align 4
  %tobool100 = icmp ne i32 %48, 0
  br i1 %tobool100, label %if.then101, label %if.end103

if.then101:                                       ; preds = %if.then99
  %49 = load i32* %lrc, align 4
  %call102 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %49)
  br label %if.end103

if.end103:                                        ; preds = %if.then101, %if.then99
  br label %if.end104

if.end104:                                        ; preds = %if.end103, %if.end94
  store i16 5, i16* %sl, align 2
  store i32 2, i32* %ur, align 4
  %50 = load i32* %ur, align 4
  %conv105 = trunc i32 %50 to i16
  store i16 %conv105, i16* %sl, align 2
  %51 = load i16* %sl, align 2
  %conv106 = sext i16 %51 to i32
  %cmp107 = icmp ne i32 %conv106, 2
  br i1 %cmp107, label %if.then109, label %if.end114

if.then109:                                       ; preds = %if.end104
  store i32 12, i32* %lrc, align 4
  %52 = load i32* %prlc, align 4
  %tobool110 = icmp ne i32 %52, 0
  br i1 %tobool110, label %if.then111, label %if.end113

if.then111:                                       ; preds = %if.then109
  %53 = load i32* %lrc, align 4
  %call112 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %53)
  br label %if.end113

if.end113:                                        ; preds = %if.then111, %if.then109
  br label %if.end114

if.end114:                                        ; preds = %if.end113, %if.end104
  store i16 5, i16* %sl, align 2
  store float 2.000000e+00, float* %fr, align 4
  %54 = load float* %fr, align 4
  %conv115 = fptosi float %54 to i16
  store i16 %conv115, i16* %sl, align 2
  %55 = load i16* %sl, align 2
  %conv116 = sext i16 %55 to i32
  %cmp117 = icmp ne i32 %conv116, 2
  br i1 %cmp117, label %if.then119, label %if.end124

if.then119:                                       ; preds = %if.end114
  store i32 13, i32* %lrc, align 4
  %56 = load i32* %prlc, align 4
  %tobool120 = icmp ne i32 %56, 0
  br i1 %tobool120, label %if.then121, label %if.end123

if.then121:                                       ; preds = %if.then119
  %57 = load i32* %lrc, align 4
  %call122 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %57)
  br label %if.end123

if.end123:                                        ; preds = %if.then121, %if.then119
  br label %if.end124

if.end124:                                        ; preds = %if.end123, %if.end114
  store i16 5, i16* %sl, align 2
  store double 2.000000e+00, double* %dr, align 8
  %58 = load double* %dr, align 8
  %conv125 = fptosi double %58 to i16
  store i16 %conv125, i16* %sl, align 2
  %59 = load i16* %sl, align 2
  %conv126 = sext i16 %59 to i32
  %cmp127 = icmp ne i32 %conv126, 2
  br i1 %cmp127, label %if.then129, label %if.end134

if.then129:                                       ; preds = %if.end124
  store i32 14, i32* %lrc, align 4
  %60 = load i32* %prlc, align 4
  %tobool130 = icmp ne i32 %60, 0
  br i1 %tobool130, label %if.then131, label %if.end133

if.then131:                                       ; preds = %if.then129
  %61 = load i32* %lrc, align 4
  %call132 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %61)
  br label %if.end133

if.end133:                                        ; preds = %if.then131, %if.then129
  br label %if.end134

if.end134:                                        ; preds = %if.end133, %if.end124
  store i32 5, i32* %il, align 4
  store i8 2, i8* %cr, align 1
  %62 = load i8* %cr, align 1
  %conv135 = sext i8 %62 to i32
  store i32 %conv135, i32* %il, align 4
  %63 = load i32* %il, align 4
  %cmp136 = icmp ne i32 %63, 2
  br i1 %cmp136, label %if.then138, label %if.end143

if.then138:                                       ; preds = %if.end134
  store i32 15, i32* %lrc, align 4
  %64 = load i32* %prlc, align 4
  %tobool139 = icmp ne i32 %64, 0
  br i1 %tobool139, label %if.then140, label %if.end142

if.then140:                                       ; preds = %if.then138
  %65 = load i32* %lrc, align 4
  %call141 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %65)
  br label %if.end142

if.end142:                                        ; preds = %if.then140, %if.then138
  br label %if.end143

if.end143:                                        ; preds = %if.end142, %if.end134
  store i32 5, i32* %il, align 4
  store i16 2, i16* %sr, align 2
  %66 = load i16* %sr, align 2
  %conv144 = sext i16 %66 to i32
  store i32 %conv144, i32* %il, align 4
  %67 = load i32* %il, align 4
  %cmp145 = icmp ne i32 %67, 2
  br i1 %cmp145, label %if.then147, label %if.end152

if.then147:                                       ; preds = %if.end143
  store i32 16, i32* %lrc, align 4
  %68 = load i32* %prlc, align 4
  %tobool148 = icmp ne i32 %68, 0
  br i1 %tobool148, label %if.then149, label %if.end151

if.then149:                                       ; preds = %if.then147
  %69 = load i32* %lrc, align 4
  %call150 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %69)
  br label %if.end151

if.end151:                                        ; preds = %if.then149, %if.then147
  br label %if.end152

if.end152:                                        ; preds = %if.end151, %if.end143
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ir, align 4
  %70 = load i32* %ir, align 4
  store i32 %70, i32* %il, align 4
  %71 = load i32* %il, align 4
  %cmp153 = icmp ne i32 %71, 2
  br i1 %cmp153, label %if.then155, label %if.end160

if.then155:                                       ; preds = %if.end152
  store i32 17, i32* %lrc, align 4
  %72 = load i32* %prlc, align 4
  %tobool156 = icmp ne i32 %72, 0
  br i1 %tobool156, label %if.then157, label %if.end159

if.then157:                                       ; preds = %if.then155
  %73 = load i32* %lrc, align 4
  %call158 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %73)
  br label %if.end159

if.end159:                                        ; preds = %if.then157, %if.then155
  br label %if.end160

if.end160:                                        ; preds = %if.end159, %if.end152
  store i32 5, i32* %il, align 4
  store i64 2, i64* %lr, align 8
  %74 = load i64* %lr, align 8
  %conv161 = trunc i64 %74 to i32
  store i32 %conv161, i32* %il, align 4
  %75 = load i32* %il, align 4
  %cmp162 = icmp ne i32 %75, 2
  br i1 %cmp162, label %if.then164, label %if.end169

if.then164:                                       ; preds = %if.end160
  store i32 18, i32* %lrc, align 4
  %76 = load i32* %prlc, align 4
  %tobool165 = icmp ne i32 %76, 0
  br i1 %tobool165, label %if.then166, label %if.end168

if.then166:                                       ; preds = %if.then164
  %77 = load i32* %lrc, align 4
  %call167 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %77)
  br label %if.end168

if.end168:                                        ; preds = %if.then166, %if.then164
  br label %if.end169

if.end169:                                        ; preds = %if.end168, %if.end160
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ur, align 4
  %78 = load i32* %ur, align 4
  store i32 %78, i32* %il, align 4
  %79 = load i32* %il, align 4
  %cmp170 = icmp ne i32 %79, 2
  br i1 %cmp170, label %if.then172, label %if.end177

if.then172:                                       ; preds = %if.end169
  store i32 19, i32* %lrc, align 4
  %80 = load i32* %prlc, align 4
  %tobool173 = icmp ne i32 %80, 0
  br i1 %tobool173, label %if.then174, label %if.end176

if.then174:                                       ; preds = %if.then172
  %81 = load i32* %lrc, align 4
  %call175 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %81)
  br label %if.end176

if.end176:                                        ; preds = %if.then174, %if.then172
  br label %if.end177

if.end177:                                        ; preds = %if.end176, %if.end169
  store i32 5, i32* %il, align 4
  store float 2.000000e+00, float* %fr, align 4
  %82 = load float* %fr, align 4
  %conv178 = fptosi float %82 to i32
  store i32 %conv178, i32* %il, align 4
  %83 = load i32* %il, align 4
  %cmp179 = icmp ne i32 %83, 2
  br i1 %cmp179, label %if.then181, label %if.end186

if.then181:                                       ; preds = %if.end177
  store i32 20, i32* %lrc, align 4
  %84 = load i32* %prlc, align 4
  %tobool182 = icmp ne i32 %84, 0
  br i1 %tobool182, label %if.then183, label %if.end185

if.then183:                                       ; preds = %if.then181
  %85 = load i32* %lrc, align 4
  %call184 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %85)
  br label %if.end185

if.end185:                                        ; preds = %if.then183, %if.then181
  br label %if.end186

if.end186:                                        ; preds = %if.end185, %if.end177
  store i32 5, i32* %il, align 4
  store double 2.000000e+00, double* %dr, align 8
  %86 = load double* %dr, align 8
  %conv187 = fptosi double %86 to i32
  store i32 %conv187, i32* %il, align 4
  %87 = load i32* %il, align 4
  %cmp188 = icmp ne i32 %87, 2
  br i1 %cmp188, label %if.then190, label %if.end195

if.then190:                                       ; preds = %if.end186
  store i32 21, i32* %lrc, align 4
  %88 = load i32* %prlc, align 4
  %tobool191 = icmp ne i32 %88, 0
  br i1 %tobool191, label %if.then192, label %if.end194

if.then192:                                       ; preds = %if.then190
  %89 = load i32* %lrc, align 4
  %call193 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %89)
  br label %if.end194

if.end194:                                        ; preds = %if.then192, %if.then190
  br label %if.end195

if.end195:                                        ; preds = %if.end194, %if.end186
  store i64 5, i64* %ll, align 8
  store i8 2, i8* %cr, align 1
  %90 = load i8* %cr, align 1
  %conv196 = sext i8 %90 to i64
  store i64 %conv196, i64* %ll, align 8
  %91 = load i64* %ll, align 8
  %cmp197 = icmp ne i64 %91, 2
  br i1 %cmp197, label %if.then199, label %if.end204

if.then199:                                       ; preds = %if.end195
  store i32 22, i32* %lrc, align 4
  %92 = load i32* %prlc, align 4
  %tobool200 = icmp ne i32 %92, 0
  br i1 %tobool200, label %if.then201, label %if.end203

if.then201:                                       ; preds = %if.then199
  %93 = load i32* %lrc, align 4
  %call202 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %93)
  br label %if.end203

if.end203:                                        ; preds = %if.then201, %if.then199
  br label %if.end204

if.end204:                                        ; preds = %if.end203, %if.end195
  store i64 5, i64* %ll, align 8
  store i16 2, i16* %sr, align 2
  %94 = load i16* %sr, align 2
  %conv205 = sext i16 %94 to i64
  store i64 %conv205, i64* %ll, align 8
  %95 = load i64* %ll, align 8
  %cmp206 = icmp ne i64 %95, 2
  br i1 %cmp206, label %if.then208, label %if.end213

if.then208:                                       ; preds = %if.end204
  store i32 23, i32* %lrc, align 4
  %96 = load i32* %prlc, align 4
  %tobool209 = icmp ne i32 %96, 0
  br i1 %tobool209, label %if.then210, label %if.end212

if.then210:                                       ; preds = %if.then208
  %97 = load i32* %lrc, align 4
  %call211 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %97)
  br label %if.end212

if.end212:                                        ; preds = %if.then210, %if.then208
  br label %if.end213

if.end213:                                        ; preds = %if.end212, %if.end204
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ir, align 4
  %98 = load i32* %ir, align 4
  %conv214 = sext i32 %98 to i64
  store i64 %conv214, i64* %ll, align 8
  %99 = load i64* %ll, align 8
  %cmp215 = icmp ne i64 %99, 2
  br i1 %cmp215, label %if.then217, label %if.end222

if.then217:                                       ; preds = %if.end213
  store i32 24, i32* %lrc, align 4
  %100 = load i32* %prlc, align 4
  %tobool218 = icmp ne i32 %100, 0
  br i1 %tobool218, label %if.then219, label %if.end221

if.then219:                                       ; preds = %if.then217
  %101 = load i32* %lrc, align 4
  %call220 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %101)
  br label %if.end221

if.end221:                                        ; preds = %if.then219, %if.then217
  br label %if.end222

if.end222:                                        ; preds = %if.end221, %if.end213
  store i64 5, i64* %ll, align 8
  store i64 2, i64* %lr, align 8
  %102 = load i64* %lr, align 8
  store i64 %102, i64* %ll, align 8
  %103 = load i64* %ll, align 8
  %cmp223 = icmp ne i64 %103, 2
  br i1 %cmp223, label %if.then225, label %if.end230

if.then225:                                       ; preds = %if.end222
  store i32 25, i32* %lrc, align 4
  %104 = load i32* %prlc, align 4
  %tobool226 = icmp ne i32 %104, 0
  br i1 %tobool226, label %if.then227, label %if.end229

if.then227:                                       ; preds = %if.then225
  %105 = load i32* %lrc, align 4
  %call228 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %105)
  br label %if.end229

if.end229:                                        ; preds = %if.then227, %if.then225
  br label %if.end230

if.end230:                                        ; preds = %if.end229, %if.end222
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ur, align 4
  %106 = load i32* %ur, align 4
  %conv231 = zext i32 %106 to i64
  store i64 %conv231, i64* %ll, align 8
  %107 = load i64* %ll, align 8
  %cmp232 = icmp ne i64 %107, 2
  br i1 %cmp232, label %if.then234, label %if.end239

if.then234:                                       ; preds = %if.end230
  store i32 26, i32* %lrc, align 4
  %108 = load i32* %prlc, align 4
  %tobool235 = icmp ne i32 %108, 0
  br i1 %tobool235, label %if.then236, label %if.end238

if.then236:                                       ; preds = %if.then234
  %109 = load i32* %lrc, align 4
  %call237 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %109)
  br label %if.end238

if.end238:                                        ; preds = %if.then236, %if.then234
  br label %if.end239

if.end239:                                        ; preds = %if.end238, %if.end230
  store i64 5, i64* %ll, align 8
  store float 2.000000e+00, float* %fr, align 4
  %110 = load float* %fr, align 4
  %conv240 = fptosi float %110 to i64
  store i64 %conv240, i64* %ll, align 8
  %111 = load i64* %ll, align 8
  %cmp241 = icmp ne i64 %111, 2
  br i1 %cmp241, label %if.then243, label %if.end248

if.then243:                                       ; preds = %if.end239
  store i32 27, i32* %lrc, align 4
  %112 = load i32* %prlc, align 4
  %tobool244 = icmp ne i32 %112, 0
  br i1 %tobool244, label %if.then245, label %if.end247

if.then245:                                       ; preds = %if.then243
  %113 = load i32* %lrc, align 4
  %call246 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %113)
  br label %if.end247

if.end247:                                        ; preds = %if.then245, %if.then243
  br label %if.end248

if.end248:                                        ; preds = %if.end247, %if.end239
  store i64 5, i64* %ll, align 8
  store double 2.000000e+00, double* %dr, align 8
  %114 = load double* %dr, align 8
  %conv249 = fptosi double %114 to i64
  store i64 %conv249, i64* %ll, align 8
  %115 = load i64* %ll, align 8
  %cmp250 = icmp ne i64 %115, 2
  br i1 %cmp250, label %if.then252, label %if.end257

if.then252:                                       ; preds = %if.end248
  store i32 28, i32* %lrc, align 4
  %116 = load i32* %prlc, align 4
  %tobool253 = icmp ne i32 %116, 0
  br i1 %tobool253, label %if.then254, label %if.end256

if.then254:                                       ; preds = %if.then252
  %117 = load i32* %lrc, align 4
  %call255 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %117)
  br label %if.end256

if.end256:                                        ; preds = %if.then254, %if.then252
  br label %if.end257

if.end257:                                        ; preds = %if.end256, %if.end248
  store i32 5, i32* %ul, align 4
  store i8 2, i8* %cr, align 1
  %118 = load i8* %cr, align 1
  %conv258 = sext i8 %118 to i32
  store i32 %conv258, i32* %ul, align 4
  %119 = load i32* %ul, align 4
  %cmp259 = icmp ne i32 %119, 2
  br i1 %cmp259, label %if.then261, label %if.end266

if.then261:                                       ; preds = %if.end257
  store i32 29, i32* %lrc, align 4
  %120 = load i32* %prlc, align 4
  %tobool262 = icmp ne i32 %120, 0
  br i1 %tobool262, label %if.then263, label %if.end265

if.then263:                                       ; preds = %if.then261
  %121 = load i32* %lrc, align 4
  %call264 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %121)
  br label %if.end265

if.end265:                                        ; preds = %if.then263, %if.then261
  br label %if.end266

if.end266:                                        ; preds = %if.end265, %if.end257
  store i32 5, i32* %ul, align 4
  store i16 2, i16* %sr, align 2
  %122 = load i16* %sr, align 2
  %conv267 = sext i16 %122 to i32
  store i32 %conv267, i32* %ul, align 4
  %123 = load i32* %ul, align 4
  %cmp268 = icmp ne i32 %123, 2
  br i1 %cmp268, label %if.then270, label %if.end275

if.then270:                                       ; preds = %if.end266
  store i32 30, i32* %lrc, align 4
  %124 = load i32* %prlc, align 4
  %tobool271 = icmp ne i32 %124, 0
  br i1 %tobool271, label %if.then272, label %if.end274

if.then272:                                       ; preds = %if.then270
  %125 = load i32* %lrc, align 4
  %call273 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %125)
  br label %if.end274

if.end274:                                        ; preds = %if.then272, %if.then270
  br label %if.end275

if.end275:                                        ; preds = %if.end274, %if.end266
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ir, align 4
  %126 = load i32* %ir, align 4
  store i32 %126, i32* %ul, align 4
  %127 = load i32* %ul, align 4
  %cmp276 = icmp ne i32 %127, 2
  br i1 %cmp276, label %if.then278, label %if.end283

if.then278:                                       ; preds = %if.end275
  store i32 31, i32* %lrc, align 4
  %128 = load i32* %prlc, align 4
  %tobool279 = icmp ne i32 %128, 0
  br i1 %tobool279, label %if.then280, label %if.end282

if.then280:                                       ; preds = %if.then278
  %129 = load i32* %lrc, align 4
  %call281 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %129)
  br label %if.end282

if.end282:                                        ; preds = %if.then280, %if.then278
  br label %if.end283

if.end283:                                        ; preds = %if.end282, %if.end275
  store i32 5, i32* %ul, align 4
  store i64 2, i64* %lr, align 8
  %130 = load i64* %lr, align 8
  %conv284 = trunc i64 %130 to i32
  store i32 %conv284, i32* %ul, align 4
  %131 = load i32* %ul, align 4
  %cmp285 = icmp ne i32 %131, 2
  br i1 %cmp285, label %if.then287, label %if.end292

if.then287:                                       ; preds = %if.end283
  store i32 32, i32* %lrc, align 4
  %132 = load i32* %prlc, align 4
  %tobool288 = icmp ne i32 %132, 0
  br i1 %tobool288, label %if.then289, label %if.end291

if.then289:                                       ; preds = %if.then287
  %133 = load i32* %lrc, align 4
  %call290 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %133)
  br label %if.end291

if.end291:                                        ; preds = %if.then289, %if.then287
  br label %if.end292

if.end292:                                        ; preds = %if.end291, %if.end283
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ur, align 4
  %134 = load i32* %ur, align 4
  store i32 %134, i32* %ul, align 4
  %135 = load i32* %ul, align 4
  %cmp293 = icmp ne i32 %135, 2
  br i1 %cmp293, label %if.then295, label %if.end300

if.then295:                                       ; preds = %if.end292
  store i32 33, i32* %lrc, align 4
  %136 = load i32* %prlc, align 4
  %tobool296 = icmp ne i32 %136, 0
  br i1 %tobool296, label %if.then297, label %if.end299

if.then297:                                       ; preds = %if.then295
  %137 = load i32* %lrc, align 4
  %call298 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %137)
  br label %if.end299

if.end299:                                        ; preds = %if.then297, %if.then295
  br label %if.end300

if.end300:                                        ; preds = %if.end299, %if.end292
  store i32 5, i32* %ul, align 4
  store float 2.000000e+00, float* %fr, align 4
  %138 = load float* %fr, align 4
  %conv301 = fptoui float %138 to i32
  store i32 %conv301, i32* %ul, align 4
  %139 = load i32* %ul, align 4
  %cmp302 = icmp ne i32 %139, 2
  br i1 %cmp302, label %if.then304, label %if.end309

if.then304:                                       ; preds = %if.end300
  store i32 34, i32* %lrc, align 4
  %140 = load i32* %prlc, align 4
  %tobool305 = icmp ne i32 %140, 0
  br i1 %tobool305, label %if.then306, label %if.end308

if.then306:                                       ; preds = %if.then304
  %141 = load i32* %lrc, align 4
  %call307 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %141)
  br label %if.end308

if.end308:                                        ; preds = %if.then306, %if.then304
  br label %if.end309

if.end309:                                        ; preds = %if.end308, %if.end300
  store i32 5, i32* %ul, align 4
  store double 2.000000e+00, double* %dr, align 8
  %142 = load double* %dr, align 8
  %conv310 = fptoui double %142 to i32
  store i32 %conv310, i32* %ul, align 4
  %143 = load i32* %ul, align 4
  %cmp311 = icmp ne i32 %143, 2
  br i1 %cmp311, label %if.then313, label %if.end318

if.then313:                                       ; preds = %if.end309
  store i32 35, i32* %lrc, align 4
  %144 = load i32* %prlc, align 4
  %tobool314 = icmp ne i32 %144, 0
  br i1 %tobool314, label %if.then315, label %if.end317

if.then315:                                       ; preds = %if.then313
  %145 = load i32* %lrc, align 4
  %call316 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %145)
  br label %if.end317

if.end317:                                        ; preds = %if.then315, %if.then313
  br label %if.end318

if.end318:                                        ; preds = %if.end317, %if.end309
  store float 5.000000e+00, float* %fl, align 4
  store i8 2, i8* %cr, align 1
  %146 = load i8* %cr, align 1
  %conv319 = sitofp i8 %146 to float
  store float %conv319, float* %fl, align 4
  %147 = load float* %fl, align 4
  %cmp320 = fcmp une float %147, 2.000000e+00
  br i1 %cmp320, label %if.then322, label %if.end327

if.then322:                                       ; preds = %if.end318
  store i32 36, i32* %lrc, align 4
  %148 = load i32* %prlc, align 4
  %tobool323 = icmp ne i32 %148, 0
  br i1 %tobool323, label %if.then324, label %if.end326

if.then324:                                       ; preds = %if.then322
  %149 = load i32* %lrc, align 4
  %call325 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %149)
  br label %if.end326

if.end326:                                        ; preds = %if.then324, %if.then322
  br label %if.end327

if.end327:                                        ; preds = %if.end326, %if.end318
  store float 5.000000e+00, float* %fl, align 4
  store i16 2, i16* %sr, align 2
  %150 = load i16* %sr, align 2
  %conv328 = sitofp i16 %150 to float
  store float %conv328, float* %fl, align 4
  %151 = load float* %fl, align 4
  %cmp329 = fcmp une float %151, 2.000000e+00
  br i1 %cmp329, label %if.then331, label %if.end336

if.then331:                                       ; preds = %if.end327
  store i32 37, i32* %lrc, align 4
  %152 = load i32* %prlc, align 4
  %tobool332 = icmp ne i32 %152, 0
  br i1 %tobool332, label %if.then333, label %if.end335

if.then333:                                       ; preds = %if.then331
  %153 = load i32* %lrc, align 4
  %call334 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %153)
  br label %if.end335

if.end335:                                        ; preds = %if.then333, %if.then331
  br label %if.end336

if.end336:                                        ; preds = %if.end335, %if.end327
  store float 5.000000e+00, float* %fl, align 4
  store i32 2, i32* %ir, align 4
  %154 = load i32* %ir, align 4
  %conv337 = sitofp i32 %154 to float
  store float %conv337, float* %fl, align 4
  %155 = load float* %fl, align 4
  %cmp338 = fcmp une float %155, 2.000000e+00
  br i1 %cmp338, label %if.then340, label %if.end345

if.then340:                                       ; preds = %if.end336
  store i32 38, i32* %lrc, align 4
  %156 = load i32* %prlc, align 4
  %tobool341 = icmp ne i32 %156, 0
  br i1 %tobool341, label %if.then342, label %if.end344

if.then342:                                       ; preds = %if.then340
  %157 = load i32* %lrc, align 4
  %call343 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %157)
  br label %if.end344

if.end344:                                        ; preds = %if.then342, %if.then340
  br label %if.end345

if.end345:                                        ; preds = %if.end344, %if.end336
  store float 5.000000e+00, float* %fl, align 4
  store i64 2, i64* %lr, align 8
  %158 = load i64* %lr, align 8
  %conv346 = sitofp i64 %158 to float
  store float %conv346, float* %fl, align 4
  %159 = load float* %fl, align 4
  %cmp347 = fcmp une float %159, 2.000000e+00
  br i1 %cmp347, label %if.then349, label %if.end354

if.then349:                                       ; preds = %if.end345
  store i32 39, i32* %lrc, align 4
  %160 = load i32* %prlc, align 4
  %tobool350 = icmp ne i32 %160, 0
  br i1 %tobool350, label %if.then351, label %if.end353

if.then351:                                       ; preds = %if.then349
  %161 = load i32* %lrc, align 4
  %call352 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %161)
  br label %if.end353

if.end353:                                        ; preds = %if.then351, %if.then349
  br label %if.end354

if.end354:                                        ; preds = %if.end353, %if.end345
  store float 5.000000e+00, float* %fl, align 4
  store i32 2, i32* %ur, align 4
  %162 = load i32* %ur, align 4
  %conv355 = uitofp i32 %162 to float
  store float %conv355, float* %fl, align 4
  %163 = load float* %fl, align 4
  %cmp356 = fcmp une float %163, 2.000000e+00
  br i1 %cmp356, label %if.then358, label %if.end363

if.then358:                                       ; preds = %if.end354
  store i32 40, i32* %lrc, align 4
  %164 = load i32* %prlc, align 4
  %tobool359 = icmp ne i32 %164, 0
  br i1 %tobool359, label %if.then360, label %if.end362

if.then360:                                       ; preds = %if.then358
  %165 = load i32* %lrc, align 4
  %call361 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %165)
  br label %if.end362

if.end362:                                        ; preds = %if.then360, %if.then358
  br label %if.end363

if.end363:                                        ; preds = %if.end362, %if.end354
  store float 5.000000e+00, float* %fl, align 4
  store float 2.000000e+00, float* %fr, align 4
  %166 = load float* %fr, align 4
  store float %166, float* %fl, align 4
  %167 = load float* %fl, align 4
  %cmp364 = fcmp une float %167, 2.000000e+00
  br i1 %cmp364, label %if.then366, label %if.end371

if.then366:                                       ; preds = %if.end363
  store i32 41, i32* %lrc, align 4
  %168 = load i32* %prlc, align 4
  %tobool367 = icmp ne i32 %168, 0
  br i1 %tobool367, label %if.then368, label %if.end370

if.then368:                                       ; preds = %if.then366
  %169 = load i32* %lrc, align 4
  %call369 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %169)
  br label %if.end370

if.end370:                                        ; preds = %if.then368, %if.then366
  br label %if.end371

if.end371:                                        ; preds = %if.end370, %if.end363
  store float 5.000000e+00, float* %fl, align 4
  store double 2.000000e+00, double* %dr, align 8
  %170 = load double* %dr, align 8
  %conv372 = fptrunc double %170 to float
  store float %conv372, float* %fl, align 4
  %171 = load float* %fl, align 4
  %cmp373 = fcmp une float %171, 2.000000e+00
  br i1 %cmp373, label %if.then375, label %if.end380

if.then375:                                       ; preds = %if.end371
  store i32 42, i32* %lrc, align 4
  %172 = load i32* %prlc, align 4
  %tobool376 = icmp ne i32 %172, 0
  br i1 %tobool376, label %if.then377, label %if.end379

if.then377:                                       ; preds = %if.then375
  %173 = load i32* %lrc, align 4
  %call378 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %173)
  br label %if.end379

if.end379:                                        ; preds = %if.then377, %if.then375
  br label %if.end380

if.end380:                                        ; preds = %if.end379, %if.end371
  store double 5.000000e+00, double* %dl, align 8
  store i8 2, i8* %cr, align 1
  %174 = load i8* %cr, align 1
  %conv381 = sitofp i8 %174 to double
  store double %conv381, double* %dl, align 8
  %175 = load double* %dl, align 8
  %cmp382 = fcmp une double %175, 2.000000e+00
  br i1 %cmp382, label %if.then384, label %if.end389

if.then384:                                       ; preds = %if.end380
  store i32 43, i32* %lrc, align 4
  %176 = load i32* %prlc, align 4
  %tobool385 = icmp ne i32 %176, 0
  br i1 %tobool385, label %if.then386, label %if.end388

if.then386:                                       ; preds = %if.then384
  %177 = load i32* %lrc, align 4
  %call387 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %177)
  br label %if.end388

if.end388:                                        ; preds = %if.then386, %if.then384
  br label %if.end389

if.end389:                                        ; preds = %if.end388, %if.end380
  store double 5.000000e+00, double* %dl, align 8
  store i16 2, i16* %sr, align 2
  %178 = load i16* %sr, align 2
  %conv390 = sitofp i16 %178 to double
  store double %conv390, double* %dl, align 8
  %179 = load double* %dl, align 8
  %cmp391 = fcmp une double %179, 2.000000e+00
  br i1 %cmp391, label %if.then393, label %if.end398

if.then393:                                       ; preds = %if.end389
  store i32 44, i32* %lrc, align 4
  %180 = load i32* %prlc, align 4
  %tobool394 = icmp ne i32 %180, 0
  br i1 %tobool394, label %if.then395, label %if.end397

if.then395:                                       ; preds = %if.then393
  %181 = load i32* %lrc, align 4
  %call396 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %181)
  br label %if.end397

if.end397:                                        ; preds = %if.then395, %if.then393
  br label %if.end398

if.end398:                                        ; preds = %if.end397, %if.end389
  store double 5.000000e+00, double* %dl, align 8
  store i32 2, i32* %ir, align 4
  %182 = load i32* %ir, align 4
  %conv399 = sitofp i32 %182 to double
  store double %conv399, double* %dl, align 8
  %183 = load double* %dl, align 8
  %cmp400 = fcmp une double %183, 2.000000e+00
  br i1 %cmp400, label %if.then402, label %if.end407

if.then402:                                       ; preds = %if.end398
  store i32 45, i32* %lrc, align 4
  %184 = load i32* %prlc, align 4
  %tobool403 = icmp ne i32 %184, 0
  br i1 %tobool403, label %if.then404, label %if.end406

if.then404:                                       ; preds = %if.then402
  %185 = load i32* %lrc, align 4
  %call405 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %185)
  br label %if.end406

if.end406:                                        ; preds = %if.then404, %if.then402
  br label %if.end407

if.end407:                                        ; preds = %if.end406, %if.end398
  store double 5.000000e+00, double* %dl, align 8
  store i64 2, i64* %lr, align 8
  %186 = load i64* %lr, align 8
  %conv408 = sitofp i64 %186 to double
  store double %conv408, double* %dl, align 8
  %187 = load double* %dl, align 8
  %cmp409 = fcmp une double %187, 2.000000e+00
  br i1 %cmp409, label %if.then411, label %if.end416

if.then411:                                       ; preds = %if.end407
  store i32 46, i32* %lrc, align 4
  %188 = load i32* %prlc, align 4
  %tobool412 = icmp ne i32 %188, 0
  br i1 %tobool412, label %if.then413, label %if.end415

if.then413:                                       ; preds = %if.then411
  %189 = load i32* %lrc, align 4
  %call414 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %189)
  br label %if.end415

if.end415:                                        ; preds = %if.then413, %if.then411
  br label %if.end416

if.end416:                                        ; preds = %if.end415, %if.end407
  store double 5.000000e+00, double* %dl, align 8
  store i32 2, i32* %ur, align 4
  %190 = load i32* %ur, align 4
  %conv417 = uitofp i32 %190 to double
  store double %conv417, double* %dl, align 8
  %191 = load double* %dl, align 8
  %cmp418 = fcmp une double %191, 2.000000e+00
  br i1 %cmp418, label %if.then420, label %if.end425

if.then420:                                       ; preds = %if.end416
  store i32 47, i32* %lrc, align 4
  %192 = load i32* %prlc, align 4
  %tobool421 = icmp ne i32 %192, 0
  br i1 %tobool421, label %if.then422, label %if.end424

if.then422:                                       ; preds = %if.then420
  %193 = load i32* %lrc, align 4
  %call423 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %193)
  br label %if.end424

if.end424:                                        ; preds = %if.then422, %if.then420
  br label %if.end425

if.end425:                                        ; preds = %if.end424, %if.end416
  store double 5.000000e+00, double* %dl, align 8
  store float 2.000000e+00, float* %fr, align 4
  %194 = load float* %fr, align 4
  %conv426 = fpext float %194 to double
  store double %conv426, double* %dl, align 8
  %195 = load double* %dl, align 8
  %cmp427 = fcmp une double %195, 2.000000e+00
  br i1 %cmp427, label %if.then429, label %if.end434

if.then429:                                       ; preds = %if.end425
  store i32 48, i32* %lrc, align 4
  %196 = load i32* %prlc, align 4
  %tobool430 = icmp ne i32 %196, 0
  br i1 %tobool430, label %if.then431, label %if.end433

if.then431:                                       ; preds = %if.then429
  %197 = load i32* %lrc, align 4
  %call432 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %197)
  br label %if.end433

if.end433:                                        ; preds = %if.then431, %if.then429
  br label %if.end434

if.end434:                                        ; preds = %if.end433, %if.end425
  store double 5.000000e+00, double* %dl, align 8
  store double 2.000000e+00, double* %dr, align 8
  %198 = load double* %dr, align 8
  store double %198, double* %dl, align 8
  %199 = load double* %dl, align 8
  %cmp435 = fcmp une double %199, 2.000000e+00
  br i1 %cmp435, label %if.then437, label %if.end442

if.then437:                                       ; preds = %if.end434
  store i32 49, i32* %lrc, align 4
  %200 = load i32* %prlc, align 4
  %tobool438 = icmp ne i32 %200, 0
  br i1 %tobool438, label %if.then439, label %if.end441

if.then439:                                       ; preds = %if.then437
  %201 = load i32* %lrc, align 4
  %call440 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %201)
  br label %if.end441

if.end441:                                        ; preds = %if.then439, %if.then437
  br label %if.end442

if.end442:                                        ; preds = %if.end441, %if.end434
  store i8 5, i8* %cl, align 1
  store i8 2, i8* %cr, align 1
  %202 = load i8* %cr, align 1
  %conv443 = sext i8 %202 to i32
  %203 = load i8* %cl, align 1
  %conv444 = sext i8 %203 to i32
  %add = add nsw i32 %conv444, %conv443
  %conv445 = trunc i32 %add to i8
  store i8 %conv445, i8* %cl, align 1
  %204 = load i8* %cl, align 1
  %conv446 = sext i8 %204 to i32
  %cmp447 = icmp ne i32 %conv446, 7
  br i1 %cmp447, label %if.then449, label %if.end454

if.then449:                                       ; preds = %if.end442
  store i32 50, i32* %lrc, align 4
  %205 = load i32* %prlc, align 4
  %tobool450 = icmp ne i32 %205, 0
  br i1 %tobool450, label %if.then451, label %if.end453

if.then451:                                       ; preds = %if.then449
  %206 = load i32* %lrc, align 4
  %call452 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %206)
  br label %if.end453

if.end453:                                        ; preds = %if.then451, %if.then449
  br label %if.end454

if.end454:                                        ; preds = %if.end453, %if.end442
  %207 = load i32* %lrc, align 4
  %cmp455 = icmp ne i32 %207, 0
  br i1 %cmp455, label %if.then457, label %if.end463

if.then457:                                       ; preds = %if.end454
  store i32 1, i32* %rc, align 4
  %208 = load %struct.defs** %pd0.addr, align 8
  %flgd = getelementptr inbounds %struct.defs* %208, i32 0, i32 11
  %209 = load i32* %flgd, align 4
  %cmp458 = icmp ne i32 %209, 0
  br i1 %cmp458, label %if.then460, label %if.end462

if.then460:                                       ; preds = %if.then457
  %call461 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @sec.s714er, i32 0, i32 0), i32 1)
  br label %if.end462

if.end462:                                        ; preds = %if.then460, %if.then457
  br label %if.end463

if.end463:                                        ; preds = %if.end462, %if.end454
  %210 = load i32* %rc, align 4
  ret i32 %210
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
