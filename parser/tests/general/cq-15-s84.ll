; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/cq-15-s84.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.defs = type { i32, i32, i32, i32, i32, i32, i32, float, float, i32, i32, i32, i32, i32, i32, [8 x i8] }

@setupTable.qs26 = internal global [8 x i8] c"s26    \00", align 1
@setupTable.s = internal global [18 x i8] c"%3d bits in %ss.\0A\00", align 16
@setupTable.s2 = internal global [54 x i8] c"%f is the least number that can be added to 1. (%s).\0A\00", align 16
@svtest.k = internal global i32 0, align 4
@zero.k = internal global i32 0, align 4
@extvar = common global i32 0, align 4
@sec.x3d = internal global [3 x [5 x [7 x i32]]] zeroinitializer, align 16
@sec.s84er = internal global [10 x i8] c"s84,er%d\0A\00", align 1
@sec.qs84 = internal global [8 x i8] c"s84    \00", align 1
@fip.y = internal global i32 0, align 4
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
  %ip = alloca i32*, align 8
  %i = alloca i32, align 4
  %pfi = alloca i32 (...)*, align 8
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %fa = alloca [17 x float], align 16
  %afp = alloca [17 x float*], align 16
  %sum = alloca float, align 4
  %rc = alloca i32, align 4
  %ps = alloca i8*, align 8
  %pt = alloca i8*, align 8
  store %struct.defs* %pd0, %struct.defs** %pd0.addr, align 8
  store i8* getelementptr inbounds ([8 x i8]* @sec.qs84, i32 0, i32 0), i8** %ps, align 8
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
  %call = call i32* (...)* bitcast (i32* (i32)* @fip to i32* (...)*)(i32 3)
  store i32* %call, i32** %ip, align 8
  %tmp5 = load i32** %ip, align 8
  %tmp6 = load i32* %tmp5
  %cmp = icmp ne i32 %tmp6, 3
  br i1 %cmp, label %if.then, label %if.end13

if.then:                                          ; preds = %while.end
  %tmp7 = load %struct.defs** %pd0.addr, align 8
  %flgd = getelementptr inbounds %struct.defs* %tmp7, i32 0, i32 11
  %tmp8 = load i32* %flgd, align 4
  %cmp9 = icmp ne i32 %tmp8, 0
  br i1 %cmp9, label %if.then10, label %if.end

if.then10:                                        ; preds = %if.then
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s84er, i32 0, i32 0), i32 1)
  br label %if.end

if.end:                                           ; preds = %if.then10, %if.then
  %tmp12 = load i32* %rc, align 4
  %add = add nsw i32 %tmp12, 1
  store i32 %add, i32* %rc, align 4
  br label %if.end13

if.end13:                                         ; preds = %if.end, %while.end
  store i32 (...)* bitcast (i32 (i32)* @glork to i32 (...)*), i32 (...)** %pfi, align 8
  %tmp14 = load i32 (...)** %pfi, align 8
  %call15 = call i32 (...)* %tmp14(i32 4)
  %cmp16 = icmp ne i32 %call15, 4
  br i1 %cmp16, label %if.then17, label %if.end27

if.then17:                                        ; preds = %if.end13
  %tmp18 = load %struct.defs** %pd0.addr, align 8
  %flgd19 = getelementptr inbounds %struct.defs* %tmp18, i32 0, i32 11
  %tmp20 = load i32* %flgd19, align 4
  %cmp21 = icmp ne i32 %tmp20, 0
  br i1 %cmp21, label %if.then22, label %if.end24

if.then22:                                        ; preds = %if.then17
  %call23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s84er, i32 0, i32 0), i32 2)
  br label %if.end24

if.end24:                                         ; preds = %if.then22, %if.then17
  %tmp25 = load i32* %rc, align 4
  %add26 = add nsw i32 %tmp25, 2
  store i32 %add26, i32* %rc, align 4
  br label %if.end27

if.end27:                                         ; preds = %if.end24, %if.end13
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end27
  %tmp28 = load i32* %j, align 4
  %cmp29 = icmp slt i32 %tmp28, 17
  br i1 %cmp29, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp30 = load i32* %j, align 4
  %conv = sitofp i32 %tmp30 to float
  %tmp31 = load i32* %j, align 4
  %idxprom = sext i32 %tmp31 to i64
  %arrayidx = getelementptr inbounds [17 x float]* %fa, i32 0, i64 %idxprom
  store float %conv, float* %arrayidx, align 4
  %tmp32 = load i32* %j, align 4
  %idxprom33 = sext i32 %tmp32 to i64
  %arrayidx34 = getelementptr inbounds [17 x float]* %fa, i32 0, i64 %idxprom33
  %tmp35 = load i32* %j, align 4
  %idxprom36 = sext i32 %tmp35 to i64
  %arrayidx37 = getelementptr inbounds [17 x float*]* %afp, i32 0, i64 %idxprom36
  store float* %arrayidx34, float** %arrayidx37, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp38 = load i32* %j, align 4
  %inc = add nsw i32 %tmp38, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store float 0.000000e+00, float* %sum, align 4
  store i32 0, i32* %j, align 4
  br label %for.cond39

