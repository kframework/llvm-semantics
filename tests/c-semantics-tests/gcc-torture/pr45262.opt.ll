; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr45262.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo(i32 %x) nounwind uwtable readnone {
entry:
  %cmp = icmp slt i32 %x, 0
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %sub = sub i32 0, %x
  %cmp1 = icmp slt i32 %sub, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %0 = phi i1 [ true, %entry ], [ %cmp1, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  ret i32 %lor.ext
}

define i32 @bar(i32 %x) nounwind uwtable readnone {
entry:
  %tobool = icmp slt i32 %x, 0
  br i1 %tobool, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %sub = sub i32 0, %x
  %tobool2 = icmp slt i32 %sub, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %0 = phi i1 [ true, %entry ], [ %tobool2, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  ret i32 %lor.ext
}

define i32 @main() nounwind uwtable {
if.end20:
  ret i32 0
}
