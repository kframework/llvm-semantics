; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/cq-14-s7813.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
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
  %tmp = load %struct.defs** %pd0.addr, align 8
  %rfs = getelementptr inbounds %struct.defs* %tmp, i32 0, i32 15
  %arraydecay = getelementptr inbounds [8 x i8]* %rfs, i32 0, i32 0
  store i8* %arraydecay, i8** %pt, align 8
  store i32 0, i32* %lrc, align 4
  store i32 0, i32* %rc, align 4
  %tmp1 = load %struct.defs** %pd0.addr, align 8
  %flgl = getelementptr inbounds %struct.defs* %tmp1, i32 0, i32 12
  %tmp2 = load i32* %flgl, align 4
  store i32 %tmp2, i32* %prlc, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %tmp3 = load i8** %ps, align 8
  %incdec.ptr = getelementptr inbounds i8* %tmp3, i32 1
  store i8* %incdec.ptr, i8** %ps, align 8
  %tmp4 = load i8* %tmp3
  %tmp5 = load i8** %pt, align 8
  %incdec.ptr6 = getelementptr inbounds i8* %tmp5, i32 1
  store i8* %incdec.ptr6, i8** %pt, align 8
  store i8 %tmp4, i8* %tmp5
  %tobool = icmp ne i8 %tmp4, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %tmp7 = load i32* %lrc, align 4
  %cmp = icmp ne i32 %tmp7, 0
  br i1 %cmp, label %if.then, label %if.end13

if.then:                                          ; preds = %while.end
  %tmp8 = load %struct.defs** %pd0.addr, align 8
  %flgd = getelementptr inbounds %struct.defs* %tmp8, i32 0, i32 11
  %tmp9 = load i32* %flgd, align 4
  %cmp10 = icmp ne i32 %tmp9, 0
  br i1 %cmp10, label %if.then11, label %if.end

if.then11:                                        ; preds = %if.then
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @sec.s7813er, i32 0, i32 0), i32 1)
  br label %if.end

if.end:                                           ; preds = %if.then11, %if.then
  %tmp12 = load i32* %rc, align 4
  %add = add nsw i32 %tmp12, 1
  store i32 %add, i32* %rc, align 4
  br label %if.end13

if.end13:                                         ; preds = %if.end, %while.end
  store i32 0, i32* %lrc, align 4
  store i32 0, i32* %j, align 4
  store i32 0, i32* %i, align 4
  %tmp14 = load i32* %i, align 4
  %inc = add nsw i32 %tmp14, 1
  store i32 %inc, i32* %i, align 4
  %tobool15 = icmp ne i32 %tmp14, 0
  br i1 %tobool15, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.end13
  %tmp16 = load i32* %j, align 4
  %inc17 = add nsw i32 %tmp16, 1
  store i32 %inc17, i32* %j, align 4
  %tobool18 = icmp ne i32 %tmp16, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.end13
  %0 = phi i1 [ false, %if.end13 ], [ %tobool18, %land.rhs ]
  %land.ext = zext i1 %0 to i32
  store i32 %land.ext, i32* %r, align 4
  %tmp19 = load i32* %i, align 4
  %cmp20 = icmp ne i32 %tmp19, 1
  br i1 %cmp20, label %if.then21, label %if.end28

if.then21:                                        ; preds = %land.end
  store i32 1, i32* %lrc, align 4
  %tmp22 = load i32* %prlc, align 4
  %tobool23 = icmp ne i32 %tmp22, 0
  br i1 %tobool23, label %if.then24, label %if.end27

if.then24:                                        ; preds = %if.then21
  %tmp25 = load i32* %lrc, align 4
  %call26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %tmp25)
  br label %if.end27

if.end27:                                         ; preds = %if.then24, %if.then21
  br label %if.end28

if.end28:                                         ; preds = %if.end27, %land.end
  %tmp29 = load i32* %j, align 4
  %cmp30 = icmp ne i32 %tmp29, 0
  br i1 %cmp30, label %if.then31, label %if.end38

if.then31:                                        ; preds = %if.end28
  store i32 2, i32* %lrc, align 4
  %tmp32 = load i32* %prlc, align 4
  %tobool33 = icmp ne i32 %tmp32, 0
  br i1 %tobool33, label %if.then34, label %if.end37

if.then34:                                        ; preds = %if.then31
  %tmp35 = load i32* %lrc, align 4
  %call36 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %tmp35)
  br label %if.end37

if.end37:                                         ; preds = %if.then34, %if.then31
  br label %if.end38

if.end38:                                         ; preds = %if.end37, %if.end28
  %tmp39 = load i32* %r, align 4
  %cmp40 = icmp ne i32 %tmp39, 0
  br i1 %cmp40, label %if.then41, label %if.end48

if.then41:                                        ; preds = %if.end38
  store i32 3, i32* %lrc, align 4
  %tmp42 = load i32* %prlc, align 4
  %tobool43 = icmp ne i32 %tmp42, 0
  br i1 %tobool43, label %if.then44, label %if.end47

if.then44:                                        ; preds = %if.then41
  %tmp45 = load i32* %lrc, align 4
  %call46 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %tmp45)
  br label %if.end47

if.end47:                                         ; preds = %if.then44, %if.then41
  br label %if.end48

if.end48:                                         ; preds = %if.end47, %if.end38
  %tmp49 = load i32* %i, align 4
  %tobool50 = icmp ne i32 %tmp49, 0
  br i1 %tobool50, label %land.rhs51, label %land.end55

land.rhs51:                                       ; preds = %if.end48
  %tmp52 = load i32* %j, align 4
  %inc53 = add nsw i32 %tmp52, 1
  store i32 %inc53, i32* %j, align 4
  %tobool54 = icmp ne i32 %tmp52, 0
  br label %land.end55

land.end55:                                       ; preds = %land.rhs51, %if.end48
  %1 = phi i1 [ false, %if.end48 ], [ %tobool54, %land.rhs51 ]
  %land.ext56 = zext i1 %1 to i32
  store i32 %land.ext56, i32* %r, align 4
  %tmp57 = load i32* %i, align 4
  %cmp58 = icmp ne i32 %tmp57, 1
  br i1 %cmp58, label %if.then59, label %if.end66

if.then59:                                        ; preds = %land.end55
  store i32 4, i32* %lrc, align 4
  %tmp60 = load i32* %prlc, align 4
  %tobool61 = icmp ne i32 %tmp60, 0
  br i1 %tobool61, label %if.then62, label %if.end65

if.then62:                                        ; preds = %if.then59
  %tmp63 = load i32* %lrc, align 4
  %call64 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %tmp63)
  br label %if.end65

if.end65:                                         ; preds = %if.then62, %if.then59
  br label %if.end66

if.end66:                                         ; preds = %if.end65, %land.end55
  %tmp67 = load i32* %j, align 4
  %cmp68 = icmp ne i32 %tmp67, 1
  br i1 %cmp68, label %if.then69, label %if.end76

if.then69:                                        ; preds = %if.end66
  store i32 5, i32* %lrc, align 4
  %tmp70 = load i32* %prlc, align 4
  %tobool71 = icmp ne i32 %tmp70, 0
  br i1 %tobool71, label %if.then72, label %if.end75

if.then72:                                        ; preds = %if.then69
  %tmp73 = load i32* %lrc, align 4
  %call74 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %tmp73)
  br label %if.end75

if.end75:                                         ; preds = %if.then72, %if.then69
  br label %if.end76

if.end76:                                         ; preds = %if.end75, %if.end66
  %tmp77 = load i32* %r, align 4
  %cmp78 = icmp ne i32 %tmp77, 0
  br i1 %cmp78, label %if.then79, label %if.end86

if.then79:                                        ; preds = %if.end76
  store i32 6, i32* %lrc, align 4
  %tmp80 = load i32* %prlc, align 4
  %tobool81 = icmp ne i32 %tmp80, 0
  br i1 %tobool81, label %if.then82, label %if.end85

if.then82:                                        ; preds = %if.then79
  %tmp83 = load i32* %lrc, align 4
  %call84 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %tmp83)
  br label %if.end85

if.end85:                                         ; preds = %if.then82, %if.then79
  br label %if.end86

if.end86:                                         ; preds = %if.end85, %if.end76
  %tmp87 = load i32* %i, align 4
  %dec = add nsw i32 %tmp87, -1
  store i32 %dec, i32* %i, align 4
  %tobool88 = icmp ne i32 %tmp87, 0
  br i1 %tobool88, label %land.rhs89, label %land.end92

