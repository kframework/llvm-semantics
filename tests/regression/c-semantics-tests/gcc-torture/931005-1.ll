; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/931005-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.T = type { i8 }

define i8 @f(i8 %s1.coerce) nounwind uwtable {
entry:
  %retval = alloca %struct.T, align 1
  %s1 = alloca %struct.T, align 1
  %s1a = alloca %struct.T, align 1
  %coerce.dive = getelementptr %struct.T* %s1, i32 0, i32 0
  store i8 %s1.coerce, i8* %coerce.dive
  %x = getelementptr inbounds %struct.T* %s1, i32 0, i32 0
  %0 = load i8* %x, align 1
  %x1 = getelementptr inbounds %struct.T* %s1a, i32 0, i32 0
  store i8 %0, i8* %x1, align 1
  %1 = bitcast %struct.T* %retval to i8*
  %2 = bitcast %struct.T* %s1a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* %2, i64 1, i32 1, i1 false)
  %coerce.dive2 = getelementptr %struct.T* %retval, i32 0, i32 0
  %3 = load i8* %coerce.dive2
  ret i8 %3
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %s1a = alloca %struct.T, align 1
  %s1b = alloca %struct.T, align 1
  %coerce = alloca %struct.T, align 1
  store i32 0, i32* %retval
  %x = getelementptr inbounds %struct.T* %s1a, i32 0, i32 0
  store i8 100, i8* %x, align 1
  %coerce.dive = getelementptr %struct.T* %s1a, i32 0, i32 0
  %0 = load i8* %coerce.dive
  %call = call i8 (...)* bitcast (i8 (i8)* @f to i8 (...)*)(i8 %0)
  %coerce.dive1 = getelementptr %struct.T* %coerce, i32 0, i32 0
  store i8 %call, i8* %coerce.dive1
  %1 = bitcast %struct.T* %s1b to i8*
  %2 = bitcast %struct.T* %coerce to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* %2, i64 1, i32 1, i1 false)
  %x2 = getelementptr inbounds %struct.T* %s1b, i32 0, i32 0
  %3 = load i8* %x2, align 1
  %conv = sext i8 %3 to i32
  %cmp = icmp ne i32 %conv, 100
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %4 = load i32* %retval
  ret i32 %4
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
