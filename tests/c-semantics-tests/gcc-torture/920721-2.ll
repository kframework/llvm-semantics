; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/920721-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @f() nounwind uwtable {
entry:
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %n = alloca i32, align 4
  %saved_stack = alloca i8*
  store i32 0, i32* %retval
  store i32 2, i32* %n, align 4
  %0 = load i32* %n, align 4
  %1 = zext i32 %0 to i64
  %2 = call i8* @llvm.stacksave()
  store i8* %2, i8** %saved_stack
  %vla = alloca double, i64 %1, align 16
  call void @f()
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %3 = load i32* %retval
  ret i32 %3
}

declare i8* @llvm.stacksave() nounwind

declare void @exit(i32) noreturn nounwind
