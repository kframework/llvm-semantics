; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/960301-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.foo = type <{ [2 x i8], [2 x i8] }>

@foo = common global %struct.foo zeroinitializer, align 4
@oldfoo = common global i32 0, align 4

define i32 @bar(i32 %k) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %k.addr = alloca i32, align 4
  store i32 %k, i32* %k.addr, align 4
  %0 = load i32* bitcast (%struct.foo* @foo to i32*), align 4
  %1 = lshr i32 %0, 12
  %bf.clear = and i32 %1, 15
  store i32 %bf.clear, i32* @oldfoo, align 4
  %2 = load i32* %k.addr, align 4
  %bf.value = and i32 %2, 15
  %3 = and i32 %bf.value, 15
  %4 = shl i32 %3, 12
  %5 = load i32* bitcast (%struct.foo* @foo to i32*), align 4
  %6 = and i32 %5, -61441
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.foo* @foo to i32*), align 4
  %8 = load i32* %k.addr, align 4
  %tobool = icmp ne i32 %8, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  store i32 2, i32* %retval
  br label %return

return:                                           ; preds = %if.end, %if.then
  %9 = load i32* %retval
  ret i32 %9
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @bar(i32 1)
  %cmp = icmp ne i32 %call, 1
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
