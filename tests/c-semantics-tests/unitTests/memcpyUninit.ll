; ModuleID = '/home/david/src/c-semantics/tests/unitTests/memcpyUninit.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i32, i32 }

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %s1 = alloca %struct.S, align 4
  %s2 = alloca %struct.S*, align 8
  store i32 0, i32* %retval
  %x = getelementptr inbounds %struct.S* %s1, i32 0, i32 0
  store i32 5, i32* %x, align 4
  %call = call noalias i8* @malloc(i64 8) nounwind
  %0 = bitcast i8* %call to %struct.S*
  store %struct.S* %0, %struct.S** %s2, align 8
  %1 = load %struct.S** %s2, align 8
  %2 = bitcast %struct.S* %1 to i8*
  %3 = bitcast %struct.S* %s1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* %3, i64 8, i32 4, i1 false)
  %4 = load %struct.S** %s2, align 8
  %x1 = getelementptr inbounds %struct.S* %4, i32 0, i32 0
  %5 = load i32* %x1, align 4
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %5)
  ret i32 0
}

declare noalias i8* @malloc(i64) nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @printf(i8*, ...)
