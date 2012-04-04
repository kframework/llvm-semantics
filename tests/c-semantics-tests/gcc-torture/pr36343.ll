; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr36343.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @bar(i32** %p) nounwind uwtable noinline {
entry:
  %p.addr = alloca i32**, align 8
  %q = alloca float*, align 8
  store i32** %p, i32*** %p.addr, align 8
  %0 = load i32*** %p.addr, align 8
  %1 = bitcast i32** %0 to float*
  store float* %1, float** %q, align 8
  %2 = load float** %q, align 8
  store float 0.000000e+00, float* %2, align 4
  ret void
}

define float @foo(i32 %b) nounwind uwtable noinline {
entry:
  %retval = alloca float, align 4
  %b.addr = alloca i32, align 4
  %i = alloca i32*, align 8
  %f = alloca float, align 4
  %p = alloca i32**, align 8
  store i32 %b, i32* %b.addr, align 4
  store i32* null, i32** %i, align 8
  store float 1.000000e+00, float* %f, align 4
  %0 = load i32* %b.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32** %i, i32*** %p, align 8
  br label %if.end

if.else:                                          ; preds = %entry
  %1 = bitcast float* %f to i32**
  store i32** %1, i32*** %p, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load i32*** %p, align 8
  call void @bar(i32** %2)
  %3 = load i32* %b.addr, align 4
  %tobool1 = icmp ne i32 %3, 0
  br i1 %tobool1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  %4 = load i32*** %p, align 8
  %5 = load i32** %4, align 8
  %6 = load i32* %5, align 4
  %conv = sitofp i32 %6 to float
  store float %conv, float* %retval
  br label %return

if.end3:                                          ; preds = %if.end
  %7 = load float* %f, align 4
  store float %7, float* %retval
  br label %return

return:                                           ; preds = %if.end3, %if.then2
  %8 = load float* %retval
  ret float %8
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call float @foo(i32 0)
  %conv = fpext float %call to double
  %cmp = fcmp une double %conv, 0.000000e+00
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
