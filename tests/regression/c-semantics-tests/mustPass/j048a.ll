; ModuleID = '/home/david/src/c-semantics/tests/mustPass/j048a.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %a = alloca [3 x i32], align 4
  %b = alloca [2 x i32], align 4
  %arrayidx = getelementptr inbounds [3 x i32]* %a, i32 0, i64 2
  %arrayidx1 = getelementptr inbounds [3 x i32]* %a, i32 0, i64 1
  %sub.ptr.lhs.cast = ptrtoint i32* %arrayidx to i64
  %sub.ptr.rhs.cast = ptrtoint i32* %arrayidx1 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 4
  ret i32 0
}
