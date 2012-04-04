; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/990326-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @a1() nounwind uwtable readnone {
entry:
  ret i32 1
}

define i32 @a2() nounwind uwtable readnone {
entry:
  ret i32 1
}

define i32 @a3() nounwind uwtable readnone {
entry:
  ret i32 1
}

define i32 @b1() nounwind uwtable readnone {
entry:
  ret i32 1
}

define i32 @b2() nounwind uwtable readnone {
entry:
  ret i32 1
}

define i32 @b3() nounwind uwtable readnone {
entry:
  ret i32 1
}

define i32 @c1() nounwind uwtable readnone {
entry:
  ret i32 1
}

define i32 @c2() nounwind uwtable readnone {
entry:
  ret i32 1
}

define i32 @c3() nounwind uwtable readnone {
entry:
  ret i32 1
}

define i32 @d1() nounwind uwtable readnone {
entry:
  ret i32 1
}

define i32 @d2() nounwind uwtable readnone {
entry:
  ret i32 1
}

define i32 @d3() nounwind uwtable readnone {
entry:
  ret i32 1
}

define i32 @e1() nounwind uwtable readnone {
entry:
  ret i32 1
}

define i32 @e2() nounwind uwtable readnone {
entry:
  ret i32 1
}

define i32 @e3() nounwind uwtable readnone {
entry:
  ret i32 1
}

define i32 @e4() nounwind uwtable readnone {
entry:
  ret i32 1
}

define i32 @f1() nounwind uwtable readnone {
entry:
  ret i32 1
}

define i32 @f2() nounwind uwtable readnone {
entry:
  ret i32 1
}

define i32 @f3() nounwind uwtable readnone {
entry:
  ret i32 1
}

define i32 @f4() nounwind uwtable readnone {
entry:
  ret i32 1
}

define i32 @g1() nounwind uwtable readnone {
entry:
  ret i32 1
}

define i32 @g2() nounwind uwtable readnone {
entry:
  ret i32 1
}

define i32 @g3() nounwind uwtable readnone {
entry:
  ret i32 1
}

define i32 @g4() nounwind uwtable readnone {
entry:
  ret i32 0
}

define i32 @g5() nounwind uwtable readnone {
entry:
  ret i32 0
}

define i32 @g6() nounwind uwtable readnone {
entry:
  ret i32 1
}

define i32 @g7() nounwind uwtable readnone {
entry:
  ret i32 1
}

define i32 @h1() nounwind uwtable readnone {
entry:
  ret i32 1
}

define i32 @h2() nounwind uwtable readnone {
entry:
  ret i32 1
}

define i32 @h3() nounwind uwtable readnone {
entry:
  ret i32 1
}

define i32 @h4() nounwind uwtable readnone {
entry:
  ret i32 0
}

define i32 @h5() nounwind uwtable readnone {
entry:
  ret i32 0
}

define i32 @h6() nounwind uwtable readnone {
entry:
  ret i32 1
}

define i32 @h7() nounwind uwtable readnone {
entry:
  ret i32 1
}

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
