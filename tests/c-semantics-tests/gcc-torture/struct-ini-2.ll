; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/struct-ini-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@x = global { i8, i8, [2 x i8] } { i8 2, i8 67, [2 x i8] undef }, align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = load i32* bitcast ({ i8, i8, [2 x i8] }* @x to i32*), align 4
  %bf.clear = and i32 %0, 15
  %1 = shl i32 %bf.clear, 28
  %bf.val.sext = ashr i32 %1, 28
  %cmp = icmp ne i32 %bf.val.sext, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %2 = load i32* bitcast ({ i8, i8, [2 x i8] }* @x to i32*), align 4
  %3 = lshr i32 %2, 8
  %bf.clear1 = and i32 %3, 15
  %4 = shl i32 %bf.clear1, 28
  %bf.val.sext2 = ashr i32 %4, 28
  %cmp3 = icmp ne i32 %bf.val.sext2, 3
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end5:                                          ; preds = %if.end
  %5 = load i32* bitcast ({ i8, i8, [2 x i8] }* @x to i32*), align 4
  %6 = lshr i32 %5, 12
  %bf.clear6 = and i32 %6, 15
  %7 = shl i32 %bf.clear6, 28
  %bf.val.sext7 = ashr i32 %7, 28
  %cmp8 = icmp ne i32 %bf.val.sext7, 4
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end5
  call void @abort() noreturn nounwind
  unreachable

if.end10:                                         ; preds = %if.end5
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %8 = load i32* %retval
  ret i32 %8
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
