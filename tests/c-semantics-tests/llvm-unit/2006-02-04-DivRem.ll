; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2006-02-04-DivRem.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [13 x i8] c"%u %u %u %u\0A\00", align 1
@i = common global i32 0, align 4

define void @test(i32 %X, i32 %Y) nounwind uwtable {
entry:
  %X.addr = alloca i32, align 4
  %Y.addr = alloca i32, align 4
  store i32 %X, i32* %X.addr, align 4
  store i32 %Y, i32* %Y.addr, align 4
  %0 = load i32* %X.addr, align 4
  %1 = load i32* %Y.addr, align 4
  %2 = load i32* %X.addr, align 4
  %3 = load i32* %Y.addr, align 4
  %and = and i32 %3, 15
  %shl = shl i32 8, %and
  %div = udiv i32 %2, %shl
  %4 = load i32* %X.addr, align 4
  %5 = load i32* %Y.addr, align 4
  %and1 = and i32 %5, 15
  %shl2 = shl i32 8, %and1
  %rem = urem i32 %4, %shl2
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str, i32 0, i32 0), i32 %0, i32 %1, i32 %div, i32 %rem)
  ret void
}

declare i32 @printf(i8*, ...)

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %l = alloca i64, align 8
  store i32 0, i32* %retval
  store i32 10, i32* @i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* @i, align 4
  %cmp = icmp slt i32 %0, 139045193
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* @i, align 4
  %2 = load i32* @i, align 4
  %xor = xor i32 %2, 12345
  call void @test(i32 %1, i32 %xor)
  %3 = load i32* @i, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* @i, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %4 = load i32* @i, align 4
  %mul = mul nsw i32 %4, -3
  store i32 %mul, i32* @i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}
