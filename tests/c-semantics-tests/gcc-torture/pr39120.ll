; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr39120.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.X = type { i32* }

@x = common global %struct.X zeroinitializer, align 8

define i32* @foo(i32* %p) nounwind uwtable noinline {
entry:
  %retval = alloca %struct.X, align 8
  %p.addr = alloca i32*, align 8
  %x = alloca %struct.X, align 8
  store i32* %p, i32** %p.addr, align 8
  %0 = load i32** %p.addr, align 8
  %p1 = getelementptr inbounds %struct.X* %x, i32 0, i32 0
  store i32* %0, i32** %p1, align 8
  %1 = bitcast %struct.X* %retval to i8*
  %2 = bitcast %struct.X* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* %2, i64 8, i32 8, i1 false)
  %coerce.dive = getelementptr %struct.X* %retval, i32 0, i32 0
  %3 = load i32** %coerce.dive
  ret i32* %3
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define void @bar() nounwind uwtable noinline {
entry:
  %0 = load i32** getelementptr inbounds (%struct.X* @x, i32 0, i32 0), align 8
  store i32 1, i32* %0, align 4
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %coerce = alloca %struct.X, align 8
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  %call = call i32* @foo(i32* %i)
  %coerce.dive = getelementptr %struct.X* %coerce, i32 0, i32 0
  store i32* %call, i32** %coerce.dive
  %0 = bitcast %struct.X* %coerce to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast (%struct.X* @x to i8*), i8* %0, i64 8, i32 8, i1 false)
  call void @bar()
  %1 = load i32* %i, align 4
  %cmp = icmp ne i32 %1, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn
