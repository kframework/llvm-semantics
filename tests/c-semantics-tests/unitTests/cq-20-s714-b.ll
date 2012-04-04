; ModuleID = '/home/david/src/c-semantics/tests/unitTests/cq-20-s714-b.c'
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
  store i16 2, i16* %sr, align 2
  %6 = load i16* %sr, align 2
  %conv = sext i16 %6 to i32
  %7 = load i8* %cl, align 1
  %conv2 = sext i8 %7 to i32
  %add = add nsw i32 %conv2, %conv
  %conv3 = trunc i32 %add to i8
  store i8 %conv3, i8* %cl, align 1
  %8 = load i8* %cl, align 1
  %conv4 = sext i8 %8 to i32
  %cmp = icmp ne i32 %conv4, 7
  br i1 %cmp, label %if.then, label %if.end8

if.then:                                          ; preds = %while.end
  store i32 51, i32* %lrc, align 4
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
  store i8 5, i8* %cl, align 1
  store i32 2, i32* %ir, align 4
  %11 = load i32* %ir, align 4
  %12 = load i8* %cl, align 1
  %conv9 = sext i8 %12 to i32
  %add10 = add nsw i32 %conv9, %11
  %conv11 = trunc i32 %add10 to i8
  store i8 %conv11, i8* %cl, align 1
  %13 = load i8* %cl, align 1
  %conv12 = sext i8 %13 to i32
  %cmp13 = icmp ne i32 %conv12, 7
  br i1 %cmp13, label %if.then15, label %if.end20

if.then15:                                        ; preds = %if.end8
  store i32 52, i32* %lrc, align 4
  %14 = load i32* %prlc, align 4
  %tobool16 = icmp ne i32 %14, 0
  br i1 %tobool16, label %if.then17, label %if.end19

if.then17:                                        ; preds = %if.then15
  %15 = load i32* %lrc, align 4
  %call18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %15)
  br label %if.end19

if.end19:                                         ; preds = %if.then17, %if.then15
  br label %if.end20

if.end20:                                         ; preds = %if.end19, %if.end8
  store i8 5, i8* %cl, align 1
  store i64 2, i64* %lr, align 8
  %16 = load i64* %lr, align 8
  %17 = load i8* %cl, align 1
  %conv21 = sext i8 %17 to i64
  %add22 = add nsw i64 %conv21, %16
  %conv23 = trunc i64 %add22 to i8
  store i8 %conv23, i8* %cl, align 1
  %18 = load i8* %cl, align 1
  %conv24 = sext i8 %18 to i32
  %cmp25 = icmp ne i32 %conv24, 7
  br i1 %cmp25, label %if.then27, label %if.end32

if.then27:                                        ; preds = %if.end20
  store i32 53, i32* %lrc, align 4
  %19 = load i32* %prlc, align 4
  %tobool28 = icmp ne i32 %19, 0
  br i1 %tobool28, label %if.then29, label %if.end31

if.then29:                                        ; preds = %if.then27
  %20 = load i32* %lrc, align 4
  %call30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %20)
  br label %if.end31

if.end31:                                         ; preds = %if.then29, %if.then27
  br label %if.end32

if.end32:                                         ; preds = %if.end31, %if.end20
  store i8 5, i8* %cl, align 1
  store i32 2, i32* %ur, align 4
  %21 = load i32* %ur, align 4
  %22 = load i8* %cl, align 1
  %conv33 = sext i8 %22 to i32
  %add34 = add i32 %conv33, %21
  %conv35 = trunc i32 %add34 to i8
  store i8 %conv35, i8* %cl, align 1
  %23 = load i8* %cl, align 1
  %conv36 = sext i8 %23 to i32
  %cmp37 = icmp ne i32 %conv36, 7
  br i1 %cmp37, label %if.then39, label %if.end44

if.then39:                                        ; preds = %if.end32
  store i32 54, i32* %lrc, align 4
  %24 = load i32* %prlc, align 4
  %tobool40 = icmp ne i32 %24, 0
  br i1 %tobool40, label %if.then41, label %if.end43

if.then41:                                        ; preds = %if.then39
  %25 = load i32* %lrc, align 4
  %call42 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %25)
  br label %if.end43

if.end43:                                         ; preds = %if.then41, %if.then39
  br label %if.end44

if.end44:                                         ; preds = %if.end43, %if.end32
  store i8 5, i8* %cl, align 1
  store float 2.000000e+00, float* %fr, align 4
  %26 = load float* %fr, align 4
  %27 = load i8* %cl, align 1
  %conv45 = sitofp i8 %27 to float
  %add46 = fadd float %conv45, %26
  %conv47 = fptosi float %add46 to i8
  store i8 %conv47, i8* %cl, align 1
  %28 = load i8* %cl, align 1
  %conv48 = sext i8 %28 to i32
  %cmp49 = icmp ne i32 %conv48, 7
  br i1 %cmp49, label %if.then51, label %if.end56

if.then51:                                        ; preds = %if.end44
  store i32 55, i32* %lrc, align 4
  %29 = load i32* %prlc, align 4
  %tobool52 = icmp ne i32 %29, 0
  br i1 %tobool52, label %if.then53, label %if.end55

if.then53:                                        ; preds = %if.then51
  %30 = load i32* %lrc, align 4
  %call54 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %30)
  br label %if.end55

if.end55:                                         ; preds = %if.then53, %if.then51
  br label %if.end56

if.end56:                                         ; preds = %if.end55, %if.end44
  store i8 5, i8* %cl, align 1
  store double 2.000000e+00, double* %dr, align 8
  %31 = load double* %dr, align 8
  %32 = load i8* %cl, align 1
  %conv57 = sitofp i8 %32 to double
  %add58 = fadd double %conv57, %31
  %conv59 = fptosi double %add58 to i8
  store i8 %conv59, i8* %cl, align 1
  %33 = load i8* %cl, align 1
  %conv60 = sext i8 %33 to i32
  %cmp61 = icmp ne i32 %conv60, 7
  br i1 %cmp61, label %if.then63, label %if.end68

if.then63:                                        ; preds = %if.end56
  store i32 56, i32* %lrc, align 4
  %34 = load i32* %prlc, align 4
  %tobool64 = icmp ne i32 %34, 0
  br i1 %tobool64, label %if.then65, label %if.end67

if.then65:                                        ; preds = %if.then63
  %35 = load i32* %lrc, align 4
  %call66 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %35)
  br label %if.end67

if.end67:                                         ; preds = %if.then65, %if.then63
  br label %if.end68

if.end68:                                         ; preds = %if.end67, %if.end56
  store i16 5, i16* %sl, align 2
  store i8 2, i8* %cr, align 1
  %36 = load i8* %cr, align 1
  %conv69 = sext i8 %36 to i32
  %37 = load i16* %sl, align 2
  %conv70 = sext i16 %37 to i32
  %add71 = add nsw i32 %conv70, %conv69
  %conv72 = trunc i32 %add71 to i16
  store i16 %conv72, i16* %sl, align 2
  %38 = load i16* %sl, align 2
  %conv73 = sext i16 %38 to i32
  %cmp74 = icmp ne i32 %conv73, 7
  br i1 %cmp74, label %if.then76, label %if.end81

if.then76:                                        ; preds = %if.end68
  store i32 57, i32* %lrc, align 4
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
  store i16 2, i16* %sr, align 2
  %41 = load i16* %sr, align 2
  %conv82 = sext i16 %41 to i32
  %42 = load i16* %sl, align 2
  %conv83 = sext i16 %42 to i32
  %add84 = add nsw i32 %conv83, %conv82
  %conv85 = trunc i32 %add84 to i16
  store i16 %conv85, i16* %sl, align 2
  %43 = load i16* %sl, align 2
  %conv86 = sext i16 %43 to i32
  %cmp87 = icmp ne i32 %conv86, 7
  br i1 %cmp87, label %if.then89, label %if.end94

if.then89:                                        ; preds = %if.end81
  store i32 58, i32* %lrc, align 4
  %44 = load i32* %prlc, align 4
  %tobool90 = icmp ne i32 %44, 0
  br i1 %tobool90, label %if.then91, label %if.end93

if.then91:                                        ; preds = %if.then89
  %45 = load i32* %lrc, align 4
  %call92 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %45)
  br label %if.end93

if.end93:                                         ; preds = %if.then91, %if.then89
  br label %if.end94

if.end94:                                         ; preds = %if.end93, %if.end81
  store i16 5, i16* %sl, align 2
  store i32 2, i32* %ir, align 4
  %46 = load i32* %ir, align 4
  %47 = load i16* %sl, align 2
  %conv95 = sext i16 %47 to i32
  %add96 = add nsw i32 %conv95, %46
  %conv97 = trunc i32 %add96 to i16
  store i16 %conv97, i16* %sl, align 2
  %48 = load i16* %sl, align 2
  %conv98 = sext i16 %48 to i32
  %cmp99 = icmp ne i32 %conv98, 7
  br i1 %cmp99, label %if.then101, label %if.end106

if.then101:                                       ; preds = %if.end94
  store i32 59, i32* %lrc, align 4
  %49 = load i32* %prlc, align 4
  %tobool102 = icmp ne i32 %49, 0
  br i1 %tobool102, label %if.then103, label %if.end105

if.then103:                                       ; preds = %if.then101
  %50 = load i32* %lrc, align 4
  %call104 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %50)
  br label %if.end105

if.end105:                                        ; preds = %if.then103, %if.then101
  br label %if.end106

if.end106:                                        ; preds = %if.end105, %if.end94
  store i16 5, i16* %sl, align 2
  store i64 2, i64* %lr, align 8
  %51 = load i64* %lr, align 8
  %52 = load i16* %sl, align 2
  %conv107 = sext i16 %52 to i64
  %add108 = add nsw i64 %conv107, %51
  %conv109 = trunc i64 %add108 to i16
  store i16 %conv109, i16* %sl, align 2
  %53 = load i16* %sl, align 2
  %conv110 = sext i16 %53 to i32
  %cmp111 = icmp ne i32 %conv110, 7
  br i1 %cmp111, label %if.then113, label %if.end118

if.then113:                                       ; preds = %if.end106
  store i32 60, i32* %lrc, align 4
  %54 = load i32* %prlc, align 4
  %tobool114 = icmp ne i32 %54, 0
  br i1 %tobool114, label %if.then115, label %if.end117

if.then115:                                       ; preds = %if.then113
  %55 = load i32* %lrc, align 4
  %call116 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %55)
  br label %if.end117

if.end117:                                        ; preds = %if.then115, %if.then113
  br label %if.end118

if.end118:                                        ; preds = %if.end117, %if.end106
  store i16 5, i16* %sl, align 2
  store i32 2, i32* %ur, align 4
  %56 = load i32* %ur, align 4
  %57 = load i16* %sl, align 2
  %conv119 = sext i16 %57 to i32
  %add120 = add i32 %conv119, %56
  %conv121 = trunc i32 %add120 to i16
  store i16 %conv121, i16* %sl, align 2
  %58 = load i16* %sl, align 2
  %conv122 = sext i16 %58 to i32
  %cmp123 = icmp ne i32 %conv122, 7
  br i1 %cmp123, label %if.then125, label %if.end130

if.then125:                                       ; preds = %if.end118
  store i32 61, i32* %lrc, align 4
  %59 = load i32* %prlc, align 4
  %tobool126 = icmp ne i32 %59, 0
  br i1 %tobool126, label %if.then127, label %if.end129

if.then127:                                       ; preds = %if.then125
  %60 = load i32* %lrc, align 4
  %call128 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %60)
  br label %if.end129

if.end129:                                        ; preds = %if.then127, %if.then125
  br label %if.end130

if.end130:                                        ; preds = %if.end129, %if.end118
  store i16 5, i16* %sl, align 2
  store float 2.000000e+00, float* %fr, align 4
  %61 = load float* %fr, align 4
  %62 = load i16* %sl, align 2
  %conv131 = sitofp i16 %62 to float
  %add132 = fadd float %conv131, %61
  %conv133 = fptosi float %add132 to i16
  store i16 %conv133, i16* %sl, align 2
  %63 = load i16* %sl, align 2
  %conv134 = sext i16 %63 to i32
  %cmp135 = icmp ne i32 %conv134, 7
  br i1 %cmp135, label %if.then137, label %if.end142

if.then137:                                       ; preds = %if.end130
  store i32 62, i32* %lrc, align 4
  %64 = load i32* %prlc, align 4
  %tobool138 = icmp ne i32 %64, 0
  br i1 %tobool138, label %if.then139, label %if.end141

if.then139:                                       ; preds = %if.then137
  %65 = load i32* %lrc, align 4
  %call140 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %65)
  br label %if.end141

if.end141:                                        ; preds = %if.then139, %if.then137
  br label %if.end142

