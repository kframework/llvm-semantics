; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/vrp-7.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.T = type { i8, [3 x i8] }

@t = common global %struct.T zeroinitializer, align 4

define void @foo(i32 %f) nounwind uwtable noinline {
entry:
  %f.addr = alloca i32, align 4
  store i32 %f, i32* %f.addr, align 4
  %0 = load i32* %f.addr, align 4
  %and = and i32 %0, 16
  %tobool = icmp ne i32 %and, 0
  %cond = select i1 %tobool, i32 1, i32 0
  %bf.value = and i32 %cond, 1
  %1 = shl i32 %bf.value, 31
  %bf.reload.sext = ashr i32 %1, 31
  %2 = and i32 %bf.value, 1
  %3 = load i32* bitcast (%struct.T* @t to i32*), align 4
  %4 = and i32 %3, -2
  %5 = or i32 %4, %2
  store i32 %5, i32* bitcast (%struct.T* @t to i32*), align 4
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @foo(i32 16)
  %0 = load i32* bitcast (%struct.T* @t to i32*), align 4
  %bf.clear = and i32 %0, 1
  %1 = shl i32 %bf.clear, 31
  %bf.val.sext = ashr i32 %1, 31
  %tobool = icmp ne i32 %bf.val.sext, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