land.rhs89:                                       ; preds = %if.end86
  %tmp90 = load i32* %j, align 4
  %tobool91 = icmp ne i32 %tmp90, 0
  br label %land.end92

land.end92:                                       ; preds = %land.rhs89, %if.end86
  %2 = phi i1 [ false, %if.end86 ], [ %tobool91, %land.rhs89 ]
  %land.ext93 = zext i1 %2 to i32
  store i32 %land.ext93, i32* %r, align 4
  %tmp94 = load i32* %i, align 4
  %cmp95 = icmp ne i32 %tmp94, 0
  br i1 %cmp95, label %if.then96, label %if.end103

if.then96:                                        ; preds = %land.end92
  store i32 7, i32* %lrc, align 4
  %tmp97 = load i32* %prlc, align 4
  %tobool98 = icmp ne i32 %tmp97, 0
  br i1 %tobool98, label %if.then99, label %if.end102

if.then99:                                        ; preds = %if.then96
  %tmp100 = load i32* %lrc, align 4
  %call101 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %tmp100)
  br label %if.end102

if.end102:                                        ; preds = %if.then99, %if.then96
  br label %if.end103

if.end103:                                        ; preds = %if.end102, %land.end92
  %tmp104 = load i32* %j, align 4
  %cmp105 = icmp ne i32 %tmp104, 1
  br i1 %cmp105, label %if.then106, label %if.end113

if.then106:                                       ; preds = %if.end103
  store i32 8, i32* %lrc, align 4
  %tmp107 = load i32* %prlc, align 4
  %tobool108 = icmp ne i32 %tmp107, 0
  br i1 %tobool108, label %if.then109, label %if.end112

if.then109:                                       ; preds = %if.then106
  %tmp110 = load i32* %lrc, align 4
  %call111 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %tmp110)
  br label %if.end112

if.end112:                                        ; preds = %if.then109, %if.then106
  br label %if.end113

if.end113:                                        ; preds = %if.end112, %if.end103
  %tmp114 = load i32* %r, align 4
  %cmp115 = icmp ne i32 %tmp114, 1
  br i1 %cmp115, label %if.then116, label %if.end123

if.then116:                                       ; preds = %if.end113
  store i32 9, i32* %lrc, align 4
  %tmp117 = load i32* %prlc, align 4
  %tobool118 = icmp ne i32 %tmp117, 0
  br i1 %tobool118, label %if.then119, label %if.end122

if.then119:                                       ; preds = %if.then116
  %tmp120 = load i32* %lrc, align 4
  %call121 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %tmp120)
  br label %if.end122

if.end122:                                        ; preds = %if.then119, %if.then116
  br label %if.end123

if.end123:                                        ; preds = %if.end122, %if.end113
  %tmp124 = load i32* %i, align 4
  %tobool125 = icmp ne i32 %tmp124, 0
  br i1 %tobool125, label %land.rhs126, label %land.end130

land.rhs126:                                      ; preds = %if.end123
  %tmp127 = load i32* %j, align 4
  %dec128 = add nsw i32 %tmp127, -1
  store i32 %dec128, i32* %j, align 4
  %tobool129 = icmp ne i32 %tmp127, 0
  br label %land.end130

land.end130:                                      ; preds = %land.rhs126, %if.end123
  %3 = phi i1 [ false, %if.end123 ], [ %tobool129, %land.rhs126 ]
  %land.ext131 = zext i1 %3 to i32
  store i32 %land.ext131, i32* %r, align 4
  %tmp132 = load i32* %i, align 4
  %cmp133 = icmp ne i32 %tmp132, 0
  br i1 %cmp133, label %if.then134, label %if.end141

if.then134:                                       ; preds = %land.end130
  store i32 10, i32* %lrc, align 4
  %tmp135 = load i32* %prlc, align 4
  %tobool136 = icmp ne i32 %tmp135, 0
  br i1 %tobool136, label %if.then137, label %if.end140

if.then137:                                       ; preds = %if.then134
  %tmp138 = load i32* %lrc, align 4
  %call139 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %tmp138)
  br label %if.end140

if.end140:                                        ; preds = %if.then137, %if.then134
  br label %if.end141

