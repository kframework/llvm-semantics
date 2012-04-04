; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20001009-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = common global i32 0, align 4
@b = common global i32 0, align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  %f = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 -2, i32* %c, align 4
  store i32 254, i32* %d, align 4
  %0 = load i32* @a, align 4
  %and = and i32 %0, 1
  store i32 %and, i32* %e, align 4
  %1 = load i32* @b, align 4
  %and1 = and i32 %1, 2
  store i32 %and1, i32* %f, align 4
  %2 = load i32* %c, align 4
  %3 = load i32* %e, align 4
  %4 = load i32* %f, align 4
  %and2 = and i32 %3, %4
  %or = or i32 %2, %and2
  %conv = trunc i32 %or to i8
  %conv3 = sext i8 %conv to i32
  %5 = load i32* %d, align 4
  %conv4 = trunc i32 %5 to i8
  %conv5 = sext i8 %conv4 to i32
  %cmp = icmp eq i32 %conv3, %conv5
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  ret i32 0

if.else:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind
