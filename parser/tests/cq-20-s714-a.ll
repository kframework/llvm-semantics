; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/cq-20-s714-a.c'
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
  store i8 2, i8* %cr, align 1
  %tmp7 = load i8* %cr, align 1
  store i8 %tmp7, i8* %cl, align 1
  %tmp8 = load i8* %cl, align 1
  %conv = sext i8 %tmp8 to i32
  %cmp = icmp ne i32 %conv, 2
  br i1 %cmp, label %if.then, label %if.end14

if.then:                                          ; preds = %while.end
  store i32 1, i32* %lrc, align 4
  %tmp10 = load i32* %prlc, align 4
  %tobool11 = icmp ne i32 %tmp10, 0
  br i1 %tobool11, label %if.then12, label %if.end

if.then12:                                        ; preds = %if.then
  %tmp13 = load i32* %lrc, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp13)
  br label %if.end

if.end:                                           ; preds = %if.then12, %if.then
  br label %if.end14

if.end14:                                         ; preds = %if.end, %while.end
  store i8 5, i8* %cl, align 1
  store i16 2, i16* %sr, align 2
  %tmp15 = load i16* %sr, align 2
  %conv16 = trunc i16 %tmp15 to i8
  store i8 %conv16, i8* %cl, align 1
  %tmp17 = load i8* %cl, align 1
  %conv18 = sext i8 %tmp17 to i32
  %cmp19 = icmp ne i32 %conv18, 2
  br i1 %cmp19, label %if.then21, label %if.end28

if.then21:                                        ; preds = %if.end14
  store i32 2, i32* %lrc, align 4
  %tmp22 = load i32* %prlc, align 4
  %tobool23 = icmp ne i32 %tmp22, 0
  br i1 %tobool23, label %if.then24, label %if.end27

if.then24:                                        ; preds = %if.then21
  %tmp25 = load i32* %lrc, align 4
  %call26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp25)
  br label %if.end27

if.end27:                                         ; preds = %if.then24, %if.then21
  br label %if.end28

if.end28:                                         ; preds = %if.end27, %if.end14
  store i8 5, i8* %cl, align 1
  store i32 2, i32* %ir, align 4
  %tmp29 = load i32* %ir, align 4
  %conv30 = trunc i32 %tmp29 to i8
  store i8 %conv30, i8* %cl, align 1
  %tmp31 = load i8* %cl, align 1
  %conv32 = sext i8 %tmp31 to i32
  %cmp33 = icmp ne i32 %conv32, 2
  br i1 %cmp33, label %if.then35, label %if.end42

if.then35:                                        ; preds = %if.end28
  store i32 3, i32* %lrc, align 4
  %tmp36 = load i32* %prlc, align 4
  %tobool37 = icmp ne i32 %tmp36, 0
  br i1 %tobool37, label %if.then38, label %if.end41

if.then38:                                        ; preds = %if.then35
  %tmp39 = load i32* %lrc, align 4
  %call40 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp39)
  br label %if.end41

if.end41:                                         ; preds = %if.then38, %if.then35
  br label %if.end42

if.end42:                                         ; preds = %if.end41, %if.end28
  store i8 5, i8* %cl, align 1
  store i64 2, i64* %lr, align 8
  %tmp43 = load i64* %lr, align 8
  %conv44 = trunc i64 %tmp43 to i8
  store i8 %conv44, i8* %cl, align 1
  %tmp45 = load i8* %cl, align 1
  %conv46 = sext i8 %tmp45 to i32
  %cmp47 = icmp ne i32 %conv46, 2
  br i1 %cmp47, label %if.then49, label %if.end56

if.then49:                                        ; preds = %if.end42
  store i32 4, i32* %lrc, align 4
  %tmp50 = load i32* %prlc, align 4
  %tobool51 = icmp ne i32 %tmp50, 0
  br i1 %tobool51, label %if.then52, label %if.end55

if.then52:                                        ; preds = %if.then49
  %tmp53 = load i32* %lrc, align 4
  %call54 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp53)
  br label %if.end55

if.end55:                                         ; preds = %if.then52, %if.then49
  br label %if.end56

if.end56:                                         ; preds = %if.end55, %if.end42
  store i8 5, i8* %cl, align 1
  store i32 2, i32* %ur, align 4
  %tmp57 = load i32* %ur, align 4
  %conv58 = trunc i32 %tmp57 to i8
  store i8 %conv58, i8* %cl, align 1
  %tmp59 = load i8* %cl, align 1
  %conv60 = sext i8 %tmp59 to i32
  %cmp61 = icmp ne i32 %conv60, 2
  br i1 %cmp61, label %if.then63, label %if.end70

if.then63:                                        ; preds = %if.end56
  store i32 5, i32* %lrc, align 4
  %tmp64 = load i32* %prlc, align 4
  %tobool65 = icmp ne i32 %tmp64, 0
  br i1 %tobool65, label %if.then66, label %if.end69

if.then66:                                        ; preds = %if.then63
  %tmp67 = load i32* %lrc, align 4
  %call68 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp67)
  br label %if.end69

if.end69:                                         ; preds = %if.then66, %if.then63
  br label %if.end70

if.end70:                                         ; preds = %if.end69, %if.end56
  store i8 5, i8* %cl, align 1
  store float 2.000000e+00, float* %fr, align 4
  %tmp71 = load float* %fr, align 4
  %conv72 = fptosi float %tmp71 to i8
  store i8 %conv72, i8* %cl, align 1
  %tmp73 = load i8* %cl, align 1
  %conv74 = sext i8 %tmp73 to i32
  %cmp75 = icmp ne i32 %conv74, 2
  br i1 %cmp75, label %if.then77, label %if.end84

if.then77:                                        ; preds = %if.end70
  store i32 6, i32* %lrc, align 4
  %tmp78 = load i32* %prlc, align 4
  %tobool79 = icmp ne i32 %tmp78, 0
  br i1 %tobool79, label %if.then80, label %if.end83

if.then80:                                        ; preds = %if.then77
  %tmp81 = load i32* %lrc, align 4
  %call82 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp81)
  br label %if.end83

if.end83:                                         ; preds = %if.then80, %if.then77
  br label %if.end84

if.end84:                                         ; preds = %if.end83, %if.end70
  store i8 5, i8* %cl, align 1
  store double 2.000000e+00, double* %dr, align 8
  %tmp85 = load double* %dr, align 8
  %conv86 = fptosi double %tmp85 to i8
  store i8 %conv86, i8* %cl, align 1
  %tmp87 = load i8* %cl, align 1
  %conv88 = sext i8 %tmp87 to i32
  %cmp89 = icmp ne i32 %conv88, 2
  br i1 %cmp89, label %if.then91, label %if.end98

if.then91:                                        ; preds = %if.end84
  store i32 7, i32* %lrc, align 4
  %tmp92 = load i32* %prlc, align 4
  %tobool93 = icmp ne i32 %tmp92, 0
  br i1 %tobool93, label %if.then94, label %if.end97

if.then94:                                        ; preds = %if.then91
  %tmp95 = load i32* %lrc, align 4
  %call96 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp95)
  br label %if.end97

if.end97:                                         ; preds = %if.then94, %if.then91
  br label %if.end98

if.end98:                                         ; preds = %if.end97, %if.end84
  store i16 5, i16* %sl, align 2
  store i8 2, i8* %cr, align 1
  %tmp99 = load i8* %cr, align 1
  %conv100 = sext i8 %tmp99 to i16
  store i16 %conv100, i16* %sl, align 2
  %tmp101 = load i16* %sl, align 2
  %conv102 = sext i16 %tmp101 to i32
  %cmp103 = icmp ne i32 %conv102, 2
  br i1 %cmp103, label %if.then105, label %if.end112

if.then105:                                       ; preds = %if.end98
  store i32 8, i32* %lrc, align 4
  %tmp106 = load i32* %prlc, align 4
  %tobool107 = icmp ne i32 %tmp106, 0
  br i1 %tobool107, label %if.then108, label %if.end111

if.then108:                                       ; preds = %if.then105
  %tmp109 = load i32* %lrc, align 4
  %call110 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp109)
  br label %if.end111

if.end111:                                        ; preds = %if.then108, %if.then105
  br label %if.end112

if.end112:                                        ; preds = %if.end111, %if.end98
  store i16 5, i16* %sl, align 2
  store i16 2, i16* %sr, align 2
  %tmp113 = load i16* %sr, align 2
  store i16 %tmp113, i16* %sl, align 2
  %tmp114 = load i16* %sl, align 2
  %conv115 = sext i16 %tmp114 to i32
  %cmp116 = icmp ne i32 %conv115, 2
  br i1 %cmp116, label %if.then118, label %if.end125

if.then118:                                       ; preds = %if.end112
  store i32 9, i32* %lrc, align 4
  %tmp119 = load i32* %prlc, align 4
  %tobool120 = icmp ne i32 %tmp119, 0
  br i1 %tobool120, label %if.then121, label %if.end124

if.then121:                                       ; preds = %if.then118
  %tmp122 = load i32* %lrc, align 4
  %call123 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp122)
  br label %if.end124

if.end124:                                        ; preds = %if.then121, %if.then118
  br label %if.end125

if.end125:                                        ; preds = %if.end124, %if.end112
  store i16 5, i16* %sl, align 2
  store i32 2, i32* %ir, align 4
  %tmp126 = load i32* %ir, align 4
  %conv127 = trunc i32 %tmp126 to i16
  store i16 %conv127, i16* %sl, align 2
  %tmp128 = load i16* %sl, align 2
  %conv129 = sext i16 %tmp128 to i32
  %cmp130 = icmp ne i32 %conv129, 2
  br i1 %cmp130, label %if.then132, label %if.end139

if.then132:                                       ; preds = %if.end125
  store i32 10, i32* %lrc, align 4
  %tmp133 = load i32* %prlc, align 4
  %tobool134 = icmp ne i32 %tmp133, 0
  br i1 %tobool134, label %if.then135, label %if.end138

if.then135:                                       ; preds = %if.then132
  %tmp136 = load i32* %lrc, align 4
  %call137 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp136)
  br label %if.end138

if.end138:                                        ; preds = %if.then135, %if.then132
  br label %if.end139

if.end139:                                        ; preds = %if.end138, %if.end125
  store i16 5, i16* %sl, align 2
  store i64 2, i64* %lr, align 8
  %tmp140 = load i64* %lr, align 8
  %conv141 = trunc i64 %tmp140 to i16
  store i16 %conv141, i16* %sl, align 2
  %tmp142 = load i16* %sl, align 2
  %conv143 = sext i16 %tmp142 to i32
  %cmp144 = icmp ne i32 %conv143, 2
  br i1 %cmp144, label %if.then146, label %if.end153

if.then146:                                       ; preds = %if.end139
  store i32 11, i32* %lrc, align 4
  %tmp147 = load i32* %prlc, align 4
  %tobool148 = icmp ne i32 %tmp147, 0
  br i1 %tobool148, label %if.then149, label %if.end152

if.then149:                                       ; preds = %if.then146
  %tmp150 = load i32* %lrc, align 4
  %call151 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp150)
  br label %if.end152

if.end152:                                        ; preds = %if.then149, %if.then146
  br label %if.end153

if.end153:                                        ; preds = %if.end152, %if.end139
  store i16 5, i16* %sl, align 2
  store i32 2, i32* %ur, align 4
  %tmp154 = load i32* %ur, align 4
  %conv155 = trunc i32 %tmp154 to i16
  store i16 %conv155, i16* %sl, align 2
  %tmp156 = load i16* %sl, align 2
  %conv157 = sext i16 %tmp156 to i32
  %cmp158 = icmp ne i32 %conv157, 2
  br i1 %cmp158, label %if.then160, label %if.end167

if.then160:                                       ; preds = %if.end153
  store i32 12, i32* %lrc, align 4
  %tmp161 = load i32* %prlc, align 4
  %tobool162 = icmp ne i32 %tmp161, 0
  br i1 %tobool162, label %if.then163, label %if.end166

if.then163:                                       ; preds = %if.then160
  %tmp164 = load i32* %lrc, align 4
  %call165 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp164)
  br label %if.end166

if.end166:                                        ; preds = %if.then163, %if.then160
  br label %if.end167

if.end167:                                        ; preds = %if.end166, %if.end153
  store i16 5, i16* %sl, align 2
  store float 2.000000e+00, float* %fr, align 4
  %tmp168 = load float* %fr, align 4
  %conv169 = fptosi float %tmp168 to i16
  store i16 %conv169, i16* %sl, align 2
  %tmp170 = load i16* %sl, align 2
  %conv171 = sext i16 %tmp170 to i32
  %cmp172 = icmp ne i32 %conv171, 2
  br i1 %cmp172, label %if.then174, label %if.end181

