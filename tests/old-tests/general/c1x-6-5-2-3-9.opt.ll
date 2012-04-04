; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/c1x-6-5-2-3-9.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i32, double }
%union.anon = type { %0 }

@u = common global %union.anon zeroinitializer, align 8

define i32 @main() nounwind uwtable {
entry:
  store i32 1, i32* getelementptr inbounds (%union.anon* @u, i64 0, i32 0, i32 0), align 8
  store double 3.140000e+00, double* getelementptr inbounds (%union.anon* @u, i64 0, i32 0, i32 1), align 8
  ret i32 1
}
