; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/990827-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @test(i32 %one, i32 %bit) nounwind uwtable {
entry:
  %one.addr = alloca i32, align 4
  %bit.addr = alloca i32, align 4
  %val = alloca i32, align 4
  %zero = alloca i32, align 4
  store i32 %one, i32* %one.addr, align 4
  store i32 %bit, i32* %bit.addr, align 4
  %0 = load i32* %bit.addr, align 4
  %and = and i32 %0, 1
  store i32 %and, i32* %val, align 4
  %1 = load i32* %one.addr, align 4
  %shr = lshr i32 %1, 1
  store i32 %shr, i32* %zero, align 4
  %2 = load i32* %val, align 4
  %inc = add i32 %2, 1
  store i32 %inc, i32* %val, align 4
  %3 = load i32* %zero, align 4
  %4 = load i32* %val, align 4
  %shr1 = lshr i32 %4, 1
  %add = add i32 %3, %shr1
  ret i32 %add
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @test(i32 1, i32 0)
  %cmp = icmp ne i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %call1 = call i32 @test(i32 1, i32 1)
  %cmp2 = icmp ne i32 %call1, 1
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  %call5 = call i32 @test(i32 1, i32 65535)
  %cmp6 = icmp ne i32 %call5, 1
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end4
  call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.end4
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
