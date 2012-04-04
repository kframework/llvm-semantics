; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2004-06-20-StaticBitfieldInit.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.T = type { i8, i8, [2 x i8] }

@GV = global %struct.T { i8 -95, i8 8, [2 x i8] undef }, align 4
@.str = private unnamed_addr constant [10 x i8] c"%d %d %d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = load i32* bitcast (%struct.T* @GV to i32*), align 4
  %bf.clear = and i32 %0, 31
  %1 = load i32* bitcast (%struct.T* @GV to i32*), align 4
  %2 = lshr i32 %1, 5
  %bf.clear1 = and i32 %2, 63
  %3 = load i32* bitcast (%struct.T* @GV to i32*), align 4
  %4 = lshr i32 %3, 11
  %bf.clear2 = and i32 %4, 31
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0), i32 %bf.clear, i32 %bf.clear1, i32 %bf.clear2)
  ret i32 0
}

declare i32 @printf(i8*, ...)
