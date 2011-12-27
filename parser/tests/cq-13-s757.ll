; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/cq-13-s757.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.defs = type { i32, i32, i32, i32, i32, i32, i32, float, float, i32, i32, i32, i32, i32, i32, [8 x i8] }

@setupTable.qs26 = internal global [8 x i8] c"s26    \00", align 1
@setupTable.s = internal global [18 x i8] c"%3d bits in %ss.\0A\00", align 16
@setupTable.s2 = internal global [54 x i8] c"%f is the least number that can be added to 1. (%s).\0A\00", align 16
@svtest.k = internal global i32 0, align 4
@zero.k = internal global i32 0, align 4
@extvar = common global i32 0, align 4
@sec.s757er = internal global [11 x i8] c"s757,er%d\0A\00", align 1
@sec.qs757 = internal global [8 x i8] c"s757   \00", align 1
@.str = private unnamed_addr constant [60 x i8] c"Increasing array elements assigned to decreasing locations\0A\00", align 1
@main.d0 = internal global %struct.defs zeroinitializer, align 4
@main.pd0 = internal global %struct.defs* null, align 8
@.str1 = private unnamed_addr constant [25 x i8] c"Section %s returned %d.\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"\0ANo errors detected.\0A\00", align 1
@.str3 = private unnamed_addr constant [10 x i8] c"\0AFailed.\0A\00", align 1

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
  %t = alloca i32, align 4
  %lrc = alloca i32, align 4
  %k = alloca i32, align 4
  %j = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %x = alloca [16 x i32], align 16
  %p = alloca i32*, align 8
  %rs = alloca i32, align 4
  %ls = alloca i32, align 4
  %rt = alloca i32, align 4
  %lt = alloca i32, align 4
  store %struct.defs* %pd0, %struct.defs** %pd0.addr, align 8
  store i8* getelementptr inbounds ([8 x i8]* @sec.qs757, i32 0, i32 0), i8** %ps, align 8
  %tmp = load %struct.defs** %pd0.addr, align 8
  %rfs = getelementptr inbounds %struct.defs* %tmp, i32 0, i32 15
  %arraydecay = getelementptr inbounds [8 x i8]* %rfs, i32 0, i32 0
  store i8* %arraydecay, i8** %pt, align 8
  store i32 0, i32* %rc, align 4
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
  store i32 40, i32* %t, align 4
  %tmp5 = load i32* %t, align 4
  %shl = shl i32 %tmp5, 3
  %shl6 = shl i32 %shl, 2
  %cmp = icmp ne i32 %shl6, 1280
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.end
  %tmp7 = load i32* %t, align 4
  %shr = ashr i32 %tmp7, 3
  %shr8 = ashr i32 %shr, 2
  %cmp9 = icmp ne i32 %shr8, 1
  br i1 %cmp9, label %if.then, label %if.end15

if.then:                                          ; preds = %lor.lhs.false, %while.end
  %tmp10 = load i32* %rc, align 4
  %add = add nsw i32 %tmp10, 1
  store i32 %add, i32* %rc, align 4
  %tmp11 = load %struct.defs** %pd0.addr, align 8
  %flgd = getelementptr inbounds %struct.defs* %tmp11, i32 0, i32 11
  %tmp12 = load i32* %flgd, align 4
  %cmp13 = icmp ne i32 %tmp12, 0
  br i1 %cmp13, label %if.then14, label %if.end

if.then14:                                        ; preds = %if.then
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @sec.s757er, i32 0, i32 0), i32 1)
  br label %if.end

if.end:                                           ; preds = %if.then14, %if.then
  br label %if.end15

if.end15:                                         ; preds = %if.end, %lor.lhs.false
  store i32 0, i32* %lrc, align 4
  store i32 0, i32* %k, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc67, %if.end15
  %tmp16 = load i32* %k, align 4
  %tmp17 = load %struct.defs** %pd0.addr, align 8
  %ubits = getelementptr inbounds %struct.defs* %tmp17, i32 0, i32 4
  %tmp18 = load i32* %ubits, align 4
  %cmp19 = icmp slt i32 %tmp16, %tmp18
  br i1 %cmp19, label %for.body, label %for.end70

for.body:                                         ; preds = %for.cond
  store i32 1, i32* %rs, align 4
  %tmp20 = load i32* %rs, align 4
  %tmp21 = load %struct.defs** %pd0.addr, align 8
  %ubits22 = getelementptr inbounds %struct.defs* %tmp21, i32 0, i32 4
  %tmp23 = load i32* %ubits22, align 4
  %sub = sub nsw i32 %tmp23, 1
  %shl24 = shl i32 %tmp20, %sub
  store i32 %shl24, i32* %ls, align 4
  store i32 0, i32* %rt, align 4
  %tmp25 = load i32* %rt, align 4
  %neg = xor i32 %tmp25, -1
  %tmp26 = load i32* %k, align 4
  %shr27 = lshr i32 %neg, %tmp26
  store i32 %shr27, i32* %lt, align 4
  %tmp28 = load i32* %rt, align 4
  %neg29 = xor i32 %tmp28, -1
  %tmp30 = load i32* %k, align 4
  %shl31 = shl i32 %neg29, %tmp30
  store i32 %shl31, i32* %rt, align 4
  store i32 0, i32* %j, align 4
  br label %for.cond32

for.cond32:                                       ; preds = %for.inc, %for.body
  %tmp33 = load i32* %j, align 4
  %tmp34 = load %struct.defs** %pd0.addr, align 8
  %ubits35 = getelementptr inbounds %struct.defs* %tmp34, i32 0, i32 4
  %tmp36 = load i32* %ubits35, align 4
  %cmp37 = icmp slt i32 %tmp33, %tmp36
  br i1 %cmp37, label %for.body38, label %for.end

for.body38:                                       ; preds = %for.cond32
  %tmp39 = load i32* %j, align 4
  %tmp40 = load i32* %k, align 4
  %cmp41 = icmp slt i32 %tmp39, %tmp40
  %conv = zext i1 %cmp41 to i32
  %tmp42 = load i32* %rs, align 4
  %tmp43 = load i32* %rt, align 4
  %and = and i32 %tmp42, %tmp43
  %cmp44 = icmp eq i32 %and, 0
  %conv45 = zext i1 %cmp44 to i32
  %cmp46 = icmp ne i32 %conv, %conv45
  br i1 %cmp46, label %if.then60, label %lor.lhs.false48

lor.lhs.false48:                                  ; preds = %for.body38
  %tmp49 = load i32* %j, align 4
  %tmp50 = load i32* %k, align 4
  %cmp51 = icmp slt i32 %tmp49, %tmp50
  %conv52 = zext i1 %cmp51 to i32
  %tmp53 = load i32* %ls, align 4
  %tmp54 = load i32* %lt, align 4
  %and55 = and i32 %tmp53, %tmp54
  %cmp56 = icmp eq i32 %and55, 0
  %conv57 = zext i1 %cmp56 to i32
  %cmp58 = icmp ne i32 %conv52, %conv57
  br i1 %cmp58, label %if.then60, label %if.end61

if.then60:                                        ; preds = %lor.lhs.false48, %for.body38
  store i32 1, i32* %lrc, align 4
  br label %if.end61

if.end61:                                         ; preds = %if.then60, %lor.lhs.false48
  %tmp62 = load i32* %rs, align 4
  %shl63 = shl i32 %tmp62, 1
  store i32 %shl63, i32* %rs, align 4
  %tmp64 = load i32* %ls, align 4
  %shr65 = lshr i32 %tmp64, 1
  store i32 %shr65, i32* %ls, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end61
  %tmp66 = load i32* %j, align 4
  %inc = add nsw i32 %tmp66, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond32

for.end:                                          ; preds = %for.cond32
  br label %for.inc67

for.inc67:                                        ; preds = %for.end
  %tmp68 = load i32* %k, align 4
  %inc69 = add nsw i32 %tmp68, 1
  store i32 %inc69, i32* %k, align 4
  br label %for.cond

for.end70:                                        ; preds = %for.cond
  %tmp71 = load i32* %lrc, align 4
  %cmp72 = icmp ne i32 %tmp71, 0
  br i1 %cmp72, label %if.then74, label %if.end85

