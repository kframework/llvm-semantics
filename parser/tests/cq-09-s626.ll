; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/cq-09-s626.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.defs = type { i32, i32, i32, i32, i32, i32, i32, float, float, i32, i32, i32, i32, i32, i32, [8 x i8] }

@setupTable.qs26 = internal global [8 x i8] c"s26    \00", align 1
@setupTable.s = internal global [18 x i8] c"%3d bits in %ss.\0A\00", align 16
@setupTable.s2 = internal global [54 x i8] c"%f is the least number that can be added to 1. (%s).\0A\00", align 16
@svtest.k = internal global i32 0, align 4
@zero.k = internal global i32 0, align 4
@extvar = common global i32 0, align 4
@sec.s626er = internal global [11 x i8] c"s626,er%d\0A\00", align 1
@sec.qs626 = internal global [8 x i8] c"s626   \00", align 1
@.str = private unnamed_addr constant [8 x i8] c"   key=\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@main.d0 = internal global %struct.defs zeroinitializer, align 4
@main.pd0 = internal global %struct.defs* null, align 8
@.str3 = private unnamed_addr constant [25 x i8] c"Section %s returned %d.\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"\0ANo errors detected.\0A\00", align 1
@.str5 = private unnamed_addr constant [10 x i8] c"\0AFailed.\0A\00", align 1

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
  %eps = alloca float, align 4
  %f1 = alloca float, align 4
  %f2 = alloca float, align 4
  %f3 = alloca float, align 4
  %f4 = alloca float, align 4
  %f = alloca float, align 4
  %lint1 = alloca i64, align 8
  %lint2 = alloca i64, align 8
  %l = alloca i64, align 8
  %ls = alloca i64, align 8
  %c = alloca i8, align 1
  %t = alloca [28 x i8], align 16
  %t0 = alloca i8, align 1
  %s = alloca i16, align 2
  %is = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %u = alloca i32, align 4
  %us = alloca i32, align 4
  %d = alloca double, align 8
  %ds = alloca double, align 8
  store %struct.defs* %pd0, %struct.defs** %pd0.addr, align 8
  %tmp = load %struct.defs** %pd0.addr, align 8
  %call = call i32 (...)* bitcast (i32 (%struct.defs*)* @setupTable to i32 (...)*)(%struct.defs* %tmp)
  store i8* getelementptr inbounds ([8 x i8]* @sec.qs626, i32 0, i32 0), i8** %ps, align 8
  %tmp25 = load %struct.defs** %pd0.addr, align 8
  %rfs = getelementptr inbounds %struct.defs* %tmp25, i32 0, i32 15
  %arraydecay = getelementptr inbounds [8 x i8]* %rfs, i32 0, i32 0
  store i8* %arraydecay, i8** %pt, align 8
  store i32 0, i32* %rc, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %tmp26 = load i8** %ps, align 8
  %incdec.ptr = getelementptr inbounds i8* %tmp26, i32 1
  store i8* %incdec.ptr, i8** %ps, align 8
  %tmp27 = load i8* %tmp26
  %tmp28 = load i8** %pt, align 8
  %incdec.ptr29 = getelementptr inbounds i8* %tmp28, i32 1
  store i8* %incdec.ptr29, i8** %pt, align 8
  store i8 %tmp27, i8* %tmp28
  %tobool = icmp ne i8 %tmp27, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  br label %while.cond

