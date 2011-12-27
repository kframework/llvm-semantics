; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/cq-20-s714-h.c'
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
  store i16 12, i16* %sl, align 2
  store i8 10, i8* %cr, align 1
  %tmp7 = load i8* %cr, align 1
  %conv = sext i8 %tmp7 to i32
  %tmp8 = load i16* %sl, align 2
  %conv9 = sext i16 %tmp8 to i32
  %xor = xor i32 %conv9, %conv
  %conv10 = trunc i32 %xor to i16
  store i16 %conv10, i16* %sl, align 2
  %tmp11 = load i16* %sl, align 2
  %conv12 = sext i16 %tmp11 to i32
  %cmp = icmp ne i32 %conv12, 6
  br i1 %cmp, label %if.then, label %if.end18

if.then:                                          ; preds = %while.end
  store i32 351, i32* %lrc, align 4
  %tmp14 = load i32* %prlc, align 4
  %tobool15 = icmp ne i32 %tmp14, 0
  br i1 %tobool15, label %if.then16, label %if.end

if.then16:                                        ; preds = %if.then
  %tmp17 = load i32* %lrc, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp17)
  br label %if.end

if.end:                                           ; preds = %if.then16, %if.then
  br label %if.end18

if.end18:                                         ; preds = %if.end, %while.end
  store i16 12, i16* %sl, align 2
  store i16 10, i16* %sr, align 2
  %tmp19 = load i16* %sr, align 2
  %conv20 = sext i16 %tmp19 to i32
  %tmp21 = load i16* %sl, align 2
  %conv22 = sext i16 %tmp21 to i32
  %xor23 = xor i32 %conv22, %conv20
  %conv24 = trunc i32 %xor23 to i16
  store i16 %conv24, i16* %sl, align 2
  %tmp25 = load i16* %sl, align 2
  %conv26 = sext i16 %tmp25 to i32
  %cmp27 = icmp ne i32 %conv26, 6
  br i1 %cmp27, label %if.then29, label %if.end36

if.then29:                                        ; preds = %if.end18
  store i32 352, i32* %lrc, align 4
  %tmp30 = load i32* %prlc, align 4
  %tobool31 = icmp ne i32 %tmp30, 0
  br i1 %tobool31, label %if.then32, label %if.end35

if.then32:                                        ; preds = %if.then29
  %tmp33 = load i32* %lrc, align 4
  %call34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp33)
  br label %if.end35

if.end35:                                         ; preds = %if.then32, %if.then29
  br label %if.end36

if.end36:                                         ; preds = %if.end35, %if.end18
  store i16 12, i16* %sl, align 2
  store i32 10, i32* %ir, align 4
  %tmp37 = load i32* %ir, align 4
  %tmp38 = load i16* %sl, align 2
  %conv39 = sext i16 %tmp38 to i32
  %xor40 = xor i32 %conv39, %tmp37
  %conv41 = trunc i32 %xor40 to i16
  store i16 %conv41, i16* %sl, align 2
  %tmp42 = load i16* %sl, align 2
  %conv43 = sext i16 %tmp42 to i32
  %cmp44 = icmp ne i32 %conv43, 6
  br i1 %cmp44, label %if.then46, label %if.end53

if.then46:                                        ; preds = %if.end36
  store i32 353, i32* %lrc, align 4
  %tmp47 = load i32* %prlc, align 4
  %tobool48 = icmp ne i32 %tmp47, 0
  br i1 %tobool48, label %if.then49, label %if.end52

if.then49:                                        ; preds = %if.then46
  %tmp50 = load i32* %lrc, align 4
  %call51 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp50)
  br label %if.end52

if.end52:                                         ; preds = %if.then49, %if.then46
  br label %if.end53

if.end53:                                         ; preds = %if.end52, %if.end36
  store i16 12, i16* %sl, align 2
  store i64 10, i64* %lr, align 8
  %tmp54 = load i64* %lr, align 8
  %tmp55 = load i16* %sl, align 2
  %conv56 = sext i16 %tmp55 to i64
  %xor57 = xor i64 %conv56, %tmp54
  %conv58 = trunc i64 %xor57 to i16
  store i16 %conv58, i16* %sl, align 2
  %tmp59 = load i16* %sl, align 2
  %conv60 = sext i16 %tmp59 to i32
  %cmp61 = icmp ne i32 %conv60, 6
  br i1 %cmp61, label %if.then63, label %if.end70

if.then63:                                        ; preds = %if.end53
  store i32 354, i32* %lrc, align 4
  %tmp64 = load i32* %prlc, align 4
  %tobool65 = icmp ne i32 %tmp64, 0
  br i1 %tobool65, label %if.then66, label %if.end69

if.then66:                                        ; preds = %if.then63
  %tmp67 = load i32* %lrc, align 4
  %call68 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp67)
  br label %if.end69

if.end69:                                         ; preds = %if.then66, %if.then63
  br label %if.end70

if.end70:                                         ; preds = %if.end69, %if.end53
  store i16 12, i16* %sl, align 2
  store i32 10, i32* %ur, align 4
  %tmp71 = load i32* %ur, align 4
  %tmp72 = load i16* %sl, align 2
  %conv73 = sext i16 %tmp72 to i32
  %xor74 = xor i32 %conv73, %tmp71
  %conv75 = trunc i32 %xor74 to i16
  store i16 %conv75, i16* %sl, align 2
  %tmp76 = load i16* %sl, align 2
  %conv77 = sext i16 %tmp76 to i32
  %cmp78 = icmp ne i32 %conv77, 6
  br i1 %cmp78, label %if.then80, label %if.end87

if.then80:                                        ; preds = %if.end70
  store i32 355, i32* %lrc, align 4
  %tmp81 = load i32* %prlc, align 4
  %tobool82 = icmp ne i32 %tmp81, 0
  br i1 %tobool82, label %if.then83, label %if.end86

if.then83:                                        ; preds = %if.then80
  %tmp84 = load i32* %lrc, align 4
  %call85 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp84)
  br label %if.end86

if.end86:                                         ; preds = %if.then83, %if.then80
  br label %if.end87

if.end87:                                         ; preds = %if.end86, %if.end70
  store i32 12, i32* %il, align 4
  store i8 10, i8* %cr, align 1
  %tmp88 = load i8* %cr, align 1
  %conv89 = sext i8 %tmp88 to i32
  %tmp90 = load i32* %il, align 4
  %xor91 = xor i32 %tmp90, %conv89
  store i32 %xor91, i32* %il, align 4
  %tmp92 = load i32* %il, align 4
  %cmp93 = icmp ne i32 %tmp92, 6
  br i1 %cmp93, label %if.then95, label %if.end102

if.then95:                                        ; preds = %if.end87
  store i32 356, i32* %lrc, align 4
  %tmp96 = load i32* %prlc, align 4
  %tobool97 = icmp ne i32 %tmp96, 0
  br i1 %tobool97, label %if.then98, label %if.end101

if.then98:                                        ; preds = %if.then95
  %tmp99 = load i32* %lrc, align 4
  %call100 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp99)
  br label %if.end101

if.end101:                                        ; preds = %if.then98, %if.then95
  br label %if.end102

if.end102:                                        ; preds = %if.end101, %if.end87
  store i32 12, i32* %il, align 4
  store i16 10, i16* %sr, align 2
  %tmp103 = load i16* %sr, align 2
  %conv104 = sext i16 %tmp103 to i32
  %tmp105 = load i32* %il, align 4
  %xor106 = xor i32 %tmp105, %conv104
  store i32 %xor106, i32* %il, align 4
  %tmp107 = load i32* %il, align 4
  %cmp108 = icmp ne i32 %tmp107, 6
  br i1 %cmp108, label %if.then110, label %if.end117

if.then110:                                       ; preds = %if.end102
  store i32 357, i32* %lrc, align 4
  %tmp111 = load i32* %prlc, align 4
  %tobool112 = icmp ne i32 %tmp111, 0
  br i1 %tobool112, label %if.then113, label %if.end116

if.then113:                                       ; preds = %if.then110
  %tmp114 = load i32* %lrc, align 4
  %call115 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp114)
  br label %if.end116

if.end116:                                        ; preds = %if.then113, %if.then110
  br label %if.end117

if.end117:                                        ; preds = %if.end116, %if.end102
  store i32 12, i32* %il, align 4
  store i32 10, i32* %ir, align 4
  %tmp118 = load i32* %ir, align 4
  %tmp119 = load i32* %il, align 4
  %xor120 = xor i32 %tmp119, %tmp118
  store i32 %xor120, i32* %il, align 4
  %tmp121 = load i32* %il, align 4
  %cmp122 = icmp ne i32 %tmp121, 6
  br i1 %cmp122, label %if.then124, label %if.end131

if.then124:                                       ; preds = %if.end117
  store i32 358, i32* %lrc, align 4
  %tmp125 = load i32* %prlc, align 4
  %tobool126 = icmp ne i32 %tmp125, 0
  br i1 %tobool126, label %if.then127, label %if.end130

if.then127:                                       ; preds = %if.then124
  %tmp128 = load i32* %lrc, align 4
  %call129 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp128)
  br label %if.end130

if.end130:                                        ; preds = %if.then127, %if.then124
  br label %if.end131

if.end131:                                        ; preds = %if.end130, %if.end117
  store i32 12, i32* %il, align 4
  store i64 10, i64* %lr, align 8
  %tmp132 = load i64* %lr, align 8
  %tmp133 = load i32* %il, align 4
  %conv134 = sext i32 %tmp133 to i64
  %xor135 = xor i64 %conv134, %tmp132
  %conv136 = trunc i64 %xor135 to i32
  store i32 %conv136, i32* %il, align 4
  %tmp137 = load i32* %il, align 4
  %cmp138 = icmp ne i32 %tmp137, 6
  br i1 %cmp138, label %if.then140, label %if.end147

if.then140:                                       ; preds = %if.end131
  store i32 359, i32* %lrc, align 4
  %tmp141 = load i32* %prlc, align 4
  %tobool142 = icmp ne i32 %tmp141, 0
  br i1 %tobool142, label %if.then143, label %if.end146

if.then143:                                       ; preds = %if.then140
  %tmp144 = load i32* %lrc, align 4
  %call145 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp144)
  br label %if.end146

if.end146:                                        ; preds = %if.then143, %if.then140
  br label %if.end147

if.end147:                                        ; preds = %if.end146, %if.end131
  store i32 12, i32* %il, align 4
  store i32 10, i32* %ur, align 4
  %tmp148 = load i32* %ur, align 4
  %tmp149 = load i32* %il, align 4
  %xor150 = xor i32 %tmp149, %tmp148
  store i32 %xor150, i32* %il, align 4
  %tmp151 = load i32* %il, align 4
  %cmp152 = icmp ne i32 %tmp151, 6
  br i1 %cmp152, label %if.then154, label %if.end161

if.then154:                                       ; preds = %if.end147
  store i32 360, i32* %lrc, align 4
  %tmp155 = load i32* %prlc, align 4
  %tobool156 = icmp ne i32 %tmp155, 0
  br i1 %tobool156, label %if.then157, label %if.end160

if.then157:                                       ; preds = %if.then154
  %tmp158 = load i32* %lrc, align 4
  %call159 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp158)
  br label %if.end160

if.end160:                                        ; preds = %if.then157, %if.then154
  br label %if.end161

if.end161:                                        ; preds = %if.end160, %if.end147
  store i64 12, i64* %ll, align 8
  store i8 10, i8* %cr, align 1
  %tmp162 = load i8* %cr, align 1
  %conv163 = sext i8 %tmp162 to i64
  %tmp164 = load i64* %ll, align 8
  %xor165 = xor i64 %tmp164, %conv163
  store i64 %xor165, i64* %ll, align 8
  %tmp166 = load i64* %ll, align 8
  %cmp167 = icmp ne i64 %tmp166, 6
  br i1 %cmp167, label %if.then169, label %if.end176

if.then169:                                       ; preds = %if.end161
  store i32 361, i32* %lrc, align 4
  %tmp170 = load i32* %prlc, align 4
  %tobool171 = icmp ne i32 %tmp170, 0
  br i1 %tobool171, label %if.then172, label %if.end175

