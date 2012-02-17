; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/enums.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.globalStruct = type { i32 }

@var = common global i32 0, align 4
@aGlobalStruct = common global %struct.globalStruct zeroinitializer, align 4

define i32 @main() nounwind uwtable {
entry:
  store i32 21, i32* @var, align 4
  store i32 0, i32* getelementptr inbounds (%struct.globalStruct* @aGlobalStruct, i64 0, i32 0), align 4
  ret i32 0
}
