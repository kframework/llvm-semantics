; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/testUnion.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i32, %union.anon }
%union.anon = type { double }

@.str = private unnamed_addr constant [23 x i8] c"This S has type INTS.\0A\00", align 1
@.str1 = private unnamed_addr constant [8 x i8] c"%d, %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"This S has type FLOATS.\0A\00", align 1
@.str3 = private unnamed_addr constant [48 x i8] c"s->u.s_floats[0] != - s->u.s_floats[1]: %f, %f\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"This S has type DOUBLE.\0A\00", align 1
@.str5 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str6 = private unnamed_addr constant [26 x i8] c"s->u.s_double is off: %f\0A\00", align 1

define void @do_something(%struct.S* %s) nounwind uwtable {
entry:
  %s.addr = alloca %struct.S*, align 8
  store %struct.S* %s, %struct.S** %s.addr, align 8
  %tmp = load %struct.S** %s.addr, align 8
  %s_type = getelementptr inbounds %struct.S* %tmp, i32 0, i32 0
  %tmp1 = load i32* %s_type, align 4
  switch i32 %tmp1, label %sw.epilog [
    i32 0, label %sw.bb
    i32 1, label %sw.bb10
    i32 2, label %sw.bb49
  ]

sw.bb:                                            ; preds = %entry
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str, i32 0, i32 0))
  %tmp2 = load %struct.S** %s.addr, align 8
  %u = getelementptr inbounds %struct.S* %tmp2, i32 0, i32 1
  %s_ints = bitcast %union.anon* %u to [2 x i32]*
  %arrayidx = getelementptr inbounds [2 x i32]* %s_ints, i32 0, i64 0
  %tmp3 = load i32* %arrayidx, align 4
  %tmp4 = load %struct.S** %s.addr, align 8
  %u5 = getelementptr inbounds %struct.S* %tmp4, i32 0, i32 1
  %s_ints6 = bitcast %union.anon* %u5 to [2 x i32]*
  %arrayidx7 = getelementptr inbounds [2 x i32]* %s_ints6, i32 0, i64 1
  %tmp8 = load i32* %arrayidx7, align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), i32 %tmp3, i32 %tmp8)
  br label %sw.epilog

sw.bb10:                                          ; preds = %entry
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i32 0, i32 0))
  %tmp12 = load %struct.S** %s.addr, align 8
  %u13 = getelementptr inbounds %struct.S* %tmp12, i32 0, i32 1
  %s_floats = bitcast %union.anon* %u13 to [2 x float]*
  %arrayidx14 = getelementptr inbounds [2 x float]* %s_floats, i32 0, i64 0
  %tmp15 = load float* %arrayidx14, align 4
  %mul = fmul float 1.000000e+04, %tmp15
  %conv = fptosi float %mul to i32
  %tmp16 = load %struct.S** %s.addr, align 8
  %u17 = getelementptr inbounds %struct.S* %tmp16, i32 0, i32 1
  %s_floats18 = bitcast %union.anon* %u17 to [2 x float]*
  %arrayidx19 = getelementptr inbounds [2 x float]* %s_floats18, i32 0, i64 1
  %tmp20 = load float* %arrayidx19, align 4
  %mul21 = fmul float 1.000000e+04, %tmp20
  %conv22 = fptosi float %mul21 to i32
  %call23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), i32 %conv, i32 %conv22)
  %tmp24 = load %struct.S** %s.addr, align 8
  %u25 = getelementptr inbounds %struct.S* %tmp24, i32 0, i32 1
  %s_floats26 = bitcast %union.anon* %u25 to [2 x float]*
  %arrayidx27 = getelementptr inbounds [2 x float]* %s_floats26, i32 0, i64 0
  %tmp28 = load float* %arrayidx27, align 4
  %tmp29 = load %struct.S** %s.addr, align 8
  %u30 = getelementptr inbounds %struct.S* %tmp29, i32 0, i32 1
  %s_floats31 = bitcast %union.anon* %u30 to [2 x float]*
  %arrayidx32 = getelementptr inbounds [2 x float]* %s_floats31, i32 0, i64 1
  %tmp33 = load float* %arrayidx32, align 4
  %sub = fsub float -0.000000e+00, %tmp33
  %cmp = fcmp une float %tmp28, %sub
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %sw.bb10
  %tmp35 = load %struct.S** %s.addr, align 8
  %u36 = getelementptr inbounds %struct.S* %tmp35, i32 0, i32 1
  %s_floats37 = bitcast %union.anon* %u36 to [2 x float]*
  %arrayidx38 = getelementptr inbounds [2 x float]* %s_floats37, i32 0, i64 0
  %tmp39 = load float* %arrayidx38, align 4
  %conv40 = fpext float %tmp39 to double
  %tmp41 = load %struct.S** %s.addr, align 8
  %u42 = getelementptr inbounds %struct.S* %tmp41, i32 0, i32 1
  %s_floats43 = bitcast %union.anon* %u42 to [2 x float]*
  %arrayidx44 = getelementptr inbounds [2 x float]* %s_floats43, i32 0, i64 1
  %tmp45 = load float* %arrayidx44, align 4
  %sub46 = fsub float -0.000000e+00, %tmp45
  %conv47 = fpext float %sub46 to double
  %call48 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([48 x i8]* @.str3, i32 0, i32 0), double %conv40, double %conv47)
  br label %if.end

if.end:                                           ; preds = %if.then, %sw.bb10
  br label %sw.epilog

