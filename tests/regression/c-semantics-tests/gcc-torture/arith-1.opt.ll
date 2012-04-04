; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/arith-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @sat_add(i32 %i) nounwind uwtable readnone {
entry:
  %uadd = tail call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %i, i32 1)
  %0 = extractvalue { i32, i1 } %uadd, 0
  %cmp = extractvalue { i32, i1 } %uadd, 1
  %i. = select i1 %cmp, i32 %i, i32 %0
  ret i32 %i.
}

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

declare { i32, i1 } @llvm.uadd.with.overflow.i32(i32, i32) nounwind readnone
