; ModuleID = '/home/david/src/c-semantics/tests/unitTests/cq-14-s7813.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.defs = type { i32, i32, i32, i32, i32, i32, i32, float, float, i32, i32, i32, i32, i32, i32, [8 x i8] }

@setupTable.qs26 = internal global [8 x i8] c"s26    \00", align 1
@setupTable.s = internal global [18 x i8] c"%3d bits in %ss.\0A\00", align 16
@setupTable.s2 = internal global [54 x i8] c"%f is the least number that can be added to 1. (%s).\0A\00", align 16
@svtest.k = internal global i32 0, align 4
@zero.k = internal global i32 0, align 4
@extvar = common global i32 0, align 4
@sec.fl = internal global [17 x i8] c"Local error %d.\0A\00", align 16
@sec.s7813er = internal global [12 x i8] c"s7813,er%d\0A\00", align 1
@sec.qs7813 = internal global [8 x i8] c"s7813  \00", align 1
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
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %r = alloca i32, align 4
  %zero = alloca i32, align 4
  %one = alloca i32, align 4
  %rc = alloca i32, align 4
  %ps = alloca i8*, align 8
  %pt = alloca i8*, align 8
  store %struct.defs* %pd0, %struct.defs** %pd0.addr, align 8
  store i8* getelementptr inbounds ([8 x i8]* @sec.qs7813, i32 0, i32 0), i8** %ps, align 8
  %0 = load %struct.defs** %pd0.addr, align 8
  %rfs = getelementptr inbounds %struct.defs* %0, i32 0, i32 15
  %arraydecay = getelementptr inbounds [8 x i8]* %rfs, i32 0, i32 0
  store i8* %arraydecay, i8** %pt, align 8
  store i32 0, i32* %lrc, align 4
  store i32 0, i32* %rc, align 4
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
  %6 = load i32* %lrc, align 4
  %cmp = icmp ne i32 %6, 0
  br i1 %cmp, label %if.then, label %if.end4

if.then:                                          ; preds = %while.end
  %7 = load %struct.defs** %pd0.addr, align 8
  %flgd = getelementptr inbounds %struct.defs* %7, i32 0, i32 11
  %8 = load i32* %flgd, align 4
  %cmp2 = icmp ne i32 %8, 0
  br i1 %cmp2, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @sec.s7813er, i32 0, i32 0), i32 1)
  br label %if.end

if.end:                                           ; preds = %if.then3, %if.then
  %9 = load i32* %rc, align 4
  %add = add nsw i32 %9, 1
  store i32 %add, i32* %rc, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.end, %while.end
  store i32 0, i32* %lrc, align 4
  store i32 0, i32* %j, align 4
  store i32 0, i32* %i, align 4
  %10 = load i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  %tobool5 = icmp ne i32 %10, 0
  br i1 %tobool5, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.end4
  %11 = load i32* %j, align 4
  %inc6 = add nsw i32 %11, 1
  store i32 %inc6, i32* %j, align 4
  %tobool7 = icmp ne i32 %11, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.end4
  %12 = phi i1 [ false, %if.end4 ], [ %tobool7, %land.rhs ]
  %land.ext = zext i1 %12 to i32
  store i32 %land.ext, i32* %r, align 4
  %13 = load i32* %i, align 4
  %cmp8 = icmp ne i32 %13, 1
  br i1 %cmp8, label %if.then9, label %if.end14

if.then9:                                         ; preds = %land.end
  store i32 1, i32* %lrc, align 4
  %14 = load i32* %prlc, align 4
  %tobool10 = icmp ne i32 %14, 0
  br i1 %tobool10, label %if.then11, label %if.end13

if.then11:                                        ; preds = %if.then9
  %15 = load i32* %lrc, align 4
  %call12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %15)
  br label %if.end13

if.end13:                                         ; preds = %if.then11, %if.then9
  br label %if.end14

if.end14:                                         ; preds = %if.end13, %land.end
  %16 = load i32* %j, align 4
  %cmp15 = icmp ne i32 %16, 0
  br i1 %cmp15, label %if.then16, label %if.end21

if.then16:                                        ; preds = %if.end14
  store i32 2, i32* %lrc, align 4
  %17 = load i32* %prlc, align 4
  %tobool17 = icmp ne i32 %17, 0
  br i1 %tobool17, label %if.then18, label %if.end20

if.then18:                                        ; preds = %if.then16
  %18 = load i32* %lrc, align 4
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %18)
  br label %if.end20

if.end20:                                         ; preds = %if.then18, %if.then16
  br label %if.end21

if.end21:                                         ; preds = %if.end20, %if.end14
  %19 = load i32* %r, align 4
  %cmp22 = icmp ne i32 %19, 0
  br i1 %cmp22, label %if.then23, label %if.end28

if.then23:                                        ; preds = %if.end21
  store i32 3, i32* %lrc, align 4
  %20 = load i32* %prlc, align 4
  %tobool24 = icmp ne i32 %20, 0
  br i1 %tobool24, label %if.then25, label %if.end27

if.then25:                                        ; preds = %if.then23
  %21 = load i32* %lrc, align 4
  %call26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %21)
  br label %if.end27

if.end27:                                         ; preds = %if.then25, %if.then23
  br label %if.end28

if.end28:                                         ; preds = %if.end27, %if.end21
  %22 = load i32* %i, align 4
  %tobool29 = icmp ne i32 %22, 0
  br i1 %tobool29, label %land.rhs30, label %land.end33

land.rhs30:                                       ; preds = %if.end28
  %23 = load i32* %j, align 4
  %inc31 = add nsw i32 %23, 1
  store i32 %inc31, i32* %j, align 4
  %tobool32 = icmp ne i32 %23, 0
  br label %land.end33

land.end33:                                       ; preds = %land.rhs30, %if.end28
  %24 = phi i1 [ false, %if.end28 ], [ %tobool32, %land.rhs30 ]
  %land.ext34 = zext i1 %24 to i32
  store i32 %land.ext34, i32* %r, align 4
  %25 = load i32* %i, align 4
  %cmp35 = icmp ne i32 %25, 1
  br i1 %cmp35, label %if.then36, label %if.end41

if.then36:                                        ; preds = %land.end33
  store i32 4, i32* %lrc, align 4
  %26 = load i32* %prlc, align 4
  %tobool37 = icmp ne i32 %26, 0
  br i1 %tobool37, label %if.then38, label %if.end40

if.then38:                                        ; preds = %if.then36
  %27 = load i32* %lrc, align 4
  %call39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %27)
  br label %if.end40

if.end40:                                         ; preds = %if.then38, %if.then36
  br label %if.end41

if.end41:                                         ; preds = %if.end40, %land.end33
  %28 = load i32* %j, align 4
  %cmp42 = icmp ne i32 %28, 1
  br i1 %cmp42, label %if.then43, label %if.end48

if.then43:                                        ; preds = %if.end41
  store i32 5, i32* %lrc, align 4
  %29 = load i32* %prlc, align 4
  %tobool44 = icmp ne i32 %29, 0
  br i1 %tobool44, label %if.then45, label %if.end47

if.then45:                                        ; preds = %if.then43
  %30 = load i32* %lrc, align 4
  %call46 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %30)
  br label %if.end47

if.end47:                                         ; preds = %if.then45, %if.then43
  br label %if.end48

if.end48:                                         ; preds = %if.end47, %if.end41
  %31 = load i32* %r, align 4
  %cmp49 = icmp ne i32 %31, 0
  br i1 %cmp49, label %if.then50, label %if.end55

if.then50:                                        ; preds = %if.end48
  store i32 6, i32* %lrc, align 4
  %32 = load i32* %prlc, align 4
  %tobool51 = icmp ne i32 %32, 0
  br i1 %tobool51, label %if.then52, label %if.end54

if.then52:                                        ; preds = %if.then50
  %33 = load i32* %lrc, align 4
  %call53 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %33)
  br label %if.end54

if.end54:                                         ; preds = %if.then52, %if.then50
  br label %if.end55

if.end55:                                         ; preds = %if.end54, %if.end48
  %34 = load i32* %i, align 4
  %dec = add nsw i32 %34, -1
  store i32 %dec, i32* %i, align 4
  %tobool56 = icmp ne i32 %34, 0
  br i1 %tobool56, label %land.rhs57, label %land.end59

land.rhs57:                                       ; preds = %if.end55
  %35 = load i32* %j, align 4
  %tobool58 = icmp ne i32 %35, 0
  br label %land.end59

land.end59:                                       ; preds = %land.rhs57, %if.end55
  %36 = phi i1 [ false, %if.end55 ], [ %tobool58, %land.rhs57 ]
  %land.ext60 = zext i1 %36 to i32
  store i32 %land.ext60, i32* %r, align 4
  %37 = load i32* %i, align 4
  %cmp61 = icmp ne i32 %37, 0
  br i1 %cmp61, label %if.then62, label %if.end67

if.then62:                                        ; preds = %land.end59
  store i32 7, i32* %lrc, align 4
  %38 = load i32* %prlc, align 4
  %tobool63 = icmp ne i32 %38, 0
  br i1 %tobool63, label %if.then64, label %if.end66

if.then64:                                        ; preds = %if.then62
  %39 = load i32* %lrc, align 4
  %call65 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %39)
  br label %if.end66

if.end66:                                         ; preds = %if.then64, %if.then62
  br label %if.end67

if.end67:                                         ; preds = %if.end66, %land.end59
  %40 = load i32* %j, align 4
  %cmp68 = icmp ne i32 %40, 1
  br i1 %cmp68, label %if.then69, label %if.end74

if.then69:                                        ; preds = %if.end67
  store i32 8, i32* %lrc, align 4
  %41 = load i32* %prlc, align 4
  %tobool70 = icmp ne i32 %41, 0
  br i1 %tobool70, label %if.then71, label %if.end73

if.then71:                                        ; preds = %if.then69
  %42 = load i32* %lrc, align 4
  %call72 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %42)
  br label %if.end73

if.end73:                                         ; preds = %if.then71, %if.then69
  br label %if.end74

if.end74:                                         ; preds = %if.end73, %if.end67
  %43 = load i32* %r, align 4
  %cmp75 = icmp ne i32 %43, 1
  br i1 %cmp75, label %if.then76, label %if.end81

if.then76:                                        ; preds = %if.end74
  store i32 9, i32* %lrc, align 4
  %44 = load i32* %prlc, align 4
  %tobool77 = icmp ne i32 %44, 0
  br i1 %tobool77, label %if.then78, label %if.end80

if.then78:                                        ; preds = %if.then76
  %45 = load i32* %lrc, align 4
  %call79 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %45)
  br label %if.end80

if.end80:                                         ; preds = %if.then78, %if.then76
  br label %if.end81

if.end81:                                         ; preds = %if.end80, %if.end74
  %46 = load i32* %i, align 4
  %tobool82 = icmp ne i32 %46, 0
  br i1 %tobool82, label %land.rhs83, label %land.end86

land.rhs83:                                       ; preds = %if.end81
  %47 = load i32* %j, align 4
  %dec84 = add nsw i32 %47, -1
  store i32 %dec84, i32* %j, align 4
  %tobool85 = icmp ne i32 %47, 0
  br label %land.end86

land.end86:                                       ; preds = %land.rhs83, %if.end81
  %48 = phi i1 [ false, %if.end81 ], [ %tobool85, %land.rhs83 ]
  %land.ext87 = zext i1 %48 to i32
  store i32 %land.ext87, i32* %r, align 4
  %49 = load i32* %i, align 4
  %cmp88 = icmp ne i32 %49, 0
  br i1 %cmp88, label %if.then89, label %if.end94

if.then89:                                        ; preds = %land.end86
  store i32 10, i32* %lrc, align 4
  %50 = load i32* %prlc, align 4
  %tobool90 = icmp ne i32 %50, 0
  br i1 %tobool90, label %if.then91, label %if.end93

