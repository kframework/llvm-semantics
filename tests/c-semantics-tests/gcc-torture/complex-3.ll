; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/complex-3.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.complex = type { float, float }

define <2 x float> @f(float %a, float %b) nounwind uwtable {
entry:
  %retval = alloca %struct.complex, align 4
  %a.addr = alloca float, align 4
  %b.addr = alloca float, align 4
  %c = alloca %struct.complex, align 4
  store float %a, float* %a.addr, align 4
  store float %b, float* %b.addr, align 4
  %0 = load float* %a.addr, align 4
  %r = getelementptr inbounds %struct.complex* %c, i32 0, i32 0
  store float %0, float* %r, align 4
  %1 = load float* %b.addr, align 4
  %i = getelementptr inbounds %struct.complex* %c, i32 0, i32 1
  store float %1, float* %i, align 4
  %2 = bitcast %struct.complex* %retval to i8*
  %3 = bitcast %struct.complex* %c to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* %3, i64 8, i32 4, i1 false)
  %4 = bitcast %struct.complex* %retval to <2 x float>*
  %5 = load <2 x float>* %4, align 1
  ret <2 x float> %5
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %z = alloca %struct.complex, align 4
  store i32 0, i32* %retval
  %call = call <2 x float> @f(float 1.000000e+00, float 0.000000e+00)
  %0 = bitcast %struct.complex* %z to <2 x float>*
  store <2 x float> %call, <2 x float>* %0, align 1
  %r = getelementptr inbounds %struct.complex* %z, i32 0, i32 0
  %1 = load float* %r, align 4
  %conv = fpext float %1 to double
  %cmp = fcmp une double %conv, 1.000000e+00
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %i = getelementptr inbounds %struct.complex* %z, i32 0, i32 1
  %2 = load float* %i, align 4
  %conv2 = fpext float %2 to double
  %cmp3 = fcmp une double %conv2, 0.000000e+00
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %3 = load i32* %retval
  ret i32 %3
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
