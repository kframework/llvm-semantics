; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/divmod-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @div1(i8 signext %x) nounwind uwtable readnone {
entry:
  %conv = sext i8 %x to i32
  %div = sub i32 0, %conv
  ret i32 %div
}

define i32 @div2(i16 signext %x) nounwind uwtable readnone {
entry:
  %conv = sext i16 %x to i32
  %div = sub i32 0, %conv
  ret i32 %div
}

define i32 @div3(i8 signext %x, i8 signext %y) nounwind uwtable readnone {
entry:
  %conv = sext i8 %x to i32
  %conv1 = sext i8 %y to i32
  %div = sdiv i32 %conv, %conv1
  ret i32 %div
}

define i32 @div4(i16 signext %x, i16 signext %y) nounwind uwtable readnone {
entry:
  %conv = sext i16 %x to i32
  %conv1 = sext i16 %y to i32
  %div = sdiv i32 %conv, %conv1
  ret i32 %div
}

define i32 @mod1(i8 signext %x) nounwind uwtable readnone {
entry:
  ret i32 0
}

define i32 @mod2(i16 signext %x) nounwind uwtable readnone {
entry:
  ret i32 0
}

define i32 @mod3(i8 signext %x, i8 signext %y) nounwind uwtable readnone {
entry:
  %conv = sext i8 %x to i32
  %conv1 = sext i8 %y to i32
  %rem = srem i32 %conv, %conv1
  ret i32 %rem
}

define i32 @mod4(i16 signext %x, i16 signext %y) nounwind uwtable readnone {
entry:
  %conv = sext i16 %x to i32
  %conv1 = sext i16 %y to i32
  %rem = srem i32 %conv, %conv1
  ret i32 %rem
}

define i64 @mod5(i64 %x, i64 %y) nounwind uwtable readnone {
entry:
  %rem = srem i64 %x, %y
  ret i64 %rem
}

define i64 @mod6(i64 %x, i64 %y) nounwind uwtable readnone {
entry:
  %rem = urem i64 %x, %y
  ret i64 %rem
}

define i32 @main() noreturn nounwind uwtable {
if.end36:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
