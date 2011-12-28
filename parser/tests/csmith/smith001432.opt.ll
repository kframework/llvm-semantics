; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001432.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32* null, align 8
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %l_3 = alloca i32*, align 8
  volatile store i32* null, i32** %l_3, align 8
  %tmp = volatile load i32** @g_2, align 8
  volatile store i32* %tmp, i32** %l_3, align 8
  ret i64 2054955065
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %l_3.i = alloca i32*, align 8
  %0 = bitcast i32** %l_3.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  volatile store i32* null, i32** %l_3.i, align 8
  %tmp.i = volatile load i32** @g_2, align 8
  volatile store i32* %tmp.i, i32** %l_3.i, align 8
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  ret i32 0
}

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
