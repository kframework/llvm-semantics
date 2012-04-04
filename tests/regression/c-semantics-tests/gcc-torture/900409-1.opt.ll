; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/900409-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i64 @f1(i64 %a) nounwind uwtable readnone {
entry:
  %and = and i64 %a, 4278190080
  ret i64 %and
}

define i64 @f2(i64 %a) nounwind uwtable readnone {
entry:
  %and = and i64 %a, -4278190081
  ret i64 %and
}

define i64 @f3(i64 %a) nounwind uwtable readnone {
entry:
  %and = and i64 %a, 255
  ret i64 %and
}

define i64 @f4(i64 %a) nounwind uwtable readnone {
entry:
  %and = and i64 %a, -256
  ret i64 %and
}

define i64 @f5(i64 %a) nounwind uwtable readnone {
entry:
  %and = and i64 %a, 65535
  ret i64 %and
}

define i64 @f6(i64 %a) nounwind uwtable readnone {
entry:
  %and = and i64 %a, -65536
  ret i64 %and
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
