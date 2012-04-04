; ModuleID = '/home/david/src/c-semantics/tests/unitTests/cq-17-s86.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.defs = type { i32, i32, i32, i32, i32, i32, i32, float, float, i32, i32, i32, i32, i32, i32, [8 x i8] }

@setupTable.qs26 = internal global [8 x i8] c"s26    \00", align 1
@setupTable.s = internal global [18 x i8] c"%3d bits in %ss.\0A\00", align 16
@setupTable.s2 = internal global [54 x i8] c"%f is the least number that can be added to 1. (%s).\0A\00", align 16
@svtest.k = internal global i32 0, align 4
@zero.k = internal global i32 0, align 4
@extvar = common global i32 0, align 4
@sec.s86er = internal global [10 x i8] c"s86,er%d\0A\00", align 1
@sec.qs86 = internal global [8 x i8] c"s86    \00", align 1
@sec.x = internal global [3 x i32] [i32 1, i32 3, i32 5], align 4
@sec.pint = internal global i32* bitcast (i8* getelementptr (i8* bitcast ([3 x i32]* @sec.x to i8*), i64 8) to i32*), align 8
@sec.zero = internal global [10 x i32] zeroinitializer, align 16
@sec.y0 = internal global [12 x float] [float 1.000000e+00, float 3.000000e+00, float 5.000000e+00, float 2.000000e+00, float 4.000000e+00, float 6.000000e+00, float 3.000000e+00, float 5.000000e+00, float 7.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00], align 16
@sec.y1 = internal global [4 x [3 x float]] [[3 x float] [float 1.000000e+00, float 3.000000e+00, float 5.000000e+00], [3 x float] [float 2.000000e+00, float 4.000000e+00, float 6.000000e+00], [3 x float] [float 3.000000e+00, float 5.000000e+00, float 7.000000e+00], [3 x float] zeroinitializer], align 16
@sec.y2 = internal global [4 x [3 x float]] [[3 x float] [float 1.000000e+00, float 3.000000e+00, float 5.000000e+00], [3 x float] [float 2.000000e+00, float 4.000000e+00, float 6.000000e+00], [3 x float] [float 3.000000e+00, float 5.000000e+00, float 7.000000e+00], [3 x float] zeroinitializer], align 16
@sec.y3 = internal global [4 x [3 x float]] [[3 x float] [float 1.000000e+00, float 0.000000e+00, float 0.000000e+00], [3 x float] [float 2.000000e+00, float 0.000000e+00, float 0.000000e+00], [3 x float] [float 3.000000e+00, float 0.000000e+00, float 0.000000e+00], [3 x float] [float 4.000000e+00, float 0.000000e+00, float 0.000000e+00]], align 16
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
  %lrc = alloca i32, align 4
  %rc = alloca i32, align 4
  %ps = alloca i8*, align 8
  %pt = alloca i8*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %apint = alloca i32*, align 8
  %rpint = alloca i32*, align 8
  store %struct.defs* %pd0, %struct.defs** %pd0.addr, align 8
  %0 = load i32** @sec.pint, align 8
  %add.ptr = getelementptr inbounds i32* %0, i64 -1
  store i32* %add.ptr, i32** %apint, align 8
  %1 = load i32** %apint, align 8
  %call = call i32 @one()
  %idx.ext = sext i32 %call to i64
  %add.ptr1 = getelementptr inbounds i32* %1, i64 %idx.ext
  store i32* %add.ptr1, i32** %rpint, align 8
  store i8* getelementptr inbounds ([8 x i8]* @sec.qs86, i32 0, i32 0), i8** %ps, align 8
  %2 = load %struct.defs** %pd0.addr, align 8
  %rfs = getelementptr inbounds %struct.defs* %2, i32 0, i32 15
  %arraydecay = getelementptr inbounds [8 x i8]* %rfs, i32 0, i32 0
  store i8* %arraydecay, i8** %pt, align 8
  store i32 0, i32* %rc, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %3 = load i8** %ps, align 8
  %incdec.ptr = getelementptr inbounds i8* %3, i32 1
  store i8* %incdec.ptr, i8** %ps, align 8
  %4 = load i8* %3, align 1
  %5 = load i8** %pt, align 8
  %incdec.ptr2 = getelementptr inbounds i8* %5, i32 1
  store i8* %incdec.ptr2, i8** %pt, align 8
  store i8 %4, i8* %5, align 1
  %tobool = icmp ne i8 %4, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %6 = load i32** @sec.pint, align 8
  %7 = load i32* %6, align 4
  %cmp = icmp ne i32 %7, 5
  br i1 %cmp, label %if.then, label %if.end6