if.then172:                                       ; preds = %if.then169
  %tmp173 = load i32* %lrc, align 4
  %call174 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp173)
  br label %if.end175

if.end175:                                        ; preds = %if.then172, %if.then169
  br label %if.end176

if.end176:                                        ; preds = %if.end175, %if.end161
  store i64 12, i64* %ll, align 8
  store i16 10, i16* %sr, align 2
  %tmp177 = load i16* %sr, align 2
  %conv178 = sext i16 %tmp177 to i64
  %tmp179 = load i64* %ll, align 8
  %xor180 = xor i64 %tmp179, %conv178
  store i64 %xor180, i64* %ll, align 8
  %tmp181 = load i64* %ll, align 8
  %cmp182 = icmp ne i64 %tmp181, 6
  br i1 %cmp182, label %if.then184, label %if.end191

if.then184:                                       ; preds = %if.end176
  store i32 362, i32* %lrc, align 4
  %tmp185 = load i32* %prlc, align 4
  %tobool186 = icmp ne i32 %tmp185, 0
  br i1 %tobool186, label %if.then187, label %if.end190

if.then187:                                       ; preds = %if.then184
  %tmp188 = load i32* %lrc, align 4
  %call189 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp188)
  br label %if.end190

if.end190:                                        ; preds = %if.then187, %if.then184
  br label %if.end191

if.end191:                                        ; preds = %if.end190, %if.end176
  store i64 12, i64* %ll, align 8
  store i32 10, i32* %ir, align 4
  %tmp192 = load i32* %ir, align 4
  %conv193 = sext i32 %tmp192 to i64
  %tmp194 = load i64* %ll, align 8
  %xor195 = xor i64 %tmp194, %conv193
  store i64 %xor195, i64* %ll, align 8
  %tmp196 = load i64* %ll, align 8
  %cmp197 = icmp ne i64 %tmp196, 6
  br i1 %cmp197, label %if.then199, label %if.end206

if.then199:                                       ; preds = %if.end191
  store i32 363, i32* %lrc, align 4
  %tmp200 = load i32* %prlc, align 4
  %tobool201 = icmp ne i32 %tmp200, 0
  br i1 %tobool201, label %if.then202, label %if.end205

if.then202:                                       ; preds = %if.then199
  %tmp203 = load i32* %lrc, align 4
  %call204 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp203)
  br label %if.end205

if.end205:                                        ; preds = %if.then202, %if.then199
  br label %if.end206

if.end206:                                        ; preds = %if.end205, %if.end191
  store i64 12, i64* %ll, align 8
  store i64 10, i64* %lr, align 8
  %tmp207 = load i64* %lr, align 8
  %tmp208 = load i64* %ll, align 8
  %xor209 = xor i64 %tmp208, %tmp207
  store i64 %xor209, i64* %ll, align 8
  %tmp210 = load i64* %ll, align 8
  %cmp211 = icmp ne i64 %tmp210, 6
  br i1 %cmp211, label %if.then213, label %if.end220

if.then213:                                       ; preds = %if.end206
  store i32 364, i32* %lrc, align 4
  %tmp214 = load i32* %prlc, align 4
  %tobool215 = icmp ne i32 %tmp214, 0
  br i1 %tobool215, label %if.then216, label %if.end219

if.then216:                                       ; preds = %if.then213
  %tmp217 = load i32* %lrc, align 4
  %call218 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp217)
  br label %if.end219

if.end219:                                        ; preds = %if.then216, %if.then213
  br label %if.end220

if.end220:                                        ; preds = %if.end219, %if.end206
  store i64 12, i64* %ll, align 8
  store i32 10, i32* %ur, align 4
  %tmp221 = load i32* %ur, align 4
  %conv222 = zext i32 %tmp221 to i64
  %tmp223 = load i64* %ll, align 8
  %xor224 = xor i64 %tmp223, %conv222
  store i64 %xor224, i64* %ll, align 8
  %tmp225 = load i64* %ll, align 8
  %cmp226 = icmp ne i64 %tmp225, 6
  br i1 %cmp226, label %if.then228, label %if.end235

if.then228:                                       ; preds = %if.end220
  store i32 365, i32* %lrc, align 4
  %tmp229 = load i32* %prlc, align 4
  %tobool230 = icmp ne i32 %tmp229, 0
  br i1 %tobool230, label %if.then231, label %if.end234

if.then231:                                       ; preds = %if.then228
  %tmp232 = load i32* %lrc, align 4
  %call233 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp232)
  br label %if.end234

if.end234:                                        ; preds = %if.then231, %if.then228
  br label %if.end235

if.end235:                                        ; preds = %if.end234, %if.end220
  store i32 12, i32* %ul, align 4
  store i8 10, i8* %cr, align 1
  %tmp236 = load i8* %cr, align 1
  %conv237 = sext i8 %tmp236 to i32
  %tmp238 = load i32* %ul, align 4
  %xor239 = xor i32 %tmp238, %conv237
  store i32 %xor239, i32* %ul, align 4
  %tmp240 = load i32* %ul, align 4
  %cmp241 = icmp ne i32 %tmp240, 6
  br i1 %cmp241, label %if.then243, label %if.end250

if.then243:                                       ; preds = %if.end235
  store i32 366, i32* %lrc, align 4
  %tmp244 = load i32* %prlc, align 4
  %tobool245 = icmp ne i32 %tmp244, 0
  br i1 %tobool245, label %if.then246, label %if.end249

if.then246:                                       ; preds = %if.then243
  %tmp247 = load i32* %lrc, align 4
  %call248 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp247)
  br label %if.end249

if.end249:                                        ; preds = %if.then246, %if.then243
  br label %if.end250

if.end250:                                        ; preds = %if.end249, %if.end235
  store i32 12, i32* %ul, align 4
  store i16 10, i16* %sr, align 2
  %tmp251 = load i16* %sr, align 2
  %conv252 = sext i16 %tmp251 to i32
  %tmp253 = load i32* %ul, align 4
  %xor254 = xor i32 %tmp253, %conv252
  store i32 %xor254, i32* %ul, align 4
  %tmp255 = load i32* %ul, align 4
  %cmp256 = icmp ne i32 %tmp255, 6
  br i1 %cmp256, label %if.then258, label %if.end265

