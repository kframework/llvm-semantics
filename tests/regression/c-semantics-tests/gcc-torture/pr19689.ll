; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr19689.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { [4 x i8] }

@f = common global %struct.anon zeroinitializer, align 4

define void @foo(i16 signext %j) nounwind uwtable {
entry:
  %j.addr = alloca i16, align 2
  store i16 %j, i16* %j.addr, align 2
  %0 = load i16* %j.addr, align 2
  %conv = sext i16 %0 to i32
  %bf.value = and i32 %conv, 536870911
  %1 = shl i32 %bf.value, 3
  %bf.reload.sext = ashr i32 %1, 3
  %2 = and i32 %bf.value, 536870911
  %3 = load i32* bitcast (%struct.anon* @f to i32*), align 4
  %4 = and i32 %3, -536870912
  %5 = or i32 %4, %2
  store i32 %5, i32* bitcast (%struct.anon* @f to i32*), align 4
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @foo(i16 signext -55)
  %0 = load i32* bitcast (%struct.anon* @f to i32*), align 4
  %bf.clear = and i32 %0, 536870911
  %1 = shl i32 %bf.clear, 3
  %bf.val.sext = ashr i32 %1, 3
  %cmp = icmp ne i32 %bf.val.sext, -55
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
