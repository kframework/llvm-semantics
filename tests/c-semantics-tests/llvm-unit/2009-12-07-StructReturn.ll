; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2009-12-07-StructReturn.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.barstruct = type { %struct.foostruct, float }
%struct.foostruct = type { [3 x float] }

@bar_ary = common global [4 x %struct.barstruct] zeroinitializer, align 16
@foobify.my_static_foo = internal global %struct.barstruct { %struct.foostruct { [3 x float] [float 4.200000e+01, float 4.200000e+01, float 4.200000e+01] }, float 4.200000e+01 }, align 4
@.str = private unnamed_addr constant [51 x i8] c"error: store clobbered memory outside destination\0A\00", align 1

define float* @spooky(i32 %i) nounwind uwtable noinline {
entry:
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  %0 = load i32* %i.addr, align 4
  %idxprom = sext i32 %0 to i64
  %arrayidx = getelementptr inbounds [4 x %struct.barstruct]* @bar_ary, i32 0, i64 %idxprom
  %safe = getelementptr inbounds %struct.barstruct* %arrayidx, i32 0, i32 1
  store float 1.420000e+02, float* %safe, align 4
  %1 = load i32* %i.addr, align 4
  %idxprom1 = sext i32 %1 to i64
  %arrayidx2 = getelementptr inbounds [4 x %struct.barstruct]* @bar_ary, i32 0, i64 %idxprom1
  %safe3 = getelementptr inbounds %struct.barstruct* %arrayidx2, i32 0, i32 1
  ret float* %safe3
}

define { <2 x float>, float } @foobify() nounwind uwtable noinline {
entry:
  %retval = alloca %struct.foostruct, align 4
  %tmp = alloca { <2 x float>, float }
  %0 = bitcast %struct.foostruct* %retval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast (%struct.barstruct* @foobify.my_static_foo to i8*), i64 12, i32 4, i1 false)
  %coerce.dive = getelementptr %struct.foostruct* %retval, i32 0, i32 0
  %1 = bitcast { <2 x float>, float }* %tmp to [3 x float]*
  %2 = load [3 x float]* %coerce.dive
  store [3 x float] %2, [3 x float]* %1, align 1
  %3 = load { <2 x float>, float }* %tmp
  ret { <2 x float>, float } %3
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %pf = alloca float*, align 8
  %coerce = alloca %struct.foostruct, align 4
  %tmp = alloca { <2 x float>, float }
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call float* @spooky(i32 0)
  store float* %call, float** %pf, align 8
  %call1 = call { <2 x float>, float } @foobify()
  %coerce.dive = getelementptr %struct.foostruct* %coerce, i32 0, i32 0
  store { <2 x float>, float } %call1, { <2 x float>, float }* %tmp
  %0 = bitcast { <2 x float>, float }* %tmp to [3 x float]*
  %1 = load [3 x float]* %0, align 1
  store [3 x float] %1, [3 x float]* %coerce.dive
  %2 = bitcast %struct.foostruct* %coerce to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast ([4 x %struct.barstruct]* @bar_ary to i8*), i8* %2, i64 12, i32 4, i1 false)
  %3 = load float** %pf, align 8
  %4 = load float* %3, align 4
  %conv = fpext float %4 to double
  %cmp = fcmp une double %conv, 1.420000e+02
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([51 x i8]* @.str, i32 0, i32 0))
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare i32 @printf(i8*, ...)

declare void @abort() noreturn