if.then:                                          ; preds = %while.end
  %8 = load %struct.defs** %pd0.addr, align 8
  %flgd = getelementptr inbounds %struct.defs* %8, i32 0, i32 11
  %9 = load i32* %flgd, align 4
  %cmp3 = icmp ne i32 %9, 0
  br i1 %cmp3, label %if.then4, label %if.end

if.then4:                                         ; preds = %if.then
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s86er, i32 0, i32 0), i32 1)
  br label %if.end

if.end:                                           ; preds = %if.then4, %if.then
  %10 = load i32* %rc, align 4
  %add = add nsw i32 %10, 1
  store i32 %add, i32* %rc, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.end, %while.end
  %11 = load i32** %apint, align 8
  %12 = load i32* %11, align 4
  %cmp7 = icmp ne i32 %12, 3
  br i1 %cmp7, label %if.then8, label %if.end15

if.then8:                                         ; preds = %if.end6
  %13 = load %struct.defs** %pd0.addr, align 8
  %flgd9 = getelementptr inbounds %struct.defs* %13, i32 0, i32 11
  %14 = load i32* %flgd9, align 4
  %cmp10 = icmp ne i32 %14, 0
  br i1 %cmp10, label %if.then11, label %if.end13

if.then11:                                        ; preds = %if.then8
  %call12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s86er, i32 0, i32 0), i32 2)
  br label %if.end13

if.end13:                                         ; preds = %if.then11, %if.then8
  %15 = load i32* %rc, align 4
  %add14 = add nsw i32 %15, 2
  store i32 %add14, i32* %rc, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.end13, %if.end6
  %16 = load i32** %rpint, align 8
  %17 = load i32* %16, align 4
  %cmp16 = icmp ne i32 %17, 5
  br i1 %cmp16, label %if.then17, label %if.end24

if.then17:                                        ; preds = %if.end15
  %18 = load %struct.defs** %pd0.addr, align 8
  %flgd18 = getelementptr inbounds %struct.defs* %18, i32 0, i32 11
  %19 = load i32* %flgd18, align 4
  %cmp19 = icmp ne i32 %19, 0
  br i1 %cmp19, label %if.then20, label %if.end22

if.then20:                                        ; preds = %if.then17
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s86er, i32 0, i32 0), i32 4)
  br label %if.end22

if.end22:                                         ; preds = %if.then20, %if.then17
  %20 = load i32* %rc, align 4
  %add23 = add nsw i32 %20, 4
  store i32 %add23, i32* %rc, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.end22, %if.end15
  store i32 0, i32* %lrc, align 4
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end24
  %21 = load i32* %j, align 4
  %cmp25 = icmp slt i32 %21, 10
  br i1 %cmp25, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %22 = load i32* %j, align 4
  %idxprom = sext i32 %22 to i64
  %arrayidx = getelementptr inbounds [10 x i32]* @sec.zero, i32 0, i64 %idxprom
  %23 = load i32* %arrayidx, align 4
  %cmp26 = icmp ne i32 %23, 0
  br i1 %cmp26, label %if.then27, label %if.end28

if.then27:                                        ; preds = %for.body
  store i32 1, i32* %lrc, align 4
  br label %if.end28

if.end28:                                         ; preds = %if.then27, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end28
  %24 = load i32* %j, align 4
  %inc = add nsw i32 %24, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %25 = load i32* %lrc, align 4
  %cmp29 = icmp ne i32 %25, 0
  br i1 %cmp29, label %if.then30, label %if.end37

