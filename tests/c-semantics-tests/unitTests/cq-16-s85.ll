; ModuleID = '/home/david/src/c-semantics/tests/unitTests/cq-16-s85.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.defs = type { i32, i32, i32, i32, i32, i32, i32, float, float, i32, i32, i32, i32, i32, i32, [8 x i8] }
%struct.tnode = type { [20 x i8], i32, %struct.tnode*, %struct.tnode* }
%struct.anon = type { i8, i8 }
%struct.anon.0 = type { i8, i16 }
%struct.anon.1 = type { i8, i32 }
%struct.anon.2 = type { i8, i64 }
%struct.anon.3 = type { i8, i32 }
%struct.anon.4 = type { i8, float }
%struct.anon.5 = type { i8, double }
%struct.anon.6 = type <{ i8, [3 x i8] }>
%union.anon = type { [30 x i64] }

@setupTable.qs26 = internal global [8 x i8] c"s26    \00", align 1
@setupTable.s = internal global [18 x i8] c"%3d bits in %ss.\0A\00", align 16
@setupTable.s2 = internal global [54 x i8] c"%f is the least number that can be added to 1. (%s).\0A\00", align 16
@svtest.k = internal global i32 0, align 4
@zero.k = internal global i32 0, align 4
@extvar = common global i32 0, align 4
@sec.s85er = internal global [10 x i8] c"s85,er%d\0A\00", align 1
@sec.qs85 = internal global [8 x i8] c"s85    \00", align 1
@sec.type = internal global [7 x i8*] [i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str6, i32 0, i32 0)], align 16
@.str = private unnamed_addr constant [5 x i8] c"char\00", align 1
@.str1 = private unnamed_addr constant [6 x i8] c"short\00", align 1
@.str2 = private unnamed_addr constant [4 x i8] c"int\00", align 1
@.str3 = private unnamed_addr constant [5 x i8] c"long\00", align 1
@.str4 = private unnamed_addr constant [9 x i8] c"unsigned\00", align 1
@.str5 = private unnamed_addr constant [6 x i8] c"float\00", align 1
@.str6 = private unnamed_addr constant [7 x i8] c"double\00", align 1
@sec.aln = internal global [13 x i8] c" alignment: \00", align 1
@.str7 = private unnamed_addr constant [18 x i8] c"VOLATILE: %s%s%d\0A\00", align 1
@.str8 = private unnamed_addr constant [36 x i8] c"VOLATILE: Sign extension in fields\0A\00", align 1
@.str9 = private unnamed_addr constant [52 x i8] c"VOLATILE: Be especially careful with 1-bit fields!\0A\00", align 1
@main.d0 = internal global %struct.defs zeroinitializer, align 4
@main.pd0 = internal global %struct.defs* null, align 8
@.str10 = private unnamed_addr constant [25 x i8] c"Section %s returned %d.\0A\00", align 1
@.str11 = private unnamed_addr constant [22 x i8] c"\0ANo errors detected.\0A\00", align 1
@.str12 = private unnamed_addr constant [10 x i8] c"\0AFailed.\0A\00", align 1

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
  %s1 = alloca %struct.tnode, align 8
  %s2 = alloca %struct.tnode, align 8
  %sp = alloca %struct.tnode*, align 8
  %sc = alloca %struct.anon, align 1
  %ss = alloca %struct.anon.0, align 2
  %si = alloca %struct.anon.1, align 4
  %sl = alloca %struct.anon.2, align 8
  %su = alloca %struct.anon.3, align 4
  %sf = alloca %struct.anon.4, align 4
  %sd = alloca %struct.anon.5, align 8
  %diff = alloca [7 x i32], align 16
  %j = alloca i32, align 4
  %s3 = alloca %struct.anon.6, align 4
  %u0 = alloca %union.anon, align 8
  store %struct.defs* %pd0, %struct.defs** %pd0.addr, align 8
  store i8* getelementptr inbounds ([8 x i8]* @sec.qs85, i32 0, i32 0), i8** %ps, align 8
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
  %c = getelementptr inbounds %struct.anon* %sc, i32 0, i32 1
  %cdummy = getelementptr inbounds %struct.anon* %sc, i32 0, i32 0
  %sub.ptr.lhs.cast = ptrtoint i8* %c to i64
  %sub.ptr.rhs.cast = ptrtoint i8* %cdummy to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %conv = trunc i64 %sub.ptr.sub to i32
  %arrayidx = getelementptr inbounds [7 x i32]* %diff, i32 0, i64 0
  store i32 %conv, i32* %arrayidx, align 4
  %s = getelementptr inbounds %struct.anon.0* %ss, i32 0, i32 1
  %4 = bitcast i16* %s to i8*
  %cdummy2 = getelementptr inbounds %struct.anon.0* %ss, i32 0, i32 0
  %sub.ptr.lhs.cast3 = ptrtoint i8* %4 to i64
  %sub.ptr.rhs.cast4 = ptrtoint i8* %cdummy2 to i64
  %sub.ptr.sub5 = sub i64 %sub.ptr.lhs.cast3, %sub.ptr.rhs.cast4
  %conv6 = trunc i64 %sub.ptr.sub5 to i32
  %arrayidx7 = getelementptr inbounds [7 x i32]* %diff, i32 0, i64 1
  store i32 %conv6, i32* %arrayidx7, align 4
  %i = getelementptr inbounds %struct.anon.1* %si, i32 0, i32 1
  %5 = bitcast i32* %i to i8*
  %cdummy8 = getelementptr inbounds %struct.anon.1* %si, i32 0, i32 0
  %sub.ptr.lhs.cast9 = ptrtoint i8* %5 to i64
  %sub.ptr.rhs.cast10 = ptrtoint i8* %cdummy8 to i64
  %sub.ptr.sub11 = sub i64 %sub.ptr.lhs.cast9, %sub.ptr.rhs.cast10
  %conv12 = trunc i64 %sub.ptr.sub11 to i32
  %arrayidx13 = getelementptr inbounds [7 x i32]* %diff, i32 0, i64 2
  store i32 %conv12, i32* %arrayidx13, align 4
  %l = getelementptr inbounds %struct.anon.2* %sl, i32 0, i32 1
  %6 = bitcast i64* %l to i8*
  %cdummy14 = getelementptr inbounds %struct.anon.2* %sl, i32 0, i32 0
  %sub.ptr.lhs.cast15 = ptrtoint i8* %6 to i64
  %sub.ptr.rhs.cast16 = ptrtoint i8* %cdummy14 to i64
  %sub.ptr.sub17 = sub i64 %sub.ptr.lhs.cast15, %sub.ptr.rhs.cast16
  %conv18 = trunc i64 %sub.ptr.sub17 to i32
  %arrayidx19 = getelementptr inbounds [7 x i32]* %diff, i32 0, i64 3
  store i32 %conv18, i32* %arrayidx19, align 4
  %u = getelementptr inbounds %struct.anon.3* %su, i32 0, i32 1
  %7 = bitcast i32* %u to i8*
  %cdummy20 = getelementptr inbounds %struct.anon.3* %su, i32 0, i32 0
  %sub.ptr.lhs.cast21 = ptrtoint i8* %7 to i64
  %sub.ptr.rhs.cast22 = ptrtoint i8* %cdummy20 to i64
  %sub.ptr.sub23 = sub i64 %sub.ptr.lhs.cast21, %sub.ptr.rhs.cast22
  %conv24 = trunc i64 %sub.ptr.sub23 to i32
  %arrayidx25 = getelementptr inbounds [7 x i32]* %diff, i32 0, i64 4
  store i32 %conv24, i32* %arrayidx25, align 4
  %f = getelementptr inbounds %struct.anon.4* %sf, i32 0, i32 1
  %8 = bitcast float* %f to i8*
  %cdummy26 = getelementptr inbounds %struct.anon.4* %sf, i32 0, i32 0
  %sub.ptr.lhs.cast27 = ptrtoint i8* %8 to i64
  %sub.ptr.rhs.cast28 = ptrtoint i8* %cdummy26 to i64
  %sub.ptr.sub29 = sub i64 %sub.ptr.lhs.cast27, %sub.ptr.rhs.cast28
  %conv30 = trunc i64 %sub.ptr.sub29 to i32
  %arrayidx31 = getelementptr inbounds [7 x i32]* %diff, i32 0, i64 5
  store i32 %conv30, i32* %arrayidx31, align 4
  %d = getelementptr inbounds %struct.anon.5* %sd, i32 0, i32 1
  %9 = bitcast double* %d to i8*
  %cdummy32 = getelementptr inbounds %struct.anon.5* %sd, i32 0, i32 0
  %sub.ptr.lhs.cast33 = ptrtoint i8* %9 to i64
  %sub.ptr.rhs.cast34 = ptrtoint i8* %cdummy32 to i64
  %sub.ptr.sub35 = sub i64 %sub.ptr.lhs.cast33, %sub.ptr.rhs.cast34
  %conv36 = trunc i64 %sub.ptr.sub35 to i32
  %arrayidx37 = getelementptr inbounds [7 x i32]* %diff, i32 0, i64 6
  store i32 %conv36, i32* %arrayidx37, align 4
  %10 = load %struct.defs** %pd0.addr, align 8
  %flgm = getelementptr inbounds %struct.defs* %10, i32 0, i32 10
  %11 = load i32* %flgm, align 4
  %cmp = icmp ne i32 %11, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %while.end
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %12 = load i32* %j, align 4
  %cmp39 = icmp slt i32 %12, 7
  br i1 %cmp39, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %13 = load i32* %j, align 4
  %idxprom = sext i32 %13 to i64
  %arrayidx41 = getelementptr inbounds [7 x i8*]* @sec.type, i32 0, i64 %idxprom
  %14 = load i8** %arrayidx41, align 8
  %15 = load i32* %j, align 4
  %idxprom42 = sext i32 %15 to i64
  %arrayidx43 = getelementptr inbounds [7 x i32]* %diff, i32 0, i64 %idxprom42
  %16 = load i32* %arrayidx43, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str7, i32 0, i32 0), i8* %14, i8* getelementptr inbounds ([13 x i8]* @sec.aln, i32 0, i32 0), i32 %16)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %17 = load i32* %j, align 4
  %inc = add nsw i32 %17, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end

if.end:                                           ; preds = %for.end, %while.end
  %18 = bitcast %struct.anon.6* %s3 to i32*
  %19 = load i32* %18, align 4
  %20 = and i32 %19, -57
  %21 = or i32 %20, 56
  store i32 %21, i32* %18, align 4
  %22 = bitcast %struct.anon.6* %s3 to i32*
  %23 = load i32* %22, align 4
  %24 = lshr i32 %23, 3
  %bf.clear = and i32 %24, 7
  %25 = shl i32 %bf.clear, 29
  %bf.val.sext = ashr i32 %25, 29
  %bf.value = and i32 %bf.val.sext, 3
  %26 = shl i32 %bf.value, 30
  %bf.reload.sext = ashr i32 %26, 30
  %27 = bitcast %struct.anon.6* %s3 to i32*
  %28 = and i32 %bf.value, 3
  %29 = load i32* %27, align 4
  %30 = and i32 %29, -4
  %31 = or i32 %30, %28
  store i32 %31, i32* %27, align 4
  %32 = bitcast %struct.anon.6* %s3 to i32*
  %33 = load i32* %32, align 4
  %bf.clear44 = and i32 %33, 3
  %34 = shl i32 %bf.clear44, 30
  %bf.val.sext45 = ashr i32 %34, 30
  %bf.value46 = and i32 %bf.val.sext45, 7
  %35 = shl i32 %bf.value46, 29
  %bf.reload.sext47 = ashr i32 %35, 29
  %36 = bitcast %struct.anon.6* %s3 to i32*
  %37 = and i32 %bf.value46, 7
  %38 = shl i32 %37, 3
  %39 = load i32* %36, align 4
  %40 = and i32 %39, -57
  %41 = or i32 %40, %38
  store i32 %41, i32* %36, align 4
  %42 = bitcast %struct.anon.6* %s3 to i32*
  %43 = load i32* %42, align 4
  %44 = lshr i32 %43, 3
  %bf.clear48 = and i32 %44, 7
  %45 = shl i32 %bf.clear48, 29
  %bf.val.sext49 = ashr i32 %45, 29
  %cmp50 = icmp ne i32 %bf.val.sext49, 3
  br i1 %cmp50, label %if.then52, label %if.end70

if.then52:                                        ; preds = %if.end
  %46 = bitcast %struct.anon.6* %s3 to i32*
  %47 = load i32* %46, align 4
  %48 = lshr i32 %47, 3
  %bf.clear53 = and i32 %48, 7
  %49 = shl i32 %bf.clear53, 29
  %bf.val.sext54 = ashr i32 %49, 29
  %cmp55 = icmp eq i32 %bf.val.sext54, -1
  br i1 %cmp55, label %if.then57, label %if.else

if.then57:                                        ; preds = %if.then52
  %50 = load %struct.defs** %pd0.addr, align 8
  %flgm58 = getelementptr inbounds %struct.defs* %50, i32 0, i32 10
  %51 = load i32* %flgm58, align 4
  %cmp59 = icmp ne i32 %51, 0
  br i1 %cmp59, label %if.then61, label %if.end63

if.then61:                                        ; preds = %if.then57
  %call62 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str8, i32 0, i32 0))
  br label %if.end63

if.end63:                                         ; preds = %if.then61, %if.then57
  br label %if.end69

if.else:                                          ; preds = %if.then52
  %52 = load %struct.defs** %pd0.addr, align 8
  %flgd = getelementptr inbounds %struct.defs* %52, i32 0, i32 11
  %53 = load i32* %flgd, align 4
  %cmp64 = icmp ne i32 %53, 0
  br i1 %cmp64, label %if.then66, label %if.end68

