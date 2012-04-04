; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/struct-aliasing-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { float }

define i32 @foo(i32* %r, %struct.S* %p) nounwind uwtable noinline {
entry:
  %r.addr = alloca i32*, align 8
  %p.addr = alloca %struct.S*, align 8
  %q = alloca i32*, align 8
  %i = alloca i32, align 4
  store i32* %r, i32** %r.addr, align 8
  store %struct.S* %p, %struct.S** %p.addr, align 8
  %0 = load %struct.S** %p.addr, align 8
  %f = getelementptr inbounds %struct.S* %0, i32 0, i32 0
  %1 = bitcast float* %f to i32*
  store i32* %1, i32** %q, align 8
  %2 = load i32** %q, align 8
  %3 = load i32* %2, align 4
  store i32 %3, i32* %i, align 4
  %4 = load i32** %r.addr, align 8
  store i32 0, i32* %4, align 4
  %5 = load i32* %i, align 4
  %6 = load i32** %q, align 8
  %7 = load i32* %6, align 4
  %add = add nsw i32 %5, %7
  ret i32 %add
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 1, i32* %i, align 4
  %0 = bitcast i32* %i to %struct.S*
  %call = call i32 @foo(i32* %i, %struct.S* %0)
  %cmp = icmp ne i32 %call, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