if.end142:                                        ; preds = %if.end141, %if.end130
  store i16 5, i16* %sl, align 2
  store double 2.000000e+00, double* %dr, align 8
  %66 = load double* %dr, align 8
  %67 = load i16* %sl, align 2
  %conv143 = sitofp i16 %67 to double
  %add144 = fadd double %conv143, %66
  %conv145 = fptosi double %add144 to i16
  store i16 %conv145, i16* %sl, align 2
  %68 = load i16* %sl, align 2
  %conv146 = sext i16 %68 to i32
  %cmp147 = icmp ne i32 %conv146, 7
  br i1 %cmp147, label %if.then149, label %if.end154

if.then149:                                       ; preds = %if.end142
  store i32 63, i32* %lrc, align 4
  %69 = load i32* %prlc, align 4
  %tobool150 = icmp ne i32 %69, 0
  br i1 %tobool150, label %if.then151, label %if.end153

if.then151:                                       ; preds = %if.then149
  %70 = load i32* %lrc, align 4
  %call152 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %70)
  br label %if.end153

if.end153:                                        ; preds = %if.then151, %if.then149
  br label %if.end154

if.end154:                                        ; preds = %if.end153, %if.end142
  store i32 5, i32* %il, align 4
  store i8 2, i8* %cr, align 1
  %71 = load i8* %cr, align 1
  %conv155 = sext i8 %71 to i32
  %72 = load i32* %il, align 4
  %add156 = add nsw i32 %72, %conv155
  store i32 %add156, i32* %il, align 4
  %73 = load i32* %il, align 4
  %cmp157 = icmp ne i32 %73, 7
  br i1 %cmp157, label %if.then159, label %if.end164

if.then159:                                       ; preds = %if.end154
  store i32 64, i32* %lrc, align 4
  %74 = load i32* %prlc, align 4
  %tobool160 = icmp ne i32 %74, 0
  br i1 %tobool160, label %if.then161, label %if.end163

if.then161:                                       ; preds = %if.then159
  %75 = load i32* %lrc, align 4
  %call162 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %75)
  br label %if.end163

if.end163:                                        ; preds = %if.then161, %if.then159
  br label %if.end164

if.end164:                                        ; preds = %if.end163, %if.end154
  store i32 5, i32* %il, align 4
  store i16 2, i16* %sr, align 2
  %76 = load i16* %sr, align 2
  %conv165 = sext i16 %76 to i32
  %77 = load i32* %il, align 4
  %add166 = add nsw i32 %77, %conv165
  store i32 %add166, i32* %il, align 4
  %78 = load i32* %il, align 4
  %cmp167 = icmp ne i32 %78, 7
  br i1 %cmp167, label %if.then169, label %if.end174

if.then169:                                       ; preds = %if.end164
  store i32 65, i32* %lrc, align 4
  %79 = load i32* %prlc, align 4
  %tobool170 = icmp ne i32 %79, 0
  br i1 %tobool170, label %if.then171, label %if.end173

if.then171:                                       ; preds = %if.then169
  %80 = load i32* %lrc, align 4
  %call172 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %80)
  br label %if.end173

if.end173:                                        ; preds = %if.then171, %if.then169
  br label %if.end174

if.end174:                                        ; preds = %if.end173, %if.end164
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ir, align 4
  %81 = load i32* %ir, align 4
  %82 = load i32* %il, align 4
  %add175 = add nsw i32 %82, %81
  store i32 %add175, i32* %il, align 4
  %83 = load i32* %il, align 4
  %cmp176 = icmp ne i32 %83, 7
  br i1 %cmp176, label %if.then178, label %if.end183

if.then178:                                       ; preds = %if.end174
  store i32 66, i32* %lrc, align 4
  %84 = load i32* %prlc, align 4
  %tobool179 = icmp ne i32 %84, 0
  br i1 %tobool179, label %if.then180, label %if.end182

if.then180:                                       ; preds = %if.then178
  %85 = load i32* %lrc, align 4
  %call181 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %85)
  br label %if.end182

if.end182:                                        ; preds = %if.then180, %if.then178
  br label %if.end183

if.end183:                                        ; preds = %if.end182, %if.end174
  store i32 5, i32* %il, align 4
  store i64 2, i64* %lr, align 8
  %86 = load i64* %lr, align 8
  %87 = load i32* %il, align 4
  %conv184 = sext i32 %87 to i64
  %add185 = add nsw i64 %conv184, %86
  %conv186 = trunc i64 %add185 to i32
  store i32 %conv186, i32* %il, align 4
  %88 = load i32* %il, align 4
  %cmp187 = icmp ne i32 %88, 7
  br i1 %cmp187, label %if.then189, label %if.end194

if.then189:                                       ; preds = %if.end183
  store i32 67, i32* %lrc, align 4
  %89 = load i32* %prlc, align 4
  %tobool190 = icmp ne i32 %89, 0
  br i1 %tobool190, label %if.then191, label %if.end193

if.then191:                                       ; preds = %if.then189
  %90 = load i32* %lrc, align 4
  %call192 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %90)
  br label %if.end193

if.end193:                                        ; preds = %if.then191, %if.then189
  br label %if.end194

if.end194:                                        ; preds = %if.end193, %if.end183
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ur, align 4
  %91 = load i32* %ur, align 4
  %92 = load i32* %il, align 4
  %add195 = add i32 %92, %91
  store i32 %add195, i32* %il, align 4
  %93 = load i32* %il, align 4
  %cmp196 = icmp ne i32 %93, 7
  br i1 %cmp196, label %if.then198, label %if.end203

if.then198:                                       ; preds = %if.end194
  store i32 68, i32* %lrc, align 4
  %94 = load i32* %prlc, align 4
  %tobool199 = icmp ne i32 %94, 0
  br i1 %tobool199, label %if.then200, label %if.end202

if.then200:                                       ; preds = %if.then198
  %95 = load i32* %lrc, align 4
  %call201 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %95)
  br label %if.end202

if.end202:                                        ; preds = %if.then200, %if.then198
  br label %if.end203

if.end203:                                        ; preds = %if.end202, %if.end194
  store i32 5, i32* %il, align 4
  store float 2.000000e+00, float* %fr, align 4
  %96 = load float* %fr, align 4
  %97 = load i32* %il, align 4
  %conv204 = sitofp i32 %97 to float
  %add205 = fadd float %conv204, %96
  %conv206 = fptosi float %add205 to i32
  store i32 %conv206, i32* %il, align 4
  %98 = load i32* %il, align 4
  %cmp207 = icmp ne i32 %98, 7
  br i1 %cmp207, label %if.then209, label %if.end214

if.then209:                                       ; preds = %if.end203
  store i32 69, i32* %lrc, align 4
  %99 = load i32* %prlc, align 4
  %tobool210 = icmp ne i32 %99, 0
  br i1 %tobool210, label %if.then211, label %if.end213

if.then211:                                       ; preds = %if.then209
  %100 = load i32* %lrc, align 4
  %call212 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %100)
  br label %if.end213

if.end213:                                        ; preds = %if.then211, %if.then209
  br label %if.end214

if.end214:                                        ; preds = %if.end213, %if.end203
  store i32 5, i32* %il, align 4
  store double 2.000000e+00, double* %dr, align 8
  %101 = load double* %dr, align 8
  %102 = load i32* %il, align 4
  %conv215 = sitofp i32 %102 to double
  %add216 = fadd double %conv215, %101
  %conv217 = fptosi double %add216 to i32
  store i32 %conv217, i32* %il, align 4
  %103 = load i32* %il, align 4
  %cmp218 = icmp ne i32 %103, 7
  br i1 %cmp218, label %if.then220, label %if.end225

if.then220:                                       ; preds = %if.end214
  store i32 70, i32* %lrc, align 4
  %104 = load i32* %prlc, align 4
  %tobool221 = icmp ne i32 %104, 0
  br i1 %tobool221, label %if.then222, label %if.end224

if.then222:                                       ; preds = %if.then220
  %105 = load i32* %lrc, align 4
  %call223 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %105)
  br label %if.end224

if.end224:                                        ; preds = %if.then222, %if.then220
  br label %if.end225

if.end225:                                        ; preds = %if.end224, %if.end214
  store i64 5, i64* %ll, align 8
  store i8 2, i8* %cr, align 1
  %106 = load i8* %cr, align 1
  %conv226 = sext i8 %106 to i64
  %107 = load i64* %ll, align 8
  %add227 = add nsw i64 %107, %conv226
  store i64 %add227, i64* %ll, align 8
  %108 = load i64* %ll, align 8
  %cmp228 = icmp ne i64 %108, 7
  br i1 %cmp228, label %if.then230, label %if.end235

if.then230:                                       ; preds = %if.end225
  store i32 71, i32* %lrc, align 4
  %109 = load i32* %prlc, align 4
  %tobool231 = icmp ne i32 %109, 0
  br i1 %tobool231, label %if.then232, label %if.end234

if.then232:                                       ; preds = %if.then230
  %110 = load i32* %lrc, align 4
  %call233 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %110)
  br label %if.end234

if.end234:                                        ; preds = %if.then232, %if.then230
  br label %if.end235

if.end235:                                        ; preds = %if.end234, %if.end225
  store i64 5, i64* %ll, align 8
  store i16 2, i16* %sr, align 2
  %111 = load i16* %sr, align 2
  %conv236 = sext i16 %111 to i64
  %112 = load i64* %ll, align 8
  %add237 = add nsw i64 %112, %conv236
  store i64 %add237, i64* %ll, align 8
  %113 = load i64* %ll, align 8
  %cmp238 = icmp ne i64 %113, 7
  br i1 %cmp238, label %if.then240, label %if.end245

if.then240:                                       ; preds = %if.end235
  store i32 72, i32* %lrc, align 4
  %114 = load i32* %prlc, align 4
  %tobool241 = icmp ne i32 %114, 0
  br i1 %tobool241, label %if.then242, label %if.end244

if.then242:                                       ; preds = %if.then240
  %115 = load i32* %lrc, align 4
  %call243 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %115)
  br label %if.end244

if.end244:                                        ; preds = %if.then242, %if.then240
  br label %if.end245

if.end245:                                        ; preds = %if.end244, %if.end235
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ir, align 4
  %116 = load i32* %ir, align 4
  %conv246 = sext i32 %116 to i64
  %117 = load i64* %ll, align 8
  %add247 = add nsw i64 %117, %conv246
  store i64 %add247, i64* %ll, align 8
  %118 = load i64* %ll, align 8
  %cmp248 = icmp ne i64 %118, 7
  br i1 %cmp248, label %if.then250, label %if.end255

if.then250:                                       ; preds = %if.end245
  store i32 73, i32* %lrc, align 4
  %119 = load i32* %prlc, align 4
  %tobool251 = icmp ne i32 %119, 0
  br i1 %tobool251, label %if.then252, label %if.end254

if.then252:                                       ; preds = %if.then250
  %120 = load i32* %lrc, align 4
  %call253 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %120)
  br label %if.end254

if.end254:                                        ; preds = %if.then252, %if.then250
  br label %if.end255

if.end255:                                        ; preds = %if.end254, %if.end245
  store i64 5, i64* %ll, align 8
  store i64 2, i64* %lr, align 8
  %121 = load i64* %lr, align 8
  %122 = load i64* %ll, align 8
  %add256 = add nsw i64 %122, %121
  store i64 %add256, i64* %ll, align 8
  %123 = load i64* %ll, align 8
  %cmp257 = icmp ne i64 %123, 7
  br i1 %cmp257, label %if.then259, label %if.end264

if.then259:                                       ; preds = %if.end255
  store i32 74, i32* %lrc, align 4
  %124 = load i32* %prlc, align 4
  %tobool260 = icmp ne i32 %124, 0
  br i1 %tobool260, label %if.then261, label %if.end263

if.then261:                                       ; preds = %if.then259
  %125 = load i32* %lrc, align 4
  %call262 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %125)
  br label %if.end263

if.end263:                                        ; preds = %if.then261, %if.then259
  br label %if.end264

if.end264:                                        ; preds = %if.end263, %if.end255
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ur, align 4
  %126 = load i32* %ur, align 4
  %conv265 = zext i32 %126 to i64
  %127 = load i64* %ll, align 8
  %add266 = add nsw i64 %127, %conv265
  store i64 %add266, i64* %ll, align 8
  %128 = load i64* %ll, align 8
  %cmp267 = icmp ne i64 %128, 7
  br i1 %cmp267, label %if.then269, label %if.end274

if.then269:                                       ; preds = %if.end264
  store i32 75, i32* %lrc, align 4
  %129 = load i32* %prlc, align 4
  %tobool270 = icmp ne i32 %129, 0
  br i1 %tobool270, label %if.then271, label %if.end273

if.then271:                                       ; preds = %if.then269
  %130 = load i32* %lrc, align 4
  %call272 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %130)
  br label %if.end273

if.end273:                                        ; preds = %if.then271, %if.then269
  br label %if.end274

if.end274:                                        ; preds = %if.end273, %if.end264
  store i64 5, i64* %ll, align 8
  store float 2.000000e+00, float* %fr, align 4
  %131 = load float* %fr, align 4
  %132 = load i64* %ll, align 8
  %conv275 = sitofp i64 %132 to float
  %add276 = fadd float %conv275, %131
  %conv277 = fptosi float %add276 to i64
  store i64 %conv277, i64* %ll, align 8
  %133 = load i64* %ll, align 8
  %cmp278 = icmp ne i64 %133, 7
  br i1 %cmp278, label %if.then280, label %if.end285

if.then280:                                       ; preds = %if.end274
  store i32 76, i32* %lrc, align 4
  %134 = load i32* %prlc, align 4
  %tobool281 = icmp ne i32 %134, 0
  br i1 %tobool281, label %if.then282, label %if.end284

if.then282:                                       ; preds = %if.then280
  %135 = load i32* %lrc, align 4
  %call283 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %135)
  br label %if.end284

if.end284:                                        ; preds = %if.then282, %if.then280
  br label %if.end285

if.end285:                                        ; preds = %if.end284, %if.end274
  store i64 5, i64* %ll, align 8
  store double 2.000000e+00, double* %dr, align 8
  %136 = load double* %dr, align 8
  %137 = load i64* %ll, align 8
  %conv286 = sitofp i64 %137 to double
  %add287 = fadd double %conv286, %136
  %conv288 = fptosi double %add287 to i64
  store i64 %conv288, i64* %ll, align 8
  %138 = load i64* %ll, align 8
  %cmp289 = icmp ne i64 %138, 7
  br i1 %cmp289, label %if.then291, label %if.end296

if.then291:                                       ; preds = %if.end285
  store i32 77, i32* %lrc, align 4
  %139 = load i32* %prlc, align 4
  %tobool292 = icmp ne i32 %139, 0
  br i1 %tobool292, label %if.then293, label %if.end295

if.then293:                                       ; preds = %if.then291
  %140 = load i32* %lrc, align 4
  %call294 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %140)
  br label %if.end295

if.end295:                                        ; preds = %if.then293, %if.then291
  br label %if.end296

if.end296:                                        ; preds = %if.end295, %if.end285
  store i32 5, i32* %ul, align 4
  store i8 2, i8* %cr, align 1
  %141 = load i8* %cr, align 1
  %conv297 = sext i8 %141 to i32
  %142 = load i32* %ul, align 4
  %add298 = add i32 %142, %conv297
  store i32 %add298, i32* %ul, align 4
  %143 = load i32* %ul, align 4
  %cmp299 = icmp ne i32 %143, 7
  br i1 %cmp299, label %if.then301, label %if.end306

if.then301:                                       ; preds = %if.end296
  store i32 78, i32* %lrc, align 4
  %144 = load i32* %prlc, align 4
  %tobool302 = icmp ne i32 %144, 0
  br i1 %tobool302, label %if.then303, label %if.end305

if.then303:                                       ; preds = %if.then301
  %145 = load i32* %lrc, align 4
  %call304 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %145)
  br label %if.end305

if.end305:                                        ; preds = %if.then303, %if.then301
  br label %if.end306

if.end306:                                        ; preds = %if.end305, %if.end296
  store i32 5, i32* %ul, align 4
  store i16 2, i16* %sr, align 2
  %146 = load i16* %sr, align 2
  %conv307 = sext i16 %146 to i32
  %147 = load i32* %ul, align 4
  %add308 = add i32 %147, %conv307
  store i32 %add308, i32* %ul, align 4
  %148 = load i32* %ul, align 4
  %cmp309 = icmp ne i32 %148, 7
  br i1 %cmp309, label %if.then311, label %if.end316

if.then311:                                       ; preds = %if.end306
  store i32 79, i32* %lrc, align 4
  %149 = load i32* %prlc, align 4
  %tobool312 = icmp ne i32 %149, 0
  br i1 %tobool312, label %if.then313, label %if.end315

if.then313:                                       ; preds = %if.then311
  %150 = load i32* %lrc, align 4
  %call314 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %150)
  br label %if.end315

if.end315:                                        ; preds = %if.then313, %if.then311
  br label %if.end316

if.end316:                                        ; preds = %if.end315, %if.end306
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ir, align 4
  %151 = load i32* %ir, align 4
  %152 = load i32* %ul, align 4
  %add317 = add i32 %152, %151
  store i32 %add317, i32* %ul, align 4
  %153 = load i32* %ul, align 4
  %cmp318 = icmp ne i32 %153, 7
  br i1 %cmp318, label %if.then320, label %if.end325

if.then320:                                       ; preds = %if.end316
  store i32 80, i32* %lrc, align 4
  %154 = load i32* %prlc, align 4
  %tobool321 = icmp ne i32 %154, 0
  br i1 %tobool321, label %if.then322, label %if.end324

if.then322:                                       ; preds = %if.then320
  %155 = load i32* %lrc, align 4
  %call323 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %155)
  br label %if.end324

if.end324:                                        ; preds = %if.then322, %if.then320
  br label %if.end325

if.end325:                                        ; preds = %if.end324, %if.end316
  store i32 5, i32* %ul, align 4
  store i64 2, i64* %lr, align 8
  %156 = load i64* %lr, align 8
  %157 = load i32* %ul, align 4
  %conv326 = zext i32 %157 to i64
  %add327 = add nsw i64 %conv326, %156
  %conv328 = trunc i64 %add327 to i32
  store i32 %conv328, i32* %ul, align 4
  %158 = load i32* %ul, align 4
  %cmp329 = icmp ne i32 %158, 7
  br i1 %cmp329, label %if.then331, label %if.end336

if.then331:                                       ; preds = %if.end325
  store i32 81, i32* %lrc, align 4
  %159 = load i32* %prlc, align 4
  %tobool332 = icmp ne i32 %159, 0
  br i1 %tobool332, label %if.then333, label %if.end335

if.then333:                                       ; preds = %if.then331
  %160 = load i32* %lrc, align 4
  %call334 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %160)
  br label %if.end335

if.end335:                                        ; preds = %if.then333, %if.then331
  br label %if.end336

if.end336:                                        ; preds = %if.end335, %if.end325
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ur, align 4
  %161 = load i32* %ur, align 4
  %162 = load i32* %ul, align 4
  %add337 = add i32 %162, %161
  store i32 %add337, i32* %ul, align 4
  %163 = load i32* %ul, align 4
  %cmp338 = icmp ne i32 %163, 7
  br i1 %cmp338, label %if.then340, label %if.end345

if.then340:                                       ; preds = %if.end336
  store i32 82, i32* %lrc, align 4
  %164 = load i32* %prlc, align 4
  %tobool341 = icmp ne i32 %164, 0
  br i1 %tobool341, label %if.then342, label %if.end344

if.then342:                                       ; preds = %if.then340
  %165 = load i32* %lrc, align 4
  %call343 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %165)
  br label %if.end344

if.end344:                                        ; preds = %if.then342, %if.then340
  br label %if.end345

if.end345:                                        ; preds = %if.end344, %if.end336
  store i32 5, i32* %ul, align 4
  store float 2.000000e+00, float* %fr, align 4
  %166 = load float* %fr, align 4
  %167 = load i32* %ul, align 4
  %conv346 = uitofp i32 %167 to float
  %add347 = fadd float %conv346, %166
  %conv348 = fptoui float %add347 to i32
  store i32 %conv348, i32* %ul, align 4
  %168 = load i32* %ul, align 4
  %cmp349 = icmp ne i32 %168, 7
  br i1 %cmp349, label %if.then351, label %if.end356

if.then351:                                       ; preds = %if.end345
  store i32 83, i32* %lrc, align 4
  %169 = load i32* %prlc, align 4
  %tobool352 = icmp ne i32 %169, 0
  br i1 %tobool352, label %if.then353, label %if.end355

if.then353:                                       ; preds = %if.then351
  %170 = load i32* %lrc, align 4
  %call354 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %170)
  br label %if.end355

if.end355:                                        ; preds = %if.then353, %if.then351
  br label %if.end356

if.end356:                                        ; preds = %if.end355, %if.end345
  store i32 5, i32* %ul, align 4
  store double 2.000000e+00, double* %dr, align 8
  %171 = load double* %dr, align 8
  %172 = load i32* %ul, align 4
  %conv357 = uitofp i32 %172 to double
  %add358 = fadd double %conv357, %171
  %conv359 = fptoui double %add358 to i32
  store i32 %conv359, i32* %ul, align 4
  %173 = load i32* %ul, align 4
  %cmp360 = icmp ne i32 %173, 7
  br i1 %cmp360, label %if.then362, label %if.end367

if.then362:                                       ; preds = %if.end356
  store i32 84, i32* %lrc, align 4
  %174 = load i32* %prlc, align 4
  %tobool363 = icmp ne i32 %174, 0
  br i1 %tobool363, label %if.then364, label %if.end366

if.then364:                                       ; preds = %if.then362
  %175 = load i32* %lrc, align 4
  %call365 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %175)
  br label %if.end366

if.end366:                                        ; preds = %if.then364, %if.then362
  br label %if.end367

if.end367:                                        ; preds = %if.end366, %if.end356
  store float 5.000000e+00, float* %fl, align 4
  store i8 2, i8* %cr, align 1
  %176 = load i8* %cr, align 1
  %conv368 = sext i8 %176 to i32
  %conv369 = sitofp i32 %conv368 to float
  %177 = load float* %fl, align 4
  %add370 = fadd float %177, %conv369
  store float %add370, float* %fl, align 4
  %178 = load float* %fl, align 4
  %cmp371 = fcmp une float %178, 7.000000e+00
  br i1 %cmp371, label %if.then373, label %if.end378

if.then373:                                       ; preds = %if.end367
  store i32 85, i32* %lrc, align 4
  %179 = load i32* %prlc, align 4
  %tobool374 = icmp ne i32 %179, 0
  br i1 %tobool374, label %if.then375, label %if.end377

if.then375:                                       ; preds = %if.then373
  %180 = load i32* %lrc, align 4
  %call376 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %180)
  br label %if.end377

if.end377:                                        ; preds = %if.then375, %if.then373
  br label %if.end378

if.end378:                                        ; preds = %if.end377, %if.end367
  store float 5.000000e+00, float* %fl, align 4
  store i16 2, i16* %sr, align 2
  %181 = load i16* %sr, align 2
  %conv379 = sext i16 %181 to i32
  %conv380 = sitofp i32 %conv379 to float
  %182 = load float* %fl, align 4
  %add381 = fadd float %182, %conv380
  store float %add381, float* %fl, align 4
  %183 = load float* %fl, align 4
  %cmp382 = fcmp une float %183, 7.000000e+00
  br i1 %cmp382, label %if.then384, label %if.end389

if.then384:                                       ; preds = %if.end378
  store i32 86, i32* %lrc, align 4
  %184 = load i32* %prlc, align 4
  %tobool385 = icmp ne i32 %184, 0
  br i1 %tobool385, label %if.then386, label %if.end388

if.then386:                                       ; preds = %if.then384
  %185 = load i32* %lrc, align 4
  %call387 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %185)
  br label %if.end388

if.end388:                                        ; preds = %if.then386, %if.then384
  br label %if.end389

if.end389:                                        ; preds = %if.end388, %if.end378
  store float 5.000000e+00, float* %fl, align 4
  store i32 2, i32* %ir, align 4
  %186 = load i32* %ir, align 4
  %conv390 = sitofp i32 %186 to float
  %187 = load float* %fl, align 4
  %add391 = fadd float %187, %conv390
  store float %add391, float* %fl, align 4
  %188 = load float* %fl, align 4
  %cmp392 = fcmp une float %188, 7.000000e+00
  br i1 %cmp392, label %if.then394, label %if.end399

if.then394:                                       ; preds = %if.end389
  store i32 87, i32* %lrc, align 4
  %189 = load i32* %prlc, align 4
  %tobool395 = icmp ne i32 %189, 0
  br i1 %tobool395, label %if.then396, label %if.end398

if.then396:                                       ; preds = %if.then394
  %190 = load i32* %lrc, align 4
  %call397 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %190)
  br label %if.end398

if.end398:                                        ; preds = %if.then396, %if.then394
  br label %if.end399

if.end399:                                        ; preds = %if.end398, %if.end389
  store float 5.000000e+00, float* %fl, align 4
  store i64 2, i64* %lr, align 8
  %191 = load i64* %lr, align 8
  %conv400 = sitofp i64 %191 to float
  %192 = load float* %fl, align 4
  %add401 = fadd float %192, %conv400
  store float %add401, float* %fl, align 4
  %193 = load float* %fl, align 4
  %cmp402 = fcmp une float %193, 7.000000e+00
  br i1 %cmp402, label %if.then404, label %if.end409

