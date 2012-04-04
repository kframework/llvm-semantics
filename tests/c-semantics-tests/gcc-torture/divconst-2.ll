; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/divconst-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@nums = global [3 x i64] [i64 -1, i64 2147483647, i64 -2147483648], align 16

define i64 @f(i64 %x) nounwind uwtable {
entry:
  %x.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  %0 = load i64* %x.addr, align 8
  %div = sdiv i64 %0, -2147483648
  ret i64 %div
}

define i64 @r(i64 %x) nounwind uwtable {
entry:
  %x.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  %0 = load i64* %x.addr, align 8
  %rem = srem i64 %0, -2147483648
  ret i64 %rem
}

define i64 @std_eqn(i64 %num, i64 %denom, i64 %quot, i64 %rem) nounwind uwtable {
entry:
  %num.addr = alloca i64, align 8
  %denom.addr = alloca i64, align 8
  %quot.addr = alloca i64, align 8
  %rem.addr = alloca i64, align 8
  store i64 %num, i64* %num.addr, align 8
  store i64 %denom, i64* %denom.addr, align 8
  store i64 %quot, i64* %quot.addr, align 8
  store i64 %rem, i64* %rem.addr, align 8
  %0 = load i64* %quot.addr, align 8
  %mul = mul nsw i64 %0, -2147483648
  %1 = load i64* %rem.addr, align 8
  %add = add nsw i64 %mul, %1
  %2 = load i64* %num.addr, align 8
  %cmp = icmp eq i64 %add, %2
  %conv = zext i1 %cmp to i32
  %conv1 = sext i32 %conv to i64
  ret i64 %conv1
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %conv = sext i32 %0 to i64
  %cmp = icmp ult i64 %conv, 3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds [3 x i64]* @nums, i32 0, i64 %idxprom
  %2 = load i64* %arrayidx, align 8
  %3 = load i32* %i, align 4
  %idxprom2 = sext i32 %3 to i64
  %arrayidx3 = getelementptr inbounds [3 x i64]* @nums, i32 0, i64 %idxprom2
  %4 = load i64* %arrayidx3, align 8
  %call = call i64 @f(i64 %4)
  %5 = load i32* %i, align 4
  %idxprom4 = sext i32 %5 to i64
  %arrayidx5 = getelementptr inbounds [3 x i64]* @nums, i32 0, i64 %idxprom4
  %6 = load i64* %arrayidx5, align 8
  %call6 = call i64 @r(i64 %6)
  %call7 = call i64 @std_eqn(i64 %2, i64 -2147483648, i64 %call, i64 %call6)
  %cmp8 = icmp eq i64 %call7, 0
  br i1 %cmp8, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %7 = load i32* %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %8 = load i32* %retval
  ret i32 %8
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
