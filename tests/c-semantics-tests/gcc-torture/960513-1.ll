; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/960513-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define x86_fp80 @f(x86_fp80 %d, i32 %i) nounwind uwtable {
entry:
  %d.addr = alloca x86_fp80, align 16
  %i.addr = alloca i32, align 4
  %e = alloca x86_fp80, align 16
  store x86_fp80 %d, x86_fp80* %d.addr, align 16
  store i32 %i, i32* %i.addr, align 4
  %0 = load x86_fp80* %d.addr, align 16
  %sub = fsub x86_fp80 0xK80000000000000000000, %0
  store x86_fp80 %sub, x86_fp80* %d.addr, align 16
  %1 = load x86_fp80* %d.addr, align 16
  store x86_fp80 %1, x86_fp80* %e, align 16
  %2 = load i32* %i.addr, align 4
  %cmp = icmp eq i32 %2, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load x86_fp80* %d.addr, align 16
  %mul = fmul x86_fp80 %3, 0xK40008000000000000000
  store x86_fp80 %mul, x86_fp80* %d.addr, align 16
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %4 = load x86_fp80* %e, align 16
  %5 = load x86_fp80* %d.addr, align 16
  %mul1 = fmul x86_fp80 %4, %5
  %6 = load x86_fp80* %d.addr, align 16
  %sub2 = fsub x86_fp80 %6, %mul1
  store x86_fp80 %sub2, x86_fp80* %d.addr, align 16
  %7 = load x86_fp80* %e, align 16
  %8 = load x86_fp80* %d.addr, align 16
  %mul3 = fmul x86_fp80 %7, %8
  %9 = load x86_fp80* %d.addr, align 16
  %sub4 = fsub x86_fp80 %9, %mul3
  store x86_fp80 %sub4, x86_fp80* %d.addr, align 16
  %10 = load x86_fp80* %e, align 16
  %11 = load x86_fp80* %d.addr, align 16
  %mul5 = fmul x86_fp80 %10, %11
  %12 = load x86_fp80* %d.addr, align 16
  %sub6 = fsub x86_fp80 %12, %mul5
  store x86_fp80 %sub6, x86_fp80* %d.addr, align 16
  %13 = load x86_fp80* %e, align 16
  %14 = load x86_fp80* %d.addr, align 16
  %mul7 = fmul x86_fp80 %13, %14
  %15 = load x86_fp80* %d.addr, align 16
  %sub8 = fsub x86_fp80 %15, %mul7
  store x86_fp80 %sub8, x86_fp80* %d.addr, align 16
  %16 = load x86_fp80* %e, align 16
  %17 = load x86_fp80* %d.addr, align 16
  %mul9 = fmul x86_fp80 %16, %17
  %18 = load x86_fp80* %d.addr, align 16
  %sub10 = fsub x86_fp80 %18, %mul9
  store x86_fp80 %sub10, x86_fp80* %d.addr, align 16
  %19 = load x86_fp80* %d.addr, align 16
  ret x86_fp80 %19
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call x86_fp80 (...)* bitcast (x86_fp80 (x86_fp80, i32)* @f to x86_fp80 (...)*)(x86_fp80 0xK40008000000000000000, i32 1)
  %conv = fptosi x86_fp80 %call to i32
  %tobool = icmp ne i32 %conv, 0
  br i1 %tobool, label %if.end, label %if.then

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

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
