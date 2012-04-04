; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2003-09-18-BitFieldTest.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.rtx_def = type { i8, [3 x i8] }

@.str = private unnamed_addr constant [7 x i8] c"%d %d\0A\00", align 1

define void @i2(%struct.rtx_def* nocapture %d) nounwind uwtable {
entry:
  %0 = bitcast %struct.rtx_def* %d to i32*
  %1 = load i32* %0, align 4
  %2 = and i32 %1, -2
  store i32 %2, i32* %0, align 4
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str, i64 0, i64 0), i32 0, i32 1) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
