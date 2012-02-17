; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/cq-20-s714-c.c'
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
  store i32 2, i32* %ir, align 4
  %tmp7 = load i32* %ir, align 4
  %tmp8 = load i8* %cl, align 1
  %conv = sext i8 %tmp8 to i32
  %sub = sub nsw i32 %conv, %tmp7
  %conv9 = trunc i32 %sub to i8
  store i8 %conv9, i8* %cl, align 1
  %tmp10 = load i8* %cl, align 1
  %conv11 = sext i8 %tmp10 to i32
  %cmp = icmp ne i32 %conv11, 3
  br i1 %cmp, label %if.then, label %if.end17

if.then:                                          ; preds = %while.end
  store i32 101, i32* %lrc, align 4
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
  store i64 2, i64* %lr, align 8
  %tmp18 = load i64* %lr, align 8
  %tmp19 = load i8* %cl, align 1
  %conv20 = sext i8 %tmp19 to i64
  %sub21 = sub nsw i64 %conv20, %tmp18
  %conv22 = trunc i64 %sub21 to i8
  store i8 %conv22, i8* %cl, align 1
  %tmp23 = load i8* %cl, align 1
  %conv24 = sext i8 %tmp23 to i32
  %cmp25 = icmp ne i32 %conv24, 3
  br i1 %cmp25, label %if.then27, label %if.end34

if.then27:                                        ; preds = %if.end17
  store i32 102, i32* %lrc, align 4
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
  store i32 2, i32* %ur, align 4
  %tmp35 = load i32* %ur, align 4
  %tmp36 = load i8* %cl, align 1
  %conv37 = sext i8 %tmp36 to i32
  %sub38 = sub i32 %conv37, %tmp35
  %conv39 = trunc i32 %sub38 to i8
  store i8 %conv39, i8* %cl, align 1
  %tmp40 = load i8* %cl, align 1
  %conv41 = sext i8 %tmp40 to i32
  %cmp42 = icmp ne i32 %conv41, 3
  br i1 %cmp42, label %if.then44, label %if.end51

if.then44:                                        ; preds = %if.end34
  store i32 103, i32* %lrc, align 4
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
  store float 2.000000e+00, float* %fr, align 4
  %tmp52 = load float* %fr, align 4
  %tmp53 = load i8* %cl, align 1
  %conv54 = sitofp i8 %tmp53 to float
  %sub55 = fsub float %conv54, %tmp52
  %conv56 = fptosi float %sub55 to i8
  store i8 %conv56, i8* %cl, align 1
  %tmp57 = load i8* %cl, align 1
  %conv58 = sext i8 %tmp57 to i32
  %cmp59 = icmp ne i32 %conv58, 3
  br i1 %cmp59, label %if.then61, label %if.end68

if.then61:                                        ; preds = %if.end51
  store i32 104, i32* %lrc, align 4
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
  store i8 5, i8* %cl, align 1
  store double 2.000000e+00, double* %dr, align 8
  %tmp69 = load double* %dr, align 8
  %tmp70 = load i8* %cl, align 1
  %conv71 = sitofp i8 %tmp70 to double
  %sub72 = fsub double %conv71, %tmp69
  %conv73 = fptosi double %sub72 to i8
  store i8 %conv73, i8* %cl, align 1
  %tmp74 = load i8* %cl, align 1
  %conv75 = sext i8 %tmp74 to i32
  %cmp76 = icmp ne i32 %conv75, 3
  br i1 %cmp76, label %if.then78, label %if.end85

if.then78:                                        ; preds = %if.end68
  store i32 105, i32* %lrc, align 4
  %tmp79 = load i32* %prlc, align 4
  %tobool80 = icmp ne i32 %tmp79, 0
  br i1 %tobool80, label %if.then81, label %if.end84

if.then81:                                        ; preds = %if.then78
  %tmp82 = load i32* %lrc, align 4
  %call83 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp82)
  br label %if.end84

if.end84:                                         ; preds = %if.then81, %if.then78
  br label %if.end85

if.end85:                                         ; preds = %if.end84, %if.end68
  store i16 5, i16* %sl, align 2
  store i8 2, i8* %cr, align 1
  %tmp86 = load i8* %cr, align 1
  %conv87 = sext i8 %tmp86 to i32
  %tmp88 = load i16* %sl, align 2
  %conv89 = sext i16 %tmp88 to i32
  %sub90 = sub nsw i32 %conv89, %conv87
  %conv91 = trunc i32 %sub90 to i16
  store i16 %conv91, i16* %sl, align 2
  %tmp92 = load i16* %sl, align 2
  %conv93 = sext i16 %tmp92 to i32
  %cmp94 = icmp ne i32 %conv93, 3
  br i1 %cmp94, label %if.then96, label %if.end103

if.then96:                                        ; preds = %if.end85
  store i32 106, i32* %lrc, align 4
  %tmp97 = load i32* %prlc, align 4
  %tobool98 = icmp ne i32 %tmp97, 0
  br i1 %tobool98, label %if.then99, label %if.end102

if.then99:                                        ; preds = %if.then96
  %tmp100 = load i32* %lrc, align 4
  %call101 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp100)
  br label %if.end102

if.end102:                                        ; preds = %if.then99, %if.then96
  br label %if.end103

if.end103:                                        ; preds = %if.end102, %if.end85
  store i16 5, i16* %sl, align 2
  store i16 2, i16* %sr, align 2
  %tmp104 = load i16* %sr, align 2
  %conv105 = sext i16 %tmp104 to i32
  %tmp106 = load i16* %sl, align 2
  %conv107 = sext i16 %tmp106 to i32
  %sub108 = sub nsw i32 %conv107, %conv105
  %conv109 = trunc i32 %sub108 to i16
  store i16 %conv109, i16* %sl, align 2
  %tmp110 = load i16* %sl, align 2
  %conv111 = sext i16 %tmp110 to i32
  %cmp112 = icmp ne i32 %conv111, 3
  br i1 %cmp112, label %if.then114, label %if.end121

if.then114:                                       ; preds = %if.end103
  store i32 107, i32* %lrc, align 4
  %tmp115 = load i32* %prlc, align 4
  %tobool116 = icmp ne i32 %tmp115, 0
  br i1 %tobool116, label %if.then117, label %if.end120

if.then117:                                       ; preds = %if.then114
  %tmp118 = load i32* %lrc, align 4
  %call119 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp118)
  br label %if.end120

if.end120:                                        ; preds = %if.then117, %if.then114
  br label %if.end121

