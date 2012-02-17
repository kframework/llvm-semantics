; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/cq-03-s243.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.defs = type { i32, i32, i32, i32, i32, i32, i32, float, float, i32, i32, i32, i32, i32, i32, [8 x i8] }

@setupTable.qs26 = internal global [8 x i8] c"s26    \00", align 1
@setupTable.s = internal global [18 x i8] c"%3d bits in %ss.\0A\00", align 16
@setupTable.s2 = internal global [54 x i8] c"%f is the least number that can be added to 1. (%s).\0A\00", align 16
@svtest.k = internal global i32 0, align 4
@zero.k = internal global i32 0, align 4
@extvar = common global i32 0, align 4
@sec.s243er = internal global [11 x i8] c"s243,er%d\0A\00", align 1
@sec.qs243 = internal global [8 x i8] c"s243   \00", align 1
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
  %ps = alloca i8*, align 8
  %pt = alloca i8*, align 8
  %rc = alloca i32, align 4
  %chars = alloca [256 x i8], align 16
  store %struct.defs* %pd0, %struct.defs** %pd0.addr, align 8
  store i32 0, i32* %rc, align 4
  store i8* getelementptr inbounds ([8 x i8]* @sec.qs243, i32 0, i32 0), i8** %ps, align 8
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
  %arraydecay5 = getelementptr inbounds [256 x i8]* %chars, i32 0, i32 0
  call void @zerofill(i8* %arraydecay5)
  %arrayidx = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 97
  store i8 1, i8* %arrayidx, align 1
  %arrayidx6 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 65
  store i8 1, i8* %arrayidx6, align 1
  %arrayidx7 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 126
  store i8 1, i8* %arrayidx7, align 1
  %arrayidx8 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 48
  store i8 1, i8* %arrayidx8, align 1
  %arrayidx9 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 98
  store i8 1, i8* %arrayidx9, align 1
  %arrayidx10 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 66
  store i8 1, i8* %arrayidx10, align 1
  %arrayidx11 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 33
  store i8 1, i8* %arrayidx11, align 1
  %arrayidx12 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 49
  store i8 1, i8* %arrayidx12, align 1
  %arrayidx13 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 99
  store i8 1, i8* %arrayidx13, align 1
  %arrayidx14 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 67
  store i8 1, i8* %arrayidx14, align 1
  %arrayidx15 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 34
  store i8 1, i8* %arrayidx15, align 1
  %arrayidx16 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 50
  store i8 1, i8* %arrayidx16, align 1
  %arrayidx17 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 100
  store i8 1, i8* %arrayidx17, align 1
  %arrayidx18 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 68
  store i8 1, i8* %arrayidx18, align 1
  %arrayidx19 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 35
  store i8 1, i8* %arrayidx19, align 1
  %arrayidx20 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 51
  store i8 1, i8* %arrayidx20, align 1
  %arrayidx21 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 101
  store i8 1, i8* %arrayidx21, align 1
  %arrayidx22 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 69
  store i8 1, i8* %arrayidx22, align 1
  %arrayidx23 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 37
  store i8 1, i8* %arrayidx23, align 1
  %arrayidx24 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 52
  store i8 1, i8* %arrayidx24, align 1
  %arrayidx25 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 102
  store i8 1, i8* %arrayidx25, align 1
  %arrayidx26 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 70
  store i8 1, i8* %arrayidx26, align 1
  %arrayidx27 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 38
  store i8 1, i8* %arrayidx27, align 1
  %arrayidx28 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 53
  store i8 1, i8* %arrayidx28, align 1
  %arrayidx29 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 103
  store i8 1, i8* %arrayidx29, align 1
  %arrayidx30 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 71
  store i8 1, i8* %arrayidx30, align 1
  %arrayidx31 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 40
  store i8 1, i8* %arrayidx31, align 1
  %arrayidx32 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 54
  store i8 1, i8* %arrayidx32, align 1
  %arrayidx33 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 104
  store i8 1, i8* %arrayidx33, align 1
  %arrayidx34 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 72
  store i8 1, i8* %arrayidx34, align 1
  %arrayidx35 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 41
  store i8 1, i8* %arrayidx35, align 1
  %arrayidx36 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 55
  store i8 1, i8* %arrayidx36, align 1
  %arrayidx37 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 105
  store i8 1, i8* %arrayidx37, align 1
  %arrayidx38 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 73
  store i8 1, i8* %arrayidx38, align 1
  %arrayidx39 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 95
  store i8 1, i8* %arrayidx39, align 1
  %arrayidx40 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 56
  store i8 1, i8* %arrayidx40, align 1
  %arrayidx41 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 106
  store i8 1, i8* %arrayidx41, align 1
  %arrayidx42 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 74
  store i8 1, i8* %arrayidx42, align 1
  %arrayidx43 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 61
  store i8 1, i8* %arrayidx43, align 1
  %arrayidx44 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 57
  store i8 1, i8* %arrayidx44, align 1
  %arrayidx45 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 107
  store i8 1, i8* %arrayidx45, align 1
  %arrayidx46 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 75
  store i8 1, i8* %arrayidx46, align 1
  %arrayidx47 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 45
  store i8 1, i8* %arrayidx47, align 1
  %arrayidx48 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 108
  store i8 1, i8* %arrayidx48, align 1
  %arrayidx49 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 76
  store i8 1, i8* %arrayidx49, align 1
  %arrayidx50 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 94
  store i8 1, i8* %arrayidx50, align 1
  %arrayidx51 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 109
  store i8 1, i8* %arrayidx51, align 1
  %arrayidx52 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 77
  store i8 1, i8* %arrayidx52, align 1
  %arrayidx53 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 124
  store i8 1, i8* %arrayidx53, align 1
  %arrayidx54 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 10
  store i8 1, i8* %arrayidx54, align 1
  %arrayidx55 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 110
  store i8 1, i8* %arrayidx55, align 1
  %arrayidx56 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 78
  store i8 1, i8* %arrayidx56, align 1
  %arrayidx57 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 9
  store i8 1, i8* %arrayidx57, align 1
  %arrayidx58 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 111
  store i8 1, i8* %arrayidx58, align 1
  %arrayidx59 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 79
  store i8 1, i8* %arrayidx59, align 1
  %arrayidx60 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 123
  store i8 1, i8* %arrayidx60, align 1
  %arrayidx61 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 8
  store i8 1, i8* %arrayidx61, align 1
  %arrayidx62 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 112
  store i8 1, i8* %arrayidx62, align 1
  %arrayidx63 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 80
  store i8 1, i8* %arrayidx63, align 1
  %arrayidx64 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 125
  store i8 1, i8* %arrayidx64, align 1
  %arrayidx65 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 13
  store i8 1, i8* %arrayidx65, align 1
  %arrayidx66 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 113
  store i8 1, i8* %arrayidx66, align 1
  %arrayidx67 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 81
  store i8 1, i8* %arrayidx67, align 1
  %arrayidx68 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 91
  store i8 1, i8* %arrayidx68, align 1
  %arrayidx69 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 12
  store i8 1, i8* %arrayidx69, align 1
  %arrayidx70 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 114
  store i8 1, i8* %arrayidx70, align 1
  %arrayidx71 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 82
  store i8 1, i8* %arrayidx71, align 1
  %arrayidx72 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 93
  store i8 1, i8* %arrayidx72, align 1
  %arrayidx73 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 115
  store i8 1, i8* %arrayidx73, align 1
  %arrayidx74 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 83
  store i8 1, i8* %arrayidx74, align 1
  %arrayidx75 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 43
  store i8 1, i8* %arrayidx75, align 1
  %arrayidx76 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 92
  store i8 1, i8* %arrayidx76, align 1
  %arrayidx77 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 116
  store i8 1, i8* %arrayidx77, align 1
  %arrayidx78 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 84
  store i8 1, i8* %arrayidx78, align 1
  %arrayidx79 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 59
  store i8 1, i8* %arrayidx79, align 1
  %arrayidx80 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 39
  store i8 1, i8* %arrayidx80, align 1
  %arrayidx81 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 117
  store i8 1, i8* %arrayidx81, align 1
  %arrayidx82 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 85
  store i8 1, i8* %arrayidx82, align 1
  %arrayidx83 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 42
  store i8 1, i8* %arrayidx83, align 1
  %arrayidx84 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 118
  store i8 1, i8* %arrayidx84, align 1
  %arrayidx85 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 86
  store i8 1, i8* %arrayidx85, align 1
  %arrayidx86 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 58
  store i8 1, i8* %arrayidx86, align 1
  %arrayidx87 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 0
  store i8 1, i8* %arrayidx87, align 1
  %arrayidx88 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 119
  store i8 1, i8* %arrayidx88, align 1
  %arrayidx89 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 87
  store i8 1, i8* %arrayidx89, align 1
  %arrayidx90 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 60
  store i8 1, i8* %arrayidx90, align 1
  %arrayidx91 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 32
  store i8 1, i8* %arrayidx91, align 1
  %arrayidx92 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 120
  store i8 1, i8* %arrayidx92, align 1
  %arrayidx93 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 88
  store i8 1, i8* %arrayidx93, align 1
  %arrayidx94 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 62
  store i8 1, i8* %arrayidx94, align 1
  %arrayidx95 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 121
  store i8 1, i8* %arrayidx95, align 1
  %arrayidx96 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 89
  store i8 1, i8* %arrayidx96, align 1
  %arrayidx97 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 44
  store i8 1, i8* %arrayidx97, align 1
  %arrayidx98 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 122
  store i8 1, i8* %arrayidx98, align 1
  %arrayidx99 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 90
  store i8 1, i8* %arrayidx99, align 1
  %arrayidx100 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 46
  store i8 1, i8* %arrayidx100, align 1
  %arrayidx101 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 63
  store i8 1, i8* %arrayidx101, align 1
  %arrayidx102 = getelementptr inbounds [256 x i8]* %chars, i32 0, i64 47
  store i8 1, i8* %arrayidx102, align 1
  %arraydecay103 = getelementptr inbounds [256 x i8]* %chars, i32 0, i32 0
  %call = call i32 @sumof(i8* %arraydecay103)
  %cmp = icmp ne i32 %call, 98
  br i1 %cmp, label %if.then, label %if.end110

if.then:                                          ; preds = %while.end
  %tmp104 = load i32* %rc, align 4
  %add = add nsw i32 %tmp104, 1
  store i32 %add, i32* %rc, align 4
  %tmp105 = load %struct.defs** %pd0.addr, align 8
  %flgd = getelementptr inbounds %struct.defs* %tmp105, i32 0, i32 11
  %tmp106 = load i32* %flgd, align 4
  %cmp107 = icmp ne i32 %tmp106, 0
  br i1 %cmp107, label %if.then108, label %if.end

if.then108:                                       ; preds = %if.then
  %call109 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @sec.s243er, i32 0, i32 0), i32 1)
  br label %if.end

if.end:                                           ; preds = %if.then108, %if.then
  br label %if.end110

if.end110:                                        ; preds = %if.end, %while.end
  %tmp111 = load i32* %rc, align 4
  ret i32 %tmp111
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