if.then258:                                       ; preds = %if.end250
  store i32 367, i32* %lrc, align 4
  %tmp259 = load i32* %prlc, align 4
  %tobool260 = icmp ne i32 %tmp259, 0
  br i1 %tobool260, label %if.then261, label %if.end264

if.then261:                                       ; preds = %if.then258
  %tmp262 = load i32* %lrc, align 4
  %call263 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp262)
  br label %if.end264

if.end264:                                        ; preds = %if.then261, %if.then258
  br label %if.end265

if.end265:                                        ; preds = %if.end264, %if.end250
  store i32 12, i32* %ul, align 4
  store i32 10, i32* %ir, align 4
  %tmp266 = load i32* %ir, align 4
  %tmp267 = load i32* %ul, align 4
  %xor268 = xor i32 %tmp267, %tmp266
  store i32 %xor268, i32* %ul, align 4
  %tmp269 = load i32* %ul, align 4
  %cmp270 = icmp ne i32 %tmp269, 6
  br i1 %cmp270, label %if.then272, label %if.end279

if.then272:                                       ; preds = %if.end265
  store i32 368, i32* %lrc, align 4
  %tmp273 = load i32* %prlc, align 4
  %tobool274 = icmp ne i32 %tmp273, 0
  br i1 %tobool274, label %if.then275, label %if.end278

if.then275:                                       ; preds = %if.then272
  %tmp276 = load i32* %lrc, align 4
  %call277 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp276)
  br label %if.end278

if.end278:                                        ; preds = %if.then275, %if.then272
  br label %if.end279

if.end279:                                        ; preds = %if.end278, %if.end265
  store i32 12, i32* %ul, align 4
  store i64 10, i64* %lr, align 8
  %tmp280 = load i64* %lr, align 8
  %tmp281 = load i32* %ul, align 4
  %conv282 = zext i32 %tmp281 to i64
  %xor283 = xor i64 %conv282, %tmp280
  %conv284 = trunc i64 %xor283 to i32
  store i32 %conv284, i32* %ul, align 4
  %tmp285 = load i32* %ul, align 4
  %cmp286 = icmp ne i32 %tmp285, 6
  br i1 %cmp286, label %if.then288, label %if.end295

if.then288:                                       ; preds = %if.end279
  store i32 369, i32* %lrc, align 4
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
  store i32 12, i32* %ul, align 4
  store i32 10, i32* %ur, align 4
  %tmp296 = load i32* %ur, align 4
  %tmp297 = load i32* %ul, align 4
  %xor298 = xor i32 %tmp297, %tmp296
  store i32 %xor298, i32* %ul, align 4
  %tmp299 = load i32* %ul, align 4
  %cmp300 = icmp ne i32 %tmp299, 6
  br i1 %cmp300, label %if.then302, label %if.end309

if.then302:                                       ; preds = %if.end295
  store i32 370, i32* %lrc, align 4
  %tmp303 = load i32* %prlc, align 4
  %tobool304 = icmp ne i32 %tmp303, 0
  br i1 %tobool304, label %if.then305, label %if.end308

if.then305:                                       ; preds = %if.then302
  %tmp306 = load i32* %lrc, align 4
  %call307 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp306)
  br label %if.end308

if.end308:                                        ; preds = %if.then305, %if.then302
  br label %if.end309

if.end309:                                        ; preds = %if.end308, %if.end295
  store i8 12, i8* %cl, align 1
  store i8 10, i8* %cr, align 1
  %tmp310 = load i8* %cr, align 1
  %conv311 = sext i8 %tmp310 to i32
  %tmp312 = load i8* %cl, align 1
  %conv313 = sext i8 %tmp312 to i32
  %or = or i32 %conv313, %conv311
  %conv314 = trunc i32 %or to i8
  store i8 %conv314, i8* %cl, align 1
  %tmp315 = load i8* %cl, align 1
  %conv316 = sext i8 %tmp315 to i32
  %cmp317 = icmp ne i32 %conv316, 14
  br i1 %cmp317, label %if.then319, label %if.end326

if.then319:                                       ; preds = %if.end309
  store i32 371, i32* %lrc, align 4
  %tmp320 = load i32* %prlc, align 4
  %tobool321 = icmp ne i32 %tmp320, 0
  br i1 %tobool321, label %if.then322, label %if.end325

if.then322:                                       ; preds = %if.then319
  %tmp323 = load i32* %lrc, align 4
  %call324 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp323)
  br label %if.end325

if.end325:                                        ; preds = %if.then322, %if.then319
  br label %if.end326

if.end326:                                        ; preds = %if.end325, %if.end309
  store i8 12, i8* %cl, align 1
  store i16 10, i16* %sr, align 2
  %tmp327 = load i16* %sr, align 2
  %conv328 = sext i16 %tmp327 to i32
  %tmp329 = load i8* %cl, align 1
  %conv330 = sext i8 %tmp329 to i32
  %or331 = or i32 %conv330, %conv328
  %conv332 = trunc i32 %or331 to i8
  store i8 %conv332, i8* %cl, align 1
  %tmp333 = load i8* %cl, align 1
  %conv334 = sext i8 %tmp333 to i32
  %cmp335 = icmp ne i32 %conv334, 14
  br i1 %cmp335, label %if.then337, label %if.end344

if.then337:                                       ; preds = %if.end326
  store i32 372, i32* %lrc, align 4
  %tmp338 = load i32* %prlc, align 4
  %tobool339 = icmp ne i32 %tmp338, 0
  br i1 %tobool339, label %if.then340, label %if.end343

if.then340:                                       ; preds = %if.then337
  %tmp341 = load i32* %lrc, align 4
  %call342 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp341)
  br label %if.end343

if.end343:                                        ; preds = %if.then340, %if.then337
  br label %if.end344

if.end344:                                        ; preds = %if.end343, %if.end326
  store i8 12, i8* %cl, align 1
  store i32 10, i32* %ir, align 4
  %tmp345 = load i32* %ir, align 4
  %tmp346 = load i8* %cl, align 1
  %conv347 = sext i8 %tmp346 to i32
  %or348 = or i32 %conv347, %tmp345
  %conv349 = trunc i32 %or348 to i8
  store i8 %conv349, i8* %cl, align 1
  %tmp350 = load i8* %cl, align 1
  %conv351 = sext i8 %tmp350 to i32
  %cmp352 = icmp ne i32 %conv351, 14
  br i1 %cmp352, label %if.then354, label %if.end361

if.then354:                                       ; preds = %if.end344
  store i32 373, i32* %lrc, align 4
  %tmp355 = load i32* %prlc, align 4
  %tobool356 = icmp ne i32 %tmp355, 0
  br i1 %tobool356, label %if.then357, label %if.end360

if.then357:                                       ; preds = %if.then354
  %tmp358 = load i32* %lrc, align 4
  %call359 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp358)
  br label %if.end360

if.end360:                                        ; preds = %if.then357, %if.then354
  br label %if.end361

if.end361:                                        ; preds = %if.end360, %if.end344
  store i8 12, i8* %cl, align 1
  store i64 10, i64* %lr, align 8
  %tmp362 = load i64* %lr, align 8
  %tmp363 = load i8* %cl, align 1
  %conv364 = sext i8 %tmp363 to i64
  %or365 = or i64 %conv364, %tmp362
  %conv366 = trunc i64 %or365 to i8
  store i8 %conv366, i8* %cl, align 1
  %tmp367 = load i8* %cl, align 1
  %conv368 = sext i8 %tmp367 to i32
  %cmp369 = icmp ne i32 %conv368, 14
  br i1 %cmp369, label %if.then371, label %if.end378

if.then371:                                       ; preds = %if.end361
  store i32 374, i32* %lrc, align 4
  %tmp372 = load i32* %prlc, align 4
  %tobool373 = icmp ne i32 %tmp372, 0
  br i1 %tobool373, label %if.then374, label %if.end377

if.then374:                                       ; preds = %if.then371
  %tmp375 = load i32* %lrc, align 4
  %call376 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp375)
  br label %if.end377

if.end377:                                        ; preds = %if.then374, %if.then371
  br label %if.end378

if.end378:                                        ; preds = %if.end377, %if.end361
  store i8 12, i8* %cl, align 1
  store i32 10, i32* %ur, align 4
  %tmp379 = load i32* %ur, align 4
  %tmp380 = load i8* %cl, align 1
  %conv381 = sext i8 %tmp380 to i32
  %or382 = or i32 %conv381, %tmp379
  %conv383 = trunc i32 %or382 to i8
  store i8 %conv383, i8* %cl, align 1
  %tmp384 = load i8* %cl, align 1
  %conv385 = sext i8 %tmp384 to i32
  %cmp386 = icmp ne i32 %conv385, 14
  br i1 %cmp386, label %if.then388, label %if.end395

if.then388:                                       ; preds = %if.end378
  store i32 375, i32* %lrc, align 4
  %tmp389 = load i32* %prlc, align 4
  %tobool390 = icmp ne i32 %tmp389, 0
  br i1 %tobool390, label %if.then391, label %if.end394

if.then391:                                       ; preds = %if.then388
  %tmp392 = load i32* %lrc, align 4
  %call393 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp392)
  br label %if.end394

if.end394:                                        ; preds = %if.then391, %if.then388
  br label %if.end395

if.end395:                                        ; preds = %if.end394, %if.end378
  store i16 12, i16* %sl, align 2
  store i8 10, i8* %cr, align 1
  %tmp396 = load i8* %cr, align 1
  %conv397 = sext i8 %tmp396 to i32
  %tmp398 = load i16* %sl, align 2
  %conv399 = sext i16 %tmp398 to i32
  %or400 = or i32 %conv399, %conv397
  %conv401 = trunc i32 %or400 to i16
  store i16 %conv401, i16* %sl, align 2
  %tmp402 = load i16* %sl, align 2
  %conv403 = sext i16 %tmp402 to i32
  %cmp404 = icmp ne i32 %conv403, 14
  br i1 %cmp404, label %if.then406, label %if.end413

if.then406:                                       ; preds = %if.end395
  store i32 376, i32* %lrc, align 4
  %tmp407 = load i32* %prlc, align 4
  %tobool408 = icmp ne i32 %tmp407, 0
  br i1 %tobool408, label %if.then409, label %if.end412

if.then409:                                       ; preds = %if.then406
  %tmp410 = load i32* %lrc, align 4
  %call411 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp410)
  br label %if.end412

if.end412:                                        ; preds = %if.then409, %if.then406
  br label %if.end413

if.end413:                                        ; preds = %if.end412, %if.end395
  store i16 12, i16* %sl, align 2
  store i16 10, i16* %sr, align 2
  %tmp414 = load i16* %sr, align 2
  %conv415 = sext i16 %tmp414 to i32
  %tmp416 = load i16* %sl, align 2
  %conv417 = sext i16 %tmp416 to i32
  %or418 = or i32 %conv417, %conv415
  %conv419 = trunc i32 %or418 to i16
  store i16 %conv419, i16* %sl, align 2
  %tmp420 = load i16* %sl, align 2
  %conv421 = sext i16 %tmp420 to i32
  %cmp422 = icmp ne i32 %conv421, 14
  br i1 %cmp422, label %if.then424, label %if.end431

if.then424:                                       ; preds = %if.end413
  store i32 377, i32* %lrc, align 4
  %tmp425 = load i32* %prlc, align 4
  %tobool426 = icmp ne i32 %tmp425, 0
  br i1 %tobool426, label %if.then427, label %if.end430

if.then427:                                       ; preds = %if.then424
  %tmp428 = load i32* %lrc, align 4
  %call429 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp428)
  br label %if.end430

if.end430:                                        ; preds = %if.then427, %if.then424
  br label %if.end431

if.end431:                                        ; preds = %if.end430, %if.end413
  store i16 12, i16* %sl, align 2
  store i32 10, i32* %ir, align 4
  %tmp432 = load i32* %ir, align 4
  %tmp433 = load i16* %sl, align 2
  %conv434 = sext i16 %tmp433 to i32
  %or435 = or i32 %conv434, %tmp432
  %conv436 = trunc i32 %or435 to i16
  store i16 %conv436, i16* %sl, align 2
  %tmp437 = load i16* %sl, align 2
  %conv438 = sext i16 %tmp437 to i32
  %cmp439 = icmp ne i32 %conv438, 14
  br i1 %cmp439, label %if.then441, label %if.end448

