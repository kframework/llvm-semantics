; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr20187-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = global i32 257, align 4
@b = global i32 256, align 4

define i32 @test() nounwind uwtable {
entry:
  %0 = load i32* @a, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i32* @a, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %1, %cond.true ], [ 1, %cond.false ]
  %2 = load i32* @a, align 4
  %3 = load i32* @b, align 4
  %mul = mul nsw i32 %2, %3
  %and = and i32 %cond, %mul
  %conv = sext i32 %and to i64
  %conv1 = trunc i64 %conv to i8
  %conv2 = zext i8 %conv1 to i32
  %tobool3 = icmp ne i32 %conv2, 0
  %cond4 = select i1 %tobool3, i32 0, i32 1
  ret i32 %cond4
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @test()
  %sub = sub nsw i32 1, %call
  ret i32 %sub
}
