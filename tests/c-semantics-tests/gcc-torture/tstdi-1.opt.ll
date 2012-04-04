; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/tstdi-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @feq(i64 %x) nounwind uwtable readnone {
entry:
  %cmp = icmp eq i64 %x, 0
  %. = select i1 %cmp, i32 13, i32 140
  ret i32 %.
}

define i32 @fne(i64 %x) nounwind uwtable readnone {
entry:
  %cmp = icmp eq i64 %x, 0
  %. = select i1 %cmp, i32 140, i32 13
  ret i32 %.
}

define i32 @flt(i64 %x) nounwind uwtable readnone {
entry:
  %cmp = icmp slt i64 %x, 0
  %. = select i1 %cmp, i32 13, i32 140
  ret i32 %.
}

define i32 @fge(i64 %x) nounwind uwtable readnone {
entry:
  %cmp = icmp sgt i64 %x, -1
  %. = select i1 %cmp, i32 13, i32 140
  ret i32 %.
}

define i32 @fgt(i64 %x) nounwind uwtable readnone {
entry:
  %cmp = icmp sgt i64 %x, 0
  %. = select i1 %cmp, i32 13, i32 140
  ret i32 %.
}

define i32 @fle(i64 %x) nounwind uwtable readnone {
entry:
  %cmp = icmp slt i64 %x, 1
  %. = select i1 %cmp, i32 13, i32 140
  ret i32 %.
}

define i32 @main() noreturn nounwind uwtable {
if.end140:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
