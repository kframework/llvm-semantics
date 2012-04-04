; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20041210-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@x = global [4 x i32] [i32 -1073741824, i32 2147483647, i32 2, i32 4], align 16

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = load i32* getelementptr inbounds ([4 x i32]* @x, i32 0, i64 0), align 4
  %1 = load i32* getelementptr inbounds ([4 x i32]* @x, i32 0, i64 1), align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %if.then, label %if.end3

if.then:                                          ; preds = %entry
  %2 = load i32* getelementptr inbounds ([4 x i32]* @x, i32 0, i64 2), align 4
  %3 = load i32* getelementptr inbounds ([4 x i32]* @x, i32 0, i64 3), align 4
  %and = and i32 %2, %3
  %cmp1 = icmp slt i32 %and, 0
  br i1 %cmp1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  br label %if.end3

if.end3:                                          ; preds = %if.end, %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %4 = load i32* %retval
  ret i32 %4
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
