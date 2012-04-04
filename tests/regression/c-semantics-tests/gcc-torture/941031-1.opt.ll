; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/941031-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i64 %us, i64 %vs) nounwind uwtable readnone {
entry:
  %cmp1 = icmp sgt i64 %vs, -1
  %sub4 = sub nsw i64 0, %vs
  %cond6 = select i1 %cmp1, i64 %vs, i64 %sub4
  %conv = trunc i64 %cond6 to i32
  ret i32 %conv
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
