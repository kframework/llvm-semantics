; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr38422.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { [4 x i8] }

@s = common global %struct.S zeroinitializer, align 4

define void @foo() nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.S* @s to i32*), align 4
  %bf.clear = and i32 %0, 1073741823
  %1 = shl i32 %bf.clear, 2
  %bf.val.sext = ashr i32 %1, 2
  %mul = mul nsw i32 %bf.val.sext, 2
  %bf.value = and i32 %mul, 1073741823
  %2 = shl i32 %bf.value, 2
  %bf.reload.sext = ashr i32 %2, 2
  %3 = and i32 %bf.value, 1073741823
  %4 = load i32* bitcast (%struct.S* @s to i32*), align 4
  %5 = and i32 %4, -1073741824
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.S* @s to i32*), align 4
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = load i32* bitcast (%struct.S* @s to i32*), align 4
  %1 = and i32 %0, -1073741824
  %2 = or i32 %1, 24
  store i32 %2, i32* bitcast (%struct.S* @s to i32*), align 4
  call void @foo()
  %3 = load i32* bitcast (%struct.S* @s to i32*), align 4
  %bf.clear = and i32 %3, 1073741823
  %4 = shl i32 %bf.clear, 2
  %bf.val.sext = ashr i32 %4, 2
  %cmp = icmp ne i32 %bf.val.sext, 48
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
