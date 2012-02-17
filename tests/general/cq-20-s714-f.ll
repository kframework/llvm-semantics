; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/cq-20-s714-f.c'
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
  store i16 5, i16* %sl, align 2
  store i8 2, i8* %cr, align 1
  %tmp7 = load i8* %cr, align 1
  %conv = sext i8 %tmp7 to i32
  %tmp8 = load i16* %sl, align 2
  %conv9 = sext i16 %tmp8 to i32
  %rem = srem i32 %conv9, %conv
  %conv10 = trunc i32 %rem to i16
  store i16 %conv10, i16* %sl, align 2
  %tmp11 = load i16* %sl, align 2
  %conv12 = sext i16 %tmp11 to i32
  %cmp = icmp ne i32 %conv12, 1
  br i1 %cmp, label %if.then, label %if.end18

if.then:                                          ; preds = %while.end
  store i32 251, i32* %lrc, align 4
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
  store i16 5, i16* %sl, align 2
  store i16 2, i16* %sr, align 2
  %tmp19 = load i16* %sr, align 2
  %conv20 = sext i16 %tmp19 to i32
  %tmp21 = load i16* %sl, align 2
  %conv22 = sext i16 %tmp21 to i32
  %rem23 = srem i32 %conv22, %conv20
  %conv24 = trunc i32 %rem23 to i16
  store i16 %conv24, i16* %sl, align 2
  %tmp25 = load i16* %sl, align 2
  %conv26 = sext i16 %tmp25 to i32
  %cmp27 = icmp ne i32 %conv26, 1
  br i1 %cmp27, label %if.then29, label %if.end36

if.then29:                                        ; preds = %if.end18
  store i32 252, i32* %lrc, align 4
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
  store i16 5, i16* %sl, align 2
  store i32 2, i32* %ir, align 4
  %tmp37 = load i32* %ir, align 4
  %tmp38 = load i16* %sl, align 2
  %conv39 = sext i16 %tmp38 to i32
  %rem40 = srem i32 %conv39, %tmp37
  %conv41 = trunc i32 %rem40 to i16
  store i16 %conv41, i16* %sl, align 2
  %tmp42 = load i16* %sl, align 2
  %conv43 = sext i16 %tmp42 to i32
  %cmp44 = icmp ne i32 %conv43, 1
  br i1 %cmp44, label %if.then46, label %if.end53

if.then46:                                        ; preds = %if.end36
  store i32 253, i32* %lrc, align 4
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
  store i16 5, i16* %sl, align 2
  store i64 2, i64* %lr, align 8
  %tmp54 = load i64* %lr, align 8
  %tmp55 = load i16* %sl, align 2
  %conv56 = sext i16 %tmp55 to i64
  %rem57 = srem i64 %conv56, %tmp54
  %conv58 = trunc i64 %rem57 to i16
  store i16 %conv58, i16* %sl, align 2
  %tmp59 = load i16* %sl, align 2
  %conv60 = sext i16 %tmp59 to i32
  %cmp61 = icmp ne i32 %conv60, 1
  br i1 %cmp61, label %if.then63, label %if.end70

if.then63:                                        ; preds = %if.end53
  store i32 254, i32* %lrc, align 4
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
  store i16 5, i16* %sl, align 2
  store i32 2, i32* %ur, align 4
  %tmp71 = load i32* %ur, align 4
  %tmp72 = load i16* %sl, align 2
  %conv73 = sext i16 %tmp72 to i32
  %rem74 = urem i32 %conv73, %tmp71
  %conv75 = trunc i32 %rem74 to i16
  store i16 %conv75, i16* %sl, align 2
  %tmp76 = load i16* %sl, align 2
  %conv77 = sext i16 %tmp76 to i32
  %cmp78 = icmp ne i32 %conv77, 1
  br i1 %cmp78, label %if.then80, label %if.end87

if.then80:                                        ; preds = %if.end70
  store i32 255, i32* %lrc, align 4
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
  store i32 5, i32* %il, align 4
  store i8 2, i8* %cr, align 1
  %tmp88 = load i8* %cr, align 1
  %conv89 = sext i8 %tmp88 to i32
  %tmp90 = load i32* %il, align 4
  %rem91 = srem i32 %tmp90, %conv89
  store i32 %rem91, i32* %il, align 4
  %tmp92 = load i32* %il, align 4
  %cmp93 = icmp ne i32 %tmp92, 1
  br i1 %cmp93, label %if.then95, label %if.end102

if.then95:                                        ; preds = %if.end87
  store i32 256, i32* %lrc, align 4
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
  store i32 5, i32* %il, align 4
  store i16 2, i16* %sr, align 2
  %tmp103 = load i16* %sr, align 2
  %conv104 = sext i16 %tmp103 to i32
  %tmp105 = load i32* %il, align 4
  %rem106 = srem i32 %tmp105, %conv104
  store i32 %rem106, i32* %il, align 4
  %tmp107 = load i32* %il, align 4
  %cmp108 = icmp ne i32 %tmp107, 1
  br i1 %cmp108, label %if.then110, label %if.end117

if.then110:                                       ; preds = %if.end102
  store i32 257, i32* %lrc, align 4
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
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ir, align 4
  %tmp118 = load i32* %ir, align 4
  %tmp119 = load i32* %il, align 4
  %rem120 = srem i32 %tmp119, %tmp118
  store i32 %rem120, i32* %il, align 4
  %tmp121 = load i32* %il, align 4
  %cmp122 = icmp ne i32 %tmp121, 1
  br i1 %cmp122, label %if.then124, label %if.end131