if.then91:                                        ; preds = %if.then89
  %51 = load i32* %lrc, align 4
  %call92 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %51)
  br label %if.end93

if.end93:                                         ; preds = %if.then91, %if.then89
  br label %if.end94

if.end94:                                         ; preds = %if.end93, %land.end86
  %52 = load i32* %j, align 4
  %cmp95 = icmp ne i32 %52, 1
  br i1 %cmp95, label %if.then96, label %if.end101

if.then96:                                        ; preds = %if.end94
  store i32 11, i32* %lrc, align 4
  %53 = load i32* %prlc, align 4
  %tobool97 = icmp ne i32 %53, 0
  br i1 %tobool97, label %if.then98, label %if.end100

if.then98:                                        ; preds = %if.then96
  %54 = load i32* %lrc, align 4
  %call99 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %54)
  br label %if.end100

if.end100:                                        ; preds = %if.then98, %if.then96
  br label %if.end101

if.end101:                                        ; preds = %if.end100, %if.end94
  %55 = load i32* %r, align 4
  %cmp102 = icmp ne i32 %55, 0
  br i1 %cmp102, label %if.then103, label %if.end108

if.then103:                                       ; preds = %if.end101
  store i32 12, i32* %lrc, align 4
  %56 = load i32* %prlc, align 4
  %tobool104 = icmp ne i32 %56, 0
  br i1 %tobool104, label %if.then105, label %if.end107

if.then105:                                       ; preds = %if.then103
  %57 = load i32* %lrc, align 4
  %call106 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %57)
  br label %if.end107

if.end107:                                        ; preds = %if.then105, %if.then103
  br label %if.end108

if.end108:                                        ; preds = %if.end107, %if.end101
  %58 = load i32* %lrc, align 4
  %cmp109 = icmp ne i32 %58, 0
  br i1 %cmp109, label %if.then110, label %if.end117

if.then110:                                       ; preds = %if.end108
  %59 = load %struct.defs** %pd0.addr, align 8
  %flgd111 = getelementptr inbounds %struct.defs* %59, i32 0, i32 11
  %60 = load i32* %flgd111, align 4
  %cmp112 = icmp ne i32 %60, 0
  br i1 %cmp112, label %if.then113, label %if.end115

if.then113:                                       ; preds = %if.then110
  %call114 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @sec.s7813er, i32 0, i32 0), i32 2)
  br label %if.end115

if.end115:                                        ; preds = %if.then113, %if.then110
  %61 = load i32* %rc, align 4
  %add116 = add nsw i32 %61, 2
  store i32 %add116, i32* %rc, align 4
  br label %if.end117

if.end117:                                        ; preds = %if.end115, %if.end108
  store i32 0, i32* %lrc, align 4
  store i32 0, i32* %j, align 4
  store i32 0, i32* %i, align 4
  %62 = load i32* %i, align 4
  %inc118 = add nsw i32 %62, 1
  store i32 %inc118, i32* %i, align 4
  %tobool119 = icmp ne i32 %62, 0
  br i1 %tobool119, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.end117
  %63 = load i32* %j, align 4
  %tobool120 = icmp ne i32 %63, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.end117
  %64 = phi i1 [ true, %if.end117 ], [ %tobool120, %lor.rhs ]
  %lor.ext = zext i1 %64 to i32
  store i32 %lor.ext, i32* %r, align 4
  %65 = load i32* %i, align 4
  %cmp121 = icmp ne i32 %65, 1
  br i1 %cmp121, label %if.then122, label %if.end127

if.then122:                                       ; preds = %lor.end
  store i32 1, i32* %lrc, align 4
  %66 = load i32* %prlc, align 4
  %tobool123 = icmp ne i32 %66, 0
  br i1 %tobool123, label %if.then124, label %if.end126

if.then124:                                       ; preds = %if.then122
  %67 = load i32* %lrc, align 4
  %call125 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %67)
  br label %if.end126

if.end126:                                        ; preds = %if.then124, %if.then122
  br label %if.end127

