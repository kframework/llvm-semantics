; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr19689.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { [4 x i8] }

@f = common global %struct.anon zeroinitializer, align 4

define void @foo(i16 signext %j) nounwind uwtable {
entry:
  %conv = sext i16 %j to i32
  %bf.value = and i32 %conv, 536870911
  %0 = load i32* bitcast (%struct.anon* @f to i32*), align 4
  %1 = and i32 %0, -536870912
  %2 = or i32 %1, %bf.value
  store i32 %2, i32* bitcast (%struct.anon* @f to i32*), align 4
  ret void
}

define i32 @main() nounwind uwtable {
if.end:
  %0 = load i32* bitcast (%struct.anon* @f to i32*), align 4
  %1 = and i32 %0, -536870912
  %2 = or i32 %1, 536870857
  store i32 %2, i32* bitcast (%struct.anon* @f to i32*), align 4
  ret i32 0
}
