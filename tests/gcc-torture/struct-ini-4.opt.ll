; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/struct-ini-4.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.s = type { [3 x i32], [3 x i32] }

@s = global %struct.s { [3 x i32] zeroinitializer, [3 x i32] [i32 1, i32 2, i32 3] }, align 4

define i32 @main() noreturn nounwind uwtable {
entry:
  %tmp = load i32* getelementptr inbounds (%struct.s* @s, i64 0, i32 1, i64 0), align 4
  %cmp = icmp eq i32 %tmp, 1
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
