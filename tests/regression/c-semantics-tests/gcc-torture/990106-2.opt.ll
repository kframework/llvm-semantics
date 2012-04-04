; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/990106-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @calc_mp(i32 %mod) nounwind uwtable readnone {
entry:
  %div = urem i32 -1, %mod
  %sub = add i32 %div, 1
  %cmp = icmp ugt i32 %sub, %mod
  %sub1 = select i1 %cmp, i32 %mod, i32 0
  %sub1.sub = sub i32 %sub, %sub1
  ret i32 %sub1.sub
}

define i32 @main(i32 %argc, i8** nocapture %argv) noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
