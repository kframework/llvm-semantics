; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/990117-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo(i32 %x, i32 %y, i32 %i, i32 %j) nounwind uwtable readnone {
entry:
  %conv = sitofp i32 %x to double
  %conv1 = sitofp i32 %y to double
  %div = fdiv double %conv, %conv1
  %conv2 = sitofp i32 %i to double
  %conv3 = sitofp i32 %j to double
  %div4 = fdiv double %conv2, %conv3
  %cmp = fcmp olt double %div, %div4
  %conv5 = zext i1 %cmp to i32
  ret i32 %conv5
}

define i32 @main() nounwind uwtable {
entry:
  ret i32 0
}