if.then124:                                       ; preds = %if.end117
  store i32 258, i32* %lrc, align 4
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
  store i32 5, i32* %il, align 4
  store i64 2, i64* %lr, align 8
  %tmp132 = load i64* %lr, align 8
  %tmp133 = load i32* %il, align 4
  %conv134 = sext i32 %tmp133 to i64
  %rem135 = srem i64 %conv134, %tmp132
  %conv136 = trunc i64 %rem135 to i32
  store i32 %conv136, i32* %il, align 4
  %tmp137 = load i32* %il, align 4
  %cmp138 = icmp ne i32 %tmp137, 1
  br i1 %cmp138, label %if.then140, label %if.end147

if.then140:                                       ; preds = %if.end131
  store i32 259, i32* %lrc, align 4
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
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ur, align 4
  %tmp148 = load i32* %ur, align 4
  %tmp149 = load i32* %il, align 4
  %rem150 = urem i32 %tmp149, %tmp148
  store i32 %rem150, i32* %il, align 4
  %tmp151 = load i32* %il, align 4
  %cmp152 = icmp ne i32 %tmp151, 1
  br i1 %cmp152, label %if.then154, label %if.end161

if.then154:                                       ; preds = %if.end147
  store i32 260, i32* %lrc, align 4
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
  store i64 5, i64* %ll, align 8
  store i8 2, i8* %cr, align 1
  %tmp162 = load i8* %cr, align 1
  %conv163 = sext i8 %tmp162 to i64
  %tmp164 = load i64* %ll, align 8
  %rem165 = srem i64 %tmp164, %conv163
  store i64 %rem165, i64* %ll, align 8
  %tmp166 = load i64* %ll, align 8
  %cmp167 = icmp ne i64 %tmp166, 1
  br i1 %cmp167, label %if.then169, label %if.end176

if.then169:                                       ; preds = %if.end161
  store i32 261, i32* %lrc, align 4
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
  store i64 5, i64* %ll, align 8
  store i16 2, i16* %sr, align 2
  %tmp177 = load i16* %sr, align 2
  %conv178 = sext i16 %tmp177 to i64
  %tmp179 = load i64* %ll, align 8
  %rem180 = srem i64 %tmp179, %conv178
  store i64 %rem180, i64* %ll, align 8
  %tmp181 = load i64* %ll, align 8
  %cmp182 = icmp ne i64 %tmp181, 1
  br i1 %cmp182, label %if.then184, label %if.end191

if.then184:                                       ; preds = %if.end176
  store i32 262, i32* %lrc, align 4
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
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ir, align 4
  %tmp192 = load i32* %ir, align 4
  %conv193 = sext i32 %tmp192 to i64
  %tmp194 = load i64* %ll, align 8
  %rem195 = srem i64 %tmp194, %conv193
  store i64 %rem195, i64* %ll, align 8
  %tmp196 = load i64* %ll, align 8
  %cmp197 = icmp ne i64 %tmp196, 1
  br i1 %cmp197, label %if.then199, label %if.end206

if.then199:                                       ; preds = %if.end191
  store i32 263, i32* %lrc, align 4
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
  store i64 5, i64* %ll, align 8
  store i64 2, i64* %lr, align 8
  %tmp207 = load i64* %lr, align 8
  %tmp208 = load i64* %ll, align 8
  %rem209 = srem i64 %tmp208, %tmp207
  store i64 %rem209, i64* %ll, align 8
  %tmp210 = load i64* %ll, align 8
  %cmp211 = icmp ne i64 %tmp210, 1
  br i1 %cmp211, label %if.then213, label %if.end220

if.then213:                                       ; preds = %if.end206
  store i32 264, i32* %lrc, align 4
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
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ur, align 4
  %tmp221 = load i32* %ur, align 4
  %conv222 = zext i32 %tmp221 to i64
  %tmp223 = load i64* %ll, align 8
  %rem224 = srem i64 %tmp223, %conv222
  store i64 %rem224, i64* %ll, align 8
  %tmp225 = load i64* %ll, align 8
  %cmp226 = icmp ne i64 %tmp225, 1
  br i1 %cmp226, label %if.then228, label %if.end235

if.then228:                                       ; preds = %if.end220
  store i32 265, i32* %lrc, align 4
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
  store i32 5, i32* %ul, align 4
  store i8 2, i8* %cr, align 1
  %tmp236 = load i8* %cr, align 1
  %conv237 = sext i8 %tmp236 to i32
  %tmp238 = load i32* %ul, align 4
  %rem239 = urem i32 %tmp238, %conv237
  store i32 %rem239, i32* %ul, align 4
  %tmp240 = load i32* %ul, align 4
  %cmp241 = icmp ne i32 %tmp240, 1
  br i1 %cmp241, label %if.then243, label %if.end250

if.then243:                                       ; preds = %if.end235
  store i32 266, i32* %lrc, align 4
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
  store i32 5, i32* %ul, align 4
  store i16 2, i16* %sr, align 2
  %tmp251 = load i16* %sr, align 2
  %conv252 = sext i16 %tmp251 to i32
  %tmp253 = load i32* %ul, align 4
  %rem254 = urem i32 %tmp253, %conv252
  store i32 %rem254, i32* %ul, align 4
  %tmp255 = load i32* %ul, align 4
  %cmp256 = icmp ne i32 %tmp255, 1
  br i1 %cmp256, label %if.then258, label %if.end265

if.then258:                                       ; preds = %if.end250
  store i32 267, i32* %lrc, align 4
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
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ir, align 4
  %tmp266 = load i32* %ir, align 4
  %tmp267 = load i32* %ul, align 4
  %rem268 = urem i32 %tmp267, %tmp266
  store i32 %rem268, i32* %ul, align 4
  %tmp269 = load i32* %ul, align 4
  %cmp270 = icmp ne i32 %tmp269, 1
  br i1 %cmp270, label %if.then272, label %if.end279

if.then272:                                       ; preds = %if.end265
  store i32 268, i32* %lrc, align 4
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
  store i32 5, i32* %ul, align 4
  store i64 2, i64* %lr, align 8
  %tmp280 = load i64* %lr, align 8
  %tmp281 = load i32* %ul, align 4
  %conv282 = zext i32 %tmp281 to i64
  %rem283 = srem i64 %conv282, %tmp280
  %conv284 = trunc i64 %rem283 to i32
  store i32 %conv284, i32* %ul, align 4
  %tmp285 = load i32* %ul, align 4
  %cmp286 = icmp ne i32 %tmp285, 1
  br i1 %cmp286, label %if.then288, label %if.end295

if.then288:                                       ; preds = %if.end279
  store i32 269, i32* %lrc, align 4
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
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ur, align 4
  %tmp296 = load i32* %ur, align 4
  %tmp297 = load i32* %ul, align 4
  %rem298 = urem i32 %tmp297, %tmp296
  store i32 %rem298, i32* %ul, align 4
  %tmp299 = load i32* %ul, align 4
  %cmp300 = icmp ne i32 %tmp299, 1
  br i1 %cmp300, label %if.then302, label %if.end309

if.then302:                                       ; preds = %if.end295
  store i32 270, i32* %lrc, align 4
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
  store i8 5, i8* %cl, align 1
  store i8 2, i8* %cr, align 1
  %tmp310 = load i8* %cr, align 1
  %conv311 = sext i8 %tmp310 to i32
  %tmp312 = load i8* %cl, align 1
  %conv313 = sext i8 %tmp312 to i32
  %shr = ashr i32 %conv313, %conv311
  %conv314 = trunc i32 %shr to i8
  store i8 %conv314, i8* %cl, align 1
  %tmp315 = load i8* %cl, align 1
  %conv316 = sext i8 %tmp315 to i32
  %cmp317 = icmp ne i32 %conv316, 1
  br i1 %cmp317, label %if.then319, label %if.end326

if.then319:                                       ; preds = %if.end309
  store i32 271, i32* %lrc, align 4
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
  store i8 5, i8* %cl, align 1
  store i16 2, i16* %sr, align 2
  %tmp327 = load i16* %sr, align 2
  %conv328 = sext i16 %tmp327 to i32
  %tmp329 = load i8* %cl, align 1
  %conv330 = sext i8 %tmp329 to i32
  %shr331 = ashr i32 %conv330, %conv328
  %conv332 = trunc i32 %shr331 to i8
  store i8 %conv332, i8* %cl, align 1
  %tmp333 = load i8* %cl, align 1
  %conv334 = sext i8 %tmp333 to i32
  %cmp335 = icmp ne i32 %conv334, 1
  br i1 %cmp335, label %if.then337, label %if.end344

if.then337:                                       ; preds = %if.end326
  store i32 272, i32* %lrc, align 4
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
  store i8 5, i8* %cl, align 1
  store i32 2, i32* %ir, align 4
  %tmp345 = load i32* %ir, align 4
  %tmp346 = load i8* %cl, align 1
  %conv347 = sext i8 %tmp346 to i32
  %shr348 = ashr i32 %conv347, %tmp345
  %conv349 = trunc i32 %shr348 to i8
  store i8 %conv349, i8* %cl, align 1
  %tmp350 = load i8* %cl, align 1
  %conv351 = sext i8 %tmp350 to i32
  %cmp352 = icmp ne i32 %conv351, 1
  br i1 %cmp352, label %if.then354, label %if.end361

if.then354:                                       ; preds = %if.end344
  store i32 273, i32* %lrc, align 4
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
  store i8 5, i8* %cl, align 1
  store i64 2, i64* %lr, align 8
  %tmp362 = load i64* %lr, align 8
  %tmp363 = load i8* %cl, align 1
  %conv364 = sext i8 %tmp363 to i32
  %sh_prom = trunc i64 %tmp362 to i32
  %shr365 = ashr i32 %conv364, %sh_prom
  %conv366 = trunc i32 %shr365 to i8
  store i8 %conv366, i8* %cl, align 1
  %tmp367 = load i8* %cl, align 1
  %conv368 = sext i8 %tmp367 to i32
  %cmp369 = icmp ne i32 %conv368, 1
  br i1 %cmp369, label %if.then371, label %if.end378

if.then371:                                       ; preds = %if.end361
  store i32 274, i32* %lrc, align 4
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
  store i8 5, i8* %cl, align 1
  store i32 2, i32* %ur, align 4
  %tmp379 = load i32* %ur, align 4
  %tmp380 = load i8* %cl, align 1
  %conv381 = sext i8 %tmp380 to i32
  %shr382 = ashr i32 %conv381, %tmp379
  %conv383 = trunc i32 %shr382 to i8
  store i8 %conv383, i8* %cl, align 1
  %tmp384 = load i8* %cl, align 1
  %conv385 = sext i8 %tmp384 to i32
  %cmp386 = icmp ne i32 %conv385, 1
  br i1 %cmp386, label %if.then388, label %if.end395

if.then388:                                       ; preds = %if.end378
  store i32 275, i32* %lrc, align 4
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
  store i16 5, i16* %sl, align 2
  store i8 2, i8* %cr, align 1
  %tmp396 = load i8* %cr, align 1
  %conv397 = sext i8 %tmp396 to i32
  %tmp398 = load i16* %sl, align 2
  %conv399 = sext i16 %tmp398 to i32
  %shr400 = ashr i32 %conv399, %conv397
  %conv401 = trunc i32 %shr400 to i16
  store i16 %conv401, i16* %sl, align 2
  %tmp402 = load i16* %sl, align 2
  %conv403 = sext i16 %tmp402 to i32
  %cmp404 = icmp ne i32 %conv403, 1
  br i1 %cmp404, label %if.then406, label %if.end413

if.then406:                                       ; preds = %if.end395
  store i32 276, i32* %lrc, align 4
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
  store i16 5, i16* %sl, align 2
  store i16 2, i16* %sr, align 2
  %tmp414 = load i16* %sr, align 2
  %conv415 = sext i16 %tmp414 to i32
  %tmp416 = load i16* %sl, align 2
  %conv417 = sext i16 %tmp416 to i32
  %shr418 = ashr i32 %conv417, %conv415
  %conv419 = trunc i32 %shr418 to i16
  store i16 %conv419, i16* %sl, align 2
  %tmp420 = load i16* %sl, align 2
  %conv421 = sext i16 %tmp420 to i32
  %cmp422 = icmp ne i32 %conv421, 1
  br i1 %cmp422, label %if.then424, label %if.end431

if.then424:                                       ; preds = %if.end413
  store i32 277, i32* %lrc, align 4
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
  store i16 5, i16* %sl, align 2
  store i32 2, i32* %ir, align 4
  %tmp432 = load i32* %ir, align 4
  %tmp433 = load i16* %sl, align 2
  %conv434 = sext i16 %tmp433 to i32
  %shr435 = ashr i32 %conv434, %tmp432
  %conv436 = trunc i32 %shr435 to i16
  store i16 %conv436, i16* %sl, align 2
  %tmp437 = load i16* %sl, align 2
  %conv438 = sext i16 %tmp437 to i32
  %cmp439 = icmp ne i32 %conv438, 1
  br i1 %cmp439, label %if.then441, label %if.end448

if.then441:                                       ; preds = %if.end431
  store i32 278, i32* %lrc, align 4
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
  store i16 5, i16* %sl, align 2
  store i64 2, i64* %lr, align 8
  %tmp449 = load i64* %lr, align 8
  %tmp450 = load i16* %sl, align 2
  %conv451 = sext i16 %tmp450 to i32
  %sh_prom452 = trunc i64 %tmp449 to i32
  %shr453 = ashr i32 %conv451, %sh_prom452
  %conv454 = trunc i32 %shr453 to i16
  store i16 %conv454, i16* %sl, align 2
  %tmp455 = load i16* %sl, align 2
  %conv456 = sext i16 %tmp455 to i32
  %cmp457 = icmp ne i32 %conv456, 1
  br i1 %cmp457, label %if.then459, label %if.end466

if.then459:                                       ; preds = %if.end448
  store i32 279, i32* %lrc, align 4
  %tmp460 = load i32* %prlc, align 4
  %tobool461 = icmp ne i32 %tmp460, 0
  br i1 %tobool461, label %if.then462, label %if.end465

if.then462:                                       ; preds = %if.then459
  %tmp463 = load i32* %lrc, align 4
  %call464 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp463)
  br label %if.end465

if.end465:                                        ; preds = %if.then462, %if.then459
  br label %if.end466

if.end466:                                        ; preds = %if.end465, %if.end448
  store i16 5, i16* %sl, align 2
  store i32 2, i32* %ur, align 4
  %tmp467 = load i32* %ur, align 4
  %tmp468 = load i16* %sl, align 2
  %conv469 = sext i16 %tmp468 to i32
  %shr470 = ashr i32 %conv469, %tmp467
  %conv471 = trunc i32 %shr470 to i16
  store i16 %conv471, i16* %sl, align 2
  %tmp472 = load i16* %sl, align 2
  %conv473 = sext i16 %tmp472 to i32
  %cmp474 = icmp ne i32 %conv473, 1
  br i1 %cmp474, label %if.then476, label %if.end483

if.then476:                                       ; preds = %if.end466
  store i32 280, i32* %lrc, align 4
  %tmp477 = load i32* %prlc, align 4
  %tobool478 = icmp ne i32 %tmp477, 0
  br i1 %tobool478, label %if.then479, label %if.end482

if.then479:                                       ; preds = %if.then476
  %tmp480 = load i32* %lrc, align 4
  %call481 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp480)
  br label %if.end482

if.end482:                                        ; preds = %if.then479, %if.then476
  br label %if.end483

if.end483:                                        ; preds = %if.end482, %if.end466
  store i32 5, i32* %il, align 4
  store i8 2, i8* %cr, align 1
  %tmp484 = load i8* %cr, align 1
  %conv485 = sext i8 %tmp484 to i32
  %tmp486 = load i32* %il, align 4
  %shr487 = ashr i32 %tmp486, %conv485
  store i32 %shr487, i32* %il, align 4
  %tmp488 = load i32* %il, align 4
  %cmp489 = icmp ne i32 %tmp488, 1
  br i1 %cmp489, label %if.then491, label %if.end498

if.then491:                                       ; preds = %if.end483
  store i32 281, i32* %lrc, align 4
  %tmp492 = load i32* %prlc, align 4
  %tobool493 = icmp ne i32 %tmp492, 0
  br i1 %tobool493, label %if.then494, label %if.end497

if.then494:                                       ; preds = %if.then491
  %tmp495 = load i32* %lrc, align 4
  %call496 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp495)
  br label %if.end497

if.end497:                                        ; preds = %if.then494, %if.then491
  br label %if.end498

if.end498:                                        ; preds = %if.end497, %if.end483
  store i32 5, i32* %il, align 4
  store i16 2, i16* %sr, align 2
  %tmp499 = load i16* %sr, align 2
  %conv500 = sext i16 %tmp499 to i32
  %tmp501 = load i32* %il, align 4
  %shr502 = ashr i32 %tmp501, %conv500
  store i32 %shr502, i32* %il, align 4
  %tmp503 = load i32* %il, align 4
  %cmp504 = icmp ne i32 %tmp503, 1
  br i1 %cmp504, label %if.then506, label %if.end513

if.then506:                                       ; preds = %if.end498
  store i32 282, i32* %lrc, align 4
  %tmp507 = load i32* %prlc, align 4
  %tobool508 = icmp ne i32 %tmp507, 0
  br i1 %tobool508, label %if.then509, label %if.end512

if.then509:                                       ; preds = %if.then506
  %tmp510 = load i32* %lrc, align 4
  %call511 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp510)
  br label %if.end512

if.end512:                                        ; preds = %if.then509, %if.then506
  br label %if.end513

if.end513:                                        ; preds = %if.end512, %if.end498
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ir, align 4
  %tmp514 = load i32* %ir, align 4
  %tmp515 = load i32* %il, align 4
  %shr516 = ashr i32 %tmp515, %tmp514
  store i32 %shr516, i32* %il, align 4
  %tmp517 = load i32* %il, align 4
  %cmp518 = icmp ne i32 %tmp517, 1
  br i1 %cmp518, label %if.then520, label %if.end527

if.then520:                                       ; preds = %if.end513
  store i32 283, i32* %lrc, align 4
  %tmp521 = load i32* %prlc, align 4
  %tobool522 = icmp ne i32 %tmp521, 0
  br i1 %tobool522, label %if.then523, label %if.end526

if.then523:                                       ; preds = %if.then520
  %tmp524 = load i32* %lrc, align 4
  %call525 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp524)
  br label %if.end526

if.end526:                                        ; preds = %if.then523, %if.then520
  br label %if.end527

if.end527:                                        ; preds = %if.end526, %if.end513
  store i32 5, i32* %il, align 4
  store i64 2, i64* %lr, align 8
  %tmp528 = load i64* %lr, align 8
  %tmp529 = load i32* %il, align 4
  %sh_prom530 = trunc i64 %tmp528 to i32
  %shr531 = ashr i32 %tmp529, %sh_prom530
  store i32 %shr531, i32* %il, align 4
  %tmp532 = load i32* %il, align 4
  %cmp533 = icmp ne i32 %tmp532, 1
  br i1 %cmp533, label %if.then535, label %if.end542

if.then535:                                       ; preds = %if.end527
  store i32 284, i32* %lrc, align 4
  %tmp536 = load i32* %prlc, align 4
  %tobool537 = icmp ne i32 %tmp536, 0
  br i1 %tobool537, label %if.then538, label %if.end541

if.then538:                                       ; preds = %if.then535
  %tmp539 = load i32* %lrc, align 4
  %call540 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp539)
  br label %if.end541

if.end541:                                        ; preds = %if.then538, %if.then535
  br label %if.end542

if.end542:                                        ; preds = %if.end541, %if.end527
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ur, align 4
  %tmp543 = load i32* %ur, align 4
  %tmp544 = load i32* %il, align 4
  %shr545 = ashr i32 %tmp544, %tmp543
  store i32 %shr545, i32* %il, align 4
  %tmp546 = load i32* %il, align 4
  %cmp547 = icmp ne i32 %tmp546, 1
  br i1 %cmp547, label %if.then549, label %if.end556

if.then549:                                       ; preds = %if.end542
  store i32 285, i32* %lrc, align 4
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
  store i64 5, i64* %ll, align 8
  store i8 2, i8* %cr, align 1
  %tmp557 = load i8* %cr, align 1
  %conv558 = sext i8 %tmp557 to i32
  %tmp559 = load i64* %ll, align 8
  %sh_prom560 = zext i32 %conv558 to i64
  %shr561 = ashr i64 %tmp559, %sh_prom560
  store i64 %shr561, i64* %ll, align 8
  %tmp562 = load i64* %ll, align 8
  %cmp563 = icmp ne i64 %tmp562, 1
  br i1 %cmp563, label %if.then565, label %if.end572

if.then565:                                       ; preds = %if.end556
  store i32 286, i32* %lrc, align 4
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
  store i64 5, i64* %ll, align 8
  store i16 2, i16* %sr, align 2
  %tmp573 = load i16* %sr, align 2
  %conv574 = sext i16 %tmp573 to i32
  %tmp575 = load i64* %ll, align 8
  %sh_prom576 = zext i32 %conv574 to i64
  %shr577 = ashr i64 %tmp575, %sh_prom576
  store i64 %shr577, i64* %ll, align 8
  %tmp578 = load i64* %ll, align 8
  %cmp579 = icmp ne i64 %tmp578, 1
  br i1 %cmp579, label %if.then581, label %if.end588

if.then581:                                       ; preds = %if.end572
  store i32 287, i32* %lrc, align 4
  %tmp582 = load i32* %prlc, align 4
  %tobool583 = icmp ne i32 %tmp582, 0
  br i1 %tobool583, label %if.then584, label %if.end587

if.then584:                                       ; preds = %if.then581
  %tmp585 = load i32* %lrc, align 4
  %call586 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp585)
  br label %if.end587

if.end587:                                        ; preds = %if.then584, %if.then581
  br label %if.end588

if.end588:                                        ; preds = %if.end587, %if.end572
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ir, align 4
  %tmp589 = load i32* %ir, align 4
  %tmp590 = load i64* %ll, align 8
  %sh_prom591 = zext i32 %tmp589 to i64
  %shr592 = ashr i64 %tmp590, %sh_prom591
  store i64 %shr592, i64* %ll, align 8
  %tmp593 = load i64* %ll, align 8
  %cmp594 = icmp ne i64 %tmp593, 1
  br i1 %cmp594, label %if.then596, label %if.end603

if.then596:                                       ; preds = %if.end588
  store i32 288, i32* %lrc, align 4
  %tmp597 = load i32* %prlc, align 4
  %tobool598 = icmp ne i32 %tmp597, 0
  br i1 %tobool598, label %if.then599, label %if.end602

if.then599:                                       ; preds = %if.then596
  %tmp600 = load i32* %lrc, align 4
  %call601 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp600)
  br label %if.end602

if.end602:                                        ; preds = %if.then599, %if.then596
  br label %if.end603

if.end603:                                        ; preds = %if.end602, %if.end588
  store i64 5, i64* %ll, align 8
  store i64 2, i64* %lr, align 8
  %tmp604 = load i64* %lr, align 8
  %tmp605 = load i64* %ll, align 8
  %shr606 = ashr i64 %tmp605, %tmp604
  store i64 %shr606, i64* %ll, align 8
  %tmp607 = load i64* %ll, align 8
  %cmp608 = icmp ne i64 %tmp607, 1
  br i1 %cmp608, label %if.then610, label %if.end617

if.then610:                                       ; preds = %if.end603
  store i32 289, i32* %lrc, align 4
  %tmp611 = load i32* %prlc, align 4
  %tobool612 = icmp ne i32 %tmp611, 0
  br i1 %tobool612, label %if.then613, label %if.end616

if.then613:                                       ; preds = %if.then610
  %tmp614 = load i32* %lrc, align 4
  %call615 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp614)
  br label %if.end616

if.end616:                                        ; preds = %if.then613, %if.then610
  br label %if.end617

if.end617:                                        ; preds = %if.end616, %if.end603
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ur, align 4
  %tmp618 = load i32* %ur, align 4
  %tmp619 = load i64* %ll, align 8
  %sh_prom620 = zext i32 %tmp618 to i64
  %shr621 = ashr i64 %tmp619, %sh_prom620
  store i64 %shr621, i64* %ll, align 8
  %tmp622 = load i64* %ll, align 8
  %cmp623 = icmp ne i64 %tmp622, 1
  br i1 %cmp623, label %if.then625, label %if.end632

if.then625:                                       ; preds = %if.end617
  store i32 290, i32* %lrc, align 4
  %tmp626 = load i32* %prlc, align 4
  %tobool627 = icmp ne i32 %tmp626, 0
  br i1 %tobool627, label %if.then628, label %if.end631

if.then628:                                       ; preds = %if.then625
  %tmp629 = load i32* %lrc, align 4
  %call630 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp629)
  br label %if.end631

if.end631:                                        ; preds = %if.then628, %if.then625
  br label %if.end632

if.end632:                                        ; preds = %if.end631, %if.end617
  store i32 5, i32* %ul, align 4
  store i8 2, i8* %cr, align 1
  %tmp633 = load i8* %cr, align 1
  %conv634 = sext i8 %tmp633 to i32
  %tmp635 = load i32* %ul, align 4
  %shr636 = lshr i32 %tmp635, %conv634
  store i32 %shr636, i32* %ul, align 4
  %tmp637 = load i32* %ul, align 4
  %cmp638 = icmp ne i32 %tmp637, 1
  br i1 %cmp638, label %if.then640, label %if.end647

if.then640:                                       ; preds = %if.end632
  store i32 291, i32* %lrc, align 4
  %tmp641 = load i32* %prlc, align 4
  %tobool642 = icmp ne i32 %tmp641, 0
  br i1 %tobool642, label %if.then643, label %if.end646

if.then643:                                       ; preds = %if.then640
  %tmp644 = load i32* %lrc, align 4
  %call645 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp644)
  br label %if.end646

if.end646:                                        ; preds = %if.then643, %if.then640
  br label %if.end647

