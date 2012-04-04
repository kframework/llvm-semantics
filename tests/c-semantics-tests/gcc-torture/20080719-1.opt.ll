; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20080719-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@cfb_tab8_be = internal constant [16 x i32] [i32 0, i32 255, i32 65280, i32 65535, i32 16711680, i32 16711935, i32 16776960, i32 16777215, i32 -16777216, i32 -16776961, i32 -16711936, i32 -16711681, i32 -65536, i32 -65281, i32 -256, i32 -1], align 16
@cfb_tab16_be = internal constant [4 x i32] [i32 0, i32 65535, i32 -65536, i32 -1], align 16
@cfb_tab32 = internal constant [2 x i32] [i32 0, i32 -1], align 4

define i32* @xxx(i32 %bpp) nounwind uwtable readnone {
entry:
  switch i32 %bpp, label %sw.default [
    i32 8, label %sw.epilog
    i32 16, label %sw.bb1
  ]

sw.bb1:                                           ; preds = %entry
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  br label %sw.epilog

sw.epilog:                                        ; preds = %entry, %sw.default, %sw.bb1
  %tab.0 = phi i32* [ getelementptr inbounds ([2 x i32]* @cfb_tab32, i64 0, i64 0), %sw.default ], [ getelementptr inbounds ([4 x i32]* @cfb_tab16_be, i64 0, i64 0), %sw.bb1 ], [ getelementptr inbounds ([16 x i32]* @cfb_tab8_be, i64 0, i64 0), %entry ]
  ret i32* %tab.0
}

define i32 @main() nounwind uwtable {
if.end:
  ret i32 0
}
