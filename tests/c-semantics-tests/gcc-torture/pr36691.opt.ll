; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr36691.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_5 = common global i8 0, align 1

define void @func_1() nounwind uwtable {
entry:
  store i8 0, i8* @g_5, align 1
  ret void
}

define i32 @main() nounwind uwtable {
if.end:
  store i8 0, i8* @g_5, align 1
  ret i32 0
}
