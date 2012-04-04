; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/961223-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.s = type { double }

@main.t = private unnamed_addr constant %struct.s { double 2.000000e+00 }, align 8

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %t = alloca %struct.s, align 8
  %coerce = alloca %struct.s, align 8
  store i32 0, i32* %retval
  %0 = bitcast %struct.s* %t to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast (%struct.s* @main.t to i8*), i64 8, i32 8, i1 false)
  %coerce.dive = getelementptr %struct.s* %t, i32 0, i32 0
  %1 = load double* %coerce.dive, align 1
  %call = call double @sub(double %1)
  %coerce.dive1 = getelementptr %struct.s* %coerce, i32 0, i32 0
  store double %call, double* %coerce.dive1, align 1
  %2 = bitcast %struct.s* %t to i8*
  %3 = bitcast %struct.s* %coerce to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* %3, i64 8, i32 8, i1 false)
  %d = getelementptr inbounds %struct.s* %t, i32 0, i32 0
  %4 = load double* %d, align 8
  %cmp = fcmp une double %4, 3.000000e+00
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %5 = load i32* %retval
  ret i32 %5
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare double @sub(double)

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
