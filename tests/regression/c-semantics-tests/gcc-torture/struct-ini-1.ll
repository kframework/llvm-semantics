; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/struct-ini-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i8, [2 x i32] }

@object = global %struct.S { i8 88, [2 x i32] [i32 8, i32 9] }, align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = load i8* getelementptr inbounds (%struct.S* @object, i32 0, i32 0), align 1
  %conv = sext i8 %0 to i32
  %cmp = icmp ne i32 %conv, 88
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32* getelementptr inbounds (%struct.S* @object, i32 0, i32 1, i64 0), align 4
  %cmp2 = icmp ne i32 %1, 8
  br i1 %cmp2, label %if.then, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %lor.lhs.false
  %2 = load i32* getelementptr inbounds (%struct.S* @object, i32 0, i32 1, i64 1), align 4
  %cmp5 = icmp ne i32 %2, 9
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false4, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false4
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %3 = load i32* %retval
  ret i32 %3
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
