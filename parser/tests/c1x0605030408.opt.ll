; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/c1x0605030408.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i64 @fsize3(i32 %n) nounwind uwtable readnone {
entry:
  %add = add nsw i32 %n, 3
  %tmp1 = zext i32 %add to i64
  ret i64 %tmp1
}

define i32 @main() nounwind uwtable readnone {
entry:
  ret i32 13
}