if.then404:                                       ; preds = %if.end399
  store i32 88, i32* %lrc, align 4
  %194 = load i32* %prlc, align 4
  %tobool405 = icmp ne i32 %194, 0
  br i1 %tobool405, label %if.then406, label %if.end408

if.then406:                                       ; preds = %if.then404
  %195 = load i32* %lrc, align 4
  %call407 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %195)
  br label %if.end408

if.end408:                                        ; preds = %if.then406, %if.then404
  br label %if.end409

if.end409:                                        ; preds = %if.end408, %if.end399
  store float 5.000000e+00, float* %fl, align 4
  store i32 2, i32* %ur, align 4
  %196 = load i32* %ur, align 4
  %conv410 = uitofp i32 %196 to float
  %197 = load float* %fl, align 4
  %add411 = fadd float %197, %conv410
  store float %add411, float* %fl, align 4
  %198 = load float* %fl, align 4
  %cmp412 = fcmp une float %198, 7.000000e+00
  br i1 %cmp412, label %if.then414, label %if.end419

if.then414:                                       ; preds = %if.end409
  store i32 89, i32* %lrc, align 4
  %199 = load i32* %prlc, align 4
  %tobool415 = icmp ne i32 %199, 0
  br i1 %tobool415, label %if.then416, label %if.end418

if.then416:                                       ; preds = %if.then414
  %200 = load i32* %lrc, align 4
  %call417 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %200)
  br label %if.end418

if.end418:                                        ; preds = %if.then416, %if.then414
  br label %if.end419

if.end419:                                        ; preds = %if.end418, %if.end409
  store float 5.000000e+00, float* %fl, align 4
  store float 2.000000e+00, float* %fr, align 4
  %201 = load float* %fr, align 4
  %202 = load float* %fl, align 4
  %add420 = fadd float %202, %201
  store float %add420, float* %fl, align 4
  %203 = load float* %fl, align 4
  %cmp421 = fcmp une float %203, 7.000000e+00
  br i1 %cmp421, label %if.then423, label %if.end428

if.then423:                                       ; preds = %if.end419
  store i32 90, i32* %lrc, align 4
  %204 = load i32* %prlc, align 4
  %tobool424 = icmp ne i32 %204, 0
  br i1 %tobool424, label %if.then425, label %if.end427

if.then425:                                       ; preds = %if.then423
  %205 = load i32* %lrc, align 4
  %call426 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %205)
  br label %if.end427

if.end427:                                        ; preds = %if.then425, %if.then423
  br label %if.end428

if.end428:                                        ; preds = %if.end427, %if.end419
  store float 5.000000e+00, float* %fl, align 4
  store double 2.000000e+00, double* %dr, align 8
  %206 = load double* %dr, align 8
  %207 = load float* %fl, align 4
  %conv429 = fpext float %207 to double
  %add430 = fadd double %conv429, %206
  %conv431 = fptrunc double %add430 to float
  store float %conv431, float* %fl, align 4
  %208 = load float* %fl, align 4
  %cmp432 = fcmp une float %208, 7.000000e+00
  br i1 %cmp432, label %if.then434, label %if.end439

if.then434:                                       ; preds = %if.end428
  store i32 91, i32* %lrc, align 4
  %209 = load i32* %prlc, align 4
  %tobool435 = icmp ne i32 %209, 0
  br i1 %tobool435, label %if.then436, label %if.end438

if.then436:                                       ; preds = %if.then434
  %210 = load i32* %lrc, align 4
  %call437 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %210)
  br label %if.end438

if.end438:                                        ; preds = %if.then436, %if.then434
  br label %if.end439

if.end439:                                        ; preds = %if.end438, %if.end428
  store double 5.000000e+00, double* %dl, align 8
  store i8 2, i8* %cr, align 1
  %211 = load i8* %cr, align 1
  %conv440 = sext i8 %211 to i32
  %conv441 = sitofp i32 %conv440 to double
  %212 = load double* %dl, align 8
  %add442 = fadd double %212, %conv441
  store double %add442, double* %dl, align 8
  %213 = load double* %dl, align 8
  %cmp443 = fcmp une double %213, 7.000000e+00
  br i1 %cmp443, label %if.then445, label %if.end450

if.then445:                                       ; preds = %if.end439
  store i32 92, i32* %lrc, align 4
  %214 = load i32* %prlc, align 4
  %tobool446 = icmp ne i32 %214, 0
  br i1 %tobool446, label %if.then447, label %if.end449

if.then447:                                       ; preds = %if.then445
  %215 = load i32* %lrc, align 4
  %call448 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %215)
  br label %if.end449

if.end449:                                        ; preds = %if.then447, %if.then445
  br label %if.end450

if.end450:                                        ; preds = %if.end449, %if.end439
  store double 5.000000e+00, double* %dl, align 8
  store i16 2, i16* %sr, align 2
  %216 = load i16* %sr, align 2
  %conv451 = sext i16 %216 to i32
  %conv452 = sitofp i32 %conv451 to double
  %217 = load double* %dl, align 8
  %add453 = fadd double %217, %conv452
  store double %add453, double* %dl, align 8
  %218 = load double* %dl, align 8
  %cmp454 = fcmp une double %218, 7.000000e+00
  br i1 %cmp454, label %if.then456, label %if.end461

if.then456:                                       ; preds = %if.end450
  store i32 93, i32* %lrc, align 4
  %219 = load i32* %prlc, align 4
  %tobool457 = icmp ne i32 %219, 0
  br i1 %tobool457, label %if.then458, label %if.end460

if.then458:                                       ; preds = %if.then456
  %220 = load i32* %lrc, align 4
  %call459 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %220)
  br label %if.end460

if.end460:                                        ; preds = %if.then458, %if.then456
  br label %if.end461

if.end461:                                        ; preds = %if.end460, %if.end450
  store double 5.000000e+00, double* %dl, align 8
  store i32 2, i32* %ir, align 4
  %221 = load i32* %ir, align 4
  %conv462 = sitofp i32 %221 to double
  %222 = load double* %dl, align 8
  %add463 = fadd double %222, %conv462
  store double %add463, double* %dl, align 8
  %223 = load double* %dl, align 8
  %cmp464 = fcmp une double %223, 7.000000e+00
  br i1 %cmp464, label %if.then466, label %if.end471

if.then466:                                       ; preds = %if.end461
  store i32 94, i32* %lrc, align 4
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
  store i64 2, i64* %lr, align 8
  %226 = load i64* %lr, align 8
  %conv472 = sitofp i64 %226 to double
  %227 = load double* %dl, align 8
  %add473 = fadd double %227, %conv472
  store double %add473, double* %dl, align 8
  %228 = load double* %dl, align 8
  %cmp474 = fcmp une double %228, 7.000000e+00
  br i1 %cmp474, label %if.then476, label %if.end481

