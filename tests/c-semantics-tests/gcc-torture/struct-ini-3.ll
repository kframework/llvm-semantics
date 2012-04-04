; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/struct-ini-3.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { i8, i8, [2 x i8] }

@result = global %struct.anon { i8 -1, i8 15, [2 x i8] undef }, align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = load i32* bitcast (%struct.anon* @result to i32*), align 4
  %1 = lshr i32 %0, 2
  %bf.clear = and i32 %1, 7
  %and = and i32 %bf.clear, -8
  %cmp = icmp ne i32 %and, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32* bitcast (%struct.anon* @result to i32*), align 4
  %3 = lshr i32 %2, 5
  %bf.clear1 = and i32 %3, 7
  %and2 = and i32 %bf.clear1, -8
  %cmp3 = icmp ne i32 %and2, 0
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %4 = load i32* %retval
  ret i32 %4
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