for.cond39:                                       ; preds = %for.inc51, %for.end
  %tmp40 = load i32* %j, align 4
  %cmp41 = icmp slt i32 %tmp40, 17
  br i1 %cmp41, label %for.body43, label %for.end54

for.body43:                                       ; preds = %for.cond39
  %tmp44 = load i32* %j, align 4
  %idxprom45 = sext i32 %tmp44 to i64
  %arrayidx46 = getelementptr inbounds [17 x float*]* %afp, i32 0, i64 %idxprom45
  %tmp47 = load float** %arrayidx46, align 8
  %tmp48 = load float* %tmp47
  %tmp49 = load float* %sum, align 4
  %add50 = fadd float %tmp49, %tmp48
  store float %add50, float* %sum, align 4
  br label %for.inc51

for.inc51:                                        ; preds = %for.body43
  %tmp52 = load i32* %j, align 4
  %inc53 = add nsw i32 %tmp52, 1
  store i32 %inc53, i32* %j, align 4
  br label %for.cond39

for.end54:                                        ; preds = %for.cond39
  %tmp55 = load float* %sum, align 4
  %cmp56 = fcmp une float %tmp55, 1.360000e+02
  br i1 %cmp56, label %if.then58, label %if.end69

if.then58:                                        ; preds = %for.end54
  %tmp59 = load %struct.defs** %pd0.addr, align 8
  %flgd60 = getelementptr inbounds %struct.defs* %tmp59, i32 0, i32 11
  %tmp61 = load i32* %flgd60, align 4
  %cmp62 = icmp ne i32 %tmp61, 0
  br i1 %cmp62, label %if.then64, label %if.end66

if.then64:                                        ; preds = %if.then58
  %call65 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s84er, i32 0, i32 0), i32 4)
  br label %if.end66

if.end66:                                         ; preds = %if.then64, %if.then58
  %tmp67 = load i32* %rc, align 4
  %add68 = add nsw i32 %tmp67, 4
  store i32 %add68, i32* %rc, align 4
  br label %if.end69

if.end69:                                         ; preds = %if.end66, %for.end54
  store i32 0, i32* %i, align 4
  br label %for.cond70

for.cond70:                                       ; preds = %for.inc108, %if.end69
  %tmp71 = load i32* %i, align 4
  %cmp72 = icmp slt i32 %tmp71, 3
  br i1 %cmp72, label %for.body74, label %for.end111

for.body74:                                       ; preds = %for.cond70
  store i32 0, i32* %j, align 4
  br label %for.cond75

for.cond75:                                       ; preds = %for.inc104, %for.body74
  %tmp76 = load i32* %j, align 4
  %cmp77 = icmp slt i32 %tmp76, 5
  br i1 %cmp77, label %for.body79, label %for.end107

for.body79:                                       ; preds = %for.cond75
  store i32 0, i32* %k, align 4
  br label %for.cond80

for.cond80:                                       ; preds = %for.inc100, %for.body79
  %tmp81 = load i32* %k, align 4
  %cmp82 = icmp slt i32 %tmp81, 7
  br i1 %cmp82, label %for.body84, label %for.end103

for.body84:                                       ; preds = %for.cond80
  %tmp85 = load i32* %i, align 4
  %mul = mul nsw i32 %tmp85, 35
  %tmp86 = load i32* %j, align 4
  %mul87 = mul nsw i32 %tmp86, 7
  %add88 = add nsw i32 %mul, %mul87
  %tmp89 = load i32* %k, align 4
  %add90 = add nsw i32 %add88, %tmp89
  %tmp91 = load i32* %k, align 4
  %idxprom92 = sext i32 %tmp91 to i64
  %tmp93 = load i32* %j, align 4
  %idxprom94 = sext i32 %tmp93 to i64
  %tmp95 = load i32* %i, align 4
  %idxprom96 = sext i32 %tmp95 to i64
  %arrayidx97 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i32 0, i64 %idxprom96
  %arrayidx98 = getelementptr inbounds [5 x [7 x i32]]* %arrayidx97, i32 0, i64 %idxprom94
  %arrayidx99 = getelementptr inbounds [7 x i32]* %arrayidx98, i32 0, i64 %idxprom92
  store i32 %add90, i32* %arrayidx99, align 4
  br label %for.inc100

for.inc100:                                       ; preds = %for.body84
  %tmp101 = load i32* %k, align 4
  %inc102 = add nsw i32 %tmp101, 1
  store i32 %inc102, i32* %k, align 4
  br label %for.cond80

for.end103:                                       ; preds = %for.cond80
  br label %for.inc104

for.inc104:                                       ; preds = %for.end103
  %tmp105 = load i32* %j, align 4
  %inc106 = add nsw i32 %tmp105, 1
  store i32 %inc106, i32* %j, align 4
  br label %for.cond75

for.end107:                                       ; preds = %for.cond75
  br label %for.inc108

for.inc108:                                       ; preds = %for.end107
  %tmp109 = load i32* %i, align 4
  %inc110 = add nsw i32 %tmp109, 1
  store i32 %inc110, i32* %i, align 4
  br label %for.cond70

