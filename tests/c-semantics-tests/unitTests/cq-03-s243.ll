; ModuleID = '/home/david/src/c-semantics/tests/unitTests/cq-03-s243.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.defs = type { i32, i32, i32, i32, i32, i32, i32, float, float, i32, i32, i32, i32, i32, i32, [8 x i8] }

@setupTable.qs26 = internal global [8 x i8] c"s26    \00", align 1
@setupTable.s = internal global [18 x i8] c"%3d bits in %ss.\0A\00", align 16
@setupTable.s2 = internal global [54 x i8] c"%f is the least number that can be added to 1. (%s).\0A\00", align 16
@svtest.k = internal global i32 0, align 4
@zero.k = internal global i32 0, align 4
@extvar = common global i32 0, align 4
@sec.s243er = internal global [11 x i8] c"s243,er%d\0A\00", align 1
@sec.qs243 = internal global [8 x i8] c"s243   \00", align 1
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
  %ps = alloca i8*, align 8
  %pt = alloca i8*, align 8
  %rc = alloca i32, align 4
  %chars = alloca [256 x i8], align 16
  store %struct.defs* %pd0, %struct.defs** %pd0.addr, align 8
  store i32 0, i32* %rc, align 4
  store i8* getelementptr inbounds ([8 x i8]* @sec.qs243, i32 0, i32 0), i8** %ps, align 8
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
  %arraydecay2 = getelementptr inbounds [256 x i8]* %chars, i32 0, i32 0
  call void @zerofill(i8* %arraydecay2)
  %arrayidx = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 97
  store i8 1, i8* %arrayidx, align 1
  %arrayidx3 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 65
  store i8 1, i8* %arrayidx3, align 1
  %arrayidx4 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 126
  store i8 1, i8* %arrayidx4, align 1
  %arrayidx5 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 48
  store i8 1, i8* %arrayidx5, align 1
  %arrayidx6 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 98
  store i8 1, i8* %arrayidx6, align 1
  %arrayidx7 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 66
  store i8 1, i8* %arrayidx7, align 1
  %arrayidx8 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 33
  store i8 1, i8* %arrayidx8, align 1
  %arrayidx9 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 49
  store i8 1, i8* %arrayidx9, align 1
  %arrayidx10 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 99
  store i8 1, i8* %arrayidx10, align 1
  %arrayidx11 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 67
  store i8 1, i8* %arrayidx11, align 1
  %arrayidx12 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 34
  store i8 1, i8* %arrayidx12, align 1
  %arrayidx13 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 50
  store i8 1, i8* %arrayidx13, align 1
  %arrayidx14 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 100
  store i8 1, i8* %arrayidx14, align 1
  %arrayidx15 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 68
  store i8 1, i8* %arrayidx15, align 1
  %arrayidx16 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 35
  store i8 1, i8* %arrayidx16, align 1
  %arrayidx17 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 51
  store i8 1, i8* %arrayidx17, align 1
  %arrayidx18 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 101
  store i8 1, i8* %arrayidx18, align 1
  %arrayidx19 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 69
  store i8 1, i8* %arrayidx19, align 1
  %arrayidx20 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 37
  store i8 1, i8* %arrayidx20, align 1
  %arrayidx21 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 52
  store i8 1, i8* %arrayidx21, align 1
  %arrayidx22 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 102
  store i8 1, i8* %arrayidx22, align 1
  %arrayidx23 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 70
  store i8 1, i8* %arrayidx23, align 1
  %arrayidx24 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 38
  store i8 1, i8* %arrayidx24, align 1
  %arrayidx25 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 53
  store i8 1, i8* %arrayidx25, align 1
  %arrayidx26 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 103
  store i8 1, i8* %arrayidx26, align 1
  %arrayidx27 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 71
  store i8 1, i8* %arrayidx27, align 1
  %arrayidx28 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 40
  store i8 1, i8* %arrayidx28, align 1
  %arrayidx29 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 54
  store i8 1, i8* %arrayidx29, align 1
  %arrayidx30 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 104
  store i8 1, i8* %arrayidx30, align 1
  %arrayidx31 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 72
  store i8 1, i8* %arrayidx31, align 1
  %arrayidx32 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 41
  store i8 1, i8* %arrayidx32, align 1
  %arrayidx33 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 55
  store i8 1, i8* %arrayidx33, align 1
  %arrayidx34 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 105
  store i8 1, i8* %arrayidx34, align 1
  %arrayidx35 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 73
  store i8 1, i8* %arrayidx35, align 1
  %arrayidx36 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 95
  store i8 1, i8* %arrayidx36, align 1
  %arrayidx37 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 56
  store i8 1, i8* %arrayidx37, align 1
  %arrayidx38 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 106
  store i8 1, i8* %arrayidx38, align 1
  %arrayidx39 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 74
  store i8 1, i8* %arrayidx39, align 1
  %arrayidx40 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 61
  store i8 1, i8* %arrayidx40, align 1
  %arrayidx41 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 57
  store i8 1, i8* %arrayidx41, align 1
  %arrayidx42 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 107
  store i8 1, i8* %arrayidx42, align 1
  %arrayidx43 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 75
  store i8 1, i8* %arrayidx43, align 1
  %arrayidx44 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 45
  store i8 1, i8* %arrayidx44, align 1
  %arrayidx45 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 108
  store i8 1, i8* %arrayidx45, align 1
  %arrayidx46 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 76
  store i8 1, i8* %arrayidx46, align 1
  %arrayidx47 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 94
  store i8 1, i8* %arrayidx47, align 1
  %arrayidx48 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 109
  store i8 1, i8* %arrayidx48, align 1
  %arrayidx49 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 77
  store i8 1, i8* %arrayidx49, align 1
  %arrayidx50 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 124
  store i8 1, i8* %arrayidx50, align 1
  %arrayidx51 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 10
  store i8 1, i8* %arrayidx51, align 1
  %arrayidx52 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 110
  store i8 1, i8* %arrayidx52, align 1
  %arrayidx53 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 78
  store i8 1, i8* %arrayidx53, align 1
  %arrayidx54 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 9
  store i8 1, i8* %arrayidx54, align 1
  %arrayidx55 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 111
  store i8 1, i8* %arrayidx55, align 1
  %arrayidx56 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 79
  store i8 1, i8* %arrayidx56, align 1
  %arrayidx57 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 123
  store i8 1, i8* %arrayidx57, align 1
  %arrayidx58 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 8
  store i8 1, i8* %arrayidx58, align 1
  %arrayidx59 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 112
  store i8 1, i8* %arrayidx59, align 1
  %arrayidx60 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 80
  store i8 1, i8* %arrayidx60, align 1
  %arrayidx61 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 125
  store i8 1, i8* %arrayidx61, align 1
  %arrayidx62 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 13
  store i8 1, i8* %arrayidx62, align 1
  %arrayidx63 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 113
  store i8 1, i8* %arrayidx63, align 1
  %arrayidx64 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 81
  store i8 1, i8* %arrayidx64, align 1
  %arrayidx65 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 91
  store i8 1, i8* %arrayidx65, align 1
  %arrayidx66 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 12
  store i8 1, i8* %arrayidx66, align 1
  %arrayidx67 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 114
  store i8 1, i8* %arrayidx67, align 1
  %arrayidx68 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 82
  store i8 1, i8* %arrayidx68, align 1
  %arrayidx69 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 93
  store i8 1, i8* %arrayidx69, align 1
  %arrayidx70 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 115
  store i8 1, i8* %arrayidx70, align 1
  %arrayidx71 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 83
  store i8 1, i8* %arrayidx71, align 1
  %arrayidx72 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 43
  store i8 1, i8* %arrayidx72, align 1
  %arrayidx73 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 92
  store i8 1, i8* %arrayidx73, align 1
  %arrayidx74 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 116
  store i8 1, i8* %arrayidx74, align 1
  %arrayidx75 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 84
  store i8 1, i8* %arrayidx75, align 1
  %arrayidx76 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 59
  store i8 1, i8* %arrayidx76, align 1
  %arrayidx77 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 39
  store i8 1, i8* %arrayidx77, align 1
  %arrayidx78 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 117
  store i8 1, i8* %arrayidx78, align 1
  %arrayidx79 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 85
  store i8 1, i8* %arrayidx79, align 1
  %arrayidx80 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 42
  store i8 1, i8* %arrayidx80, align 1
  %arrayidx81 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 118
  store i8 1, i8* %arrayidx81, align 1
  %arrayidx82 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 86
  store i8 1, i8* %arrayidx82, align 1
  %arrayidx83 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 58
  store i8 1, i8* %arrayidx83, align 1
  %arrayidx84 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 0
  store i8 1, i8* %arrayidx84, align 1
  %arrayidx85 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 119
  store i8 1, i8* %arrayidx85, align 1
  %arrayidx86 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 87
  store i8 1, i8* %arrayidx86, align 1
  %arrayidx87 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 60
  store i8 1, i8* %arrayidx87, align 1
  %arrayidx88 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 32
  store i8 1, i8* %arrayidx88, align 1
  %arrayidx89 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 120
  store i8 1, i8* %arrayidx89, align 1
  %arrayidx90 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 88
  store i8 1, i8* %arrayidx90, align 1
  %arrayidx91 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 62
  store i8 1, i8* %arrayidx91, align 1
  %arrayidx92 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 121
  store i8 1, i8* %arrayidx92, align 1
  %arrayidx93 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 89
  store i8 1, i8* %arrayidx93, align 1
  %arrayidx94 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 44
  store i8 1, i8* %arrayidx94, align 1
  %arrayidx95 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 122
  store i8 1, i8* %arrayidx95, align 1
  %arrayidx96 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 90
  store i8 1, i8* %arrayidx96, align 1
  %arrayidx97 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 46
  store i8 1, i8* %arrayidx97, align 1
  %arrayidx98 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 63
  store i8 1, i8* %arrayidx98, align 1
  %arrayidx99 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 47
  store i8 1, i8* %arrayidx99, align 1
  %arraydecay100 = getelementptr inbounds [256 x i8]* %chars, i32 0, i32 0
  %call = call i32 @sumof(i8* %arraydecay100)
  %cmp = icmp ne i32 %call, 98
  br i1 %cmp, label %if.then, label %if.end104

if.then:                                          ; preds = %while.end
  %4 = load i32* %rc, align 4
  %add = add nsw i32 %4, 1
  store i32 %add, i32* %rc, align 4
  %5 = load %struct.defs** %pd0.addr, align 8
  %flgd = getelementptr inbounds %struct.defs* %5, i32 0, i32 11
  %6 = load i32* %flgd, align 4
  %cmp101 = icmp ne i32 %6, 0
  br i1 %cmp101, label %if.then102, label %if.end

if.then102:                                       ; preds = %if.then
  %call103 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @sec.s243er, i32 0, i32 0), i32 1)
  br label %if.end

if.end:                                           ; preds = %if.then102, %if.then
  br label %if.end104

if.end104:                                        ; preds = %if.end, %while.end
  %7 = load i32* %rc, align 4
  ret i32 %7
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
