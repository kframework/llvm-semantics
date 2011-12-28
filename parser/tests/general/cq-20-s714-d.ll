; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/cq-20-s714-d.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.defs = type { i32, i32, i32, i32, i32, i32, i32, float, float, i32, i32, i32, i32, i32, i32, [8 x i8] }

@setupTable.qs26 = internal global [8 x i8] c"s26    \00", align 1
@setupTable.s = internal global [18 x i8] c"%3d bits in %ss.\0A\00", align 16
@setupTable.s2 = internal global [54 x i8] c"%f is the least number that can be added to 1. (%s).\0A\00", align 16
@svtest.k = internal global i32 0, align 4
@zero.k = internal global i32 0, align 4
@extvar = common global i32 0, align 4
@sec.f = internal global [17 x i8] c"Local error %d.\0A\00", align 16
@sec.s714er = internal global [11 x i8] c"s714,er%d\0A\00", align 1
@sec.qs714 = internal global [8 x i8] c"s714   \00", align 1
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
  %rc = alloca i32, align 4
  %cl = alloca i8, align 1
  %cr = alloca i8, align 1
  %sl = alloca i16, align 2
  %sr = alloca i16, align 2
  %il = alloca i32, align 4
  %ir = alloca i32, align 4
  %ll = alloca i64, align 8
  %lr = alloca i64, align 8
  %ul = alloca i32, align 4
  %ur = alloca i32, align 4
  %fl = alloca float, align 4
  %fr = alloca float, align 4
  %dl = alloca double, align 8
  %dr = alloca double, align 8
  %ps = alloca i8*, align 8
  %pt = alloca i8*, align 8
  store %struct.defs* %pd0, %struct.defs** %pd0.addr, align 8
  store i8* getelementptr inbounds ([8 x i8]* @sec.qs714, i32 0, i32 0), i8** %ps, align 8
  %tmp = load %struct.defs** %pd0.addr, align 8
  %rfs = getelementptr inbounds %struct.defs* %tmp, i32 0, i32 15
  %arraydecay = getelementptr inbounds [8 x i8]* %rfs, i32 0, i32 0
  store i8* %arraydecay, i8** %pt, align 8
  store i32 0, i32* %rc, align 4
  store i32 0, i32* %lrc, align 4
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
  store i8 5, i8* %cl, align 1
  store i64 2, i64* %lr, align 8
  %tmp7 = load i64* %lr, align 8
  %tmp8 = load i8* %cl, align 1
  %conv = sext i8 %tmp8 to i64
  %mul = mul nsw i64 %conv, %tmp7
  %conv9 = trunc i64 %mul to i8
  store i8 %conv9, i8* %cl, align 1
  %tmp10 = load i8* %cl, align 1
  %conv11 = sext i8 %tmp10 to i32
  %cmp = icmp ne i32 %conv11, 10
  br i1 %cmp, label %if.then, label %if.end17

if.then:                                          ; preds = %while.end
  store i32 151, i32* %lrc, align 4
  %tmp13 = load i32* %prlc, align 4
  %tobool14 = icmp ne i32 %tmp13, 0
  br i1 %tobool14, label %if.then15, label %if.end

if.then15:                                        ; preds = %if.then
  %tmp16 = load i32* %lrc, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp16)
  br label %if.end

if.end:                                           ; preds = %if.then15, %if.then
  br label %if.end17

if.end17:                                         ; preds = %if.end, %while.end
  store i8 5, i8* %cl, align 1
  store i32 2, i32* %ur, align 4
  %tmp18 = load i32* %ur, align 4
  %tmp19 = load i8* %cl, align 1
  %conv20 = sext i8 %tmp19 to i32
  %mul21 = mul i32 %conv20, %tmp18
  %conv22 = trunc i32 %mul21 to i8
  store i8 %conv22, i8* %cl, align 1
  %tmp23 = load i8* %cl, align 1
  %conv24 = sext i8 %tmp23 to i32
  %cmp25 = icmp ne i32 %conv24, 10
  br i1 %cmp25, label %if.then27, label %if.end34

if.then27:                                        ; preds = %if.end17
  store i32 152, i32* %lrc, align 4
  %tmp28 = load i32* %prlc, align 4
  %tobool29 = icmp ne i32 %tmp28, 0
  br i1 %tobool29, label %if.then30, label %if.end33

if.then30:                                        ; preds = %if.then27
  %tmp31 = load i32* %lrc, align 4
  %call32 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp31)
  br label %if.end33

if.end33:                                         ; preds = %if.then30, %if.then27
  br label %if.end34

if.end34:                                         ; preds = %if.end33, %if.end17
  store i8 5, i8* %cl, align 1
  store float 2.000000e+00, float* %fr, align 4
  %tmp35 = load float* %fr, align 4
  %tmp36 = load i8* %cl, align 1
  %conv37 = sitofp i8 %tmp36 to float
  %mul38 = fmul float %conv37, %tmp35
  %conv39 = fptosi float %mul38 to i8
  store i8 %conv39, i8* %cl, align 1
  %tmp40 = load i8* %cl, align 1
  %conv41 = sext i8 %tmp40 to i32
  %cmp42 = icmp ne i32 %conv41, 10
  br i1 %cmp42, label %if.then44, label %if.end51

if.then44:                                        ; preds = %if.end34
  store i32 153, i32* %lrc, align 4
  %tmp45 = load i32* %prlc, align 4
  %tobool46 = icmp ne i32 %tmp45, 0
  br i1 %tobool46, label %if.then47, label %if.end50

if.then47:                                        ; preds = %if.then44
  %tmp48 = load i32* %lrc, align 4
  %call49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp48)
  br label %if.end50

if.end50:                                         ; preds = %if.then47, %if.then44
  br label %if.end51

if.end51:                                         ; preds = %if.end50, %if.end34
  store i8 5, i8* %cl, align 1
  store double 2.000000e+00, double* %dr, align 8
  %tmp52 = load double* %dr, align 8
  %tmp53 = load i8* %cl, align 1
  %conv54 = sitofp i8 %tmp53 to double
  %mul55 = fmul double %conv54, %tmp52
  %conv56 = fptosi double %mul55 to i8
  store i8 %conv56, i8* %cl, align 1
  %tmp57 = load i8* %cl, align 1
  %conv58 = sext i8 %tmp57 to i32
  %cmp59 = icmp ne i32 %conv58, 10
  br i1 %cmp59, label %if.then61, label %if.end68

if.then61:                                        ; preds = %if.end51
  store i32 154, i32* %lrc, align 4
  %tmp62 = load i32* %prlc, align 4
  %tobool63 = icmp ne i32 %tmp62, 0
  br i1 %tobool63, label %if.then64, label %if.end67

if.then64:                                        ; preds = %if.then61
  %tmp65 = load i32* %lrc, align 4
  %call66 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp65)
  br label %if.end67

if.end67:                                         ; preds = %if.then64, %if.then61
  br label %if.end68

if.end68:                                         ; preds = %if.end67, %if.end51
  store i16 5, i16* %sl, align 2
  store i8 2, i8* %cr, align 1
  %tmp69 = load i8* %cr, align 1
  %conv70 = sext i8 %tmp69 to i32
  %tmp71 = load i16* %sl, align 2
  %conv72 = sext i16 %tmp71 to i32
  %mul73 = mul nsw i32 %conv72, %conv70
  %conv74 = trunc i32 %mul73 to i16
  store i16 %conv74, i16* %sl, align 2
  %tmp75 = load i16* %sl, align 2
  %conv76 = sext i16 %tmp75 to i32
  %cmp77 = icmp ne i32 %conv76, 10
  br i1 %cmp77, label %if.then79, label %if.end86