sw.bb49:                                          ; preds = %entry
  %call50 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i32 0, i32 0))
  %tmp51 = load %struct.S** %s.addr, align 8
  %u52 = getelementptr inbounds %struct.S* %tmp51, i32 0, i32 1
  %s_double = bitcast %union.anon* %u52 to double*
  %tmp53 = load double* %s_double, align 8
  %mul54 = fmul double 1.000000e+04, %tmp53
  %conv55 = fptosi double %mul54 to i32
  %call56 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str5, i32 0, i32 0), i32 %conv55)
  %tmp57 = load %struct.S** %s.addr, align 8
  %u58 = getelementptr inbounds %struct.S* %tmp57, i32 0, i32 1
  %s_double59 = bitcast %union.anon* %u58 to double*
  %tmp60 = load double* %s_double59, align 8
  %cmp61 = fcmp ogt double %tmp60, 1.570800e+00
  br i1 %cmp61, label %if.then69, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %sw.bb49
  %tmp63 = load %struct.S** %s.addr, align 8
  %u64 = getelementptr inbounds %struct.S* %tmp63, i32 0, i32 1
  %s_double65 = bitcast %union.anon* %u64 to double*
  %tmp66 = load double* %s_double65, align 8
  %cmp67 = fcmp olt double %tmp66, 1.570790e+00
  br i1 %cmp67, label %if.then69, label %if.end75

if.then69:                                        ; preds = %lor.lhs.false, %sw.bb49
  %tmp70 = load %struct.S** %s.addr, align 8
  %u71 = getelementptr inbounds %struct.S* %tmp70, i32 0, i32 1
  %s_double72 = bitcast %union.anon* %u71 to double*
  %tmp73 = load double* %s_double72, align 8
  %call74 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str6, i32 0, i32 0), double %tmp73)
  br label %if.end75

if.end75:                                         ; preds = %if.then69, %lor.lhs.false
  br label %sw.epilog

sw.epilog:                                        ; preds = %entry, %if.end75, %if.end, %sw.bb
  ret void
}

declare i32 @printf(i8*, ...)

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %esses = alloca [3 x %struct.S], align 16
  %numEsses = alloca i32, align 4
  %newStruct = alloca %struct.S, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 3, i32* %numEsses, align 4
  %arrayidx = getelementptr inbounds [3 x %struct.S]* %esses, i32 0, i64 0
  %s_type = getelementptr inbounds %struct.S* %arrayidx, i32 0, i32 0
  store i32 0, i32* %s_type, align 4
  %arrayidx1 = getelementptr inbounds [3 x %struct.S]* %esses, i32 0, i64 0
  %u = getelementptr inbounds %struct.S* %arrayidx1, i32 0, i32 1
  %s_ints = bitcast %union.anon* %u to [2 x i32]*
  %arrayidx2 = getelementptr inbounds [2 x i32]* %s_ints, i32 0, i64 0
  store i32 2123456789, i32* %arrayidx2, align 4
  %arrayidx3 = getelementptr inbounds [3 x %struct.S]* %esses, i32 0, i64 0
  %u4 = getelementptr inbounds %struct.S* %arrayidx3, i32 0, i32 1
  %s_ints5 = bitcast %union.anon* %u4 to [2 x i32]*
  %arrayidx6 = getelementptr inbounds [2 x i32]* %s_ints5, i32 0, i64 1
  store i32 -2123456789, i32* %arrayidx6, align 4
  %arrayidx7 = getelementptr inbounds [3 x %struct.S]* %esses, i32 0, i64 1
  %s_type8 = getelementptr inbounds %struct.S* %arrayidx7, i32 0, i32 0
  store i32 1, i32* %s_type8, align 4
  %arrayidx9 = getelementptr inbounds [3 x %struct.S]* %esses, i32 0, i64 1
  %u10 = getelementptr inbounds %struct.S* %arrayidx9, i32 0, i32 1
  %s_floats = bitcast %union.anon* %u10 to [2 x float]*
  %arrayidx11 = getelementptr inbounds [2 x float]* %s_floats, i32 0, i64 0
  store float 0x400921FB60000000, float* %arrayidx11, align 4
  %arrayidx12 = getelementptr inbounds [3 x %struct.S]* %esses, i32 0, i64 1
  %u13 = getelementptr inbounds %struct.S* %arrayidx12, i32 0, i32 1
  %s_floats14 = bitcast %union.anon* %u13 to [2 x float]*
  %arrayidx15 = getelementptr inbounds [2 x float]* %s_floats14, i32 0, i64 1
  store float 0xC00921FB60000000, float* %arrayidx15, align 4
  %arrayidx16 = getelementptr inbounds [3 x %struct.S]* %esses, i32 0, i64 2
  %s_type17 = getelementptr inbounds %struct.S* %arrayidx16, i32 0, i32 0
  store i32 2, i32* %s_type17, align 4
  %arrayidx18 = getelementptr inbounds [3 x %struct.S]* %esses, i32 0, i64 2
  %u19 = getelementptr inbounds %struct.S* %arrayidx18, i32 0, i32 1
  %s_double = bitcast %union.anon* %u19 to double*
  store double 0x3FF921FB54442D11, double* %s_double, align 8
  %arrayidx20 = getelementptr inbounds [3 x %struct.S]* %esses, i32 0, i64 1
  %tmp = bitcast %struct.S* %newStruct to i8*
  %tmp21 = bitcast %struct.S* %arrayidx20 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* %tmp21, i64 16, i32 8, i1 false)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp23 = load i32* %i, align 4
  %tmp24 = load i32* %numEsses, align 4
  %cmp = icmp slt i32 %tmp23, %tmp24
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp25 = load i32* %i, align 4
  %idxprom = sext i32 %tmp25 to i64
  %arrayidx26 = getelementptr inbounds [3 x %struct.S]* %esses, i32 0, i64 %idxprom
  call void @do_something(%struct.S* %arrayidx26)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp27 = load i32* %i, align 4
  %inc = add nsw i32 %tmp27, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind
