; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr40404.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { [3 x i8], i8 }

@s = common global %struct.S zeroinitializer, align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = load i32* bitcast (%struct.S* @s to i32*), align 4
  %1 = and i32 %0, -131072
  %2 = or i32 %1, 131071
  store i32 %2, i32* bitcast (%struct.S* @s to i32*), align 4
  %3 = load i32* bitcast (%struct.S* @s to i32*), align 4
  %bf.clear = and i32 %3, 131071
  %cmp = icmp uge i32 %bf.clear, -2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
