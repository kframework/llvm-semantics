; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/cq-12-s72.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.defs = type { i32, i32, i32, i32, i32, i32, i32, float, float, i32, i32, i32, i32, i32, i32, [8 x i8] }

@setupTable.qs26 = internal global [8 x i8] c"s26    \00", align 1
@setupTable.s = internal global [18 x i8] c"%3d bits in %ss.\0A\00", align 16
@setupTable.s2 = internal global [54 x i8] c"%f is the least number that can be added to 1. (%s).\0A\00", align 16
@svtest.k = internal global i32 0, align 4
@zero.k = internal global i32 0, align 4
@extvar = common global i32 0, align 4
@sec.s72er = internal global [10 x i8] c"s72,er%d\0A\00", align 1
@sec.qs72 = internal global [8 x i8] c"s72    \00", align 1
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
  %k = alloca i32, align 4
  %j = alloca i32, align 4
  %i = alloca i32, align 4
  %lrc = alloca i32, align 4
  %c = alloca i8, align 1
  %s = alloca i16, align 2
  %l = alloca i64, align 8
  %u = alloca i32, align 4
  %d = alloca double, align 8
  %f = alloca float, align 4
  store %struct.defs* %pd0, %struct.defs** %pd0.addr, align 8
  %tmp = load %struct.defs** %pd0.addr, align 8
  %call = call i32 (...)* bitcast (i32 (%struct.defs*)* @setupTable to i32 (...)*)(%struct.defs* %tmp)
  store i8* getelementptr inbounds ([8 x i8]* @sec.qs72, i32 0, i32 0), i8** %ps, align 8
  %tmp14 = load %struct.defs** %pd0.addr, align 8
  %rfs = getelementptr inbounds %struct.defs* %tmp14, i32 0, i32 15
  %arraydecay = getelementptr inbounds [8 x i8]* %rfs, i32 0, i32 0
  store i8* %arraydecay, i8** %pt, align 8
  store i32 0, i32* %rc, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %tmp15 = load i8** %ps, align 8
  %incdec.ptr = getelementptr inbounds i8* %tmp15, i32 1
  store i8* %incdec.ptr, i8** %ps, align 8
  %tmp16 = load i8* %tmp15
  %tmp17 = load i8** %pt, align 8
  %incdec.ptr18 = getelementptr inbounds i8* %tmp17, i32 1
  store i8* %incdec.ptr18, i8** %pt, align 8
  store i8 %tmp16, i8* %tmp17
  %tobool = icmp ne i8 %tmp16, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  br label %while.cond

while.end:                                        ; preds = %while.cond
  store i32 2, i32* %k, align 4
  %tmp19 = load i32* %k
  %cmp = icmp ne i32 %tmp19, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %while.end
  %tmp20 = load i32* %rc, align 4
  %add = add nsw i32 %tmp20, 1
  store i32 %add, i32* %rc, align 4
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s72er, i32 0, i32 0), i32 1)
  br label %if.end

if.end:                                           ; preds = %if.then, %while.end
  %tmp22 = load i32* %k, align 4
  %tmp23 = load i32* %k, align 4
  %sub = sub nsw i32 0, %tmp23
  %add24 = add nsw i32 %tmp22, %sub
  %cmp25 = icmp ne i32 %add24, 0
  br i1 %cmp25, label %if.then26, label %if.end30

if.then26:                                        ; preds = %if.end
  %tmp27 = load i32* %rc, align 4
  %add28 = add nsw i32 %tmp27, 2
  store i32 %add28, i32* %rc, align 4
  %call29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s72er, i32 0, i32 0), i32 2)
  br label %if.end30

if.end30:                                         ; preds = %if.then26, %if.end
  store i32 0, i32* %k, align 4
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end30
  %tmp31 = load i32* %j, align 4
  %tmp32 = load %struct.defs** %pd0.addr, align 8
  %ibits = getelementptr inbounds %struct.defs* %tmp32, i32 0, i32 1
  %tmp33 = load i32* %ibits, align 4
  %sub34 = sub nsw i32 %tmp33, 1
  %cmp35 = icmp slt i32 %tmp31, %sub34
  br i1 %cmp35, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp36 = load i32* %k, align 4
  %shl = shl i32 %tmp36, 1
  %or = or i32 %shl, 1
  store i32 %or, i32* %k, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp37 = load i32* %j, align 4
  %inc = add nsw i32 %tmp37, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp38 = load i32* %k, align 4
  %neg = xor i32 %tmp38, -1
  %tmp39 = load i32* %k, align 4
  %add40 = add nsw i32 %neg, %tmp39
  %cmp41 = icmp ne i32 %add40, -1
  br i1 %cmp41, label %if.then42, label %if.end46

