; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/typingNegative.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@main.arr = internal unnamed_addr constant [3 x i32] [i32 -1, i32 2, i32 0], align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %arr = alloca [3 x i32], align 4
  store i32 0, i32* %retval
  %tmp = bitcast [3 x i32]* %arr to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast ([3 x i32]* @main.arr to i8*), i64 12, i32 4, i1 false)
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind
