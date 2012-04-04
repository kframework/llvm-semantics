; ModuleID = '/home/david/src/c-semantics/tests/unitTests/regehr02.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo() nounwind uwtable {
entry:
  %x = alloca i8, align 1
  %y = alloca i8, align 1
  store i8 1, i8* %x, align 1
  store i8 -1, i8* %y, align 1
  %0 = load i8* %x, align 1
  %conv = sext i8 %0 to i32
  %1 = load i8* %y, align 1
  %conv1 = zext i8 %1 to i32
  %cmp = icmp sgt i32 %conv, %conv1
  %conv2 = zext i1 %cmp to i32
  ret i32 %conv2
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @foo()
  ret i32 %call
}