if.then42:                                        ; preds = %for.end
  %tmp43 = load i32* %rc, align 4
  %add44 = add nsw i32 %tmp43, 4
  store i32 %add44, i32* %rc, align 4
  %call45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s72er, i32 0, i32 0), i32 4)
  br label %if.end46

if.end46:                                         ; preds = %if.then42, %for.end
  store i32 5, i32* %k, align 4
  %tmp47 = load i32* %k, align 4
  %inc48 = add nsw i32 %tmp47, 1
  store i32 %inc48, i32* %k, align 4
  %cmp49 = icmp ne i32 %inc48, 6
  br i1 %cmp49, label %if.then63, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end46
  %tmp50 = load i32* %k, align 4
  %dec = add nsw i32 %tmp50, -1
  store i32 %dec, i32* %k, align 4
  %cmp51 = icmp ne i32 %dec, 5
  br i1 %cmp51, label %if.then63, label %lor.lhs.false52

lor.lhs.false52:                                  ; preds = %lor.lhs.false
  %tmp53 = load i32* %k, align 4
  %inc54 = add nsw i32 %tmp53, 1
  store i32 %inc54, i32* %k, align 4
  %cmp55 = icmp ne i32 %tmp53, 5
  br i1 %cmp55, label %if.then63, label %lor.lhs.false56

lor.lhs.false56:                                  ; preds = %lor.lhs.false52
  %tmp57 = load i32* %k, align 4
  %dec58 = add nsw i32 %tmp57, -1
  store i32 %dec58, i32* %k, align 4
  %cmp59 = icmp ne i32 %tmp57, 6
  br i1 %cmp59, label %if.then63, label %lor.lhs.false60

lor.lhs.false60:                                  ; preds = %lor.lhs.false56
  %tmp61 = load i32* %k, align 4
  %cmp62 = icmp ne i32 %tmp61, 5
  br i1 %cmp62, label %if.then63, label %if.end67

if.then63:                                        ; preds = %lor.lhs.false60, %lor.lhs.false56, %lor.lhs.false52, %lor.lhs.false, %if.end46
  %tmp64 = load i32* %rc, align 4
  %add65 = add nsw i32 %tmp64, 8
  store i32 %add65, i32* %rc, align 4
  %call66 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s72er, i32 0, i32 0), i32 8)
  br label %if.end67

if.end67:                                         ; preds = %if.then63, %lor.lhs.false60
  store i8 26, i8* %c, align 1
  store i64 26, i64* %l, align 8
  store double 2.600000e+01, double* %d, align 8
  store i16 26, i16* %s, align 2
  store i32 26, i32* %u, align 4
  store i32 26, i32* %i, align 4
  store float 2.600000e+01, float* %f, align 4
  store i32 0, i32* %lrc, align 4
  %tmp68 = load i16* %s, align 2
  %conv = trunc i16 %tmp68 to i8
  %conv69 = sext i8 %conv to i32
  %cmp70 = icmp ne i32 %conv69, 26
  br i1 %cmp70, label %if.then102, label %lor.lhs.false72

lor.lhs.false72:                                  ; preds = %if.end67
  %tmp73 = load i32* %i, align 4
  %conv74 = trunc i32 %tmp73 to i8
  %conv75 = sext i8 %conv74 to i32
  %cmp76 = icmp ne i32 %conv75, 26
  br i1 %cmp76, label %if.then102, label %lor.lhs.false78

lor.lhs.false78:                                  ; preds = %lor.lhs.false72
  %tmp79 = load i64* %l, align 8
  %conv80 = trunc i64 %tmp79 to i8
  %conv81 = sext i8 %conv80 to i32
  %cmp82 = icmp ne i32 %conv81, 26
  br i1 %cmp82, label %if.then102, label %lor.lhs.false84

