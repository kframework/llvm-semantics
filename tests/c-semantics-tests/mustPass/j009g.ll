; ModuleID = '/home/david/src/c-semantics/tests/mustPass/j009g.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %p = alloca i32*, align 8
  store i32 0, i32* %retval
  %call = call noalias i8* @malloc(i64 4) nounwind
  %0 = bitcast i8* %call to i32*
  store i32* %0, i32** %p, align 8
  %1 = load i32** %p, align 8
  store i32 5, i32* %1, align 4
  %2 = load i32** %p, align 8
  %3 = bitcast i32* %2 to i8*
  call void @free(i8* %3) nounwind
  ret i32 0
}

declare noalias i8* @malloc(i64) nounwind

declare void @free(i8*) nounwind