if.then174:                                       ; preds = %if.end167
  store i32 13, i32* %lrc, align 4
  %tmp175 = load i32* %prlc, align 4
  %tobool176 = icmp ne i32 %tmp175, 0
  br i1 %tobool176, label %if.then177, label %if.end180

if.then177:                                       ; preds = %if.then174
  %tmp178 = load i32* %lrc, align 4
  %call179 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp178)
  br label %if.end180

if.end180:                                        ; preds = %if.then177, %if.then174
  br label %if.end181

if.end181:                                        ; preds = %if.end180, %if.end167
  store i16 5, i16* %sl, align 2
  store double 2.000000e+00, double* %dr, align 8
  %tmp182 = load double* %dr, align 8
  %conv183 = fptosi double %tmp182 to i16
  store i16 %conv183, i16* %sl, align 2
  %tmp184 = load i16* %sl, align 2
  %conv185 = sext i16 %tmp184 to i32
  %cmp186 = icmp ne i32 %conv185, 2
  br i1 %cmp186, label %if.then188, label %if.end195

if.then188:                                       ; preds = %if.end181
  store i32 14, i32* %lrc, align 4
  %tmp189 = load i32* %prlc, align 4
  %tobool190 = icmp ne i32 %tmp189, 0
  br i1 %tobool190, label %if.then191, label %if.end194

if.then191:                                       ; preds = %if.then188
  %tmp192 = load i32* %lrc, align 4
  %call193 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp192)
  br label %if.end194

if.end194:                                        ; preds = %if.then191, %if.then188
  br label %if.end195

if.end195:                                        ; preds = %if.end194, %if.end181
  store i32 5, i32* %il, align 4
  store i8 2, i8* %cr, align 1
  %tmp196 = load i8* %cr, align 1
  %conv197 = sext i8 %tmp196 to i32
  store i32 %conv197, i32* %il, align 4
  %tmp198 = load i32* %il, align 4
  %cmp199 = icmp ne i32 %tmp198, 2
  br i1 %cmp199, label %if.then201, label %if.end208

if.then201:                                       ; preds = %if.end195
  store i32 15, i32* %lrc, align 4
  %tmp202 = load i32* %prlc, align 4
  %tobool203 = icmp ne i32 %tmp202, 0
  br i1 %tobool203, label %if.then204, label %if.end207

if.then204:                                       ; preds = %if.then201
  %tmp205 = load i32* %lrc, align 4
  %call206 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp205)
  br label %if.end207

if.end207:                                        ; preds = %if.then204, %if.then201
  br label %if.end208

if.end208:                                        ; preds = %if.end207, %if.end195
  store i32 5, i32* %il, align 4
  store i16 2, i16* %sr, align 2
  %tmp209 = load i16* %sr, align 2
  %conv210 = sext i16 %tmp209 to i32
  store i32 %conv210, i32* %il, align 4
  %tmp211 = load i32* %il, align 4
  %cmp212 = icmp ne i32 %tmp211, 2
  br i1 %cmp212, label %if.then214, label %if.end221

if.then214:                                       ; preds = %if.end208
  store i32 16, i32* %lrc, align 4
  %tmp215 = load i32* %prlc, align 4
  %tobool216 = icmp ne i32 %tmp215, 0
  br i1 %tobool216, label %if.then217, label %if.end220

if.then217:                                       ; preds = %if.then214
  %tmp218 = load i32* %lrc, align 4
  %call219 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp218)
  br label %if.end220

if.end220:                                        ; preds = %if.then217, %if.then214
  br label %if.end221

if.end221:                                        ; preds = %if.end220, %if.end208
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ir, align 4
  %tmp222 = load i32* %ir, align 4
  store i32 %tmp222, i32* %il, align 4
  %tmp223 = load i32* %il, align 4
  %cmp224 = icmp ne i32 %tmp223, 2
  br i1 %cmp224, label %if.then226, label %if.end233

if.then226:                                       ; preds = %if.end221
  store i32 17, i32* %lrc, align 4
  %tmp227 = load i32* %prlc, align 4
  %tobool228 = icmp ne i32 %tmp227, 0
  br i1 %tobool228, label %if.then229, label %if.end232

if.then229:                                       ; preds = %if.then226
  %tmp230 = load i32* %lrc, align 4
  %call231 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp230)
  br label %if.end232

if.end232:                                        ; preds = %if.then229, %if.then226
  br label %if.end233

if.end233:                                        ; preds = %if.end232, %if.end221
  store i32 5, i32* %il, align 4
  store i64 2, i64* %lr, align 8
  %tmp234 = load i64* %lr, align 8
  %conv235 = trunc i64 %tmp234 to i32
  store i32 %conv235, i32* %il, align 4
  %tmp236 = load i32* %il, align 4
  %cmp237 = icmp ne i32 %tmp236, 2
  br i1 %cmp237, label %if.then239, label %if.end246

if.then239:                                       ; preds = %if.end233
  store i32 18, i32* %lrc, align 4
  %tmp240 = load i32* %prlc, align 4
  %tobool241 = icmp ne i32 %tmp240, 0
  br i1 %tobool241, label %if.then242, label %if.end245

if.then242:                                       ; preds = %if.then239
  %tmp243 = load i32* %lrc, align 4
  %call244 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp243)
  br label %if.end245

if.end245:                                        ; preds = %if.then242, %if.then239
  br label %if.end246

if.end246:                                        ; preds = %if.end245, %if.end233
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ur, align 4
  %tmp247 = load i32* %ur, align 4
  store i32 %tmp247, i32* %il, align 4
  %tmp248 = load i32* %il, align 4
  %cmp249 = icmp ne i32 %tmp248, 2
  br i1 %cmp249, label %if.then251, label %if.end258

if.then251:                                       ; preds = %if.end246
  store i32 19, i32* %lrc, align 4
  %tmp252 = load i32* %prlc, align 4
  %tobool253 = icmp ne i32 %tmp252, 0
  br i1 %tobool253, label %if.then254, label %if.end257

if.then254:                                       ; preds = %if.then251
  %tmp255 = load i32* %lrc, align 4
  %call256 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp255)
  br label %if.end257

if.end257:                                        ; preds = %if.then254, %if.then251
  br label %if.end258

if.end258:                                        ; preds = %if.end257, %if.end246
  store i32 5, i32* %il, align 4
  store float 2.000000e+00, float* %fr, align 4
  %tmp259 = load float* %fr, align 4
  %conv260 = fptosi float %tmp259 to i32
  store i32 %conv260, i32* %il, align 4
  %tmp261 = load i32* %il, align 4
  %cmp262 = icmp ne i32 %tmp261, 2
  br i1 %cmp262, label %if.then264, label %if.end271

if.then264:                                       ; preds = %if.end258
  store i32 20, i32* %lrc, align 4
  %tmp265 = load i32* %prlc, align 4
  %tobool266 = icmp ne i32 %tmp265, 0
  br i1 %tobool266, label %if.then267, label %if.end270

if.then267:                                       ; preds = %if.then264
  %tmp268 = load i32* %lrc, align 4
  %call269 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp268)
  br label %if.end270

if.end270:                                        ; preds = %if.then267, %if.then264
  br label %if.end271

if.end271:                                        ; preds = %if.end270, %if.end258
  store i32 5, i32* %il, align 4
  store double 2.000000e+00, double* %dr, align 8
  %tmp272 = load double* %dr, align 8
  %conv273 = fptosi double %tmp272 to i32
  store i32 %conv273, i32* %il, align 4
  %tmp274 = load i32* %il, align 4
  %cmp275 = icmp ne i32 %tmp274, 2
  br i1 %cmp275, label %if.then277, label %if.end284

if.then277:                                       ; preds = %if.end271
  store i32 21, i32* %lrc, align 4
  %tmp278 = load i32* %prlc, align 4
  %tobool279 = icmp ne i32 %tmp278, 0
  br i1 %tobool279, label %if.then280, label %if.end283

if.then280:                                       ; preds = %if.then277
  %tmp281 = load i32* %lrc, align 4
  %call282 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp281)
  br label %if.end283

if.end283:                                        ; preds = %if.then280, %if.then277
  br label %if.end284

if.end284:                                        ; preds = %if.end283, %if.end271
  store i64 5, i64* %ll, align 8
  store i8 2, i8* %cr, align 1
  %tmp285 = load i8* %cr, align 1
  %conv286 = sext i8 %tmp285 to i64
  store i64 %conv286, i64* %ll, align 8
  %tmp287 = load i64* %ll, align 8
  %cmp288 = icmp ne i64 %tmp287, 2
  br i1 %cmp288, label %if.then290, label %if.end297

if.then290:                                       ; preds = %if.end284
  store i32 22, i32* %lrc, align 4
  %tmp291 = load i32* %prlc, align 4
  %tobool292 = icmp ne i32 %tmp291, 0
  br i1 %tobool292, label %if.then293, label %if.end296

if.then293:                                       ; preds = %if.then290
  %tmp294 = load i32* %lrc, align 4
  %call295 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp294)
  br label %if.end296

if.end296:                                        ; preds = %if.then293, %if.then290
  br label %if.end297

if.end297:                                        ; preds = %if.end296, %if.end284
  store i64 5, i64* %ll, align 8
  store i16 2, i16* %sr, align 2
  %tmp298 = load i16* %sr, align 2
  %conv299 = sext i16 %tmp298 to i64
  store i64 %conv299, i64* %ll, align 8
  %tmp300 = load i64* %ll, align 8
  %cmp301 = icmp ne i64 %tmp300, 2
  br i1 %cmp301, label %if.then303, label %if.end310

if.then303:                                       ; preds = %if.end297
  store i32 23, i32* %lrc, align 4
  %tmp304 = load i32* %prlc, align 4
  %tobool305 = icmp ne i32 %tmp304, 0
  br i1 %tobool305, label %if.then306, label %if.end309

if.then306:                                       ; preds = %if.then303
  %tmp307 = load i32* %lrc, align 4
  %call308 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp307)
  br label %if.end309

if.end309:                                        ; preds = %if.then306, %if.then303
  br label %if.end310

if.end310:                                        ; preds = %if.end309, %if.end297
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ir, align 4
  %tmp311 = load i32* %ir, align 4
  %conv312 = sext i32 %tmp311 to i64
  store i64 %conv312, i64* %ll, align 8
  %tmp313 = load i64* %ll, align 8
  %cmp314 = icmp ne i64 %tmp313, 2
  br i1 %cmp314, label %if.then316, label %if.end323

if.then316:                                       ; preds = %if.end310
  store i32 24, i32* %lrc, align 4
  %tmp317 = load i32* %prlc, align 4
  %tobool318 = icmp ne i32 %tmp317, 0
  br i1 %tobool318, label %if.then319, label %if.end322

if.then319:                                       ; preds = %if.then316
  %tmp320 = load i32* %lrc, align 4
  %call321 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp320)
  br label %if.end322

if.end322:                                        ; preds = %if.then319, %if.then316
  br label %if.end323

if.end323:                                        ; preds = %if.end322, %if.end310
  store i64 5, i64* %ll, align 8
  store i64 2, i64* %lr, align 8
  %tmp324 = load i64* %lr, align 8
  store i64 %tmp324, i64* %ll, align 8
  %tmp325 = load i64* %ll, align 8
  %cmp326 = icmp ne i64 %tmp325, 2
  br i1 %cmp326, label %if.then328, label %if.end335

if.then328:                                       ; preds = %if.end323
  store i32 25, i32* %lrc, align 4
  %tmp329 = load i32* %prlc, align 4
  %tobool330 = icmp ne i32 %tmp329, 0
  br i1 %tobool330, label %if.then331, label %if.end334

if.then331:                                       ; preds = %if.then328
  %tmp332 = load i32* %lrc, align 4
  %call333 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp332)
  br label %if.end334

if.end334:                                        ; preds = %if.then331, %if.then328
  br label %if.end335

if.end335:                                        ; preds = %if.end334, %if.end323
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ur, align 4
  %tmp336 = load i32* %ur, align 4
  %conv337 = zext i32 %tmp336 to i64
  store i64 %conv337, i64* %ll, align 8
  %tmp338 = load i64* %ll, align 8
  %cmp339 = icmp ne i64 %tmp338, 2
  br i1 %cmp339, label %if.then341, label %if.end348

if.then341:                                       ; preds = %if.end335
  store i32 26, i32* %lrc, align 4
  %tmp342 = load i32* %prlc, align 4
  %tobool343 = icmp ne i32 %tmp342, 0
  br i1 %tobool343, label %if.then344, label %if.end347

if.then344:                                       ; preds = %if.then341
  %tmp345 = load i32* %lrc, align 4
  %call346 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp345)
  br label %if.end347

if.end347:                                        ; preds = %if.then344, %if.then341
  br label %if.end348

if.end348:                                        ; preds = %if.end347, %if.end335
  store i64 5, i64* %ll, align 8
  store float 2.000000e+00, float* %fr, align 4
  %tmp349 = load float* %fr, align 4
  %conv350 = fptosi float %tmp349 to i64
  store i64 %conv350, i64* %ll, align 8
  %tmp351 = load i64* %ll, align 8
  %cmp352 = icmp ne i64 %tmp351, 2
  br i1 %cmp352, label %if.then354, label %if.end361

if.then354:                                       ; preds = %if.end348
  store i32 27, i32* %lrc, align 4
  %tmp355 = load i32* %prlc, align 4
  %tobool356 = icmp ne i32 %tmp355, 0
  br i1 %tobool356, label %if.then357, label %if.end360

if.then357:                                       ; preds = %if.then354
  %tmp358 = load i32* %lrc, align 4
  %call359 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp358)
  br label %if.end360

if.end360:                                        ; preds = %if.then357, %if.then354
  br label %if.end361

if.end361:                                        ; preds = %if.end360, %if.end348
  store i64 5, i64* %ll, align 8
  store double 2.000000e+00, double* %dr, align 8
  %tmp362 = load double* %dr, align 8
  %conv363 = fptosi double %tmp362 to i64
  store i64 %conv363, i64* %ll, align 8
  %tmp364 = load i64* %ll, align 8
  %cmp365 = icmp ne i64 %tmp364, 2
  br i1 %cmp365, label %if.then367, label %if.end374

if.then367:                                       ; preds = %if.end361
  store i32 28, i32* %lrc, align 4
  %tmp368 = load i32* %prlc, align 4
  %tobool369 = icmp ne i32 %tmp368, 0
  br i1 %tobool369, label %if.then370, label %if.end373

if.then370:                                       ; preds = %if.then367
  %tmp371 = load i32* %lrc, align 4
  %call372 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp371)
  br label %if.end373

if.end373:                                        ; preds = %if.then370, %if.then367
  br label %if.end374

if.end374:                                        ; preds = %if.end373, %if.end361
  store i32 5, i32* %ul, align 4
  store i8 2, i8* %cr, align 1
  %tmp375 = load i8* %cr, align 1
  %conv376 = sext i8 %tmp375 to i32
  store i32 %conv376, i32* %ul, align 4
  %tmp377 = load i32* %ul, align 4
  %cmp378 = icmp ne i32 %tmp377, 2
  br i1 %cmp378, label %if.then380, label %if.end387

if.then380:                                       ; preds = %if.end374
  store i32 29, i32* %lrc, align 4
  %tmp381 = load i32* %prlc, align 4
  %tobool382 = icmp ne i32 %tmp381, 0
  br i1 %tobool382, label %if.then383, label %if.end386

if.then383:                                       ; preds = %if.then380
  %tmp384 = load i32* %lrc, align 4
  %call385 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp384)
  br label %if.end386

if.end386:                                        ; preds = %if.then383, %if.then380
  br label %if.end387

if.end387:                                        ; preds = %if.end386, %if.end374
  store i32 5, i32* %ul, align 4
  store i16 2, i16* %sr, align 2
  %tmp388 = load i16* %sr, align 2
  %conv389 = sext i16 %tmp388 to i32
  store i32 %conv389, i32* %ul, align 4
  %tmp390 = load i32* %ul, align 4
  %cmp391 = icmp ne i32 %tmp390, 2
  br i1 %cmp391, label %if.then393, label %if.end400

if.then393:                                       ; preds = %if.end387
  store i32 30, i32* %lrc, align 4
  %tmp394 = load i32* %prlc, align 4
  %tobool395 = icmp ne i32 %tmp394, 0
  br i1 %tobool395, label %if.then396, label %if.end399

if.then396:                                       ; preds = %if.then393
  %tmp397 = load i32* %lrc, align 4
  %call398 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp397)
  br label %if.end399

if.end399:                                        ; preds = %if.then396, %if.then393
  br label %if.end400

if.end400:                                        ; preds = %if.end399, %if.end387
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ir, align 4
  %tmp401 = load i32* %ir, align 4
  store i32 %tmp401, i32* %ul, align 4
  %tmp402 = load i32* %ul, align 4
  %cmp403 = icmp ne i32 %tmp402, 2
  br i1 %cmp403, label %if.then405, label %if.end412

if.then405:                                       ; preds = %if.end400
  store i32 31, i32* %lrc, align 4
  %tmp406 = load i32* %prlc, align 4
  %tobool407 = icmp ne i32 %tmp406, 0
  br i1 %tobool407, label %if.then408, label %if.end411

if.then408:                                       ; preds = %if.then405
  %tmp409 = load i32* %lrc, align 4
  %call410 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp409)
  br label %if.end411

if.end411:                                        ; preds = %if.then408, %if.then405
  br label %if.end412

if.end412:                                        ; preds = %if.end411, %if.end400
  store i32 5, i32* %ul, align 4
  store i64 2, i64* %lr, align 8
  %tmp413 = load i64* %lr, align 8
  %conv414 = trunc i64 %tmp413 to i32
  store i32 %conv414, i32* %ul, align 4
  %tmp415 = load i32* %ul, align 4
  %cmp416 = icmp ne i32 %tmp415, 2
  br i1 %cmp416, label %if.then418, label %if.end425

if.then418:                                       ; preds = %if.end412
  store i32 32, i32* %lrc, align 4
  %tmp419 = load i32* %prlc, align 4
  %tobool420 = icmp ne i32 %tmp419, 0
  br i1 %tobool420, label %if.then421, label %if.end424

if.then421:                                       ; preds = %if.then418
  %tmp422 = load i32* %lrc, align 4
  %call423 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp422)
  br label %if.end424

if.end424:                                        ; preds = %if.then421, %if.then418
  br label %if.end425

if.end425:                                        ; preds = %if.end424, %if.end412
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ur, align 4
  %tmp426 = load i32* %ur, align 4
  store i32 %tmp426, i32* %ul, align 4
  %tmp427 = load i32* %ul, align 4
  %cmp428 = icmp ne i32 %tmp427, 2
  br i1 %cmp428, label %if.then430, label %if.end437

if.then430:                                       ; preds = %if.end425
  store i32 33, i32* %lrc, align 4
  %tmp431 = load i32* %prlc, align 4
  %tobool432 = icmp ne i32 %tmp431, 0
  br i1 %tobool432, label %if.then433, label %if.end436

if.then433:                                       ; preds = %if.then430
  %tmp434 = load i32* %lrc, align 4
  %call435 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp434)
  br label %if.end436

if.end436:                                        ; preds = %if.then433, %if.then430
  br label %if.end437

if.end437:                                        ; preds = %if.end436, %if.end425
  store i32 5, i32* %ul, align 4
  store float 2.000000e+00, float* %fr, align 4
  %tmp438 = load float* %fr, align 4
  %conv439 = fptoui float %tmp438 to i32
  store i32 %conv439, i32* %ul, align 4
  %tmp440 = load i32* %ul, align 4
  %cmp441 = icmp ne i32 %tmp440, 2
  br i1 %cmp441, label %if.then443, label %if.end450

if.then443:                                       ; preds = %if.end437
  store i32 34, i32* %lrc, align 4
  %tmp444 = load i32* %prlc, align 4
  %tobool445 = icmp ne i32 %tmp444, 0
  br i1 %tobool445, label %if.then446, label %if.end449

if.then446:                                       ; preds = %if.then443
  %tmp447 = load i32* %lrc, align 4
  %call448 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp447)
  br label %if.end449

if.end449:                                        ; preds = %if.then446, %if.then443
  br label %if.end450

if.end450:                                        ; preds = %if.end449, %if.end437
  store i32 5, i32* %ul, align 4
  store double 2.000000e+00, double* %dr, align 8
  %tmp451 = load double* %dr, align 8
  %conv452 = fptoui double %tmp451 to i32
  store i32 %conv452, i32* %ul, align 4
  %tmp453 = load i32* %ul, align 4
  %cmp454 = icmp ne i32 %tmp453, 2
  br i1 %cmp454, label %if.then456, label %if.end463

if.then456:                                       ; preds = %if.end450
  store i32 35, i32* %lrc, align 4
  %tmp457 = load i32* %prlc, align 4
  %tobool458 = icmp ne i32 %tmp457, 0
  br i1 %tobool458, label %if.then459, label %if.end462

if.then459:                                       ; preds = %if.then456
  %tmp460 = load i32* %lrc, align 4
  %call461 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp460)
  br label %if.end462

if.end462:                                        ; preds = %if.then459, %if.then456
  br label %if.end463

if.end463:                                        ; preds = %if.end462, %if.end450
  store float 5.000000e+00, float* %fl, align 4
  store i8 2, i8* %cr, align 1
  %tmp464 = load i8* %cr, align 1
  %conv465 = sitofp i8 %tmp464 to float
  store float %conv465, float* %fl, align 4
  %tmp466 = load float* %fl, align 4
  %cmp467 = fcmp une float %tmp466, 2.000000e+00
  br i1 %cmp467, label %if.then469, label %if.end476

if.then469:                                       ; preds = %if.end463
  store i32 36, i32* %lrc, align 4
  %tmp470 = load i32* %prlc, align 4
  %tobool471 = icmp ne i32 %tmp470, 0
  br i1 %tobool471, label %if.then472, label %if.end475

if.then472:                                       ; preds = %if.then469
  %tmp473 = load i32* %lrc, align 4
  %call474 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp473)
  br label %if.end475

if.end475:                                        ; preds = %if.then472, %if.then469
  br label %if.end476

if.end476:                                        ; preds = %if.end475, %if.end463
  store float 5.000000e+00, float* %fl, align 4
  store i16 2, i16* %sr, align 2
  %tmp477 = load i16* %sr, align 2
  %conv478 = sitofp i16 %tmp477 to float
  store float %conv478, float* %fl, align 4
  %tmp479 = load float* %fl, align 4
  %cmp480 = fcmp une float %tmp479, 2.000000e+00
  br i1 %cmp480, label %if.then482, label %if.end489

if.then482:                                       ; preds = %if.end476
  store i32 37, i32* %lrc, align 4
  %tmp483 = load i32* %prlc, align 4
  %tobool484 = icmp ne i32 %tmp483, 0
  br i1 %tobool484, label %if.then485, label %if.end488

if.then485:                                       ; preds = %if.then482
  %tmp486 = load i32* %lrc, align 4
  %call487 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp486)
  br label %if.end488

if.end488:                                        ; preds = %if.then485, %if.then482
  br label %if.end489

if.end489:                                        ; preds = %if.end488, %if.end476
  store float 5.000000e+00, float* %fl, align 4
  store i32 2, i32* %ir, align 4
  %tmp490 = load i32* %ir, align 4
  %conv491 = sitofp i32 %tmp490 to float
  store float %conv491, float* %fl, align 4
  %tmp492 = load float* %fl, align 4
  %cmp493 = fcmp une float %tmp492, 2.000000e+00
  br i1 %cmp493, label %if.then495, label %if.end502

if.then495:                                       ; preds = %if.end489
  store i32 38, i32* %lrc, align 4
  %tmp496 = load i32* %prlc, align 4
  %tobool497 = icmp ne i32 %tmp496, 0
  br i1 %tobool497, label %if.then498, label %if.end501

if.then498:                                       ; preds = %if.then495
  %tmp499 = load i32* %lrc, align 4
  %call500 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp499)
  br label %if.end501

if.end501:                                        ; preds = %if.then498, %if.then495
  br label %if.end502

if.end502:                                        ; preds = %if.end501, %if.end489
  store float 5.000000e+00, float* %fl, align 4
  store i64 2, i64* %lr, align 8
  %tmp503 = load i64* %lr, align 8
  %conv504 = sitofp i64 %tmp503 to float
  store float %conv504, float* %fl, align 4
  %tmp505 = load float* %fl, align 4
  %cmp506 = fcmp une float %tmp505, 2.000000e+00
  br i1 %cmp506, label %if.then508, label %if.end515

if.then508:                                       ; preds = %if.end502
  store i32 39, i32* %lrc, align 4
  %tmp509 = load i32* %prlc, align 4
  %tobool510 = icmp ne i32 %tmp509, 0
  br i1 %tobool510, label %if.then511, label %if.end514

if.then511:                                       ; preds = %if.then508
  %tmp512 = load i32* %lrc, align 4
  %call513 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp512)
  br label %if.end514

if.end514:                                        ; preds = %if.then511, %if.then508
  br label %if.end515

if.end515:                                        ; preds = %if.end514, %if.end502
  store float 5.000000e+00, float* %fl, align 4
  store i32 2, i32* %ur, align 4
  %tmp516 = load i32* %ur, align 4
  %conv517 = uitofp i32 %tmp516 to float
  store float %conv517, float* %fl, align 4
  %tmp518 = load float* %fl, align 4
  %cmp519 = fcmp une float %tmp518, 2.000000e+00
  br i1 %cmp519, label %if.then521, label %if.end528

if.then521:                                       ; preds = %if.end515
  store i32 40, i32* %lrc, align 4
  %tmp522 = load i32* %prlc, align 4
  %tobool523 = icmp ne i32 %tmp522, 0
  br i1 %tobool523, label %if.then524, label %if.end527

if.then524:                                       ; preds = %if.then521
  %tmp525 = load i32* %lrc, align 4
  %call526 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp525)
  br label %if.end527

if.end527:                                        ; preds = %if.then524, %if.then521
  br label %if.end528

if.end528:                                        ; preds = %if.end527, %if.end515
  store float 5.000000e+00, float* %fl, align 4
  store float 2.000000e+00, float* %fr, align 4
  %tmp529 = load float* %fr, align 4
  store float %tmp529, float* %fl, align 4
  %tmp530 = load float* %fl, align 4
  %cmp531 = fcmp une float %tmp530, 2.000000e+00
  br i1 %cmp531, label %if.then533, label %if.end540

if.then533:                                       ; preds = %if.end528
  store i32 41, i32* %lrc, align 4
  %tmp534 = load i32* %prlc, align 4
  %tobool535 = icmp ne i32 %tmp534, 0
  br i1 %tobool535, label %if.then536, label %if.end539

if.then536:                                       ; preds = %if.then533
  %tmp537 = load i32* %lrc, align 4
  %call538 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp537)
  br label %if.end539

if.end539:                                        ; preds = %if.then536, %if.then533
  br label %if.end540

if.end540:                                        ; preds = %if.end539, %if.end528
  store float 5.000000e+00, float* %fl, align 4
  store double 2.000000e+00, double* %dr, align 8
  %tmp541 = load double* %dr, align 8
  %conv542 = fptrunc double %tmp541 to float
  store float %conv542, float* %fl, align 4
  %tmp543 = load float* %fl, align 4
  %cmp544 = fcmp une float %tmp543, 2.000000e+00
  br i1 %cmp544, label %if.then546, label %if.end553

if.then546:                                       ; preds = %if.end540
  store i32 42, i32* %lrc, align 4
  %tmp547 = load i32* %prlc, align 4
  %tobool548 = icmp ne i32 %tmp547, 0
  br i1 %tobool548, label %if.then549, label %if.end552

if.then549:                                       ; preds = %if.then546
  %tmp550 = load i32* %lrc, align 4
  %call551 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp550)
  br label %if.end552

if.end552:                                        ; preds = %if.then549, %if.then546
  br label %if.end553

if.end553:                                        ; preds = %if.end552, %if.end540
  store double 5.000000e+00, double* %dl, align 8
  store i8 2, i8* %cr, align 1
  %tmp554 = load i8* %cr, align 1
  %conv555 = sitofp i8 %tmp554 to double
  store double %conv555, double* %dl, align 8
  %tmp556 = load double* %dl, align 8
  %cmp557 = fcmp une double %tmp556, 2.000000e+00
  br i1 %cmp557, label %if.then559, label %if.end566

if.then559:                                       ; preds = %if.end553
  store i32 43, i32* %lrc, align 4
  %tmp560 = load i32* %prlc, align 4
  %tobool561 = icmp ne i32 %tmp560, 0
  br i1 %tobool561, label %if.then562, label %if.end565

if.then562:                                       ; preds = %if.then559
  %tmp563 = load i32* %lrc, align 4
  %call564 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp563)
  br label %if.end565

if.end565:                                        ; preds = %if.then562, %if.then559
  br label %if.end566

if.end566:                                        ; preds = %if.end565, %if.end553
  store double 5.000000e+00, double* %dl, align 8
  store i16 2, i16* %sr, align 2
  %tmp567 = load i16* %sr, align 2
  %conv568 = sitofp i16 %tmp567 to double
  store double %conv568, double* %dl, align 8
  %tmp569 = load double* %dl, align 8
  %cmp570 = fcmp une double %tmp569, 2.000000e+00
  br i1 %cmp570, label %if.then572, label %if.end579

if.then572:                                       ; preds = %if.end566
  store i32 44, i32* %lrc, align 4
  %tmp573 = load i32* %prlc, align 4
  %tobool574 = icmp ne i32 %tmp573, 0
  br i1 %tobool574, label %if.then575, label %if.end578

if.then575:                                       ; preds = %if.then572
  %tmp576 = load i32* %lrc, align 4
  %call577 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp576)
  br label %if.end578

if.end578:                                        ; preds = %if.then575, %if.then572
  br label %if.end579

if.end579:                                        ; preds = %if.end578, %if.end566
  store double 5.000000e+00, double* %dl, align 8
  store i32 2, i32* %ir, align 4
  %tmp580 = load i32* %ir, align 4
  %conv581 = sitofp i32 %tmp580 to double
  store double %conv581, double* %dl, align 8
  %tmp582 = load double* %dl, align 8
  %cmp583 = fcmp une double %tmp582, 2.000000e+00
  br i1 %cmp583, label %if.then585, label %if.end592

if.then585:                                       ; preds = %if.end579
  store i32 45, i32* %lrc, align 4
  %tmp586 = load i32* %prlc, align 4
  %tobool587 = icmp ne i32 %tmp586, 0
  br i1 %tobool587, label %if.then588, label %if.end591

if.then588:                                       ; preds = %if.then585
  %tmp589 = load i32* %lrc, align 4
  %call590 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp589)
  br label %if.end591

if.end591:                                        ; preds = %if.then588, %if.then585
  br label %if.end592

if.end592:                                        ; preds = %if.end591, %if.end579
  store double 5.000000e+00, double* %dl, align 8
  store i64 2, i64* %lr, align 8
  %tmp593 = load i64* %lr, align 8
  %conv594 = sitofp i64 %tmp593 to double
  store double %conv594, double* %dl, align 8
  %tmp595 = load double* %dl, align 8
  %cmp596 = fcmp une double %tmp595, 2.000000e+00
  br i1 %cmp596, label %if.then598, label %if.end605

if.then598:                                       ; preds = %if.end592
  store i32 46, i32* %lrc, align 4
  %tmp599 = load i32* %prlc, align 4
  %tobool600 = icmp ne i32 %tmp599, 0
  br i1 %tobool600, label %if.then601, label %if.end604

if.then601:                                       ; preds = %if.then598
  %tmp602 = load i32* %lrc, align 4
  %call603 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp602)
  br label %if.end604

if.end604:                                        ; preds = %if.then601, %if.then598
  br label %if.end605

if.end605:                                        ; preds = %if.end604, %if.end592
  store double 5.000000e+00, double* %dl, align 8
  store i32 2, i32* %ur, align 4
  %tmp606 = load i32* %ur, align 4
  %conv607 = uitofp i32 %tmp606 to double
  store double %conv607, double* %dl, align 8
  %tmp608 = load double* %dl, align 8
  %cmp609 = fcmp une double %tmp608, 2.000000e+00
  br i1 %cmp609, label %if.then611, label %if.end618

if.then611:                                       ; preds = %if.end605
  store i32 47, i32* %lrc, align 4
  %tmp612 = load i32* %prlc, align 4
  %tobool613 = icmp ne i32 %tmp612, 0
  br i1 %tobool613, label %if.then614, label %if.end617

if.then614:                                       ; preds = %if.then611
  %tmp615 = load i32* %lrc, align 4
  %call616 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp615)
  br label %if.end617

if.end617:                                        ; preds = %if.then614, %if.then611
  br label %if.end618

if.end618:                                        ; preds = %if.end617, %if.end605
  store double 5.000000e+00, double* %dl, align 8
  store float 2.000000e+00, float* %fr, align 4
  %tmp619 = load float* %fr, align 4
  %conv620 = fpext float %tmp619 to double
  store double %conv620, double* %dl, align 8
  %tmp621 = load double* %dl, align 8
  %cmp622 = fcmp une double %tmp621, 2.000000e+00
  br i1 %cmp622, label %if.then624, label %if.end631

if.then624:                                       ; preds = %if.end618
  store i32 48, i32* %lrc, align 4
  %tmp625 = load i32* %prlc, align 4
  %tobool626 = icmp ne i32 %tmp625, 0
  br i1 %tobool626, label %if.then627, label %if.end630

if.then627:                                       ; preds = %if.then624
  %tmp628 = load i32* %lrc, align 4
  %call629 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp628)
  br label %if.end630

if.end630:                                        ; preds = %if.then627, %if.then624
  br label %if.end631

if.end631:                                        ; preds = %if.end630, %if.end618
  store double 5.000000e+00, double* %dl, align 8
  store double 2.000000e+00, double* %dr, align 8
  %tmp632 = load double* %dr, align 8
  store double %tmp632, double* %dl, align 8
  %tmp633 = load double* %dl, align 8
  %cmp634 = fcmp une double %tmp633, 2.000000e+00
  br i1 %cmp634, label %if.then636, label %if.end643

if.then636:                                       ; preds = %if.end631
  store i32 49, i32* %lrc, align 4
  %tmp637 = load i32* %prlc, align 4
  %tobool638 = icmp ne i32 %tmp637, 0
  br i1 %tobool638, label %if.then639, label %if.end642

if.then639:                                       ; preds = %if.then636
  %tmp640 = load i32* %lrc, align 4
  %call641 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp640)
  br label %if.end642

if.end642:                                        ; preds = %if.then639, %if.then636
  br label %if.end643

if.end643:                                        ; preds = %if.end642, %if.end631
  store i8 5, i8* %cl, align 1
  store i8 2, i8* %cr, align 1
  %tmp644 = load i8* %cr, align 1
  %conv645 = sext i8 %tmp644 to i32
  %tmp646 = load i8* %cl, align 1
  %conv647 = sext i8 %tmp646 to i32
  %add = add nsw i32 %conv647, %conv645
  %conv648 = trunc i32 %add to i8
  store i8 %conv648, i8* %cl, align 1
  %tmp649 = load i8* %cl, align 1
  %conv650 = sext i8 %tmp649 to i32
  %cmp651 = icmp ne i32 %conv650, 7
  br i1 %cmp651, label %if.then653, label %if.end660

if.then653:                                       ; preds = %if.end643
  store i32 50, i32* %lrc, align 4
  %tmp654 = load i32* %prlc, align 4
  %tobool655 = icmp ne i32 %tmp654, 0
  br i1 %tobool655, label %if.then656, label %if.end659

if.then656:                                       ; preds = %if.then653
  %tmp657 = load i32* %lrc, align 4
  %call658 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp657)
  br label %if.end659

if.end659:                                        ; preds = %if.then656, %if.then653
  br label %if.end660

if.end660:                                        ; preds = %if.end659, %if.end643
  %tmp661 = load i32* %lrc, align 4
  %cmp662 = icmp ne i32 %tmp661, 0
  br i1 %cmp662, label %if.then664, label %if.end672

if.then664:                                       ; preds = %if.end660
  store i32 1, i32* %rc, align 4
  %tmp665 = load %struct.defs** %pd0.addr, align 8
  %flgd = getelementptr inbounds %struct.defs* %tmp665, i32 0, i32 11
  %tmp666 = load i32* %flgd, align 4
  %cmp667 = icmp ne i32 %tmp666, 0
  br i1 %cmp667, label %if.then669, label %if.end671

if.then669:                                       ; preds = %if.then664
  %call670 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @sec.s714er, i32 0, i32 0), i32 1)
  br label %if.end671

if.end671:                                        ; preds = %if.then669, %if.then664
  br label %if.end672

if.end672:                                        ; preds = %if.end671, %if.end660
  %tmp673 = load i32* %rc, align 4
  ret i32 %tmp673
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
