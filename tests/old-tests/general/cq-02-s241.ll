; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/cq-02-s241.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.defs = type { i32, i32, i32, i32, i32, i32, i32, float, float, i32, i32, i32, i32, i32, i32, [8 x i8] }

@setupTable.qs26 = internal global [8 x i8] c"s26    \00", align 1
@setupTable.s = internal global [18 x i8] c"%3d bits in %ss.\0A\00", align 16
@setupTable.s2 = internal global [54 x i8] c"%f is the least number that can be added to 1. (%s).\0A\00", align 16
@svtest.k = internal global i32 0, align 4
@zero.k = internal global i32 0, align 4
@extvar = common global i32 0, align 4
@sec.s241er = internal global [11 x i8] c"s241,er%d\0A\00", align 1
@sec.qs241 = internal global [8 x i8] c"s241   \00", align 1
@sec.g = internal global [39 x i64] [i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 6, i64 0, i64 8, i64 0, i64 12, i64 0, i64 16, i64 0, i64 18, i64 0, i64 20, i64 0, i64 24, i64 0, i64 28, i64 0, i64 30, i64 0, i64 32, i64 0, i64 36], align 16
@.str = private unnamed_addr constant [48 x i8] c"Decimal and octal/hex constants sometimes give\0A\00", align 1
@.str1 = private unnamed_addr constant [46 x i8] c"   different results when assigned to longs.\0A\00", align 1
@main.d0 = internal global %struct.defs zeroinitializer, align 4
@main.pd0 = internal global %struct.defs* null, align 8
@.str2 = private unnamed_addr constant [25 x i8] c"Section %s returned %d.\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"\0ANo errors detected.\0A\00", align 1
@.str4 = private unnamed_addr constant [10 x i8] c"\0AFailed.\0A\00", align 1

define i64 @pow2(i64 %n) nounwind uwtable {
entry:
  %n.addr = alloca i64, align 8
  %s = alloca i64, align 8
  store i64 %n, i64* %n.addr, align 8
  store i64 1, i64* %s, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %tmp = load i64* %n.addr, align 8
  %dec = add nsw i64 %tmp, -1
  store i64 %dec, i64* %n.addr, align 8
  %tobool = icmp ne i64 %tmp, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp1 = load i64* %s, align 8
  %mul = mul nsw i64 %tmp1, 2
  store i64 %mul, i64* %s, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %tmp2 = load i64* %s, align 8
  ret i64 %tmp2
}

define void @zerofill(i8* %x) nounwind uwtable {
entry:
  %x.addr = alloca i8*, align 8
  %j = alloca i32, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %j, align 4
  %cmp = icmp slt i32 %tmp, 256
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i8** %x.addr, align 8
  %incdec.ptr = getelementptr inbounds i8* %tmp1, i32 1
  store i8* %incdec.ptr, i8** %x.addr, align 8
  store i8 0, i8* %tmp1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %j, align 4
  %inc = add nsw i32 %tmp2, 1
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
  %tmp = load i8** %x.addr, align 8
  store i8* %tmp, i8** %p, align 8
  store i32 0, i32* %total, align 4
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp1 = load i32* %j, align 4
  %cmp = icmp slt i32 %tmp1, 256
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = load i32* %total, align 4
  %tmp3 = load i8** %p, align 8
  %incdec.ptr = getelementptr inbounds i8* %tmp3, i32 1
  store i8* %incdec.ptr, i8** %p, align 8
  %tmp4 = load i8* %tmp3
  %conv = sext i8 %tmp4 to i32
  %add = add nsw i32 %tmp2, %conv
  store i32 %add, i32* %total, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp5 = load i32* %j, align 4
  %inc = add nsw i32 %tmp5, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp6 = load i32* %total, align 4
  ret i32 %tmp6
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
  %tmp = load %struct.defs** %pd0.addr, align 8
  %rfs = getelementptr inbounds %struct.defs* %tmp, i32 0, i32 15
  %arraydecay = getelementptr inbounds [8 x i8]* %rfs, i32 0, i32 0
  store i8* %arraydecay, i8** %pt, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %tmp1 = load i8** %ps, align 8
  %incdec.ptr = getelementptr inbounds i8* %tmp1, i32 1
  store i8* %incdec.ptr, i8** %ps, align 8
  %tmp2 = load i8* %tmp1
  %tmp3 = load i8** %pt, align 8
  %incdec.ptr4 = getelementptr inbounds i8* %tmp3, i32 1
  store i8* %incdec.ptr4, i8** %pt, align 8
  store i8 %tmp2, i8* %tmp3
  %tobool = icmp ne i8 %tmp2, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %tmp5 = load %struct.defs** %pd0.addr, align 8
  %cbits = getelementptr inbounds %struct.defs* %tmp5, i32 0, i32 0
  store i32 0, i32* %cbits, align 4
  store i8 0, i8* %c0, align 1
  store i8 1, i8* %c1, align 1
  br label %while.cond6

while.cond6:                                      ; preds = %while.body11, %while.end
  %tmp7 = load i8* %c0, align 1
  %conv = zext i8 %tmp7 to i32
  %tmp8 = load i8* %c1, align 1
  %conv9 = zext i8 %tmp8 to i32
  %cmp = icmp ne i32 %conv, %conv9
  br i1 %cmp, label %while.body11, label %while.end20

while.body11:                                     ; preds = %while.cond6
  %tmp12 = load i8* %c1, align 1
  %conv13 = zext i8 %tmp12 to i32
  %shl = shl i32 %conv13, 1
  %conv14 = trunc i32 %shl to i8
  store i8 %conv14, i8* %c1, align 1
  %tmp15 = load %struct.defs** %pd0.addr, align 8
  %cbits16 = getelementptr inbounds %struct.defs* %tmp15, i32 0, i32 0
  %tmp17 = load i32* %cbits16, align 4
  %add = add nsw i32 %tmp17, 1
  %tmp18 = load %struct.defs** %pd0.addr, align 8
  %cbits19 = getelementptr inbounds %struct.defs* %tmp18, i32 0, i32 0
  store i32 %add, i32* %cbits19, align 4
  br label %while.cond6

while.end20:                                      ; preds = %while.cond6
  %tmp21 = load %struct.defs** %pd0.addr, align 8
  %cbits22 = getelementptr inbounds %struct.defs* %tmp21, i32 0, i32 0
  %tmp23 = load i32* %cbits22, align 4
  %conv24 = sext i32 %tmp23 to i64
  %mul = mul i64 %conv24, 4
  %conv25 = trunc i64 %mul to i32
  %tmp26 = load %struct.defs** %pd0.addr, align 8
  %ibits = getelementptr inbounds %struct.defs* %tmp26, i32 0, i32 1
  store i32 %conv25, i32* %ibits, align 4
  %tmp27 = load %struct.defs** %pd0.addr, align 8
  %cbits28 = getelementptr inbounds %struct.defs* %tmp27, i32 0, i32 0
  %tmp29 = load i32* %cbits28, align 4
  %conv30 = sext i32 %tmp29 to i64
  %mul31 = mul i64 %conv30, 2
  %conv32 = trunc i64 %mul31 to i32
  %tmp33 = load %struct.defs** %pd0.addr, align 8
  %sbits = getelementptr inbounds %struct.defs* %tmp33, i32 0, i32 2
  store i32 %conv32, i32* %sbits, align 4
  %tmp34 = load %struct.defs** %pd0.addr, align 8
  %cbits35 = getelementptr inbounds %struct.defs* %tmp34, i32 0, i32 0
  %tmp36 = load i32* %cbits35, align 4
  %conv37 = sext i32 %tmp36 to i64
  %mul38 = mul i64 %conv37, 8
  %conv39 = trunc i64 %mul38 to i32
  %tmp40 = load %struct.defs** %pd0.addr, align 8
  %lbits = getelementptr inbounds %struct.defs* %tmp40, i32 0, i32 3
  store i32 %conv39, i32* %lbits, align 4
  %tmp41 = load %struct.defs** %pd0.addr, align 8
  %cbits42 = getelementptr inbounds %struct.defs* %tmp41, i32 0, i32 0
  %tmp43 = load i32* %cbits42, align 4
  %conv44 = sext i32 %tmp43 to i64
  %mul45 = mul i64 %conv44, 4
  %conv46 = trunc i64 %mul45 to i32
  %tmp47 = load %struct.defs** %pd0.addr, align 8
  %ubits = getelementptr inbounds %struct.defs* %tmp47, i32 0, i32 4
  store i32 %conv46, i32* %ubits, align 4
  %tmp48 = load %struct.defs** %pd0.addr, align 8
  %cbits49 = getelementptr inbounds %struct.defs* %tmp48, i32 0, i32 0
  %tmp50 = load i32* %cbits49, align 4
  %conv51 = sext i32 %tmp50 to i64
  %mul52 = mul i64 %conv51, 4
  %conv53 = trunc i64 %mul52 to i32
  %tmp54 = load %struct.defs** %pd0.addr, align 8
  %fbits = getelementptr inbounds %struct.defs* %tmp54, i32 0, i32 5
  store i32 %conv53, i32* %fbits, align 4
  %tmp55 = load %struct.defs** %pd0.addr, align 8
  %cbits56 = getelementptr inbounds %struct.defs* %tmp55, i32 0, i32 0
  %tmp57 = load i32* %cbits56, align 4
  %conv58 = sext i32 %tmp57 to i64
  %mul59 = mul i64 %conv58, 8
  %conv60 = trunc i64 %mul59 to i32
  %tmp61 = load %struct.defs** %pd0.addr, align 8
  %dbits = getelementptr inbounds %struct.defs* %tmp61, i32 0, i32 6
  store i32 %conv60, i32* %dbits, align 4
  store float 1.000000e+00, float* %one, align 4
  store float 1.000000e+00, float* %delta, align 4
  store float 0.000000e+00, float* %temp, align 4
  br label %while.cond62

while.cond62:                                     ; preds = %while.body67, %while.end20
  %tmp63 = load float* %temp, align 4
  %tmp64 = load float* %one, align 4
  %cmp65 = fcmp une float %tmp63, %tmp64
  br i1 %cmp65, label %while.body67, label %while.end74

while.body67:                                     ; preds = %while.cond62
  %tmp68 = load float* %one, align 4
  %tmp69 = load float* %delta, align 4
  %add70 = fadd float %tmp68, %tmp69
  store float %add70, float* %temp, align 4
  %tmp71 = load float* %delta, align 4
  %conv72 = fpext float %tmp71 to double
  %div = fdiv double %conv72, 2.000000e+00
  %conv73 = fptrunc double %div to float
  store float %conv73, float* %delta, align 4
  br label %while.cond62

while.end74:                                      ; preds = %while.cond62
  %tmp75 = load float* %delta, align 4
  %conv76 = fpext float %tmp75 to double
  %mul77 = fmul double %conv76, 4.000000e+00
  %conv78 = fptrunc double %mul77 to float
  %tmp79 = load %struct.defs** %pd0.addr, align 8
  %fprec = getelementptr inbounds %struct.defs* %tmp79, i32 0, i32 7
  store float %conv78, float* %fprec, align 4
  store double 1.000000e+00, double* %oned, align 8
  store float 1.000000e+00, float* %delta, align 4
  store double 0.000000e+00, double* %tempd, align 8
  br label %while.cond80

while.cond80:                                     ; preds = %while.body85, %while.end74
  %tmp81 = load double* %tempd, align 8
  %tmp82 = load double* %oned, align 8
  %cmp83 = fcmp une double %tmp81, %tmp82
  br i1 %cmp83, label %while.body85, label %while.end94

while.body85:                                     ; preds = %while.cond80
  %tmp86 = load double* %oned, align 8
  %tmp87 = load float* %delta, align 4
  %conv88 = fpext float %tmp87 to double
  %add89 = fadd double %tmp86, %conv88
  store double %add89, double* %tempd, align 8
  %tmp90 = load float* %delta, align 4
  %conv91 = fpext float %tmp90 to double
  %div92 = fdiv double %conv91, 2.000000e+00
  %conv93 = fptrunc double %div92 to float
  store float %conv93, float* %delta, align 4
  br label %while.cond80

while.end94:                                      ; preds = %while.cond80
  %tmp95 = load float* %delta, align 4
  %conv96 = fpext float %tmp95 to double
  %mul97 = fmul double %conv96, 4.000000e+00
  %conv98 = fptrunc double %mul97 to float
  %tmp99 = load %struct.defs** %pd0.addr, align 8
  %dprec = getelementptr inbounds %struct.defs* %tmp99, i32 0, i32 8
  store float %conv98, float* %dprec, align 4
  ret i32 0
}

define i32 @svtest(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  %rc = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  switch i32 %tmp, label %sw.epilog [
    i32 0, label %sw.bb
    i32 1, label %sw.bb1
    i32 2, label %sw.bb3
  ]

sw.bb:                                            ; preds = %entry
  store i32 1978, i32* @svtest.k, align 4
  store i32 0, i32* %rc, align 4
  br label %sw.epilog

sw.bb1:                                           ; preds = %entry
  %tmp2 = load i32* @svtest.k, align 4
  %cmp = icmp ne i32 %tmp2, 1978
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

sw.bb3:                                           ; preds = %entry
  %tmp4 = load i32* @svtest.k, align 4
  %cmp5 = icmp ne i32 %tmp4, 1929
  br i1 %cmp5, label %if.then6, label %if.else7

if.then6:                                         ; preds = %sw.bb3
  store i32 1, i32* %rc, align 4
  br label %if.end8

if.else7:                                         ; preds = %sw.bb3
  store i32 0, i32* %rc, align 4
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  br label %sw.epilog

sw.epilog:                                        ; preds = %entry, %if.end8, %if.end, %sw.bb
  %tmp9 = load i32* %rc, align 4
  ret i32 %tmp9
}

define i32 @zero() nounwind uwtable {
entry:
  %rc = alloca i32, align 4
  store i32 2, i32* @zero.k, align 4
  store i32 0, i32* %rc, align 4
  %tmp = load i32* %rc, align 4
  ret i32 %tmp
}

