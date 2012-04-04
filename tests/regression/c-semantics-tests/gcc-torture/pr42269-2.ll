; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr42269-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@s = global i16 -1, align 2

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = load i16* @s, align 2
  %call = call i64 @foo(i16 zeroext %0)
  %add = add nsw i64 %call, 1
  %cmp = icmp ne i64 %add, 0
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define internal i64 @foo(i16 zeroext %s) nounwind uwtable noinline {
entry:
  %s.addr = alloca i16, align 2
  store i16 %s, i16* %s.addr, align 2
  %0 = load i16* %s.addr, align 2
  %conv = sext i16 %0 to i64
  ret i64 %conv
}
