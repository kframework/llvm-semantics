; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/unknowns.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca i8, align 1
  store i32 0, i32* %retval
  %tmp = load i8* %x, align 1
  %conv = zext i8 %tmp to i32
  %neg = xor i32 %conv, -1
  %tmp1 = load i8* %x, align 1
  %conv2 = zext i8 %tmp1 to i32
  %xor = xor i32 %conv2, 5
  %tmp3 = load i8* %x, align 1
  %conv4 = zext i8 %tmp3 to i32
  %or = or i32 %conv4, 5
  %tmp5 = load i8* %x, align 1
  %conv6 = zext i8 %tmp5 to i32
  %and = and i32 %conv6, 5
  %tmp7 = load i8* %x, align 1
  %conv8 = zext i8 %tmp7 to i32
  %and9 = and i32 %conv8, 0
  %tmp10 = load i8* %x, align 1
  %conv11 = zext i8 %tmp10 to i32
  %xor12 = xor i32 5, %conv11
  %tmp13 = load i8* %x, align 1
  %conv14 = zext i8 %tmp13 to i32
  %or15 = or i32 5, %conv14
  %tmp16 = load i8* %x, align 1
  %conv17 = zext i8 %tmp16 to i32
  %and18 = and i32 5, %conv17
  %tmp19 = load i8* %x, align 1
  %conv20 = zext i8 %tmp19 to i32
  %and21 = and i32 0, %conv20
  %0 = load i32* %retval
  ret i32 %0
}
