; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/packed-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.s = type <{ i16, i64 }>

@t = common global %struct.s zeroinitializer, align 2

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i64 0, i64* getelementptr inbounds (%struct.s* @t, i32 0, i32 1), align 1
  ret i32 0
}
