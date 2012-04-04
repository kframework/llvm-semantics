; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20010518-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @add(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i32 %f, i32 %g, i32 %h, i32 %i, i32 %j, i32 %k, i32 %l, i32 %m) nounwind uwtable readnone {
entry:
  %add = add i32 %b, %a
  %add1 = add i32 %add, %c
  %add2 = add i32 %add1, %d
  %add3 = add i32 %add2, %e
  %add4 = add i32 %add3, %f
  %add5 = add i32 %add4, %g
  %add6 = add i32 %add5, %h
  %add7 = add i32 %add6, %i
  %add8 = add i32 %add7, %j
  %add9 = add i32 %add8, %k
  %add10 = add i32 %add9, %l
  %add11 = add i32 %add10, %m
  ret i32 %add11
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
