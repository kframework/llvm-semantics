; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/930208-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i64 %u.coerce) nounwind uwtable readnone {
entry:
  %sext.mask = and i64 %u.coerce, 16711680
  %cmp = icmp eq i64 %sext.mask, 131072
  br i1 %cmp, label %lor.rhs, label %lor.end

lor.rhs:                                          ; preds = %entry
  %sext = and i64 %u.coerce, 65280
  %cmp7 = icmp ne i64 %sext, 512
  br label %lor.end

lor.end:                                          ; preds = %entry, %lor.rhs
  %0 = phi i1 [ true, %entry ], [ %cmp7, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  ret i32 %lor.ext
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
