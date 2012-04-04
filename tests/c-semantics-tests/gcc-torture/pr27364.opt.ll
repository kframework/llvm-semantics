; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr27364.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i32 %number_of_digits_to_use) nounwind uwtable readnone {
entry:
  %cmp = icmp ugt i32 %number_of_digits_to_use, 1294
  br i1 %cmp, label %return, label %if.end

if.end:                                           ; preds = %entry
  %mul = mul i32 %number_of_digits_to_use, 3321928
  %div = udiv i32 %mul, 1000000
  %add = add i32 %div, 1
  %div1 = lshr i32 %add, 4
  br label %return

return:                                           ; preds = %entry, %if.end
  %retval.0 = phi i32 [ %div1, %if.end ], [ 0, %entry ]
  ret i32 %retval.0
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