if.then79:                                        ; preds = %if.end68
  store i32 155, i32* %lrc, align 4
  %tmp80 = load i32* %prlc, align 4
  %tobool81 = icmp ne i32 %tmp80, 0
  br i1 %tobool81, label %if.then82, label %if.end85

if.then82:                                        ; preds = %if.then79
  %tmp83 = load i32* %lrc, align 4
  %call84 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp83)
  br label %if.end85

if.end85:                                         ; preds = %if.then82, %if.then79
  br label %if.end86

if.end86:                                         ; preds = %if.end85, %if.end68
  store i16 5, i16* %sl, align 2
  store i16 2, i16* %sr, align 2
  %tmp87 = load i16* %sr, align 2
  %conv88 = sext i16 %tmp87 to i32
  %tmp89 = load i16* %sl, align 2
  %conv90 = sext i16 %tmp89 to i32
  %mul91 = mul nsw i32 %conv90, %conv88
  %conv92 = trunc i32 %mul91 to i16
  store i16 %conv92, i16* %sl, align 2
  %tmp93 = load i16* %sl, align 2
  %conv94 = sext i16 %tmp93 to i32
  %cmp95 = icmp ne i32 %conv94, 10
  br i1 %cmp95, label %if.then97, label %if.end104

if.then97:                                        ; preds = %if.end86
  store i32 156, i32* %lrc, align 4
  %tmp98 = load i32* %prlc, align 4
  %tobool99 = icmp ne i32 %tmp98, 0
  br i1 %tobool99, label %if.then100, label %if.end103

if.then100:                                       ; preds = %if.then97
  %tmp101 = load i32* %lrc, align 4
  %call102 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp101)
  br label %if.end103

if.end103:                                        ; preds = %if.then100, %if.then97
  br label %if.end104

if.end104:                                        ; preds = %if.end103, %if.end86
  store i16 5, i16* %sl, align 2
  store i32 2, i32* %ir, align 4
  %tmp105 = load i32* %ir, align 4
  %tmp106 = load i16* %sl, align 2
  %conv107 = sext i16 %tmp106 to i32
  %mul108 = mul nsw i32 %conv107, %tmp105
  %conv109 = trunc i32 %mul108 to i16
  store i16 %conv109, i16* %sl, align 2
  %tmp110 = load i16* %sl, align 2
  %conv111 = sext i16 %tmp110 to i32
  %cmp112 = icmp ne i32 %conv111, 10
  br i1 %cmp112, label %if.then114, label %if.end121

if.then114:                                       ; preds = %if.end104
  store i32 157, i32* %lrc, align 4
  %tmp115 = load i32* %prlc, align 4
  %tobool116 = icmp ne i32 %tmp115, 0
  br i1 %tobool116, label %if.then117, label %if.end120

if.then117:                                       ; preds = %if.then114
  %tmp118 = load i32* %lrc, align 4
  %call119 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp118)
  br label %if.end120

if.end120:                                        ; preds = %if.then117, %if.then114
  br label %if.end121

if.end121:                                        ; preds = %if.end120, %if.end104
  store i16 5, i16* %sl, align 2
  store i64 2, i64* %lr, align 8
  %tmp122 = load i64* %lr, align 8
  %tmp123 = load i16* %sl, align 2
  %conv124 = sext i16 %tmp123 to i64
  %mul125 = mul nsw i64 %conv124, %tmp122
  %conv126 = trunc i64 %mul125 to i16
  store i16 %conv126, i16* %sl, align 2
  %tmp127 = load i16* %sl, align 2
  %conv128 = sext i16 %tmp127 to i32
  %cmp129 = icmp ne i32 %conv128, 10
  br i1 %cmp129, label %if.then131, label %if.end138

if.then131:                                       ; preds = %if.end121
  store i32 158, i32* %lrc, align 4
  %tmp132 = load i32* %prlc, align 4
  %tobool133 = icmp ne i32 %tmp132, 0
  br i1 %tobool133, label %if.then134, label %if.end137

if.then134:                                       ; preds = %if.then131
  %tmp135 = load i32* %lrc, align 4
  %call136 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp135)
  br label %if.end137

if.end137:                                        ; preds = %if.then134, %if.then131
  br label %if.end138

if.end138:                                        ; preds = %if.end137, %if.end121
  store i16 5, i16* %sl, align 2
  store i32 2, i32* %ur, align 4
  %tmp139 = load i32* %ur, align 4
  %tmp140 = load i16* %sl, align 2
  %conv141 = sext i16 %tmp140 to i32
  %mul142 = mul i32 %conv141, %tmp139
  %conv143 = trunc i32 %mul142 to i16
  store i16 %conv143, i16* %sl, align 2
  %tmp144 = load i16* %sl, align 2
  %conv145 = sext i16 %tmp144 to i32
  %cmp146 = icmp ne i32 %conv145, 10
  br i1 %cmp146, label %if.then148, label %if.end155

if.then148:                                       ; preds = %if.end138
  store i32 159, i32* %lrc, align 4
  %tmp149 = load i32* %prlc, align 4
  %tobool150 = icmp ne i32 %tmp149, 0
  br i1 %tobool150, label %if.then151, label %if.end154

if.then151:                                       ; preds = %if.then148
  %tmp152 = load i32* %lrc, align 4
  %call153 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp152)
  br label %if.end154

if.end154:                                        ; preds = %if.then151, %if.then148
  br label %if.end155

if.end155:                                        ; preds = %if.end154, %if.end138
  store i16 5, i16* %sl, align 2
  store float 2.000000e+00, float* %fr, align 4
  %tmp156 = load float* %fr, align 4
  %tmp157 = load i16* %sl, align 2
  %conv158 = sitofp i16 %tmp157 to float
  %mul159 = fmul float %conv158, %tmp156
  %conv160 = fptosi float %mul159 to i16
  store i16 %conv160, i16* %sl, align 2
  %tmp161 = load i16* %sl, align 2
  %conv162 = sext i16 %tmp161 to i32
  %cmp163 = icmp ne i32 %conv162, 10
  br i1 %cmp163, label %if.then165, label %if.end172

if.then165:                                       ; preds = %if.end155
  store i32 160, i32* %lrc, align 4
  %tmp166 = load i32* %prlc, align 4
  %tobool167 = icmp ne i32 %tmp166, 0
  br i1 %tobool167, label %if.then168, label %if.end171

if.then168:                                       ; preds = %if.then165
  %tmp169 = load i32* %lrc, align 4
  %call170 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp169)
  br label %if.end171

if.end171:                                        ; preds = %if.then168, %if.then165
  br label %if.end172

if.end172:                                        ; preds = %if.end171, %if.end155
  store i16 5, i16* %sl, align 2
  store double 2.000000e+00, double* %dr, align 8
  %tmp173 = load double* %dr, align 8
  %tmp174 = load i16* %sl, align 2
  %conv175 = sitofp i16 %tmp174 to double
  %mul176 = fmul double %conv175, %tmp173
  %conv177 = fptosi double %mul176 to i16
  store i16 %conv177, i16* %sl, align 2
  %tmp178 = load i16* %sl, align 2
  %conv179 = sext i16 %tmp178 to i32
  %cmp180 = icmp ne i32 %conv179, 10
  br i1 %cmp180, label %if.then182, label %if.end189

if.then182:                                       ; preds = %if.end172
  store i32 161, i32* %lrc, align 4
  %tmp183 = load i32* %prlc, align 4
  %tobool184 = icmp ne i32 %tmp183, 0
  br i1 %tobool184, label %if.then185, label %if.end188

if.then185:                                       ; preds = %if.then182
  %tmp186 = load i32* %lrc, align 4
  %call187 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp186)
  br label %if.end188

if.end188:                                        ; preds = %if.then185, %if.then182
  br label %if.end189

if.end189:                                        ; preds = %if.end188, %if.end172
  store i32 5, i32* %il, align 4
  store i8 2, i8* %cr, align 1
  %tmp190 = load i8* %cr, align 1
  %conv191 = sext i8 %tmp190 to i32
  %tmp192 = load i32* %il, align 4
  %mul193 = mul nsw i32 %tmp192, %conv191
  store i32 %mul193, i32* %il, align 4
  %tmp194 = load i32* %il, align 4
  %cmp195 = icmp ne i32 %tmp194, 10
  br i1 %cmp195, label %if.then197, label %if.end204

if.then197:                                       ; preds = %if.end189
  store i32 162, i32* %lrc, align 4
  %tmp198 = load i32* %prlc, align 4
  %tobool199 = icmp ne i32 %tmp198, 0
  br i1 %tobool199, label %if.then200, label %if.end203

if.then200:                                       ; preds = %if.then197
  %tmp201 = load i32* %lrc, align 4
  %call202 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp201)
  br label %if.end203

if.end203:                                        ; preds = %if.then200, %if.then197
  br label %if.end204

if.end204:                                        ; preds = %if.end203, %if.end189
  store i32 5, i32* %il, align 4
  store i16 2, i16* %sr, align 2
  %tmp205 = load i16* %sr, align 2
  %conv206 = sext i16 %tmp205 to i32
  %tmp207 = load i32* %il, align 4
  %mul208 = mul nsw i32 %tmp207, %conv206
  store i32 %mul208, i32* %il, align 4
  %tmp209 = load i32* %il, align 4
  %cmp210 = icmp ne i32 %tmp209, 10
  br i1 %cmp210, label %if.then212, label %if.end219

if.then212:                                       ; preds = %if.end204
  store i32 163, i32* %lrc, align 4
  %tmp213 = load i32* %prlc, align 4
  %tobool214 = icmp ne i32 %tmp213, 0
  br i1 %tobool214, label %if.then215, label %if.end218

if.then215:                                       ; preds = %if.then212
  %tmp216 = load i32* %lrc, align 4
  %call217 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp216)
  br label %if.end218

if.end218:                                        ; preds = %if.then215, %if.then212
  br label %if.end219

if.end219:                                        ; preds = %if.end218, %if.end204
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ir, align 4
  %tmp220 = load i32* %ir, align 4
  %tmp221 = load i32* %il, align 4
  %mul222 = mul nsw i32 %tmp221, %tmp220
  store i32 %mul222, i32* %il, align 4
  %tmp223 = load i32* %il, align 4
  %cmp224 = icmp ne i32 %tmp223, 10
  br i1 %cmp224, label %if.then226, label %if.end233

if.then226:                                       ; preds = %if.end219
  store i32 164, i32* %lrc, align 4
  %tmp227 = load i32* %prlc, align 4
  %tobool228 = icmp ne i32 %tmp227, 0
  br i1 %tobool228, label %if.then229, label %if.end232

if.then229:                                       ; preds = %if.then226
  %tmp230 = load i32* %lrc, align 4
  %call231 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp230)
  br label %if.end232

if.end232:                                        ; preds = %if.then229, %if.then226
  br label %if.end233

if.end233:                                        ; preds = %if.end232, %if.end219
  store i32 5, i32* %il, align 4
  store i64 2, i64* %lr, align 8
  %tmp234 = load i64* %lr, align 8
  %tmp235 = load i32* %il, align 4
  %conv236 = sext i32 %tmp235 to i64
  %mul237 = mul nsw i64 %conv236, %tmp234
  %conv238 = trunc i64 %mul237 to i32
  store i32 %conv238, i32* %il, align 4
  %tmp239 = load i32* %il, align 4
  %cmp240 = icmp ne i32 %tmp239, 10
  br i1 %cmp240, label %if.then242, label %if.end249

if.then242:                                       ; preds = %if.end233
  store i32 165, i32* %lrc, align 4
  %tmp243 = load i32* %prlc, align 4
  %tobool244 = icmp ne i32 %tmp243, 0
  br i1 %tobool244, label %if.then245, label %if.end248

if.then245:                                       ; preds = %if.then242
  %tmp246 = load i32* %lrc, align 4
  %call247 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp246)
  br label %if.end248

if.end248:                                        ; preds = %if.then245, %if.then242
  br label %if.end249

if.end249:                                        ; preds = %if.end248, %if.end233
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ur, align 4
  %tmp250 = load i32* %ur, align 4
  %tmp251 = load i32* %il, align 4
  %mul252 = mul i32 %tmp251, %tmp250
  store i32 %mul252, i32* %il, align 4
  %tmp253 = load i32* %il, align 4
  %cmp254 = icmp ne i32 %tmp253, 10
  br i1 %cmp254, label %if.then256, label %if.end263

if.then256:                                       ; preds = %if.end249
  store i32 166, i32* %lrc, align 4
  %tmp257 = load i32* %prlc, align 4
  %tobool258 = icmp ne i32 %tmp257, 0
  br i1 %tobool258, label %if.then259, label %if.end262

if.then259:                                       ; preds = %if.then256
  %tmp260 = load i32* %lrc, align 4
  %call261 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp260)
  br label %if.end262

if.end262:                                        ; preds = %if.then259, %if.then256
  br label %if.end263

if.end263:                                        ; preds = %if.end262, %if.end249
  store i32 5, i32* %il, align 4
  store float 2.000000e+00, float* %fr, align 4
  %tmp264 = load float* %fr, align 4
  %tmp265 = load i32* %il, align 4
  %conv266 = sitofp i32 %tmp265 to float
  %mul267 = fmul float %conv266, %tmp264
  %conv268 = fptosi float %mul267 to i32
  store i32 %conv268, i32* %il, align 4
  %tmp269 = load i32* %il, align 4
  %cmp270 = icmp ne i32 %tmp269, 10
  br i1 %cmp270, label %if.then272, label %if.end279

if.then272:                                       ; preds = %if.end263
  store i32 167, i32* %lrc, align 4
  %tmp273 = load i32* %prlc, align 4
  %tobool274 = icmp ne i32 %tmp273, 0
  br i1 %tobool274, label %if.then275, label %if.end278

if.then275:                                       ; preds = %if.then272
  %tmp276 = load i32* %lrc, align 4
  %call277 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp276)
  br label %if.end278

if.end278:                                        ; preds = %if.then275, %if.then272
  br label %if.end279

if.end279:                                        ; preds = %if.end278, %if.end263
  store i32 5, i32* %il, align 4
  store double 2.000000e+00, double* %dr, align 8
  %tmp280 = load double* %dr, align 8
  %tmp281 = load i32* %il, align 4
  %conv282 = sitofp i32 %tmp281 to double
  %mul283 = fmul double %conv282, %tmp280
  %conv284 = fptosi double %mul283 to i32
  store i32 %conv284, i32* %il, align 4
  %tmp285 = load i32* %il, align 4
  %cmp286 = icmp ne i32 %tmp285, 10
  br i1 %cmp286, label %if.then288, label %if.end295

