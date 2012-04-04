; ModuleID = '/home/david/src/c-semantics/tests/unitTests/initializerTest.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.s = type { i32, i32, %struct.q, [2 x i32], i32, [0 x i32] }
%struct.q = type { i32, i32 }

@main.s1 = private unnamed_addr constant %struct.s { i32 1, i32 3, %struct.q { i32 4, i32 5 }, [2 x i32] [i32 6, i32 7], i32 8, [0 x i32] zeroinitializer }, align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %s1 = alloca %struct.s, align 4
  store i32 0, i32* %retval
  %0 = bitcast %struct.s* %s1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast (%struct.s* @main.s1 to i8*), i64 28, i32 4, i1 false)
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind
