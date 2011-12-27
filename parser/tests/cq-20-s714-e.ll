; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/cq-20-s714-e.c'
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
  store i32 2, i32* %ur, align 4
  %tmp7 = load i32* %ur, align 4
  %tmp8 = load i8* %cl, align 1
  %conv = sext i8 %tmp8 to i32
  %div = udiv i32 %conv, %tmp7
  %conv9 = trunc i32 %div to i8
  store i8 %conv9, i8* %cl, align 1
  %tmp10 = load i8* %cl, align 1
  %conv11 = sext i8 %tmp10 to i32
  %cmp = icmp ne i32 %conv11, 2
  br i1 %cmp, label %if.then, label %if.end17

if.then:                                          ; preds = %while.end
  store i32 201, i32* %lrc, align 4
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
  store float 2.000000e+00, float* %fr, align 4
  %tmp18 = load float* %fr, align 4
  %tmp19 = load i8* %cl, align 1
  %conv20 = sitofp i8 %tmp19 to float
  %div21 = fdiv float %conv20, %tmp18
  %conv22 = fptosi float %div21 to i8
  store i8 %conv22, i8* %cl, align 1
  %tmp23 = load i8* %cl, align 1
  %conv24 = sext i8 %tmp23 to i32
  %cmp25 = icmp ne i32 %conv24, 2
  br i1 %cmp25, label %if.then27, label %if.end34

if.then27:                                        ; preds = %if.end17
  store i32 202, i32* %lrc, align 4
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
  store double 2.000000e+00, double* %dr, align 8
  %tmp35 = load double* %dr, align 8
  %tmp36 = load i8* %cl, align 1
  %conv37 = sitofp i8 %tmp36 to double
  %div38 = fdiv double %conv37, %tmp35
  %conv39 = fptosi double %div38 to i8
  store i8 %conv39, i8* %cl, align 1
  %tmp40 = load i8* %cl, align 1
  %conv41 = sext i8 %tmp40 to i32
  %cmp42 = icmp ne i32 %conv41, 2
  br i1 %cmp42, label %if.then44, label %if.end51

if.then44:                                        ; preds = %if.end34
  store i32 203, i32* %lrc, align 4
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
  store i16 5, i16* %sl, align 2
  store i8 2, i8* %cr, align 1
  %tmp52 = load i8* %cr, align 1
  %conv53 = sext i8 %tmp52 to i32
  %tmp54 = load i16* %sl, align 2
  %conv55 = sext i16 %tmp54 to i32
  %div56 = sdiv i32 %conv55, %conv53
  %conv57 = trunc i32 %div56 to i16
  store i16 %conv57, i16* %sl, align 2
  %tmp58 = load i16* %sl, align 2
  %conv59 = sext i16 %tmp58 to i32
  %cmp60 = icmp ne i32 %conv59, 2
  br i1 %cmp60, label %if.then62, label %if.end69

if.then62:                                        ; preds = %if.end51
  store i32 204, i32* %lrc, align 4
  %tmp63 = load i32* %prlc, align 4
  %tobool64 = icmp ne i32 %tmp63, 0
  br i1 %tobool64, label %if.then65, label %if.end68

if.then65:                                        ; preds = %if.then62
  %tmp66 = load i32* %lrc, align 4
  %call67 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp66)
  br label %if.end68

if.end68:                                         ; preds = %if.then65, %if.then62
  br label %if.end69

if.end69:                                         ; preds = %if.end68, %if.end51
  store i16 5, i16* %sl, align 2
  store i16 2, i16* %sr, align 2
  %tmp70 = load i16* %sr, align 2
  %conv71 = sext i16 %tmp70 to i32
  %tmp72 = load i16* %sl, align 2
  %conv73 = sext i16 %tmp72 to i32
  %div74 = sdiv i32 %conv73, %conv71
  %conv75 = trunc i32 %div74 to i16
  store i16 %conv75, i16* %sl, align 2
  %tmp76 = load i16* %sl, align 2
  %conv77 = sext i16 %tmp76 to i32
  %cmp78 = icmp ne i32 %conv77, 2
  br i1 %cmp78, label %if.then80, label %if.end87

if.then80:                                        ; preds = %if.end69
  store i32 205, i32* %lrc, align 4
  %tmp81 = load i32* %prlc, align 4
  %tobool82 = icmp ne i32 %tmp81, 0
  br i1 %tobool82, label %if.then83, label %if.end86

if.then83:                                        ; preds = %if.then80
  %tmp84 = load i32* %lrc, align 4
  %call85 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp84)
  br label %if.end86

if.end86:                                         ; preds = %if.then83, %if.then80
  br label %if.end87

if.end87:                                         ; preds = %if.end86, %if.end69
  store i16 5, i16* %sl, align 2
  store i32 2, i32* %ir, align 4
  %tmp88 = load i32* %ir, align 4
  %tmp89 = load i16* %sl, align 2
  %conv90 = sext i16 %tmp89 to i32
  %div91 = sdiv i32 %conv90, %tmp88
  %conv92 = trunc i32 %div91 to i16
  store i16 %conv92, i16* %sl, align 2
  %tmp93 = load i16* %sl, align 2
  %conv94 = sext i16 %tmp93 to i32
  %cmp95 = icmp ne i32 %conv94, 2
  br i1 %cmp95, label %if.then97, label %if.end104

if.then97:                                        ; preds = %if.end87
  store i32 206, i32* %lrc, align 4
  %tmp98 = load i32* %prlc, align 4
  %tobool99 = icmp ne i32 %tmp98, 0
  br i1 %tobool99, label %if.then100, label %if.end103

if.then100:                                       ; preds = %if.then97
  %tmp101 = load i32* %lrc, align 4
  %call102 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp101)
  br label %if.end103

if.end103:                                        ; preds = %if.then100, %if.then97
  br label %if.end104

if.end104:                                        ; preds = %if.end103, %if.end87
  store i16 5, i16* %sl, align 2
  store i64 2, i64* %lr, align 8
  %tmp105 = load i64* %lr, align 8
  %tmp106 = load i16* %sl, align 2
  %conv107 = sext i16 %tmp106 to i64
  %div108 = sdiv i64 %conv107, %tmp105
  %conv109 = trunc i64 %div108 to i16
  store i16 %conv109, i16* %sl, align 2
  %tmp110 = load i16* %sl, align 2
  %conv111 = sext i16 %tmp110 to i32
  %cmp112 = icmp ne i32 %conv111, 2
  br i1 %cmp112, label %if.then114, label %if.end121

if.then114:                                       ; preds = %if.end104
  store i32 207, i32* %lrc, align 4
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
  store i32 2, i32* %ur, align 4
  %tmp122 = load i32* %ur, align 4
  %tmp123 = load i16* %sl, align 2
  %conv124 = sext i16 %tmp123 to i32
  %div125 = udiv i32 %conv124, %tmp122
  %conv126 = trunc i32 %div125 to i16
  store i16 %conv126, i16* %sl, align 2
  %tmp127 = load i16* %sl, align 2
  %conv128 = sext i16 %tmp127 to i32
  %cmp129 = icmp ne i32 %conv128, 2
  br i1 %cmp129, label %if.then131, label %if.end138

if.then131:                                       ; preds = %if.end121
  store i32 208, i32* %lrc, align 4
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
  store float 2.000000e+00, float* %fr, align 4
  %tmp139 = load float* %fr, align 4
  %tmp140 = load i16* %sl, align 2
  %conv141 = sitofp i16 %tmp140 to float
  %div142 = fdiv float %conv141, %tmp139
  %conv143 = fptosi float %div142 to i16
  store i16 %conv143, i16* %sl, align 2
  %tmp144 = load i16* %sl, align 2
  %conv145 = sext i16 %tmp144 to i32
  %cmp146 = icmp ne i32 %conv145, 2
  br i1 %cmp146, label %if.then148, label %if.end155

if.then148:                                       ; preds = %if.end138
  store i32 209, i32* %lrc, align 4
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
  store double 2.000000e+00, double* %dr, align 8
  %tmp156 = load double* %dr, align 8
  %tmp157 = load i16* %sl, align 2
  %conv158 = sitofp i16 %tmp157 to double
  %div159 = fdiv double %conv158, %tmp156
  %conv160 = fptosi double %div159 to i16
  store i16 %conv160, i16* %sl, align 2
  %tmp161 = load i16* %sl, align 2
  %conv162 = sext i16 %tmp161 to i32
  %cmp163 = icmp ne i32 %conv162, 2
  br i1 %cmp163, label %if.then165, label %if.end172

if.then165:                                       ; preds = %if.end155
  store i32 210, i32* %lrc, align 4
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
  store i32 5, i32* %il, align 4
  store i8 2, i8* %cr, align 1
  %tmp173 = load i8* %cr, align 1
  %conv174 = sext i8 %tmp173 to i32
  %tmp175 = load i32* %il, align 4
  %div176 = sdiv i32 %tmp175, %conv174
  store i32 %div176, i32* %il, align 4
  %tmp177 = load i32* %il, align 4
  %cmp178 = icmp ne i32 %tmp177, 2
  br i1 %cmp178, label %if.then180, label %if.end187

if.then180:                                       ; preds = %if.end172
  store i32 211, i32* %lrc, align 4
  %tmp181 = load i32* %prlc, align 4
  %tobool182 = icmp ne i32 %tmp181, 0
  br i1 %tobool182, label %if.then183, label %if.end186

if.then183:                                       ; preds = %if.then180
  %tmp184 = load i32* %lrc, align 4
  %call185 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp184)
  br label %if.end186

if.end186:                                        ; preds = %if.then183, %if.then180
  br label %if.end187

if.end187:                                        ; preds = %if.end186, %if.end172
  store i32 5, i32* %il, align 4
  store i16 2, i16* %sr, align 2
  %tmp188 = load i16* %sr, align 2
  %conv189 = sext i16 %tmp188 to i32
  %tmp190 = load i32* %il, align 4
  %div191 = sdiv i32 %tmp190, %conv189
  store i32 %div191, i32* %il, align 4
  %tmp192 = load i32* %il, align 4
  %cmp193 = icmp ne i32 %tmp192, 2
  br i1 %cmp193, label %if.then195, label %if.end202

if.then195:                                       ; preds = %if.end187
  store i32 212, i32* %lrc, align 4
  %tmp196 = load i32* %prlc, align 4
  %tobool197 = icmp ne i32 %tmp196, 0
  br i1 %tobool197, label %if.then198, label %if.end201

if.then198:                                       ; preds = %if.then195
  %tmp199 = load i32* %lrc, align 4
  %call200 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp199)
  br label %if.end201

if.end201:                                        ; preds = %if.then198, %if.then195
  br label %if.end202

if.end202:                                        ; preds = %if.end201, %if.end187
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ir, align 4
  %tmp203 = load i32* %ir, align 4
  %tmp204 = load i32* %il, align 4
  %div205 = sdiv i32 %tmp204, %tmp203
  store i32 %div205, i32* %il, align 4
  %tmp206 = load i32* %il, align 4
  %cmp207 = icmp ne i32 %tmp206, 2
  br i1 %cmp207, label %if.then209, label %if.end216

if.then209:                                       ; preds = %if.end202
  store i32 213, i32* %lrc, align 4
  %tmp210 = load i32* %prlc, align 4
  %tobool211 = icmp ne i32 %tmp210, 0
  br i1 %tobool211, label %if.then212, label %if.end215

if.then212:                                       ; preds = %if.then209
  %tmp213 = load i32* %lrc, align 4
  %call214 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp213)
  br label %if.end215

if.end215:                                        ; preds = %if.then212, %if.then209
  br label %if.end216

if.end216:                                        ; preds = %if.end215, %if.end202
  store i32 5, i32* %il, align 4
  store i64 2, i64* %lr, align 8
  %tmp217 = load i64* %lr, align 8
  %tmp218 = load i32* %il, align 4
  %conv219 = sext i32 %tmp218 to i64
  %div220 = sdiv i64 %conv219, %tmp217
  %conv221 = trunc i64 %div220 to i32
  store i32 %conv221, i32* %il, align 4
  %tmp222 = load i32* %il, align 4
  %cmp223 = icmp ne i32 %tmp222, 2
  br i1 %cmp223, label %if.then225, label %if.end232

if.then225:                                       ; preds = %if.end216
  store i32 214, i32* %lrc, align 4
  %tmp226 = load i32* %prlc, align 4
  %tobool227 = icmp ne i32 %tmp226, 0
  br i1 %tobool227, label %if.then228, label %if.end231

if.then228:                                       ; preds = %if.then225
  %tmp229 = load i32* %lrc, align 4
  %call230 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp229)
  br label %if.end231

if.end231:                                        ; preds = %if.then228, %if.then225
  br label %if.end232

if.end232:                                        ; preds = %if.end231, %if.end216
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ur, align 4
  %tmp233 = load i32* %ur, align 4
  %tmp234 = load i32* %il, align 4
  %div235 = udiv i32 %tmp234, %tmp233
  store i32 %div235, i32* %il, align 4
  %tmp236 = load i32* %il, align 4
  %cmp237 = icmp ne i32 %tmp236, 2
  br i1 %cmp237, label %if.then239, label %if.end246

if.then239:                                       ; preds = %if.end232
  store i32 215, i32* %lrc, align 4
  %tmp240 = load i32* %prlc, align 4
  %tobool241 = icmp ne i32 %tmp240, 0
  br i1 %tobool241, label %if.then242, label %if.end245

if.then242:                                       ; preds = %if.then239
  %tmp243 = load i32* %lrc, align 4
  %call244 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp243)
  br label %if.end245

if.end245:                                        ; preds = %if.then242, %if.then239
  br label %if.end246

if.end246:                                        ; preds = %if.end245, %if.end232
  store i32 5, i32* %il, align 4
  store float 2.000000e+00, float* %fr, align 4
  %tmp247 = load float* %fr, align 4
  %tmp248 = load i32* %il, align 4
  %conv249 = sitofp i32 %tmp248 to float
  %div250 = fdiv float %conv249, %tmp247
  %conv251 = fptosi float %div250 to i32
  store i32 %conv251, i32* %il, align 4
  %tmp252 = load i32* %il, align 4
  %cmp253 = icmp ne i32 %tmp252, 2
  br i1 %cmp253, label %if.then255, label %if.end262

if.then255:                                       ; preds = %if.end246
  store i32 216, i32* %lrc, align 4
  %tmp256 = load i32* %prlc, align 4
  %tobool257 = icmp ne i32 %tmp256, 0
  br i1 %tobool257, label %if.then258, label %if.end261

if.then258:                                       ; preds = %if.then255
  %tmp259 = load i32* %lrc, align 4
  %call260 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp259)
  br label %if.end261

if.end261:                                        ; preds = %if.then258, %if.then255
  br label %if.end262

if.end262:                                        ; preds = %if.end261, %if.end246
  store i32 5, i32* %il, align 4
  store double 2.000000e+00, double* %dr, align 8
  %tmp263 = load double* %dr, align 8
  %tmp264 = load i32* %il, align 4
  %conv265 = sitofp i32 %tmp264 to double
  %div266 = fdiv double %conv265, %tmp263
  %conv267 = fptosi double %div266 to i32
  store i32 %conv267, i32* %il, align 4
  %tmp268 = load i32* %il, align 4
  %cmp269 = icmp ne i32 %tmp268, 2
  br i1 %cmp269, label %if.then271, label %if.end278

if.then271:                                       ; preds = %if.end262
  store i32 217, i32* %lrc, align 4
  %tmp272 = load i32* %prlc, align 4
  %tobool273 = icmp ne i32 %tmp272, 0
  br i1 %tobool273, label %if.then274, label %if.end277

if.then274:                                       ; preds = %if.then271
  %tmp275 = load i32* %lrc, align 4
  %call276 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp275)
  br label %if.end277

if.end277:                                        ; preds = %if.then274, %if.then271
  br label %if.end278

if.end278:                                        ; preds = %if.end277, %if.end262
  store i64 5, i64* %ll, align 8
  store i8 2, i8* %cr, align 1
  %tmp279 = load i8* %cr, align 1
  %conv280 = sext i8 %tmp279 to i64
  %tmp281 = load i64* %ll, align 8
  %div282 = sdiv i64 %tmp281, %conv280
  store i64 %div282, i64* %ll, align 8
  %tmp283 = load i64* %ll, align 8
  %cmp284 = icmp ne i64 %tmp283, 2
  br i1 %cmp284, label %if.then286, label %if.end293

if.then286:                                       ; preds = %if.end278
  store i32 218, i32* %lrc, align 4
  %tmp287 = load i32* %prlc, align 4
  %tobool288 = icmp ne i32 %tmp287, 0
  br i1 %tobool288, label %if.then289, label %if.end292

if.then289:                                       ; preds = %if.then286
  %tmp290 = load i32* %lrc, align 4
  %call291 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp290)
  br label %if.end292

if.end292:                                        ; preds = %if.then289, %if.then286
  br label %if.end293

if.end293:                                        ; preds = %if.end292, %if.end278
  store i64 5, i64* %ll, align 8
  store i16 2, i16* %sr, align 2
  %tmp294 = load i16* %sr, align 2
  %conv295 = sext i16 %tmp294 to i64
  %tmp296 = load i64* %ll, align 8
  %div297 = sdiv i64 %tmp296, %conv295
  store i64 %div297, i64* %ll, align 8
  %tmp298 = load i64* %ll, align 8
  %cmp299 = icmp ne i64 %tmp298, 2
  br i1 %cmp299, label %if.then301, label %if.end308

if.then301:                                       ; preds = %if.end293
  store i32 219, i32* %lrc, align 4
  %tmp302 = load i32* %prlc, align 4
  %tobool303 = icmp ne i32 %tmp302, 0
  br i1 %tobool303, label %if.then304, label %if.end307

if.then304:                                       ; preds = %if.then301
  %tmp305 = load i32* %lrc, align 4
  %call306 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp305)
  br label %if.end307

if.end307:                                        ; preds = %if.then304, %if.then301
  br label %if.end308

if.end308:                                        ; preds = %if.end307, %if.end293
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ir, align 4
  %tmp309 = load i32* %ir, align 4
  %conv310 = sext i32 %tmp309 to i64
  %tmp311 = load i64* %ll, align 8
  %div312 = sdiv i64 %tmp311, %conv310
  store i64 %div312, i64* %ll, align 8
  %tmp313 = load i64* %ll, align 8
  %cmp314 = icmp ne i64 %tmp313, 2
  br i1 %cmp314, label %if.then316, label %if.end323

if.then316:                                       ; preds = %if.end308
  store i32 220, i32* %lrc, align 4
  %tmp317 = load i32* %prlc, align 4
  %tobool318 = icmp ne i32 %tmp317, 0
  br i1 %tobool318, label %if.then319, label %if.end322

if.then319:                                       ; preds = %if.then316
  %tmp320 = load i32* %lrc, align 4
  %call321 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp320)
  br label %if.end322

if.end322:                                        ; preds = %if.then319, %if.then316
  br label %if.end323

if.end323:                                        ; preds = %if.end322, %if.end308
  store i64 5, i64* %ll, align 8
  store i64 2, i64* %lr, align 8
  %tmp324 = load i64* %lr, align 8
  %tmp325 = load i64* %ll, align 8
  %div326 = sdiv i64 %tmp325, %tmp324
  store i64 %div326, i64* %ll, align 8
  %tmp327 = load i64* %ll, align 8
  %cmp328 = icmp ne i64 %tmp327, 2
  br i1 %cmp328, label %if.then330, label %if.end337

if.then330:                                       ; preds = %if.end323
  store i32 221, i32* %lrc, align 4
  %tmp331 = load i32* %prlc, align 4
  %tobool332 = icmp ne i32 %tmp331, 0
  br i1 %tobool332, label %if.then333, label %if.end336

if.then333:                                       ; preds = %if.then330
  %tmp334 = load i32* %lrc, align 4
  %call335 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp334)
  br label %if.end336

if.end336:                                        ; preds = %if.then333, %if.then330
  br label %if.end337

if.end337:                                        ; preds = %if.end336, %if.end323
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ur, align 4
  %tmp338 = load i32* %ur, align 4
  %conv339 = zext i32 %tmp338 to i64
  %tmp340 = load i64* %ll, align 8
  %div341 = sdiv i64 %tmp340, %conv339
  store i64 %div341, i64* %ll, align 8
  %tmp342 = load i64* %ll, align 8
  %cmp343 = icmp ne i64 %tmp342, 2
  br i1 %cmp343, label %if.then345, label %if.end352

if.then345:                                       ; preds = %if.end337
  store i32 222, i32* %lrc, align 4
  %tmp346 = load i32* %prlc, align 4
  %tobool347 = icmp ne i32 %tmp346, 0
  br i1 %tobool347, label %if.then348, label %if.end351

if.then348:                                       ; preds = %if.then345
  %tmp349 = load i32* %lrc, align 4
  %call350 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp349)
  br label %if.end351

if.end351:                                        ; preds = %if.then348, %if.then345
  br label %if.end352

if.end352:                                        ; preds = %if.end351, %if.end337
  store i64 5, i64* %ll, align 8
  store float 2.000000e+00, float* %fr, align 4
  %tmp353 = load float* %fr, align 4
  %tmp354 = load i64* %ll, align 8
  %conv355 = sitofp i64 %tmp354 to float
  %div356 = fdiv float %conv355, %tmp353
  %conv357 = fptosi float %div356 to i64
  store i64 %conv357, i64* %ll, align 8
  %tmp358 = load i64* %ll, align 8
  %cmp359 = icmp ne i64 %tmp358, 2
  br i1 %cmp359, label %if.then361, label %if.end368

if.then361:                                       ; preds = %if.end352
  store i32 223, i32* %lrc, align 4
  %tmp362 = load i32* %prlc, align 4
  %tobool363 = icmp ne i32 %tmp362, 0
  br i1 %tobool363, label %if.then364, label %if.end367

if.then364:                                       ; preds = %if.then361
  %tmp365 = load i32* %lrc, align 4
  %call366 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp365)
  br label %if.end367

if.end367:                                        ; preds = %if.then364, %if.then361
  br label %if.end368

if.end368:                                        ; preds = %if.end367, %if.end352
  store i64 5, i64* %ll, align 8
  store double 2.000000e+00, double* %dr, align 8
  %tmp369 = load double* %dr, align 8
  %tmp370 = load i64* %ll, align 8
  %conv371 = sitofp i64 %tmp370 to double
  %div372 = fdiv double %conv371, %tmp369
  %conv373 = fptosi double %div372 to i64
  store i64 %conv373, i64* %ll, align 8
  %tmp374 = load i64* %ll, align 8
  %cmp375 = icmp ne i64 %tmp374, 2
  br i1 %cmp375, label %if.then377, label %if.end384

if.then377:                                       ; preds = %if.end368
  store i32 224, i32* %lrc, align 4
  %tmp378 = load i32* %prlc, align 4
  %tobool379 = icmp ne i32 %tmp378, 0
  br i1 %tobool379, label %if.then380, label %if.end383

if.then380:                                       ; preds = %if.then377
  %tmp381 = load i32* %lrc, align 4
  %call382 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp381)
  br label %if.end383

if.end383:                                        ; preds = %if.then380, %if.then377
  br label %if.end384

if.end384:                                        ; preds = %if.end383, %if.end368
  store i32 5, i32* %ul, align 4
  store i8 2, i8* %cr, align 1
  %tmp385 = load i8* %cr, align 1
  %conv386 = sext i8 %tmp385 to i32
  %tmp387 = load i32* %ul, align 4
  %div388 = udiv i32 %tmp387, %conv386
  store i32 %div388, i32* %ul, align 4
  %tmp389 = load i32* %ul, align 4
  %cmp390 = icmp ne i32 %tmp389, 2
  br i1 %cmp390, label %if.then392, label %if.end399

if.then392:                                       ; preds = %if.end384
  store i32 225, i32* %lrc, align 4
  %tmp393 = load i32* %prlc, align 4
  %tobool394 = icmp ne i32 %tmp393, 0
  br i1 %tobool394, label %if.then395, label %if.end398

if.then395:                                       ; preds = %if.then392
  %tmp396 = load i32* %lrc, align 4
  %call397 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp396)
  br label %if.end398

if.end398:                                        ; preds = %if.then395, %if.then392
  br label %if.end399

if.end399:                                        ; preds = %if.end398, %if.end384
  store i32 5, i32* %ul, align 4
  store i16 2, i16* %sr, align 2
  %tmp400 = load i16* %sr, align 2
  %conv401 = sext i16 %tmp400 to i32
  %tmp402 = load i32* %ul, align 4
  %div403 = udiv i32 %tmp402, %conv401
  store i32 %div403, i32* %ul, align 4
  %tmp404 = load i32* %ul, align 4
  %cmp405 = icmp ne i32 %tmp404, 2
  br i1 %cmp405, label %if.then407, label %if.end414

if.then407:                                       ; preds = %if.end399
  store i32 226, i32* %lrc, align 4
  %tmp408 = load i32* %prlc, align 4
  %tobool409 = icmp ne i32 %tmp408, 0
  br i1 %tobool409, label %if.then410, label %if.end413

if.then410:                                       ; preds = %if.then407
  %tmp411 = load i32* %lrc, align 4
  %call412 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp411)
  br label %if.end413

if.end413:                                        ; preds = %if.then410, %if.then407
  br label %if.end414

if.end414:                                        ; preds = %if.end413, %if.end399
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ir, align 4
  %tmp415 = load i32* %ir, align 4
  %tmp416 = load i32* %ul, align 4
  %div417 = udiv i32 %tmp416, %tmp415
  store i32 %div417, i32* %ul, align 4
  %tmp418 = load i32* %ul, align 4
  %cmp419 = icmp ne i32 %tmp418, 2
  br i1 %cmp419, label %if.then421, label %if.end428

if.then421:                                       ; preds = %if.end414
  store i32 227, i32* %lrc, align 4
  %tmp422 = load i32* %prlc, align 4
  %tobool423 = icmp ne i32 %tmp422, 0
  br i1 %tobool423, label %if.then424, label %if.end427

if.then424:                                       ; preds = %if.then421
  %tmp425 = load i32* %lrc, align 4
  %call426 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp425)
  br label %if.end427

if.end427:                                        ; preds = %if.then424, %if.then421
  br label %if.end428

if.end428:                                        ; preds = %if.end427, %if.end414
  store i32 5, i32* %ul, align 4
  store i64 2, i64* %lr, align 8
  %tmp429 = load i64* %lr, align 8
  %tmp430 = load i32* %ul, align 4
  %conv431 = zext i32 %tmp430 to i64
  %div432 = sdiv i64 %conv431, %tmp429
  %conv433 = trunc i64 %div432 to i32
  store i32 %conv433, i32* %ul, align 4
  %tmp434 = load i32* %ul, align 4
  %cmp435 = icmp ne i32 %tmp434, 2
  br i1 %cmp435, label %if.then437, label %if.end444

if.then437:                                       ; preds = %if.end428
  store i32 228, i32* %lrc, align 4
  %tmp438 = load i32* %prlc, align 4
  %tobool439 = icmp ne i32 %tmp438, 0
  br i1 %tobool439, label %if.then440, label %if.end443

if.then440:                                       ; preds = %if.then437
  %tmp441 = load i32* %lrc, align 4
  %call442 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp441)
  br label %if.end443

if.end443:                                        ; preds = %if.then440, %if.then437
  br label %if.end444

if.end444:                                        ; preds = %if.end443, %if.end428
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ur, align 4
  %tmp445 = load i32* %ur, align 4
  %tmp446 = load i32* %ul, align 4
  %div447 = udiv i32 %tmp446, %tmp445
  store i32 %div447, i32* %ul, align 4
  %tmp448 = load i32* %ul, align 4
  %cmp449 = icmp ne i32 %tmp448, 2
  br i1 %cmp449, label %if.then451, label %if.end458

if.then451:                                       ; preds = %if.end444
  store i32 229, i32* %lrc, align 4
  %tmp452 = load i32* %prlc, align 4
  %tobool453 = icmp ne i32 %tmp452, 0
  br i1 %tobool453, label %if.then454, label %if.end457

if.then454:                                       ; preds = %if.then451
  %tmp455 = load i32* %lrc, align 4
  %call456 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp455)
  br label %if.end457

if.end457:                                        ; preds = %if.then454, %if.then451
  br label %if.end458

if.end458:                                        ; preds = %if.end457, %if.end444
  store i32 5, i32* %ul, align 4
  store float 2.000000e+00, float* %fr, align 4
  %tmp459 = load float* %fr, align 4
  %tmp460 = load i32* %ul, align 4
  %conv461 = uitofp i32 %tmp460 to float
  %div462 = fdiv float %conv461, %tmp459
  %conv463 = fptoui float %div462 to i32
  store i32 %conv463, i32* %ul, align 4
  %tmp464 = load i32* %ul, align 4
  %cmp465 = icmp ne i32 %tmp464, 2
  br i1 %cmp465, label %if.then467, label %if.end474

if.then467:                                       ; preds = %if.end458
  store i32 230, i32* %lrc, align 4
  %tmp468 = load i32* %prlc, align 4
  %tobool469 = icmp ne i32 %tmp468, 0
  br i1 %tobool469, label %if.then470, label %if.end473

if.then470:                                       ; preds = %if.then467
  %tmp471 = load i32* %lrc, align 4
  %call472 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp471)
  br label %if.end473

if.end473:                                        ; preds = %if.then470, %if.then467
  br label %if.end474

if.end474:                                        ; preds = %if.end473, %if.end458
  store i32 5, i32* %ul, align 4
  store double 2.000000e+00, double* %dr, align 8
  %tmp475 = load double* %dr, align 8
  %tmp476 = load i32* %ul, align 4
  %conv477 = uitofp i32 %tmp476 to double
  %div478 = fdiv double %conv477, %tmp475
  %conv479 = fptoui double %div478 to i32
  store i32 %conv479, i32* %ul, align 4
  %tmp480 = load i32* %ul, align 4
  %cmp481 = icmp ne i32 %tmp480, 2
  br i1 %cmp481, label %if.then483, label %if.end490

if.then483:                                       ; preds = %if.end474
  store i32 231, i32* %lrc, align 4
  %tmp484 = load i32* %prlc, align 4
  %tobool485 = icmp ne i32 %tmp484, 0
  br i1 %tobool485, label %if.then486, label %if.end489

if.then486:                                       ; preds = %if.then483
  %tmp487 = load i32* %lrc, align 4
  %call488 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp487)
  br label %if.end489

if.end489:                                        ; preds = %if.then486, %if.then483
  br label %if.end490

if.end490:                                        ; preds = %if.end489, %if.end474
  store float 5.000000e+00, float* %fl, align 4
  store i8 2, i8* %cr, align 1
  %tmp491 = load i8* %cr, align 1
  %conv492 = sext i8 %tmp491 to i32
  %conv493 = sitofp i32 %conv492 to float
  %tmp494 = load float* %fl, align 4
  %div495 = fdiv float %tmp494, %conv493
  store float %div495, float* %fl, align 4
  %tmp496 = load float* %fl, align 4
  %conv497 = fpext float %tmp496 to double
  %cmp498 = fcmp une double %conv497, 2.500000e+00
  br i1 %cmp498, label %if.then500, label %if.end507

if.then500:                                       ; preds = %if.end490
  store i32 232, i32* %lrc, align 4
  %tmp501 = load i32* %prlc, align 4
  %tobool502 = icmp ne i32 %tmp501, 0
  br i1 %tobool502, label %if.then503, label %if.end506

if.then503:                                       ; preds = %if.then500
  %tmp504 = load i32* %lrc, align 4
  %call505 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp504)
  br label %if.end506

if.end506:                                        ; preds = %if.then503, %if.then500
  br label %if.end507

if.end507:                                        ; preds = %if.end506, %if.end490
  store float 5.000000e+00, float* %fl, align 4
  store i16 2, i16* %sr, align 2
  %tmp508 = load i16* %sr, align 2
  %conv509 = sext i16 %tmp508 to i32
  %conv510 = sitofp i32 %conv509 to float
  %tmp511 = load float* %fl, align 4
  %div512 = fdiv float %tmp511, %conv510
  store float %div512, float* %fl, align 4
  %tmp513 = load float* %fl, align 4
  %conv514 = fpext float %tmp513 to double
  %cmp515 = fcmp une double %conv514, 2.500000e+00
  br i1 %cmp515, label %if.then517, label %if.end524