lor.lhs.false84:                                  ; preds = %lor.lhs.false78
  %tmp85 = load i32* %u, align 4
  %conv86 = trunc i32 %tmp85 to i8
  %conv87 = sext i8 %conv86 to i32
  %cmp88 = icmp ne i32 %conv87, 26
  br i1 %cmp88, label %if.then102, label %lor.lhs.false90

lor.lhs.false90:                                  ; preds = %lor.lhs.false84
  %tmp91 = load float* %f, align 4
  %conv92 = fptosi float %tmp91 to i8
  %conv93 = sext i8 %conv92 to i32
  %cmp94 = icmp ne i32 %conv93, 26
  br i1 %cmp94, label %if.then102, label %lor.lhs.false96

lor.lhs.false96:                                  ; preds = %lor.lhs.false90
  %tmp97 = load double* %d, align 8
  %conv98 = fptosi double %tmp97 to i8
  %conv99 = sext i8 %conv98 to i32
  %cmp100 = icmp ne i32 %conv99, 26
  br i1 %cmp100, label %if.then102, label %if.end105

if.then102:                                       ; preds = %lor.lhs.false96, %lor.lhs.false90, %lor.lhs.false84, %lor.lhs.false78, %lor.lhs.false72, %if.end67
  %tmp103 = load i32* %lrc, align 4
  %add104 = add nsw i32 %tmp103, 1
  store i32 %add104, i32* %lrc, align 4
  br label %if.end105

if.end105:                                        ; preds = %if.then102, %lor.lhs.false96
  %tmp106 = load i8* %c, align 1
  %conv107 = sext i8 %tmp106 to i16
  %conv108 = sext i16 %conv107 to i32
  %cmp109 = icmp ne i32 %conv108, 26
  br i1 %cmp109, label %if.then141, label %lor.lhs.false111

lor.lhs.false111:                                 ; preds = %if.end105
  %tmp112 = load i32* %i, align 4
  %conv113 = trunc i32 %tmp112 to i16
  %conv114 = sext i16 %conv113 to i32
  %cmp115 = icmp ne i32 %conv114, 26
  br i1 %cmp115, label %if.then141, label %lor.lhs.false117

lor.lhs.false117:                                 ; preds = %lor.lhs.false111
  %tmp118 = load i64* %l, align 8
  %conv119 = trunc i64 %tmp118 to i16
  %conv120 = sext i16 %conv119 to i32
  %cmp121 = icmp ne i32 %conv120, 26
  br i1 %cmp121, label %if.then141, label %lor.lhs.false123

lor.lhs.false123:                                 ; preds = %lor.lhs.false117
  %tmp124 = load i32* %u, align 4
  %conv125 = trunc i32 %tmp124 to i16
  %conv126 = sext i16 %conv125 to i32
  %cmp127 = icmp ne i32 %conv126, 26
  br i1 %cmp127, label %if.then141, label %lor.lhs.false129

lor.lhs.false129:                                 ; preds = %lor.lhs.false123
  %tmp130 = load float* %f, align 4
  %conv131 = fptosi float %tmp130 to i16
  %conv132 = sext i16 %conv131 to i32
  %cmp133 = icmp ne i32 %conv132, 26
  br i1 %cmp133, label %if.then141, label %lor.lhs.false135

lor.lhs.false135:                                 ; preds = %lor.lhs.false129
  %tmp136 = load double* %d, align 8
  %conv137 = fptosi double %tmp136 to i16
  %conv138 = sext i16 %conv137 to i32
  %cmp139 = icmp ne i32 %conv138, 26
  br i1 %cmp139, label %if.then141, label %if.end144

if.then141:                                       ; preds = %lor.lhs.false135, %lor.lhs.false129, %lor.lhs.false123, %lor.lhs.false117, %lor.lhs.false111, %if.end105
  %tmp142 = load i32* %lrc, align 4
  %add143 = add nsw i32 %tmp142, 2
  store i32 %add143, i32* %lrc, align 4
  br label %if.end144

if.end144:                                        ; preds = %if.then141, %lor.lhs.false135
  %tmp145 = load i8* %c, align 1
  %conv146 = sext i8 %tmp145 to i32
  %cmp147 = icmp ne i32 %conv146, 26
  br i1 %cmp147, label %if.then173, label %lor.lhs.false149

lor.lhs.false149:                                 ; preds = %if.end144
  %tmp150 = load i16* %s, align 2
  %conv151 = sext i16 %tmp150 to i32
  %cmp152 = icmp ne i32 %conv151, 26
  br i1 %cmp152, label %if.then173, label %lor.lhs.false154

lor.lhs.false154:                                 ; preds = %lor.lhs.false149
  %tmp155 = load i64* %l, align 8
  %conv156 = trunc i64 %tmp155 to i32
  %cmp157 = icmp ne i32 %conv156, 26
  br i1 %cmp157, label %if.then173, label %lor.lhs.false159

lor.lhs.false159:                                 ; preds = %lor.lhs.false154
  %tmp160 = load i32* %u, align 4
  %cmp161 = icmp ne i32 %tmp160, 26
  br i1 %cmp161, label %if.then173, label %lor.lhs.false163

lor.lhs.false163:                                 ; preds = %lor.lhs.false159
  %tmp164 = load float* %f, align 4
  %conv165 = fptosi float %tmp164 to i32
  %cmp166 = icmp ne i32 %conv165, 26
  br i1 %cmp166, label %if.then173, label %lor.lhs.false168

lor.lhs.false168:                                 ; preds = %lor.lhs.false163
  %tmp169 = load double* %d, align 8
  %conv170 = fptosi double %tmp169 to i32
  %cmp171 = icmp ne i32 %conv170, 26
  br i1 %cmp171, label %if.then173, label %if.end176

if.then173:                                       ; preds = %lor.lhs.false168, %lor.lhs.false163, %lor.lhs.false159, %lor.lhs.false154, %lor.lhs.false149, %if.end144
  %tmp174 = load i32* %lrc, align 4
  %add175 = add nsw i32 %tmp174, 4
  store i32 %add175, i32* %lrc, align 4
  br label %if.end176

if.end176:                                        ; preds = %if.then173, %lor.lhs.false168
  %tmp177 = load i8* %c, align 1
  %conv178 = sext i8 %tmp177 to i64
  %cmp179 = icmp ne i64 %conv178, 26
  br i1 %cmp179, label %if.then206, label %lor.lhs.false181

lor.lhs.false181:                                 ; preds = %if.end176
  %tmp182 = load i16* %s, align 2
  %conv183 = sext i16 %tmp182 to i64
  %cmp184 = icmp ne i64 %conv183, 26
  br i1 %cmp184, label %if.then206, label %lor.lhs.false186

lor.lhs.false186:                                 ; preds = %lor.lhs.false181
  %tmp187 = load i32* %i, align 4
  %conv188 = sext i32 %tmp187 to i64
  %cmp189 = icmp ne i64 %conv188, 26
  br i1 %cmp189, label %if.then206, label %lor.lhs.false191

lor.lhs.false191:                                 ; preds = %lor.lhs.false186
  %tmp192 = load i32* %u, align 4
  %conv193 = zext i32 %tmp192 to i64
  %cmp194 = icmp ne i64 %conv193, 26
  br i1 %cmp194, label %if.then206, label %lor.lhs.false196

lor.lhs.false196:                                 ; preds = %lor.lhs.false191
  %tmp197 = load float* %f, align 4
  %conv198 = fptosi float %tmp197 to i64
  %cmp199 = icmp ne i64 %conv198, 26
  br i1 %cmp199, label %if.then206, label %lor.lhs.false201

lor.lhs.false201:                                 ; preds = %lor.lhs.false196
  %tmp202 = load double* %d, align 8
  %conv203 = fptosi double %tmp202 to i64
  %cmp204 = icmp ne i64 %conv203, 26
  br i1 %cmp204, label %if.then206, label %if.end209

if.then206:                                       ; preds = %lor.lhs.false201, %lor.lhs.false196, %lor.lhs.false191, %lor.lhs.false186, %lor.lhs.false181, %if.end176
  %tmp207 = load i32* %lrc, align 4
  %add208 = add nsw i32 %tmp207, 8
  store i32 %add208, i32* %lrc, align 4
  br label %if.end209

