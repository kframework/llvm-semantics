; ModuleID = '/home/david/src/c-semantics/tests/unitTests/cq-13-s757.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.defs = type { i32, i32, i32, i32, i32, i32, i32, float, float, i32, i32, i32, i32, i32, i32, [8 x i8] }

@setupTable.qs26 = internal global [8 x i8] c"s26    \00", align 1
@setupTable.s = internal global [18 x i8] c"%3d bits in %ss.\0A\00", align 16
@setupTable.s2 = internal global [54 x i8] c"%f is the least number that can be added to 1. (%s).\0A\00", align 16
@svtest.k = internal global i32 0, align 4
@zero.k = internal global i32 0, align 4
@extvar = common global i32 0, align 4
@sec.s757er = internal global [11 x i8] c"s757,er%d\0A\00", align 1
@sec.qs757 = internal global [8 x i8] c"s757   \00", align 1
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
  %t = alloca i32, align 4
  %lrc = alloca i32, align 4
  %k = alloca i32, align 4
  %j = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %x = alloca [16 x i32], align 16
  %p = alloca i32*, align 8
  %rs = alloca i32, align 4
  %ls = alloca i32, align 4
  %rt = alloca i32, align 4
  %lt = alloca i32, align 4
  store %struct.defs* %pd0, %struct.defs** %pd0.addr, align 8
  store i8* getelementptr inbounds ([8 x i8]* @sec.qs757, i32 0, i32 0), i8** %ps, align 8
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
  store i32 40, i32* %t, align 4
  %4 = load i32* %t, align 4
  %shl = shl i32 %4, 3
  %shl2 = shl i32 %shl, 2
  %cmp = icmp ne i32 %shl2, 1280
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.end
  %5 = load i32* %t, align 4
  %shr = ashr i32 %5, 3
  %shr3 = ashr i32 %shr, 2
  %cmp4 = icmp ne i32 %shr3, 1
  br i1 %cmp4, label %if.then, label %if.end7

if.then:                                          ; preds = %lor.lhs.false, %while.end
  %6 = load i32* %rc, align 4
  %add = add nsw i32 %6, 1
  store i32 %add, i32* %rc, align 4
  %7 = load %struct.defs** %pd0.addr, align 8
  %flgd = getelementptr inbounds %struct.defs* %7, i32 0, i32 11
  %8 = load i32* %flgd, align 4
  %cmp5 = icmp ne i32 %8, 0
  br i1 %cmp5, label %if.then6, label %if.end

if.then6:                                         ; preds = %if.then
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @sec.s757er, i32 0, i32 0), i32 1)
  br label %if.end

if.end:                                           ; preds = %if.then6, %if.then
  br label %if.end7

if.end7:                                          ; preds = %if.end, %lor.lhs.false
  store i32 0, i32* %lrc, align 4
  store i32 0, i32* %k, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc35, %if.end7
  %9 = load i32* %k, align 4
  %10 = load %struct.defs** %pd0.addr, align 8
  %ubits = getelementptr inbounds %struct.defs* %10, i32 0, i32 4
  %11 = load i32* %ubits, align 4
  %cmp8 = icmp slt i32 %9, %11
  br i1 %cmp8, label %for.body, label %for.end37

for.body:                                         ; preds = %for.cond
  store i32 1, i32* %rs, align 4
  %12 = load i32* %rs, align 4
  %13 = load %struct.defs** %pd0.addr, align 8
  %ubits9 = getelementptr inbounds %struct.defs* %13, i32 0, i32 4
  %14 = load i32* %ubits9, align 4
  %sub = sub nsw i32 %14, 1
  %shl10 = shl i32 %12, %sub
  store i32 %shl10, i32* %ls, align 4
  store i32 0, i32* %rt, align 4
  %15 = load i32* %rt, align 4
  %neg = xor i32 %15, -1
  %16 = load i32* %k, align 4
  %shr11 = lshr i32 %neg, %16
  store i32 %shr11, i32* %lt, align 4
  %17 = load i32* %rt, align 4
  %neg12 = xor i32 %17, -1
  %18 = load i32* %k, align 4
  %shl13 = shl i32 %neg12, %18
  store i32 %shl13, i32* %rt, align 4
  store i32 0, i32* %j, align 4
  br label %for.cond14

for.cond14:                                       ; preds = %for.inc, %for.body
  %19 = load i32* %j, align 4
  %20 = load %struct.defs** %pd0.addr, align 8
  %ubits15 = getelementptr inbounds %struct.defs* %20, i32 0, i32 4
  %21 = load i32* %ubits15, align 4
  %cmp16 = icmp slt i32 %19, %21
  br i1 %cmp16, label %for.body17, label %for.end

for.body17:                                       ; preds = %for.cond14
  %22 = load i32* %j, align 4
  %23 = load i32* %k, align 4
  %cmp18 = icmp slt i32 %22, %23
  %conv = zext i1 %cmp18 to i32
  %24 = load i32* %rs, align 4
  %25 = load i32* %rt, align 4
  %and = and i32 %24, %25
  %cmp19 = icmp eq i32 %and, 0
  %conv20 = zext i1 %cmp19 to i32
  %cmp21 = icmp ne i32 %conv, %conv20
  br i1 %cmp21, label %if.then31, label %lor.lhs.false23

lor.lhs.false23:                                  ; preds = %for.body17
  %26 = load i32* %j, align 4
  %27 = load i32* %k, align 4
  %cmp24 = icmp slt i32 %26, %27
  %conv25 = zext i1 %cmp24 to i32
  %28 = load i32* %ls, align 4
  %29 = load i32* %lt, align 4
  %and26 = and i32 %28, %29
  %cmp27 = icmp eq i32 %and26, 0
  %conv28 = zext i1 %cmp27 to i32
  %cmp29 = icmp ne i32 %conv25, %conv28
  br i1 %cmp29, label %if.then31, label %if.end32

if.then31:                                        ; preds = %lor.lhs.false23, %for.body17
  store i32 1, i32* %lrc, align 4
  br label %if.end32

if.end32:                                         ; preds = %if.then31, %lor.lhs.false23
  %30 = load i32* %rs, align 4
  %shl33 = shl i32 %30, 1
  store i32 %shl33, i32* %rs, align 4
  %31 = load i32* %ls, align 4
  %shr34 = lshr i32 %31, 1
  store i32 %shr34, i32* %ls, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end32
  %32 = load i32* %j, align 4
  %inc = add nsw i32 %32, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond14

for.end:                                          ; preds = %for.cond14
  br label %for.inc35

for.inc35:                                        ; preds = %for.end
  %33 = load i32* %k, align 4
  %inc36 = add nsw i32 %33, 1
  store i32 %inc36, i32* %k, align 4
  br label %for.cond

for.end37:                                        ; preds = %for.cond
  %34 = load i32* %lrc, align 4
  %cmp38 = icmp ne i32 %34, 0
  br i1 %cmp38, label %if.then40, label %if.end48

if.then40:                                        ; preds = %for.end37
  %35 = load i32* %rc, align 4
  %add41 = add nsw i32 %35, 2
  store i32 %add41, i32* %rc, align 4
  %36 = load %struct.defs** %pd0.addr, align 8
  %flgd42 = getelementptr inbounds %struct.defs* %36, i32 0, i32 11
  %37 = load i32* %flgd42, align 4
  %cmp43 = icmp ne i32 %37, 0
  br i1 %cmp43, label %if.then45, label %if.end47

if.then45:                                        ; preds = %if.then40
  %call46 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @sec.s757er, i32 0, i32 0), i32 2)
  br label %if.end47

if.end47:                                         ; preds = %if.then45, %if.then40
  br label %if.end48

if.end48:                                         ; preds = %if.end47, %for.end37
  store i32 3, i32* %a, align 4
  store i32 2, i32* %b, align 4
  store i32 1, i32* %c, align 4
  %38 = load i32* %a, align 4
  %39 = load i32* %b, align 4
  %cmp49 = icmp slt i32 %38, %39
  %conv50 = zext i1 %cmp49 to i32
  %40 = load i32* %c, align 4
  %cmp51 = icmp slt i32 %conv50, %40
  %conv52 = zext i1 %cmp51 to i32
  %cmp53 = icmp ne i32 %conv52, 1
  br i1 %cmp53, label %if.then55, label %if.end63

