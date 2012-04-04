; ModuleID = '/home/david/src/c-semantics/tests/unitTests/structInStruct.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.that = type { %struct.str }
%struct.str = type { [2 x i32 ()*], [2 x [2 x i32 ()*]] }

@globalThat = common global %struct.that zeroinitializer, align 8

define i32 @main() nounwind uwtable {
entry:
  store i32 ()* @main, i32 ()** getelementptr inbounds (%struct.that* @globalThat, i64 0, i32 0, i32 0, i64 0), align 8
  ret i32 0
}
