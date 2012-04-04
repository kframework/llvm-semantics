; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/950607-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i64 %basePt.coerce0, i64 %basePt.coerce1, i64 %pt1.coerce0, i64 %pt1.coerce1, i64 %pt2.coerce0, i64 %pt2.coerce1) nounwind uwtable readnone {
entry:
  %sub = sub nsw i64 %pt1.coerce0, %basePt.coerce0
  %sub3 = sub nsw i64 %pt2.coerce1, %basePt.coerce1
  %mul = mul nsw i64 %sub3, %sub
  %sub6 = sub nsw i64 %pt1.coerce1, %basePt.coerce1
  %sub9 = sub nsw i64 %pt2.coerce0, %basePt.coerce0
  %mul10 = mul nsw i64 %sub9, %sub6
  %sub11 = sub nsw i64 %mul, %mul10
  %cmp = icmp sgt i64 %sub11, 0
  br i1 %cmp, label %return, label %if.else

if.else:                                          ; preds = %entry
  %cmp12 = icmp slt i64 %sub11, 0
  %. = select i1 %cmp12, i32 1, i32 2
  br label %return

return:                                           ; preds = %if.else, %entry
  %retval.0 = phi i32 [ 0, %entry ], [ %., %if.else ]
  ret i32 %retval.0
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
