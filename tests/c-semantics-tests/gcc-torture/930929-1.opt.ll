; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/930929-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @sub1(i32 %i) nounwind uwtable readnone {
entry:
  %factor = shl i32 %i, 1
  %sub1 = add i32 %factor, -5
  ret i32 %sub1
}

define i32 @sub2(i32 %i) nounwind uwtable readnone {
entry:
  %factor = shl i32 %i, 1
  %add1 = add nsw i32 %factor, 5
  ret i32 %add1
}

define i32 @sub3(i32 %i) nounwind uwtable readnone {
entry:
  ret i32 -5
}

define i32 @sub4(i32 %i) nounwind uwtable readnone {
entry:
  ret i32 5
}

define i32 @main() noreturn nounwind uwtable {
if.end12:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
