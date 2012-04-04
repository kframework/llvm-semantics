; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000717-4.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { i32, [4 x %struct.slot] }
%struct.slot = type { [6 x i32] }

@s = common global %struct.anon zeroinitializer, align 4

define i32 @x() nounwind uwtable {
entry:
  %toggle = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 0, i32* %toggle, align 4
  %0 = load i32* %toggle, align 4
  %tobool = icmp ne i32 %0, 0
  %lnot = xor i1 %tobool, true
  %lnot.ext = zext i1 %lnot to i32
  %idxprom = sext i32 %lnot.ext to i64
  %arrayidx = getelementptr inbounds [6 x i32]* getelementptr inbounds (%struct.anon* @s, i32 0, i32 1, i64 0, i32 0), i32 0, i64 %idxprom
  %1 = load i32* %arrayidx, align 4
  store i32 %1, i32* %r, align 4
  %2 = load i32* %r, align 4
  ret i32 %2
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  ret i32 0
}