if.then517:                                       ; preds = %if.end507
  store i32 233, i32* %lrc, align 4
  %tmp518 = load i32* %prlc, align 4
  %tobool519 = icmp ne i32 %tmp518, 0
  br i1 %tobool519, label %if.then520, label %if.end523

if.then520:                                       ; preds = %if.then517
  %tmp521 = load i32* %lrc, align 4
  %call522 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp521)
  br label %if.end523

if.end523:                                        ; preds = %if.then520, %if.then517
  br label %if.end524

if.end524:                                        ; preds = %if.end523, %if.end507
  store float 5.000000e+00, float* %fl, align 4
  store i32 2, i32* %ir, align 4
  %tmp525 = load i32* %ir, align 4
  %conv526 = sitofp i32 %tmp525 to float
  %tmp527 = load float* %fl, align 4
  %div528 = fdiv float %tmp527, %conv526
  store float %div528, float* %fl, align 4
  %tmp529 = load float* %fl, align 4
  %conv530 = fpext float %tmp529 to double
  %cmp531 = fcmp une double %conv530, 2.500000e+00
  br i1 %cmp531, label %if.then533, label %if.end540

if.then533:                                       ; preds = %if.end524
  store i32 234, i32* %lrc, align 4
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
  store i64 2, i64* %lr, align 8
  %tmp541 = load i64* %lr, align 8
  %conv542 = sitofp i64 %tmp541 to float
  %tmp543 = load float* %fl, align 4
  %div544 = fdiv float %tmp543, %conv542
  store float %div544, float* %fl, align 4
  %tmp545 = load float* %fl, align 4
  %conv546 = fpext float %tmp545 to double
  %cmp547 = fcmp une double %conv546, 2.500000e+00
  br i1 %cmp547, label %if.then549, label %if.end556

if.then549:                                       ; preds = %if.end540
  store i32 235, i32* %lrc, align 4
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
  store i32 2, i32* %ur, align 4
  %tmp557 = load i32* %ur, align 4
  %conv558 = uitofp i32 %tmp557 to float
  %tmp559 = load float* %fl, align 4
  %div560 = fdiv float %tmp559, %conv558
  store float %div560, float* %fl, align 4
  %tmp561 = load float* %fl, align 4
  %conv562 = fpext float %tmp561 to double
  %cmp563 = fcmp une double %conv562, 2.500000e+00
  br i1 %cmp563, label %if.then565, label %if.end572

if.then565:                                       ; preds = %if.end556
  store i32 236, i32* %lrc, align 4
  %tmp566 = load i32* %prlc, align 4
  %tobool567 = icmp ne i32 %tmp566, 0
  br i1 %tobool567, label %if.then568, label %if.end571

if.then568:                                       ; preds = %if.then565
  %tmp569 = load i32* %lrc, align 4
  %call570 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp569)
  br label %if.end571

if.end571:                                        ; preds = %if.then568, %if.then565
  br label %if.end572

if.end572:                                        ; preds = %if.end571, %if.end556
  store float 5.000000e+00, float* %fl, align 4
  store float 2.000000e+00, float* %fr, align 4
  %tmp573 = load float* %fr, align 4
  %tmp574 = load float* %fl, align 4
  %div575 = fdiv float %tmp574, %tmp573
  store float %div575, float* %fl, align 4
  %tmp576 = load float* %fl, align 4
  %conv577 = fpext float %tmp576 to double
  %cmp578 = fcmp une double %conv577, 2.500000e+00
  br i1 %cmp578, label %if.then580, label %if.end587

if.then580:                                       ; preds = %if.end572
  store i32 237, i32* %lrc, align 4
  %tmp581 = load i32* %prlc, align 4
  %tobool582 = icmp ne i32 %tmp581, 0
  br i1 %tobool582, label %if.then583, label %if.end586

if.then583:                                       ; preds = %if.then580
  %tmp584 = load i32* %lrc, align 4
  %call585 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp584)
  br label %if.end586

if.end586:                                        ; preds = %if.then583, %if.then580
  br label %if.end587

if.end587:                                        ; preds = %if.end586, %if.end572
  store float 5.000000e+00, float* %fl, align 4
  store double 2.000000e+00, double* %dr, align 8
  %tmp588 = load double* %dr, align 8
  %tmp589 = load float* %fl, align 4
  %conv590 = fpext float %tmp589 to double
  %div591 = fdiv double %conv590, %tmp588
  %conv592 = fptrunc double %div591 to float
  store float %conv592, float* %fl, align 4
  %tmp593 = load float* %fl, align 4
  %conv594 = fpext float %tmp593 to double
  %cmp595 = fcmp une double %conv594, 2.500000e+00
  br i1 %cmp595, label %if.then597, label %if.end604

if.then597:                                       ; preds = %if.end587
  store i32 238, i32* %lrc, align 4
  %tmp598 = load i32* %prlc, align 4
  %tobool599 = icmp ne i32 %tmp598, 0
  br i1 %tobool599, label %if.then600, label %if.end603

if.then600:                                       ; preds = %if.then597
  %tmp601 = load i32* %lrc, align 4
  %call602 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp601)
  br label %if.end603

if.end603:                                        ; preds = %if.then600, %if.then597
  br label %if.end604

if.end604:                                        ; preds = %if.end603, %if.end587
  store double 5.000000e+00, double* %dl, align 8
  store i8 2, i8* %cr, align 1
  %tmp605 = load i8* %cr, align 1
  %conv606 = sext i8 %tmp605 to i32
  %conv607 = sitofp i32 %conv606 to double
  %tmp608 = load double* %dl, align 8
  %div609 = fdiv double %tmp608, %conv607
  store double %div609, double* %dl, align 8
  %tmp610 = load double* %dl, align 8
  %cmp611 = fcmp une double %tmp610, 2.500000e+00
  br i1 %cmp611, label %if.then613, label %if.end620

if.then613:                                       ; preds = %if.end604
  store i32 239, i32* %lrc, align 4
  %tmp614 = load i32* %prlc, align 4
  %tobool615 = icmp ne i32 %tmp614, 0
  br i1 %tobool615, label %if.then616, label %if.end619

if.then616:                                       ; preds = %if.then613
  %tmp617 = load i32* %lrc, align 4
  %call618 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp617)
  br label %if.end619

if.end619:                                        ; preds = %if.then616, %if.then613
  br label %if.end620

if.end620:                                        ; preds = %if.end619, %if.end604
  store double 5.000000e+00, double* %dl, align 8
  store i16 2, i16* %sr, align 2
  %tmp621 = load i16* %sr, align 2
  %conv622 = sext i16 %tmp621 to i32
  %conv623 = sitofp i32 %conv622 to double
  %tmp624 = load double* %dl, align 8
  %div625 = fdiv double %tmp624, %conv623
  store double %div625, double* %dl, align 8
  %tmp626 = load double* %dl, align 8
  %cmp627 = fcmp une double %tmp626, 2.500000e+00
  br i1 %cmp627, label %if.then629, label %if.end636

if.then629:                                       ; preds = %if.end620
  store i32 240, i32* %lrc, align 4
  %tmp630 = load i32* %prlc, align 4
  %tobool631 = icmp ne i32 %tmp630, 0
  br i1 %tobool631, label %if.then632, label %if.end635

if.then632:                                       ; preds = %if.then629
  %tmp633 = load i32* %lrc, align 4
  %call634 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp633)
  br label %if.end635

if.end635:                                        ; preds = %if.then632, %if.then629
  br label %if.end636

if.end636:                                        ; preds = %if.end635, %if.end620
  store double 5.000000e+00, double* %dl, align 8
  store i32 2, i32* %ir, align 4
  %tmp637 = load i32* %ir, align 4
  %conv638 = sitofp i32 %tmp637 to double
  %tmp639 = load double* %dl, align 8
  %div640 = fdiv double %tmp639, %conv638
  store double %div640, double* %dl, align 8
  %tmp641 = load double* %dl, align 8
  %cmp642 = fcmp une double %tmp641, 2.500000e+00
  br i1 %cmp642, label %if.then644, label %if.end651

if.then644:                                       ; preds = %if.end636
  store i32 241, i32* %lrc, align 4
  %tmp645 = load i32* %prlc, align 4
  %tobool646 = icmp ne i32 %tmp645, 0
  br i1 %tobool646, label %if.then647, label %if.end650

if.then647:                                       ; preds = %if.then644
  %tmp648 = load i32* %lrc, align 4
  %call649 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp648)
  br label %if.end650

if.end650:                                        ; preds = %if.then647, %if.then644
  br label %if.end651

if.end651:                                        ; preds = %if.end650, %if.end636
  store double 5.000000e+00, double* %dl, align 8
  store i64 2, i64* %lr, align 8
  %tmp652 = load i64* %lr, align 8
  %conv653 = sitofp i64 %tmp652 to double
  %tmp654 = load double* %dl, align 8
  %div655 = fdiv double %tmp654, %conv653
  store double %div655, double* %dl, align 8
  %tmp656 = load double* %dl, align 8
  %cmp657 = fcmp une double %tmp656, 2.500000e+00
  br i1 %cmp657, label %if.then659, label %if.end666

if.then659:                                       ; preds = %if.end651
  store i32 242, i32* %lrc, align 4
  %tmp660 = load i32* %prlc, align 4
  %tobool661 = icmp ne i32 %tmp660, 0
  br i1 %tobool661, label %if.then662, label %if.end665

if.then662:                                       ; preds = %if.then659
  %tmp663 = load i32* %lrc, align 4
  %call664 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp663)
  br label %if.end665

if.end665:                                        ; preds = %if.then662, %if.then659
  br label %if.end666

if.end666:                                        ; preds = %if.end665, %if.end651
  store double 5.000000e+00, double* %dl, align 8
  store i32 2, i32* %ur, align 4
  %tmp667 = load i32* %ur, align 4
  %conv668 = uitofp i32 %tmp667 to double
  %tmp669 = load double* %dl, align 8
  %div670 = fdiv double %tmp669, %conv668
  store double %div670, double* %dl, align 8
  %tmp671 = load double* %dl, align 8
  %cmp672 = fcmp une double %tmp671, 2.500000e+00
  br i1 %cmp672, label %if.then674, label %if.end681

if.then674:                                       ; preds = %if.end666
  store i32 243, i32* %lrc, align 4
  %tmp675 = load i32* %prlc, align 4
  %tobool676 = icmp ne i32 %tmp675, 0
  br i1 %tobool676, label %if.then677, label %if.end680

if.then677:                                       ; preds = %if.then674
  %tmp678 = load i32* %lrc, align 4
  %call679 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp678)
  br label %if.end680

if.end680:                                        ; preds = %if.then677, %if.then674
  br label %if.end681

if.end681:                                        ; preds = %if.end680, %if.end666
  store double 5.000000e+00, double* %dl, align 8
  store float 2.000000e+00, float* %fr, align 4
  %tmp682 = load float* %fr, align 4
  %conv683 = fpext float %tmp682 to double
  %tmp684 = load double* %dl, align 8
  %div685 = fdiv double %tmp684, %conv683
  store double %div685, double* %dl, align 8
  %tmp686 = load double* %dl, align 8
  %cmp687 = fcmp une double %tmp686, 2.500000e+00
  br i1 %cmp687, label %if.then689, label %if.end696

if.then689:                                       ; preds = %if.end681
  store i32 244, i32* %lrc, align 4
  %tmp690 = load i32* %prlc, align 4
  %tobool691 = icmp ne i32 %tmp690, 0
  br i1 %tobool691, label %if.then692, label %if.end695

if.then692:                                       ; preds = %if.then689
  %tmp693 = load i32* %lrc, align 4
  %call694 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp693)
  br label %if.end695

if.end695:                                        ; preds = %if.then692, %if.then689
  br label %if.end696

if.end696:                                        ; preds = %if.end695, %if.end681
  store double 5.000000e+00, double* %dl, align 8
  store double 2.000000e+00, double* %dr, align 8
  %tmp697 = load double* %dr, align 8
  %tmp698 = load double* %dl, align 8
  %div699 = fdiv double %tmp698, %tmp697
  store double %div699, double* %dl, align 8
  %tmp700 = load double* %dl, align 8
  %cmp701 = fcmp une double %tmp700, 2.500000e+00
  br i1 %cmp701, label %if.then703, label %if.end710

if.then703:                                       ; preds = %if.end696
  store i32 245, i32* %lrc, align 4
  %tmp704 = load i32* %prlc, align 4
  %tobool705 = icmp ne i32 %tmp704, 0
  br i1 %tobool705, label %if.then706, label %if.end709

if.then706:                                       ; preds = %if.then703
  %tmp707 = load i32* %lrc, align 4
  %call708 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp707)
  br label %if.end709

if.end709:                                        ; preds = %if.then706, %if.then703
  br label %if.end710

if.end710:                                        ; preds = %if.end709, %if.end696
  store i8 5, i8* %cl, align 1
  store i8 2, i8* %cr, align 1
  %tmp711 = load i8* %cr, align 1
  %conv712 = sext i8 %tmp711 to i32
  %tmp713 = load i8* %cl, align 1
  %conv714 = sext i8 %tmp713 to i32
  %rem = srem i32 %conv714, %conv712
  %conv715 = trunc i32 %rem to i8
  store i8 %conv715, i8* %cl, align 1
  %tmp716 = load i8* %cl, align 1
  %conv717 = sext i8 %tmp716 to i32
  %cmp718 = icmp ne i32 %conv717, 1
  br i1 %cmp718, label %if.then720, label %if.end727

if.then720:                                       ; preds = %if.end710
  store i32 246, i32* %lrc, align 4
  %tmp721 = load i32* %prlc, align 4
  %tobool722 = icmp ne i32 %tmp721, 0
  br i1 %tobool722, label %if.then723, label %if.end726

if.then723:                                       ; preds = %if.then720
  %tmp724 = load i32* %lrc, align 4
  %call725 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp724)
  br label %if.end726

if.end726:                                        ; preds = %if.then723, %if.then720
  br label %if.end727

if.end727:                                        ; preds = %if.end726, %if.end710
  store i8 5, i8* %cl, align 1
  store i16 2, i16* %sr, align 2
  %tmp728 = load i16* %sr, align 2
  %conv729 = sext i16 %tmp728 to i32
  %tmp730 = load i8* %cl, align 1
  %conv731 = sext i8 %tmp730 to i32
  %rem732 = srem i32 %conv731, %conv729
  %conv733 = trunc i32 %rem732 to i8
  store i8 %conv733, i8* %cl, align 1
  %tmp734 = load i8* %cl, align 1
  %conv735 = sext i8 %tmp734 to i32
  %cmp736 = icmp ne i32 %conv735, 1
  br i1 %cmp736, label %if.then738, label %if.end745

if.then738:                                       ; preds = %if.end727
  store i32 247, i32* %lrc, align 4
  %tmp739 = load i32* %prlc, align 4
  %tobool740 = icmp ne i32 %tmp739, 0
  br i1 %tobool740, label %if.then741, label %if.end744

if.then741:                                       ; preds = %if.then738
  %tmp742 = load i32* %lrc, align 4
  %call743 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp742)
  br label %if.end744

if.end744:                                        ; preds = %if.then741, %if.then738
  br label %if.end745

if.end745:                                        ; preds = %if.end744, %if.end727
  store i8 5, i8* %cl, align 1
  store i32 2, i32* %ir, align 4
  %tmp746 = load i32* %ir, align 4
  %tmp747 = load i8* %cl, align 1
  %conv748 = sext i8 %tmp747 to i32
  %rem749 = srem i32 %conv748, %tmp746
  %conv750 = trunc i32 %rem749 to i8
  store i8 %conv750, i8* %cl, align 1
  %tmp751 = load i8* %cl, align 1
  %conv752 = sext i8 %tmp751 to i32
  %cmp753 = icmp ne i32 %conv752, 1
  br i1 %cmp753, label %if.then755, label %if.end762

if.then755:                                       ; preds = %if.end745
  store i32 248, i32* %lrc, align 4
  %tmp756 = load i32* %prlc, align 4
  %tobool757 = icmp ne i32 %tmp756, 0
  br i1 %tobool757, label %if.then758, label %if.end761

if.then758:                                       ; preds = %if.then755
  %tmp759 = load i32* %lrc, align 4
  %call760 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp759)
  br label %if.end761

if.end761:                                        ; preds = %if.then758, %if.then755
  br label %if.end762

if.end762:                                        ; preds = %if.end761, %if.end745
  store i8 5, i8* %cl, align 1
  store i64 2, i64* %lr, align 8
  %tmp763 = load i64* %lr, align 8
  %tmp764 = load i8* %cl, align 1
  %conv765 = sext i8 %tmp764 to i64
  %rem766 = srem i64 %conv765, %tmp763
  %conv767 = trunc i64 %rem766 to i8
  store i8 %conv767, i8* %cl, align 1
  %tmp768 = load i8* %cl, align 1
  %conv769 = sext i8 %tmp768 to i32
  %cmp770 = icmp ne i32 %conv769, 1
  br i1 %cmp770, label %if.then772, label %if.end779

if.then772:                                       ; preds = %if.end762
  store i32 249, i32* %lrc, align 4
  %tmp773 = load i32* %prlc, align 4
  %tobool774 = icmp ne i32 %tmp773, 0
  br i1 %tobool774, label %if.then775, label %if.end778

if.then775:                                       ; preds = %if.then772
  %tmp776 = load i32* %lrc, align 4
  %call777 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp776)
  br label %if.end778

if.end778:                                        ; preds = %if.then775, %if.then772
  br label %if.end779

if.end779:                                        ; preds = %if.end778, %if.end762
  store i8 5, i8* %cl, align 1
  store i32 2, i32* %ur, align 4
  %tmp780 = load i32* %ur, align 4
  %tmp781 = load i8* %cl, align 1
  %conv782 = sext i8 %tmp781 to i32
  %rem783 = urem i32 %conv782, %tmp780
  %conv784 = trunc i32 %rem783 to i8
  store i8 %conv784, i8* %cl, align 1
  %tmp785 = load i8* %cl, align 1
  %conv786 = sext i8 %tmp785 to i32
  %cmp787 = icmp ne i32 %conv786, 1
  br i1 %cmp787, label %if.then789, label %if.end796

if.then789:                                       ; preds = %if.end779
  store i32 250, i32* %lrc, align 4
  %tmp790 = load i32* %prlc, align 4
  %tobool791 = icmp ne i32 %tmp790, 0
  br i1 %tobool791, label %if.then792, label %if.end795

if.then792:                                       ; preds = %if.then789
  %tmp793 = load i32* %lrc, align 4
  %call794 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp793)
  br label %if.end795

if.end795:                                        ; preds = %if.then792, %if.then789
  br label %if.end796

if.end796:                                        ; preds = %if.end795, %if.end779
  %tmp797 = load i32* %lrc, align 4
  %cmp798 = icmp ne i32 %tmp797, 0
  br i1 %cmp798, label %if.then800, label %if.end808

if.then800:                                       ; preds = %if.end796
  store i32 1, i32* %rc, align 4
  %tmp801 = load %struct.defs** %pd0.addr, align 8
  %flgd = getelementptr inbounds %struct.defs* %tmp801, i32 0, i32 11
  %tmp802 = load i32* %flgd, align 4
  %cmp803 = icmp ne i32 %tmp802, 0
  br i1 %cmp803, label %if.then805, label %if.end807

if.then805:                                       ; preds = %if.then800
  %call806 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @sec.s714er, i32 0, i32 0), i32 1)
  br label %if.end807

if.end807:                                        ; preds = %if.then805, %if.then800
  br label %if.end808

if.end808:                                        ; preds = %if.end807, %if.end796
  %tmp809 = load i32* %rc, align 4
  ret i32 %tmp809
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
