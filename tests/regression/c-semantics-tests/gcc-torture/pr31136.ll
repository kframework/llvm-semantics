; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr31136.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i8, i8, [2 x i8] }

@s = common global %struct.S zeroinitializer, align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = load i32* bitcast (%struct.S* @s to i32*), align 4
  %1 = and i32 %0, -1009
  %2 = or i32 %1, 496
  store i32 %2, i32* bitcast (%struct.S* @s to i32*), align 4
  %3 = load i32* bitcast (%struct.S* @s to i32*), align 4
  %4 = lshr i32 %3, 4
  %bf.clear = and i32 %4, 63
  %bf.value = and i32 %bf.clear, 15
  %5 = and i32 %bf.value, 15
  %6 = load i32* bitcast (%struct.S* @s to i32*), align 4
  %7 = and i32 %6, -16
  %8 = or i32 %7, %5
  store i32 %8, i32* bitcast (%struct.S* @s to i32*), align 4
  %9 = load i32* bitcast (%struct.S* @s to i32*), align 4
  %bf.clear1 = and i32 %9, 15
  %bf.value2 = and i32 %bf.clear1, 63
  %10 = and i32 %bf.value2, 63
  %11 = shl i32 %10, 4
  %12 = load i32* bitcast (%struct.S* @s to i32*), align 4
  %13 = and i32 %12, -1009
  %14 = or i32 %13, %11
  store i32 %14, i32* bitcast (%struct.S* @s to i32*), align 4
  %15 = load i32* bitcast (%struct.S* @s to i32*), align 4
  %16 = lshr i32 %15, 4
  %bf.clear3 = and i32 %16, 63
  %cmp = icmp ne i32 %bf.clear3, 15
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
