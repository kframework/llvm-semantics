; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/991019-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.material_type = type { double }

define double @foo(double %x) nounwind uwtable {
entry:
  %retval = alloca %struct.material_type, align 8
  %x.addr = alloca double, align 8
  %m = alloca %struct.material_type, align 8
  store double %x, double* %x.addr, align 8
  %0 = load double* %x.addr, align 8
  %add = fadd double 1.000000e+00, %0
  %epsilon = getelementptr inbounds %struct.material_type* %m, i32 0, i32 0
  store double %add, double* %epsilon, align 8
  %1 = bitcast %struct.material_type* %retval to i8*
  %2 = bitcast %struct.material_type* %m to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* %2, i64 8, i32 8, i1 false)
  %coerce.dive = getelementptr %struct.material_type* %retval, i32 0, i32 0
  %3 = load double* %coerce.dive, align 1
  ret double %3
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %x = alloca %struct.material_type, align 8
  %coerce = alloca %struct.material_type, align 8
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %call = call double @foo(double 1.000000e+00)
  %coerce.dive = getelementptr %struct.material_type* %coerce, i32 0, i32 0
  store double %call, double* %coerce.dive, align 1
  %1 = bitcast %struct.material_type* %x to i8*
  %2 = bitcast %struct.material_type* %coerce to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* %2, i64 8, i32 8, i1 false)
  %epsilon = getelementptr inbounds %struct.material_type* %x, i32 0, i32 0
  %3 = load double* %epsilon, align 8
  %cmp1 = fcmp une double %3, 2.000000e+00
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %4 = load i32* %i, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %5 = load i32* %retval
  ret i32 %5
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
