; ModuleID = '/home/david/src/c-semantics/tests/unitTests/unknowns.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %x = alloca i8, align 1
  %0 = load i8* %x, align 1
  %conv = zext i8 %0 to i32
  %neg = xor i32 %conv, -1
  %1 = load i8* %x, align 1
  %conv1 = zext i8 %1 to i32
  %xor = xor i32 %conv1, 5
  %2 = load i8* %x, align 1
  %conv2 = zext i8 %2 to i32
  %or = or i32 %conv2, 5
  %3 = load i8* %x, align 1
  %conv3 = zext i8 %3 to i32
  %and = and i32 %conv3, 5
  %4 = load i8* %x, align 1
  %conv4 = zext i8 %4 to i32
  %and5 = and i32 %conv4, 0
  %5 = load i8* %x, align 1
  %conv6 = zext i8 %5 to i32
  %xor7 = xor i32 5, %conv6
  %6 = load i8* %x, align 1
  %conv8 = zext i8 %6 to i32
  %or9 = or i32 5, %conv8
  %7 = load i8* %x, align 1
  %conv10 = zext i8 %7 to i32
  %and11 = and i32 5, %conv10
  %8 = load i8* %x, align 1
  %conv12 = zext i8 %8 to i32
  %and13 = and i32 0, %conv12
  ret i32 0
}