while.end:                                        ; preds = %while.cond
  store float 1.000000e+00, float* %f1, align 4
  store i64 1, i64* %lint1, align 8
  store i64 1, i64* %lint2, align 8
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %while.end
  %tmp30 = load i32* %j, align 4
  %tmp31 = load %struct.defs** %pd0.addr, align 8
  %lbits = getelementptr inbounds %struct.defs* %tmp31, i32 0, i32 3
  %tmp32 = load i32* %lbits, align 4
  %sub = sub nsw i32 %tmp32, 2
  %cmp = icmp slt i32 %tmp30, %sub
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp33 = load float* %f1, align 4
  %mul = fmul float %tmp33, 2.000000e+00
  store float %mul, float* %f1, align 4
  %tmp34 = load i64* %lint2, align 8
  %shl = shl i64 %tmp34, 1
  %tmp35 = load i64* %lint1, align 8
  %or = or i64 %shl, %tmp35
  store i64 %or, i64* %lint2, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp36 = load i32* %j, align 4
  %inc = add nsw i32 %tmp36, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp37 = load i64* %lint2, align 8
  %conv = sitofp i64 %tmp37 to float
  store float %conv, float* %f2, align 4
  %tmp38 = load float* %f1, align 4
  %tmp39 = load float* %f2, align 4
  %sub40 = fsub float %tmp38, %tmp39
  %tmp41 = load float* %f1, align 4
  %div = fdiv float %sub40, %tmp41
  store float %div, float* %f1, align 4
  %tmp42 = load float* %f1, align 4
  %conv43 = fpext float %tmp42 to double
  %tmp44 = load %struct.defs** %pd0.addr, align 8
  %fprec = getelementptr inbounds %struct.defs* %tmp44, i32 0, i32 7
  %tmp45 = load float* %fprec, align 4
  %conv46 = fpext float %tmp45 to double
  %mul47 = fmul double 2.000000e+00, %conv46
  %cmp48 = fcmp ogt double %conv43, %mul47
  br i1 %cmp48, label %if.then, label %if.end57

if.then:                                          ; preds = %for.end
  %tmp50 = load i32* %rc, align 4
  %add = add nsw i32 %tmp50, 2
  store i32 %add, i32* %rc, align 4
  %tmp51 = load %struct.defs** %pd0.addr, align 8
  %flgd = getelementptr inbounds %struct.defs* %tmp51, i32 0, i32 11
  %tmp52 = load i32* %flgd, align 4
  %cmp53 = icmp ne i32 %tmp52, 0
  br i1 %cmp53, label %if.then55, label %if.end

if.then55:                                        ; preds = %if.then
  %call56 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @sec.s626er, i32 0, i32 0), i32 2)
  br label %if.end

if.end:                                           ; preds = %if.then55, %if.then
  br label %if.end57

if.end57:                                         ; preds = %if.end, %for.end
  store i8 125, i8* %c, align 1
  store i16 125, i16* %s, align 2
  store i32 125, i32* %i, align 4
  store i32 15625, i32* %is, align 4
  store i32 125, i32* %u, align 4
  store i32 15625, i32* %us, align 4
  store i64 125, i64* %l, align 8
  store i64 15625, i64* %ls, align 8
  store float 1.250000e+02, float* %f, align 4
  store double 1.250000e+02, double* %d, align 8
  store double 1.562500e+04, double* %ds, align 8
  store i32 0, i32* %j, align 4
  br label %for.cond58

for.cond58:                                       ; preds = %for.inc64, %if.end57
  %tmp59 = load i32* %j, align 4
  %cmp60 = icmp slt i32 %tmp59, 28
  br i1 %cmp60, label %for.body62, label %for.end67

for.body62:                                       ; preds = %for.cond58
  %tmp63 = load i32* %j, align 4
  %idxprom = sext i32 %tmp63 to i64
  %arrayidx = getelementptr inbounds [28 x i8]* %t, i32 0, i64 %idxprom
  store i8 0, i8* %arrayidx, align 1
  br label %for.inc64

for.inc64:                                        ; preds = %for.body62
  %tmp65 = load i32* %j, align 4
  %inc66 = add nsw i32 %tmp65, 1
  store i32 %inc66, i32* %j, align 4
  br label %for.cond58

for.end67:                                        ; preds = %for.cond58
  %tmp68 = load i8* %c, align 1
  %conv69 = sext i8 %tmp68 to i32
  %tmp70 = load i8* %c, align 1
  %conv71 = sext i8 %tmp70 to i32
  %mul72 = mul nsw i32 %conv69, %conv71
  %tmp73 = load i32* %is, align 4
  %cmp74 = icmp ne i32 %mul72, %tmp73
  br i1 %cmp74, label %if.then76, label %if.end78

if.then76:                                        ; preds = %for.end67
  %arrayidx77 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 0
  store i8 1, i8* %arrayidx77, align 1
  br label %if.end78

if.end78:                                         ; preds = %if.then76, %for.end67
  %tmp79 = load i16* %s, align 2
  %conv80 = sext i16 %tmp79 to i32
  %tmp81 = load i8* %c, align 1
  %conv82 = sext i8 %tmp81 to i32
  %mul83 = mul nsw i32 %conv80, %conv82
  %tmp84 = load i32* %is, align 4
  %cmp85 = icmp ne i32 %mul83, %tmp84
  br i1 %cmp85, label %if.then87, label %if.end89

if.then87:                                        ; preds = %if.end78
  %arrayidx88 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 1
  store i8 1, i8* %arrayidx88, align 1
  br label %if.end89

if.end89:                                         ; preds = %if.then87, %if.end78
  %tmp90 = load i16* %s, align 2
  %conv91 = sext i16 %tmp90 to i32
  %tmp92 = load i16* %s, align 2
  %conv93 = sext i16 %tmp92 to i32
  %mul94 = mul nsw i32 %conv91, %conv93
  %tmp95 = load i32* %is, align 4
  %cmp96 = icmp ne i32 %mul94, %tmp95
  br i1 %cmp96, label %if.then98, label %if.end100

if.then98:                                        ; preds = %if.end89
  %arrayidx99 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 2
  store i8 1, i8* %arrayidx99, align 1
  br label %if.end100

if.end100:                                        ; preds = %if.then98, %if.end89
  %tmp101 = load i32* %i, align 4
  %tmp102 = load i8* %c, align 1
  %conv103 = sext i8 %tmp102 to i32
  %mul104 = mul nsw i32 %tmp101, %conv103
  %tmp105 = load i32* %is, align 4
  %cmp106 = icmp ne i32 %mul104, %tmp105
  br i1 %cmp106, label %if.then108, label %if.end110

if.then108:                                       ; preds = %if.end100
  %arrayidx109 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 3
  store i8 1, i8* %arrayidx109, align 1
  br label %if.end110

if.end110:                                        ; preds = %if.then108, %if.end100
  %tmp111 = load i32* %i, align 4
  %tmp112 = load i16* %s, align 2
  %conv113 = sext i16 %tmp112 to i32
  %mul114 = mul nsw i32 %tmp111, %conv113
  %tmp115 = load i32* %is, align 4
  %cmp116 = icmp ne i32 %mul114, %tmp115
  br i1 %cmp116, label %if.then118, label %if.end120

if.then118:                                       ; preds = %if.end110
  %arrayidx119 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 4
  store i8 1, i8* %arrayidx119, align 1
  br label %if.end120

if.end120:                                        ; preds = %if.then118, %if.end110
  %tmp121 = load i32* %i, align 4
  %tmp122 = load i32* %i, align 4
  %mul123 = mul nsw i32 %tmp121, %tmp122
  %tmp124 = load i32* %is, align 4
  %cmp125 = icmp ne i32 %mul123, %tmp124
  br i1 %cmp125, label %if.then127, label %if.end129

if.then127:                                       ; preds = %if.end120
  %arrayidx128 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 5
  store i8 1, i8* %arrayidx128, align 1
  br label %if.end129

if.end129:                                        ; preds = %if.then127, %if.end120
  %tmp130 = load i32* %u, align 4
  %tmp131 = load i8* %c, align 1
  %conv132 = sext i8 %tmp131 to i32
  %mul133 = mul i32 %tmp130, %conv132
  %tmp134 = load i32* %us, align 4
  %cmp135 = icmp ne i32 %mul133, %tmp134
  br i1 %cmp135, label %if.then137, label %if.end139

if.then137:                                       ; preds = %if.end129
  %arrayidx138 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 6
  store i8 1, i8* %arrayidx138, align 1
  br label %if.end139

if.end139:                                        ; preds = %if.then137, %if.end129
  %tmp140 = load i32* %u, align 4
  %tmp141 = load i16* %s, align 2
  %conv142 = sext i16 %tmp141 to i32
  %mul143 = mul i32 %tmp140, %conv142
  %tmp144 = load i32* %us, align 4
  %cmp145 = icmp ne i32 %mul143, %tmp144
  br i1 %cmp145, label %if.then147, label %if.end149

if.then147:                                       ; preds = %if.end139
  %arrayidx148 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 7
  store i8 1, i8* %arrayidx148, align 1
  br label %if.end149

if.end149:                                        ; preds = %if.then147, %if.end139
  %tmp150 = load i32* %u, align 4
  %tmp151 = load i32* %i, align 4
  %mul152 = mul i32 %tmp150, %tmp151
  %tmp153 = load i32* %us, align 4
  %cmp154 = icmp ne i32 %mul152, %tmp153
  br i1 %cmp154, label %if.then156, label %if.end158

if.then156:                                       ; preds = %if.end149
  %arrayidx157 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 8
  store i8 1, i8* %arrayidx157, align 1
  br label %if.end158

if.end158:                                        ; preds = %if.then156, %if.end149
  %tmp159 = load i32* %u, align 4
  %tmp160 = load i32* %u, align 4
  %mul161 = mul i32 %tmp159, %tmp160
  %tmp162 = load i32* %us, align 4
  %cmp163 = icmp ne i32 %mul161, %tmp162
  br i1 %cmp163, label %if.then165, label %if.end167

if.then165:                                       ; preds = %if.end158
  %arrayidx166 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 9
  store i8 1, i8* %arrayidx166, align 1
  br label %if.end167

if.end167:                                        ; preds = %if.then165, %if.end158
  %tmp168 = load i64* %l, align 8
  %tmp169 = load i8* %c, align 1
  %conv170 = sext i8 %tmp169 to i64
  %mul171 = mul nsw i64 %tmp168, %conv170
  %tmp172 = load i64* %ls, align 8
  %cmp173 = icmp ne i64 %mul171, %tmp172
  br i1 %cmp173, label %if.then175, label %if.end177

if.then175:                                       ; preds = %if.end167
  %arrayidx176 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 10
  store i8 1, i8* %arrayidx176, align 1
  br label %if.end177

if.end177:                                        ; preds = %if.then175, %if.end167
  %tmp178 = load i64* %l, align 8
  %tmp179 = load i16* %s, align 2
  %conv180 = sext i16 %tmp179 to i64
  %mul181 = mul nsw i64 %tmp178, %conv180
  %tmp182 = load i64* %ls, align 8
  %cmp183 = icmp ne i64 %mul181, %tmp182
  br i1 %cmp183, label %if.then185, label %if.end187

if.then185:                                       ; preds = %if.end177
  %arrayidx186 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 11
  store i8 1, i8* %arrayidx186, align 1
  br label %if.end187

if.end187:                                        ; preds = %if.then185, %if.end177
  %tmp188 = load i64* %l, align 8
  %tmp189 = load i32* %i, align 4
  %conv190 = sext i32 %tmp189 to i64
  %mul191 = mul nsw i64 %tmp188, %conv190
  %tmp192 = load i64* %ls, align 8
  %cmp193 = icmp ne i64 %mul191, %tmp192
  br i1 %cmp193, label %if.then195, label %if.end197

if.then195:                                       ; preds = %if.end187
  %arrayidx196 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 12
  store i8 1, i8* %arrayidx196, align 1
  br label %if.end197

if.end197:                                        ; preds = %if.then195, %if.end187
  %tmp198 = load i64* %l, align 8
  %tmp199 = load i32* %u, align 4
  %conv200 = zext i32 %tmp199 to i64
  %mul201 = mul nsw i64 %tmp198, %conv200
  %tmp202 = load i32* %us, align 4
  %conv203 = zext i32 %tmp202 to i64
  %cmp204 = icmp ne i64 %mul201, %conv203
  br i1 %cmp204, label %if.then206, label %if.end208

if.then206:                                       ; preds = %if.end197
  %arrayidx207 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 13
  store i8 1, i8* %arrayidx207, align 1
  br label %if.end208

if.end208:                                        ; preds = %if.then206, %if.end197
  %tmp209 = load i64* %l, align 8
  %tmp210 = load i64* %l, align 8
  %mul211 = mul nsw i64 %tmp209, %tmp210
  %tmp212 = load i64* %ls, align 8
  %cmp213 = icmp ne i64 %mul211, %tmp212
  br i1 %cmp213, label %if.then215, label %if.end217

if.then215:                                       ; preds = %if.end208
  %arrayidx216 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 14
  store i8 1, i8* %arrayidx216, align 1
  br label %if.end217

if.end217:                                        ; preds = %if.then215, %if.end208
  %tmp218 = load float* %f, align 4
  %tmp219 = load i8* %c, align 1
  %conv220 = sext i8 %tmp219 to i32
  %conv221 = sitofp i32 %conv220 to float
  %mul222 = fmul float %tmp218, %conv221
  %conv223 = fpext float %mul222 to double
  %tmp224 = load double* %ds, align 8
  %cmp225 = fcmp une double %conv223, %tmp224
  br i1 %cmp225, label %if.then227, label %if.end229

if.then227:                                       ; preds = %if.end217
  %arrayidx228 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 15
  store i8 1, i8* %arrayidx228, align 1
  br label %if.end229

if.end229:                                        ; preds = %if.then227, %if.end217
  %tmp230 = load float* %f, align 4
  %tmp231 = load i16* %s, align 2
  %conv232 = sext i16 %tmp231 to i32
  %conv233 = sitofp i32 %conv232 to float
  %mul234 = fmul float %tmp230, %conv233
  %conv235 = fpext float %mul234 to double
  %tmp236 = load double* %ds, align 8
  %cmp237 = fcmp une double %conv235, %tmp236
  br i1 %cmp237, label %if.then239, label %if.end241

if.then239:                                       ; preds = %if.end229
  %arrayidx240 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 16
  store i8 1, i8* %arrayidx240, align 1
  br label %if.end241

if.end241:                                        ; preds = %if.then239, %if.end229
  %tmp242 = load float* %f, align 4
  %tmp243 = load i32* %i, align 4
  %conv244 = sitofp i32 %tmp243 to float
  %mul245 = fmul float %tmp242, %conv244
  %conv246 = fpext float %mul245 to double
  %tmp247 = load double* %ds, align 8
  %cmp248 = fcmp une double %conv246, %tmp247
  br i1 %cmp248, label %if.then250, label %if.end252

if.then250:                                       ; preds = %if.end241
  %arrayidx251 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 17
  store i8 1, i8* %arrayidx251, align 1
  br label %if.end252

if.end252:                                        ; preds = %if.then250, %if.end241
  %tmp253 = load float* %f, align 4
  %tmp254 = load i32* %u, align 4
  %conv255 = uitofp i32 %tmp254 to float
  %mul256 = fmul float %tmp253, %conv255
  %conv257 = fpext float %mul256 to double
  %tmp258 = load double* %ds, align 8
  %cmp259 = fcmp une double %conv257, %tmp258
  br i1 %cmp259, label %if.then261, label %if.end263

if.then261:                                       ; preds = %if.end252
  %arrayidx262 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 18
  store i8 1, i8* %arrayidx262, align 1
  br label %if.end263

if.end263:                                        ; preds = %if.then261, %if.end252
  %tmp264 = load float* %f, align 4
  %tmp265 = load i64* %l, align 8
  %conv266 = sitofp i64 %tmp265 to float
  %mul267 = fmul float %tmp264, %conv266
  %conv268 = fpext float %mul267 to double
  %tmp269 = load double* %ds, align 8
  %cmp270 = fcmp une double %conv268, %tmp269
  br i1 %cmp270, label %if.then272, label %if.end274

if.then272:                                       ; preds = %if.end263
  %arrayidx273 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 19
  store i8 1, i8* %arrayidx273, align 1
  br label %if.end274

if.end274:                                        ; preds = %if.then272, %if.end263
  %tmp275 = load float* %f, align 4
  %tmp276 = load float* %f, align 4
  %mul277 = fmul float %tmp275, %tmp276
  %conv278 = fpext float %mul277 to double
  %tmp279 = load double* %ds, align 8
  %cmp280 = fcmp une double %conv278, %tmp279
  br i1 %cmp280, label %if.then282, label %if.end284

if.then282:                                       ; preds = %if.end274
  %arrayidx283 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 20
  store i8 1, i8* %arrayidx283, align 1
  br label %if.end284

if.end284:                                        ; preds = %if.then282, %if.end274
  %tmp285 = load double* %d, align 8
  %tmp286 = load i8* %c, align 1
  %conv287 = sext i8 %tmp286 to i32
  %conv288 = sitofp i32 %conv287 to double
  %mul289 = fmul double %tmp285, %conv288
  %tmp290 = load double* %ds, align 8
  %cmp291 = fcmp une double %mul289, %tmp290
  br i1 %cmp291, label %if.then293, label %if.end295

if.then293:                                       ; preds = %if.end284
  %arrayidx294 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 21
  store i8 1, i8* %arrayidx294, align 1
  br label %if.end295

if.end295:                                        ; preds = %if.then293, %if.end284
  %tmp296 = load double* %d, align 8
  %tmp297 = load i16* %s, align 2
  %conv298 = sext i16 %tmp297 to i32
  %conv299 = sitofp i32 %conv298 to double
  %mul300 = fmul double %tmp296, %conv299
  %tmp301 = load double* %ds, align 8
  %cmp302 = fcmp une double %mul300, %tmp301
  br i1 %cmp302, label %if.then304, label %if.end306

if.then304:                                       ; preds = %if.end295
  %arrayidx305 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 22
  store i8 1, i8* %arrayidx305, align 1
  br label %if.end306

if.end306:                                        ; preds = %if.then304, %if.end295
  %tmp307 = load double* %d, align 8
  %tmp308 = load i32* %i, align 4
  %conv309 = sitofp i32 %tmp308 to double
  %mul310 = fmul double %tmp307, %conv309
  %tmp311 = load double* %ds, align 8
  %cmp312 = fcmp une double %mul310, %tmp311
  br i1 %cmp312, label %if.then314, label %if.end316

if.then314:                                       ; preds = %if.end306
  %arrayidx315 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 23
  store i8 1, i8* %arrayidx315, align 1
  br label %if.end316

if.end316:                                        ; preds = %if.then314, %if.end306
  %tmp317 = load double* %d, align 8
  %tmp318 = load i32* %u, align 4
  %conv319 = uitofp i32 %tmp318 to double
  %mul320 = fmul double %tmp317, %conv319
  %tmp321 = load double* %ds, align 8
  %cmp322 = fcmp une double %mul320, %tmp321
  br i1 %cmp322, label %if.then324, label %if.end326

if.then324:                                       ; preds = %if.end316
  %arrayidx325 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 24
  store i8 1, i8* %arrayidx325, align 1
  br label %if.end326

if.end326:                                        ; preds = %if.then324, %if.end316
  %tmp327 = load double* %d, align 8
  %tmp328 = load i64* %l, align 8
  %conv329 = sitofp i64 %tmp328 to double
  %mul330 = fmul double %tmp327, %conv329
  %tmp331 = load double* %ds, align 8
  %cmp332 = fcmp une double %mul330, %tmp331
  br i1 %cmp332, label %if.then334, label %if.end336

if.then334:                                       ; preds = %if.end326
  %arrayidx335 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 25
  store i8 1, i8* %arrayidx335, align 1
  br label %if.end336

if.end336:                                        ; preds = %if.then334, %if.end326
  %tmp337 = load double* %d, align 8
  %tmp338 = load float* %f, align 4
  %conv339 = fpext float %tmp338 to double
  %mul340 = fmul double %tmp337, %conv339
  %tmp341 = load double* %ds, align 8
  %cmp342 = fcmp une double %mul340, %tmp341
  br i1 %cmp342, label %if.then344, label %if.end346

if.then344:                                       ; preds = %if.end336
  %arrayidx345 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 26
  store i8 1, i8* %arrayidx345, align 1
  br label %if.end346

if.end346:                                        ; preds = %if.then344, %if.end336
  %tmp347 = load double* %d, align 8
  %tmp348 = load double* %d, align 8
  %mul349 = fmul double %tmp347, %tmp348
  %tmp350 = load double* %ds, align 8
  %cmp351 = fcmp une double %mul349, %tmp350
  br i1 %cmp351, label %if.then353, label %if.end355

if.then353:                                       ; preds = %if.end346
  %arrayidx354 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 27
  store i8 1, i8* %arrayidx354, align 1
  br label %if.end355

if.end355:                                        ; preds = %if.then353, %if.end346
  store i8 0, i8* %t0, align 1
  store i32 0, i32* %j, align 4
  br label %for.cond356

for.cond356:                                      ; preds = %for.inc370, %if.end355
  %tmp357 = load i32* %j, align 4
  %cmp358 = icmp slt i32 %tmp357, 28
  br i1 %cmp358, label %for.body360, label %for.end373

for.body360:                                      ; preds = %for.cond356
  %tmp361 = load i8* %t0, align 1
  %conv362 = sext i8 %tmp361 to i32
  %tmp363 = load i32* %j, align 4
  %idxprom364 = sext i32 %tmp363 to i64
  %arrayidx365 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 %idxprom364
  %tmp366 = load i8* %arrayidx365, align 1
  %conv367 = sext i8 %tmp366 to i32
  %add368 = add nsw i32 %conv362, %conv367
  %conv369 = trunc i32 %add368 to i8
  store i8 %conv369, i8* %t0, align 1
  br label %for.inc370

for.inc370:                                       ; preds = %for.body360
  %tmp371 = load i32* %j, align 4
  %inc372 = add nsw i32 %tmp371, 1
  store i32 %inc372, i32* %j, align 4
  br label %for.cond356

for.end373:                                       ; preds = %for.cond356
  %tmp374 = load i8* %t0, align 1
  %conv375 = sext i8 %tmp374 to i32
  %cmp376 = icmp ne i32 %conv375, 0
  br i1 %cmp376, label %if.then378, label %if.end406

if.then378:                                       ; preds = %for.end373
  %tmp379 = load i32* %rc, align 4
  %add380 = add nsw i32 %tmp379, 4
  store i32 %add380, i32* %rc, align 4
  %tmp381 = load %struct.defs** %pd0.addr, align 8
  %flgd382 = getelementptr inbounds %struct.defs* %tmp381, i32 0, i32 11
  %tmp383 = load i32* %flgd382, align 4
  %cmp384 = icmp ne i32 %tmp383, 0
  br i1 %cmp384, label %if.then386, label %if.end405

if.then386:                                       ; preds = %if.then378
  %call387 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @sec.s626er, i32 0, i32 0), i32 4)
  %call388 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0))
  store i32 0, i32* %j, align 4
  br label %for.cond389

for.cond389:                                      ; preds = %for.inc400, %if.then386
  %tmp390 = load i32* %j, align 4
  %cmp391 = icmp slt i32 %tmp390, 28
  br i1 %cmp391, label %for.body393, label %for.end403

for.body393:                                      ; preds = %for.cond389
  %tmp394 = load i32* %j, align 4
  %idxprom395 = sext i32 %tmp394 to i64
  %arrayidx396 = getelementptr inbounds [28 x i8]* %t, i32 0, i64 %idxprom395
  %tmp397 = load i8* %arrayidx396, align 1
  %conv398 = sext i8 %tmp397 to i32
  %call399 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0), i32 %conv398)
  br label %for.inc400

for.inc400:                                       ; preds = %for.body393
  %tmp401 = load i32* %j, align 4
  %inc402 = add nsw i32 %tmp401, 1
  store i32 %inc402, i32* %j, align 4
  br label %for.cond389

for.end403:                                       ; preds = %for.cond389
  %call404 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0))
  br label %if.end405

if.end405:                                        ; preds = %for.end403, %if.then378
  br label %if.end406

if.end406:                                        ; preds = %if.end405, %for.end373
  store i64 32768, i64* %l, align 8
  %tmp407 = load i64* %l, align 8
  %cmp408 = icmp sgt i64 %tmp407, 32768
  br i1 %cmp408, label %if.then410, label %if.end421

if.then410:                                       ; preds = %if.end406
  %tmp411 = load i32* %rc, align 4
  %add412 = add nsw i32 %tmp411, 8
  store i32 %add412, i32* %rc, align 4
  %tmp413 = load %struct.defs** %pd0.addr, align 8
  %flgd414 = getelementptr inbounds %struct.defs* %tmp413, i32 0, i32 11
  %tmp415 = load i32* %flgd414, align 4
  %cmp416 = icmp ne i32 %tmp415, 0
  br i1 %cmp416, label %if.then418, label %if.end420

if.then418:                                       ; preds = %if.then410
  %call419 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @sec.s626er, i32 0, i32 0), i32 8)
  br label %if.end420

if.end420:                                        ; preds = %if.then418, %if.then410
  br label %if.end421

if.end421:                                        ; preds = %if.end420, %if.end406
  %tmp422 = load i32* %rc, align 4
  ret i32 %tmp422
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
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 15, i32 0), i32 %tmp4)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %tmp6 = load i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 14), align 4
  %cmp7 = icmp eq i32 %tmp6, 0
  br i1 %cmp7, label %if.then8, label %if.else

if.then8:                                         ; preds = %if.end
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0))
  br label %if.end11

if.else:                                          ; preds = %if.end
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str5, i32 0, i32 0))
  br label %if.end11

if.end11:                                         ; preds = %if.else, %if.then8
  ret i32 0
}