if.end141:                                        ; preds = %if.end140, %land.end130
  %tmp142 = load i32* %j, align 4
  %cmp143 = icmp ne i32 %tmp142, 1
  br i1 %cmp143, label %if.then144, label %if.end151

if.then144:                                       ; preds = %if.end141
  store i32 11, i32* %lrc, align 4
  %tmp145 = load i32* %prlc, align 4
  %tobool146 = icmp ne i32 %tmp145, 0
  br i1 %tobool146, label %if.then147, label %if.end150

if.then147:                                       ; preds = %if.then144
  %tmp148 = load i32* %lrc, align 4
  %call149 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %tmp148)
  br label %if.end150

if.end150:                                        ; preds = %if.then147, %if.then144
  br label %if.end151

if.end151:                                        ; preds = %if.end150, %if.end141
  %tmp152 = load i32* %r, align 4
  %cmp153 = icmp ne i32 %tmp152, 0
  br i1 %cmp153, label %if.then154, label %if.end161

if.then154:                                       ; preds = %if.end151
  store i32 12, i32* %lrc, align 4
  %tmp155 = load i32* %prlc, align 4
  %tobool156 = icmp ne i32 %tmp155, 0
  br i1 %tobool156, label %if.then157, label %if.end160

if.then157:                                       ; preds = %if.then154
  %tmp158 = load i32* %lrc, align 4
  %call159 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %tmp158)
  br label %if.end160

if.end160:                                        ; preds = %if.then157, %if.then154
  br label %if.end161

if.end161:                                        ; preds = %if.end160, %if.end151
  %tmp162 = load i32* %lrc, align 4
  %cmp163 = icmp ne i32 %tmp162, 0
  br i1 %cmp163, label %if.then164, label %if.end174

if.then164:                                       ; preds = %if.end161
  %tmp165 = load %struct.defs** %pd0.addr, align 8
  %flgd166 = getelementptr inbounds %struct.defs* %tmp165, i32 0, i32 11
  %tmp167 = load i32* %flgd166, align 4
  %cmp168 = icmp ne i32 %tmp167, 0
  br i1 %cmp168, label %if.then169, label %if.end171

if.then169:                                       ; preds = %if.then164
  %call170 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @sec.s7813er, i32 0, i32 0), i32 2)
  br label %if.end171

if.end171:                                        ; preds = %if.then169, %if.then164
  %tmp172 = load i32* %rc, align 4
  %add173 = add nsw i32 %tmp172, 2
  store i32 %add173, i32* %rc, align 4
  br label %if.end174

if.end174:                                        ; preds = %if.end171, %if.end161
  store i32 0, i32* %lrc, align 4
  store i32 0, i32* %j, align 4
  store i32 0, i32* %i, align 4
  %tmp175 = load i32* %i, align 4
  %inc176 = add nsw i32 %tmp175, 1
  store i32 %inc176, i32* %i, align 4
  %tobool177 = icmp ne i32 %tmp175, 0
  br i1 %tobool177, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.end174
  %tmp178 = load i32* %j, align 4
  %tobool179 = icmp ne i32 %tmp178, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.end174
  %4 = phi i1 [ true, %if.end174 ], [ %tobool179, %lor.rhs ]
  %lor.ext = zext i1 %4 to i32
  store i32 %lor.ext, i32* %r, align 4
  %tmp180 = load i32* %i, align 4
  %cmp181 = icmp ne i32 %tmp180, 1
  br i1 %cmp181, label %if.then182, label %if.end189

if.then182:                                       ; preds = %lor.end
  store i32 1, i32* %lrc, align 4
  %tmp183 = load i32* %prlc, align 4
  %tobool184 = icmp ne i32 %tmp183, 0
  br i1 %tobool184, label %if.then185, label %if.end188

if.then185:                                       ; preds = %if.then182
  %tmp186 = load i32* %lrc, align 4
  %call187 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %tmp186)
  br label %if.end188

if.end188:                                        ; preds = %if.then185, %if.then182
  br label %if.end189

if.end189:                                        ; preds = %if.end188, %lor.end
  %tmp190 = load i32* %j, align 4
  %cmp191 = icmp ne i32 %tmp190, 0
  br i1 %cmp191, label %if.then192, label %if.end199