if.end121:                                        ; preds = %if.end120, %if.end103
  store i16 5, i16* %sl, align 2
  store i32 2, i32* %ir, align 4
  %tmp122 = load i32* %ir, align 4
  %tmp123 = load i16* %sl, align 2
  %conv124 = sext i16 %tmp123 to i32
  %sub125 = sub nsw i32 %conv124, %tmp122
  %conv126 = trunc i32 %sub125 to i16
  store i16 %conv126, i16* %sl, align 2
  %tmp127 = load i16* %sl, align 2
  %conv128 = sext i16 %tmp127 to i32
  %cmp129 = icmp ne i32 %conv128, 3
  br i1 %cmp129, label %if.then131, label %if.end138

if.then131:                                       ; preds = %if.end121
  store i32 108, i32* %lrc, align 4
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
  store i64 2, i64* %lr, align 8
  %tmp139 = load i64* %lr, align 8
  %tmp140 = load i16* %sl, align 2
  %conv141 = sext i16 %tmp140 to i64
  %sub142 = sub nsw i64 %conv141, %tmp139
  %conv143 = trunc i64 %sub142 to i16
  store i16 %conv143, i16* %sl, align 2
  %tmp144 = load i16* %sl, align 2
  %conv145 = sext i16 %tmp144 to i32
  %cmp146 = icmp ne i32 %conv145, 3
  br i1 %cmp146, label %if.then148, label %if.end155

if.then148:                                       ; preds = %if.end138
  store i32 109, i32* %lrc, align 4
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
  store i32 2, i32* %ur, align 4
  %tmp156 = load i32* %ur, align 4
  %tmp157 = load i16* %sl, align 2
  %conv158 = sext i16 %tmp157 to i32
  %sub159 = sub i32 %conv158, %tmp156
  %conv160 = trunc i32 %sub159 to i16
  store i16 %conv160, i16* %sl, align 2
  %tmp161 = load i16* %sl, align 2
  %conv162 = sext i16 %tmp161 to i32
  %cmp163 = icmp ne i32 %conv162, 3
  br i1 %cmp163, label %if.then165, label %if.end172

if.then165:                                       ; preds = %if.end155
  store i32 110, i32* %lrc, align 4
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
  store float 2.000000e+00, float* %fr, align 4
  %tmp173 = load float* %fr, align 4
  %tmp174 = load i16* %sl, align 2
  %conv175 = sitofp i16 %tmp174 to float
  %sub176 = fsub float %conv175, %tmp173
  %conv177 = fptosi float %sub176 to i16
  store i16 %conv177, i16* %sl, align 2
  %tmp178 = load i16* %sl, align 2
  %conv179 = sext i16 %tmp178 to i32
  %cmp180 = icmp ne i32 %conv179, 3
  br i1 %cmp180, label %if.then182, label %if.end189

if.then182:                                       ; preds = %if.end172
  store i32 111, i32* %lrc, align 4
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
  store i16 5, i16* %sl, align 2
  store double 2.000000e+00, double* %dr, align 8
  %tmp190 = load double* %dr, align 8
  %tmp191 = load i16* %sl, align 2
  %conv192 = sitofp i16 %tmp191 to double
  %sub193 = fsub double %conv192, %tmp190
  %conv194 = fptosi double %sub193 to i16
  store i16 %conv194, i16* %sl, align 2
  %tmp195 = load i16* %sl, align 2
  %conv196 = sext i16 %tmp195 to i32
  %cmp197 = icmp ne i32 %conv196, 3
  br i1 %cmp197, label %if.then199, label %if.end206

if.then199:                                       ; preds = %if.end189
  store i32 112, i32* %lrc, align 4
  %tmp200 = load i32* %prlc, align 4
  %tobool201 = icmp ne i32 %tmp200, 0
  br i1 %tobool201, label %if.then202, label %if.end205

if.then202:                                       ; preds = %if.then199
  %tmp203 = load i32* %lrc, align 4
  %call204 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp203)
  br label %if.end205

if.end205:                                        ; preds = %if.then202, %if.then199
  br label %if.end206

if.end206:                                        ; preds = %if.end205, %if.end189
  store i32 5, i32* %il, align 4
  store i8 2, i8* %cr, align 1
  %tmp207 = load i8* %cr, align 1
  %conv208 = sext i8 %tmp207 to i32
  %tmp209 = load i32* %il, align 4
  %sub210 = sub nsw i32 %tmp209, %conv208
  store i32 %sub210, i32* %il, align 4
  %tmp211 = load i32* %il, align 4
  %cmp212 = icmp ne i32 %tmp211, 3
  br i1 %cmp212, label %if.then214, label %if.end221

if.then214:                                       ; preds = %if.end206
  store i32 113, i32* %lrc, align 4
  %tmp215 = load i32* %prlc, align 4
  %tobool216 = icmp ne i32 %tmp215, 0
  br i1 %tobool216, label %if.then217, label %if.end220

if.then217:                                       ; preds = %if.then214
  %tmp218 = load i32* %lrc, align 4
  %call219 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp218)
  br label %if.end220

if.end220:                                        ; preds = %if.then217, %if.then214
  br label %if.end221

if.end221:                                        ; preds = %if.end220, %if.end206
  store i32 5, i32* %il, align 4
  store i16 2, i16* %sr, align 2
  %tmp222 = load i16* %sr, align 2
  %conv223 = sext i16 %tmp222 to i32
  %tmp224 = load i32* %il, align 4
  %sub225 = sub nsw i32 %tmp224, %conv223
  store i32 %sub225, i32* %il, align 4
  %tmp226 = load i32* %il, align 4
  %cmp227 = icmp ne i32 %tmp226, 3
  br i1 %cmp227, label %if.then229, label %if.end236

if.then229:                                       ; preds = %if.end221
  store i32 114, i32* %lrc, align 4
  %tmp230 = load i32* %prlc, align 4
  %tobool231 = icmp ne i32 %tmp230, 0
  br i1 %tobool231, label %if.then232, label %if.end235

if.then232:                                       ; preds = %if.then229
  %tmp233 = load i32* %lrc, align 4
  %call234 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp233)
  br label %if.end235

if.end235:                                        ; preds = %if.then232, %if.then229
  br label %if.end236

if.end236:                                        ; preds = %if.end235, %if.end221
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ir, align 4
  %tmp237 = load i32* %ir, align 4
  %tmp238 = load i32* %il, align 4
  %sub239 = sub nsw i32 %tmp238, %tmp237
  store i32 %sub239, i32* %il, align 4
  %tmp240 = load i32* %il, align 4
  %cmp241 = icmp ne i32 %tmp240, 3
  br i1 %cmp241, label %if.then243, label %if.end250

