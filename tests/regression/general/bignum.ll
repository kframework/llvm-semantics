; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/bignum.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %bignum = alloca i64, align 8
  store i32 0, i32* %retval
  store i64 -9223372036854775808, i64* %bignum, align 8
  %tmp = load i64* %bignum, align 8
  %add = add nsw i64 %tmp, 4
  %conv = trunc i64 %add to i32
  ret i32 %conv
}
