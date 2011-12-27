; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/externLibCall.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"PASS\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %call = tail call i32 @puts(i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0)) nounwind
  ret i32 0
}

declare i32 @puts(i8* nocapture) nounwind