if.end209:                                        ; preds = %if.then206, %lor.lhs.false201
  %tmp210 = load i8* %c, align 1
  %conv211 = sext i8 %tmp210 to i32
  %cmp212 = icmp ne i32 %conv211, 26
  br i1 %cmp212, label %if.then238, label %lor.lhs.false214

lor.lhs.false214:                                 ; preds = %if.end209
  %tmp215 = load i16* %s, align 2
  %conv216 = sext i16 %tmp215 to i32
  %cmp217 = icmp ne i32 %conv216, 26
  br i1 %cmp217, label %if.then238, label %lor.lhs.false219

lor.lhs.false219:                                 ; preds = %lor.lhs.false214
  %tmp220 = load i32* %i, align 4
  %cmp221 = icmp ne i32 %tmp220, 26
  br i1 %cmp221, label %if.then238, label %lor.lhs.false223

lor.lhs.false223:                                 ; preds = %lor.lhs.false219
  %tmp224 = load i64* %l, align 8
  %conv225 = trunc i64 %tmp224 to i32
  %cmp226 = icmp ne i32 %conv225, 26
  br i1 %cmp226, label %if.then238, label %lor.lhs.false228

lor.lhs.false228:                                 ; preds = %lor.lhs.false223
  %tmp229 = load float* %f, align 4
  %conv230 = fptoui float %tmp229 to i32
  %cmp231 = icmp ne i32 %conv230, 26
  br i1 %cmp231, label %if.then238, label %lor.lhs.false233

lor.lhs.false233:                                 ; preds = %lor.lhs.false228
  %tmp234 = load double* %d, align 8
  %conv235 = fptoui double %tmp234 to i32
  %cmp236 = icmp ne i32 %conv235, 26
  br i1 %cmp236, label %if.then238, label %if.end241

if.then238:                                       ; preds = %lor.lhs.false233, %lor.lhs.false228, %lor.lhs.false223, %lor.lhs.false219, %lor.lhs.false214, %if.end209
  %tmp239 = load i32* %lrc, align 4
  %add240 = add nsw i32 %tmp239, 16
  store i32 %add240, i32* %lrc, align 4
  br label %if.end241

if.end241:                                        ; preds = %if.then238, %lor.lhs.false233
  %tmp242 = load i8* %c, align 1
  %conv243 = sitofp i8 %tmp242 to float
  %conv244 = fpext float %conv243 to double
  %cmp245 = fcmp une double %conv244, 2.600000e+01
  br i1 %cmp245, label %if.then277, label %lor.lhs.false247

lor.lhs.false247:                                 ; preds = %if.end241
  %tmp248 = load i16* %s, align 2
  %conv249 = sitofp i16 %tmp248 to float
  %conv250 = fpext float %conv249 to double
  %cmp251 = fcmp une double %conv250, 2.600000e+01
  br i1 %cmp251, label %if.then277, label %lor.lhs.false253

lor.lhs.false253:                                 ; preds = %lor.lhs.false247
  %tmp254 = load i32* %i, align 4
  %conv255 = sitofp i32 %tmp254 to float
  %conv256 = fpext float %conv255 to double
  %cmp257 = fcmp une double %conv256, 2.600000e+01
  br i1 %cmp257, label %if.then277, label %lor.lhs.false259

lor.lhs.false259:                                 ; preds = %lor.lhs.false253
  %tmp260 = load i64* %l, align 8
  %conv261 = sitofp i64 %tmp260 to float
  %conv262 = fpext float %conv261 to double
  %cmp263 = fcmp une double %conv262, 2.600000e+01
  br i1 %cmp263, label %if.then277, label %lor.lhs.false265

lor.lhs.false265:                                 ; preds = %lor.lhs.false259
  %tmp266 = load i32* %u, align 4
  %conv267 = uitofp i32 %tmp266 to float
  %conv268 = fpext float %conv267 to double
  %cmp269 = fcmp une double %conv268, 2.600000e+01
  br i1 %cmp269, label %if.then277, label %lor.lhs.false271

lor.lhs.false271:                                 ; preds = %lor.lhs.false265
  %tmp272 = load double* %d, align 8
  %conv273 = fptrunc double %tmp272 to float
  %conv274 = fpext float %conv273 to double
  %cmp275 = fcmp une double %conv274, 2.600000e+01
  br i1 %cmp275, label %if.then277, label %if.end280

if.then277:                                       ; preds = %lor.lhs.false271, %lor.lhs.false265, %lor.lhs.false259, %lor.lhs.false253, %lor.lhs.false247, %if.end241
  %tmp278 = load i32* %lrc, align 4
  %add279 = add nsw i32 %tmp278, 32
  store i32 %add279, i32* %lrc, align 4
  br label %if.end280

if.end280:                                        ; preds = %if.then277, %lor.lhs.false271
  %tmp281 = load i8* %c, align 1
  %conv282 = sitofp i8 %tmp281 to double
  %cmp283 = fcmp une double %conv282, 2.600000e+01
  br i1 %cmp283, label %if.then310, label %lor.lhs.false285

lor.lhs.false285:                                 ; preds = %if.end280
  %tmp286 = load i16* %s, align 2
  %conv287 = sitofp i16 %tmp286 to double
  %cmp288 = fcmp une double %conv287, 2.600000e+01
  br i1 %cmp288, label %if.then310, label %lor.lhs.false290

lor.lhs.false290:                                 ; preds = %lor.lhs.false285
  %tmp291 = load i32* %i, align 4
  %conv292 = sitofp i32 %tmp291 to double
  %cmp293 = fcmp une double %conv292, 2.600000e+01
  br i1 %cmp293, label %if.then310, label %lor.lhs.false295

lor.lhs.false295:                                 ; preds = %lor.lhs.false290
  %tmp296 = load i64* %l, align 8
  %conv297 = sitofp i64 %tmp296 to double
  %cmp298 = fcmp une double %conv297, 2.600000e+01
  br i1 %cmp298, label %if.then310, label %lor.lhs.false300

lor.lhs.false300:                                 ; preds = %lor.lhs.false295
  %tmp301 = load i32* %u, align 4
  %conv302 = uitofp i32 %tmp301 to double
  %cmp303 = fcmp une double %conv302, 2.600000e+01
  br i1 %cmp303, label %if.then310, label %lor.lhs.false305

lor.lhs.false305:                                 ; preds = %lor.lhs.false300
  %tmp306 = load float* %f, align 4
  %conv307 = fpext float %tmp306 to double
  %cmp308 = fcmp une double %conv307, 2.600000e+01
  br i1 %cmp308, label %if.then310, label %if.end313

if.then310:                                       ; preds = %lor.lhs.false305, %lor.lhs.false300, %lor.lhs.false295, %lor.lhs.false290, %lor.lhs.false285, %if.end280
  %tmp311 = load i32* %lrc, align 4
  %add312 = add nsw i32 %tmp311, 64
  store i32 %add312, i32* %lrc, align 4
  br label %if.end313

if.end313:                                        ; preds = %if.then310, %lor.lhs.false305
  %tmp314 = load i32* %lrc, align 4
  %cmp315 = icmp ne i32 %tmp314, 0
  br i1 %cmp315, label %if.then317, label %if.end321

if.then317:                                       ; preds = %if.end313
  %tmp318 = load i32* %rc, align 4
  %add319 = add nsw i32 %tmp318, 16
  store i32 %add319, i32* %rc, align 4
  %call320 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s72er, i32 0, i32 0), i32 16)
  br label %if.end321

if.end321:                                        ; preds = %if.then317, %if.end313
  %tmp322 = load i32* %rc, align 4
  ret i32 %tmp322
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
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 15, i32 0), i32 %tmp4)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %tmp6 = load i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 14), align 4
  %cmp7 = icmp eq i32 %tmp6, 0
  br i1 %cmp7, label %if.then8, label %if.else

if.then8:                                         ; preds = %if.end
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0))
  br label %if.end11

if.else:                                          ; preds = %if.end
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0))
  br label %if.end11

if.end11:                                         ; preds = %if.else, %if.then8
  ret i32 0
}
