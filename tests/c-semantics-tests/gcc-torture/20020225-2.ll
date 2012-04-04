; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020225-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.anon = type { double }

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @test(i32 5)
  %cmp = icmp ne i32 %call, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

define internal i32 @test(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %a = alloca %union.anon, align 8
  store i32 %x, i32* %x.addr, align 4
  %d = bitcast %union.anon* %a to double*
  store double 0.000000e+00, double* %d, align 8
  %i = bitcast %union.anon* %a to i32*
  store i32 1, i32* %i, align 4
  %0 = load i32* %x.addr, align 4
  %i1 = bitcast %union.anon* %a to i32*
  %1 = load i32* %i1, align 4
  %shr = ashr i32 %0, %1
  ret i32 %shr
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
