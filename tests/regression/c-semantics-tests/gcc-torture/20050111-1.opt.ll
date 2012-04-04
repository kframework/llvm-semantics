; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20050111-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo(i64 %x) nounwind uwtable readnone {
entry:
  %cmp = icmp eq i64 %x, 0
  br i1 %cmp, label %return, label %if.end

if.end:                                           ; preds = %entry
  %shr = lshr i64 %x, 32
  %conv = trunc i64 %shr to i32
  br label %return

return:                                           ; preds = %entry, %if.end
  %retval.0 = phi i32 [ %conv, %if.end ], [ 0, %entry ]
  ret i32 %retval.0
}

define i64 @bar(i16 zeroext %x) nounwind uwtable readnone {
entry:
  %conv = zext i16 %x to i64
  %shl = shl nuw nsw i64 %conv, 32
  ret i64 %shl
}

define i32 @main() nounwind uwtable {
if.end16:
  ret i32 0
}
