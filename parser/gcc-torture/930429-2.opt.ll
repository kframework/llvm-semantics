; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/930429-2.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i32 %b) nounwind uwtable readnone {
entry:
  %shr = ashr i32 %b, 1
  %cmp = icmp sgt i32 %shr, 0
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @main() noreturn nounwind uwtable {
if.end4:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn
