; ModuleID = '/home/david/src/c-semantics/tests/unitTests/simpleSwitch.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %retval1 = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 5, i32* %x, align 4
  store i32 0, i32* %retval1, align 4
  %0 = load i32* %x, align 4
  switch i32 %0, label %sw.default [
    i32 4, label %sw.epilog
    i32 5, label %sw.bb
    i32 6, label %sw.bb2
  ]

sw.bb:                                            ; preds = %entry
  %1 = load i32* %retval1, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* %retval1, align 4
  br label %sw.bb2

sw.bb2:                                           ; preds = %entry, %sw.bb
  %2 = load i32* %retval1, align 4
  %inc3 = add nsw i32 %2, 1
  store i32 %inc3, i32* %retval1, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  %3 = load i32* %retval1, align 4
  %inc4 = add nsw i32 %3, 1
  store i32 %inc4, i32* %retval1, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb2, %entry
  %4 = load i32* %x, align 4
  switch i32 %4, label %sw.epilog6 [
    i32 5, label %sw.bb5
  ]

sw.bb5:                                           ; preds = %sw.epilog
  %5 = load i32* %retval1, align 4
  %mul = mul nsw i32 %5, 2
  store i32 %mul, i32* %retval1, align 4
  br label %sw.epilog6

sw.epilog6:                                       ; preds = %sw.bb5, %sw.epilog
  %6 = load i32* %x, align 4
  switch i32 %6, label %sw.default9 [
    i32 4, label %sw.bb7
    i32 6, label %sw.bb11
  ]

sw.bb7:                                           ; preds = %sw.epilog6
  %7 = load i32* %retval1, align 4
  %mul8 = mul nsw i32 %7, 2
  store i32 %mul8, i32* %retval1, align 4
  br label %sw.epilog13

sw.default9:                                      ; preds = %sw.epilog6
  %8 = load i32* %retval1, align 4
  %mul10 = mul nsw i32 %8, 3
  store i32 %mul10, i32* %retval1, align 4
  br label %sw.bb11

sw.bb11:                                          ; preds = %sw.epilog6, %sw.default9
  %9 = load i32* %retval1, align 4
  %mul12 = mul nsw i32 %9, 5
  store i32 %mul12, i32* %retval1, align 4
  br label %sw.epilog13

sw.epilog13:                                      ; preds = %sw.bb11, %sw.bb7
  %10 = load i32* %retval1, align 4
  ret i32 %10
}
