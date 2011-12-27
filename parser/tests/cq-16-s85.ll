; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/cq-16-s85.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i8, i16 }
%1 = type { i8, i32 }
%2 = type { i8, i64 }
%3 = type { i8, float }
%4 = type { i8, double }
%5 = type <{ i8, [3 x i8] }>
%struct.anon = type { i8, i8 }
%struct.defs = type { i32, i32, i32, i32, i32, i32, i32, float, float, i32, i32, i32, i32, i32, i32, [8 x i8] }
%struct.tnode = type { [20 x i8], i32, %struct.tnode*, %struct.tnode* }
%union.anon = type { [30 x i64] }

@setupTable.qs26 = internal global [8 x i8] c"s26    \00", align 1
@setupTable.s = internal global [18 x i8] c"%3d bits in %ss.\0A\00", align 16
@setupTable.s2 = internal global [54 x i8] c"%f is the least number that can be added to 1. (%s).\0A\00", align 16
@svtest.k = internal global i32 0, align 4
@zero.k = internal global i32 0, align 4
@extvar = common global i32 0, align 4
@sec.s85er = internal global [10 x i8] c"s85,er%d\0A\00", align 1
@sec.qs85 = internal global [8 x i8] c"s85    \00", align 1
@sec.type = internal global [7 x i8*] [i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str6, i32 0, i32 0)], align 16
@.str = private unnamed_addr constant [5 x i8] c"char\00", align 1
@.str1 = private unnamed_addr constant [6 x i8] c"short\00", align 1
@.str2 = private unnamed_addr constant [4 x i8] c"int\00", align 1
@.str3 = private unnamed_addr constant [5 x i8] c"long\00", align 1
@.str4 = private unnamed_addr constant [9 x i8] c"unsigned\00", align 1
@.str5 = private unnamed_addr constant [6 x i8] c"float\00", align 1
@.str6 = private unnamed_addr constant [7 x i8] c"double\00", align 1
@sec.aln = internal global [13 x i8] c" alignment: \00", align 1
@.str7 = private unnamed_addr constant [18 x i8] c"VOLATILE: %s%s%d\0A\00", align 1
@.str8 = private unnamed_addr constant [36 x i8] c"VOLATILE: Sign extension in fields\0A\00", align 1
@.str9 = private unnamed_addr constant [52 x i8] c"VOLATILE: Be especially careful with 1-bit fields!\0A\00", align 1
@main.d0 = internal global %struct.defs zeroinitializer, align 4
@main.pd0 = internal global %struct.defs* null, align 8
@.str10 = private unnamed_addr constant [25 x i8] c"Section %s returned %d.\0A\00", align 1
@.str11 = private unnamed_addr constant [22 x i8] c"\0ANo errors detected.\0A\00", align 1
@.str12 = private unnamed_addr constant [10 x i8] c"\0AFailed.\0A\00", align 1

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
  %s1 = alloca %struct.tnode, align 8
  %s2 = alloca %struct.tnode, align 8
  %sp = alloca %struct.tnode*, align 8
  %sc = alloca %struct.anon, align 1
  %ss = alloca %0, align 2
  %si = alloca %1, align 4
  %sl = alloca %2, align 8
  %su = alloca %1, align 4
  %sf = alloca %3, align 4
  %sd = alloca %4, align 8
  %diff = alloca [7 x i32], align 16
  %j = alloca i32, align 4
  %s3 = alloca %5, align 4
  %u0 = alloca %union.anon, align 8
  store %struct.defs* %pd0, %struct.defs** %pd0.addr, align 8
  store i8* getelementptr inbounds ([8 x i8]* @sec.qs85, i32 0, i32 0), i8** %ps, align 8
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
  %count = getelementptr inbounds %struct.tnode* %s1, i32 0, i32 1
  %0 = bitcast i32* %count to i8*
  %tword = getelementptr inbounds %struct.tnode* %s1, i32 0, i32 0
  %arrayidx = getelementptr inbounds [20 x i8]* %tword, i32 0, i64 0
  %sub.ptr.lhs.cast = ptrtoint i8* %0 to i64
  %sub.ptr.rhs.cast = ptrtoint i8* %arrayidx to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %cmp = icmp sle i64 %sub.ptr.sub, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.end
  %left = getelementptr inbounds %struct.tnode* %s1, i32 0, i32 2
  %1 = bitcast %struct.tnode** %left to i8*
  %count5 = getelementptr inbounds %struct.tnode* %s1, i32 0, i32 1
  %2 = bitcast i32* %count5 to i8*
  %sub.ptr.lhs.cast6 = ptrtoint i8* %1 to i64
  %sub.ptr.rhs.cast7 = ptrtoint i8* %2 to i64
  %sub.ptr.sub8 = sub i64 %sub.ptr.lhs.cast6, %sub.ptr.rhs.cast7
  %cmp9 = icmp sle i64 %sub.ptr.sub8, 0
  br i1 %cmp9, label %if.then, label %lor.lhs.false10

lor.lhs.false10:                                  ; preds = %lor.lhs.false
  %right = getelementptr inbounds %struct.tnode* %s1, i32 0, i32 3
  %3 = bitcast %struct.tnode** %right to i8*
  %left11 = getelementptr inbounds %struct.tnode* %s1, i32 0, i32 2
  %4 = bitcast %struct.tnode** %left11 to i8*
  %sub.ptr.lhs.cast12 = ptrtoint i8* %3 to i64
  %sub.ptr.rhs.cast13 = ptrtoint i8* %4 to i64
  %sub.ptr.sub14 = sub i64 %sub.ptr.lhs.cast12, %sub.ptr.rhs.cast13
  %cmp15 = icmp sle i64 %sub.ptr.sub14, 0
  br i1 %cmp15, label %if.then, label %if.end21

if.then:                                          ; preds = %lor.lhs.false10, %lor.lhs.false, %while.end
  %tmp16 = load %struct.defs** %pd0.addr, align 8
  %flgd = getelementptr inbounds %struct.defs* %tmp16, i32 0, i32 11
  %tmp17 = load i32* %flgd, align 4
  %cmp18 = icmp ne i32 %tmp17, 0
  br i1 %cmp18, label %if.then19, label %if.end

if.then19:                                        ; preds = %if.then
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s85er, i32 0, i32 0), i32 1)
  br label %if.end

if.end:                                           ; preds = %if.then19, %if.then
  %tmp20 = load i32* %rc, align 4
  %add = add nsw i32 %tmp20, 1
  store i32 %add, i32* %rc, align 4
  br label %if.end21