if.then192:                                       ; preds = %if.end189
  store i32 2, i32* %lrc, align 4
  %tmp193 = load i32* %prlc, align 4
  %tobool194 = icmp ne i32 %tmp193, 0
  br i1 %tobool194, label %if.then195, label %if.end198

if.then195:                                       ; preds = %if.then192
  %tmp196 = load i32* %lrc, align 4
  %call197 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %tmp196)
  br label %if.end198

if.end198:                                        ; preds = %if.then195, %if.then192
  br label %if.end199

if.end199:                                        ; preds = %if.end198, %if.end189
  %tmp200 = load i32* %r, align 4
  %cmp201 = icmp ne i32 %tmp200, 0
  br i1 %cmp201, label %if.then202, label %if.end209

if.then202:                                       ; preds = %if.end199
  store i32 3, i32* %lrc, align 4
  %tmp203 = load i32* %prlc, align 4
  %tobool204 = icmp ne i32 %tmp203, 0
  br i1 %tobool204, label %if.then205, label %if.end208

if.then205:                                       ; preds = %if.then202
  %tmp206 = load i32* %lrc, align 4
  %call207 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %tmp206)
  br label %if.end208

if.end208:                                        ; preds = %if.then205, %if.then202
  br label %if.end209

if.end209:                                        ; preds = %if.end208, %if.end199
  %tmp210 = load i32* %j, align 4
  %inc211 = add nsw i32 %tmp210, 1
  store i32 %inc211, i32* %j, align 4
  %tobool212 = icmp ne i32 %tmp210, 0
  br i1 %tobool212, label %lor.end216, label %lor.rhs213

lor.rhs213:                                       ; preds = %if.end209
  %tmp214 = load i32* %i, align 4
  %tobool215 = icmp ne i32 %tmp214, 0
  br label %lor.end216

lor.end216:                                       ; preds = %lor.rhs213, %if.end209
  %5 = phi i1 [ true, %if.end209 ], [ %tobool215, %lor.rhs213 ]
  %lor.ext217 = zext i1 %5 to i32
  store i32 %lor.ext217, i32* %r, align 4
  %tmp218 = load i32* %i, align 4
  %cmp219 = icmp ne i32 %tmp218, 1
  br i1 %cmp219, label %if.then220, label %if.end227

if.then220:                                       ; preds = %lor.end216
  store i32 4, i32* %lrc, align 4
  %tmp221 = load i32* %prlc, align 4
  %tobool222 = icmp ne i32 %tmp221, 0
  br i1 %tobool222, label %if.then223, label %if.end226

if.then223:                                       ; preds = %if.then220
  %tmp224 = load i32* %lrc, align 4
  %call225 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %tmp224)
  br label %if.end226

if.end226:                                        ; preds = %if.then223, %if.then220
  br label %if.end227

if.end227:                                        ; preds = %if.end226, %lor.end216
  %tmp228 = load i32* %j, align 4
  %cmp229 = icmp ne i32 %tmp228, 1
  br i1 %cmp229, label %if.then230, label %if.end237

if.then230:                                       ; preds = %if.end227
  store i32 5, i32* %lrc, align 4
  %tmp231 = load i32* %prlc, align 4
  %tobool232 = icmp ne i32 %tmp231, 0
  br i1 %tobool232, label %if.then233, label %if.end236

if.then233:                                       ; preds = %if.then230
  %tmp234 = load i32* %lrc, align 4
  %call235 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %tmp234)
  br label %if.end236

if.end236:                                        ; preds = %if.then233, %if.then230
  br label %if.end237

if.end237:                                        ; preds = %if.end236, %if.end227
  %tmp238 = load i32* %r, align 4
  %cmp239 = icmp ne i32 %tmp238, 1
  br i1 %cmp239, label %if.then240, label %if.end247

if.then240:                                       ; preds = %if.end237
  store i32 6, i32* %lrc, align 4
  %tmp241 = load i32* %prlc, align 4
  %tobool242 = icmp ne i32 %tmp241, 0
  br i1 %tobool242, label %if.then243, label %if.end246

if.then243:                                       ; preds = %if.then240
  %tmp244 = load i32* %lrc, align 4
  %call245 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %tmp244)
  br label %if.end246

if.end246:                                        ; preds = %if.then243, %if.then240
  br label %if.end247

if.end247:                                        ; preds = %if.end246, %if.end237
  %tmp248 = load i32* %i, align 4
  %dec249 = add nsw i32 %tmp248, -1
  store i32 %dec249, i32* %i, align 4
  %tobool250 = icmp ne i32 %tmp248, 0
  br i1 %tobool250, label %lor.end255, label %lor.rhs251

lor.rhs251:                                       ; preds = %if.end247
  %tmp252 = load i32* %j, align 4
  %dec253 = add nsw i32 %tmp252, -1
  store i32 %dec253, i32* %j, align 4
  %tobool254 = icmp ne i32 %tmp252, 0
  br label %lor.end255

lor.end255:                                       ; preds = %lor.rhs251, %if.end247
  %6 = phi i1 [ true, %if.end247 ], [ %tobool254, %lor.rhs251 ]
  %lor.ext256 = zext i1 %6 to i32
  store i32 %lor.ext256, i32* %r, align 4
  %tmp257 = load i32* %i, align 4
  %cmp258 = icmp ne i32 %tmp257, 0
  br i1 %cmp258, label %if.then259, label %if.end266

if.then259:                                       ; preds = %lor.end255
  store i32 7, i32* %lrc, align 4
  %tmp260 = load i32* %prlc, align 4
  %tobool261 = icmp ne i32 %tmp260, 0
  br i1 %tobool261, label %if.then262, label %if.end265

if.then262:                                       ; preds = %if.then259
  %tmp263 = load i32* %lrc, align 4
  %call264 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %tmp263)
  br label %if.end265

if.end265:                                        ; preds = %if.then262, %if.then259
  br label %if.end266

if.end266:                                        ; preds = %if.end265, %lor.end255
  %tmp267 = load i32* %j, align 4
  %cmp268 = icmp ne i32 %tmp267, 1
  br i1 %cmp268, label %if.then269, label %if.end276

if.then269:                                       ; preds = %if.end266
  store i32 8, i32* %lrc, align 4
  %tmp270 = load i32* %prlc, align 4
  %tobool271 = icmp ne i32 %tmp270, 0
  br i1 %tobool271, label %if.then272, label %if.end275

if.then272:                                       ; preds = %if.then269
  %tmp273 = load i32* %lrc, align 4
  %call274 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %tmp273)
  br label %if.end275

if.end275:                                        ; preds = %if.then272, %if.then269
  br label %if.end276

if.end276:                                        ; preds = %if.end275, %if.end266
  %tmp277 = load i32* %r, align 4
  %cmp278 = icmp ne i32 %tmp277, 1
  br i1 %cmp278, label %if.then279, label %if.end286

if.then279:                                       ; preds = %if.end276
  store i32 9, i32* %lrc, align 4
  %tmp280 = load i32* %prlc, align 4
  %tobool281 = icmp ne i32 %tmp280, 0
  br i1 %tobool281, label %if.then282, label %if.end285

if.then282:                                       ; preds = %if.then279
  %tmp283 = load i32* %lrc, align 4
  %call284 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %tmp283)
  br label %if.end285

if.end285:                                        ; preds = %if.then282, %if.then279
  br label %if.end286

if.end286:                                        ; preds = %if.end285, %if.end276
  %tmp287 = load i32* %i, align 4
  %tobool288 = icmp ne i32 %tmp287, 0
  br i1 %tobool288, label %lor.end293, label %lor.rhs289

lor.rhs289:                                       ; preds = %if.end286
  %tmp290 = load i32* %j, align 4
  %dec291 = add nsw i32 %tmp290, -1
  store i32 %dec291, i32* %j, align 4
  %tobool292 = icmp ne i32 %tmp290, 0
  br label %lor.end293

lor.end293:                                       ; preds = %lor.rhs289, %if.end286
  %7 = phi i1 [ true, %if.end286 ], [ %tobool292, %lor.rhs289 ]
  %lor.ext294 = zext i1 %7 to i32
  store i32 %lor.ext294, i32* %r, align 4
  %tmp295 = load i32* %i, align 4
  %cmp296 = icmp ne i32 %tmp295, 0
  br i1 %cmp296, label %if.then297, label %if.end304

