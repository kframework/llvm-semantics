; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020810-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.R = type { %struct.A, %struct.A }
%struct.A = type { i64 }

@R = global %struct.R { %struct.A { i64 100 }, %struct.A { i64 200 } }, align 8

define void @f(i64 %r.coerce0, i64 %r.coerce1) nounwind uwtable {
entry:
  %r = alloca %struct.R, align 8
  %0 = bitcast %struct.R* %r to { i64, i64 }*
  %1 = getelementptr { i64, i64 }* %0, i32 0, i32 0
  store i64 %r.coerce0, i64* %1
  %2 = getelementptr { i64, i64 }* %0, i32 0, i32 1
  store i64 %r.coerce1, i64* %2
  %a = getelementptr inbounds %struct.R* %r, i32 0, i32 0
  %x = getelementptr inbounds %struct.A* %a, i32 0, i32 0
  %3 = load i64* %x, align 8
  %4 = load i64* getelementptr inbounds (%struct.R* @R, i32 0, i32 0, i32 0), align 8
  %cmp = icmp ne i64 %3, %4
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %b = getelementptr inbounds %struct.R* %r, i32 0, i32 1
  %x1 = getelementptr inbounds %struct.A* %b, i32 0, i32 0
  %5 = load i64* %x1, align 8
  %6 = load i64* getelementptr inbounds (%struct.R* @R, i32 0, i32 1, i32 0), align 8
  %cmp2 = icmp ne i64 %5, %6
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  ret void
}

declare void @abort() noreturn nounwind

define { i64, i64 } @g() nounwind uwtable {
entry:
  %retval = alloca %struct.R, align 8
  %0 = bitcast %struct.R* %retval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast (%struct.R* @R to i8*), i64 16, i32 8, i1 false)
  %1 = bitcast %struct.R* %retval to { i64, i64 }*
  %2 = load { i64, i64 }* %1, align 1
  ret { i64, i64 } %2
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %r = alloca %struct.R, align 8
  %coerce = alloca %struct.R, align 8
  store i32 0, i32* %retval
  %0 = load i64* getelementptr ({ i64, i64 }* bitcast (%struct.R* @R to { i64, i64 }*), i32 0, i32 0), align 1
  %1 = load i64* getelementptr ({ i64, i64 }* bitcast (%struct.R* @R to { i64, i64 }*), i32 0, i32 1), align 1
  call void @f(i64 %0, i64 %1)
  %call = call { i64, i64 } @g()
  %2 = bitcast %struct.R* %coerce to { i64, i64 }*
  %3 = getelementptr { i64, i64 }* %2, i32 0, i32 0
  %4 = extractvalue { i64, i64 } %call, 0
  store i64 %4, i64* %3, align 1
  %5 = getelementptr { i64, i64 }* %2, i32 0, i32 1
  %6 = extractvalue { i64, i64 } %call, 1
  store i64 %6, i64* %5, align 1
  %7 = bitcast %struct.R* %r to i8*
  %8 = bitcast %struct.R* %coerce to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %7, i8* %8, i64 16, i32 8, i1 false)
  %a = getelementptr inbounds %struct.R* %r, i32 0, i32 0
  %x = getelementptr inbounds %struct.A* %a, i32 0, i32 0
  %9 = load i64* %x, align 8
  %10 = load i64* getelementptr inbounds (%struct.R* @R, i32 0, i32 0, i32 0), align 8
  %cmp = icmp ne i64 %9, %10
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %b = getelementptr inbounds %struct.R* %r, i32 0, i32 1
  %x1 = getelementptr inbounds %struct.A* %b, i32 0, i32 0
  %11 = load i64* %x1, align 8
  %12 = load i64* getelementptr inbounds (%struct.R* @R, i32 0, i32 1, i32 0), align 8
  %cmp2 = icmp ne i64 %11, %12
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  ret i32 0
}
