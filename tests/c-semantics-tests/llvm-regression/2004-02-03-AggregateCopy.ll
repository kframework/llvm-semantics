; ModuleID = '/home/david/src/c-semantics/tests/llvm-regression/2004-02-03-AggregateCopy.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.agg = type { i32 }

@.str = private unnamed_addr constant [12 x i8] c"%d, %d, %d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %A = alloca %struct.agg, align 4
  %B = alloca %struct.agg, align 4
  %C = alloca %struct.agg, align 4
  store i32 0, i32* %retval
  %X = getelementptr inbounds %struct.agg* %A, i32 0, i32 0
  store i32 123, i32* %X, align 4
  %0 = bitcast %struct.agg* %C to i8*
  %1 = bitcast %struct.agg* %A to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* %1, i64 4, i32 4, i1 false)
  %2 = bitcast %struct.agg* %B to i8*
  %3 = bitcast %struct.agg* %C to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* %3, i64 4, i32 4, i1 false)
  %X1 = getelementptr inbounds %struct.agg* %A, i32 0, i32 0
  %4 = load i32* %X1, align 4
  %X2 = getelementptr inbounds %struct.agg* %B, i32 0, i32 0
  %5 = load i32* %X2, align 4
  %X3 = getelementptr inbounds %struct.agg* %C, i32 0, i32 0
  %6 = load i32* %X3, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 %4, i32 %5, i32 %6)
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @printf(i8*, ...)
