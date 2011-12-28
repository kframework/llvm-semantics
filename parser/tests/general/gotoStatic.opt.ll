; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/gotoStatic.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@f.z = internal unnamed_addr global i32 0, align 4
@f.y = internal unnamed_addr global i32 0, align 4

define i32 @f() nounwind uwtable {
entry:
  %tmp = load i32* @f.z, align 4
  %inc = add nsw i32 %tmp, 1
  store i32 %inc, i32* @f.z, align 4
  %f.y.promoted = load i32* @f.y, align 4
  %tmp3 = add i32 %f.y.promoted, 2
  store i32 %tmp3, i32* @f.y, align 4
  %add = add nsw i32 %inc, %tmp3
  ret i32 %add
}

define i32 @main() nounwind uwtable {
entry:
  %tmp.i = load i32* @f.z, align 4
  %f.y.promoted.i = load i32* @f.y, align 4
  %inc.i2 = add i32 %tmp.i, 4
  store i32 %inc.i2, i32* @f.z, align 4
  %tmp3.i4 = add i32 %f.y.promoted.i, 8
  store i32 %tmp3.i4, i32* @f.y, align 4
  %add.i5 = add nsw i32 %tmp3.i4, %inc.i2
  ret i32 %add.i5
}
