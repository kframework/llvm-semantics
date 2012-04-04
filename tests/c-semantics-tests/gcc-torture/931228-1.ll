; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/931228-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %and = and i32 %0, 4096
  store i32 %and, i32* %x.addr, align 4
  %1 = load i32* %x.addr, align 4
  %and1 = and i32 %1, 4095
  store i32 %and1, i32* %x.addr, align 4
  %2 = load i32* %x.addr, align 4
  %xor = xor i32 %2, 8191
  store i32 %xor, i32* %x.addr, align 4
  %3 = load i32* %x.addr, align 4
  %and2 = and i32 %3, 8184
  store i32 %and2, i32* %x.addr, align 4
  %4 = load i32* %x.addr, align 4
  ret i32 %4
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 (...)* bitcast (i32 (i32)* @f to i32 (...)*)(i32 -1)
  %cmp = icmp ne i32 %call, 8184
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
