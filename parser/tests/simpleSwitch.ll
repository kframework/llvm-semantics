; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/simpleSwitch.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %retval1 = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 5, i32* %x, align 4
  store i32 0, i32* %retval1, align 4
  %tmp = load i32* %x, align 4
  switch i32 %tmp, label %sw.default [
    i32 4, label %sw.epilog
    i32 5, label %sw.bb
    i32 6, label %sw.bb3
  ]

sw.bb:                                            ; preds = %entry
  %tmp2 = load i32* %retval1, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %retval1, align 4
  br label %sw.bb3

sw.bb3:                                           ; preds = %entry, %sw.bb
  %tmp4 = load i32* %retval1, align 4
  %inc5 = add nsw i32 %tmp4, 1
  store i32 %inc5, i32* %retval1, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  %tmp6 = load i32* %retval1, align 4
  %inc7 = add nsw i32 %tmp6, 1
  store i32 %inc7, i32* %retval1, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb3, %entry
  %tmp8 = load i32* %x, align 4
  switch i32 %tmp8, label %sw.epilog11 [
    i32 5, label %sw.bb9
  ]

sw.bb9:                                           ; preds = %sw.epilog
  %tmp10 = load i32* %retval1, align 4
  %mul = mul nsw i32 %tmp10, 2
  store i32 %mul, i32* %retval1, align 4
  br label %sw.epilog11

sw.epilog11:                                      ; preds = %sw.bb9, %sw.epilog
  %tmp12 = load i32* %x, align 4
  switch i32 %tmp12, label %sw.default16 [
    i32 4, label %sw.bb13
    i32 6, label %sw.bb19
  ]

sw.bb13:                                          ; preds = %sw.epilog11
  %tmp14 = load i32* %retval1, align 4
  %mul15 = mul nsw i32 %tmp14, 2
  store i32 %mul15, i32* %retval1, align 4
  br label %sw.epilog22

sw.default16:                                     ; preds = %sw.epilog11
  %tmp17 = load i32* %retval1, align 4
  %mul18 = mul nsw i32 %tmp17, 3
  store i32 %mul18, i32* %retval1, align 4
  br label %sw.bb19

sw.bb19:                                          ; preds = %sw.epilog11, %sw.default16
  %tmp20 = load i32* %retval1, align 4
  %mul21 = mul nsw i32 %tmp20, 5
  store i32 %mul21, i32* %retval1, align 4
  br label %sw.epilog22

sw.epilog22:                                      ; preds = %sw.bb19, %sw.bb13
  %tmp23 = load i32* %retval1, align 4
  ret i32 %tmp23
}
