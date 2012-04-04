; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/mayalias-3.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.test = type { i16 }

@p = common global %struct.test* null, align 8
@f.s = private unnamed_addr constant %struct.test { i16 1 }, align 2

define i32 @g(i32* %a) nounwind uwtable {
entry:
  %a.addr = alloca i32*, align 8
  store i32* %a, i32** %a.addr, align 8
  %0 = load i32** %a.addr, align 8
  %1 = bitcast i32* %0 to %struct.test*
  store %struct.test* %1, %struct.test** @p, align 8
  ret i32 0
}

define i32 @f() nounwind uwtable {
entry:
  %a = alloca i32, align 4
  %s = alloca %struct.test, align 2
  %call = call i32 @g(i32* %a)
  store i32 10, i32* %a, align 4
  %0 = bitcast %struct.test* %s to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast (%struct.test* @f.s to i8*), i64 2, i32 2, i1 false)
  %1 = load %struct.test** @p, align 8
  %2 = bitcast %struct.test* %1 to i8*
  %3 = bitcast %struct.test* %s to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* %3, i64 2, i32 2, i1 false)
  %4 = load i32* %a, align 4
  ret i32 %4
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @f()
  %cmp = icmp eq i32 %call, 10
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
