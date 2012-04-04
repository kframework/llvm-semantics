; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr15262-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.A = type { i32, i32 }
%struct.B = type { i32*, float }

@X = common global float 0.000000e+00, align 4

define i32 @foo(i32* %b.coerce0, float %b.coerce1, %struct.A* %q, float* %h) nounwind uwtable {
entry:
  %b = alloca %struct.B, align 8
  %q.addr = alloca %struct.A*, align 8
  %h.addr = alloca float*, align 8
  %0 = bitcast %struct.B* %b to { i32*, float }*
  %1 = getelementptr { i32*, float }* %0, i32 0, i32 0
  store i32* %b.coerce0, i32** %1
  %2 = getelementptr { i32*, float }* %0, i32 0, i32 1
  store float %b.coerce1, float* %2
  store %struct.A* %q, %struct.A** %q.addr, align 8
  store float* %h, float** %h.addr, align 8
  %3 = load float** %h.addr, align 8
  %4 = load float* %3, align 4
  %5 = load float* @X, align 4
  %add = fadd float %5, %4
  store float %add, float* @X, align 4
  %p = getelementptr inbounds %struct.B* %b, i32 0, i32 0
  %6 = load i32** %p, align 8
  store i32 3, i32* %6, align 4
  %7 = load %struct.A** %q.addr, align 8
  %t = getelementptr inbounds %struct.A* %7, i32 0, i32 0
  store i32 2, i32* %t, align 4
  %p1 = getelementptr inbounds %struct.B* %b, i32 0, i32 0
  %8 = load i32** %p1, align 8
  %9 = load i32* %8, align 4
  ret i32 %9
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.A, align 4
  %b = alloca %struct.B, align 8
  store i32 0, i32* %retval
  %t = getelementptr inbounds %struct.A* %a, i32 0, i32 0
  %p = getelementptr inbounds %struct.B* %b, i32 0, i32 0
  store i32* %t, i32** %p, align 8
  %0 = bitcast %struct.B* %b to { i32*, float }*
  %1 = getelementptr { i32*, float }* %0, i32 0, i32 0
  %2 = load i32** %1, align 1
  %3 = getelementptr { i32*, float }* %0, i32 0, i32 1
  %4 = load float* %3, align 1
  %call = call i32 @foo(i32* %2, float %4, %struct.A* %a, float* @X)
  %cmp = icmp eq i32 %call, 3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
