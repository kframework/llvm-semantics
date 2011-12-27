; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/cq-10-s71.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.defs = type { i32, i32, i32, i32, i32, i32, i32, float, float, i32, i32, i32, i32, i32, i32, [8 x i8] }

@setupTable.qs26 = internal global [8 x i8] c"s26    \00", align 1
@setupTable.s = internal global [18 x i8] c"%3d bits in %ss.\0A\00", align 16
@setupTable.s2 = internal global [54 x i8] c"%f is the least number that can be added to 1. (%s).\0A\00", align 16
@svtest.k = internal global i32 0, align 4
@zero.k = internal global i32 0, align 4
@extvar = common global i32 0, align 4
@sec.s71er = internal global [10 x i8] c"s71,er%d\0A\00", align 1
@sec.qs71 = internal global [8 x i8] c"s71    \00", align 1
@sec.q = internal global i8 113, align 1
@.str = private unnamed_addr constant [6 x i8] c"queep\00", align 1
@main.d0 = internal global %struct.defs zeroinitializer, align 4
@main.pd0 = internal global %struct.defs* null, align 8
@.str1 = private unnamed_addr constant [25 x i8] c"Section %s returned %d.\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"\0ANo errors detected.\0A\00", align 1
@.str3 = private unnamed_addr constant [10 x i8] c"\0AFailed.\0A\00", align 1

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
  %rc = alloca i32, align 4
  %ps = alloca i8*, align 8
  %pt = alloca i8*, align 8
  %x = alloca [10 x i32], align 16
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %p = alloca i32*, align 8
  store %struct.defs* %pd0, %struct.defs** %pd0.addr, align 8
  %tmp = load %struct.defs** %pd0.addr, align 8
  %call = call i32 (...)* bitcast (i32 (%struct.defs*)* @setupTable to i32 (...)*)(%struct.defs* %tmp)
  store i8* getelementptr inbounds ([8 x i8]* @sec.qs71, i32 0, i32 0), i8** %ps, align 8
  %tmp8 = load %struct.defs** %pd0.addr, align 8
  %rfs = getelementptr inbounds %struct.defs* %tmp8, i32 0, i32 15
  %arraydecay = getelementptr inbounds [8 x i8]* %rfs, i32 0, i32 0
  store i8* %arraydecay, i8** %pt, align 8
  store i32 0, i32* %rc, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %tmp9 = load i8** %ps, align 8
  %incdec.ptr = getelementptr inbounds i8* %tmp9, i32 1
  store i8* %incdec.ptr, i8** %ps, align 8
  %tmp10 = load i8* %tmp9
  %tmp11 = load i8** %pt, align 8
  %incdec.ptr12 = getelementptr inbounds i8* %tmp11, i32 1
  store i8* %incdec.ptr12, i8** %pt, align 8
  store i8 %tmp10, i8* %tmp11
  %tobool = icmp ne i8 %tmp10, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %tmp13 = load i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0)
  %conv = sext i8 %tmp13 to i32
  %tmp14 = load i8* @sec.q, align 1
  %conv15 = sext i8 %tmp14 to i32
  %cmp = icmp ne i32 %conv, %conv15
  br i1 %cmp, label %if.then, label %if.end24

if.then:                                          ; preds = %while.end
  %tmp17 = load i32* %rc, align 4
  %add = add nsw i32 %tmp17, 1
  store i32 %add, i32* %rc, align 4
  %tmp18 = load %struct.defs** %pd0.addr, align 8
  %flgd = getelementptr inbounds %struct.defs* %tmp18, i32 0, i32 11
  %tmp19 = load i32* %flgd, align 4
  %cmp20 = icmp ne i32 %tmp19, 0
  br i1 %cmp20, label %if.then22, label %if.end

if.then22:                                        ; preds = %if.then
  %call23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s71er, i32 0, i32 0), i32 1)
  br label %if.end

if.end:                                           ; preds = %if.then22, %if.then
  br label %if.end24

if.end24:                                         ; preds = %if.end, %while.end
  %arrayidx = getelementptr inbounds [10 x i32]* %x, i32 0, i64 5
  store i32 1942, i32* %arrayidx, align 4
  %arrayidx25 = getelementptr inbounds [10 x i32]* %x, i32 0, i64 5
  %tmp26 = load i32* %arrayidx25, align 4
  %cmp27 = icmp ne i32 %tmp26, 1942
  br i1 %cmp27, label %if.then35, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end24
  %arrayidx29 = getelementptr inbounds [10 x i32]* %x, i32 0, i64 5
  %tmp30 = load i32* %arrayidx29, align 4
  %arraydecay31 = getelementptr inbounds [10 x i32]* %x, i32 0, i32 0
  %add.ptr = getelementptr inbounds i32* %arraydecay31, i64 5
  %tmp32 = load i32* %add.ptr
  %cmp33 = icmp ne i32 %tmp30, %tmp32
  br i1 %cmp33, label %if.then35, label %if.end46

if.then35:                                        ; preds = %lor.lhs.false, %if.end24
  %tmp36 = load i32* %rc, align 4
  %add37 = add nsw i32 %tmp36, 4
  store i32 %add37, i32* %rc, align 4
  %tmp38 = load %struct.defs** %pd0.addr, align 8
  %flgd39 = getelementptr inbounds %struct.defs* %tmp38, i32 0, i32 11
  %tmp40 = load i32* %flgd39, align 4
  %cmp41 = icmp ne i32 %tmp40, 0
  br i1 %cmp41, label %if.then43, label %if.end45

if.then43:                                        ; preds = %if.then35
  %call44 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s71er, i32 0, i32 0), i32 4)
  br label %if.end45

if.end45:                                         ; preds = %if.then43, %if.then35
  br label %if.end46

if.end46:                                         ; preds = %if.end45, %lor.lhs.false
  %call47 = call i32 @McCarthy(i32 -5)
  %cmp48 = icmp ne i32 %call47, 91
  br i1 %cmp48, label %if.then50, label %if.end61

if.then50:                                        ; preds = %if.end46
  %tmp51 = load i32* %rc, align 4
  %add52 = add nsw i32 %tmp51, 8
  store i32 %add52, i32* %rc, align 4
  %tmp53 = load %struct.defs** %pd0.addr, align 8
  %flgd54 = getelementptr inbounds %struct.defs* %tmp53, i32 0, i32 11
  %tmp55 = load i32* %flgd54, align 4
  %cmp56 = icmp ne i32 %tmp55, 0
  br i1 %cmp56, label %if.then58, label %if.end60

if.then58:                                        ; preds = %if.then50
  %call59 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s71er, i32 0, i32 0), i32 8)
  br label %if.end60

if.end60:                                         ; preds = %if.then58, %if.then50
  br label %if.end61

if.end61:                                         ; preds = %if.end60, %if.end46
  store i32 2, i32* %a, align 4
  store i32 3, i32* %b, align 4
  store i32* %b, i32** %p, align 8
  %tmp62 = load i32* %a, align 4
  %tmp63 = load i32** %p, align 8
  %call64 = call i32 @clobber(i32 %tmp62, i32* %tmp63)
  %tmp65 = load i32* %a, align 4
  %cmp66 = icmp ne i32 %tmp65, 2
  br i1 %cmp66, label %if.then72, label %lor.lhs.false68

lor.lhs.false68:                                  ; preds = %if.end61
  %tmp69 = load i32* %b, align 4
  %cmp70 = icmp ne i32 %tmp69, 2
  br i1 %cmp70, label %if.then72, label %if.end83

if.then72:                                        ; preds = %lor.lhs.false68, %if.end61
  %tmp73 = load i32* %rc, align 4
  %add74 = add nsw i32 %tmp73, 16
  store i32 %add74, i32* %rc, align 4
  %tmp75 = load %struct.defs** %pd0.addr, align 8
  %flgd76 = getelementptr inbounds %struct.defs* %tmp75, i32 0, i32 11
  %tmp77 = load i32* %flgd76, align 4
  %cmp78 = icmp ne i32 %tmp77, 0
  br i1 %cmp78, label %if.then80, label %if.end82

if.then80:                                        ; preds = %if.then72
  %call81 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s71er, i32 0, i32 0), i32 16)
  br label %if.end82

if.end82:                                         ; preds = %if.then80, %if.then72
  br label %if.end83

if.end83:                                         ; preds = %if.end82, %lor.lhs.false68
  %tmp84 = load %struct.defs** %pd0.addr, align 8
  %dprec = getelementptr inbounds %struct.defs* %tmp84, i32 0, i32 8
  %tmp85 = load float* %dprec, align 4
  %tmp86 = load %struct.defs** %pd0.addr, align 8
  %dprec87 = getelementptr inbounds %struct.defs* %tmp86, i32 0, i32 8
  %tmp88 = load float* %dprec87, align 4
  %cmp89 = fcmp une float %tmp85, %tmp88
  br i1 %cmp89, label %if.then91, label %if.end102

if.then91:                                        ; preds = %if.end83
  %tmp92 = load i32* %rc, align 4
  %add93 = add nsw i32 %tmp92, 32
  store i32 %add93, i32* %rc, align 4
  %tmp94 = load %struct.defs** %pd0.addr, align 8
  %flgd95 = getelementptr inbounds %struct.defs* %tmp94, i32 0, i32 11
  %tmp96 = load i32* %flgd95, align 4
  %cmp97 = icmp ne i32 %tmp96, 0
  br i1 %cmp97, label %if.then99, label %if.end101

if.then99:                                        ; preds = %if.then91
  %call100 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s71er, i32 0, i32 0), i32 32)
  br label %if.end101

if.end101:                                        ; preds = %if.then99, %if.then91
  br label %if.end102

if.end102:                                        ; preds = %if.end101, %if.end83
  %tmp103 = load i32* %rc, align 4
  ret i32 %tmp103
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
  %call = call i32 (...)* bitcast (i32 (%struct.defs*)* @sec to i32 (...)*)(%struct.defs* %tmp)
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
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 15, i32 0), i32 %tmp4)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %tmp6 = load i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 14), align 4
  %cmp7 = icmp eq i32 %tmp6, 0
  br i1 %cmp7, label %if.then8, label %if.else

if.then8:                                         ; preds = %if.end
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0))
  br label %if.end11

if.else:                                          ; preds = %if.end
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str3, i32 0, i32 0))
  br label %if.end11

if.end11:                                         ; preds = %if.else, %if.then8
  ret i32 0
}