if.then441:                                       ; preds = %if.end431
  store i32 378, i32* %lrc, align 4
  %tmp442 = load i32* %prlc, align 4
  %tobool443 = icmp ne i32 %tmp442, 0
  br i1 %tobool443, label %if.then444, label %if.end447

if.then444:                                       ; preds = %if.then441
  %tmp445 = load i32* %lrc, align 4
  %call446 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp445)
  br label %if.end447

if.end447:                                        ; preds = %if.then444, %if.then441
  br label %if.end448

if.end448:                                        ; preds = %if.end447, %if.end431
  store i16 12, i16* %sl, align 2
  store i64 10, i64* %lr, align 8
  %tmp449 = load i64* %lr, align 8
  %tmp450 = load i16* %sl, align 2
  %conv451 = sext i16 %tmp450 to i64
  %or452 = or i64 %conv451, %tmp449
  %conv453 = trunc i64 %or452 to i16
  store i16 %conv453, i16* %sl, align 2
  %tmp454 = load i16* %sl, align 2
  %conv455 = sext i16 %tmp454 to i32
  %cmp456 = icmp ne i32 %conv455, 14
  br i1 %cmp456, label %if.then458, label %if.end465

if.then458:                                       ; preds = %if.end448
  store i32 379, i32* %lrc, align 4
  %tmp459 = load i32* %prlc, align 4
  %tobool460 = icmp ne i32 %tmp459, 0
  br i1 %tobool460, label %if.then461, label %if.end464

if.then461:                                       ; preds = %if.then458
  %tmp462 = load i32* %lrc, align 4
  %call463 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp462)
  br label %if.end464

if.end464:                                        ; preds = %if.then461, %if.then458
  br label %if.end465

if.end465:                                        ; preds = %if.end464, %if.end448
  store i16 12, i16* %sl, align 2
  store i32 10, i32* %ur, align 4
  %tmp466 = load i32* %ur, align 4
  %tmp467 = load i16* %sl, align 2
  %conv468 = sext i16 %tmp467 to i32
  %or469 = or i32 %conv468, %tmp466
  %conv470 = trunc i32 %or469 to i16
  store i16 %conv470, i16* %sl, align 2
  %tmp471 = load i16* %sl, align 2
  %conv472 = sext i16 %tmp471 to i32
  %cmp473 = icmp ne i32 %conv472, 14
  br i1 %cmp473, label %if.then475, label %if.end482

if.then475:                                       ; preds = %if.end465
  store i32 380, i32* %lrc, align 4
  %tmp476 = load i32* %prlc, align 4
  %tobool477 = icmp ne i32 %tmp476, 0
  br i1 %tobool477, label %if.then478, label %if.end481

if.then478:                                       ; preds = %if.then475
  %tmp479 = load i32* %lrc, align 4
  %call480 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp479)
  br label %if.end481

if.end481:                                        ; preds = %if.then478, %if.then475
  br label %if.end482

if.end482:                                        ; preds = %if.end481, %if.end465
  store i32 12, i32* %il, align 4
  store i8 10, i8* %cr, align 1
  %tmp483 = load i8* %cr, align 1
  %conv484 = sext i8 %tmp483 to i32
  %tmp485 = load i32* %il, align 4
  %or486 = or i32 %tmp485, %conv484
  store i32 %or486, i32* %il, align 4
  %tmp487 = load i32* %il, align 4
  %cmp488 = icmp ne i32 %tmp487, 14
  br i1 %cmp488, label %if.then490, label %if.end497

if.then490:                                       ; preds = %if.end482
  store i32 381, i32* %lrc, align 4
  %tmp491 = load i32* %prlc, align 4
  %tobool492 = icmp ne i32 %tmp491, 0
  br i1 %tobool492, label %if.then493, label %if.end496

if.then493:                                       ; preds = %if.then490
  %tmp494 = load i32* %lrc, align 4
  %call495 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp494)
  br label %if.end496

if.end496:                                        ; preds = %if.then493, %if.then490
  br label %if.end497

if.end497:                                        ; preds = %if.end496, %if.end482
  store i32 12, i32* %il, align 4
  store i16 10, i16* %sr, align 2
  %tmp498 = load i16* %sr, align 2
  %conv499 = sext i16 %tmp498 to i32
  %tmp500 = load i32* %il, align 4
  %or501 = or i32 %tmp500, %conv499
  store i32 %or501, i32* %il, align 4
  %tmp502 = load i32* %il, align 4
  %cmp503 = icmp ne i32 %tmp502, 14
  br i1 %cmp503, label %if.then505, label %if.end512

if.then505:                                       ; preds = %if.end497
  store i32 382, i32* %lrc, align 4
  %tmp506 = load i32* %prlc, align 4
  %tobool507 = icmp ne i32 %tmp506, 0
  br i1 %tobool507, label %if.then508, label %if.end511

if.then508:                                       ; preds = %if.then505
  %tmp509 = load i32* %lrc, align 4
  %call510 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp509)
  br label %if.end511

if.end511:                                        ; preds = %if.then508, %if.then505
  br label %if.end512

if.end512:                                        ; preds = %if.end511, %if.end497
  store i32 12, i32* %il, align 4
  store i32 10, i32* %ir, align 4
  %tmp513 = load i32* %ir, align 4
  %tmp514 = load i32* %il, align 4
  %or515 = or i32 %tmp514, %tmp513
  store i32 %or515, i32* %il, align 4
  %tmp516 = load i32* %il, align 4
  %cmp517 = icmp ne i32 %tmp516, 14
  br i1 %cmp517, label %if.then519, label %if.end526

if.then519:                                       ; preds = %if.end512
  store i32 383, i32* %lrc, align 4
  %tmp520 = load i32* %prlc, align 4
  %tobool521 = icmp ne i32 %tmp520, 0
  br i1 %tobool521, label %if.then522, label %if.end525

if.then522:                                       ; preds = %if.then519
  %tmp523 = load i32* %lrc, align 4
  %call524 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp523)
  br label %if.end525

if.end525:                                        ; preds = %if.then522, %if.then519
  br label %if.end526

if.end526:                                        ; preds = %if.end525, %if.end512
  store i32 12, i32* %il, align 4
  store i64 10, i64* %lr, align 8
  %tmp527 = load i64* %lr, align 8
  %tmp528 = load i32* %il, align 4
  %conv529 = sext i32 %tmp528 to i64
  %or530 = or i64 %conv529, %tmp527
  %conv531 = trunc i64 %or530 to i32
  store i32 %conv531, i32* %il, align 4
  %tmp532 = load i32* %il, align 4
  %cmp533 = icmp ne i32 %tmp532, 14
  br i1 %cmp533, label %if.then535, label %if.end542

if.then535:                                       ; preds = %if.end526
  store i32 384, i32* %lrc, align 4
  %tmp536 = load i32* %prlc, align 4
  %tobool537 = icmp ne i32 %tmp536, 0
  br i1 %tobool537, label %if.then538, label %if.end541

if.then538:                                       ; preds = %if.then535
  %tmp539 = load i32* %lrc, align 4
  %call540 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp539)
  br label %if.end541

if.end541:                                        ; preds = %if.then538, %if.then535
  br label %if.end542

if.end542:                                        ; preds = %if.end541, %if.end526
  store i32 12, i32* %il, align 4
  store i32 10, i32* %ur, align 4
  %tmp543 = load i32* %ur, align 4
  %tmp544 = load i32* %il, align 4
  %or545 = or i32 %tmp544, %tmp543
  store i32 %or545, i32* %il, align 4
  %tmp546 = load i32* %il, align 4
  %cmp547 = icmp ne i32 %tmp546, 14
  br i1 %cmp547, label %if.then549, label %if.end556

if.then549:                                       ; preds = %if.end542
  store i32 385, i32* %lrc, align 4
  %tmp550 = load i32* %prlc, align 4
  %tobool551 = icmp ne i32 %tmp550, 0
  br i1 %tobool551, label %if.then552, label %if.end555

if.then552:                                       ; preds = %if.then549
  %tmp553 = load i32* %lrc, align 4
  %call554 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp553)
  br label %if.end555

if.end555:                                        ; preds = %if.then552, %if.then549
  br label %if.end556

if.end556:                                        ; preds = %if.end555, %if.end542
  store i64 12, i64* %ll, align 8
  store i8 10, i8* %cr, align 1
  %tmp557 = load i8* %cr, align 1
  %conv558 = sext i8 %tmp557 to i64
  %tmp559 = load i64* %ll, align 8
  %or560 = or i64 %tmp559, %conv558
  store i64 %or560, i64* %ll, align 8
  %tmp561 = load i64* %ll, align 8
  %cmp562 = icmp ne i64 %tmp561, 14
  br i1 %cmp562, label %if.then564, label %if.end571

if.then564:                                       ; preds = %if.end556
  store i32 386, i32* %lrc, align 4
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
  store i64 12, i64* %ll, align 8
  store i16 10, i16* %sr, align 2
  %tmp572 = load i16* %sr, align 2
  %conv573 = sext i16 %tmp572 to i64
  %tmp574 = load i64* %ll, align 8
  %or575 = or i64 %tmp574, %conv573
  store i64 %or575, i64* %ll, align 8
  %tmp576 = load i64* %ll, align 8
  %cmp577 = icmp ne i64 %tmp576, 14
  br i1 %cmp577, label %if.then579, label %if.end586

if.then579:                                       ; preds = %if.end571
  store i32 387, i32* %lrc, align 4
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
  store i64 12, i64* %ll, align 8
  store i32 10, i32* %ir, align 4
  %tmp587 = load i32* %ir, align 4
  %conv588 = sext i32 %tmp587 to i64
  %tmp589 = load i64* %ll, align 8
  %or590 = or i64 %tmp589, %conv588
  store i64 %or590, i64* %ll, align 8
  %tmp591 = load i64* %ll, align 8
  %cmp592 = icmp ne i64 %tmp591, 14
  br i1 %cmp592, label %if.then594, label %if.end601

if.then594:                                       ; preds = %if.end586
  store i32 388, i32* %lrc, align 4
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
  store i64 12, i64* %ll, align 8
  store i64 10, i64* %lr, align 8
  %tmp602 = load i64* %lr, align 8
  %tmp603 = load i64* %ll, align 8
  %or604 = or i64 %tmp603, %tmp602
  store i64 %or604, i64* %ll, align 8
  %tmp605 = load i64* %ll, align 8
  %cmp606 = icmp ne i64 %tmp605, 14
  br i1 %cmp606, label %if.then608, label %if.end615

if.then608:                                       ; preds = %if.end601
  store i32 389, i32* %lrc, align 4
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
  store i64 12, i64* %ll, align 8
  store i32 10, i32* %ur, align 4
  %tmp616 = load i32* %ur, align 4
  %conv617 = zext i32 %tmp616 to i64
  %tmp618 = load i64* %ll, align 8
  %or619 = or i64 %tmp618, %conv617
  store i64 %or619, i64* %ll, align 8
  %tmp620 = load i64* %ll, align 8
  %cmp621 = icmp ne i64 %tmp620, 14
  br i1 %cmp621, label %if.then623, label %if.end630

if.then623:                                       ; preds = %if.end615
  store i32 390, i32* %lrc, align 4
  %tmp624 = load i32* %prlc, align 4
  %tobool625 = icmp ne i32 %tmp624, 0
  br i1 %tobool625, label %if.then626, label %if.end629

if.then626:                                       ; preds = %if.then623
  %tmp627 = load i32* %lrc, align 4
  %call628 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp627)
  br label %if.end629

if.end629:                                        ; preds = %if.then626, %if.then623
  br label %if.end630

if.end630:                                        ; preds = %if.end629, %if.end615
  store i32 12, i32* %ul, align 4
  store i8 10, i8* %cr, align 1
  %tmp631 = load i8* %cr, align 1
  %conv632 = sext i8 %tmp631 to i32
  %tmp633 = load i32* %ul, align 4
  %or634 = or i32 %tmp633, %conv632
  store i32 %or634, i32* %ul, align 4
  %tmp635 = load i32* %ul, align 4
  %cmp636 = icmp ne i32 %tmp635, 14
  br i1 %cmp636, label %if.then638, label %if.end645

if.then638:                                       ; preds = %if.end630
  store i32 391, i32* %lrc, align 4
  %tmp639 = load i32* %prlc, align 4
  %tobool640 = icmp ne i32 %tmp639, 0
  br i1 %tobool640, label %if.then641, label %if.end644

if.then641:                                       ; preds = %if.then638
  %tmp642 = load i32* %lrc, align 4
  %call643 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp642)
  br label %if.end644

if.end644:                                        ; preds = %if.then641, %if.then638
  br label %if.end645

if.end645:                                        ; preds = %if.end644, %if.end630
  store i32 12, i32* %ul, align 4
  store i16 10, i16* %sr, align 2
  %tmp646 = load i16* %sr, align 2
  %conv647 = sext i16 %tmp646 to i32
  %tmp648 = load i32* %ul, align 4
  %or649 = or i32 %tmp648, %conv647
  store i32 %or649, i32* %ul, align 4
  %tmp650 = load i32* %ul, align 4
  %cmp651 = icmp ne i32 %tmp650, 14
  br i1 %cmp651, label %if.then653, label %if.end660

if.then653:                                       ; preds = %if.end645
  store i32 392, i32* %lrc, align 4
  %tmp654 = load i32* %prlc, align 4
  %tobool655 = icmp ne i32 %tmp654, 0
  br i1 %tobool655, label %if.then656, label %if.end659

if.then656:                                       ; preds = %if.then653
  %tmp657 = load i32* %lrc, align 4
  %call658 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp657)
  br label %if.end659

if.end659:                                        ; preds = %if.then656, %if.then653
  br label %if.end660

if.end660:                                        ; preds = %if.end659, %if.end645
  store i32 12, i32* %ul, align 4
  store i32 10, i32* %ir, align 4
  %tmp661 = load i32* %ir, align 4
  %tmp662 = load i32* %ul, align 4
  %or663 = or i32 %tmp662, %tmp661
  store i32 %or663, i32* %ul, align 4
  %tmp664 = load i32* %ul, align 4
  %cmp665 = icmp ne i32 %tmp664, 14
  br i1 %cmp665, label %if.then667, label %if.end674

if.then667:                                       ; preds = %if.end660
  store i32 393, i32* %lrc, align 4
  %tmp668 = load i32* %prlc, align 4
  %tobool669 = icmp ne i32 %tmp668, 0
  br i1 %tobool669, label %if.then670, label %if.end673

if.then670:                                       ; preds = %if.then667
  %tmp671 = load i32* %lrc, align 4
  %call672 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp671)
  br label %if.end673

if.end673:                                        ; preds = %if.then670, %if.then667
  br label %if.end674

if.end674:                                        ; preds = %if.end673, %if.end660
  store i32 12, i32* %ul, align 4
  store i64 10, i64* %lr, align 8
  %tmp675 = load i64* %lr, align 8
  %tmp676 = load i32* %ul, align 4
  %conv677 = zext i32 %tmp676 to i64
  %or678 = or i64 %conv677, %tmp675
  %conv679 = trunc i64 %or678 to i32
  store i32 %conv679, i32* %ul, align 4
  %tmp680 = load i32* %ul, align 4
  %cmp681 = icmp ne i32 %tmp680, 14
  br i1 %cmp681, label %if.then683, label %if.end690

if.then683:                                       ; preds = %if.end674
  store i32 394, i32* %lrc, align 4
  %tmp684 = load i32* %prlc, align 4
  %tobool685 = icmp ne i32 %tmp684, 0
  br i1 %tobool685, label %if.then686, label %if.end689

if.then686:                                       ; preds = %if.then683
  %tmp687 = load i32* %lrc, align 4
  %call688 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp687)
  br label %if.end689

if.end689:                                        ; preds = %if.then686, %if.then683
  br label %if.end690

if.end690:                                        ; preds = %if.end689, %if.end674
  store i32 12, i32* %ul, align 4
  store i32 10, i32* %ur, align 4
  %tmp691 = load i32* %ur, align 4
  %tmp692 = load i32* %ul, align 4
  %or693 = or i32 %tmp692, %tmp691
  store i32 %or693, i32* %ul, align 4
  %tmp694 = load i32* %ul, align 4
  %cmp695 = icmp ne i32 %tmp694, 14
  br i1 %cmp695, label %if.then697, label %if.end704

if.then697:                                       ; preds = %if.end690
  store i32 395, i32* %lrc, align 4
  %tmp698 = load i32* %prlc, align 4
  %tobool699 = icmp ne i32 %tmp698, 0
  br i1 %tobool699, label %if.then700, label %if.end703

if.then700:                                       ; preds = %if.then697
  %tmp701 = load i32* %lrc, align 4
  %call702 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp701)
  br label %if.end703

if.end703:                                        ; preds = %if.then700, %if.then697
  br label %if.end704

if.end704:                                        ; preds = %if.end703, %if.end690
  %tmp705 = load i32* %lrc, align 4
  %cmp706 = icmp ne i32 %tmp705, 0
  br i1 %cmp706, label %if.then708, label %if.end716

if.then708:                                       ; preds = %if.end704
  store i32 1, i32* %rc, align 4
  %tmp709 = load %struct.defs** %pd0.addr, align 8
  %flgd = getelementptr inbounds %struct.defs* %tmp709, i32 0, i32 11
  %tmp710 = load i32* %flgd, align 4
  %cmp711 = icmp ne i32 %tmp710, 0
  br i1 %cmp711, label %if.then713, label %if.end715

if.then713:                                       ; preds = %if.then708
  %call714 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @sec.s714er, i32 0, i32 0), i32 1)
  br label %if.end715

if.end715:                                        ; preds = %if.then713, %if.then708
  br label %if.end716

if.end716:                                        ; preds = %if.end715, %if.end704
  %tmp717 = load i32* %rc, align 4
  ret i32 %tmp717
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