if.then30:                                        ; preds = %for.end
  %26 = load %struct.defs** %pd0.addr, align 8
  %flgd31 = getelementptr inbounds %struct.defs* %26, i32 0, i32 11
  %27 = load i32* %flgd31, align 4
  %cmp32 = icmp ne i32 %27, 0
  br i1 %cmp32, label %if.then33, label %if.end35

if.then33:                                        ; preds = %if.then30
  %call34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s86er, i32 0, i32 0), i32 8)
  br label %if.end35

if.end35:                                         ; preds = %if.then33, %if.then30
  %28 = load i32* %rc, align 4
  %add36 = add nsw i32 %28, 8
  store i32 %add36, i32* %rc, align 4
  br label %if.end37

if.end37:                                         ; preds = %if.end35, %for.end
  store i32 0, i32* %lrc, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond38

for.cond38:                                       ; preds = %for.inc66, %if.end37
  %29 = load i32* %i, align 4
  %cmp39 = icmp slt i32 %29, 4
  br i1 %cmp39, label %for.body40, label %for.end68

for.body40:                                       ; preds = %for.cond38
  store i32 0, i32* %j, align 4
  br label %for.cond41

for.cond41:                                       ; preds = %for.inc63, %for.body40
  %30 = load i32* %j, align 4
  %cmp42 = icmp slt i32 %30, 3
  br i1 %cmp42, label %for.body43, label %for.end65

for.body43:                                       ; preds = %for.cond41
  %31 = load i32* %i, align 4
  %mul = mul nsw i32 3, %31
  %32 = load i32* %j, align 4
  %add44 = add nsw i32 %mul, %32
  store i32 %add44, i32* %k, align 4
  %33 = load i32* %j, align 4
  %idxprom45 = sext i32 %33 to i64
  %34 = load i32* %i, align 4
  %idxprom46 = sext i32 %34 to i64
  %arrayidx47 = getelementptr inbounds [4 x [3 x float]]* @sec.y1, i32 0, i64 %idxprom46
  %arrayidx48 = getelementptr inbounds [3 x float]* %arrayidx47, i32 0, i64 %idxprom45
  %35 = load float* %arrayidx48, align 4
  %36 = load i32* %j, align 4
  %idxprom49 = sext i32 %36 to i64
  %37 = load i32* %i, align 4
  %idxprom50 = sext i32 %37 to i64
  %arrayidx51 = getelementptr inbounds [4 x [3 x float]]* @sec.y2, i32 0, i64 %idxprom50
  %arrayidx52 = getelementptr inbounds [3 x float]* %arrayidx51, i32 0, i64 %idxprom49
  %38 = load float* %arrayidx52, align 4
  %cmp53 = fcmp une float %35, %38
  br i1 %cmp53, label %if.then61, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body43
  %39 = load i32* %j, align 4
  %idxprom54 = sext i32 %39 to i64
  %40 = load i32* %i, align 4
  %idxprom55 = sext i32 %40 to i64
  %arrayidx56 = getelementptr inbounds [4 x [3 x float]]* @sec.y1, i32 0, i64 %idxprom55
  %arrayidx57 = getelementptr inbounds [3 x float]* %arrayidx56, i32 0, i64 %idxprom54
  %41 = load float* %arrayidx57, align 4
  %42 = load i32* %k, align 4
  %idxprom58 = sext i32 %42 to i64
  %arrayidx59 = getelementptr inbounds [12 x float]* @sec.y0, i32 0, i64 %idxprom58
  %43 = load float* %arrayidx59, align 4
  %cmp60 = fcmp une float %41, %43
  br i1 %cmp60, label %if.then61, label %if.end62

if.then61:                                        ; preds = %lor.lhs.false, %for.body43
  store i32 1, i32* %lrc, align 4
  br label %if.end62

if.end62:                                         ; preds = %if.then61, %lor.lhs.false
  br label %for.inc63

for.inc63:                                        ; preds = %if.end62
  %44 = load i32* %j, align 4
  %inc64 = add nsw i32 %44, 1
  store i32 %inc64, i32* %j, align 4
  br label %for.cond41

for.end65:                                        ; preds = %for.cond41
  br label %for.inc66

for.inc66:                                        ; preds = %for.end65
  %45 = load i32* %i, align 4
  %inc67 = add nsw i32 %45, 1
  store i32 %inc67, i32* %i, align 4
  br label %for.cond38

for.end68:                                        ; preds = %for.cond38
  %46 = load i32* %lrc, align 4
  %cmp69 = icmp ne i32 %46, 0
  br i1 %cmp69, label %if.then70, label %if.end77

if.then70:                                        ; preds = %for.end68
  %47 = load %struct.defs** %pd0.addr, align 8
  %flgd71 = getelementptr inbounds %struct.defs* %47, i32 0, i32 11
  %48 = load i32* %flgd71, align 4
  %cmp72 = icmp ne i32 %48, 0
  br i1 %cmp72, label %if.then73, label %if.end75

if.then73:                                        ; preds = %if.then70
  %call74 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s86er, i32 0, i32 0), i32 16)
  br label %if.end75

if.end75:                                         ; preds = %if.then73, %if.then70
  %49 = load i32* %rc, align 4
  %add76 = add nsw i32 %49, 16
  store i32 %add76, i32* %rc, align 4
  br label %if.end77

if.end77:                                         ; preds = %if.end75, %for.end68
  store i32 0, i32* %lrc, align 4
  store i32 0, i32* %j, align 4
  br label %for.cond78

for.cond78:                                       ; preds = %for.inc89, %if.end77
  %50 = load i32* %j, align 4
  %cmp79 = icmp slt i32 %50, 4
  br i1 %cmp79, label %for.body80, label %for.end91

for.body80:                                       ; preds = %for.cond78
  %51 = load i32* %j, align 4
  %idxprom81 = sext i32 %51 to i64
  %arrayidx82 = getelementptr inbounds [4 x [3 x float]]* @sec.y3, i32 0, i64 %idxprom81
  %arrayidx83 = getelementptr inbounds [3 x float]* %arrayidx82, i32 0, i64 0
  %52 = load float* %arrayidx83, align 4
  %53 = load i32* %j, align 4
  %add84 = add nsw i32 %53, 1
  %conv = sitofp i32 %add84 to float
  %cmp85 = fcmp une float %52, %conv
  br i1 %cmp85, label %if.then87, label %if.end88

if.then87:                                        ; preds = %for.body80
  store i32 1, i32* %lrc, align 4
  br label %if.end88

if.end88:                                         ; preds = %if.then87, %for.body80
  br label %for.inc89

for.inc89:                                        ; preds = %if.end88
  %54 = load i32* %j, align 4
  %inc90 = add nsw i32 %54, 1
  store i32 %inc90, i32* %j, align 4
  br label %for.cond78

for.end91:                                        ; preds = %for.cond78
  %55 = load i32* %lrc, align 4
  %cmp92 = icmp ne i32 %55, 0
  br i1 %cmp92, label %if.then94, label %if.end102

if.then94:                                        ; preds = %for.end91
  %56 = load %struct.defs** %pd0.addr, align 8
  %flgd95 = getelementptr inbounds %struct.defs* %56, i32 0, i32 11
  %57 = load i32* %flgd95, align 4
  %cmp96 = icmp ne i32 %57, 0
  br i1 %cmp96, label %if.then98, label %if.end100

if.then98:                                        ; preds = %if.then94
  %call99 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s86er, i32 0, i32 0), i32 32)
  br label %if.end100

if.end100:                                        ; preds = %if.then98, %if.then94
  %58 = load i32* %rc, align 4
  %add101 = add nsw i32 %58, 32
  store i32 %add101, i32* %rc, align 4
  br label %if.end102

if.end102:                                        ; preds = %if.end100, %for.end91
  %59 = load i32* %rc, align 4
  ret i32 %59
}

declare i32 @printf(i8*, ...)

define i32 @one() nounwind uwtable {
entry:
  ret i32 1
}

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