for.end111:                                       ; preds = %for.cond70
  store i32 1, i32* %i, align 4
  store i32 2, i32* %j, align 4
  store i32 3, i32* %k, align 4
  %call112 = call i32 (...)* bitcast (i32 (i32*, i32, i32)* @array to i32 (...)*)([5 x [7 x i32]]* getelementptr inbounds ([3 x [5 x [7 x i32]]]* @sec.x3d, i32 0, i32 0), i32 105, i32 0)
  %tmp113 = load i32* %i, align 4
  %idxprom114 = sext i32 %tmp113 to i64
  %arrayidx115 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i32 0, i64 %idxprom114
  %arraydecay116 = getelementptr inbounds [5 x [7 x i32]]* %arrayidx115, i32 0, i32 0
  %call117 = call i32 (...)* bitcast (i32 (i32*, i32, i32)* @array to i32 (...)*)([7 x i32]* %arraydecay116, i32 35, i32 35)
  %add118 = add nsw i32 %call112, %call117
  %tmp119 = load i32* %j, align 4
  %idxprom120 = sext i32 %tmp119 to i64
  %tmp121 = load i32* %i, align 4
  %idxprom122 = sext i32 %tmp121 to i64
  %arrayidx123 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i32 0, i64 %idxprom122
  %arrayidx124 = getelementptr inbounds [5 x [7 x i32]]* %arrayidx123, i32 0, i64 %idxprom120
  %arraydecay125 = getelementptr inbounds [7 x i32]* %arrayidx124, i32 0, i32 0
  %call126 = call i32 (...)* bitcast (i32 (i32*, i32, i32)* @array to i32 (...)*)(i32* %arraydecay125, i32 7, i32 49)
  %add127 = add nsw i32 %add118, %call126
  %tmp128 = load i32* %k, align 4
  %idxprom129 = sext i32 %tmp128 to i64
  %tmp130 = load i32* %j, align 4
  %idxprom131 = sext i32 %tmp130 to i64
  %tmp132 = load i32* %i, align 4
  %idxprom133 = sext i32 %tmp132 to i64
  %arrayidx134 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i32 0, i64 %idxprom133
  %arrayidx135 = getelementptr inbounds [5 x [7 x i32]]* %arrayidx134, i32 0, i64 %idxprom131
  %arrayidx136 = getelementptr inbounds [7 x i32]* %arrayidx135, i32 0, i64 %idxprom129
  %tmp137 = load i32* %arrayidx136, align 4
  %add138 = add nsw i32 %add127, %tmp137
  %sub = sub nsw i32 %add138, 52
  %tobool139 = icmp ne i32 %sub, 0
  br i1 %tobool139, label %if.then140, label %if.end151

if.then140:                                       ; preds = %for.end111
  %tmp141 = load %struct.defs** %pd0.addr, align 8
  %flgd142 = getelementptr inbounds %struct.defs* %tmp141, i32 0, i32 11
  %tmp143 = load i32* %flgd142, align 4
  %cmp144 = icmp ne i32 %tmp143, 0
  br i1 %cmp144, label %if.then146, label %if.end148

if.then146:                                       ; preds = %if.then140
  %call147 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s84er, i32 0, i32 0), i32 8)
  br label %if.end148

if.end148:                                        ; preds = %if.then146, %if.then140
  %tmp149 = load i32* %rc, align 4
  %add150 = add nsw i32 %tmp149, 8
  store i32 %add150, i32* %rc, align 4
  br label %if.end151

if.end151:                                        ; preds = %if.end148, %for.end111
  %tmp152 = load i32* %rc, align 4
  ret i32 %tmp152
}

declare i32 @printf(i8*, ...)

define i32 @glork(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %tmp = load i32* %x.addr, align 4
  ret i32 %tmp
}

define i32 @array(i32* %a, i32 %size, i32 %start) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32*, align 8
  %size.addr = alloca i32, align 4
  %start.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %a, i32** %a.addr, align 8
  store i32 %size, i32* %size.addr, align 4
  store i32 %start, i32* %start.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %tmp1 = load i32* %size.addr, align 4
  %cmp = icmp slt i32 %tmp, %tmp1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = load i32* %i, align 4
  %idxprom = sext i32 %tmp2 to i64
  %tmp3 = load i32** %a.addr, align 8
  %arrayidx = getelementptr inbounds i32* %tmp3, i64 %idxprom
  %tmp4 = load i32* %arrayidx
  %tmp5 = load i32* %i, align 4
  %tmp6 = load i32* %start.addr, align 4
  %add = add nsw i32 %tmp5, %tmp6
  %cmp7 = icmp ne i32 %tmp4, %add
  br i1 %cmp7, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp8 = load i32* %i, align 4
  %inc = add nsw i32 %tmp8, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %for.end, %if.then
  %0 = load i32* %retval
  ret i32 %0
}

define i32* @fip(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %tmp = load i32* %x.addr, align 4
  store i32 %tmp, i32* @fip.y, align 4
  ret i32* @fip.y
}

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
