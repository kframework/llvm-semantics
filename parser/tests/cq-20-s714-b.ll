; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/cq-20-s714-b.c'
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
  store i16 2, i16* %sr, align 2
  %tmp7 = load i16* %sr, align 2
  %conv = sext i16 %tmp7 to i32
  %tmp8 = load i8* %cl, align 1
  %conv9 = sext i8 %tmp8 to i32
  %add = add nsw i32 %conv9, %conv
  %conv10 = trunc i32 %add to i8
  store i8 %conv10, i8* %cl, align 1
  %tmp11 = load i8* %cl, align 1
  %conv12 = sext i8 %tmp11 to i32
  %cmp = icmp ne i32 %conv12, 7
  br i1 %cmp, label %if.then, label %if.end18

if.then:                                          ; preds = %while.end
  store i32 51, i32* %lrc, align 4
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
  store i8 5, i8* %cl, align 1
  store i32 2, i32* %ir, align 4
  %tmp19 = load i32* %ir, align 4
  %tmp20 = load i8* %cl, align 1
  %conv21 = sext i8 %tmp20 to i32
  %add22 = add nsw i32 %conv21, %tmp19
  %conv23 = trunc i32 %add22 to i8
  store i8 %conv23, i8* %cl, align 1
  %tmp24 = load i8* %cl, align 1
  %conv25 = sext i8 %tmp24 to i32
  %cmp26 = icmp ne i32 %conv25, 7
  br i1 %cmp26, label %if.then28, label %if.end35

if.then28:                                        ; preds = %if.end18
  store i32 52, i32* %lrc, align 4
  %tmp29 = load i32* %prlc, align 4
  %tobool30 = icmp ne i32 %tmp29, 0
  br i1 %tobool30, label %if.then31, label %if.end34

if.then31:                                        ; preds = %if.then28
  %tmp32 = load i32* %lrc, align 4
  %call33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp32)
  br label %if.end34

if.end34:                                         ; preds = %if.then31, %if.then28
  br label %if.end35

if.end35:                                         ; preds = %if.end34, %if.end18
  store i8 5, i8* %cl, align 1
  store i64 2, i64* %lr, align 8
  %tmp36 = load i64* %lr, align 8
  %tmp37 = load i8* %cl, align 1
  %conv38 = sext i8 %tmp37 to i64
  %add39 = add nsw i64 %conv38, %tmp36
  %conv40 = trunc i64 %add39 to i8
  store i8 %conv40, i8* %cl, align 1
  %tmp41 = load i8* %cl, align 1
  %conv42 = sext i8 %tmp41 to i32
  %cmp43 = icmp ne i32 %conv42, 7
  br i1 %cmp43, label %if.then45, label %if.end52

if.then45:                                        ; preds = %if.end35
  store i32 53, i32* %lrc, align 4
  %tmp46 = load i32* %prlc, align 4
  %tobool47 = icmp ne i32 %tmp46, 0
  br i1 %tobool47, label %if.then48, label %if.end51

if.then48:                                        ; preds = %if.then45
  %tmp49 = load i32* %lrc, align 4
  %call50 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp49)
  br label %if.end51

if.end51:                                         ; preds = %if.then48, %if.then45
  br label %if.end52

if.end52:                                         ; preds = %if.end51, %if.end35
  store i8 5, i8* %cl, align 1
  store i32 2, i32* %ur, align 4
  %tmp53 = load i32* %ur, align 4
  %tmp54 = load i8* %cl, align 1
  %conv55 = sext i8 %tmp54 to i32
  %add56 = add i32 %conv55, %tmp53
  %conv57 = trunc i32 %add56 to i8
  store i8 %conv57, i8* %cl, align 1
  %tmp58 = load i8* %cl, align 1
  %conv59 = sext i8 %tmp58 to i32
  %cmp60 = icmp ne i32 %conv59, 7
  br i1 %cmp60, label %if.then62, label %if.end69

if.then62:                                        ; preds = %if.end52
  store i32 54, i32* %lrc, align 4
  %tmp63 = load i32* %prlc, align 4
  %tobool64 = icmp ne i32 %tmp63, 0
  br i1 %tobool64, label %if.then65, label %if.end68

if.then65:                                        ; preds = %if.then62
  %tmp66 = load i32* %lrc, align 4
  %call67 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp66)
  br label %if.end68

if.end68:                                         ; preds = %if.then65, %if.then62
  br label %if.end69

if.end69:                                         ; preds = %if.end68, %if.end52
  store i8 5, i8* %cl, align 1
  store float 2.000000e+00, float* %fr, align 4
  %tmp70 = load float* %fr, align 4
  %tmp71 = load i8* %cl, align 1
  %conv72 = sitofp i8 %tmp71 to float
  %add73 = fadd float %conv72, %tmp70
  %conv74 = fptosi float %add73 to i8
  store i8 %conv74, i8* %cl, align 1
  %tmp75 = load i8* %cl, align 1
  %conv76 = sext i8 %tmp75 to i32
  %cmp77 = icmp ne i32 %conv76, 7
  br i1 %cmp77, label %if.then79, label %if.end86

if.then79:                                        ; preds = %if.end69
  store i32 55, i32* %lrc, align 4
  %tmp80 = load i32* %prlc, align 4
  %tobool81 = icmp ne i32 %tmp80, 0
  br i1 %tobool81, label %if.then82, label %if.end85

if.then82:                                        ; preds = %if.then79
  %tmp83 = load i32* %lrc, align 4
  %call84 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp83)
  br label %if.end85

if.end85:                                         ; preds = %if.then82, %if.then79
  br label %if.end86

if.end86:                                         ; preds = %if.end85, %if.end69
  store i8 5, i8* %cl, align 1
  store double 2.000000e+00, double* %dr, align 8
  %tmp87 = load double* %dr, align 8
  %tmp88 = load i8* %cl, align 1
  %conv89 = sitofp i8 %tmp88 to double
  %add90 = fadd double %conv89, %tmp87
  %conv91 = fptosi double %add90 to i8
  store i8 %conv91, i8* %cl, align 1
  %tmp92 = load i8* %cl, align 1
  %conv93 = sext i8 %tmp92 to i32
  %cmp94 = icmp ne i32 %conv93, 7
  br i1 %cmp94, label %if.then96, label %if.end103

if.then96:                                        ; preds = %if.end86
  store i32 56, i32* %lrc, align 4
  %tmp97 = load i32* %prlc, align 4
  %tobool98 = icmp ne i32 %tmp97, 0
  br i1 %tobool98, label %if.then99, label %if.end102

if.then99:                                        ; preds = %if.then96
  %tmp100 = load i32* %lrc, align 4
  %call101 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp100)
  br label %if.end102

if.end102:                                        ; preds = %if.then99, %if.then96
  br label %if.end103

if.end103:                                        ; preds = %if.end102, %if.end86
  store i16 5, i16* %sl, align 2
  store i8 2, i8* %cr, align 1
  %tmp104 = load i8* %cr, align 1
  %conv105 = sext i8 %tmp104 to i32
  %tmp106 = load i16* %sl, align 2
  %conv107 = sext i16 %tmp106 to i32
  %add108 = add nsw i32 %conv107, %conv105
  %conv109 = trunc i32 %add108 to i16
  store i16 %conv109, i16* %sl, align 2
  %tmp110 = load i16* %sl, align 2
  %conv111 = sext i16 %tmp110 to i32
  %cmp112 = icmp ne i32 %conv111, 7
  br i1 %cmp112, label %if.then114, label %if.end121

if.then114:                                       ; preds = %if.end103
  store i32 57, i32* %lrc, align 4
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
  store i16 2, i16* %sr, align 2
  %tmp122 = load i16* %sr, align 2
  %conv123 = sext i16 %tmp122 to i32
  %tmp124 = load i16* %sl, align 2
  %conv125 = sext i16 %tmp124 to i32
  %add126 = add nsw i32 %conv125, %conv123
  %conv127 = trunc i32 %add126 to i16
  store i16 %conv127, i16* %sl, align 2
  %tmp128 = load i16* %sl, align 2
  %conv129 = sext i16 %tmp128 to i32
  %cmp130 = icmp ne i32 %conv129, 7
  br i1 %cmp130, label %if.then132, label %if.end139

if.then132:                                       ; preds = %if.end121
  store i32 58, i32* %lrc, align 4
  %tmp133 = load i32* %prlc, align 4
  %tobool134 = icmp ne i32 %tmp133, 0
  br i1 %tobool134, label %if.then135, label %if.end138

if.then135:                                       ; preds = %if.then132
  %tmp136 = load i32* %lrc, align 4
  %call137 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp136)
  br label %if.end138

if.end138:                                        ; preds = %if.then135, %if.then132
  br label %if.end139

if.end139:                                        ; preds = %if.end138, %if.end121
  store i16 5, i16* %sl, align 2
  store i32 2, i32* %ir, align 4
  %tmp140 = load i32* %ir, align 4
  %tmp141 = load i16* %sl, align 2
  %conv142 = sext i16 %tmp141 to i32
  %add143 = add nsw i32 %conv142, %tmp140
  %conv144 = trunc i32 %add143 to i16
  store i16 %conv144, i16* %sl, align 2
  %tmp145 = load i16* %sl, align 2
  %conv146 = sext i16 %tmp145 to i32
  %cmp147 = icmp ne i32 %conv146, 7
  br i1 %cmp147, label %if.then149, label %if.end156

if.then149:                                       ; preds = %if.end139
  store i32 59, i32* %lrc, align 4
  %tmp150 = load i32* %prlc, align 4
  %tobool151 = icmp ne i32 %tmp150, 0
  br i1 %tobool151, label %if.then152, label %if.end155

if.then152:                                       ; preds = %if.then149
  %tmp153 = load i32* %lrc, align 4
  %call154 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp153)
  br label %if.end155

if.end155:                                        ; preds = %if.then152, %if.then149
  br label %if.end156

if.end156:                                        ; preds = %if.end155, %if.end139
  store i16 5, i16* %sl, align 2
  store i64 2, i64* %lr, align 8
  %tmp157 = load i64* %lr, align 8
  %tmp158 = load i16* %sl, align 2
  %conv159 = sext i16 %tmp158 to i64
  %add160 = add nsw i64 %conv159, %tmp157
  %conv161 = trunc i64 %add160 to i16
  store i16 %conv161, i16* %sl, align 2
  %tmp162 = load i16* %sl, align 2
  %conv163 = sext i16 %tmp162 to i32
  %cmp164 = icmp ne i32 %conv163, 7
  br i1 %cmp164, label %if.then166, label %if.end173

if.then166:                                       ; preds = %if.end156
  store i32 60, i32* %lrc, align 4
  %tmp167 = load i32* %prlc, align 4
  %tobool168 = icmp ne i32 %tmp167, 0
  br i1 %tobool168, label %if.then169, label %if.end172

if.then169:                                       ; preds = %if.then166
  %tmp170 = load i32* %lrc, align 4
  %call171 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp170)
  br label %if.end172

if.end172:                                        ; preds = %if.then169, %if.then166
  br label %if.end173

if.end173:                                        ; preds = %if.end172, %if.end156
  store i16 5, i16* %sl, align 2
  store i32 2, i32* %ur, align 4
  %tmp174 = load i32* %ur, align 4
  %tmp175 = load i16* %sl, align 2
  %conv176 = sext i16 %tmp175 to i32
  %add177 = add i32 %conv176, %tmp174
  %conv178 = trunc i32 %add177 to i16
  store i16 %conv178, i16* %sl, align 2
  %tmp179 = load i16* %sl, align 2
  %conv180 = sext i16 %tmp179 to i32
  %cmp181 = icmp ne i32 %conv180, 7
  br i1 %cmp181, label %if.then183, label %if.end190

if.then183:                                       ; preds = %if.end173
  store i32 61, i32* %lrc, align 4
  %tmp184 = load i32* %prlc, align 4
  %tobool185 = icmp ne i32 %tmp184, 0
  br i1 %tobool185, label %if.then186, label %if.end189

if.then186:                                       ; preds = %if.then183
  %tmp187 = load i32* %lrc, align 4
  %call188 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp187)
  br label %if.end189

if.end189:                                        ; preds = %if.then186, %if.then183
  br label %if.end190

if.end190:                                        ; preds = %if.end189, %if.end173
  store i16 5, i16* %sl, align 2
  store float 2.000000e+00, float* %fr, align 4
  %tmp191 = load float* %fr, align 4
  %tmp192 = load i16* %sl, align 2
  %conv193 = sitofp i16 %tmp192 to float
  %add194 = fadd float %conv193, %tmp191
  %conv195 = fptosi float %add194 to i16
  store i16 %conv195, i16* %sl, align 2
  %tmp196 = load i16* %sl, align 2
  %conv197 = sext i16 %tmp196 to i32
  %cmp198 = icmp ne i32 %conv197, 7
  br i1 %cmp198, label %if.then200, label %if.end207

if.then200:                                       ; preds = %if.end190
  store i32 62, i32* %lrc, align 4
  %tmp201 = load i32* %prlc, align 4
  %tobool202 = icmp ne i32 %tmp201, 0
  br i1 %tobool202, label %if.then203, label %if.end206

if.then203:                                       ; preds = %if.then200
  %tmp204 = load i32* %lrc, align 4
  %call205 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp204)
  br label %if.end206

if.end206:                                        ; preds = %if.then203, %if.then200
  br label %if.end207

if.end207:                                        ; preds = %if.end206, %if.end190
  store i16 5, i16* %sl, align 2
  store double 2.000000e+00, double* %dr, align 8
  %tmp208 = load double* %dr, align 8
  %tmp209 = load i16* %sl, align 2
  %conv210 = sitofp i16 %tmp209 to double
  %add211 = fadd double %conv210, %tmp208
  %conv212 = fptosi double %add211 to i16
  store i16 %conv212, i16* %sl, align 2
  %tmp213 = load i16* %sl, align 2
  %conv214 = sext i16 %tmp213 to i32
  %cmp215 = icmp ne i32 %conv214, 7
  br i1 %cmp215, label %if.then217, label %if.end224

if.then217:                                       ; preds = %if.end207
  store i32 63, i32* %lrc, align 4
  %tmp218 = load i32* %prlc, align 4
  %tobool219 = icmp ne i32 %tmp218, 0
  br i1 %tobool219, label %if.then220, label %if.end223

if.then220:                                       ; preds = %if.then217
  %tmp221 = load i32* %lrc, align 4
  %call222 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp221)
  br label %if.end223

if.end223:                                        ; preds = %if.then220, %if.then217
  br label %if.end224

if.end224:                                        ; preds = %if.end223, %if.end207
  store i32 5, i32* %il, align 4
  store i8 2, i8* %cr, align 1
  %tmp225 = load i8* %cr, align 1
  %conv226 = sext i8 %tmp225 to i32
  %tmp227 = load i32* %il, align 4
  %add228 = add nsw i32 %tmp227, %conv226
  store i32 %add228, i32* %il, align 4
  %tmp229 = load i32* %il, align 4
  %cmp230 = icmp ne i32 %tmp229, 7
  br i1 %cmp230, label %if.then232, label %if.end239

if.then232:                                       ; preds = %if.end224
  store i32 64, i32* %lrc, align 4
  %tmp233 = load i32* %prlc, align 4
  %tobool234 = icmp ne i32 %tmp233, 0
  br i1 %tobool234, label %if.then235, label %if.end238

if.then235:                                       ; preds = %if.then232
  %tmp236 = load i32* %lrc, align 4
  %call237 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp236)
  br label %if.end238

if.end238:                                        ; preds = %if.then235, %if.then232
  br label %if.end239

if.end239:                                        ; preds = %if.end238, %if.end224
  store i32 5, i32* %il, align 4
  store i16 2, i16* %sr, align 2
  %tmp240 = load i16* %sr, align 2
  %conv241 = sext i16 %tmp240 to i32
  %tmp242 = load i32* %il, align 4
  %add243 = add nsw i32 %tmp242, %conv241
  store i32 %add243, i32* %il, align 4
  %tmp244 = load i32* %il, align 4
  %cmp245 = icmp ne i32 %tmp244, 7
  br i1 %cmp245, label %if.then247, label %if.end254

if.then247:                                       ; preds = %if.end239
  store i32 65, i32* %lrc, align 4
  %tmp248 = load i32* %prlc, align 4
  %tobool249 = icmp ne i32 %tmp248, 0
  br i1 %tobool249, label %if.then250, label %if.end253

if.then250:                                       ; preds = %if.then247
  %tmp251 = load i32* %lrc, align 4
  %call252 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp251)
  br label %if.end253

if.end253:                                        ; preds = %if.then250, %if.then247
  br label %if.end254

if.end254:                                        ; preds = %if.end253, %if.end239
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ir, align 4
  %tmp255 = load i32* %ir, align 4
  %tmp256 = load i32* %il, align 4
  %add257 = add nsw i32 %tmp256, %tmp255
  store i32 %add257, i32* %il, align 4
  %tmp258 = load i32* %il, align 4
  %cmp259 = icmp ne i32 %tmp258, 7
  br i1 %cmp259, label %if.then261, label %if.end268

if.then261:                                       ; preds = %if.end254
  store i32 66, i32* %lrc, align 4
  %tmp262 = load i32* %prlc, align 4
  %tobool263 = icmp ne i32 %tmp262, 0
  br i1 %tobool263, label %if.then264, label %if.end267

if.then264:                                       ; preds = %if.then261
  %tmp265 = load i32* %lrc, align 4
  %call266 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp265)
  br label %if.end267

if.end267:                                        ; preds = %if.then264, %if.then261
  br label %if.end268

if.end268:                                        ; preds = %if.end267, %if.end254
  store i32 5, i32* %il, align 4
  store i64 2, i64* %lr, align 8
  %tmp269 = load i64* %lr, align 8
  %tmp270 = load i32* %il, align 4
  %conv271 = sext i32 %tmp270 to i64
  %add272 = add nsw i64 %conv271, %tmp269
  %conv273 = trunc i64 %add272 to i32
  store i32 %conv273, i32* %il, align 4
  %tmp274 = load i32* %il, align 4
  %cmp275 = icmp ne i32 %tmp274, 7
  br i1 %cmp275, label %if.then277, label %if.end284

if.then277:                                       ; preds = %if.end268
  store i32 67, i32* %lrc, align 4
  %tmp278 = load i32* %prlc, align 4
  %tobool279 = icmp ne i32 %tmp278, 0
  br i1 %tobool279, label %if.then280, label %if.end283

if.then280:                                       ; preds = %if.then277
  %tmp281 = load i32* %lrc, align 4
  %call282 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp281)
  br label %if.end283

if.end283:                                        ; preds = %if.then280, %if.then277
  br label %if.end284

if.end284:                                        ; preds = %if.end283, %if.end268
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ur, align 4
  %tmp285 = load i32* %ur, align 4
  %tmp286 = load i32* %il, align 4
  %add287 = add i32 %tmp286, %tmp285
  store i32 %add287, i32* %il, align 4
  %tmp288 = load i32* %il, align 4
  %cmp289 = icmp ne i32 %tmp288, 7
  br i1 %cmp289, label %if.then291, label %if.end298

if.then291:                                       ; preds = %if.end284
  store i32 68, i32* %lrc, align 4
  %tmp292 = load i32* %prlc, align 4
  %tobool293 = icmp ne i32 %tmp292, 0
  br i1 %tobool293, label %if.then294, label %if.end297

if.then294:                                       ; preds = %if.then291
  %tmp295 = load i32* %lrc, align 4
  %call296 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp295)
  br label %if.end297

if.end297:                                        ; preds = %if.then294, %if.then291
  br label %if.end298

if.end298:                                        ; preds = %if.end297, %if.end284
  store i32 5, i32* %il, align 4
  store float 2.000000e+00, float* %fr, align 4
  %tmp299 = load float* %fr, align 4
  %tmp300 = load i32* %il, align 4
  %conv301 = sitofp i32 %tmp300 to float
  %add302 = fadd float %conv301, %tmp299
  %conv303 = fptosi float %add302 to i32
  store i32 %conv303, i32* %il, align 4
  %tmp304 = load i32* %il, align 4
  %cmp305 = icmp ne i32 %tmp304, 7
  br i1 %cmp305, label %if.then307, label %if.end314

if.then307:                                       ; preds = %if.end298
  store i32 69, i32* %lrc, align 4
  %tmp308 = load i32* %prlc, align 4
  %tobool309 = icmp ne i32 %tmp308, 0
  br i1 %tobool309, label %if.then310, label %if.end313

if.then310:                                       ; preds = %if.then307
  %tmp311 = load i32* %lrc, align 4
  %call312 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp311)
  br label %if.end313

if.end313:                                        ; preds = %if.then310, %if.then307
  br label %if.end314

if.end314:                                        ; preds = %if.end313, %if.end298
  store i32 5, i32* %il, align 4
  store double 2.000000e+00, double* %dr, align 8
  %tmp315 = load double* %dr, align 8
  %tmp316 = load i32* %il, align 4
  %conv317 = sitofp i32 %tmp316 to double
  %add318 = fadd double %conv317, %tmp315
  %conv319 = fptosi double %add318 to i32
  store i32 %conv319, i32* %il, align 4
  %tmp320 = load i32* %il, align 4
  %cmp321 = icmp ne i32 %tmp320, 7
  br i1 %cmp321, label %if.then323, label %if.end330

if.then323:                                       ; preds = %if.end314
  store i32 70, i32* %lrc, align 4
  %tmp324 = load i32* %prlc, align 4
  %tobool325 = icmp ne i32 %tmp324, 0
  br i1 %tobool325, label %if.then326, label %if.end329

if.then326:                                       ; preds = %if.then323
  %tmp327 = load i32* %lrc, align 4
  %call328 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp327)
  br label %if.end329

if.end329:                                        ; preds = %if.then326, %if.then323
  br label %if.end330

if.end330:                                        ; preds = %if.end329, %if.end314
  store i64 5, i64* %ll, align 8
  store i8 2, i8* %cr, align 1
  %tmp331 = load i8* %cr, align 1
  %conv332 = sext i8 %tmp331 to i64
  %tmp333 = load i64* %ll, align 8
  %add334 = add nsw i64 %tmp333, %conv332
  store i64 %add334, i64* %ll, align 8
  %tmp335 = load i64* %ll, align 8
  %cmp336 = icmp ne i64 %tmp335, 7
  br i1 %cmp336, label %if.then338, label %if.end345

if.then338:                                       ; preds = %if.end330
  store i32 71, i32* %lrc, align 4
  %tmp339 = load i32* %prlc, align 4
  %tobool340 = icmp ne i32 %tmp339, 0
  br i1 %tobool340, label %if.then341, label %if.end344

if.then341:                                       ; preds = %if.then338
  %tmp342 = load i32* %lrc, align 4
  %call343 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp342)
  br label %if.end344

if.end344:                                        ; preds = %if.then341, %if.then338
  br label %if.end345

if.end345:                                        ; preds = %if.end344, %if.end330
  store i64 5, i64* %ll, align 8
  store i16 2, i16* %sr, align 2
  %tmp346 = load i16* %sr, align 2
  %conv347 = sext i16 %tmp346 to i64
  %tmp348 = load i64* %ll, align 8
  %add349 = add nsw i64 %tmp348, %conv347
  store i64 %add349, i64* %ll, align 8
  %tmp350 = load i64* %ll, align 8
  %cmp351 = icmp ne i64 %tmp350, 7
  br i1 %cmp351, label %if.then353, label %if.end360

if.then353:                                       ; preds = %if.end345
  store i32 72, i32* %lrc, align 4
  %tmp354 = load i32* %prlc, align 4
  %tobool355 = icmp ne i32 %tmp354, 0
  br i1 %tobool355, label %if.then356, label %if.end359

if.then356:                                       ; preds = %if.then353
  %tmp357 = load i32* %lrc, align 4
  %call358 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp357)
  br label %if.end359

if.end359:                                        ; preds = %if.then356, %if.then353
  br label %if.end360

if.end360:                                        ; preds = %if.end359, %if.end345
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ir, align 4
  %tmp361 = load i32* %ir, align 4
  %conv362 = sext i32 %tmp361 to i64
  %tmp363 = load i64* %ll, align 8
  %add364 = add nsw i64 %tmp363, %conv362
  store i64 %add364, i64* %ll, align 8
  %tmp365 = load i64* %ll, align 8
  %cmp366 = icmp ne i64 %tmp365, 7
  br i1 %cmp366, label %if.then368, label %if.end375

if.then368:                                       ; preds = %if.end360
  store i32 73, i32* %lrc, align 4
  %tmp369 = load i32* %prlc, align 4
  %tobool370 = icmp ne i32 %tmp369, 0
  br i1 %tobool370, label %if.then371, label %if.end374

if.then371:                                       ; preds = %if.then368
  %tmp372 = load i32* %lrc, align 4
  %call373 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp372)
  br label %if.end374

if.end374:                                        ; preds = %if.then371, %if.then368
  br label %if.end375

if.end375:                                        ; preds = %if.end374, %if.end360
  store i64 5, i64* %ll, align 8
  store i64 2, i64* %lr, align 8
  %tmp376 = load i64* %lr, align 8
  %tmp377 = load i64* %ll, align 8
  %add378 = add nsw i64 %tmp377, %tmp376
  store i64 %add378, i64* %ll, align 8
  %tmp379 = load i64* %ll, align 8
  %cmp380 = icmp ne i64 %tmp379, 7
  br i1 %cmp380, label %if.then382, label %if.end389

if.then382:                                       ; preds = %if.end375
  store i32 74, i32* %lrc, align 4
  %tmp383 = load i32* %prlc, align 4
  %tobool384 = icmp ne i32 %tmp383, 0
  br i1 %tobool384, label %if.then385, label %if.end388

if.then385:                                       ; preds = %if.then382
  %tmp386 = load i32* %lrc, align 4
  %call387 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp386)
  br label %if.end388

if.end388:                                        ; preds = %if.then385, %if.then382
  br label %if.end389

if.end389:                                        ; preds = %if.end388, %if.end375
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ur, align 4
  %tmp390 = load i32* %ur, align 4
  %conv391 = zext i32 %tmp390 to i64
  %tmp392 = load i64* %ll, align 8
  %add393 = add nsw i64 %tmp392, %conv391
  store i64 %add393, i64* %ll, align 8
  %tmp394 = load i64* %ll, align 8
  %cmp395 = icmp ne i64 %tmp394, 7
  br i1 %cmp395, label %if.then397, label %if.end404

if.then397:                                       ; preds = %if.end389
  store i32 75, i32* %lrc, align 4
  %tmp398 = load i32* %prlc, align 4
  %tobool399 = icmp ne i32 %tmp398, 0
  br i1 %tobool399, label %if.then400, label %if.end403

if.then400:                                       ; preds = %if.then397
  %tmp401 = load i32* %lrc, align 4
  %call402 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp401)
  br label %if.end403

if.end403:                                        ; preds = %if.then400, %if.then397
  br label %if.end404

if.end404:                                        ; preds = %if.end403, %if.end389
  store i64 5, i64* %ll, align 8
  store float 2.000000e+00, float* %fr, align 4
  %tmp405 = load float* %fr, align 4
  %tmp406 = load i64* %ll, align 8
  %conv407 = sitofp i64 %tmp406 to float
  %add408 = fadd float %conv407, %tmp405
  %conv409 = fptosi float %add408 to i64
  store i64 %conv409, i64* %ll, align 8
  %tmp410 = load i64* %ll, align 8
  %cmp411 = icmp ne i64 %tmp410, 7
  br i1 %cmp411, label %if.then413, label %if.end420

if.then413:                                       ; preds = %if.end404
  store i32 76, i32* %lrc, align 4
  %tmp414 = load i32* %prlc, align 4
  %tobool415 = icmp ne i32 %tmp414, 0
  br i1 %tobool415, label %if.then416, label %if.end419

if.then416:                                       ; preds = %if.then413
  %tmp417 = load i32* %lrc, align 4
  %call418 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp417)
  br label %if.end419

if.end419:                                        ; preds = %if.then416, %if.then413
  br label %if.end420

if.end420:                                        ; preds = %if.end419, %if.end404
  store i64 5, i64* %ll, align 8
  store double 2.000000e+00, double* %dr, align 8
  %tmp421 = load double* %dr, align 8
  %tmp422 = load i64* %ll, align 8
  %conv423 = sitofp i64 %tmp422 to double
  %add424 = fadd double %conv423, %tmp421
  %conv425 = fptosi double %add424 to i64
  store i64 %conv425, i64* %ll, align 8
  %tmp426 = load i64* %ll, align 8
  %cmp427 = icmp ne i64 %tmp426, 7
  br i1 %cmp427, label %if.then429, label %if.end436

if.then429:                                       ; preds = %if.end420
  store i32 77, i32* %lrc, align 4
  %tmp430 = load i32* %prlc, align 4
  %tobool431 = icmp ne i32 %tmp430, 0
  br i1 %tobool431, label %if.then432, label %if.end435

if.then432:                                       ; preds = %if.then429
  %tmp433 = load i32* %lrc, align 4
  %call434 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp433)
  br label %if.end435

if.end435:                                        ; preds = %if.then432, %if.then429
  br label %if.end436

if.end436:                                        ; preds = %if.end435, %if.end420
  store i32 5, i32* %ul, align 4
  store i8 2, i8* %cr, align 1
  %tmp437 = load i8* %cr, align 1
  %conv438 = sext i8 %tmp437 to i32
  %tmp439 = load i32* %ul, align 4
  %add440 = add i32 %tmp439, %conv438
  store i32 %add440, i32* %ul, align 4
  %tmp441 = load i32* %ul, align 4
  %cmp442 = icmp ne i32 %tmp441, 7
  br i1 %cmp442, label %if.then444, label %if.end451

if.then444:                                       ; preds = %if.end436
  store i32 78, i32* %lrc, align 4
  %tmp445 = load i32* %prlc, align 4
  %tobool446 = icmp ne i32 %tmp445, 0
  br i1 %tobool446, label %if.then447, label %if.end450

if.then447:                                       ; preds = %if.then444
  %tmp448 = load i32* %lrc, align 4
  %call449 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp448)
  br label %if.end450

if.end450:                                        ; preds = %if.then447, %if.then444
  br label %if.end451

if.end451:                                        ; preds = %if.end450, %if.end436
  store i32 5, i32* %ul, align 4
  store i16 2, i16* %sr, align 2
  %tmp452 = load i16* %sr, align 2
  %conv453 = sext i16 %tmp452 to i32
  %tmp454 = load i32* %ul, align 4
  %add455 = add i32 %tmp454, %conv453
  store i32 %add455, i32* %ul, align 4
  %tmp456 = load i32* %ul, align 4
  %cmp457 = icmp ne i32 %tmp456, 7
  br i1 %cmp457, label %if.then459, label %if.end466

if.then459:                                       ; preds = %if.end451
  store i32 79, i32* %lrc, align 4
  %tmp460 = load i32* %prlc, align 4
  %tobool461 = icmp ne i32 %tmp460, 0
  br i1 %tobool461, label %if.then462, label %if.end465

if.then462:                                       ; preds = %if.then459
  %tmp463 = load i32* %lrc, align 4
  %call464 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp463)
  br label %if.end465

if.end465:                                        ; preds = %if.then462, %if.then459
  br label %if.end466

if.end466:                                        ; preds = %if.end465, %if.end451
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ir, align 4
  %tmp467 = load i32* %ir, align 4
  %tmp468 = load i32* %ul, align 4
  %add469 = add i32 %tmp468, %tmp467
  store i32 %add469, i32* %ul, align 4
  %tmp470 = load i32* %ul, align 4
  %cmp471 = icmp ne i32 %tmp470, 7
  br i1 %cmp471, label %if.then473, label %if.end480

if.then473:                                       ; preds = %if.end466
  store i32 80, i32* %lrc, align 4
  %tmp474 = load i32* %prlc, align 4
  %tobool475 = icmp ne i32 %tmp474, 0
  br i1 %tobool475, label %if.then476, label %if.end479

if.then476:                                       ; preds = %if.then473
  %tmp477 = load i32* %lrc, align 4
  %call478 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp477)
  br label %if.end479

if.end479:                                        ; preds = %if.then476, %if.then473
  br label %if.end480

if.end480:                                        ; preds = %if.end479, %if.end466
  store i32 5, i32* %ul, align 4
  store i64 2, i64* %lr, align 8
  %tmp481 = load i64* %lr, align 8
  %tmp482 = load i32* %ul, align 4
  %conv483 = zext i32 %tmp482 to i64
  %add484 = add nsw i64 %conv483, %tmp481
  %conv485 = trunc i64 %add484 to i32
  store i32 %conv485, i32* %ul, align 4
  %tmp486 = load i32* %ul, align 4
  %cmp487 = icmp ne i32 %tmp486, 7
  br i1 %cmp487, label %if.then489, label %if.end496

if.then489:                                       ; preds = %if.end480
  store i32 81, i32* %lrc, align 4
  %tmp490 = load i32* %prlc, align 4
  %tobool491 = icmp ne i32 %tmp490, 0
  br i1 %tobool491, label %if.then492, label %if.end495

if.then492:                                       ; preds = %if.then489
  %tmp493 = load i32* %lrc, align 4
  %call494 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp493)
  br label %if.end495

if.end495:                                        ; preds = %if.then492, %if.then489
  br label %if.end496

if.end496:                                        ; preds = %if.end495, %if.end480
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ur, align 4
  %tmp497 = load i32* %ur, align 4
  %tmp498 = load i32* %ul, align 4
  %add499 = add i32 %tmp498, %tmp497
  store i32 %add499, i32* %ul, align 4
  %tmp500 = load i32* %ul, align 4
  %cmp501 = icmp ne i32 %tmp500, 7
  br i1 %cmp501, label %if.then503, label %if.end510

if.then503:                                       ; preds = %if.end496
  store i32 82, i32* %lrc, align 4
  %tmp504 = load i32* %prlc, align 4
  %tobool505 = icmp ne i32 %tmp504, 0
  br i1 %tobool505, label %if.then506, label %if.end509

if.then506:                                       ; preds = %if.then503
  %tmp507 = load i32* %lrc, align 4
  %call508 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp507)
  br label %if.end509

if.end509:                                        ; preds = %if.then506, %if.then503
  br label %if.end510

if.end510:                                        ; preds = %if.end509, %if.end496
  store i32 5, i32* %ul, align 4
  store float 2.000000e+00, float* %fr, align 4
  %tmp511 = load float* %fr, align 4
  %tmp512 = load i32* %ul, align 4
  %conv513 = uitofp i32 %tmp512 to float
  %add514 = fadd float %conv513, %tmp511
  %conv515 = fptoui float %add514 to i32
  store i32 %conv515, i32* %ul, align 4
  %tmp516 = load i32* %ul, align 4
  %cmp517 = icmp ne i32 %tmp516, 7
  br i1 %cmp517, label %if.then519, label %if.end526

if.then519:                                       ; preds = %if.end510
  store i32 83, i32* %lrc, align 4
  %tmp520 = load i32* %prlc, align 4
  %tobool521 = icmp ne i32 %tmp520, 0
  br i1 %tobool521, label %if.then522, label %if.end525

if.then522:                                       ; preds = %if.then519
  %tmp523 = load i32* %lrc, align 4
  %call524 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp523)
  br label %if.end525

if.end525:                                        ; preds = %if.then522, %if.then519
  br label %if.end526

if.end526:                                        ; preds = %if.end525, %if.end510
  store i32 5, i32* %ul, align 4
  store double 2.000000e+00, double* %dr, align 8
  %tmp527 = load double* %dr, align 8
  %tmp528 = load i32* %ul, align 4
  %conv529 = uitofp i32 %tmp528 to double
  %add530 = fadd double %conv529, %tmp527
  %conv531 = fptoui double %add530 to i32
  store i32 %conv531, i32* %ul, align 4
  %tmp532 = load i32* %ul, align 4
  %cmp533 = icmp ne i32 %tmp532, 7
  br i1 %cmp533, label %if.then535, label %if.end542

if.then535:                                       ; preds = %if.end526
  store i32 84, i32* %lrc, align 4
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
  store float 5.000000e+00, float* %fl, align 4
  store i8 2, i8* %cr, align 1
  %tmp543 = load i8* %cr, align 1
  %conv544 = sext i8 %tmp543 to i32
  %conv545 = sitofp i32 %conv544 to float
  %tmp546 = load float* %fl, align 4
  %add547 = fadd float %tmp546, %conv545
  store float %add547, float* %fl, align 4
  %tmp548 = load float* %fl, align 4
  %cmp549 = fcmp une float %tmp548, 7.000000e+00
  br i1 %cmp549, label %if.then551, label %if.end558

if.then551:                                       ; preds = %if.end542
  store i32 85, i32* %lrc, align 4
  %tmp552 = load i32* %prlc, align 4
  %tobool553 = icmp ne i32 %tmp552, 0
  br i1 %tobool553, label %if.then554, label %if.end557

if.then554:                                       ; preds = %if.then551
  %tmp555 = load i32* %lrc, align 4
  %call556 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp555)
  br label %if.end557

if.end557:                                        ; preds = %if.then554, %if.then551
  br label %if.end558

if.end558:                                        ; preds = %if.end557, %if.end542
  store float 5.000000e+00, float* %fl, align 4
  store i16 2, i16* %sr, align 2
  %tmp559 = load i16* %sr, align 2
  %conv560 = sext i16 %tmp559 to i32
  %conv561 = sitofp i32 %conv560 to float
  %tmp562 = load float* %fl, align 4
  %add563 = fadd float %tmp562, %conv561
  store float %add563, float* %fl, align 4
  %tmp564 = load float* %fl, align 4
  %cmp565 = fcmp une float %tmp564, 7.000000e+00
  br i1 %cmp565, label %if.then567, label %if.end574

if.then567:                                       ; preds = %if.end558
  store i32 86, i32* %lrc, align 4
  %tmp568 = load i32* %prlc, align 4
  %tobool569 = icmp ne i32 %tmp568, 0
  br i1 %tobool569, label %if.then570, label %if.end573

if.then570:                                       ; preds = %if.then567
  %tmp571 = load i32* %lrc, align 4
  %call572 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp571)
  br label %if.end573

if.end573:                                        ; preds = %if.then570, %if.then567
  br label %if.end574

if.end574:                                        ; preds = %if.end573, %if.end558
  store float 5.000000e+00, float* %fl, align 4
  store i32 2, i32* %ir, align 4
  %tmp575 = load i32* %ir, align 4
  %conv576 = sitofp i32 %tmp575 to float
  %tmp577 = load float* %fl, align 4
  %add578 = fadd float %tmp577, %conv576
  store float %add578, float* %fl, align 4
  %tmp579 = load float* %fl, align 4
  %cmp580 = fcmp une float %tmp579, 7.000000e+00
  br i1 %cmp580, label %if.then582, label %if.end589

if.then582:                                       ; preds = %if.end574
  store i32 87, i32* %lrc, align 4
  %tmp583 = load i32* %prlc, align 4
  %tobool584 = icmp ne i32 %tmp583, 0
  br i1 %tobool584, label %if.then585, label %if.end588

if.then585:                                       ; preds = %if.then582
  %tmp586 = load i32* %lrc, align 4
  %call587 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp586)
  br label %if.end588

if.end588:                                        ; preds = %if.then585, %if.then582
  br label %if.end589

if.end589:                                        ; preds = %if.end588, %if.end574
  store float 5.000000e+00, float* %fl, align 4
  store i64 2, i64* %lr, align 8
  %tmp590 = load i64* %lr, align 8
  %conv591 = sitofp i64 %tmp590 to float
  %tmp592 = load float* %fl, align 4
  %add593 = fadd float %tmp592, %conv591
  store float %add593, float* %fl, align 4
  %tmp594 = load float* %fl, align 4
  %cmp595 = fcmp une float %tmp594, 7.000000e+00
  br i1 %cmp595, label %if.then597, label %if.end604

if.then597:                                       ; preds = %if.end589
  store i32 88, i32* %lrc, align 4
  %tmp598 = load i32* %prlc, align 4
  %tobool599 = icmp ne i32 %tmp598, 0
  br i1 %tobool599, label %if.then600, label %if.end603

