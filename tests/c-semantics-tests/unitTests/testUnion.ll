; ModuleID = '/home/david/src/c-semantics/tests/unitTests/testUnion.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
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
  %0 = load %struct.S** %s.addr, align 8
  %s_type = getelementptr inbounds %struct.S* %0, i32 0, i32 0
  %1 = load i32* %s_type, align 4
  switch i32 %1, label %sw.epilog [
    i32 0, label %sw.bb
    i32 1, label %sw.bb5
    i32 2, label %sw.bb32
  ]

sw.bb:                                            ; preds = %entry
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str, i32 0, i32 0))
  %2 = load %struct.S** %s.addr, align 8
  %u = getelementptr inbounds %struct.S* %2, i32 0, i32 1
  %s_ints = bitcast %union.anon* %u to [2 x i32]*
  %arrayidx = getelementptr inbounds [2 x i32]* %s_ints, i32 0, i64 0
  %3 = load i32* %arrayidx, align 4
  %4 = load %struct.S** %s.addr, align 8
  %u1 = getelementptr inbounds %struct.S* %4, i32 0, i32 1
  %s_ints2 = bitcast %union.anon* %u1 to [2 x i32]*
  %arrayidx3 = getelementptr inbounds [2 x i32]* %s_ints2, i32 0, i64 1
  %5 = load i32* %arrayidx3, align 4
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), i32 %3, i32 %5)
  br label %sw.epilog

sw.bb5:                                           ; preds = %entry
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i32 0, i32 0))
  %6 = load %struct.S** %s.addr, align 8
  %u7 = getelementptr inbounds %struct.S* %6, i32 0, i32 1
  %s_floats = bitcast %union.anon* %u7 to [2 x float]*
  %arrayidx8 = getelementptr inbounds [2 x float]* %s_floats, i32 0, i64 0
  %7 = load float* %arrayidx8, align 4
  %mul = fmul float 1.000000e+04, %7
  %conv = fptosi float %mul to i32
  %8 = load %struct.S** %s.addr, align 8
  %u9 = getelementptr inbounds %struct.S* %8, i32 0, i32 1
  %s_floats10 = bitcast %union.anon* %u9 to [2 x float]*
  %arrayidx11 = getelementptr inbounds [2 x float]* %s_floats10, i32 0, i64 1
  %9 = load float* %arrayidx11, align 4
  %mul12 = fmul float 1.000000e+04, %9
  %conv13 = fptosi float %mul12 to i32
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), i32 %conv, i32 %conv13)
  %10 = load %struct.S** %s.addr, align 8
  %u15 = getelementptr inbounds %struct.S* %10, i32 0, i32 1
  %s_floats16 = bitcast %union.anon* %u15 to [2 x float]*
  %arrayidx17 = getelementptr inbounds [2 x float]* %s_floats16, i32 0, i64 0
  %11 = load float* %arrayidx17, align 4
  %12 = load %struct.S** %s.addr, align 8
  %u18 = getelementptr inbounds %struct.S* %12, i32 0, i32 1
  %s_floats19 = bitcast %union.anon* %u18 to [2 x float]*
  %arrayidx20 = getelementptr inbounds [2 x float]* %s_floats19, i32 0, i64 1
  %13 = load float* %arrayidx20, align 4
  %sub = fsub float -0.000000e+00, %13
  %cmp = fcmp une float %11, %sub
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %sw.bb5
  %14 = load %struct.S** %s.addr, align 8
  %u22 = getelementptr inbounds %struct.S* %14, i32 0, i32 1
  %s_floats23 = bitcast %union.anon* %u22 to [2 x float]*
  %arrayidx24 = getelementptr inbounds [2 x float]* %s_floats23, i32 0, i64 0
  %15 = load float* %arrayidx24, align 4
  %conv25 = fpext float %15 to double
  %16 = load %struct.S** %s.addr, align 8
  %u26 = getelementptr inbounds %struct.S* %16, i32 0, i32 1
  %s_floats27 = bitcast %union.anon* %u26 to [2 x float]*
  %arrayidx28 = getelementptr inbounds [2 x float]* %s_floats27, i32 0, i64 1
  %17 = load float* %arrayidx28, align 4
  %sub29 = fsub float -0.000000e+00, %17
  %conv30 = fpext float %sub29 to double
  %call31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([48 x i8]* @.str3, i32 0, i32 0), double %conv25, double %conv30)
  br label %if.end

if.end:                                           ; preds = %if.then, %sw.bb5
  br label %sw.epilog

sw.bb32:                                          ; preds = %entry
  %call33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i32 0, i32 0))
  %18 = load %struct.S** %s.addr, align 8
  %u34 = getelementptr inbounds %struct.S* %18, i32 0, i32 1
  %s_double = bitcast %union.anon* %u34 to double*
  %19 = load double* %s_double, align 8
  %mul35 = fmul double 1.000000e+04, %19
  %conv36 = fptosi double %mul35 to i32
  %call37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str5, i32 0, i32 0), i32 %conv36)
  %20 = load %struct.S** %s.addr, align 8
  %u38 = getelementptr inbounds %struct.S* %20, i32 0, i32 1
  %s_double39 = bitcast %union.anon* %u38 to double*
  %21 = load double* %s_double39, align 8
  %cmp40 = fcmp ogt double %21, 1.570800e+00
  br i1 %cmp40, label %if.then46, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %sw.bb32
  %22 = load %struct.S** %s.addr, align 8
  %u42 = getelementptr inbounds %struct.S* %22, i32 0, i32 1
  %s_double43 = bitcast %union.anon* %u42 to double*
  %23 = load double* %s_double43, align 8
  %cmp44 = fcmp olt double %23, 1.570790e+00
  br i1 %cmp44, label %if.then46, label %if.end50

if.then46:                                        ; preds = %lor.lhs.false, %sw.bb32
  %24 = load %struct.S** %s.addr, align 8
  %u47 = getelementptr inbounds %struct.S* %24, i32 0, i32 1
  %s_double48 = bitcast %union.anon* %u47 to double*
  %25 = load double* %s_double48, align 8
  %call49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str6, i32 0, i32 0), double %25)
  br label %if.end50

if.end50:                                         ; preds = %if.then46, %lor.lhs.false
  br label %sw.epilog

sw.epilog:                                        ; preds = %entry, %if.end50, %if.end, %sw.bb
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
  %0 = bitcast %struct.S* %newStruct to i8*
  %1 = bitcast %struct.S* %arrayidx20 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* %1, i64 16, i32 8, i1 false)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32* %i, align 4
  %3 = load i32* %numEsses, align 4
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i32* %i, align 4
  %idxprom = sext i32 %4 to i64
  %arrayidx21 = getelementptr inbounds [3 x %struct.S]* %esses, i32 0, i64 %idxprom
  call void @do_something(%struct.S* %arrayidx21)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32* %i, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind
