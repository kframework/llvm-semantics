; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/981130-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.s = type { i32, i32 }

@s2 = global %struct.s { i32 1, i32 2 }, align 8
@s1 = common global %struct.s zeroinitializer, align 4

define void @check(i32 %a, i32 %b) noreturn nounwind uwtable {
entry:
  %cmp = icmp eq i32 %a, %b
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  tail call void @exit(i32 0) noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

declare void @abort() noreturn nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  %0 = load i64* bitcast (%struct.s* @s2 to i64*), align 8
  store i64 %0, i64* bitcast (%struct.s* @s1 to i64*), align 4
  %trunc = trunc i64 %0 to i32
  tail call void @check(i32 %trunc, i32 1) nounwind
  unreachable
}
