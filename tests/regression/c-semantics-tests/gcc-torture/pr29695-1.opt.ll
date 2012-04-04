; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr29695-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f1() nounwind uwtable readnone {
entry:
  ret i32 128
}

define i32 @f2() nounwind uwtable readnone {
entry:
  ret i32 128
}

define i32 @f3() nounwind uwtable readnone {
entry:
  ret i32 896
}

define i32 @f4() nounwind uwtable readnone {
entry:
  ret i32 -128
}

define i64 @f5() nounwind uwtable readnone {
entry:
  ret i64 2147483648
}

define i64 @f6() nounwind uwtable readnone {
entry:
  ret i64 2147483648
}

define i64 @f7() nounwind uwtable readnone {
entry:
  ret i64 15032385536
}

define i64 @f8() nounwind uwtable readnone {
entry:
  ret i64 -2147483648
}

define i32 @main() nounwind uwtable readnone {
entry:
  ret i32 0
}
