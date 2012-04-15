; ModuleID = 'AtomicOps.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@.str = private constant [8 x i8] c"%d, %d\0A\00", align 1 ; <[8 x i8]*> [#uses=1]

declare void @llvm.memory.barrier(i1, i1, i1, i1, i1) nounwind

declare i32 @llvm.atomic.load.add.i32.p0i32(i32* nocapture, i32) nounwind

define i32 @main() nounwind {
entry:
  %x = alloca i32, align 4                        ; <i32*> [#uses=7]
  volatile store i32 0, i32* %x, align 4
  call void @llvm.memory.barrier(i1 true, i1 true, i1 true, i1 true, i1 true) nounwind
  %0 = call i32 @llvm.atomic.load.add.i32.p0i32(i32* %x, i32 1) nounwind ; <i32> [#uses=1]
  %1 = add nsw i32 %0, 2                          ; <i32> [#uses=1]
  %2 = volatile load i32* %x, align 4             ; <i32> [#uses=1]
  %3 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 %1, i32 %2) nounwind ; <i32> [#uses=0]
  call void @llvm.memory.barrier(i1 true, i1 true, i1 true, i1 true, i1 true)
  %4 = call i32 @llvm.atomic.cmp.swap.i32.p0i32(i32* %x, i32 1, i32 2) ; <i32> [#uses=1]
  call void @llvm.memory.barrier(i1 true, i1 true, i1 true, i1 true, i1 true)
  %5 = volatile load i32* %x, align 4             ; <i32> [#uses=1]
  %6 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 %4, i32 %5) nounwind ; <i32> [#uses=0]
  call void @llvm.memory.barrier(i1 true, i1 true, i1 true, i1 true, i1 true)
  %7 = call i32 @llvm.atomic.swap.i32.p0i32(i32* %x, i32 1) ; <i32> [#uses=1]
  %8 = volatile load i32* %x, align 4             ; <i32> [#uses=1]
  %9 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 %7, i32 %8) nounwind ; <i32> [#uses=0]
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare i32 @llvm.atomic.cmp.swap.i32.p0i32(i32* nocapture, i32, i32) nounwind

declare i32 @llvm.atomic.swap.i32.p0i32(i32* nocapture, i32) nounwind