if.then55:                                        ; preds = %if.end48
  %41 = load i32* %rc, align 4
  %add56 = add nsw i32 %41, 4
  store i32 %add56, i32* %rc, align 4
  %42 = load %struct.defs** %pd0.addr, align 8
  %flgd57 = getelementptr inbounds %struct.defs* %42, i32 0, i32 11
  %43 = load i32* %flgd57, align 4
  %cmp58 = icmp ne i32 %43, 0
  br i1 %cmp58, label %if.then60, label %if.end62

if.then60:                                        ; preds = %if.then55
  %call61 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @sec.s757er, i32 0, i32 0), i32 4)
  br label %if.end62

if.end62:                                         ; preds = %if.then60, %if.then55
  br label %if.end63

if.end63:                                         ; preds = %if.end62, %if.end48
  store i32 0, i32* %lrc, align 4
  store i32 0, i32* %j, align 4
  br label %for.cond64

for.cond64:                                       ; preds = %for.inc68, %if.end63
  %44 = load i32* %j, align 4
  %cmp65 = icmp slt i32 %44, 16
  br i1 %cmp65, label %for.body67, label %for.end70

for.body67:                                       ; preds = %for.cond64
  %45 = load i32* %j, align 4
  %idxprom = sext i32 %45 to i64
  %arrayidx = getelementptr inbounds [16 x i32]* %x, i32 0, i64 %idxprom
  store i32 1, i32* %arrayidx, align 4
  br label %for.inc68

for.inc68:                                        ; preds = %for.body67
  %46 = load i32* %j, align 4
  %inc69 = add nsw i32 %46, 1
  store i32 %inc69, i32* %j, align 4
  br label %for.cond64

for.end70:                                        ; preds = %for.cond64
  %arrayidx71 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 1
  store i32 0, i32* %arrayidx71, align 4
  %arrayidx72 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 4
  store i32 0, i32* %arrayidx72, align 4
  %arrayidx73 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 6
  store i32 0, i32* %arrayidx73, align 4
  %arrayidx74 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 7
  store i32 0, i32* %arrayidx74, align 4
  %arrayidx75 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 9
  store i32 0, i32* %arrayidx75, align 4
  %arrayidx76 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 13
  store i32 0, i32* %arrayidx76, align 4
  store i32 0, i32* %a, align 4
  br label %for.cond77

for.cond77:                                       ; preds = %for.inc119, %for.end70
  %47 = load i32* %a, align 4
  %cmp78 = icmp slt i32 %47, 2
  br i1 %cmp78, label %for.body80, label %for.end121

for.body80:                                       ; preds = %for.cond77
  store i32 0, i32* %b, align 4
  br label %for.cond81

for.cond81:                                       ; preds = %for.inc116, %for.body80
  %48 = load i32* %b, align 4
  %cmp82 = icmp slt i32 %48, 2
  br i1 %cmp82, label %for.body84, label %for.end118

for.body84:                                       ; preds = %for.cond81
  store i32 0, i32* %c, align 4
  br label %for.cond85

for.cond85:                                       ; preds = %for.inc113, %for.body84
  %49 = load i32* %c, align 4
  %cmp86 = icmp slt i32 %49, 2
  br i1 %cmp86, label %for.body88, label %for.end115

for.body88:                                       ; preds = %for.cond85
  store i32 0, i32* %d, align 4
  br label %for.cond89

for.cond89:                                       ; preds = %for.inc110, %for.body88
  %50 = load i32* %d, align 4
  %cmp90 = icmp slt i32 %50, 2
  br i1 %cmp90, label %for.body92, label %for.end112