if.end127:                                        ; preds = %if.end126, %lor.end
  %68 = load i32* %j, align 4
  %cmp128 = icmp ne i32 %68, 0
  br i1 %cmp128, label %if.then129, label %if.end134

if.then129:                                       ; preds = %if.end127
  store i32 2, i32* %lrc, align 4
  %69 = load i32* %prlc, align 4
  %tobool130 = icmp ne i32 %69, 0
  br i1 %tobool130, label %if.then131, label %if.end133

if.then131:                                       ; preds = %if.then129
  %70 = load i32* %lrc, align 4
  %call132 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %70)
  br label %if.end133

if.end133:                                        ; preds = %if.then131, %if.then129
  br label %if.end134

if.end134:                                        ; preds = %if.end133, %if.end127
  %71 = load i32* %r, align 4
  %cmp135 = icmp ne i32 %71, 0
  br i1 %cmp135, label %if.then136, label %if.end141

if.then136:                                       ; preds = %if.end134
  store i32 3, i32* %lrc, align 4
  %72 = load i32* %prlc, align 4
  %tobool137 = icmp ne i32 %72, 0
  br i1 %tobool137, label %if.then138, label %if.end140

if.then138:                                       ; preds = %if.then136
  %73 = load i32* %lrc, align 4
  %call139 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %73)
  br label %if.end140

if.end140:                                        ; preds = %if.then138, %if.then136
  br label %if.end141

if.end141:                                        ; preds = %if.end140, %if.end134
  %74 = load i32* %j, align 4
  %inc142 = add nsw i32 %74, 1
  store i32 %inc142, i32* %j, align 4
  %tobool143 = icmp ne i32 %74, 0
  br i1 %tobool143, label %lor.end146, label %lor.rhs144

lor.rhs144:                                       ; preds = %if.end141
  %75 = load i32* %i, align 4
  %tobool145 = icmp ne i32 %75, 0
  br label %lor.end146

lor.end146:                                       ; preds = %lor.rhs144, %if.end141
  %76 = phi i1 [ true, %if.end141 ], [ %tobool145, %lor.rhs144 ]
  %lor.ext147 = zext i1 %76 to i32
  store i32 %lor.ext147, i32* %r, align 4
  %77 = load i32* %i, align 4
  %cmp148 = icmp ne i32 %77, 1
  br i1 %cmp148, label %if.then149, label %if.end154

if.then149:                                       ; preds = %lor.end146
  store i32 4, i32* %lrc, align 4
  %78 = load i32* %prlc, align 4
  %tobool150 = icmp ne i32 %78, 0
  br i1 %tobool150, label %if.then151, label %if.end153

if.then151:                                       ; preds = %if.then149
  %79 = load i32* %lrc, align 4
  %call152 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %79)
  br label %if.end153

if.end153:                                        ; preds = %if.then151, %if.then149
  br label %if.end154

if.end154:                                        ; preds = %if.end153, %lor.end146
  %80 = load i32* %j, align 4
  %cmp155 = icmp ne i32 %80, 1
  br i1 %cmp155, label %if.then156, label %if.end161

if.then156:                                       ; preds = %if.end154
  store i32 5, i32* %lrc, align 4
  %81 = load i32* %prlc, align 4
  %tobool157 = icmp ne i32 %81, 0
  br i1 %tobool157, label %if.then158, label %if.end160

if.then158:                                       ; preds = %if.then156
  %82 = load i32* %lrc, align 4
  %call159 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %82)
  br label %if.end160

if.end160:                                        ; preds = %if.then158, %if.then156
  br label %if.end161

if.end161:                                        ; preds = %if.end160, %if.end154
  %83 = load i32* %r, align 4
  %cmp162 = icmp ne i32 %83, 1
  br i1 %cmp162, label %if.then163, label %if.end168

if.then163:                                       ; preds = %if.end161
  store i32 6, i32* %lrc, align 4
  %84 = load i32* %prlc, align 4
  %tobool164 = icmp ne i32 %84, 0
  br i1 %tobool164, label %if.then165, label %if.end167

if.then165:                                       ; preds = %if.then163
  %85 = load i32* %lrc, align 4
  %call166 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %85)
  br label %if.end167

if.end167:                                        ; preds = %if.then165, %if.then163
  br label %if.end168

if.end168:                                        ; preds = %if.end167, %if.end161
  %86 = load i32* %i, align 4
  %dec169 = add nsw i32 %86, -1
  store i32 %dec169, i32* %i, align 4
  %tobool170 = icmp ne i32 %86, 0
  br i1 %tobool170, label %lor.end174, label %lor.rhs171

lor.rhs171:                                       ; preds = %if.end168
  %87 = load i32* %j, align 4
  %dec172 = add nsw i32 %87, -1
  store i32 %dec172, i32* %j, align 4
  %tobool173 = icmp ne i32 %87, 0
  br label %lor.end174

lor.end174:                                       ; preds = %lor.rhs171, %if.end168
  %88 = phi i1 [ true, %if.end168 ], [ %tobool173, %lor.rhs171 ]
  %lor.ext175 = zext i1 %88 to i32
  store i32 %lor.ext175, i32* %r, align 4
  %89 = load i32* %i, align 4
  %cmp176 = icmp ne i32 %89, 0
  br i1 %cmp176, label %if.then177, label %if.end182

if.then177:                                       ; preds = %lor.end174
  store i32 7, i32* %lrc, align 4
  %90 = load i32* %prlc, align 4
  %tobool178 = icmp ne i32 %90, 0
  br i1 %tobool178, label %if.then179, label %if.end181

if.then179:                                       ; preds = %if.then177
  %91 = load i32* %lrc, align 4
  %call180 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %91)
  br label %if.end181

if.end181:                                        ; preds = %if.then179, %if.then177
  br label %if.end182

if.end182:                                        ; preds = %if.end181, %lor.end174
  %92 = load i32* %j, align 4
  %cmp183 = icmp ne i32 %92, 1
  br i1 %cmp183, label %if.then184, label %if.end189

if.then184:                                       ; preds = %if.end182
  store i32 8, i32* %lrc, align 4
  %93 = load i32* %prlc, align 4
  %tobool185 = icmp ne i32 %93, 0
  br i1 %tobool185, label %if.then186, label %if.end188

if.then186:                                       ; preds = %if.then184
  %94 = load i32* %lrc, align 4
  %call187 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %94)
  br label %if.end188

if.end188:                                        ; preds = %if.then186, %if.then184
  br label %if.end189

if.end189:                                        ; preds = %if.end188, %if.end182
  %95 = load i32* %r, align 4
  %cmp190 = icmp ne i32 %95, 1
  br i1 %cmp190, label %if.then191, label %if.end196

if.then191:                                       ; preds = %if.end189
  store i32 9, i32* %lrc, align 4
  %96 = load i32* %prlc, align 4
  %tobool192 = icmp ne i32 %96, 0
  br i1 %tobool192, label %if.then193, label %if.end195

if.then193:                                       ; preds = %if.then191
  %97 = load i32* %lrc, align 4
  %call194 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %97)
  br label %if.end195

if.end195:                                        ; preds = %if.then193, %if.then191
  br label %if.end196

if.end196:                                        ; preds = %if.end195, %if.end189
  %98 = load i32* %i, align 4
  %tobool197 = icmp ne i32 %98, 0
  br i1 %tobool197, label %lor.end201, label %lor.rhs198

lor.rhs198:                                       ; preds = %if.end196
  %99 = load i32* %j, align 4
  %dec199 = add nsw i32 %99, -1
  store i32 %dec199, i32* %j, align 4
  %tobool200 = icmp ne i32 %99, 0
  br label %lor.end201

lor.end201:                                       ; preds = %lor.rhs198, %if.end196
  %100 = phi i1 [ true, %if.end196 ], [ %tobool200, %lor.rhs198 ]
  %lor.ext202 = zext i1 %100 to i32
  store i32 %lor.ext202, i32* %r, align 4
  %101 = load i32* %i, align 4
  %cmp203 = icmp ne i32 %101, 0
  br i1 %cmp203, label %if.then204, label %if.end209

if.then204:                                       ; preds = %lor.end201
  store i32 10, i32* %lrc, align 4
  %102 = load i32* %prlc, align 4
  %tobool205 = icmp ne i32 %102, 0
  br i1 %tobool205, label %if.then206, label %if.end208

if.then206:                                       ; preds = %if.then204
  %103 = load i32* %lrc, align 4
  %call207 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %103)
  br label %if.end208

if.end208:                                        ; preds = %if.then206, %if.then204
  br label %if.end209

if.end209:                                        ; preds = %if.end208, %lor.end201
  %104 = load i32* %j, align 4
  %cmp210 = icmp ne i32 %104, 0
  br i1 %cmp210, label %if.then211, label %if.end216

if.then211:                                       ; preds = %if.end209
  store i32 11, i32* %lrc, align 4
  %105 = load i32* %prlc, align 4
  %tobool212 = icmp ne i32 %105, 0
  br i1 %tobool212, label %if.then213, label %if.end215

if.then213:                                       ; preds = %if.then211
  %106 = load i32* %lrc, align 4
  %call214 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %106)
  br label %if.end215

if.end215:                                        ; preds = %if.then213, %if.then211
  br label %if.end216

if.end216:                                        ; preds = %if.end215, %if.end209
  %107 = load i32* %r, align 4
  %cmp217 = icmp ne i32 %107, 1
  br i1 %cmp217, label %if.then218, label %if.end223

if.then218:                                       ; preds = %if.end216
  store i32 12, i32* %lrc, align 4
  %108 = load i32* %prlc, align 4
  %tobool219 = icmp ne i32 %108, 0
  br i1 %tobool219, label %if.then220, label %if.end222

if.then220:                                       ; preds = %if.then218
  %109 = load i32* %lrc, align 4
  %call221 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %109)
  br label %if.end222

if.end222:                                        ; preds = %if.then220, %if.then218
  br label %if.end223

if.end223:                                        ; preds = %if.end222, %if.end216
  %110 = load i32* %lrc, align 4
  %cmp224 = icmp ne i32 %110, 0
  br i1 %cmp224, label %if.then225, label %if.end232

if.then225:                                       ; preds = %if.end223
  %111 = load %struct.defs** %pd0.addr, align 8
  %flgd226 = getelementptr inbounds %struct.defs* %111, i32 0, i32 11
  %112 = load i32* %flgd226, align 4
  %cmp227 = icmp ne i32 %112, 0
  br i1 %cmp227, label %if.then228, label %if.end230

if.then228:                                       ; preds = %if.then225
  %call229 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @sec.s7813er, i32 0, i32 0), i32 4)
  br label %if.end230

if.end230:                                        ; preds = %if.then228, %if.then225
  %113 = load i32* %rc, align 4
  %add231 = add nsw i32 %113, 4
  store i32 %add231, i32* %rc, align 4
  br label %if.end232

if.end232:                                        ; preds = %if.end230, %if.end223
  store i32 0, i32* %j, align 4
  store i32 0, i32* %i, align 4
  store i32 0, i32* %zero, align 4
  store i32 1, i32* %one, align 4
  %114 = load i32* %one, align 4
  %tobool233 = icmp ne i32 %114, 0
  br i1 %tobool233, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end232
  %115 = load i32* %zero, align 4
  br label %cond.end239

cond.false:                                       ; preds = %if.end232
  %116 = load i32* %one, align 4
  %tobool234 = icmp ne i32 %116, 0
  br i1 %tobool234, label %cond.true235, label %cond.false237

cond.true235:                                     ; preds = %cond.false
  %117 = load i32* %i, align 4
  %inc236 = add nsw i32 %117, 1
  store i32 %inc236, i32* %i, align 4
  br label %cond.end

cond.false237:                                    ; preds = %cond.false
  %118 = load i32* %j, align 4
  %inc238 = add nsw i32 %118, 1
  store i32 %inc238, i32* %j, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false237, %cond.true235
  %cond = phi i32 [ %117, %cond.true235 ], [ %118, %cond.false237 ]
  br label %cond.end239

cond.end239:                                      ; preds = %cond.end, %cond.true
  %cond240 = phi i32 [ %115, %cond.true ], [ %cond, %cond.end ]
  store i32 %cond240, i32* %r, align 4
  %119 = load i32* %r, align 4
  %cmp241 = icmp ne i32 %119, 0
  br i1 %cmp241, label %if.then245, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %cond.end239
  %120 = load i32* %i, align 4
  %cmp242 = icmp ne i32 %120, 0
  br i1 %cmp242, label %if.then245, label %lor.lhs.false243

lor.lhs.false243:                                 ; preds = %lor.lhs.false
  %121 = load i32* %j, align 4
  %cmp244 = icmp ne i32 %121, 0
  br i1 %cmp244, label %if.then245, label %if.end252

if.then245:                                       ; preds = %lor.lhs.false243, %lor.lhs.false, %cond.end239
  %122 = load %struct.defs** %pd0.addr, align 8
  %flgd246 = getelementptr inbounds %struct.defs* %122, i32 0, i32 11
  %123 = load i32* %flgd246, align 4
  %cmp247 = icmp ne i32 %123, 0
  br i1 %cmp247, label %if.then248, label %if.end250

if.then248:                                       ; preds = %if.then245
  %call249 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @sec.s7813er, i32 0, i32 0), i32 8)
  br label %if.end250

if.end250:                                        ; preds = %if.then248, %if.then245
  %124 = load i32* %rc, align 4
  %add251 = add nsw i32 %124, 8
  store i32 %add251, i32* %rc, align 4
  br label %if.end252

if.end252:                                        ; preds = %if.end250, %lor.lhs.false243
  %125 = load i32* %one, align 4
  %tobool253 = icmp ne i32 %125, 0
  br i1 %tobool253, label %cond.true254, label %cond.false255

cond.true254:                                     ; preds = %if.end252
  %126 = load i32* %zero, align 4
  br label %cond.end256

cond.false255:                                    ; preds = %if.end252
  br label %cond.end256

cond.end256:                                      ; preds = %cond.false255, %cond.true254
  %cond257 = phi i32 [ %126, %cond.true254 ], [ 1, %cond.false255 ]
  %cmp258 = icmp ne i32 %cond257, 0
  br i1 %cmp258, label %if.then266, label %lor.lhs.false259

lor.lhs.false259:                                 ; preds = %cond.end256
  %127 = load i32* %zero, align 4
  %tobool260 = icmp ne i32 %127, 0
  br i1 %tobool260, label %cond.true261, label %cond.false262

cond.true261:                                     ; preds = %lor.lhs.false259
  br label %cond.end263

cond.false262:                                    ; preds = %lor.lhs.false259
  %128 = load i32* %zero, align 4
  br label %cond.end263

cond.end263:                                      ; preds = %cond.false262, %cond.true261
  %cond264 = phi i32 [ 1, %cond.true261 ], [ %128, %cond.false262 ]
  %cmp265 = icmp ne i32 %cond264, 0
  br i1 %cmp265, label %if.then266, label %if.end273

if.then266:                                       ; preds = %cond.end263, %cond.end256
  %129 = load %struct.defs** %pd0.addr, align 8
  %flgd267 = getelementptr inbounds %struct.defs* %129, i32 0, i32 11
  %130 = load i32* %flgd267, align 4
  %cmp268 = icmp ne i32 %130, 0
  br i1 %cmp268, label %if.then269, label %if.end271

if.then269:                                       ; preds = %if.then266
  %call270 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @sec.s7813er, i32 0, i32 0), i32 16)
  br label %if.end271

if.end271:                                        ; preds = %if.then269, %if.then266
  %131 = load i32* %rc, align 4
  %add272 = add nsw i32 %131, 16
  store i32 %add272, i32* %rc, align 4
  br label %if.end273

if.end273:                                        ; preds = %if.end271, %cond.end263
  %132 = load i32* %rc, align 4
  ret i32 %132
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