if.then476:                                       ; preds = %if.end471
  store i32 95, i32* %lrc, align 4
  %229 = load i32* %prlc, align 4
  %tobool477 = icmp ne i32 %229, 0
  br i1 %tobool477, label %if.then478, label %if.end480

if.then478:                                       ; preds = %if.then476
  %230 = load i32* %lrc, align 4
  %call479 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %230)
  br label %if.end480

if.end480:                                        ; preds = %if.then478, %if.then476
  br label %if.end481

if.end481:                                        ; preds = %if.end480, %if.end471
  store double 5.000000e+00, double* %dl, align 8
  store i32 2, i32* %ur, align 4
  %231 = load i32* %ur, align 4
  %conv482 = uitofp i32 %231 to double
  %232 = load double* %dl, align 8
  %add483 = fadd double %232, %conv482
  store double %add483, double* %dl, align 8
  %233 = load double* %dl, align 8
  %cmp484 = fcmp une double %233, 7.000000e+00
  br i1 %cmp484, label %if.then486, label %if.end491

if.then486:                                       ; preds = %if.end481
  store i32 96, i32* %lrc, align 4
  %234 = load i32* %prlc, align 4
  %tobool487 = icmp ne i32 %234, 0
  br i1 %tobool487, label %if.then488, label %if.end490

if.then488:                                       ; preds = %if.then486
  %235 = load i32* %lrc, align 4
  %call489 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %235)
  br label %if.end490

if.end490:                                        ; preds = %if.then488, %if.then486
  br label %if.end491

if.end491:                                        ; preds = %if.end490, %if.end481
  store double 5.000000e+00, double* %dl, align 8
  store float 2.000000e+00, float* %fr, align 4
  %236 = load float* %fr, align 4
  %conv492 = fpext float %236 to double
  %237 = load double* %dl, align 8
  %add493 = fadd double %237, %conv492
  store double %add493, double* %dl, align 8
  %238 = load double* %dl, align 8
  %cmp494 = fcmp une double %238, 7.000000e+00
  br i1 %cmp494, label %if.then496, label %if.end501

if.then496:                                       ; preds = %if.end491
  store i32 97, i32* %lrc, align 4
  %239 = load i32* %prlc, align 4
  %tobool497 = icmp ne i32 %239, 0
  br i1 %tobool497, label %if.then498, label %if.end500

if.then498:                                       ; preds = %if.then496
  %240 = load i32* %lrc, align 4
  %call499 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %240)
  br label %if.end500

if.end500:                                        ; preds = %if.then498, %if.then496
  br label %if.end501

if.end501:                                        ; preds = %if.end500, %if.end491
  store double 5.000000e+00, double* %dl, align 8
  store double 2.000000e+00, double* %dr, align 8
  %241 = load double* %dr, align 8
  %242 = load double* %dl, align 8
  %add502 = fadd double %242, %241
  store double %add502, double* %dl, align 8
  %243 = load double* %dl, align 8
  %cmp503 = fcmp une double %243, 7.000000e+00
  br i1 %cmp503, label %if.then505, label %if.end510

if.then505:                                       ; preds = %if.end501
  store i32 98, i32* %lrc, align 4
  %244 = load i32* %prlc, align 4
  %tobool506 = icmp ne i32 %244, 0
  br i1 %tobool506, label %if.then507, label %if.end509

if.then507:                                       ; preds = %if.then505
  %245 = load i32* %lrc, align 4
  %call508 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %245)
  br label %if.end509

if.end509:                                        ; preds = %if.then507, %if.then505
  br label %if.end510

if.end510:                                        ; preds = %if.end509, %if.end501
  store i8 5, i8* %cl, align 1
  store i8 2, i8* %cr, align 1
  %246 = load i8* %cr, align 1
  %conv511 = sext i8 %246 to i32
  %247 = load i8* %cl, align 1
  %conv512 = sext i8 %247 to i32
  %sub = sub nsw i32 %conv512, %conv511
  %conv513 = trunc i32 %sub to i8
  store i8 %conv513, i8* %cl, align 1
  %248 = load i8* %cl, align 1
  %conv514 = sext i8 %248 to i32
  %cmp515 = icmp ne i32 %conv514, 3
  br i1 %cmp515, label %if.then517, label %if.end522

if.then517:                                       ; preds = %if.end510
  store i32 99, i32* %lrc, align 4
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
  store i16 2, i16* %sr, align 2
  %251 = load i16* %sr, align 2
  %conv523 = sext i16 %251 to i32
  %252 = load i8* %cl, align 1
  %conv524 = sext i8 %252 to i32
  %sub525 = sub nsw i32 %conv524, %conv523
  %conv526 = trunc i32 %sub525 to i8
  store i8 %conv526, i8* %cl, align 1
  %253 = load i8* %cl, align 1
  %conv527 = sext i8 %253 to i32
  %cmp528 = icmp ne i32 %conv527, 3
  br i1 %cmp528, label %if.then530, label %if.end535

if.then530:                                       ; preds = %if.end522
  store i32 100, i32* %lrc, align 4
  %254 = load i32* %prlc, align 4
  %tobool531 = icmp ne i32 %254, 0
  br i1 %tobool531, label %if.then532, label %if.end534

if.then532:                                       ; preds = %if.then530
  %255 = load i32* %lrc, align 4
  %call533 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %255)
  br label %if.end534

if.end534:                                        ; preds = %if.then532, %if.then530
  br label %if.end535

if.end535:                                        ; preds = %if.end534, %if.end522
  %256 = load i32* %lrc, align 4
  %cmp536 = icmp ne i32 %256, 0
  br i1 %cmp536, label %if.then538, label %if.end544

if.then538:                                       ; preds = %if.end535
  store i32 1, i32* %rc, align 4
  %257 = load %struct.defs** %pd0.addr, align 8
  %flgd = getelementptr inbounds %struct.defs* %257, i32 0, i32 11
  %258 = load i32* %flgd, align 4
  %cmp539 = icmp ne i32 %258, 0
  br i1 %cmp539, label %if.then541, label %if.end543

if.then541:                                       ; preds = %if.then538
  %call542 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @sec.s714er, i32 0, i32 0), i32 1)
  br label %if.end543

if.end543:                                        ; preds = %if.then541, %if.then538
  br label %if.end544

if.end544:                                        ; preds = %if.end543, %if.end535
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
