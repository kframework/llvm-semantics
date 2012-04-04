; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/920410-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %d = alloca [40000 x i32], align 16
  store i32 0, i32* %retval
  %arrayidx = getelementptr inbounds [40000 x i32]* %d, i32 0, i64 0
  store i32 0, i32* %arrayidx, align 4
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