if.then74:                                        ; preds = %for.end70
  %tmp75 = load i32* %rc, align 4
  %add76 = add nsw i32 %tmp75, 2
  store i32 %add76, i32* %rc, align 4
  %tmp77 = load %struct.defs** %pd0.addr, align 8
  %flgd78 = getelementptr inbounds %struct.defs* %tmp77, i32 0, i32 11
  %tmp79 = load i32* %flgd78, align 4
  %cmp80 = icmp ne i32 %tmp79, 0
  br i1 %cmp80, label %if.then82, label %if.end84

if.then82:                                        ; preds = %if.then74
  %call83 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @sec.s757er, i32 0, i32 0), i32 2)
  br label %if.end84

if.end84:                                         ; preds = %if.then82, %if.then74
  br label %if.end85

if.end85:                                         ; preds = %if.end84, %for.end70
  store i32 3, i32* %a, align 4
  store i32 2, i32* %b, align 4
  store i32 1, i32* %c, align 4
  %tmp86 = load i32* %a, align 4
  %tmp87 = load i32* %b, align 4
  %cmp88 = icmp slt i32 %tmp86, %tmp87
  %conv89 = zext i1 %cmp88 to i32
  %tmp90 = load i32* %c, align 4
  %cmp91 = icmp slt i32 %conv89, %tmp90
  %conv92 = zext i1 %cmp91 to i32
  %cmp93 = icmp ne i32 %conv92, 1
  br i1 %cmp93, label %if.then95, label %if.end106

if.then95:                                        ; preds = %if.end85
  %tmp96 = load i32* %rc, align 4
  %add97 = add nsw i32 %tmp96, 4
  store i32 %add97, i32* %rc, align 4
  %tmp98 = load %struct.defs** %pd0.addr, align 8
  %flgd99 = getelementptr inbounds %struct.defs* %tmp98, i32 0, i32 11
  %tmp100 = load i32* %flgd99, align 4
  %cmp101 = icmp ne i32 %tmp100, 0
  br i1 %cmp101, label %if.then103, label %if.end105

if.then103:                                       ; preds = %if.then95
  %call104 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @sec.s757er, i32 0, i32 0), i32 4)
  br label %if.end105

if.end105:                                        ; preds = %if.then103, %if.then95
  br label %if.end106

if.end106:                                        ; preds = %if.end105, %if.end85
  %arrayidx = getelementptr inbounds [16 x i32]* %x, i32 0, i64 1
  %arrayidx107 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 0
  %cmp108 = icmp eq i32* %arrayidx, %arrayidx107
  br i1 %cmp108, label %if.then110, label %if.end121

if.then110:                                       ; preds = %if.end106
  %tmp111 = load i32* %rc, align 4
  %add112 = add nsw i32 %tmp111, 8
  store i32 %add112, i32* %rc, align 4
  %tmp113 = load %struct.defs** %pd0.addr, align 8
  %flgd114 = getelementptr inbounds %struct.defs* %tmp113, i32 0, i32 11
  %tmp115 = load i32* %flgd114, align 4
  %cmp116 = icmp ne i32 %tmp115, 0
  br i1 %cmp116, label %if.then118, label %if.end120

if.then118:                                       ; preds = %if.then110
  %call119 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @sec.s757er, i32 0, i32 0), i32 8)
  br label %if.end120

if.end120:                                        ; preds = %if.then118, %if.then110
  br label %if.end121

if.end121:                                        ; preds = %if.end120, %if.end106
  %arrayidx122 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 1
  %arrayidx123 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 0
  %cmp124 = icmp ult i32* %arrayidx122, %arrayidx123
  br i1 %cmp124, label %if.then126, label %if.end134

if.then126:                                       ; preds = %if.end121
  %tmp127 = load %struct.defs** %pd0.addr, align 8
  %flgm = getelementptr inbounds %struct.defs* %tmp127, i32 0, i32 10
  %tmp128 = load i32* %flgm, align 4
  %cmp129 = icmp ne i32 %tmp128, 0
  br i1 %cmp129, label %if.then131, label %if.end133

if.then131:                                       ; preds = %if.then126
  %call132 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([60 x i8]* @.str, i32 0, i32 0))
  br label %if.end133

if.end133:                                        ; preds = %if.then131, %if.then126
  br label %if.end134

if.end134:                                        ; preds = %if.end133, %if.end121
  store i32 0, i32* %lrc, align 4
  store i32 0, i32* %j, align 4
  br label %for.cond135

for.cond135:                                      ; preds = %for.inc142, %if.end134
  %tmp136 = load i32* %j, align 4
  %cmp137 = icmp slt i32 %tmp136, 16
  br i1 %cmp137, label %for.body139, label %for.end145

for.body139:                                      ; preds = %for.cond135
  %tmp140 = load i32* %j, align 4
  %idxprom = sext i32 %tmp140 to i64
  %arrayidx141 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 %idxprom
  store i32 1, i32* %arrayidx141, align 4
  br label %for.inc142

for.inc142:                                       ; preds = %for.body139
  %tmp143 = load i32* %j, align 4
  %inc144 = add nsw i32 %tmp143, 1
  store i32 %inc144, i32* %j, align 4
  br label %for.cond135

for.end145:                                       ; preds = %for.cond135
  %arrayidx146 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 1
  store i32 0, i32* %arrayidx146, align 4
  %arrayidx147 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 4
  store i32 0, i32* %arrayidx147, align 4
  %arrayidx148 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 6
  store i32 0, i32* %arrayidx148, align 4
  %arrayidx149 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 7
  store i32 0, i32* %arrayidx149, align 4
  %arrayidx150 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 9
  store i32 0, i32* %arrayidx150, align 4
  %arrayidx151 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 13
  store i32 0, i32* %arrayidx151, align 4
  store i32 0, i32* %a, align 4
  br label %for.cond152

for.cond152:                                      ; preds = %for.inc210, %for.end145
  %tmp153 = load i32* %a, align 4
  %cmp154 = icmp slt i32 %tmp153, 2
  br i1 %cmp154, label %for.body156, label %for.end213

for.body156:                                      ; preds = %for.cond152
  store i32 0, i32* %b, align 4
  br label %for.cond157

for.cond157:                                      ; preds = %for.inc206, %for.body156
  %tmp158 = load i32* %b, align 4
  %cmp159 = icmp slt i32 %tmp158, 2
  br i1 %cmp159, label %for.body161, label %for.end209

for.body161:                                      ; preds = %for.cond157
  store i32 0, i32* %c, align 4
  br label %for.cond162

for.cond162:                                      ; preds = %for.inc202, %for.body161
  %tmp163 = load i32* %c, align 4
  %cmp164 = icmp slt i32 %tmp163, 2
  br i1 %cmp164, label %for.body166, label %for.end205

for.body166:                                      ; preds = %for.cond162
  store i32 0, i32* %d, align 4
  br label %for.cond167

for.cond167:                                      ; preds = %for.inc198, %for.body166
  %tmp168 = load i32* %d, align 4
  %cmp169 = icmp slt i32 %tmp168, 2
  br i1 %cmp169, label %for.body171, label %for.end201

for.body171:                                      ; preds = %for.cond167
  %tmp172 = load i32* %a, align 4
  %tmp173 = load i32* %b, align 4
  %cmp174 = icmp slt i32 %tmp172, %tmp173
  %conv175 = zext i1 %cmp174 to i32
  %tmp176 = load i32* %c, align 4
  %tmp177 = load i32* %d, align 4
  %cmp178 = icmp slt i32 %tmp176, %tmp177
  %conv179 = zext i1 %cmp178 to i32
  %cmp180 = icmp eq i32 %conv175, %conv179
  %conv181 = zext i1 %cmp180 to i32
  %tmp182 = load i32* %a, align 4
  %mul = mul nsw i32 8, %tmp182
  %tmp183 = load i32* %b, align 4
  %mul184 = mul nsw i32 4, %tmp183
  %add185 = add nsw i32 %mul, %mul184
  %tmp186 = load i32* %c, align 4
  %mul187 = mul nsw i32 2, %tmp186
  %add188 = add nsw i32 %add185, %mul187
  %tmp189 = load i32* %d, align 4
  %add190 = add nsw i32 %add188, %tmp189
  %idxprom191 = sext i32 %add190 to i64
  %arrayidx192 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 %idxprom191
  %tmp193 = load i32* %arrayidx192, align 4
  %cmp194 = icmp ne i32 %conv181, %tmp193
  br i1 %cmp194, label %if.then196, label %if.end197

if.then196:                                       ; preds = %for.body171
  store i32 1, i32* %lrc, align 4
  br label %if.end197

if.end197:                                        ; preds = %if.then196, %for.body171
  br label %for.inc198

for.inc198:                                       ; preds = %if.end197
  %tmp199 = load i32* %d, align 4
  %inc200 = add nsw i32 %tmp199, 1
  store i32 %inc200, i32* %d, align 4
  br label %for.cond167

for.end201:                                       ; preds = %for.cond167
  br label %for.inc202

for.inc202:                                       ; preds = %for.end201
  %tmp203 = load i32* %c, align 4
  %inc204 = add nsw i32 %tmp203, 1
  store i32 %inc204, i32* %c, align 4
  br label %for.cond162

for.end205:                                       ; preds = %for.cond162
  br label %for.inc206

for.inc206:                                       ; preds = %for.end205
  %tmp207 = load i32* %b, align 4
  %inc208 = add nsw i32 %tmp207, 1
  store i32 %inc208, i32* %b, align 4
  br label %for.cond157

for.end209:                                       ; preds = %for.cond157
  br label %for.inc210

for.inc210:                                       ; preds = %for.end209
  %tmp211 = load i32* %a, align 4
  %inc212 = add nsw i32 %tmp211, 1
  store i32 %inc212, i32* %a, align 4
  br label %for.cond152

for.end213:                                       ; preds = %for.cond152
  %tmp214 = load i32* %lrc, align 4
  %cmp215 = icmp ne i32 %tmp214, 0
  br i1 %cmp215, label %if.then217, label %if.end228

if.then217:                                       ; preds = %for.end213
  %tmp218 = load i32* %rc, align 4
  %add219 = add nsw i32 %tmp218, 16
  store i32 %add219, i32* %rc, align 4
  %tmp220 = load %struct.defs** %pd0.addr, align 8
  %flgd221 = getelementptr inbounds %struct.defs* %tmp220, i32 0, i32 11
  %tmp222 = load i32* %flgd221, align 4
  %cmp223 = icmp ne i32 %tmp222, 0
  br i1 %cmp223, label %if.then225, label %if.end227

if.then225:                                       ; preds = %if.then217
  %call226 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @sec.s757er, i32 0, i32 0), i32 16)
  br label %if.end227

if.end227:                                        ; preds = %if.then225, %if.then217
  br label %if.end228

if.end228:                                        ; preds = %if.end227, %for.end213
  store i32* null, i32** %p, align 8
  %tmp229 = load i32** %p, align 8
  %cmp230 = icmp ne i32* %tmp229, null
  br i1 %cmp230, label %if.then232, label %if.end243

if.then232:                                       ; preds = %if.end228
  %tmp233 = load i32* %rc, align 4
  %add234 = add nsw i32 %tmp233, 32
  store i32 %add234, i32* %rc, align 4
  %tmp235 = load %struct.defs** %pd0.addr, align 8
  %flgd236 = getelementptr inbounds %struct.defs* %tmp235, i32 0, i32 11
  %tmp237 = load i32* %flgd236, align 4
  %cmp238 = icmp ne i32 %tmp237, 0
  br i1 %cmp238, label %if.then240, label %if.end242

if.then240:                                       ; preds = %if.then232
  %call241 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @sec.s757er, i32 0, i32 0), i32 32)
  br label %if.end242

if.end242:                                        ; preds = %if.then240, %if.then232
  br label %if.end243

if.end243:                                        ; preds = %if.end242, %if.end228
  %tmp244 = load i32* %rc, align 4
  ret i32 %tmp244
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
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 15, i32 0), i32 %tmp4)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %tmp6 = load i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 14), align 4
  %cmp7 = icmp eq i32 %tmp6, 0
  br i1 %cmp7, label %if.then8, label %if.else

if.then8:                                         ; preds = %if.end
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0))
  br label %if.end11

if.else:                                          ; preds = %if.end
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str3, i32 0, i32 0))
  br label %if.end11

if.end11:                                         ; preds = %if.else, %if.then8
  ret i32 0
}
