; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/980602-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { [4 x i8] }

@t = common global %struct.anon zeroinitializer, align 4

define i32 @main() noreturn nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @t to i32*), align 4
  %bf.clear = and i32 %0, 1073741823
  %inc = add i32 %0, 1
  %bf.value = and i32 %inc, 1073741823
  %1 = and i32 %0, -1073741824
  %2 = or i32 %bf.value, %1
  store i32 %2, i32* bitcast (%struct.anon* @t to i32*), align 4
  %tobool = icmp eq i32 %bf.clear, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  tail call void @exit(i32 0) noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

declare void @abort() noreturn nounwind
