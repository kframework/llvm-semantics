; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/vrp-7.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.T = type { i8, [3 x i8] }

@t = common global %struct.T zeroinitializer, align 4

define void @foo(i32 %f) nounwind uwtable noinline {
entry:
  %and = lshr i32 %f, 4
  %and.lobit = and i32 %and, 1
  %0 = load i32* bitcast (%struct.T* @t to i32*), align 4
  %1 = and i32 %0, -2
  %2 = or i32 %1, %and.lobit
  store i32 %2, i32* bitcast (%struct.T* @t to i32*), align 4
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  tail call void @foo(i32 16)
  %0 = load i32* bitcast (%struct.T* @t to i32*), align 4
  %.mask = and i32 %0, 1
  %tobool = icmp eq i32 %.mask, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
