; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/two-link2.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@foo = external global i8*

define i32 @main(i32 %argv, i8** nocapture %argc) nounwind uwtable {
entry:
  store i8* null, i8** @foo, align 8
  ret i32 0
}