if.then297:                                       ; preds = %lor.end293
  store i32 10, i32* %lrc, align 4
  %tmp298 = load i32* %prlc, align 4
  %tobool299 = icmp ne i32 %tmp298, 0
  br i1 %tobool299, label %if.then300, label %if.end303

if.then300:                                       ; preds = %if.then297
  %tmp301 = load i32* %lrc, align 4
  %call302 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %tmp301)
  br label %if.end303

if.end303:                                        ; preds = %if.then300, %if.then297
  br label %if.end304

if.end304:                                        ; preds = %if.end303, %lor.end293
  %tmp305 = load i32* %j, align 4
  %cmp306 = icmp ne i32 %tmp305, 0
  br i1 %cmp306, label %if.then307, label %if.end314

if.then307:                                       ; preds = %if.end304
  store i32 11, i32* %lrc, align 4
  %tmp308 = load i32* %prlc, align 4
  %tobool309 = icmp ne i32 %tmp308, 0
  br i1 %tobool309, label %if.then310, label %if.end313

if.then310:                                       ; preds = %if.then307
  %tmp311 = load i32* %lrc, align 4
  %call312 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %tmp311)
  br label %if.end313

if.end313:                                        ; preds = %if.then310, %if.then307
  br label %if.end314

if.end314:                                        ; preds = %if.end313, %if.end304
  %tmp315 = load i32* %r, align 4
  %cmp316 = icmp ne i32 %tmp315, 1
  br i1 %cmp316, label %if.then317, label %if.end324

if.then317:                                       ; preds = %if.end314
  store i32 12, i32* %lrc, align 4
  %tmp318 = load i32* %prlc, align 4
  %tobool319 = icmp ne i32 %tmp318, 0
  br i1 %tobool319, label %if.then320, label %if.end323

if.then320:                                       ; preds = %if.then317
  %tmp321 = load i32* %lrc, align 4
  %call322 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %tmp321)
  br label %if.end323

if.end323:                                        ; preds = %if.then320, %if.then317
  br label %if.end324

if.end324:                                        ; preds = %if.end323, %if.end314
  %tmp325 = load i32* %lrc, align 4
  %cmp326 = icmp ne i32 %tmp325, 0
  br i1 %cmp326, label %if.then327, label %if.end337

if.then327:                                       ; preds = %if.end324
  %tmp328 = load %struct.defs** %pd0.addr, align 8
  %flgd329 = getelementptr inbounds %struct.defs* %tmp328, i32 0, i32 11
  %tmp330 = load i32* %flgd329, align 4
  %cmp331 = icmp ne i32 %tmp330, 0
  br i1 %cmp331, label %if.then332, label %if.end334

if.then332:                                       ; preds = %if.then327
  %call333 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @sec.s7813er, i32 0, i32 0), i32 4)
  br label %if.end334

if.end334:                                        ; preds = %if.then332, %if.then327
  %tmp335 = load i32* %rc, align 4
  %add336 = add nsw i32 %tmp335, 4
  store i32 %add336, i32* %rc, align 4
  br label %if.end337

if.end337:                                        ; preds = %if.end334, %if.end324
  store i32 0, i32* %j, align 4
  store i32 0, i32* %i, align 4
  store i32 0, i32* %zero, align 4
  store i32 1, i32* %one, align 4
  %tmp338 = load i32* %one, align 4
  %tobool339 = icmp ne i32 %tmp338, 0
  br i1 %tobool339, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end337
  %tmp340 = load i32* %zero, align 4
  br label %cond.end349

cond.false:                                       ; preds = %if.end337
  %tmp341 = load i32* %one, align 4
  %tobool342 = icmp ne i32 %tmp341, 0
  br i1 %tobool342, label %cond.true343, label %cond.false346

cond.true343:                                     ; preds = %cond.false
  %tmp344 = load i32* %i, align 4
  %inc345 = add nsw i32 %tmp344, 1
  store i32 %inc345, i32* %i, align 4
  br label %cond.end

cond.false346:                                    ; preds = %cond.false
  %tmp347 = load i32* %j, align 4
  %inc348 = add nsw i32 %tmp347, 1
  store i32 %inc348, i32* %j, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false346, %cond.true343
  %cond = phi i32 [ %tmp344, %cond.true343 ], [ %tmp347, %cond.false346 ]
  br label %cond.end349

cond.end349:                                      ; preds = %cond.end, %cond.true
  %cond350 = phi i32 [ %tmp340, %cond.true ], [ %cond, %cond.end ]
  store i32 %cond350, i32* %r, align 4
  %tmp351 = load i32* %r, align 4
  %cmp352 = icmp ne i32 %tmp351, 0
  br i1 %cmp352, label %if.then358, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %cond.end349
  %tmp353 = load i32* %i, align 4
  %cmp354 = icmp ne i32 %tmp353, 0
  br i1 %cmp354, label %if.then358, label %lor.lhs.false355

lor.lhs.false355:                                 ; preds = %lor.lhs.false
  %tmp356 = load i32* %j, align 4
  %cmp357 = icmp ne i32 %tmp356, 0
  br i1 %cmp357, label %if.then358, label %if.end368

if.then358:                                       ; preds = %lor.lhs.false355, %lor.lhs.false, %cond.end349
  %tmp359 = load %struct.defs** %pd0.addr, align 8
  %flgd360 = getelementptr inbounds %struct.defs* %tmp359, i32 0, i32 11
  %tmp361 = load i32* %flgd360, align 4
  %cmp362 = icmp ne i32 %tmp361, 0
  br i1 %cmp362, label %if.then363, label %if.end365

if.then363:                                       ; preds = %if.then358
  %call364 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @sec.s7813er, i32 0, i32 0), i32 8)
  br label %if.end365

if.end365:                                        ; preds = %if.then363, %if.then358
  %tmp366 = load i32* %rc, align 4
  %add367 = add nsw i32 %tmp366, 8
  store i32 %add367, i32* %rc, align 4
  br label %if.end368

if.end368:                                        ; preds = %if.end365, %lor.lhs.false355
  %tmp369 = load i32* %one, align 4
  %tobool370 = icmp ne i32 %tmp369, 0
  br i1 %tobool370, label %cond.true371, label %cond.false373

cond.true371:                                     ; preds = %if.end368
  %tmp372 = load i32* %zero, align 4
  br label %cond.end374

cond.false373:                                    ; preds = %if.end368
  br label %cond.end374

cond.end374:                                      ; preds = %cond.false373, %cond.true371
  %cond375 = phi i32 [ %tmp372, %cond.true371 ], [ 1, %cond.false373 ]
  %cmp376 = icmp ne i32 %cond375, 0
  br i1 %cmp376, label %if.then386, label %lor.lhs.false377

lor.lhs.false377:                                 ; preds = %cond.end374
  %tmp378 = load i32* %zero, align 4
  %tobool379 = icmp ne i32 %tmp378, 0
  br i1 %tobool379, label %cond.true380, label %cond.false381

cond.true380:                                     ; preds = %lor.lhs.false377
  br label %cond.end383

cond.false381:                                    ; preds = %lor.lhs.false377
  %tmp382 = load i32* %zero, align 4
  br label %cond.end383

cond.end383:                                      ; preds = %cond.false381, %cond.true380
  %cond384 = phi i32 [ 1, %cond.true380 ], [ %tmp382, %cond.false381 ]
  %cmp385 = icmp ne i32 %cond384, 0
  br i1 %cmp385, label %if.then386, label %if.end396

if.then386:                                       ; preds = %cond.end383, %cond.end374
  %tmp387 = load %struct.defs** %pd0.addr, align 8
  %flgd388 = getelementptr inbounds %struct.defs* %tmp387, i32 0, i32 11
  %tmp389 = load i32* %flgd388, align 4
  %cmp390 = icmp ne i32 %tmp389, 0
  br i1 %cmp390, label %if.then391, label %if.end393

if.then391:                                       ; preds = %if.then386
  %call392 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @sec.s7813er, i32 0, i32 0), i32 16)
  br label %if.end393

if.end393:                                        ; preds = %if.then391, %if.then386
  %tmp394 = load i32* %rc, align 4
  %add395 = add nsw i32 %tmp394, 16
  store i32 %add395, i32* %rc, align 4
  br label %if.end396

if.end396:                                        ; preds = %if.end393, %cond.end383
  %tmp397 = load i32* %rc, align 4
  ret i32 %tmp397
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