if.end21:                                         ; preds = %if.end, %lor.lhs.false10
  %c = getelementptr inbounds %struct.anon* %sc, i32 0, i32 1
  %cdummy = getelementptr inbounds %struct.anon* %sc, i32 0, i32 0
  %sub.ptr.lhs.cast22 = ptrtoint i8* %c to i64
  %sub.ptr.rhs.cast23 = ptrtoint i8* %cdummy to i64
  %sub.ptr.sub24 = sub i64 %sub.ptr.lhs.cast22, %sub.ptr.rhs.cast23
  %conv = trunc i64 %sub.ptr.sub24 to i32
  %arrayidx25 = getelementptr inbounds [7 x i32]* %diff, i32 0, i64 0
  store i32 %conv, i32* %arrayidx25, align 4
  %s = getelementptr inbounds %0* %ss, i32 0, i32 1
  %5 = bitcast i16* %s to i8*
  %cdummy26 = getelementptr inbounds %0* %ss, i32 0, i32 0
  %sub.ptr.lhs.cast27 = ptrtoint i8* %5 to i64
  %sub.ptr.rhs.cast28 = ptrtoint i8* %cdummy26 to i64
  %sub.ptr.sub29 = sub i64 %sub.ptr.lhs.cast27, %sub.ptr.rhs.cast28
  %conv30 = trunc i64 %sub.ptr.sub29 to i32
  %arrayidx31 = getelementptr inbounds [7 x i32]* %diff, i32 0, i64 1
  store i32 %conv30, i32* %arrayidx31, align 4
  %i = getelementptr inbounds %1* %si, i32 0, i32 1
  %6 = bitcast i32* %i to i8*
  %cdummy32 = getelementptr inbounds %1* %si, i32 0, i32 0
  %sub.ptr.lhs.cast33 = ptrtoint i8* %6 to i64
  %sub.ptr.rhs.cast34 = ptrtoint i8* %cdummy32 to i64
  %sub.ptr.sub35 = sub i64 %sub.ptr.lhs.cast33, %sub.ptr.rhs.cast34
  %conv36 = trunc i64 %sub.ptr.sub35 to i32
  %arrayidx37 = getelementptr inbounds [7 x i32]* %diff, i32 0, i64 2
  store i32 %conv36, i32* %arrayidx37, align 4
  %l = getelementptr inbounds %2* %sl, i32 0, i32 1
  %7 = bitcast i64* %l to i8*
  %cdummy38 = getelementptr inbounds %2* %sl, i32 0, i32 0
  %sub.ptr.lhs.cast39 = ptrtoint i8* %7 to i64
  %sub.ptr.rhs.cast40 = ptrtoint i8* %cdummy38 to i64
  %sub.ptr.sub41 = sub i64 %sub.ptr.lhs.cast39, %sub.ptr.rhs.cast40
  %conv42 = trunc i64 %sub.ptr.sub41 to i32
  %arrayidx43 = getelementptr inbounds [7 x i32]* %diff, i32 0, i64 3
  store i32 %conv42, i32* %arrayidx43, align 4
  %u = getelementptr inbounds %1* %su, i32 0, i32 1
  %8 = bitcast i32* %u to i8*
  %cdummy44 = getelementptr inbounds %1* %su, i32 0, i32 0
  %sub.ptr.lhs.cast45 = ptrtoint i8* %8 to i64
  %sub.ptr.rhs.cast46 = ptrtoint i8* %cdummy44 to i64
  %sub.ptr.sub47 = sub i64 %sub.ptr.lhs.cast45, %sub.ptr.rhs.cast46
  %conv48 = trunc i64 %sub.ptr.sub47 to i32
  %arrayidx49 = getelementptr inbounds [7 x i32]* %diff, i32 0, i64 4
  store i32 %conv48, i32* %arrayidx49, align 4
  %f = getelementptr inbounds %3* %sf, i32 0, i32 1
  %9 = bitcast float* %f to i8*
  %cdummy50 = getelementptr inbounds %3* %sf, i32 0, i32 0
  %sub.ptr.lhs.cast51 = ptrtoint i8* %9 to i64
  %sub.ptr.rhs.cast52 = ptrtoint i8* %cdummy50 to i64
  %sub.ptr.sub53 = sub i64 %sub.ptr.lhs.cast51, %sub.ptr.rhs.cast52
  %conv54 = trunc i64 %sub.ptr.sub53 to i32
  %arrayidx55 = getelementptr inbounds [7 x i32]* %diff, i32 0, i64 5
  store i32 %conv54, i32* %arrayidx55, align 4
  %d = getelementptr inbounds %4* %sd, i32 0, i32 1
  %10 = bitcast double* %d to i8*
  %cdummy56 = getelementptr inbounds %4* %sd, i32 0, i32 0
  %sub.ptr.lhs.cast57 = ptrtoint i8* %10 to i64
  %sub.ptr.rhs.cast58 = ptrtoint i8* %cdummy56 to i64
  %sub.ptr.sub59 = sub i64 %sub.ptr.lhs.cast57, %sub.ptr.rhs.cast58
  %conv60 = trunc i64 %sub.ptr.sub59 to i32
  %arrayidx61 = getelementptr inbounds [7 x i32]* %diff, i32 0, i64 6
  store i32 %conv60, i32* %arrayidx61, align 4
  %tmp62 = load %struct.defs** %pd0.addr, align 8
  %flgm = getelementptr inbounds %struct.defs* %tmp62, i32 0, i32 10
  %tmp63 = load i32* %flgm, align 4
  %cmp64 = icmp ne i32 %tmp63, 0
  br i1 %cmp64, label %if.then66, label %if.end79

if.then66:                                        ; preds = %if.end21
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then66
  %tmp67 = load i32* %j, align 4
  %cmp68 = icmp slt i32 %tmp67, 7
  br i1 %cmp68, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp70 = load i32* %j, align 4
  %idxprom = sext i32 %tmp70 to i64
  %arrayidx71 = getelementptr inbounds [7 x i8*]* @sec.type, i32 0, i64 %idxprom
  %tmp72 = load i8** %arrayidx71, align 8
  %tmp73 = load i32* %j, align 4
  %idxprom74 = sext i32 %tmp73 to i64
  %arrayidx75 = getelementptr inbounds [7 x i32]* %diff, i32 0, i64 %idxprom74
  %tmp76 = load i32* %arrayidx75, align 4
  %call77 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str7, i32 0, i32 0), i8* %tmp72, i8* getelementptr inbounds ([13 x i8]* @sec.aln, i32 0, i32 0), i32 %tmp76)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp78 = load i32* %j, align 4
  %inc = add nsw i32 %tmp78, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end79

if.end79:                                         ; preds = %for.end, %if.end21
  %11 = bitcast %5* %s3 to i32*
  %12 = load i32* %11, align 4
  %13 = and i32 %12, -57
  %14 = or i32 %13, 56
  store i32 %14, i32* %11, align 4
  %15 = bitcast %5* %s3 to i32*
  %16 = load i32* %15, align 4
  %17 = lshr i32 %16, 3
  %bf.clear = and i32 %17, 7
  %18 = shl i32 %bf.clear, 29
  %bf.val.sext = ashr i32 %18, 29
  %bf.value = and i32 %bf.val.sext, 3
  %19 = shl i32 %bf.value, 30
  %bf.reload.sext = ashr i32 %19, 30
  %20 = bitcast %5* %s3 to i32*
  %21 = and i32 %bf.value, 3
  %22 = load i32* %20, align 4
  %23 = and i32 %22, -4
  %24 = or i32 %23, %21
  store i32 %24, i32* %20, align 4
  %25 = bitcast %5* %s3 to i32*
  %26 = load i32* %25, align 4
  %bf.clear80 = and i32 %26, 3
  %27 = shl i32 %bf.clear80, 30
  %bf.val.sext81 = ashr i32 %27, 30
  %bf.value82 = and i32 %bf.val.sext81, 7
  %28 = shl i32 %bf.value82, 29
  %bf.reload.sext83 = ashr i32 %28, 29
  %29 = bitcast %5* %s3 to i32*
  %30 = and i32 %bf.value82, 7
  %31 = shl i32 %30, 3
  %32 = load i32* %29, align 4
  %33 = and i32 %32, -57
  %34 = or i32 %33, %31
  store i32 %34, i32* %29, align 4
  %35 = bitcast %5* %s3 to i32*
  %36 = load i32* %35, align 4
  %37 = lshr i32 %36, 3
  %bf.clear84 = and i32 %37, 7
  %38 = shl i32 %bf.clear84, 29
  %bf.val.sext85 = ashr i32 %38, 29
  %cmp86 = icmp ne i32 %bf.val.sext85, 3
  br i1 %cmp86, label %if.then88, label %if.end113

if.then88:                                        ; preds = %if.end79
  %39 = bitcast %5* %s3 to i32*
  %40 = load i32* %39, align 4
  %41 = lshr i32 %40, 3
  %bf.clear89 = and i32 %41, 7
  %42 = shl i32 %bf.clear89, 29
  %bf.val.sext90 = ashr i32 %42, 29
  %cmp91 = icmp eq i32 %bf.val.sext90, -1
  br i1 %cmp91, label %if.then93, label %if.else

if.then93:                                        ; preds = %if.then88
  %tmp94 = load %struct.defs** %pd0.addr, align 8
  %flgm95 = getelementptr inbounds %struct.defs* %tmp94, i32 0, i32 10
  %tmp96 = load i32* %flgm95, align 4
  %cmp97 = icmp ne i32 %tmp96, 0
  br i1 %cmp97, label %if.then99, label %if.end101

if.then99:                                        ; preds = %if.then93
  %call100 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str8, i32 0, i32 0))
  br label %if.end101

if.end101:                                        ; preds = %if.then99, %if.then93
  br label %if.end112

if.else:                                          ; preds = %if.then88
  %tmp102 = load %struct.defs** %pd0.addr, align 8
  %flgd103 = getelementptr inbounds %struct.defs* %tmp102, i32 0, i32 11
  %tmp104 = load i32* %flgd103, align 4
  %cmp105 = icmp ne i32 %tmp104, 0
  br i1 %cmp105, label %if.then107, label %if.end109

if.then107:                                       ; preds = %if.else
  %call108 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s85er, i32 0, i32 0), i32 2)
  br label %if.end109

if.end109:                                        ; preds = %if.then107, %if.else
  %tmp110 = load i32* %rc, align 4
  %add111 = add nsw i32 %tmp110, 2
  store i32 %add111, i32* %rc, align 4
  br label %if.end112

if.end112:                                        ; preds = %if.end109, %if.end101
  br label %if.end113

if.end113:                                        ; preds = %if.end112, %if.end79
  %43 = bitcast %5* %s3 to i32*
  %44 = load i32* %43, align 4
  %45 = and i32 %44, -65
  %46 = or i32 %45, 64
  store i32 %46, i32* %43, align 4
  %47 = bitcast %5* %s3 to i32*
  %48 = load i32* %47, align 4
  %49 = lshr i32 %48, 6
  %bf.clear114 = and i32 %49, 1
  %50 = shl i32 %bf.clear114, 31
  %bf.val.sext115 = ashr i32 %50, 31
  %cmp116 = icmp ne i32 %bf.val.sext115, 1
  br i1 %cmp116, label %if.then118, label %if.end127

if.then118:                                       ; preds = %if.end113
  %tmp119 = load %struct.defs** %pd0.addr, align 8
  %flgm120 = getelementptr inbounds %struct.defs* %tmp119, i32 0, i32 10
  %tmp121 = load i32* %flgm120, align 4
  %cmp122 = icmp ne i32 %tmp121, 0
  br i1 %cmp122, label %if.then124, label %if.end126

if.then124:                                       ; preds = %if.then118
  %call125 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([52 x i8]* @.str9, i32 0, i32 0))
  br label %if.end126

if.end126:                                        ; preds = %if.then124, %if.then118
  br label %if.end127

if.end127:                                        ; preds = %if.end126, %if.end113
  %u1 = bitcast %union.anon* %u0 to [30 x i8]*
  %arraydecay128 = getelementptr inbounds [30 x i8]* %u1, i32 0, i32 0
  %51 = bitcast %union.anon* %u0 to i8*
  %sub.ptr.lhs.cast129 = ptrtoint i8* %arraydecay128 to i64
  %sub.ptr.rhs.cast130 = ptrtoint i8* %51 to i64
  %sub.ptr.sub131 = sub i64 %sub.ptr.lhs.cast129, %sub.ptr.rhs.cast130
  %cmp132 = icmp ne i64 %sub.ptr.sub131, 0
  br i1 %cmp132, label %if.then176, label %lor.lhs.false134

lor.lhs.false134:                                 ; preds = %if.end127
  %u2 = bitcast %union.anon* %u0 to [30 x i16]*
  %arraydecay135 = getelementptr inbounds [30 x i16]* %u2, i32 0, i32 0
  %52 = bitcast i16* %arraydecay135 to i8*
  %53 = bitcast %union.anon* %u0 to i8*
  %sub.ptr.lhs.cast136 = ptrtoint i8* %52 to i64
  %sub.ptr.rhs.cast137 = ptrtoint i8* %53 to i64
  %sub.ptr.sub138 = sub i64 %sub.ptr.lhs.cast136, %sub.ptr.rhs.cast137
  %cmp139 = icmp ne i64 %sub.ptr.sub138, 0
  br i1 %cmp139, label %if.then176, label %lor.lhs.false141

