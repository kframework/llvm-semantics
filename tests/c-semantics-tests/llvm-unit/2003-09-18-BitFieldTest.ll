; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2003-09-18-BitFieldTest.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.rtx_def = type { i8, [3 x i8] }

@.str = private unnamed_addr constant [7 x i8] c"%d %d\0A\00", align 1

define void @i2(%struct.rtx_def* %d) nounwind uwtable {
entry:
  %d.addr = alloca %struct.rtx_def*, align 8
  store %struct.rtx_def* %d, %struct.rtx_def** %d.addr, align 8
  %0 = load %struct.rtx_def** %d.addr, align 8
  %1 = bitcast %struct.rtx_def* %0 to i32*
  %2 = load i32* %1, align 4
  %3 = and i32 %2, -2
  store i32 %3, i32* %1, align 4
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %D = alloca %struct.rtx_def, align 4
  store i32 0, i32* %retval
  %0 = bitcast %struct.rtx_def* %D to i32*
  %1 = load i32* %0, align 4
  %2 = and i32 %1, -3
  %3 = or i32 %2, 2
  store i32 %3, i32* %0, align 4
  call void @i2(%struct.rtx_def* %D)
  %4 = bitcast %struct.rtx_def* %D to i32*
  %5 = load i32* %4, align 4
  %bf.clear = and i32 %5, 1
  %6 = bitcast %struct.rtx_def* %D to i32*
  %7 = load i32* %6, align 4
  %8 = lshr i32 %7, 1
  %bf.clear1 = and i32 %8, 1
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str, i32 0, i32 0), i32 %bf.clear, i32 %bf.clear1)
  ret i32 0
}

declare i32 @printf(i8*, ...)