if.then600:                                       ; preds = %if.then597
  %tmp601 = load i32* %lrc, align 4
  %call602 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp601)
  br label %if.end603

if.end603:                                        ; preds = %if.then600, %if.then597
  br label %if.end604

if.end604:                                        ; preds = %if.end603, %if.end589
  store float 5.000000e+00, float* %fl, align 4
  store i32 2, i32* %ur, align 4
  %tmp605 = load i32* %ur, align 4
  %conv606 = uitofp i32 %tmp605 to float
  %tmp607 = load float* %fl, align 4
  %add608 = fadd float %tmp607, %conv606
  store float %add608, float* %fl, align 4
  %tmp609 = load float* %fl, align 4
  %cmp610 = fcmp une float %tmp609, 7.000000e+00
  br i1 %cmp610, label %if.then612, label %if.end619

if.then612:                                       ; preds = %if.end604
  store i32 89, i32* %lrc, align 4
  %tmp613 = load i32* %prlc, align 4
  %tobool614 = icmp ne i32 %tmp613, 0
  br i1 %tobool614, label %if.then615, label %if.end618

if.then615:                                       ; preds = %if.then612
  %tmp616 = load i32* %lrc, align 4
  %call617 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp616)
  br label %if.end618

if.end618:                                        ; preds = %if.then615, %if.then612
  br label %if.end619

if.end619:                                        ; preds = %if.end618, %if.end604
  store float 5.000000e+00, float* %fl, align 4
  store float 2.000000e+00, float* %fr, align 4
  %tmp620 = load float* %fr, align 4
  %tmp621 = load float* %fl, align 4
  %add622 = fadd float %tmp621, %tmp620
  store float %add622, float* %fl, align 4
  %tmp623 = load float* %fl, align 4
  %cmp624 = fcmp une float %tmp623, 7.000000e+00
  br i1 %cmp624, label %if.then626, label %if.end633

if.then626:                                       ; preds = %if.end619
  store i32 90, i32* %lrc, align 4
  %tmp627 = load i32* %prlc, align 4
  %tobool628 = icmp ne i32 %tmp627, 0
  br i1 %tobool628, label %if.then629, label %if.end632

if.then629:                                       ; preds = %if.then626
  %tmp630 = load i32* %lrc, align 4
  %call631 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp630)
  br label %if.end632

if.end632:                                        ; preds = %if.then629, %if.then626
  br label %if.end633

if.end633:                                        ; preds = %if.end632, %if.end619
  store float 5.000000e+00, float* %fl, align 4
  store double 2.000000e+00, double* %dr, align 8
  %tmp634 = load double* %dr, align 8
  %tmp635 = load float* %fl, align 4
  %conv636 = fpext float %tmp635 to double
  %add637 = fadd double %conv636, %tmp634
  %conv638 = fptrunc double %add637 to float
  store float %conv638, float* %fl, align 4
  %tmp639 = load float* %fl, align 4
  %cmp640 = fcmp une float %tmp639, 7.000000e+00
  br i1 %cmp640, label %if.then642, label %if.end649

if.then642:                                       ; preds = %if.end633
  store i32 91, i32* %lrc, align 4
  %tmp643 = load i32* %prlc, align 4
  %tobool644 = icmp ne i32 %tmp643, 0
  br i1 %tobool644, label %if.then645, label %if.end648

if.then645:                                       ; preds = %if.then642
  %tmp646 = load i32* %lrc, align 4
  %call647 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp646)
  br label %if.end648

if.end648:                                        ; preds = %if.then645, %if.then642
  br label %if.end649

if.end649:                                        ; preds = %if.end648, %if.end633
  store double 5.000000e+00, double* %dl, align 8
  store i8 2, i8* %cr, align 1
  %tmp650 = load i8* %cr, align 1
  %conv651 = sext i8 %tmp650 to i32
  %conv652 = sitofp i32 %conv651 to double
  %tmp653 = load double* %dl, align 8
  %add654 = fadd double %tmp653, %conv652
  store double %add654, double* %dl, align 8
  %tmp655 = load double* %dl, align 8
  %cmp656 = fcmp une double %tmp655, 7.000000e+00
  br i1 %cmp656, label %if.then658, label %if.end665

if.then658:                                       ; preds = %if.end649
  store i32 92, i32* %lrc, align 4
  %tmp659 = load i32* %prlc, align 4
  %tobool660 = icmp ne i32 %tmp659, 0
  br i1 %tobool660, label %if.then661, label %if.end664

if.then661:                                       ; preds = %if.then658
  %tmp662 = load i32* %lrc, align 4
  %call663 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp662)
  br label %if.end664

if.end664:                                        ; preds = %if.then661, %if.then658
  br label %if.end665

if.end665:                                        ; preds = %if.end664, %if.end649
  store double 5.000000e+00, double* %dl, align 8
  store i16 2, i16* %sr, align 2
  %tmp666 = load i16* %sr, align 2
  %conv667 = sext i16 %tmp666 to i32
  %conv668 = sitofp i32 %conv667 to double
  %tmp669 = load double* %dl, align 8
  %add670 = fadd double %tmp669, %conv668
  store double %add670, double* %dl, align 8
  %tmp671 = load double* %dl, align 8
  %cmp672 = fcmp une double %tmp671, 7.000000e+00
  br i1 %cmp672, label %if.then674, label %if.end681

if.then674:                                       ; preds = %if.end665
  store i32 93, i32* %lrc, align 4
  %tmp675 = load i32* %prlc, align 4
  %tobool676 = icmp ne i32 %tmp675, 0
  br i1 %tobool676, label %if.then677, label %if.end680

if.then677:                                       ; preds = %if.then674
  %tmp678 = load i32* %lrc, align 4
  %call679 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp678)
  br label %if.end680

if.end680:                                        ; preds = %if.then677, %if.then674
  br label %if.end681

if.end681:                                        ; preds = %if.end680, %if.end665
  store double 5.000000e+00, double* %dl, align 8
  store i32 2, i32* %ir, align 4
  %tmp682 = load i32* %ir, align 4
  %conv683 = sitofp i32 %tmp682 to double
  %tmp684 = load double* %dl, align 8
  %add685 = fadd double %tmp684, %conv683
  store double %add685, double* %dl, align 8
  %tmp686 = load double* %dl, align 8
  %cmp687 = fcmp une double %tmp686, 7.000000e+00
  br i1 %cmp687, label %if.then689, label %if.end696

if.then689:                                       ; preds = %if.end681
  store i32 94, i32* %lrc, align 4
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
  store i64 2, i64* %lr, align 8
  %tmp697 = load i64* %lr, align 8
  %conv698 = sitofp i64 %tmp697 to double
  %tmp699 = load double* %dl, align 8
  %add700 = fadd double %tmp699, %conv698
  store double %add700, double* %dl, align 8
  %tmp701 = load double* %dl, align 8
  %cmp702 = fcmp une double %tmp701, 7.000000e+00
  br i1 %cmp702, label %if.then704, label %if.end711

if.then704:                                       ; preds = %if.end696
  store i32 95, i32* %lrc, align 4
  %tmp705 = load i32* %prlc, align 4
  %tobool706 = icmp ne i32 %tmp705, 0
  br i1 %tobool706, label %if.then707, label %if.end710

if.then707:                                       ; preds = %if.then704
  %tmp708 = load i32* %lrc, align 4
  %call709 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp708)
  br label %if.end710

if.end710:                                        ; preds = %if.then707, %if.then704
  br label %if.end711

if.end711:                                        ; preds = %if.end710, %if.end696
  store double 5.000000e+00, double* %dl, align 8
  store i32 2, i32* %ur, align 4
  %tmp712 = load i32* %ur, align 4
  %conv713 = uitofp i32 %tmp712 to double
  %tmp714 = load double* %dl, align 8
  %add715 = fadd double %tmp714, %conv713
  store double %add715, double* %dl, align 8
  %tmp716 = load double* %dl, align 8
  %cmp717 = fcmp une double %tmp716, 7.000000e+00
  br i1 %cmp717, label %if.then719, label %if.end726

if.then719:                                       ; preds = %if.end711
  store i32 96, i32* %lrc, align 4
  %tmp720 = load i32* %prlc, align 4
  %tobool721 = icmp ne i32 %tmp720, 0
  br i1 %tobool721, label %if.then722, label %if.end725

if.then722:                                       ; preds = %if.then719
  %tmp723 = load i32* %lrc, align 4
  %call724 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp723)
  br label %if.end725

if.end725:                                        ; preds = %if.then722, %if.then719
  br label %if.end726

if.end726:                                        ; preds = %if.end725, %if.end711
  store double 5.000000e+00, double* %dl, align 8
  store float 2.000000e+00, float* %fr, align 4
  %tmp727 = load float* %fr, align 4
  %conv728 = fpext float %tmp727 to double
  %tmp729 = load double* %dl, align 8
  %add730 = fadd double %tmp729, %conv728
  store double %add730, double* %dl, align 8
  %tmp731 = load double* %dl, align 8
  %cmp732 = fcmp une double %tmp731, 7.000000e+00
  br i1 %cmp732, label %if.then734, label %if.end741

if.then734:                                       ; preds = %if.end726
  store i32 97, i32* %lrc, align 4
  %tmp735 = load i32* %prlc, align 4
  %tobool736 = icmp ne i32 %tmp735, 0
  br i1 %tobool736, label %if.then737, label %if.end740

if.then737:                                       ; preds = %if.then734
  %tmp738 = load i32* %lrc, align 4
  %call739 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp738)
  br label %if.end740

if.end740:                                        ; preds = %if.then737, %if.then734
  br label %if.end741

if.end741:                                        ; preds = %if.end740, %if.end726
  store double 5.000000e+00, double* %dl, align 8
  store double 2.000000e+00, double* %dr, align 8
  %tmp742 = load double* %dr, align 8
  %tmp743 = load double* %dl, align 8
  %add744 = fadd double %tmp743, %tmp742
  store double %add744, double* %dl, align 8
  %tmp745 = load double* %dl, align 8
  %cmp746 = fcmp une double %tmp745, 7.000000e+00
  br i1 %cmp746, label %if.then748, label %if.end755

if.then748:                                       ; preds = %if.end741
  store i32 98, i32* %lrc, align 4
  %tmp749 = load i32* %prlc, align 4
  %tobool750 = icmp ne i32 %tmp749, 0
  br i1 %tobool750, label %if.then751, label %if.end754

if.then751:                                       ; preds = %if.then748
  %tmp752 = load i32* %lrc, align 4
  %call753 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp752)
  br label %if.end754

if.end754:                                        ; preds = %if.then751, %if.then748
  br label %if.end755

if.end755:                                        ; preds = %if.end754, %if.end741
  store i8 5, i8* %cl, align 1
  store i8 2, i8* %cr, align 1
  %tmp756 = load i8* %cr, align 1
  %conv757 = sext i8 %tmp756 to i32
  %tmp758 = load i8* %cl, align 1
  %conv759 = sext i8 %tmp758 to i32
  %sub = sub nsw i32 %conv759, %conv757
  %conv760 = trunc i32 %sub to i8
  store i8 %conv760, i8* %cl, align 1
  %tmp761 = load i8* %cl, align 1
  %conv762 = sext i8 %tmp761 to i32
  %cmp763 = icmp ne i32 %conv762, 3
  br i1 %cmp763, label %if.then765, label %if.end772

if.then765:                                       ; preds = %if.end755
  store i32 99, i32* %lrc, align 4
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
  store i16 2, i16* %sr, align 2
  %tmp773 = load i16* %sr, align 2
  %conv774 = sext i16 %tmp773 to i32
  %tmp775 = load i8* %cl, align 1
  %conv776 = sext i8 %tmp775 to i32
  %sub777 = sub nsw i32 %conv776, %conv774
  %conv778 = trunc i32 %sub777 to i8
  store i8 %conv778, i8* %cl, align 1
  %tmp779 = load i8* %cl, align 1
  %conv780 = sext i8 %tmp779 to i32
  %cmp781 = icmp ne i32 %conv780, 3
  br i1 %cmp781, label %if.then783, label %if.end790

if.then783:                                       ; preds = %if.end772
  store i32 100, i32* %lrc, align 4
  %tmp784 = load i32* %prlc, align 4
  %tobool785 = icmp ne i32 %tmp784, 0
  br i1 %tobool785, label %if.then786, label %if.end789

if.then786:                                       ; preds = %if.then783
  %tmp787 = load i32* %lrc, align 4
  %call788 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %tmp787)
  br label %if.end789

if.end789:                                        ; preds = %if.then786, %if.then783
  br label %if.end790

if.end790:                                        ; preds = %if.end789, %if.end772
  %tmp791 = load i32* %lrc, align 4
  %cmp792 = icmp ne i32 %tmp791, 0
  br i1 %cmp792, label %if.then794, label %if.end802

if.then794:                                       ; preds = %if.end790
  store i32 1, i32* %rc, align 4
  %tmp795 = load %struct.defs** %pd0.addr, align 8
  %flgd = getelementptr inbounds %struct.defs* %tmp795, i32 0, i32 11
  %tmp796 = load i32* %flgd, align 4
  %cmp797 = icmp ne i32 %tmp796, 0
  br i1 %cmp797, label %if.then799, label %if.end801

if.then799:                                       ; preds = %if.then794
  %call800 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @sec.s714er, i32 0, i32 0), i32 1)
  br label %if.end801

if.end801:                                        ; preds = %if.then799, %if.then794
  br label %if.end802

if.end802:                                        ; preds = %if.end801, %if.end790
  %tmp803 = load i32* %rc, align 4
  ret i32 %tmp803
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