if.then66:                                        ; preds = %if.else
  %call67 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s85er, i32 0, i32 0), i32 2)
  br label %if.end68

if.end68:                                         ; preds = %if.then66, %if.else
  %54 = load i32* %rc, align 4
  %add = add nsw i32 %54, 2
  store i32 %add, i32* %rc, align 4
  br label %if.end69

if.end69:                                         ; preds = %if.end68, %if.end63
  br label %if.end70

if.end70:                                         ; preds = %if.end69, %if.end
  %55 = bitcast %struct.anon.6* %s3 to i32*
  %56 = load i32* %55, align 4
  %57 = and i32 %56, -65
  %58 = or i32 %57, 64
  store i32 %58, i32* %55, align 4
  %59 = bitcast %struct.anon.6* %s3 to i32*
  %60 = load i32* %59, align 4
  %61 = lshr i32 %60, 6
  %bf.clear71 = and i32 %61, 1
  %62 = shl i32 %bf.clear71, 31
  %bf.val.sext72 = ashr i32 %62, 31
  %cmp73 = icmp ne i32 %bf.val.sext72, 1
  br i1 %cmp73, label %if.then75, label %if.end82

if.then75:                                        ; preds = %if.end70
  %63 = load %struct.defs** %pd0.addr, align 8
  %flgm76 = getelementptr inbounds %struct.defs* %63, i32 0, i32 10
  %64 = load i32* %flgm76, align 4
  %cmp77 = icmp ne i32 %64, 0
  br i1 %cmp77, label %if.then79, label %if.end81

if.then79:                                        ; preds = %if.then75
  %call80 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([52 x i8]* @.str9, i32 0, i32 0))
  br label %if.end81

if.end81:                                         ; preds = %if.then79, %if.then75
  br label %if.end82

if.end82:                                         ; preds = %if.end81, %if.end70
  %right = getelementptr inbounds %struct.tnode* %s1, i32 0, i32 3
  store %struct.tnode* %s2, %struct.tnode** %right, align 8
  %tword = getelementptr inbounds %struct.tnode* %s2, i32 0, i32 0
  %arrayidx83 = getelementptr inbounds [20 x i8]* %tword, i32 0, i64 0
  store i8 2, i8* %arrayidx83, align 1
  %right84 = getelementptr inbounds %struct.tnode* %s1, i32 0, i32 3
  %65 = load %struct.tnode** %right84, align 8
  %tword85 = getelementptr inbounds %struct.tnode* %65, i32 0, i32 0
  %arrayidx86 = getelementptr inbounds [20 x i8]* %tword85, i32 0, i64 0
  %66 = load i8* %arrayidx86, align 1
  %conv87 = sext i8 %66 to i32
  %add88 = add nsw i32 %conv87, 1
  %conv89 = trunc i32 %add88 to i8
  store i8 %conv89, i8* %arrayidx86, align 1
  %tword90 = getelementptr inbounds %struct.tnode* %s2, i32 0, i32 0
  %arrayidx91 = getelementptr inbounds [20 x i8]* %tword90, i32 0, i64 0
  %67 = load i8* %arrayidx91, align 1
  %conv92 = sext i8 %67 to i32
  %cmp93 = icmp ne i32 %conv92, 3
  br i1 %cmp93, label %if.then95, label %if.end103

if.then95:                                        ; preds = %if.end82
  %68 = load %struct.defs** %pd0.addr, align 8
  %flgd96 = getelementptr inbounds %struct.defs* %68, i32 0, i32 11
  %69 = load i32* %flgd96, align 4
  %cmp97 = icmp ne i32 %69, 0
  br i1 %cmp97, label %if.then99, label %if.end101

if.then99:                                        ; preds = %if.then95
  %call100 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s85er, i32 0, i32 0), i32 16)
  br label %if.end101

if.end101:                                        ; preds = %if.then99, %if.then95
  %70 = load i32* %rc, align 4
  %add102 = add nsw i32 %70, 16
  store i32 %add102, i32* %rc, align 4
  br label %if.end103

if.end103:                                        ; preds = %if.end101, %if.end82
  %71 = load i32* %rc, align 4
  ret i32 %71
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
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str10, i32 0, i32 0), i8* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 15, i32 0), i32 %4)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %5 = load i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 14), align 4
  %cmp2 = icmp eq i32 %5, 0
  br i1 %cmp2, label %if.then3, label %if.else

if.then3:                                         ; preds = %if.end
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str11, i32 0, i32 0))
  br label %if.end6

if.else:                                          ; preds = %if.end
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str12, i32 0, i32 0))
  br label %if.end6

if.end6:                                          ; preds = %if.else, %if.then3
  ret i32 0
}
