; ModuleID = '/home/david/src/c-semantics/tests/mustPass/j304a.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %n = alloca i32, align 4
  %m = alloca i32, align 4
  %saved_stack = alloca i8*
  %p = alloca [6 x i32]*, align 8
  %cleanup.dest.slot = alloca i32
  store i32 0, i32* %retval
  store i32 3, i32* %n, align 4
  store i32 4, i32* %m, align 4
  %0 = load i32* %n, align 4
  %1 = zext i32 %0 to i64
  %2 = call i8* @llvm.stacksave()
  store i8* %2, i8** %saved_stack
  %vla = alloca [6 x i32], i64 %1, align 16
  store [6 x i32]* %vla, [6 x i32]** %p, align 8
  store i32 0, i32* %retval
  store i32 1, i32* %cleanup.dest.slot
  %3 = load i8** %saved_stack
  call void @llvm.stackrestore(i8* %3)
  %4 = load i32* %retval
  ret i32 %4
}

declare i8* @llvm.stacksave() nounwind

declare void @llvm.stackrestore(i8*) nounwind