if.then288:                                       ; preds = %if.end279
  store i32 168, i32* %lrc, align 4
  %tmp289 = load i32* %prlc, align 4
  %tobool290 = icmp ne i32 %tmp289, 0
  br i1 %tobool290, label %if.then291, label %if.end294

if.then291:                                       ; preds = %if.then288
  %tmp292 = load i32* %lrc, align 4
  %call293 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp292)
  br label %if.end294

if.end294:                                        ; preds = %if.then291, %if.then288
  br label %if.end295

if.end295:                                        ; preds = %if.end294, %if.end279
  store i64 5, i64* %ll, align 8
  store i8 2, i8* %cr, align 1
  %tmp296 = load i8* %cr, align 1
  %conv297 = sext i8 %tmp296 to i64
  %tmp298 = load i64* %ll, align 8
  %mul299 = mul nsw i64 %tmp298, %conv297
  store i64 %mul299, i64* %ll, align 8
  %tmp300 = load i64* %ll, align 8
  %cmp301 = icmp ne i64 %tmp300, 10
  br i1 %cmp301, label %if.then303, label %if.end310

if.then303:                                       ; preds = %if.end295
  store i32 169, i32* %lrc, align 4
  %tmp304 = load i32* %prlc, align 4
  %tobool305 = icmp ne i32 %tmp304, 0
  br i1 %tobool305, label %if.then306, label %if.end309

if.then306:                                       ; preds = %if.then303
  %tmp307 = load i32* %lrc, align 4
  %call308 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp307)
  br label %if.end309

if.end309:                                        ; preds = %if.then306, %if.then303
  br label %if.end310

if.end310:                                        ; preds = %if.end309, %if.end295
  store i64 5, i64* %ll, align 8
  store i16 2, i16* %sr, align 2
  %tmp311 = load i16* %sr, align 2
  %conv312 = sext i16 %tmp311 to i64
  %tmp313 = load i64* %ll, align 8
  %mul314 = mul nsw i64 %tmp313, %conv312
  store i64 %mul314, i64* %ll, align 8
  %tmp315 = load i64* %ll, align 8
  %cmp316 = icmp ne i64 %tmp315, 10
  br i1 %cmp316, label %if.then318, label %if.end325

if.then318:                                       ; preds = %if.end310
  store i32 170, i32* %lrc, align 4
  %tmp319 = load i32* %prlc, align 4
  %tobool320 = icmp ne i32 %tmp319, 0
  br i1 %tobool320, label %if.then321, label %if.end324

if.then321:                                       ; preds = %if.then318
  %tmp322 = load i32* %lrc, align 4
  %call323 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp322)
  br label %if.end324

if.end324:                                        ; preds = %if.then321, %if.then318
  br label %if.end325

if.end325:                                        ; preds = %if.end324, %if.end310
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ir, align 4
  %tmp326 = load i32* %ir, align 4
  %conv327 = sext i32 %tmp326 to i64
  %tmp328 = load i64* %ll, align 8
  %mul329 = mul nsw i64 %tmp328, %conv327
  store i64 %mul329, i64* %ll, align 8
  %tmp330 = load i64* %ll, align 8
  %cmp331 = icmp ne i64 %tmp330, 10
  br i1 %cmp331, label %if.then333, label %if.end340

if.then333:                                       ; preds = %if.end325
  store i32 171, i32* %lrc, align 4
  %tmp334 = load i32* %prlc, align 4
  %tobool335 = icmp ne i32 %tmp334, 0
  br i1 %tobool335, label %if.then336, label %if.end339

if.then336:                                       ; preds = %if.then333
  %tmp337 = load i32* %lrc, align 4
  %call338 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp337)
  br label %if.end339

if.end339:                                        ; preds = %if.then336, %if.then333
  br label %if.end340

if.end340:                                        ; preds = %if.end339, %if.end325
  store i64 5, i64* %ll, align 8
  store i64 2, i64* %lr, align 8
  %tmp341 = load i64* %lr, align 8
  %tmp342 = load i64* %ll, align 8
  %mul343 = mul nsw i64 %tmp342, %tmp341
  store i64 %mul343, i64* %ll, align 8
  %tmp344 = load i64* %ll, align 8
  %cmp345 = icmp ne i64 %tmp344, 10
  br i1 %cmp345, label %if.then347, label %if.end354

if.then347:                                       ; preds = %if.end340
  store i32 172, i32* %lrc, align 4
  %tmp348 = load i32* %prlc, align 4
  %tobool349 = icmp ne i32 %tmp348, 0
  br i1 %tobool349, label %if.then350, label %if.end353

if.then350:                                       ; preds = %if.then347
  %tmp351 = load i32* %lrc, align 4
  %call352 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp351)
  br label %if.end353

if.end353:                                        ; preds = %if.then350, %if.then347
  br label %if.end354

if.end354:                                        ; preds = %if.end353, %if.end340
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ur, align 4
  %tmp355 = load i32* %ur, align 4
  %conv356 = zext i32 %tmp355 to i64
  %tmp357 = load i64* %ll, align 8
  %mul358 = mul nsw i64 %tmp357, %conv356
  store i64 %mul358, i64* %ll, align 8
  %tmp359 = load i64* %ll, align 8
  %cmp360 = icmp ne i64 %tmp359, 10
  br i1 %cmp360, label %if.then362, label %if.end369

if.then362:                                       ; preds = %if.end354
  store i32 173, i32* %lrc, align 4
  %tmp363 = load i32* %prlc, align 4
  %tobool364 = icmp ne i32 %tmp363, 0
  br i1 %tobool364, label %if.then365, label %if.end368

if.then365:                                       ; preds = %if.then362
  %tmp366 = load i32* %lrc, align 4
  %call367 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp366)
  br label %if.end368

if.end368:                                        ; preds = %if.then365, %if.then362
  br label %if.end369

if.end369:                                        ; preds = %if.end368, %if.end354
  store i64 5, i64* %ll, align 8
  store float 2.000000e+00, float* %fr, align 4
  %tmp370 = load float* %fr, align 4
  %tmp371 = load i64* %ll, align 8
  %conv372 = sitofp i64 %tmp371 to float
  %mul373 = fmul float %conv372, %tmp370
  %conv374 = fptosi float %mul373 to i64
  store i64 %conv374, i64* %ll, align 8
  %tmp375 = load i64* %ll, align 8
  %cmp376 = icmp ne i64 %tmp375, 10
  br i1 %cmp376, label %if.then378, label %if.end385

if.then378:                                       ; preds = %if.end369
  store i32 174, i32* %lrc, align 4
  %tmp379 = load i32* %prlc, align 4
  %tobool380 = icmp ne i32 %tmp379, 0
  br i1 %tobool380, label %if.then381, label %if.end384

if.then381:                                       ; preds = %if.then378
  %tmp382 = load i32* %lrc, align 4
  %call383 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp382)
  br label %if.end384

if.end384:                                        ; preds = %if.then381, %if.then378
  br label %if.end385

if.end385:                                        ; preds = %if.end384, %if.end369
  store i64 5, i64* %ll, align 8
  store double 2.000000e+00, double* %dr, align 8
  %tmp386 = load double* %dr, align 8
  %tmp387 = load i64* %ll, align 8
  %conv388 = sitofp i64 %tmp387 to double
  %mul389 = fmul double %conv388, %tmp386
  %conv390 = fptosi double %mul389 to i64
  store i64 %conv390, i64* %ll, align 8
  %tmp391 = load i64* %ll, align 8
  %cmp392 = icmp ne i64 %tmp391, 10
  br i1 %cmp392, label %if.then394, label %if.end401

if.then394:                                       ; preds = %if.end385
  store i32 175, i32* %lrc, align 4
  %tmp395 = load i32* %prlc, align 4
  %tobool396 = icmp ne i32 %tmp395, 0
  br i1 %tobool396, label %if.then397, label %if.end400

if.then397:                                       ; preds = %if.then394
  %tmp398 = load i32* %lrc, align 4
  %call399 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp398)
  br label %if.end400

if.end400:                                        ; preds = %if.then397, %if.then394
  br label %if.end401

if.end401:                                        ; preds = %if.end400, %if.end385
  store i32 5, i32* %ul, align 4
  store i8 2, i8* %cr, align 1
  %tmp402 = load i8* %cr, align 1
  %conv403 = sext i8 %tmp402 to i32
  %tmp404 = load i32* %ul, align 4
  %mul405 = mul i32 %tmp404, %conv403
  store i32 %mul405, i32* %ul, align 4
  %tmp406 = load i32* %ul, align 4
  %cmp407 = icmp ne i32 %tmp406, 10
  br i1 %cmp407, label %if.then409, label %if.end416

if.then409:                                       ; preds = %if.end401
  store i32 176, i32* %lrc, align 4
  %tmp410 = load i32* %prlc, align 4
  %tobool411 = icmp ne i32 %tmp410, 0
  br i1 %tobool411, label %if.then412, label %if.end415

if.then412:                                       ; preds = %if.then409
  %tmp413 = load i32* %lrc, align 4
  %call414 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp413)
  br label %if.end415

if.end415:                                        ; preds = %if.then412, %if.then409
  br label %if.end416

if.end416:                                        ; preds = %if.end415, %if.end401
  store i32 5, i32* %ul, align 4
  store i16 2, i16* %sr, align 2
  %tmp417 = load i16* %sr, align 2
  %conv418 = sext i16 %tmp417 to i32
  %tmp419 = load i32* %ul, align 4
  %mul420 = mul i32 %tmp419, %conv418
  store i32 %mul420, i32* %ul, align 4
  %tmp421 = load i32* %ul, align 4
  %cmp422 = icmp ne i32 %tmp421, 10
  br i1 %cmp422, label %if.then424, label %if.end431

if.then424:                                       ; preds = %if.end416
  store i32 177, i32* %lrc, align 4
  %tmp425 = load i32* %prlc, align 4
  %tobool426 = icmp ne i32 %tmp425, 0
  br i1 %tobool426, label %if.then427, label %if.end430

if.then427:                                       ; preds = %if.then424
  %tmp428 = load i32* %lrc, align 4
  %call429 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp428)
  br label %if.end430

if.end430:                                        ; preds = %if.then427, %if.then424
  br label %if.end431

if.end431:                                        ; preds = %if.end430, %if.end416
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ir, align 4
  %tmp432 = load i32* %ir, align 4
  %tmp433 = load i32* %ul, align 4
  %mul434 = mul i32 %tmp433, %tmp432
  store i32 %mul434, i32* %ul, align 4
  %tmp435 = load i32* %ul, align 4
  %cmp436 = icmp ne i32 %tmp435, 10
  br i1 %cmp436, label %if.then438, label %if.end445

if.then438:                                       ; preds = %if.end431
  store i32 178, i32* %lrc, align 4
  %tmp439 = load i32* %prlc, align 4
  %tobool440 = icmp ne i32 %tmp439, 0
  br i1 %tobool440, label %if.then441, label %if.end444

if.then441:                                       ; preds = %if.then438
  %tmp442 = load i32* %lrc, align 4
  %call443 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp442)
  br label %if.end444

if.end444:                                        ; preds = %if.then441, %if.then438
  br label %if.end445

if.end445:                                        ; preds = %if.end444, %if.end431
  store i32 5, i32* %ul, align 4
  store i64 2, i64* %lr, align 8
  %tmp446 = load i64* %lr, align 8
  %tmp447 = load i32* %ul, align 4
  %conv448 = zext i32 %tmp447 to i64
  %mul449 = mul nsw i64 %conv448, %tmp446
  %conv450 = trunc i64 %mul449 to i32
  store i32 %conv450, i32* %ul, align 4
  %tmp451 = load i32* %ul, align 4
  %cmp452 = icmp ne i32 %tmp451, 10
  br i1 %cmp452, label %if.then454, label %if.end461

if.then454:                                       ; preds = %if.end445
  store i32 179, i32* %lrc, align 4
  %tmp455 = load i32* %prlc, align 4
  %tobool456 = icmp ne i32 %tmp455, 0
  br i1 %tobool456, label %if.then457, label %if.end460

if.then457:                                       ; preds = %if.then454
  %tmp458 = load i32* %lrc, align 4
  %call459 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp458)
  br label %if.end460

if.end460:                                        ; preds = %if.then457, %if.then454
  br label %if.end461

if.end461:                                        ; preds = %if.end460, %if.end445
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ur, align 4
  %tmp462 = load i32* %ur, align 4
  %tmp463 = load i32* %ul, align 4
  %mul464 = mul i32 %tmp463, %tmp462
  store i32 %mul464, i32* %ul, align 4
  %tmp465 = load i32* %ul, align 4
  %cmp466 = icmp ne i32 %tmp465, 10
  br i1 %cmp466, label %if.then468, label %if.end475

if.then468:                                       ; preds = %if.end461
  store i32 180, i32* %lrc, align 4
  %tmp469 = load i32* %prlc, align 4
  %tobool470 = icmp ne i32 %tmp469, 0
  br i1 %tobool470, label %if.then471, label %if.end474

if.then471:                                       ; preds = %if.then468
  %tmp472 = load i32* %lrc, align 4
  %call473 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp472)
  br label %if.end474

if.end474:                                        ; preds = %if.then471, %if.then468
  br label %if.end475

if.end475:                                        ; preds = %if.end474, %if.end461
  store i32 5, i32* %ul, align 4
  store float 2.000000e+00, float* %fr, align 4
  %tmp476 = load float* %fr, align 4
  %tmp477 = load i32* %ul, align 4
  %conv478 = uitofp i32 %tmp477 to float
  %mul479 = fmul float %conv478, %tmp476
  %conv480 = fptoui float %mul479 to i32
  store i32 %conv480, i32* %ul, align 4
  %tmp481 = load i32* %ul, align 4
  %cmp482 = icmp ne i32 %tmp481, 10
  br i1 %cmp482, label %if.then484, label %if.end491

if.then484:                                       ; preds = %if.end475
  store i32 181, i32* %lrc, align 4
  %tmp485 = load i32* %prlc, align 4
  %tobool486 = icmp ne i32 %tmp485, 0
  br i1 %tobool486, label %if.then487, label %if.end490

if.then487:                                       ; preds = %if.then484
  %tmp488 = load i32* %lrc, align 4
  %call489 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp488)
  br label %if.end490

if.end490:                                        ; preds = %if.then487, %if.then484
  br label %if.end491

if.end491:                                        ; preds = %if.end490, %if.end475
  store i32 5, i32* %ul, align 4
  store double 2.000000e+00, double* %dr, align 8
  %tmp492 = load double* %dr, align 8
  %tmp493 = load i32* %ul, align 4
  %conv494 = uitofp i32 %tmp493 to double
  %mul495 = fmul double %conv494, %tmp492
  %conv496 = fptoui double %mul495 to i32
  store i32 %conv496, i32* %ul, align 4
  %tmp497 = load i32* %ul, align 4
  %cmp498 = icmp ne i32 %tmp497, 10
  br i1 %cmp498, label %if.then500, label %if.end507

if.then500:                                       ; preds = %if.end491
  store i32 182, i32* %lrc, align 4
  %tmp501 = load i32* %prlc, align 4
  %tobool502 = icmp ne i32 %tmp501, 0
  br i1 %tobool502, label %if.then503, label %if.end506

if.then503:                                       ; preds = %if.then500
  %tmp504 = load i32* %lrc, align 4
  %call505 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp504)
  br label %if.end506

if.end506:                                        ; preds = %if.then503, %if.then500
  br label %if.end507

if.end507:                                        ; preds = %if.end506, %if.end491
  store float 5.000000e+00, float* %fl, align 4
  store i8 2, i8* %cr, align 1
  %tmp508 = load i8* %cr, align 1
  %conv509 = sext i8 %tmp508 to i32
  %conv510 = sitofp i32 %conv509 to float
  %tmp511 = load float* %fl, align 4
  %mul512 = fmul float %tmp511, %conv510
  store float %mul512, float* %fl, align 4
  %tmp513 = load float* %fl, align 4
  %cmp514 = fcmp une float %tmp513, 1.000000e+01
  br i1 %cmp514, label %if.then516, label %if.end523

if.then516:                                       ; preds = %if.end507
  store i32 183, i32* %lrc, align 4
  %tmp517 = load i32* %prlc, align 4
  %tobool518 = icmp ne i32 %tmp517, 0
  br i1 %tobool518, label %if.then519, label %if.end522

if.then519:                                       ; preds = %if.then516
  %tmp520 = load i32* %lrc, align 4
  %call521 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp520)
  br label %if.end522

if.end522:                                        ; preds = %if.then519, %if.then516
  br label %if.end523

if.end523:                                        ; preds = %if.end522, %if.end507
  store float 5.000000e+00, float* %fl, align 4
  store i16 2, i16* %sr, align 2
  %tmp524 = load i16* %sr, align 2
  %conv525 = sext i16 %tmp524 to i32
  %conv526 = sitofp i32 %conv525 to float
  %tmp527 = load float* %fl, align 4
  %mul528 = fmul float %tmp527, %conv526
  store float %mul528, float* %fl, align 4
  %tmp529 = load float* %fl, align 4
  %cmp530 = fcmp une float %tmp529, 1.000000e+01
  br i1 %cmp530, label %if.then532, label %if.end539

if.then532:                                       ; preds = %if.end523
  store i32 184, i32* %lrc, align 4
  %tmp533 = load i32* %prlc, align 4
  %tobool534 = icmp ne i32 %tmp533, 0
  br i1 %tobool534, label %if.then535, label %if.end538

if.then535:                                       ; preds = %if.then532
  %tmp536 = load i32* %lrc, align 4
  %call537 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp536)
  br label %if.end538

if.end538:                                        ; preds = %if.then535, %if.then532
  br label %if.end539

if.end539:                                        ; preds = %if.end538, %if.end523
  store float 5.000000e+00, float* %fl, align 4
  store i32 2, i32* %ir, align 4
  %tmp540 = load i32* %ir, align 4
  %conv541 = sitofp i32 %tmp540 to float
  %tmp542 = load float* %fl, align 4
  %mul543 = fmul float %tmp542, %conv541
  store float %mul543, float* %fl, align 4
  %tmp544 = load float* %fl, align 4
  %cmp545 = fcmp une float %tmp544, 1.000000e+01
  br i1 %cmp545, label %if.then547, label %if.end554

if.then547:                                       ; preds = %if.end539
  store i32 185, i32* %lrc, align 4
  %tmp548 = load i32* %prlc, align 4
  %tobool549 = icmp ne i32 %tmp548, 0
  br i1 %tobool549, label %if.then550, label %if.end553

if.then550:                                       ; preds = %if.then547
  %tmp551 = load i32* %lrc, align 4
  %call552 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp551)
  br label %if.end553

if.end553:                                        ; preds = %if.then550, %if.then547
  br label %if.end554

if.end554:                                        ; preds = %if.end553, %if.end539
  store float 5.000000e+00, float* %fl, align 4
  store i64 2, i64* %lr, align 8
  %tmp555 = load i64* %lr, align 8
  %conv556 = sitofp i64 %tmp555 to float
  %tmp557 = load float* %fl, align 4
  %mul558 = fmul float %tmp557, %conv556
  store float %mul558, float* %fl, align 4
  %tmp559 = load float* %fl, align 4
  %cmp560 = fcmp une float %tmp559, 1.000000e+01
  br i1 %cmp560, label %if.then562, label %if.end569

if.then562:                                       ; preds = %if.end554
  store i32 186, i32* %lrc, align 4
  %tmp563 = load i32* %prlc, align 4
  %tobool564 = icmp ne i32 %tmp563, 0
  br i1 %tobool564, label %if.then565, label %if.end568

if.then565:                                       ; preds = %if.then562
  %tmp566 = load i32* %lrc, align 4
  %call567 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp566)
  br label %if.end568

if.end568:                                        ; preds = %if.then565, %if.then562
  br label %if.end569

if.end569:                                        ; preds = %if.end568, %if.end554
  store float 5.000000e+00, float* %fl, align 4
  store i32 2, i32* %ur, align 4
  %tmp570 = load i32* %ur, align 4
  %conv571 = uitofp i32 %tmp570 to float
  %tmp572 = load float* %fl, align 4
  %mul573 = fmul float %tmp572, %conv571
  store float %mul573, float* %fl, align 4
  %tmp574 = load float* %fl, align 4
  %cmp575 = fcmp une float %tmp574, 1.000000e+01
  br i1 %cmp575, label %if.then577, label %if.end584

if.then577:                                       ; preds = %if.end569
  store i32 187, i32* %lrc, align 4
  %tmp578 = load i32* %prlc, align 4
  %tobool579 = icmp ne i32 %tmp578, 0
  br i1 %tobool579, label %if.then580, label %if.end583

if.then580:                                       ; preds = %if.then577
  %tmp581 = load i32* %lrc, align 4
  %call582 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp581)
  br label %if.end583

if.end583:                                        ; preds = %if.then580, %if.then577
  br label %if.end584

if.end584:                                        ; preds = %if.end583, %if.end569
  store float 5.000000e+00, float* %fl, align 4
  store float 2.000000e+00, float* %fr, align 4
  %tmp585 = load float* %fr, align 4
  %tmp586 = load float* %fl, align 4
  %mul587 = fmul float %tmp586, %tmp585
  store float %mul587, float* %fl, align 4
  %tmp588 = load float* %fl, align 4
  %cmp589 = fcmp une float %tmp588, 1.000000e+01
  br i1 %cmp589, label %if.then591, label %if.end598

if.then591:                                       ; preds = %if.end584
  store i32 188, i32* %lrc, align 4
  %tmp592 = load i32* %prlc, align 4
  %tobool593 = icmp ne i32 %tmp592, 0
  br i1 %tobool593, label %if.then594, label %if.end597

if.then594:                                       ; preds = %if.then591
  %tmp595 = load i32* %lrc, align 4
  %call596 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp595)
  br label %if.end597

if.end597:                                        ; preds = %if.then594, %if.then591
  br label %if.end598

if.end598:                                        ; preds = %if.end597, %if.end584
  store float 5.000000e+00, float* %fl, align 4
  store double 2.000000e+00, double* %dr, align 8
  %tmp599 = load double* %dr, align 8
  %tmp600 = load float* %fl, align 4
  %conv601 = fpext float %tmp600 to double
  %mul602 = fmul double %conv601, %tmp599
  %conv603 = fptrunc double %mul602 to float
  store float %conv603, float* %fl, align 4
  %tmp604 = load float* %fl, align 4
  %cmp605 = fcmp une float %tmp604, 1.000000e+01
  br i1 %cmp605, label %if.then607, label %if.end614

if.then607:                                       ; preds = %if.end598
  store i32 189, i32* %lrc, align 4
  %tmp608 = load i32* %prlc, align 4
  %tobool609 = icmp ne i32 %tmp608, 0
  br i1 %tobool609, label %if.then610, label %if.end613

if.then610:                                       ; preds = %if.then607
  %tmp611 = load i32* %lrc, align 4
  %call612 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp611)
  br label %if.end613

if.end613:                                        ; preds = %if.then610, %if.then607
  br label %if.end614

if.end614:                                        ; preds = %if.end613, %if.end598
  store double 5.000000e+00, double* %dl, align 8
  store i8 2, i8* %cr, align 1
  %tmp615 = load i8* %cr, align 1
  %conv616 = sext i8 %tmp615 to i32
  %conv617 = sitofp i32 %conv616 to double
  %tmp618 = load double* %dl, align 8
  %mul619 = fmul double %tmp618, %conv617
  store double %mul619, double* %dl, align 8
  %tmp620 = load double* %dl, align 8
  %cmp621 = fcmp une double %tmp620, 1.000000e+01
  br i1 %cmp621, label %if.then623, label %if.end630

if.then623:                                       ; preds = %if.end614
  store i32 190, i32* %lrc, align 4
  %tmp624 = load i32* %prlc, align 4
  %tobool625 = icmp ne i32 %tmp624, 0
  br i1 %tobool625, label %if.then626, label %if.end629

if.then626:                                       ; preds = %if.then623
  %tmp627 = load i32* %lrc, align 4
  %call628 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp627)
  br label %if.end629

if.end629:                                        ; preds = %if.then626, %if.then623
  br label %if.end630

if.end630:                                        ; preds = %if.end629, %if.end614
  store double 5.000000e+00, double* %dl, align 8
  store i16 2, i16* %sr, align 2
  %tmp631 = load i16* %sr, align 2
  %conv632 = sext i16 %tmp631 to i32
  %conv633 = sitofp i32 %conv632 to double
  %tmp634 = load double* %dl, align 8
  %mul635 = fmul double %tmp634, %conv633
  store double %mul635, double* %dl, align 8
  %tmp636 = load double* %dl, align 8
  %cmp637 = fcmp une double %tmp636, 1.000000e+01
  br i1 %cmp637, label %if.then639, label %if.end646

if.then639:                                       ; preds = %if.end630
  store i32 191, i32* %lrc, align 4
  %tmp640 = load i32* %prlc, align 4
  %tobool641 = icmp ne i32 %tmp640, 0
  br i1 %tobool641, label %if.then642, label %if.end645

if.then642:                                       ; preds = %if.then639
  %tmp643 = load i32* %lrc, align 4
  %call644 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp643)
  br label %if.end645

if.end645:                                        ; preds = %if.then642, %if.then639
  br label %if.end646

if.end646:                                        ; preds = %if.end645, %if.end630
  store double 5.000000e+00, double* %dl, align 8
  store i32 2, i32* %ir, align 4
  %tmp647 = load i32* %ir, align 4
  %conv648 = sitofp i32 %tmp647 to double
  %tmp649 = load double* %dl, align 8
  %mul650 = fmul double %tmp649, %conv648
  store double %mul650, double* %dl, align 8
  %tmp651 = load double* %dl, align 8
  %cmp652 = fcmp une double %tmp651, 1.000000e+01
  br i1 %cmp652, label %if.then654, label %if.end661

if.then654:                                       ; preds = %if.end646
  store i32 192, i32* %lrc, align 4
  %tmp655 = load i32* %prlc, align 4
  %tobool656 = icmp ne i32 %tmp655, 0
  br i1 %tobool656, label %if.then657, label %if.end660

if.then657:                                       ; preds = %if.then654
  %tmp658 = load i32* %lrc, align 4
  %call659 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp658)
  br label %if.end660

if.end660:                                        ; preds = %if.then657, %if.then654
  br label %if.end661

if.end661:                                        ; preds = %if.end660, %if.end646
  store double 5.000000e+00, double* %dl, align 8
  store i64 2, i64* %lr, align 8
  %tmp662 = load i64* %lr, align 8
  %conv663 = sitofp i64 %tmp662 to double
  %tmp664 = load double* %dl, align 8
  %mul665 = fmul double %tmp664, %conv663
  store double %mul665, double* %dl, align 8
  %tmp666 = load double* %dl, align 8
  %cmp667 = fcmp une double %tmp666, 1.000000e+01
  br i1 %cmp667, label %if.then669, label %if.end676

if.then669:                                       ; preds = %if.end661
  store i32 193, i32* %lrc, align 4
  %tmp670 = load i32* %prlc, align 4
  %tobool671 = icmp ne i32 %tmp670, 0
  br i1 %tobool671, label %if.then672, label %if.end675

if.then672:                                       ; preds = %if.then669
  %tmp673 = load i32* %lrc, align 4
  %call674 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp673)
  br label %if.end675

if.end675:                                        ; preds = %if.then672, %if.then669
  br label %if.end676

if.end676:                                        ; preds = %if.end675, %if.end661
  store double 5.000000e+00, double* %dl, align 8
  store i32 2, i32* %ur, align 4
  %tmp677 = load i32* %ur, align 4
  %conv678 = uitofp i32 %tmp677 to double
  %tmp679 = load double* %dl, align 8
  %mul680 = fmul double %tmp679, %conv678
  store double %mul680, double* %dl, align 8
  %tmp681 = load double* %dl, align 8
  %cmp682 = fcmp une double %tmp681, 1.000000e+01
  br i1 %cmp682, label %if.then684, label %if.end691

if.then684:                                       ; preds = %if.end676
  store i32 194, i32* %lrc, align 4
  %tmp685 = load i32* %prlc, align 4
  %tobool686 = icmp ne i32 %tmp685, 0
  br i1 %tobool686, label %if.then687, label %if.end690

if.then687:                                       ; preds = %if.then684
  %tmp688 = load i32* %lrc, align 4
  %call689 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp688)
  br label %if.end690

if.end690:                                        ; preds = %if.then687, %if.then684
  br label %if.end691

if.end691:                                        ; preds = %if.end690, %if.end676
  store double 5.000000e+00, double* %dl, align 8
  store float 2.000000e+00, float* %fr, align 4
  %tmp692 = load float* %fr, align 4
  %conv693 = fpext float %tmp692 to double
  %tmp694 = load double* %dl, align 8
  %mul695 = fmul double %tmp694, %conv693
  store double %mul695, double* %dl, align 8
  %tmp696 = load double* %dl, align 8
  %cmp697 = fcmp une double %tmp696, 1.000000e+01
  br i1 %cmp697, label %if.then699, label %if.end706

