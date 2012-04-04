; ModuleID = '/home/david/src/c-semantics/tests/unitTests/cq-05-s25.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.defs = type { i32, i32, i32, i32, i32, i32, i32, float, float, i32, i32, i32, i32, i32, i32, [8 x i8] }

@setupTable.qs26 = internal global [8 x i8] c"s26    \00", align 1
@setupTable.s = internal global [18 x i8] c"%3d bits in %ss.\0A\00", align 16
@setupTable.s2 = internal global [54 x i8] c"%f is the least number that can be added to 1. (%s).\0A\00", align 16
@svtest.k = internal global i32 0, align 4
@zero.k = internal global i32 0, align 4
@extvar = common global i32 0, align 4
@sec.s25er = internal global [10 x i8] c"s25,er%d\0A\00", align 1
@sec.qs25 = internal global [8 x i8] c"s25    \00", align 1
@.str = private unnamed_addr constant [4 x i8] c"...\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c".\22.\00", align 1
@.str2 = private unnamed_addr constant [8 x i8] c"\0A\09\08\0D\0C\5C'\00", align 1
@.str3 = private unnamed_addr constant [7 x i8] c"queep!\00", align 1
@main.d0 = internal global %struct.defs zeroinitializer, align 4
@main.pd0 = internal global %struct.defs* null, align 8
@.str4 = private unnamed_addr constant [25 x i8] c"Section %s returned %d.\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"\0ANo errors detected.\0A\00", align 1
@.str6 = private unnamed_addr constant [10 x i8] c"\0AFailed.\0A\00", align 1

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
  %s = alloca i8*, align 8
  %s2 = alloca i8*, align 8
  %rc = alloca i32, align 4
  %lrc = alloca i32, align 4
  %j = alloca i32, align 4
  %ps = alloca i8*, align 8
  %pt = alloca i8*, align 8
  store %struct.defs* %pd0, %struct.defs** %pd0.addr, align 8
  store i8* getelementptr inbounds ([8 x i8]* @sec.qs25, i32 0, i32 0), i8** %ps, align 8
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
  store i32 0, i32* %rc, align 4
  store i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i8** %s, align 8
  %4 = load i8** %s, align 8
  %arrayidx = getelementptr inbounds i8* %4, i64 0
  %5 = load i8* %arrayidx, align 1
  %conv = sext i8 %5 to i32
  %6 = load i8** %s, align 8
  %arrayidx2 = getelementptr inbounds i8* %6, i64 1
  %7 = load i8* %arrayidx2, align 1
  %conv3 = sext i8 %7 to i32
  %cmp = icmp ne i32 %conv, %conv3
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.end
  %8 = load i8** %s, align 8
  %arrayidx5 = getelementptr inbounds i8* %8, i64 1
  %9 = load i8* %arrayidx5, align 1
  %conv6 = sext i8 %9 to i32
  %10 = load i8** %s, align 8
  %arrayidx7 = getelementptr inbounds i8* %10, i64 2
  %11 = load i8* %arrayidx7, align 1
  %conv8 = sext i8 %11 to i32
  %cmp9 = icmp ne i32 %conv6, %conv8
  br i1 %cmp9, label %if.then, label %lor.lhs.false11

lor.lhs.false11:                                  ; preds = %lor.lhs.false
  %12 = load i8** %s, align 8
  %arrayidx12 = getelementptr inbounds i8* %12, i64 2
  %13 = load i8* %arrayidx12, align 1
  %conv13 = sext i8 %13 to i32
  %cmp14 = icmp ne i32 %conv13, 46
  br i1 %cmp14, label %if.then, label %if.end19

if.then:                                          ; preds = %lor.lhs.false11, %lor.lhs.false, %while.end
  %14 = load i32* %rc, align 4
  %add = add nsw i32 %14, 1
  store i32 %add, i32* %rc, align 4
  %15 = load %struct.defs** %pd0.addr, align 8
  %flgd = getelementptr inbounds %struct.defs* %15, i32 0, i32 11
  %16 = load i32* %flgd, align 4
  %cmp16 = icmp ne i32 %16, 0
  br i1 %cmp16, label %if.then18, label %if.end

if.then18:                                        ; preds = %if.then
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s25er, i32 0, i32 0), i32 1)
  br label %if.end

if.end:                                           ; preds = %if.then18, %if.then
  br label %if.end19

