; ModuleID = '<stdin>'

define i64 @bar(i32 %x) nounwind {
  %y = lshr i32 %x, 30
  %r = udiv i32 %y, 3
  %z1 = zext i32 %r to i64
  ret i64 %z1
}

define i64 @qux(i32 %x, i32 %v) nounwind {
  %y = lshr i32 %x, 31
  %r = udiv i32 %y, %v
  %z1 = zext i32 %r to i64
  ret i64 %z1
}
