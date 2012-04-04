; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/divconst-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@nums = global [3 x i64] [i64 -1, i64 2147483647, i64 -2147483648], align 16

define i64 @f(i64 %x) nounwind uwtable readnone {
entry:
  %div = sdiv i64 %x, -2147483648
  ret i64 %div
}

define i64 @r(i64 %x) nounwind uwtable readnone {
entry:
  %rem = srem i64 %x, 2147483648
  ret i64 %rem
}

define i64 @std_eqn(i64 %num, i64 %denom, i64 %quot, i64 %rem) nounwind uwtable readnone {
entry:
  %mul = mul nsw i64 %quot, -2147483648
  %add = add nsw i64 %mul, %rem
  %cmp = icmp eq i64 %add, %num
  %conv1 = zext i1 %cmp to i64
  ret i64 %conv1
}

define i32 @main() noreturn nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %entry ]
  %0 = trunc i64 %indvars.iv to i32
  %cmp = icmp ult i32 %0, 3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %indvars.iv.next = add i64 %indvars.iv, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
