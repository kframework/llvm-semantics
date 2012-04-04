; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/960218-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@glob = common global i32 0, align 4

define i32 @g(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  store i32 %0, i32* @glob, align 4
  ret i32 0
}

define void @f(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %neg = xor i32 %0, -1
  store i32 %neg, i32* %a, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %1 = load i32* %a, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load i32* %a, align 4
  %call = call i32 (...)* bitcast (i32 (i32)* @g to i32 (...)*)(i32 %2)
  store i32 %call, i32* %a, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void (...)* bitcast (void (i32)* @f to void (...)*)(i32 3)
  %0 = load i32* @glob, align 4
  %cmp = icmp ne i32 %0, -4
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %1 = load i32* %retval
  ret i32 %1
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