if.then699:                                       ; preds = %if.end691
  store i32 195, i32* %lrc, align 4
  %tmp700 = load i32* %prlc, align 4
  %tobool701 = icmp ne i32 %tmp700, 0
  br i1 %tobool701, label %if.then702, label %if.end705

if.then702:                                       ; preds = %if.then699
  %tmp703 = load i32* %lrc, align 4
  %call704 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp703)
  br label %if.end705

if.end705:                                        ; preds = %if.then702, %if.then699
  br label %if.end706

if.end706:                                        ; preds = %if.end705, %if.end691
  store double 5.000000e+00, double* %dl, align 8
  store double 2.000000e+00, double* %dr, align 8
  %tmp707 = load double* %dr, align 8
  %tmp708 = load double* %dl, align 8
  %mul709 = fmul double %tmp708, %tmp707
  store double %mul709, double* %dl, align 8
  %tmp710 = load double* %dl, align 8
  %cmp711 = fcmp une double %tmp710, 1.000000e+01
  br i1 %cmp711, label %if.then713, label %if.end720

if.then713:                                       ; preds = %if.end706
  store i32 196, i32* %lrc, align 4
  %tmp714 = load i32* %prlc, align 4
  %tobool715 = icmp ne i32 %tmp714, 0
  br i1 %tobool715, label %if.then716, label %if.end719

if.then716:                                       ; preds = %if.then713
  %tmp717 = load i32* %lrc, align 4
  %call718 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp717)
  br label %if.end719

if.end719:                                        ; preds = %if.then716, %if.then713
  br label %if.end720

if.end720:                                        ; preds = %if.end719, %if.end706
  store i8 5, i8* %cl, align 1
  store i8 2, i8* %cr, align 1
  %tmp721 = load i8* %cr, align 1
  %conv722 = sext i8 %tmp721 to i32
  %tmp723 = load i8* %cl, align 1
  %conv724 = sext i8 %tmp723 to i32
  %div = sdiv i32 %conv724, %conv722
  %conv725 = trunc i32 %div to i8
  store i8 %conv725, i8* %cl, align 1
  %tmp726 = load i8* %cl, align 1
  %conv727 = sext i8 %tmp726 to i32
  %cmp728 = icmp ne i32 %conv727, 2
  br i1 %cmp728, label %if.then730, label %if.end737

if.then730:                                       ; preds = %if.end720
  store i32 197, i32* %lrc, align 4
  %tmp731 = load i32* %prlc, align 4
  %tobool732 = icmp ne i32 %tmp731, 0
  br i1 %tobool732, label %if.then733, label %if.end736

if.then733:                                       ; preds = %if.then730
  %tmp734 = load i32* %lrc, align 4
  %call735 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp734)
  br label %if.end736

if.end736:                                        ; preds = %if.then733, %if.then730
  br label %if.end737

if.end737:                                        ; preds = %if.end736, %if.end720
  store i8 5, i8* %cl, align 1
  store i16 2, i16* %sr, align 2
  %tmp738 = load i16* %sr, align 2
  %conv739 = sext i16 %tmp738 to i32
  %tmp740 = load i8* %cl, align 1
  %conv741 = sext i8 %tmp740 to i32
  %div742 = sdiv i32 %conv741, %conv739
  %conv743 = trunc i32 %div742 to i8
  store i8 %conv743, i8* %cl, align 1
  %tmp744 = load i8* %cl, align 1
  %conv745 = sext i8 %tmp744 to i32
  %cmp746 = icmp ne i32 %conv745, 2
  br i1 %cmp746, label %if.then748, label %if.end755

if.then748:                                       ; preds = %if.end737
  store i32 198, i32* %lrc, align 4
  %tmp749 = load i32* %prlc, align 4
  %tobool750 = icmp ne i32 %tmp749, 0
  br i1 %tobool750, label %if.then751, label %if.end754

if.then751:                                       ; preds = %if.then748
  %tmp752 = load i32* %lrc, align 4
  %call753 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp752)
  br label %if.end754

if.end754:                                        ; preds = %if.then751, %if.then748
  br label %if.end755

if.end755:                                        ; preds = %if.end754, %if.end737
  store i8 5, i8* %cl, align 1
  store i32 2, i32* %ir, align 4
  %tmp756 = load i32* %ir, align 4
  %tmp757 = load i8* %cl, align 1
  %conv758 = sext i8 %tmp757 to i32
  %div759 = sdiv i32 %conv758, %tmp756
  %conv760 = trunc i32 %div759 to i8
  store i8 %conv760, i8* %cl, align 1
  %tmp761 = load i8* %cl, align 1
  %conv762 = sext i8 %tmp761 to i32
  %cmp763 = icmp ne i32 %conv762, 2
  br i1 %cmp763, label %if.then765, label %if.end772

if.then765:                                       ; preds = %if.end755
  store i32 199, i32* %lrc, align 4
  %tmp766 = load i32* %prlc, align 4
  %tobool767 = icmp ne i32 %tmp766, 0
  br i1 %tobool767, label %if.then768, label %if.end771

if.then768:                                       ; preds = %if.then765
  %tmp769 = load i32* %lrc, align 4
  %call770 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp769)
  br label %if.end771

if.end771:                                        ; preds = %if.then768, %if.then765
  br label %if.end772

if.end772:                                        ; preds = %if.end771, %if.end755
  store i8 5, i8* %cl, align 1
  store i64 2, i64* %lr, align 8
  %tmp773 = load i64* %lr, align 8
  %tmp774 = load i8* %cl, align 1
  %conv775 = sext i8 %tmp774 to i64
  %div776 = sdiv i64 %conv775, %tmp773
  %conv777 = trunc i64 %div776 to i8
  store i8 %conv777, i8* %cl, align 1
  %tmp778 = load i8* %cl, align 1
  %conv779 = sext i8 %tmp778 to i32
  %cmp780 = icmp ne i32 %conv779, 2
  br i1 %cmp780, label %if.then782, label %if.end789

if.then782:                                       ; preds = %if.end772
  store i32 200, i32* %lrc, align 4
  %tmp783 = load i32* %prlc, align 4
  %tobool784 = icmp ne i32 %tmp783, 0
  br i1 %tobool784, label %if.then785, label %if.end788

if.then785:                                       ; preds = %if.then782
  %tmp786 = load i32* %lrc, align 4
  %call787 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp786)
  br label %if.end788

if.end788:                                        ; preds = %if.then785, %if.then782
  br label %if.end789

if.end789:                                        ; preds = %if.end788, %if.end772
  %tmp790 = load i32* %lrc, align 4
  %cmp791 = icmp ne i32 %tmp790, 0
  br i1 %cmp791, label %if.then793, label %if.end801

if.then793:                                       ; preds = %if.end789
  store i32 1, i32* %rc, align 4
  %tmp794 = load %struct.defs** %pd0.addr, align 8
  %flgd = getelementptr inbounds %struct.defs* %tmp794, i32 0, i32 11
  %tmp795 = load i32* %flgd, align 4
  %cmp796 = icmp ne i32 %tmp795, 0
  br i1 %cmp796, label %if.then798, label %if.end800

if.then798:                                       ; preds = %if.then793
  %call799 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @sec.s714er, i32 0, i32 0), i32 1)
  br label %if.end800

if.end800:                                        ; preds = %if.then798, %if.then793
  br label %if.end801

if.end801:                                        ; preds = %if.end800, %if.end789
  %tmp802 = load i32* %rc, align 4
  ret i32 %tmp802
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