if.then243:                                       ; preds = %if.end236
  store i32 115, i32* %lrc, align 4
  %tmp244 = load i32* %prlc, align 4
  %tobool245 = icmp ne i32 %tmp244, 0
  br i1 %tobool245, label %if.then246, label %if.end249

if.then246:                                       ; preds = %if.then243
  %tmp247 = load i32* %lrc, align 4
  %call248 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp247)
  br label %if.end249

if.end249:                                        ; preds = %if.then246, %if.then243
  br label %if.end250

if.end250:                                        ; preds = %if.end249, %if.end236
  store i32 5, i32* %il, align 4
  store i64 2, i64* %lr, align 8
  %tmp251 = load i64* %lr, align 8
  %tmp252 = load i32* %il, align 4
  %conv253 = sext i32 %tmp252 to i64
  %sub254 = sub nsw i64 %conv253, %tmp251
  %conv255 = trunc i64 %sub254 to i32
  store i32 %conv255, i32* %il, align 4
  %tmp256 = load i32* %il, align 4
  %cmp257 = icmp ne i32 %tmp256, 3
  br i1 %cmp257, label %if.then259, label %if.end266

if.then259:                                       ; preds = %if.end250
  store i32 116, i32* %lrc, align 4
  %tmp260 = load i32* %prlc, align 4
  %tobool261 = icmp ne i32 %tmp260, 0
  br i1 %tobool261, label %if.then262, label %if.end265

if.then262:                                       ; preds = %if.then259
  %tmp263 = load i32* %lrc, align 4
  %call264 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp263)
  br label %if.end265

if.end265:                                        ; preds = %if.then262, %if.then259
  br label %if.end266

if.end266:                                        ; preds = %if.end265, %if.end250
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ur, align 4
  %tmp267 = load i32* %ur, align 4
  %tmp268 = load i32* %il, align 4
  %sub269 = sub i32 %tmp268, %tmp267
  store i32 %sub269, i32* %il, align 4
  %tmp270 = load i32* %il, align 4
  %cmp271 = icmp ne i32 %tmp270, 3
  br i1 %cmp271, label %if.then273, label %if.end280

if.then273:                                       ; preds = %if.end266
  store i32 117, i32* %lrc, align 4
  %tmp274 = load i32* %prlc, align 4
  %tobool275 = icmp ne i32 %tmp274, 0
  br i1 %tobool275, label %if.then276, label %if.end279

if.then276:                                       ; preds = %if.then273
  %tmp277 = load i32* %lrc, align 4
  %call278 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp277)
  br label %if.end279

if.end279:                                        ; preds = %if.then276, %if.then273
  br label %if.end280

if.end280:                                        ; preds = %if.end279, %if.end266
  store i32 5, i32* %il, align 4
  store float 2.000000e+00, float* %fr, align 4
  %tmp281 = load float* %fr, align 4
  %tmp282 = load i32* %il, align 4
  %conv283 = sitofp i32 %tmp282 to float
  %sub284 = fsub float %conv283, %tmp281
  %conv285 = fptosi float %sub284 to i32
  store i32 %conv285, i32* %il, align 4
  %tmp286 = load i32* %il, align 4
  %cmp287 = icmp ne i32 %tmp286, 3
  br i1 %cmp287, label %if.then289, label %if.end296

if.then289:                                       ; preds = %if.end280
  store i32 118, i32* %lrc, align 4
  %tmp290 = load i32* %prlc, align 4
  %tobool291 = icmp ne i32 %tmp290, 0
  br i1 %tobool291, label %if.then292, label %if.end295

if.then292:                                       ; preds = %if.then289
  %tmp293 = load i32* %lrc, align 4
  %call294 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp293)
  br label %if.end295

if.end295:                                        ; preds = %if.then292, %if.then289
  br label %if.end296

if.end296:                                        ; preds = %if.end295, %if.end280
  store i32 5, i32* %il, align 4
  store double 2.000000e+00, double* %dr, align 8
  %tmp297 = load double* %dr, align 8
  %tmp298 = load i32* %il, align 4
  %conv299 = sitofp i32 %tmp298 to double
  %sub300 = fsub double %conv299, %tmp297
  %conv301 = fptosi double %sub300 to i32
  store i32 %conv301, i32* %il, align 4
  %tmp302 = load i32* %il, align 4
  %cmp303 = icmp ne i32 %tmp302, 3
  br i1 %cmp303, label %if.then305, label %if.end312

if.then305:                                       ; preds = %if.end296
  store i32 119, i32* %lrc, align 4
  %tmp306 = load i32* %prlc, align 4
  %tobool307 = icmp ne i32 %tmp306, 0
  br i1 %tobool307, label %if.then308, label %if.end311

if.then308:                                       ; preds = %if.then305
  %tmp309 = load i32* %lrc, align 4
  %call310 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp309)
  br label %if.end311

if.end311:                                        ; preds = %if.then308, %if.then305
  br label %if.end312

if.end312:                                        ; preds = %if.end311, %if.end296
  store i64 5, i64* %ll, align 8
  store i8 2, i8* %cr, align 1
  %tmp313 = load i8* %cr, align 1
  %conv314 = sext i8 %tmp313 to i64
  %tmp315 = load i64* %ll, align 8
  %sub316 = sub nsw i64 %tmp315, %conv314
  store i64 %sub316, i64* %ll, align 8
  %tmp317 = load i64* %ll, align 8
  %cmp318 = icmp ne i64 %tmp317, 3
  br i1 %cmp318, label %if.then320, label %if.end327

if.then320:                                       ; preds = %if.end312
  store i32 120, i32* %lrc, align 4
  %tmp321 = load i32* %prlc, align 4
  %tobool322 = icmp ne i32 %tmp321, 0
  br i1 %tobool322, label %if.then323, label %if.end326

if.then323:                                       ; preds = %if.then320
  %tmp324 = load i32* %lrc, align 4
  %call325 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp324)
  br label %if.end326

if.end326:                                        ; preds = %if.then323, %if.then320
  br label %if.end327

if.end327:                                        ; preds = %if.end326, %if.end312
  store i64 5, i64* %ll, align 8
  store i16 2, i16* %sr, align 2
  %tmp328 = load i16* %sr, align 2
  %conv329 = sext i16 %tmp328 to i64
  %tmp330 = load i64* %ll, align 8
  %sub331 = sub nsw i64 %tmp330, %conv329
  store i64 %sub331, i64* %ll, align 8
  %tmp332 = load i64* %ll, align 8
  %cmp333 = icmp ne i64 %tmp332, 3
  br i1 %cmp333, label %if.then335, label %if.end342

if.then335:                                       ; preds = %if.end327
  store i32 121, i32* %lrc, align 4
  %tmp336 = load i32* %prlc, align 4
  %tobool337 = icmp ne i32 %tmp336, 0
  br i1 %tobool337, label %if.then338, label %if.end341

if.then338:                                       ; preds = %if.then335
  %tmp339 = load i32* %lrc, align 4
  %call340 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp339)
  br label %if.end341

if.end341:                                        ; preds = %if.then338, %if.then335
  br label %if.end342

if.end342:                                        ; preds = %if.end341, %if.end327
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ir, align 4
  %tmp343 = load i32* %ir, align 4
  %conv344 = sext i32 %tmp343 to i64
  %tmp345 = load i64* %ll, align 8
  %sub346 = sub nsw i64 %tmp345, %conv344
  store i64 %sub346, i64* %ll, align 8
  %tmp347 = load i64* %ll, align 8
  %cmp348 = icmp ne i64 %tmp347, 3
  br i1 %cmp348, label %if.then350, label %if.end357

if.then350:                                       ; preds = %if.end342
  store i32 122, i32* %lrc, align 4
  %tmp351 = load i32* %prlc, align 4
  %tobool352 = icmp ne i32 %tmp351, 0
  br i1 %tobool352, label %if.then353, label %if.end356

if.then353:                                       ; preds = %if.then350
  %tmp354 = load i32* %lrc, align 4
  %call355 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp354)
  br label %if.end356

if.end356:                                        ; preds = %if.then353, %if.then350
  br label %if.end357

if.end357:                                        ; preds = %if.end356, %if.end342
  store i64 5, i64* %ll, align 8
  store i64 2, i64* %lr, align 8
  %tmp358 = load i64* %lr, align 8
  %tmp359 = load i64* %ll, align 8
  %sub360 = sub nsw i64 %tmp359, %tmp358
  store i64 %sub360, i64* %ll, align 8
  %tmp361 = load i64* %ll, align 8
  %cmp362 = icmp ne i64 %tmp361, 3
  br i1 %cmp362, label %if.then364, label %if.end371

if.then364:                                       ; preds = %if.end357
  store i32 123, i32* %lrc, align 4
  %tmp365 = load i32* %prlc, align 4
  %tobool366 = icmp ne i32 %tmp365, 0
  br i1 %tobool366, label %if.then367, label %if.end370

if.then367:                                       ; preds = %if.then364
  %tmp368 = load i32* %lrc, align 4
  %call369 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp368)
  br label %if.end370

if.end370:                                        ; preds = %if.then367, %if.then364
  br label %if.end371

if.end371:                                        ; preds = %if.end370, %if.end357
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ur, align 4
  %tmp372 = load i32* %ur, align 4
  %conv373 = zext i32 %tmp372 to i64
  %tmp374 = load i64* %ll, align 8
  %sub375 = sub nsw i64 %tmp374, %conv373
  store i64 %sub375, i64* %ll, align 8
  %tmp376 = load i64* %ll, align 8
  %cmp377 = icmp ne i64 %tmp376, 3
  br i1 %cmp377, label %if.then379, label %if.end386

if.then379:                                       ; preds = %if.end371
  store i32 124, i32* %lrc, align 4
  %tmp380 = load i32* %prlc, align 4
  %tobool381 = icmp ne i32 %tmp380, 0
  br i1 %tobool381, label %if.then382, label %if.end385

if.then382:                                       ; preds = %if.then379
  %tmp383 = load i32* %lrc, align 4
  %call384 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp383)
  br label %if.end385

if.end385:                                        ; preds = %if.then382, %if.then379
  br label %if.end386

if.end386:                                        ; preds = %if.end385, %if.end371
  store i64 5, i64* %ll, align 8
  store float 2.000000e+00, float* %fr, align 4
  %tmp387 = load float* %fr, align 4
  %tmp388 = load i64* %ll, align 8
  %conv389 = sitofp i64 %tmp388 to float
  %sub390 = fsub float %conv389, %tmp387
  %conv391 = fptosi float %sub390 to i64
  store i64 %conv391, i64* %ll, align 8
  %tmp392 = load i64* %ll, align 8
  %cmp393 = icmp ne i64 %tmp392, 3
  br i1 %cmp393, label %if.then395, label %if.end402

if.then395:                                       ; preds = %if.end386
  store i32 125, i32* %lrc, align 4
  %tmp396 = load i32* %prlc, align 4
  %tobool397 = icmp ne i32 %tmp396, 0
  br i1 %tobool397, label %if.then398, label %if.end401

if.then398:                                       ; preds = %if.then395
  %tmp399 = load i32* %lrc, align 4
  %call400 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp399)
  br label %if.end401

if.end401:                                        ; preds = %if.then398, %if.then395
  br label %if.end402

if.end402:                                        ; preds = %if.end401, %if.end386
  store i64 5, i64* %ll, align 8
  store double 2.000000e+00, double* %dr, align 8
  %tmp403 = load double* %dr, align 8
  %tmp404 = load i64* %ll, align 8
  %conv405 = sitofp i64 %tmp404 to double
  %sub406 = fsub double %conv405, %tmp403
  %conv407 = fptosi double %sub406 to i64
  store i64 %conv407, i64* %ll, align 8
  %tmp408 = load i64* %ll, align 8
  %cmp409 = icmp ne i64 %tmp408, 3
  br i1 %cmp409, label %if.then411, label %if.end418

if.then411:                                       ; preds = %if.end402
  store i32 126, i32* %lrc, align 4
  %tmp412 = load i32* %prlc, align 4
  %tobool413 = icmp ne i32 %tmp412, 0
  br i1 %tobool413, label %if.then414, label %if.end417

if.then414:                                       ; preds = %if.then411
  %tmp415 = load i32* %lrc, align 4
  %call416 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp415)
  br label %if.end417

if.end417:                                        ; preds = %if.then414, %if.then411
  br label %if.end418

if.end418:                                        ; preds = %if.end417, %if.end402
  store i32 5, i32* %ul, align 4
  store i8 2, i8* %cr, align 1
  %tmp419 = load i8* %cr, align 1
  %conv420 = sext i8 %tmp419 to i32
  %tmp421 = load i32* %ul, align 4
  %sub422 = sub i32 %tmp421, %conv420
  store i32 %sub422, i32* %ul, align 4
  %tmp423 = load i32* %ul, align 4
  %cmp424 = icmp ne i32 %tmp423, 3
  br i1 %cmp424, label %if.then426, label %if.end433

if.then426:                                       ; preds = %if.end418
  store i32 127, i32* %lrc, align 4
  %tmp427 = load i32* %prlc, align 4
  %tobool428 = icmp ne i32 %tmp427, 0
  br i1 %tobool428, label %if.then429, label %if.end432

if.then429:                                       ; preds = %if.then426
  %tmp430 = load i32* %lrc, align 4
  %call431 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp430)
  br label %if.end432

if.end432:                                        ; preds = %if.then429, %if.then426
  br label %if.end433

if.end433:                                        ; preds = %if.end432, %if.end418
  store i32 5, i32* %ul, align 4
  store i16 2, i16* %sr, align 2
  %tmp434 = load i16* %sr, align 2
  %conv435 = sext i16 %tmp434 to i32
  %tmp436 = load i32* %ul, align 4
  %sub437 = sub i32 %tmp436, %conv435
  store i32 %sub437, i32* %ul, align 4
  %tmp438 = load i32* %ul, align 4
  %cmp439 = icmp ne i32 %tmp438, 3
  br i1 %cmp439, label %if.then441, label %if.end448

if.then441:                                       ; preds = %if.end433
  store i32 128, i32* %lrc, align 4
  %tmp442 = load i32* %prlc, align 4
  %tobool443 = icmp ne i32 %tmp442, 0
  br i1 %tobool443, label %if.then444, label %if.end447

if.then444:                                       ; preds = %if.then441
  %tmp445 = load i32* %lrc, align 4
  %call446 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp445)
  br label %if.end447

if.end447:                                        ; preds = %if.then444, %if.then441
  br label %if.end448

if.end448:                                        ; preds = %if.end447, %if.end433
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ir, align 4
  %tmp449 = load i32* %ir, align 4
  %tmp450 = load i32* %ul, align 4
  %sub451 = sub i32 %tmp450, %tmp449
  store i32 %sub451, i32* %ul, align 4
  %tmp452 = load i32* %ul, align 4
  %cmp453 = icmp ne i32 %tmp452, 3
  br i1 %cmp453, label %if.then455, label %if.end462

if.then455:                                       ; preds = %if.end448
  store i32 129, i32* %lrc, align 4
  %tmp456 = load i32* %prlc, align 4
  %tobool457 = icmp ne i32 %tmp456, 0
  br i1 %tobool457, label %if.then458, label %if.end461

if.then458:                                       ; preds = %if.then455
  %tmp459 = load i32* %lrc, align 4
  %call460 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp459)
  br label %if.end461

if.end461:                                        ; preds = %if.then458, %if.then455
  br label %if.end462

if.end462:                                        ; preds = %if.end461, %if.end448
  store i32 5, i32* %ul, align 4
  store i64 2, i64* %lr, align 8
  %tmp463 = load i64* %lr, align 8
  %tmp464 = load i32* %ul, align 4
  %conv465 = zext i32 %tmp464 to i64
  %sub466 = sub nsw i64 %conv465, %tmp463
  %conv467 = trunc i64 %sub466 to i32
  store i32 %conv467, i32* %ul, align 4
  %tmp468 = load i32* %ul, align 4
  %cmp469 = icmp ne i32 %tmp468, 3
  br i1 %cmp469, label %if.then471, label %if.end478

if.then471:                                       ; preds = %if.end462
  store i32 130, i32* %lrc, align 4
  %tmp472 = load i32* %prlc, align 4
  %tobool473 = icmp ne i32 %tmp472, 0
  br i1 %tobool473, label %if.then474, label %if.end477

if.then474:                                       ; preds = %if.then471
  %tmp475 = load i32* %lrc, align 4
  %call476 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp475)
  br label %if.end477

if.end477:                                        ; preds = %if.then474, %if.then471
  br label %if.end478

if.end478:                                        ; preds = %if.end477, %if.end462
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ur, align 4
  %tmp479 = load i32* %ur, align 4
  %tmp480 = load i32* %ul, align 4
  %sub481 = sub i32 %tmp480, %tmp479
  store i32 %sub481, i32* %ul, align 4
  %tmp482 = load i32* %ul, align 4
  %cmp483 = icmp ne i32 %tmp482, 3
  br i1 %cmp483, label %if.then485, label %if.end492

if.then485:                                       ; preds = %if.end478
  store i32 131, i32* %lrc, align 4
  %tmp486 = load i32* %prlc, align 4
  %tobool487 = icmp ne i32 %tmp486, 0
  br i1 %tobool487, label %if.then488, label %if.end491

if.then488:                                       ; preds = %if.then485
  %tmp489 = load i32* %lrc, align 4
  %call490 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp489)
  br label %if.end491

if.end491:                                        ; preds = %if.then488, %if.then485
  br label %if.end492

if.end492:                                        ; preds = %if.end491, %if.end478
  store i32 5, i32* %ul, align 4
  store float 2.000000e+00, float* %fr, align 4
  %tmp493 = load float* %fr, align 4
  %tmp494 = load i32* %ul, align 4
  %conv495 = uitofp i32 %tmp494 to float
  %sub496 = fsub float %conv495, %tmp493
  %conv497 = fptoui float %sub496 to i32
  store i32 %conv497, i32* %ul, align 4
  %tmp498 = load i32* %ul, align 4
  %cmp499 = icmp ne i32 %tmp498, 3
  br i1 %cmp499, label %if.then501, label %if.end508

if.then501:                                       ; preds = %if.end492
  store i32 132, i32* %lrc, align 4
  %tmp502 = load i32* %prlc, align 4
  %tobool503 = icmp ne i32 %tmp502, 0
  br i1 %tobool503, label %if.then504, label %if.end507

if.then504:                                       ; preds = %if.then501
  %tmp505 = load i32* %lrc, align 4
  %call506 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp505)
  br label %if.end507

if.end507:                                        ; preds = %if.then504, %if.then501
  br label %if.end508

if.end508:                                        ; preds = %if.end507, %if.end492
  store i32 5, i32* %ul, align 4
  store double 2.000000e+00, double* %dr, align 8
  %tmp509 = load double* %dr, align 8
  %tmp510 = load i32* %ul, align 4
  %conv511 = uitofp i32 %tmp510 to double
  %sub512 = fsub double %conv511, %tmp509
  %conv513 = fptoui double %sub512 to i32
  store i32 %conv513, i32* %ul, align 4
  %tmp514 = load i32* %ul, align 4
  %cmp515 = icmp ne i32 %tmp514, 3
  br i1 %cmp515, label %if.then517, label %if.end524

if.then517:                                       ; preds = %if.end508
  store i32 133, i32* %lrc, align 4
  %tmp518 = load i32* %prlc, align 4
  %tobool519 = icmp ne i32 %tmp518, 0
  br i1 %tobool519, label %if.then520, label %if.end523

if.then520:                                       ; preds = %if.then517
  %tmp521 = load i32* %lrc, align 4
  %call522 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp521)
  br label %if.end523

if.end523:                                        ; preds = %if.then520, %if.then517
  br label %if.end524

if.end524:                                        ; preds = %if.end523, %if.end508
  store float 5.000000e+00, float* %fl, align 4
  store i8 2, i8* %cr, align 1
  %tmp525 = load i8* %cr, align 1
  %conv526 = sext i8 %tmp525 to i32
  %conv527 = sitofp i32 %conv526 to float
  %tmp528 = load float* %fl, align 4
  %sub529 = fsub float %tmp528, %conv527
  store float %sub529, float* %fl, align 4
  %tmp530 = load float* %fl, align 4
  %cmp531 = fcmp une float %tmp530, 3.000000e+00
  br i1 %cmp531, label %if.then533, label %if.end540

if.then533:                                       ; preds = %if.end524
  store i32 134, i32* %lrc, align 4
  %tmp534 = load i32* %prlc, align 4
  %tobool535 = icmp ne i32 %tmp534, 0
  br i1 %tobool535, label %if.then536, label %if.end539

if.then536:                                       ; preds = %if.then533
  %tmp537 = load i32* %lrc, align 4
  %call538 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp537)
  br label %if.end539

if.end539:                                        ; preds = %if.then536, %if.then533
  br label %if.end540

if.end540:                                        ; preds = %if.end539, %if.end524
  store float 5.000000e+00, float* %fl, align 4
  store i16 2, i16* %sr, align 2
  %tmp541 = load i16* %sr, align 2
  %conv542 = sext i16 %tmp541 to i32
  %conv543 = sitofp i32 %conv542 to float
  %tmp544 = load float* %fl, align 4
  %sub545 = fsub float %tmp544, %conv543
  store float %sub545, float* %fl, align 4
  %tmp546 = load float* %fl, align 4
  %cmp547 = fcmp une float %tmp546, 3.000000e+00
  br i1 %cmp547, label %if.then549, label %if.end556

if.then549:                                       ; preds = %if.end540
  store i32 135, i32* %lrc, align 4
  %tmp550 = load i32* %prlc, align 4
  %tobool551 = icmp ne i32 %tmp550, 0
  br i1 %tobool551, label %if.then552, label %if.end555

if.then552:                                       ; preds = %if.then549
  %tmp553 = load i32* %lrc, align 4
  %call554 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp553)
  br label %if.end555

if.end555:                                        ; preds = %if.then552, %if.then549
  br label %if.end556

if.end556:                                        ; preds = %if.end555, %if.end540
  store float 5.000000e+00, float* %fl, align 4
  store i32 2, i32* %ir, align 4
  %tmp557 = load i32* %ir, align 4
  %conv558 = sitofp i32 %tmp557 to float
  %tmp559 = load float* %fl, align 4
  %sub560 = fsub float %tmp559, %conv558
  store float %sub560, float* %fl, align 4
  %tmp561 = load float* %fl, align 4
  %cmp562 = fcmp une float %tmp561, 3.000000e+00
  br i1 %cmp562, label %if.then564, label %if.end571

if.then564:                                       ; preds = %if.end556
  store i32 136, i32* %lrc, align 4
  %tmp565 = load i32* %prlc, align 4
  %tobool566 = icmp ne i32 %tmp565, 0
  br i1 %tobool566, label %if.then567, label %if.end570

if.then567:                                       ; preds = %if.then564
  %tmp568 = load i32* %lrc, align 4
  %call569 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp568)
  br label %if.end570

if.end570:                                        ; preds = %if.then567, %if.then564
  br label %if.end571

if.end571:                                        ; preds = %if.end570, %if.end556
  store float 5.000000e+00, float* %fl, align 4
  store i64 2, i64* %lr, align 8
  %tmp572 = load i64* %lr, align 8
  %conv573 = sitofp i64 %tmp572 to float
  %tmp574 = load float* %fl, align 4
  %sub575 = fsub float %tmp574, %conv573
  store float %sub575, float* %fl, align 4
  %tmp576 = load float* %fl, align 4
  %cmp577 = fcmp une float %tmp576, 3.000000e+00
  br i1 %cmp577, label %if.then579, label %if.end586

if.then579:                                       ; preds = %if.end571
  store i32 137, i32* %lrc, align 4
  %tmp580 = load i32* %prlc, align 4
  %tobool581 = icmp ne i32 %tmp580, 0
  br i1 %tobool581, label %if.then582, label %if.end585

if.then582:                                       ; preds = %if.then579
  %tmp583 = load i32* %lrc, align 4
  %call584 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp583)
  br label %if.end585

if.end585:                                        ; preds = %if.then582, %if.then579
  br label %if.end586

if.end586:                                        ; preds = %if.end585, %if.end571
  store float 5.000000e+00, float* %fl, align 4
  store i32 2, i32* %ur, align 4
  %tmp587 = load i32* %ur, align 4
  %conv588 = uitofp i32 %tmp587 to float
  %tmp589 = load float* %fl, align 4
  %sub590 = fsub float %tmp589, %conv588
  store float %sub590, float* %fl, align 4
  %tmp591 = load float* %fl, align 4
  %cmp592 = fcmp une float %tmp591, 3.000000e+00
  br i1 %cmp592, label %if.then594, label %if.end601

if.then594:                                       ; preds = %if.end586
  store i32 138, i32* %lrc, align 4
  %tmp595 = load i32* %prlc, align 4
  %tobool596 = icmp ne i32 %tmp595, 0
  br i1 %tobool596, label %if.then597, label %if.end600

if.then597:                                       ; preds = %if.then594
  %tmp598 = load i32* %lrc, align 4
  %call599 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp598)
  br label %if.end600

if.end600:                                        ; preds = %if.then597, %if.then594
  br label %if.end601

if.end601:                                        ; preds = %if.end600, %if.end586
  store float 5.000000e+00, float* %fl, align 4
  store float 2.000000e+00, float* %fr, align 4
  %tmp602 = load float* %fr, align 4
  %tmp603 = load float* %fl, align 4
  %sub604 = fsub float %tmp603, %tmp602
  store float %sub604, float* %fl, align 4
  %tmp605 = load float* %fl, align 4
  %cmp606 = fcmp une float %tmp605, 3.000000e+00
  br i1 %cmp606, label %if.then608, label %if.end615

if.then608:                                       ; preds = %if.end601
  store i32 139, i32* %lrc, align 4
  %tmp609 = load i32* %prlc, align 4
  %tobool610 = icmp ne i32 %tmp609, 0
  br i1 %tobool610, label %if.then611, label %if.end614

if.then611:                                       ; preds = %if.then608
  %tmp612 = load i32* %lrc, align 4
  %call613 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp612)
  br label %if.end614

if.end614:                                        ; preds = %if.then611, %if.then608
  br label %if.end615

if.end615:                                        ; preds = %if.end614, %if.end601
  store float 5.000000e+00, float* %fl, align 4
  store double 2.000000e+00, double* %dr, align 8
  %tmp616 = load double* %dr, align 8
  %tmp617 = load float* %fl, align 4
  %conv618 = fpext float %tmp617 to double
  %sub619 = fsub double %conv618, %tmp616
  %conv620 = fptrunc double %sub619 to float
  store float %conv620, float* %fl, align 4
  %tmp621 = load float* %fl, align 4
  %cmp622 = fcmp une float %tmp621, 3.000000e+00
  br i1 %cmp622, label %if.then624, label %if.end631

if.then624:                                       ; preds = %if.end615
  store i32 140, i32* %lrc, align 4
  %tmp625 = load i32* %prlc, align 4
  %tobool626 = icmp ne i32 %tmp625, 0
  br i1 %tobool626, label %if.then627, label %if.end630

if.then627:                                       ; preds = %if.then624
  %tmp628 = load i32* %lrc, align 4
  %call629 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp628)
  br label %if.end630

if.end630:                                        ; preds = %if.then627, %if.then624
  br label %if.end631

if.end631:                                        ; preds = %if.end630, %if.end615
  store double 5.000000e+00, double* %dl, align 8
  store i8 2, i8* %cr, align 1
  %tmp632 = load i8* %cr, align 1
  %conv633 = sext i8 %tmp632 to i32
  %conv634 = sitofp i32 %conv633 to double
  %tmp635 = load double* %dl, align 8
  %sub636 = fsub double %tmp635, %conv634
  store double %sub636, double* %dl, align 8
  %tmp637 = load double* %dl, align 8
  %cmp638 = fcmp une double %tmp637, 3.000000e+00
  br i1 %cmp638, label %if.then640, label %if.end647

if.then640:                                       ; preds = %if.end631
  store i32 141, i32* %lrc, align 4
  %tmp641 = load i32* %prlc, align 4
  %tobool642 = icmp ne i32 %tmp641, 0
  br i1 %tobool642, label %if.then643, label %if.end646

if.then643:                                       ; preds = %if.then640
  %tmp644 = load i32* %lrc, align 4
  %call645 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp644)
  br label %if.end646

if.end646:                                        ; preds = %if.then643, %if.then640
  br label %if.end647

if.end647:                                        ; preds = %if.end646, %if.end631
  store double 5.000000e+00, double* %dl, align 8
  store i16 2, i16* %sr, align 2
  %tmp648 = load i16* %sr, align 2
  %conv649 = sext i16 %tmp648 to i32
  %conv650 = sitofp i32 %conv649 to double
  %tmp651 = load double* %dl, align 8
  %sub652 = fsub double %tmp651, %conv650
  store double %sub652, double* %dl, align 8
  %tmp653 = load double* %dl, align 8
  %cmp654 = fcmp une double %tmp653, 3.000000e+00
  br i1 %cmp654, label %if.then656, label %if.end663

if.then656:                                       ; preds = %if.end647
  store i32 142, i32* %lrc, align 4
  %tmp657 = load i32* %prlc, align 4
  %tobool658 = icmp ne i32 %tmp657, 0
  br i1 %tobool658, label %if.then659, label %if.end662

if.then659:                                       ; preds = %if.then656
  %tmp660 = load i32* %lrc, align 4
  %call661 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp660)
  br label %if.end662

if.end662:                                        ; preds = %if.then659, %if.then656
  br label %if.end663

if.end663:                                        ; preds = %if.end662, %if.end647
  store double 5.000000e+00, double* %dl, align 8
  store i32 2, i32* %ir, align 4
  %tmp664 = load i32* %ir, align 4
  %conv665 = sitofp i32 %tmp664 to double
  %tmp666 = load double* %dl, align 8
  %sub667 = fsub double %tmp666, %conv665
  store double %sub667, double* %dl, align 8
  %tmp668 = load double* %dl, align 8
  %cmp669 = fcmp une double %tmp668, 3.000000e+00
  br i1 %cmp669, label %if.then671, label %if.end678

if.then671:                                       ; preds = %if.end663
  store i32 143, i32* %lrc, align 4
  %tmp672 = load i32* %prlc, align 4
  %tobool673 = icmp ne i32 %tmp672, 0
  br i1 %tobool673, label %if.then674, label %if.end677

if.then674:                                       ; preds = %if.then671
  %tmp675 = load i32* %lrc, align 4
  %call676 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp675)
  br label %if.end677

if.end677:                                        ; preds = %if.then674, %if.then671
  br label %if.end678

if.end678:                                        ; preds = %if.end677, %if.end663
  store double 5.000000e+00, double* %dl, align 8
  store i64 2, i64* %lr, align 8
  %tmp679 = load i64* %lr, align 8
  %conv680 = sitofp i64 %tmp679 to double
  %tmp681 = load double* %dl, align 8
  %sub682 = fsub double %tmp681, %conv680
  store double %sub682, double* %dl, align 8
  %tmp683 = load double* %dl, align 8
  %cmp684 = fcmp une double %tmp683, 3.000000e+00
  br i1 %cmp684, label %if.then686, label %if.end693

if.then686:                                       ; preds = %if.end678
  store i32 144, i32* %lrc, align 4
  %tmp687 = load i32* %prlc, align 4
  %tobool688 = icmp ne i32 %tmp687, 0
  br i1 %tobool688, label %if.then689, label %if.end692

if.then689:                                       ; preds = %if.then686
  %tmp690 = load i32* %lrc, align 4
  %call691 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp690)
  br label %if.end692

if.end692:                                        ; preds = %if.then689, %if.then686
  br label %if.end693

if.end693:                                        ; preds = %if.end692, %if.end678
  store double 5.000000e+00, double* %dl, align 8
  store i32 2, i32* %ur, align 4
  %tmp694 = load i32* %ur, align 4
  %conv695 = uitofp i32 %tmp694 to double
  %tmp696 = load double* %dl, align 8
  %sub697 = fsub double %tmp696, %conv695
  store double %sub697, double* %dl, align 8
  %tmp698 = load double* %dl, align 8
  %cmp699 = fcmp une double %tmp698, 3.000000e+00
  br i1 %cmp699, label %if.then701, label %if.end708

if.then701:                                       ; preds = %if.end693
  store i32 145, i32* %lrc, align 4
  %tmp702 = load i32* %prlc, align 4
  %tobool703 = icmp ne i32 %tmp702, 0
  br i1 %tobool703, label %if.then704, label %if.end707

if.then704:                                       ; preds = %if.then701
  %tmp705 = load i32* %lrc, align 4
  %call706 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp705)
  br label %if.end707

if.end707:                                        ; preds = %if.then704, %if.then701
  br label %if.end708

if.end708:                                        ; preds = %if.end707, %if.end693
  store double 5.000000e+00, double* %dl, align 8
  store float 2.000000e+00, float* %fr, align 4
  %tmp709 = load float* %fr, align 4
  %conv710 = fpext float %tmp709 to double
  %tmp711 = load double* %dl, align 8
  %sub712 = fsub double %tmp711, %conv710
  store double %sub712, double* %dl, align 8
  %tmp713 = load double* %dl, align 8
  %cmp714 = fcmp une double %tmp713, 3.000000e+00
  br i1 %cmp714, label %if.then716, label %if.end723

if.then716:                                       ; preds = %if.end708
  store i32 146, i32* %lrc, align 4
  %tmp717 = load i32* %prlc, align 4
  %tobool718 = icmp ne i32 %tmp717, 0
  br i1 %tobool718, label %if.then719, label %if.end722

if.then719:                                       ; preds = %if.then716
  %tmp720 = load i32* %lrc, align 4
  %call721 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp720)
  br label %if.end722

if.end722:                                        ; preds = %if.then719, %if.then716
  br label %if.end723

if.end723:                                        ; preds = %if.end722, %if.end708
  store double 5.000000e+00, double* %dl, align 8
  store double 2.000000e+00, double* %dr, align 8
  %tmp724 = load double* %dr, align 8
  %tmp725 = load double* %dl, align 8
  %sub726 = fsub double %tmp725, %tmp724
  store double %sub726, double* %dl, align 8
  %tmp727 = load double* %dl, align 8
  %cmp728 = fcmp une double %tmp727, 3.000000e+00
  br i1 %cmp728, label %if.then730, label %if.end737

if.then730:                                       ; preds = %if.end723
  store i32 147, i32* %lrc, align 4
  %tmp731 = load i32* %prlc, align 4
  %tobool732 = icmp ne i32 %tmp731, 0
  br i1 %tobool732, label %if.then733, label %if.end736

if.then733:                                       ; preds = %if.then730
  %tmp734 = load i32* %lrc, align 4
  %call735 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp734)
  br label %if.end736

if.end736:                                        ; preds = %if.then733, %if.then730
  br label %if.end737

if.end737:                                        ; preds = %if.end736, %if.end723
  store i8 5, i8* %cl, align 1
  store i8 2, i8* %cr, align 1
  %tmp738 = load i8* %cr, align 1
  %conv739 = sext i8 %tmp738 to i32
  %tmp740 = load i8* %cl, align 1
  %conv741 = sext i8 %tmp740 to i32
  %mul = mul nsw i32 %conv741, %conv739
  %conv742 = trunc i32 %mul to i8
  store i8 %conv742, i8* %cl, align 1
  %tmp743 = load i8* %cl, align 1
  %conv744 = sext i8 %tmp743 to i32
  %cmp745 = icmp ne i32 %conv744, 10
  br i1 %cmp745, label %if.then747, label %if.end754

if.then747:                                       ; preds = %if.end737
  store i32 148, i32* %lrc, align 4
  %tmp748 = load i32* %prlc, align 4
  %tobool749 = icmp ne i32 %tmp748, 0
  br i1 %tobool749, label %if.then750, label %if.end753

if.then750:                                       ; preds = %if.then747
  %tmp751 = load i32* %lrc, align 4
  %call752 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp751)
  br label %if.end753

if.end753:                                        ; preds = %if.then750, %if.then747
  br label %if.end754

if.end754:                                        ; preds = %if.end753, %if.end737
  store i8 5, i8* %cl, align 1
  store i16 2, i16* %sr, align 2
  %tmp755 = load i16* %sr, align 2
  %conv756 = sext i16 %tmp755 to i32
  %tmp757 = load i8* %cl, align 1
  %conv758 = sext i8 %tmp757 to i32
  %mul759 = mul nsw i32 %conv758, %conv756
  %conv760 = trunc i32 %mul759 to i8
  store i8 %conv760, i8* %cl, align 1
  %tmp761 = load i8* %cl, align 1
  %conv762 = sext i8 %tmp761 to i32
  %cmp763 = icmp ne i32 %conv762, 10
  br i1 %cmp763, label %if.then765, label %if.end772

if.then765:                                       ; preds = %if.end754
  store i32 149, i32* %lrc, align 4
  %tmp766 = load i32* %prlc, align 4
  %tobool767 = icmp ne i32 %tmp766, 0
  br i1 %tobool767, label %if.then768, label %if.end771

if.then768:                                       ; preds = %if.then765
  %tmp769 = load i32* %lrc, align 4
  %call770 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp769)
  br label %if.end771

if.end771:                                        ; preds = %if.then768, %if.then765
  br label %if.end772

if.end772:                                        ; preds = %if.end771, %if.end754
  store i8 5, i8* %cl, align 1
  store i32 2, i32* %ir, align 4
  %tmp773 = load i32* %ir, align 4
  %tmp774 = load i8* %cl, align 1
  %conv775 = sext i8 %tmp774 to i32
  %mul776 = mul nsw i32 %conv775, %tmp773
  %conv777 = trunc i32 %mul776 to i8
  store i8 %conv777, i8* %cl, align 1
  %tmp778 = load i8* %cl, align 1
  %conv779 = sext i8 %tmp778 to i32
  %cmp780 = icmp ne i32 %conv779, 10
  br i1 %cmp780, label %if.then782, label %if.end789

if.then782:                                       ; preds = %if.end772
  store i32 150, i32* %lrc, align 4
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