for.body92:                                       ; preds = %for.cond89
  %51 = load i32* %a, align 4
  %52 = load i32* %b, align 4
  %cmp93 = icmp slt i32 %51, %52
  %conv94 = zext i1 %cmp93 to i32
  %53 = load i32* %c, align 4
  %54 = load i32* %d, align 4
  %cmp95 = icmp slt i32 %53, %54
  %conv96 = zext i1 %cmp95 to i32
  %cmp97 = icmp eq i32 %conv94, %conv96
  %conv98 = zext i1 %cmp97 to i32
  %55 = load i32* %a, align 4
  %mul = mul nsw i32 8, %55
  %56 = load i32* %b, align 4
  %mul99 = mul nsw i32 4, %56
  %add100 = add nsw i32 %mul, %mul99
  %57 = load i32* %c, align 4
  %mul101 = mul nsw i32 2, %57
  %add102 = add nsw i32 %add100, %mul101
  %58 = load i32* %d, align 4
  %add103 = add nsw i32 %add102, %58
  %idxprom104 = sext i32 %add103 to i64
  %arrayidx105 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 %idxprom104
  %59 = load i32* %arrayidx105, align 4
  %cmp106 = icmp ne i32 %conv98, %59
  br i1 %cmp106, label %if.then108, label %if.end109

if.then108:                                       ; preds = %for.body92
  store i32 1, i32* %lrc, align 4
  br label %if.end109

if.end109:                                        ; preds = %if.then108, %for.body92
  br label %for.inc110

for.inc110:                                       ; preds = %if.end109
  %60 = load i32* %d, align 4
  %inc111 = add nsw i32 %60, 1
  store i32 %inc111, i32* %d, align 4
  br label %for.cond89

for.end112:                                       ; preds = %for.cond89
  br label %for.inc113

for.inc113:                                       ; preds = %for.end112
  %61 = load i32* %c, align 4
  %inc114 = add nsw i32 %61, 1
  store i32 %inc114, i32* %c, align 4
  br label %for.cond85

for.end115:                                       ; preds = %for.cond85
  br label %for.inc116

for.inc116:                                       ; preds = %for.end115
  %62 = load i32* %b, align 4
  %inc117 = add nsw i32 %62, 1
  store i32 %inc117, i32* %b, align 4
  br label %for.cond81

for.end118:                                       ; preds = %for.cond81
  br label %for.inc119

for.inc119:                                       ; preds = %for.end118
  %63 = load i32* %a, align 4
  %inc120 = add nsw i32 %63, 1
  store i32 %inc120, i32* %a, align 4
  br label %for.cond77

for.end121:                                       ; preds = %for.cond77
  %64 = load i32* %lrc, align 4
  %cmp122 = icmp ne i32 %64, 0
  br i1 %cmp122, label %if.then124, label %if.end132

if.then124:                                       ; preds = %for.end121
  %65 = load i32* %rc, align 4
  %add125 = add nsw i32 %65, 16
  store i32 %add125, i32* %rc, align 4
  %66 = load %struct.defs** %pd0.addr, align 8
  %flgd126 = getelementptr inbounds %struct.defs* %66, i32 0, i32 11
  %67 = load i32* %flgd126, align 4
  %cmp127 = icmp ne i32 %67, 0
  br i1 %cmp127, label %if.then129, label %if.end131

if.then129:                                       ; preds = %if.then124
  %call130 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @sec.s757er, i32 0, i32 0), i32 16)
  br label %if.end131

if.end131:                                        ; preds = %if.then129, %if.then124
  br label %if.end132

if.end132:                                        ; preds = %if.end131, %for.end121
  store i32* null, i32** %p, align 8
  %68 = load i32** %p, align 8
  %cmp133 = icmp ne i32* %68, null
  br i1 %cmp133, label %if.then135, label %if.end143

if.then135:                                       ; preds = %if.end132
  %69 = load i32* %rc, align 4
  %add136 = add nsw i32 %69, 32
  store i32 %add136, i32* %rc, align 4
  %70 = load %struct.defs** %pd0.addr, align 8
  %flgd137 = getelementptr inbounds %struct.defs* %70, i32 0, i32 11
  %71 = load i32* %flgd137, align 4
  %cmp138 = icmp ne i32 %71, 0
  br i1 %cmp138, label %if.then140, label %if.end142

if.then140:                                       ; preds = %if.then135
  %call141 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @sec.s757er, i32 0, i32 0), i32 32)
  br label %if.end142

if.end142:                                        ; preds = %if.then140, %if.then135
  br label %if.end143

if.end143:                                        ; preds = %if.end142, %if.end132
  %72 = load i32* %rc, align 4
  ret i32 %72
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
