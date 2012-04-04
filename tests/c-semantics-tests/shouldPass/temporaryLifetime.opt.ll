; ModuleID = '/home/david/src/c-semantics/tests/shouldPass/temporaryLifetime.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i32, [2 x i32] }

@s = global %struct.S { i32 1, [2 x i32] [i32 2, i32 3] }, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %tmp7.i = load i32* getelementptr inbounds (%struct.S* @s, i64 0, i32 0), align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp7.i) nounwind
  %tmp8.i44 = load i32* getelementptr inbounds (%struct.S* @s, i64 0, i32 1, i64 0), align 4
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp8.i44) nounwind
  %tmp8.i40 = load i32* getelementptr inbounds (%struct.S* @s, i64 0, i32 1, i64 0), align 4
  %call10 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp8.i40) nounwind
  %tmp8.i36 = load i32* getelementptr inbounds (%struct.S* @s, i64 0, i32 1, i64 0), align 4
  %call16 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp8.i36) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