lor.lhs.false141:                                 ; preds = %lor.lhs.false134
  %u3 = bitcast %union.anon* %u0 to [30 x i32]*
  %arraydecay142 = getelementptr inbounds [30 x i32]* %u3, i32 0, i32 0
  %54 = bitcast i32* %arraydecay142 to i8*
  %55 = bitcast %union.anon* %u0 to i8*
  %sub.ptr.lhs.cast143 = ptrtoint i8* %54 to i64
  %sub.ptr.rhs.cast144 = ptrtoint i8* %55 to i64
  %sub.ptr.sub145 = sub i64 %sub.ptr.lhs.cast143, %sub.ptr.rhs.cast144
  %cmp146 = icmp ne i64 %sub.ptr.sub145, 0
  br i1 %cmp146, label %if.then176, label %lor.lhs.false148

lor.lhs.false148:                                 ; preds = %lor.lhs.false141
  %u4 = bitcast %union.anon* %u0 to [30 x i64]*
  %arraydecay149 = getelementptr inbounds [30 x i64]* %u4, i32 0, i32 0
  %56 = bitcast i64* %arraydecay149 to i8*
  %57 = bitcast %union.anon* %u0 to i8*
  %sub.ptr.lhs.cast150 = ptrtoint i8* %56 to i64
  %sub.ptr.rhs.cast151 = ptrtoint i8* %57 to i64
  %sub.ptr.sub152 = sub i64 %sub.ptr.lhs.cast150, %sub.ptr.rhs.cast151
  %cmp153 = icmp ne i64 %sub.ptr.sub152, 0
  br i1 %cmp153, label %if.then176, label %lor.lhs.false155

lor.lhs.false155:                                 ; preds = %lor.lhs.false148
  %u5 = bitcast %union.anon* %u0 to [30 x i32]*
  %arraydecay156 = getelementptr inbounds [30 x i32]* %u5, i32 0, i32 0
  %58 = bitcast i32* %arraydecay156 to i8*
  %59 = bitcast %union.anon* %u0 to i8*
  %sub.ptr.lhs.cast157 = ptrtoint i8* %58 to i64
  %sub.ptr.rhs.cast158 = ptrtoint i8* %59 to i64
  %sub.ptr.sub159 = sub i64 %sub.ptr.lhs.cast157, %sub.ptr.rhs.cast158
  %cmp160 = icmp ne i64 %sub.ptr.sub159, 0
  br i1 %cmp160, label %if.then176, label %lor.lhs.false162

lor.lhs.false162:                                 ; preds = %lor.lhs.false155
  %u6 = bitcast %union.anon* %u0 to [30 x float]*
  %arraydecay163 = getelementptr inbounds [30 x float]* %u6, i32 0, i32 0
  %60 = bitcast float* %arraydecay163 to i8*
  %61 = bitcast %union.anon* %u0 to i8*
  %sub.ptr.lhs.cast164 = ptrtoint i8* %60 to i64
  %sub.ptr.rhs.cast165 = ptrtoint i8* %61 to i64
  %sub.ptr.sub166 = sub i64 %sub.ptr.lhs.cast164, %sub.ptr.rhs.cast165
  %cmp167 = icmp ne i64 %sub.ptr.sub166, 0
  br i1 %cmp167, label %if.then176, label %lor.lhs.false169

lor.lhs.false169:                                 ; preds = %lor.lhs.false162
  %u7 = bitcast %union.anon* %u0 to [30 x double]*
  %arraydecay170 = getelementptr inbounds [30 x double]* %u7, i32 0, i32 0
  %62 = bitcast double* %arraydecay170 to i8*
  %63 = bitcast %union.anon* %u0 to i8*
  %sub.ptr.lhs.cast171 = ptrtoint i8* %62 to i64
  %sub.ptr.rhs.cast172 = ptrtoint i8* %63 to i64
  %sub.ptr.sub173 = sub i64 %sub.ptr.lhs.cast171, %sub.ptr.rhs.cast172
  %cmp174 = icmp ne i64 %sub.ptr.sub173, 0
  br i1 %cmp174, label %if.then176, label %if.end187