define i32 @testev() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %tmp = load i32* @extvar, align 4
  %cmp = icmp ne i32 %tmp, 1066
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %0 = load i32* %retval
  ret i32 %0
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
  %tmp = load i32* %x.addr, align 4
  %cmp = icmp sgt i32 %tmp, 100
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %tmp1 = load i32* %x.addr, align 4
  %sub = sub nsw i32 %tmp1, 10
  store i32 %sub, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  %tmp2 = load i32* %x.addr, align 4
  %add = add nsw i32 %tmp2, 11
  %call = call i32 (...)* bitcast (i32 (i32)* @McCarthy to i32 (...)*)(i32 %add)
  %call3 = call i32 (...)* bitcast (i32 (i32)* @McCarthy to i32 (...)*)(i32 %call)
  store i32 %call3, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %0 = load i32* %retval
  ret i32 %0
}

define i32 @clobber(i32 %x, i32* %y) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32*, align 8
  store i32 %x, i32* %x.addr, align 4
  store i32* %y, i32** %y.addr, align 8
  store i32 3, i32* %x.addr, align 4
  %tmp = load i32** %y.addr, align 8
  store i32 2, i32* %tmp
  ret i32 0
}

define i32 @sec(%struct.defs* %pd0) nounwind uwtable {
entry:
  %pd0.addr = alloca %struct.defs*, align 8
  %ps = alloca i8*, align 8
  %pt = alloca i8*, align 8
  %rc = alloca i32, align 4
  %j = alloca i32, align 4
  %lrc = alloca i32, align 4
  %d = alloca [39 x i64], align 16
  %o = alloca [39 x i64], align 16
  %x = alloca [39 x i64], align 16
  store %struct.defs* %pd0, %struct.defs** %pd0.addr, align 8
  store i32 0, i32* %rc, align 4
  store i32 0, i32* %lrc, align 4
  store i8* getelementptr inbounds ([8 x i8]* @sec.qs241, i32 0, i32 0), i8** %ps, align 8
  %tmp = load %struct.defs** %pd0.addr, align 8
  %rfs = getelementptr inbounds %struct.defs* %tmp, i32 0, i32 15
  %arraydecay = getelementptr inbounds [8 x i8]* %rfs, i32 0, i32 0
  store i8* %arraydecay, i8** %pt, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %tmp1 = load i8** %ps, align 8
  %incdec.ptr = getelementptr inbounds i8* %tmp1, i32 1
  store i8* %incdec.ptr, i8** %ps, align 8
  %tmp2 = load i8* %tmp1
  %tmp3 = load i8** %pt, align 8
  %incdec.ptr4 = getelementptr inbounds i8* %tmp3, i32 1
  store i8* %incdec.ptr4, i8** %pt, align 8
  store i8 %tmp2, i8* %tmp3
  %tobool = icmp ne i8 %tmp2, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  br label %while.cond

while.end:                                        ; preds = %while.cond
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %while.end
  %tmp5 = load i32* %j, align 4
  %cmp = icmp slt i32 %tmp5, 17
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp6 = load i32* %j, align 4
  %conv = sext i32 %tmp6 to i64
  %tmp7 = load i32* %j, align 4
  %idxprom = sext i32 %tmp7 to i64
  %arrayidx = getelementptr inbounds [39 x i64]* @sec.g, i32 0, i64 %idxprom
  store i64 %conv, i64* %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp8 = load i32* %j, align 4
  %inc = add nsw i32 %tmp8, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 18, i32* %j, align 4
  br label %for.cond9

for.cond9:                                        ; preds = %for.body13, %for.end
  %tmp10 = load i32* %j, align 4
  %cmp11 = icmp slt i32 %tmp10, 35
  br i1 %cmp11, label %for.body13, label %for.end30

for.body13:                                       ; preds = %for.cond9
  %tmp14 = load i32* %j, align 4
  %idxprom15 = sext i32 %tmp14 to i64
  %arrayidx16 = getelementptr inbounds [39 x i64]* @sec.g, i32 0, i64 %idxprom15
  %tmp17 = load i64* %arrayidx16, align 8
  %call = call i64 @pow2(i64 %tmp17)
  %tmp18 = load i32* %j, align 4
  %idxprom19 = sext i32 %tmp18 to i64
  %arrayidx20 = getelementptr inbounds [39 x i64]* @sec.g, i32 0, i64 %idxprom19
  store i64 %call, i64* %arrayidx20, align 8
  %tmp21 = load i32* %j, align 4
  %idxprom22 = sext i32 %tmp21 to i64
  %arrayidx23 = getelementptr inbounds [39 x i64]* @sec.g, i32 0, i64 %idxprom22
  %tmp24 = load i64* %arrayidx23, align 8
  %sub = sub nsw i64 %tmp24, 1
  %tmp25 = load i32* %j, align 4
  %sub26 = sub nsw i32 %tmp25, 1
  %idxprom27 = sext i32 %sub26 to i64
  %arrayidx28 = getelementptr inbounds [39 x i64]* @sec.g, i32 0, i64 %idxprom27
  store i64 %sub, i64* %arrayidx28, align 8
  %tmp29 = load i32* %j, align 4
  %add = add nsw i32 %tmp29, 2
  store i32 %add, i32* %j, align 4
  br label %for.cond9

for.end30:                                        ; preds = %for.cond9
  %arrayidx31 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 0
  store i64 0, i64* %arrayidx31, align 8
  %arrayidx32 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 0
  store i64 0, i64* %arrayidx32, align 8
  %arrayidx33 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 0
  store i64 0, i64* %arrayidx33, align 8
  %arrayidx34 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 1
  store i64 1, i64* %arrayidx34, align 8
  %arrayidx35 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 1
  store i64 1, i64* %arrayidx35, align 8
  %arrayidx36 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 1
  store i64 1, i64* %arrayidx36, align 8
  %arrayidx37 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 2
  store i64 2, i64* %arrayidx37, align 8
  %arrayidx38 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 2
  store i64 2, i64* %arrayidx38, align 8
  %arrayidx39 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 2
  store i64 2, i64* %arrayidx39, align 8
  %arrayidx40 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 3
  store i64 3, i64* %arrayidx40, align 8
  %arrayidx41 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 3
  store i64 3, i64* %arrayidx41, align 8
  %arrayidx42 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 3
  store i64 3, i64* %arrayidx42, align 8
  %arrayidx43 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 4
  store i64 4, i64* %arrayidx43, align 8
  %arrayidx44 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 4
  store i64 4, i64* %arrayidx44, align 8
  %arrayidx45 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 4
  store i64 4, i64* %arrayidx45, align 8
  %arrayidx46 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 5
  store i64 5, i64* %arrayidx46, align 8
  %arrayidx47 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 5
  store i64 5, i64* %arrayidx47, align 8
  %arrayidx48 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 5
  store i64 5, i64* %arrayidx48, align 8
  %arrayidx49 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 6
  store i64 6, i64* %arrayidx49, align 8
  %arrayidx50 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 6
  store i64 6, i64* %arrayidx50, align 8
  %arrayidx51 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 6
  store i64 6, i64* %arrayidx51, align 8
  %arrayidx52 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 7
  store i64 7, i64* %arrayidx52, align 8
  %arrayidx53 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 7
  store i64 7, i64* %arrayidx53, align 8
  %arrayidx54 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 7
  store i64 7, i64* %arrayidx54, align 8
  %arrayidx55 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 8
  store i64 8, i64* %arrayidx55, align 8
  %arrayidx56 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 8
  store i64 8, i64* %arrayidx56, align 8
  %arrayidx57 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 8
  store i64 8, i64* %arrayidx57, align 8
  %arrayidx58 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 9
  store i64 9, i64* %arrayidx58, align 8
  %arrayidx59 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 9
  store i64 9, i64* %arrayidx59, align 8
  %arrayidx60 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 9
  store i64 9, i64* %arrayidx60, align 8
  %arrayidx61 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 10
  store i64 10, i64* %arrayidx61, align 8
  %arrayidx62 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 10
  store i64 10, i64* %arrayidx62, align 8
  %arrayidx63 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 10
  store i64 10, i64* %arrayidx63, align 8
  %arrayidx64 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 11
  store i64 11, i64* %arrayidx64, align 8
  %arrayidx65 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 11
  store i64 11, i64* %arrayidx65, align 8
  %arrayidx66 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 11
  store i64 11, i64* %arrayidx66, align 8
  %arrayidx67 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 12
  store i64 12, i64* %arrayidx67, align 8
  %arrayidx68 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 12
  store i64 12, i64* %arrayidx68, align 8
  %arrayidx69 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 12
  store i64 12, i64* %arrayidx69, align 8
  %arrayidx70 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 13
  store i64 13, i64* %arrayidx70, align 8
  %arrayidx71 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 13
  store i64 13, i64* %arrayidx71, align 8
  %arrayidx72 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 13
  store i64 13, i64* %arrayidx72, align 8
  %arrayidx73 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 14
  store i64 14, i64* %arrayidx73, align 8
  %arrayidx74 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 14
  store i64 14, i64* %arrayidx74, align 8
  %arrayidx75 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 14
  store i64 14, i64* %arrayidx75, align 8
  %arrayidx76 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 15
  store i64 15, i64* %arrayidx76, align 8
  %arrayidx77 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 15
  store i64 15, i64* %arrayidx77, align 8
  %arrayidx78 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 15
  store i64 15, i64* %arrayidx78, align 8
  %arrayidx79 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 16
  store i64 16, i64* %arrayidx79, align 8
  %arrayidx80 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 16
  store i64 16, i64* %arrayidx80, align 8
  %arrayidx81 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 16
  store i64 16, i64* %arrayidx81, align 8
  %arrayidx82 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 17
  store i64 63, i64* %arrayidx82, align 8
  %arrayidx83 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 17
  store i64 63, i64* %arrayidx83, align 8
  %arrayidx84 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 17
  store i64 63, i64* %arrayidx84, align 8
  %arrayidx85 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 18
  store i64 64, i64* %arrayidx85, align 8
  %arrayidx86 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 18
  store i64 64, i64* %arrayidx86, align 8
  %arrayidx87 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 18
  store i64 64, i64* %arrayidx87, align 8
  %arrayidx88 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 19
  store i64 255, i64* %arrayidx88, align 8
  %arrayidx89 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 19
  store i64 255, i64* %arrayidx89, align 8
  %arrayidx90 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 19
  store i64 255, i64* %arrayidx90, align 8
  %arrayidx91 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 20
  store i64 256, i64* %arrayidx91, align 8
  %arrayidx92 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 20
  store i64 256, i64* %arrayidx92, align 8
  %arrayidx93 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 20
  store i64 256, i64* %arrayidx93, align 8
  %arrayidx94 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 21
  store i64 4095, i64* %arrayidx94, align 8
  %arrayidx95 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 21
  store i64 4095, i64* %arrayidx95, align 8
  %arrayidx96 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 21
  store i64 4095, i64* %arrayidx96, align 8
  %arrayidx97 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 22
  store i64 4096, i64* %arrayidx97, align 8
  %arrayidx98 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 22
  store i64 4096, i64* %arrayidx98, align 8
  %arrayidx99 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 22
  store i64 4096, i64* %arrayidx99, align 8
  %arrayidx100 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 23
  store i64 65535, i64* %arrayidx100, align 8
  %arrayidx101 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 23
  store i64 65535, i64* %arrayidx101, align 8
  %arrayidx102 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 23
  store i64 65535, i64* %arrayidx102, align 8
  %arrayidx103 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 24
  store i64 65536, i64* %arrayidx103, align 8
  %arrayidx104 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 24
  store i64 65536, i64* %arrayidx104, align 8
  %arrayidx105 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 24
  store i64 65536, i64* %arrayidx105, align 8
  %arrayidx106 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 25
  store i64 262143, i64* %arrayidx106, align 8
  %arrayidx107 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 25
  store i64 262143, i64* %arrayidx107, align 8
  %arrayidx108 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 25
  store i64 262143, i64* %arrayidx108, align 8
  %arrayidx109 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 26
  store i64 262144, i64* %arrayidx109, align 8
  %arrayidx110 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 26
  store i64 262144, i64* %arrayidx110, align 8
  %arrayidx111 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 26
  store i64 262144, i64* %arrayidx111, align 8
  %arrayidx112 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 27
  store i64 1048575, i64* %arrayidx112, align 8
  %arrayidx113 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 27
  store i64 1048575, i64* %arrayidx113, align 8
  %arrayidx114 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 27
  store i64 1048575, i64* %arrayidx114, align 8
  %arrayidx115 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 28
  store i64 1048576, i64* %arrayidx115, align 8
  %arrayidx116 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 28
  store i64 1048576, i64* %arrayidx116, align 8
  %arrayidx117 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 28
  store i64 1048576, i64* %arrayidx117, align 8
  %arrayidx118 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 29
  store i64 16777215, i64* %arrayidx118, align 8
  %arrayidx119 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 29
  store i64 16777215, i64* %arrayidx119, align 8
  %arrayidx120 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 29
  store i64 16777215, i64* %arrayidx120, align 8
  %arrayidx121 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 30
  store i64 16777216, i64* %arrayidx121, align 8
  %arrayidx122 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 30
  store i64 16777216, i64* %arrayidx122, align 8
  %arrayidx123 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 30
  store i64 16777216, i64* %arrayidx123, align 8
  %arrayidx124 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 31
  store i64 268435455, i64* %arrayidx124, align 8
  %arrayidx125 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 31
  store i64 268435455, i64* %arrayidx125, align 8
  %arrayidx126 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 31
  store i64 268435455, i64* %arrayidx126, align 8
  %arrayidx127 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 32
  store i64 268435456, i64* %arrayidx127, align 8
  %arrayidx128 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 32
  store i64 268435456, i64* %arrayidx128, align 8
  %arrayidx129 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 32
  store i64 268435456, i64* %arrayidx129, align 8
  %arrayidx130 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 33
  store i64 1073741823, i64* %arrayidx130, align 8
  %arrayidx131 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 33
  store i64 1073741823, i64* %arrayidx131, align 8
  %arrayidx132 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 33
  store i64 1073741823, i64* %arrayidx132, align 8
  %arrayidx133 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 34
  store i64 1073741824, i64* %arrayidx133, align 8
  %arrayidx134 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 34
  store i64 1073741824, i64* %arrayidx134, align 8
  %arrayidx135 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 34
  store i64 1073741824, i64* %arrayidx135, align 8
  store i32 0, i32* %j, align 4
  br label %for.cond136

for.cond136:                                      ; preds = %for.inc180, %for.end30
  %tmp137 = load i32* %j, align 4
  %cmp138 = icmp slt i32 %tmp137, 35
  br i1 %cmp138, label %for.body140, label %for.end183

for.body140:                                      ; preds = %for.cond136
  %tmp141 = load i32* %j, align 4
  %idxprom142 = sext i32 %tmp141 to i64
  %arrayidx143 = getelementptr inbounds [39 x i64]* @sec.g, i32 0, i64 %idxprom142
  %tmp144 = load i64* %arrayidx143, align 8
  %tmp145 = load i32* %j, align 4
  %idxprom146 = sext i32 %tmp145 to i64
  %arrayidx147 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 %idxprom146
  %tmp148 = load i64* %arrayidx147, align 8
  %cmp149 = icmp ne i64 %tmp144, %tmp148
  br i1 %cmp149, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body140
  %tmp151 = load i32* %j, align 4
  %idxprom152 = sext i32 %tmp151 to i64
  %arrayidx153 = getelementptr inbounds [39 x i64]* %d, i32 0, i64 %idxprom152
  %tmp154 = load i64* %arrayidx153, align 8
  %tmp155 = load i32* %j, align 4
  %idxprom156 = sext i32 %tmp155 to i64
  %arrayidx157 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 %idxprom156
  %tmp158 = load i64* %arrayidx157, align 8
  %cmp159 = icmp ne i64 %tmp154, %tmp158
  br i1 %cmp159, label %if.then, label %lor.lhs.false161

lor.lhs.false161:                                 ; preds = %lor.lhs.false
  %tmp162 = load i32* %j, align 4
  %idxprom163 = sext i32 %tmp162 to i64
  %arrayidx164 = getelementptr inbounds [39 x i64]* %o, i32 0, i64 %idxprom163
  %tmp165 = load i64* %arrayidx164, align 8
  %tmp166 = load i32* %j, align 4
  %idxprom167 = sext i32 %tmp166 to i64
  %arrayidx168 = getelementptr inbounds [39 x i64]* %x, i32 0, i64 %idxprom167
  %tmp169 = load i64* %arrayidx168, align 8
  %cmp170 = icmp ne i64 %tmp165, %tmp169
  br i1 %cmp170, label %if.then, label %if.end179

if.then:                                          ; preds = %lor.lhs.false161, %lor.lhs.false, %for.body140
  %tmp172 = load %struct.defs** %pd0.addr, align 8
  %flgm = getelementptr inbounds %struct.defs* %tmp172, i32 0, i32 10
  %tmp173 = load i32* %flgm, align 4
  %cmp174 = icmp ne i32 %tmp173, 0
  br i1 %cmp174, label %if.then176, label %if.end

if.then176:                                       ; preds = %if.then
  %call177 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([48 x i8]* @.str, i32 0, i32 0))
  %call178 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([46 x i8]* @.str1, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then176, %if.then
  br label %if.end179

if.end179:                                        ; preds = %if.end, %lor.lhs.false161
  br label %for.inc180

for.inc180:                                       ; preds = %if.end179
  %tmp181 = load i32* %j, align 4
  %inc182 = add nsw i32 %tmp181, 1
  store i32 %inc182, i32* %j, align 4
  br label %for.cond136

for.end183:                                       ; preds = %for.cond136
  %tmp184 = load i32* %lrc, align 4
  %cmp185 = icmp ne i32 %tmp184, 0
  br i1 %cmp185, label %if.then187, label %if.end188

if.then187:                                       ; preds = %for.end183
  store i32 16, i32* %rc, align 4
  br label %if.end188

if.end188:                                        ; preds = %if.then187, %for.end183
  %tmp189 = load i32* %rc, align 4
  ret i32 %tmp189
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
  %tmp = load %struct.defs** @main.pd0, align 8
  %call = call i32 @sec(%struct.defs* %tmp)
  store i32 %call, i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 13), align 4
  %tmp1 = load i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 14), align 4
  %tmp2 = load i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 13), align 4
  %add = add nsw i32 %tmp1, %tmp2
  store i32 %add, i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 14), align 4
  %tmp3 = load i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 9), align 4
  %cmp = icmp ne i32 %tmp3, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %tmp4 = load i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 13), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 15, i32 0), i32 %tmp4)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %tmp6 = load i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 14), align 4
  %cmp7 = icmp eq i32 %tmp6, 0
  br i1 %cmp7, label %if.then8, label %if.else

if.then8:                                         ; preds = %if.end
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0))
  br label %if.end11

if.else:                                          ; preds = %if.end
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str4, i32 0, i32 0))
  br label %if.end11

if.end11:                                         ; preds = %if.else, %if.then8
  ret i32 0
}
