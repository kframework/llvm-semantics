; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20051012-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.type = type { i32*, [2 x i8], [2 x i8] }

@t = common global %struct.type zeroinitializer, align 8

define i32 @foo(i32* nocapture %q.coerce0, i64 %q.coerce1) nounwind uwtable readonly {
entry:
  %0 = load i32* bitcast (i8* getelementptr inbounds (%struct.type* @t, i64 0, i32 1, i64 0) to i32*), align 8
  %1 = lshr i32 %0, 16
  %bf.clear = and i32 %1, 511
  ret i32 %bf.clear
}

define i32 @main() nounwind uwtable {
entry:
  %0 = load i32* bitcast (i8* getelementptr inbounds (%struct.type* @t, i64 0, i32 1, i64 0) to i32*), align 8
  %1 = and i32 %0, -33488897
  %2 = or i32 %1, 524288
  store i32 %2, i32* bitcast (i8* getelementptr inbounds (%struct.type* @t, i64 0, i32 1, i64 0) to i32*), align 8
  ret i32 0
}
