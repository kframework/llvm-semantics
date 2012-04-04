; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/regehr02.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo() nounwind uwtable {
entry:
  %x = alloca i8, align 1
  %y = alloca i8, align 1
  store i8 1, i8* %x, align 1
  store i8 -1, i8* %y, align 1
  %tmp = load i8* %x, align 1
  %conv = sext i8 %tmp to i32
  %tmp1 = load i8* %y, align 1
  %conv2 = zext i8 %tmp1 to i32
  %cmp = icmp sgt i32 %conv, %conv2
  %conv3 = zext i1 %cmp to i32
  ret i32 %conv3
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @foo()
  ret i32 %call
}
