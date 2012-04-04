; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/arith-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @sat_add(i32 %i) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %ret = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  %0 = load i32* %i.addr, align 4
  %add = add i32 %0, 1
  store i32 %add, i32* %ret, align 4
  %1 = load i32* %ret, align 4
  %2 = load i32* %i.addr, align 4
  %cmp = icmp ult i32 %1, %2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load i32* %i.addr, align 4
  store i32 %3, i32* %ret, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %4 = load i32* %ret, align 4
  ret i32 %4
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @sat_add(i32 -1)
  %cmp = icmp ne i32 %call, -1
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

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