if.end19:                                         ; preds = %if.end, %lor.lhs.false11
  %17 = load i8** %s, align 8
  %arrayidx20 = getelementptr inbounds i8* %17, i64 3
  %18 = load i8* %arrayidx20, align 1
  %conv21 = sext i8 %18 to i32
  %cmp22 = icmp ne i32 %conv21, 0
  br i1 %cmp22, label %if.then24, label %if.end32

if.then24:                                        ; preds = %if.end19
  %19 = load i32* %rc, align 4
  %add25 = add nsw i32 %19, 4
  store i32 %add25, i32* %rc, align 4
  %20 = load %struct.defs** %pd0.addr, align 8
  %flgd26 = getelementptr inbounds %struct.defs* %20, i32 0, i32 11
  %21 = load i32* %flgd26, align 4
  %cmp27 = icmp ne i32 %21, 0
  br i1 %cmp27, label %if.then29, label %if.end31

if.then29:                                        ; preds = %if.then24
  %call30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s25er, i32 0, i32 0), i32 4)
  br label %if.end31

if.end31:                                         ; preds = %if.then29, %if.then24
  br label %if.end32

if.end32:                                         ; preds = %if.end31, %if.end19
  %22 = load i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i64 1), align 1
  %conv33 = sext i8 %22 to i32
  %cmp34 = icmp ne i32 %conv33, 34
  br i1 %cmp34, label %if.then36, label %if.end44

if.then36:                                        ; preds = %if.end32
  %23 = load i32* %rc, align 4
  %add37 = add nsw i32 %23, 8
  store i32 %add37, i32* %rc, align 4
  %24 = load %struct.defs** %pd0.addr, align 8
  %flgd38 = getelementptr inbounds %struct.defs* %24, i32 0, i32 11
  %25 = load i32* %flgd38, align 4
  %cmp39 = icmp ne i32 %25, 0
  br i1 %cmp39, label %if.then41, label %if.end43

if.then41:                                        ; preds = %if.then36
  %call42 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s25er, i32 0, i32 0), i32 8)
  br label %if.end43

if.end43:                                         ; preds = %if.then41, %if.then36
  br label %if.end44

if.end44:                                         ; preds = %if.end43, %if.end32
  store i8* getelementptr inbounds ([8 x i8]* @.str2, i32 0, i32 0), i8** %s, align 8
  %26 = load i8** %s, align 8
  %arrayidx45 = getelementptr inbounds i8* %26, i64 0
  %27 = load i8* %arrayidx45, align 1
  %conv46 = sext i8 %27 to i32
  %cmp47 = icmp ne i32 %conv46, 10
  br i1 %cmp47, label %if.then79, label %lor.lhs.false49

lor.lhs.false49:                                  ; preds = %if.end44
  %28 = load i8** %s, align 8
  %arrayidx50 = getelementptr inbounds i8* %28, i64 1
  %29 = load i8* %arrayidx50, align 1
  %conv51 = sext i8 %29 to i32
  %cmp52 = icmp ne i32 %conv51, 9
  br i1 %cmp52, label %if.then79, label %lor.lhs.false54

lor.lhs.false54:                                  ; preds = %lor.lhs.false49
  %30 = load i8** %s, align 8
  %arrayidx55 = getelementptr inbounds i8* %30, i64 2
  %31 = load i8* %arrayidx55, align 1
  %conv56 = sext i8 %31 to i32
  %cmp57 = icmp ne i32 %conv56, 8
  br i1 %cmp57, label %if.then79, label %lor.lhs.false59

lor.lhs.false59:                                  ; preds = %lor.lhs.false54
  %32 = load i8** %s, align 8
  %arrayidx60 = getelementptr inbounds i8* %32, i64 3
  %33 = load i8* %arrayidx60, align 1
  %conv61 = sext i8 %33 to i32
  %cmp62 = icmp ne i32 %conv61, 13
  br i1 %cmp62, label %if.then79, label %lor.lhs.false64

lor.lhs.false64:                                  ; preds = %lor.lhs.false59
  %34 = load i8** %s, align 8
  %arrayidx65 = getelementptr inbounds i8* %34, i64 4
  %35 = load i8* %arrayidx65, align 1
  %conv66 = sext i8 %35 to i32
  %cmp67 = icmp ne i32 %conv66, 12
  br i1 %cmp67, label %if.then79, label %lor.lhs.false69

lor.lhs.false69:                                  ; preds = %lor.lhs.false64
  %36 = load i8** %s, align 8
  %arrayidx70 = getelementptr inbounds i8* %36, i64 5
  %37 = load i8* %arrayidx70, align 1
  %conv71 = sext i8 %37 to i32
  %cmp72 = icmp ne i32 %conv71, 92
  br i1 %cmp72, label %if.then79, label %lor.lhs.false74

lor.lhs.false74:                                  ; preds = %lor.lhs.false69
  %38 = load i8** %s, align 8
  %arrayidx75 = getelementptr inbounds i8* %38, i64 6
  %39 = load i8* %arrayidx75, align 1
  %conv76 = sext i8 %39 to i32
  %cmp77 = icmp ne i32 %conv76, 39
  br i1 %cmp77, label %if.then79, label %if.end87

if.then79:                                        ; preds = %lor.lhs.false74, %lor.lhs.false69, %lor.lhs.false64, %lor.lhs.false59, %lor.lhs.false54, %lor.lhs.false49, %if.end44
  %40 = load i32* %rc, align 4
  %add80 = add nsw i32 %40, 16
  store i32 %add80, i32* %rc, align 4
  %41 = load %struct.defs** %pd0.addr, align 8
  %flgd81 = getelementptr inbounds %struct.defs* %41, i32 0, i32 11
  %42 = load i32* %flgd81, align 4
  %cmp82 = icmp ne i32 %42, 0
  br i1 %cmp82, label %if.then84, label %if.end86

if.then84:                                        ; preds = %if.then79
  %call85 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s25er, i32 0, i32 0), i32 16)
  br label %if.end86

if.end86:                                         ; preds = %if.then84, %if.then79
  br label %if.end87

if.end87:                                         ; preds = %if.end86, %lor.lhs.false74
  store i8* getelementptr inbounds ([7 x i8]* @.str3, i32 0, i32 0), i8** %s2, align 8
  store i8* getelementptr inbounds ([7 x i8]* @.str3, i32 0, i32 0), i8** %s, align 8
  store i32 0, i32* %lrc, align 4
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end87
  %43 = load i32* %j, align 4
  %conv88 = sext i32 %43 to i64
  %cmp89 = icmp ult i64 %conv88, 7
  br i1 %cmp89, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %44 = load i32* %j, align 4
  %idxprom = sext i32 %44 to i64
  %45 = load i8** %s, align 8
  %arrayidx91 = getelementptr inbounds i8* %45, i64 %idxprom
  %46 = load i8* %arrayidx91, align 1
  %conv92 = sext i8 %46 to i32
  %47 = load i32* %j, align 4
  %idxprom93 = sext i32 %47 to i64
  %48 = load i8** %s2, align 8
  %arrayidx94 = getelementptr inbounds i8* %48, i64 %idxprom93
  %49 = load i8* %arrayidx94, align 1
  %conv95 = sext i8 %49 to i32
  %cmp96 = icmp ne i32 %conv92, %conv95
  br i1 %cmp96, label %if.then98, label %if.end99

if.then98:                                        ; preds = %for.body
  store i32 1, i32* %lrc, align 4
  br label %if.end99

if.end99:                                         ; preds = %if.then98, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end99
  %50 = load i32* %j, align 4
  %inc = add nsw i32 %50, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %51 = load i32* %lrc, align 4
  %cmp100 = icmp ne i32 %51, 0
  br i1 %cmp100, label %if.then102, label %if.end110

if.then102:                                       ; preds = %for.end
  %52 = load i32* %rc, align 4
  %add103 = add nsw i32 %52, 32
  store i32 %add103, i32* %rc, align 4
  %53 = load %struct.defs** %pd0.addr, align 8
  %flgd104 = getelementptr inbounds %struct.defs* %53, i32 0, i32 11
  %54 = load i32* %flgd104, align 4
  %cmp105 = icmp ne i32 %54, 0
  br i1 %cmp105, label %if.then107, label %if.end109

if.then107:                                       ; preds = %if.then102
  %call108 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s25er, i32 0, i32 0), i32 32)
  br label %if.end109

if.end109:                                        ; preds = %if.then107, %if.then102
  br label %if.end110

if.end110:                                        ; preds = %if.end109, %for.end
  %55 = load i32* %rc, align 4
  ret i32 %55
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
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 15, i32 0), i32 %4)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %5 = load i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 14), align 4
  %cmp2 = icmp eq i32 %5, 0
  br i1 %cmp2, label %if.then3, label %if.else

if.then3:                                         ; preds = %if.end
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0))
  br label %if.end6

if.else:                                          ; preds = %if.end
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str6, i32 0, i32 0))
  br label %if.end6

if.end6:                                          ; preds = %if.else, %if.then3
  ret i32 0
}