if.then176:                                       ; preds = %lor.lhs.false169, %lor.lhs.false162, %lor.lhs.false155, %lor.lhs.false148, %lor.lhs.false141, %lor.lhs.false134, %if.end127
  %tmp177 = load %struct.defs** %pd0.addr, align 8
  %flgd178 = getelementptr inbounds %struct.defs* %tmp177, i32 0, i32 11
  %tmp179 = load i32* %flgd178, align 4
  %cmp180 = icmp ne i32 %tmp179, 0
  br i1 %cmp180, label %if.then182, label %if.end184

if.then182:                                       ; preds = %if.then176
  %call183 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s85er, i32 0, i32 0), i32 4)
  br label %if.end184

if.end184:                                        ; preds = %if.then182, %if.then176
  %tmp185 = load i32* %rc, align 4
  %add186 = add nsw i32 %tmp185, 4
  store i32 %add186, i32* %rc, align 4
  br label %if.end187

if.end187:                                        ; preds = %if.end184, %lor.lhs.false169
  %right188 = getelementptr inbounds %struct.tnode* %s1, i32 0, i32 3
  store %struct.tnode* %s2, %struct.tnode** %right188, align 8
  %tword189 = getelementptr inbounds %struct.tnode* %s2, i32 0, i32 0
  %arrayidx190 = getelementptr inbounds [20 x i8]* %tword189, i32 0, i64 0
  store i8 2, i8* %arrayidx190, align 1
  %right191 = getelementptr inbounds %struct.tnode* %s1, i32 0, i32 3
  %tmp192 = load %struct.tnode** %right191, align 8
  %tword193 = getelementptr inbounds %struct.tnode* %tmp192, i32 0, i32 0
  %arrayidx194 = getelementptr inbounds [20 x i8]* %tword193, i32 0, i64 0
  %tmp195 = load i8* %arrayidx194, align 1
  %conv196 = sext i8 %tmp195 to i32
  %add197 = add nsw i32 %conv196, 1
  %conv198 = trunc i32 %add197 to i8
  store i8 %conv198, i8* %arrayidx194, align 1
  %tword199 = getelementptr inbounds %struct.tnode* %s2, i32 0, i32 0
  %arrayidx200 = getelementptr inbounds [20 x i8]* %tword199, i32 0, i64 0
  %tmp201 = load i8* %arrayidx200, align 1
  %conv202 = sext i8 %tmp201 to i32
  %cmp203 = icmp ne i32 %conv202, 3
  br i1 %cmp203, label %if.then205, label %if.end216

if.then205:                                       ; preds = %if.end187
  %tmp206 = load %struct.defs** %pd0.addr, align 8
  %flgd207 = getelementptr inbounds %struct.defs* %tmp206, i32 0, i32 11
  %tmp208 = load i32* %flgd207, align 4
  %cmp209 = icmp ne i32 %tmp208, 0
  br i1 %cmp209, label %if.then211, label %if.end213

if.then211:                                       ; preds = %if.then205
  %call212 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s85er, i32 0, i32 0), i32 16)
  br label %if.end213

if.end213:                                        ; preds = %if.then211, %if.then205
  %tmp214 = load i32* %rc, align 4
  %add215 = add nsw i32 %tmp214, 16
  store i32 %add215, i32* %rc, align 4
  br label %if.end216

if.end216:                                        ; preds = %if.end213, %if.end187
  %tmp217 = load i32* %rc, align 4
  ret i32 %tmp217
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
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str10, i32 0, i32 0), i8* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 15, i32 0), i32 %tmp4)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %tmp6 = load i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 14), align 4
  %cmp7 = icmp eq i32 %tmp6, 0
  br i1 %cmp7, label %if.then8, label %if.else

if.then8:                                         ; preds = %if.end
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str11, i32 0, i32 0))
  br label %if.end11

if.else:                                          ; preds = %if.end
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str12, i32 0, i32 0))
  br label %if.end11

if.end11:                                         ; preds = %if.else, %if.then8
  ret i32 0
}
