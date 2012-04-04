; ModuleID = '/home/david/src/c-semantics/tests/mustPass/j076a.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %x = alloca i32, align 4
  %saved_stack = alloca i8*
  store i32 -5, i32* %x, align 4
  %0 = load i32* %x, align 4
  %sub = sub nsw i32 0, %0
  %1 = zext i32 %sub to i64
  %2 = call i8* @llvm.stacksave()
  store i8* %2, i8** %saved_stack
  %vla = alloca i32, i64 %1, align 16
  %3 = load i8** %saved_stack
  call void @llvm.stackrestore(i8* %3)
  ret i32 0
}

declare i8* @llvm.stacksave() nounwind

declare void @llvm.stackrestore(i8*) nounwind
