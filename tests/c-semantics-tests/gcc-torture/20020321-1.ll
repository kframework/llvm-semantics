; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020321-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define float @g(i8* %a, i8* %b, i32 %e, i32 %c, float %d) nounwind uwtable {
entry:
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %e.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %d.addr = alloca float, align 4
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i32 %e, i32* %e.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  store float %d, float* %d.addr, align 4
  %0 = load float* %d.addr, align 4
  ret float %0
}

define float @f(i8* %a, i8* %b, i32 %c, float %d) nounwind uwtable {
entry:
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i32, align 4
  %d.addr = alloca float, align 4
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i32 %c, i32* %c.addr, align 4
  store float %d, float* %d.addr, align 4
  %0 = load i8** %a.addr, align 8
  %1 = load i8** %b.addr, align 8
  %2 = load i32* %c.addr, align 4
  %3 = load float* %d.addr, align 4
  %call = call float @g(i8* %0, i8* %1, i32 0, i32 %2, float %3)
  ret float %call
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call float @f(i8* null, i8* null, i32 1, float 1.000000e+00)
  ret i32 0
}