if.end647:                                        ; preds = %if.end646, %if.end632
  store i32 5, i32* %ul, align 4
  store i16 2, i16* %sr, align 2
  %tmp648 = load i16* %sr, align 2
  %conv649 = sext i16 %tmp648 to i32
  %tmp650 = load i32* %ul, align 4
  %shr651 = lshr i32 %tmp650, %conv649
  store i32 %shr651, i32* %ul, align 4
  %tmp652 = load i32* %ul, align 4
  %cmp653 = icmp ne i32 %tmp652, 1
  br i1 %cmp653, label %if.then655, label %if.end662

if.then655:                                       ; preds = %if.end647
  store i32 292, i32* %lrc, align 4
  %tmp656 = load i32* %prlc, align 4
  %tobool657 = icmp ne i32 %tmp656, 0
  br i1 %tobool657, label %if.then658, label %if.end661

if.then658:                                       ; preds = %if.then655
  %tmp659 = load i32* %lrc, align 4
  %call660 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp659)
  br label %if.end661

if.end661:                                        ; preds = %if.then658, %if.then655
  br label %if.end662

if.end662:                                        ; preds = %if.end661, %if.end647
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ir, align 4
  %tmp663 = load i32* %ir, align 4
  %tmp664 = load i32* %ul, align 4
  %shr665 = lshr i32 %tmp664, %tmp663
  store i32 %shr665, i32* %ul, align 4
  %tmp666 = load i32* %ul, align 4
  %cmp667 = icmp ne i32 %tmp666, 1
  br i1 %cmp667, label %if.then669, label %if.end676

if.then669:                                       ; preds = %if.end662
  store i32 293, i32* %lrc, align 4
  %tmp670 = load i32* %prlc, align 4
  %tobool671 = icmp ne i32 %tmp670, 0
  br i1 %tobool671, label %if.then672, label %if.end675

if.then672:                                       ; preds = %if.then669
  %tmp673 = load i32* %lrc, align 4
  %call674 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp673)
  br label %if.end675

if.end675:                                        ; preds = %if.then672, %if.then669
  br label %if.end676

if.end676:                                        ; preds = %if.end675, %if.end662
  store i32 5, i32* %ul, align 4
  store i64 2, i64* %lr, align 8
  %tmp677 = load i64* %lr, align 8
  %tmp678 = load i32* %ul, align 4
  %sh_prom679 = trunc i64 %tmp677 to i32
  %shr680 = lshr i32 %tmp678, %sh_prom679
  store i32 %shr680, i32* %ul, align 4
  %tmp681 = load i32* %ul, align 4
  %cmp682 = icmp ne i32 %tmp681, 1
  br i1 %cmp682, label %if.then684, label %if.end691

if.then684:                                       ; preds = %if.end676
  store i32 294, i32* %lrc, align 4
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
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ur, align 4
  %tmp692 = load i32* %ur, align 4
  %tmp693 = load i32* %ul, align 4
  %shr694 = lshr i32 %tmp693, %tmp692
  store i32 %shr694, i32* %ul, align 4
  %tmp695 = load i32* %ul, align 4
  %cmp696 = icmp ne i32 %tmp695, 1
  br i1 %cmp696, label %if.then698, label %if.end705

if.then698:                                       ; preds = %if.end691
  store i32 295, i32* %lrc, align 4
  %tmp699 = load i32* %prlc, align 4
  %tobool700 = icmp ne i32 %tmp699, 0
  br i1 %tobool700, label %if.then701, label %if.end704

if.then701:                                       ; preds = %if.then698
  %tmp702 = load i32* %lrc, align 4
  %call703 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp702)
  br label %if.end704

if.end704:                                        ; preds = %if.then701, %if.then698
  br label %if.end705

if.end705:                                        ; preds = %if.end704, %if.end691
  store i8 5, i8* %cl, align 1
  store i8 2, i8* %cr, align 1
  %tmp706 = load i8* %cr, align 1
  %conv707 = sext i8 %tmp706 to i32
  %tmp708 = load i8* %cl, align 1
  %conv709 = sext i8 %tmp708 to i32
  %shl = shl i32 %conv709, %conv707
  %conv710 = trunc i32 %shl to i8
  store i8 %conv710, i8* %cl, align 1
  %tmp711 = load i8* %cl, align 1
  %conv712 = sext i8 %tmp711 to i32
  %cmp713 = icmp ne i32 %conv712, 20
  br i1 %cmp713, label %if.then715, label %if.end722

if.then715:                                       ; preds = %if.end705
  store i32 296, i32* %lrc, align 4
  %tmp716 = load i32* %prlc, align 4
  %tobool717 = icmp ne i32 %tmp716, 0
  br i1 %tobool717, label %if.then718, label %if.end721

if.then718:                                       ; preds = %if.then715
  %tmp719 = load i32* %lrc, align 4
  %call720 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp719)
  br label %if.end721

if.end721:                                        ; preds = %if.then718, %if.then715
  br label %if.end722

if.end722:                                        ; preds = %if.end721, %if.end705
  store i8 5, i8* %cl, align 1
  store i16 2, i16* %sr, align 2
  %tmp723 = load i16* %sr, align 2
  %conv724 = sext i16 %tmp723 to i32
  %tmp725 = load i8* %cl, align 1
  %conv726 = sext i8 %tmp725 to i32
  %shl727 = shl i32 %conv726, %conv724
  %conv728 = trunc i32 %shl727 to i8
  store i8 %conv728, i8* %cl, align 1
  %tmp729 = load i8* %cl, align 1
  %conv730 = sext i8 %tmp729 to i32
  %cmp731 = icmp ne i32 %conv730, 20
  br i1 %cmp731, label %if.then733, label %if.end740

if.then733:                                       ; preds = %if.end722
  store i32 297, i32* %lrc, align 4
  %tmp734 = load i32* %prlc, align 4
  %tobool735 = icmp ne i32 %tmp734, 0
  br i1 %tobool735, label %if.then736, label %if.end739

if.then736:                                       ; preds = %if.then733
  %tmp737 = load i32* %lrc, align 4
  %call738 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp737)
  br label %if.end739

if.end739:                                        ; preds = %if.then736, %if.then733
  br label %if.end740

if.end740:                                        ; preds = %if.end739, %if.end722
  store i8 5, i8* %cl, align 1
  store i32 2, i32* %ir, align 4
  %tmp741 = load i32* %ir, align 4
  %tmp742 = load i8* %cl, align 1
  %conv743 = sext i8 %tmp742 to i32
  %shl744 = shl i32 %conv743, %tmp741
  %conv745 = trunc i32 %shl744 to i8
  store i8 %conv745, i8* %cl, align 1
  %tmp746 = load i8* %cl, align 1
  %conv747 = sext i8 %tmp746 to i32
  %cmp748 = icmp ne i32 %conv747, 20
  br i1 %cmp748, label %if.then750, label %if.end757

if.then750:                                       ; preds = %if.end740
  store i32 298, i32* %lrc, align 4
  %tmp751 = load i32* %prlc, align 4
  %tobool752 = icmp ne i32 %tmp751, 0
  br i1 %tobool752, label %if.then753, label %if.end756

if.then753:                                       ; preds = %if.then750
  %tmp754 = load i32* %lrc, align 4
  %call755 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp754)
  br label %if.end756

if.end756:                                        ; preds = %if.then753, %if.then750
  br label %if.end757

if.end757:                                        ; preds = %if.end756, %if.end740
  store i8 5, i8* %cl, align 1
  store i64 2, i64* %lr, align 8
  %tmp758 = load i64* %lr, align 8
  %tmp759 = load i8* %cl, align 1
  %conv760 = sext i8 %tmp759 to i32
  %sh_prom761 = trunc i64 %tmp758 to i32
  %shl762 = shl i32 %conv760, %sh_prom761
  %conv763 = trunc i32 %shl762 to i8
  store i8 %conv763, i8* %cl, align 1
  %tmp764 = load i8* %cl, align 1
  %conv765 = sext i8 %tmp764 to i32
  %cmp766 = icmp ne i32 %conv765, 20
  br i1 %cmp766, label %if.then768, label %if.end775

if.then768:                                       ; preds = %if.end757
  store i32 299, i32* %lrc, align 4
  %tmp769 = load i32* %prlc, align 4
  %tobool770 = icmp ne i32 %tmp769, 0
  br i1 %tobool770, label %if.then771, label %if.end774

if.then771:                                       ; preds = %if.then768
  %tmp772 = load i32* %lrc, align 4
  %call773 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp772)
  br label %if.end774

if.end774:                                        ; preds = %if.then771, %if.then768
  br label %if.end775

if.end775:                                        ; preds = %if.end774, %if.end757
  store i8 5, i8* %cl, align 1
  store i32 2, i32* %ur, align 4
  %tmp776 = load i32* %ur, align 4
  %tmp777 = load i8* %cl, align 1
  %conv778 = sext i8 %tmp777 to i32
  %shl779 = shl i32 %conv778, %tmp776
  %conv780 = trunc i32 %shl779 to i8
  store i8 %conv780, i8* %cl, align 1
  %tmp781 = load i8* %cl, align 1
  %conv782 = sext i8 %tmp781 to i32
  %cmp783 = icmp ne i32 %conv782, 20
  br i1 %cmp783, label %if.then785, label %if.end792

if.then785:                                       ; preds = %if.end775
  store i32 300, i32* %lrc, align 4
  %tmp786 = load i32* %prlc, align 4
  %tobool787 = icmp ne i32 %tmp786, 0
  br i1 %tobool787, label %if.then788, label %if.end791

if.then788:                                       ; preds = %if.then785
  %tmp789 = load i32* %lrc, align 4
  %call790 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp789)
  br label %if.end791

if.end791:                                        ; preds = %if.then788, %if.then785
  br label %if.end792

if.end792:                                        ; preds = %if.end791, %if.end775
  %tmp793 = load i32* %lrc, align 4
  %cmp794 = icmp ne i32 %tmp793, 0
  br i1 %cmp794, label %if.then796, label %if.end804

if.then796:                                       ; preds = %if.end792
  store i32 1, i32* %rc, align 4
  %tmp797 = load %struct.defs** %pd0.addr, align 8
  %flgd = getelementptr inbounds %struct.defs* %tmp797, i32 0, i32 11
  %tmp798 = load i32* %flgd, align 4
  %cmp799 = icmp ne i32 %tmp798, 0
  br i1 %cmp799, label %if.then801, label %if.end803

if.then801:                                       ; preds = %if.then796
  %call802 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @sec.s714er, i32 0, i32 0), i32 1)
  br label %if.end803

if.end803:                                        ; preds = %if.then801, %if.then796
  br label %if.end804

if.end804:                                        ; preds = %if.end803, %if.end792
  %tmp805 = load i32* %rc, align 4
  ret i32 %tmp805
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
