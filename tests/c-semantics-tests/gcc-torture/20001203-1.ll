; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20001203-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { i64, [1 x i8] }

@foo.x = private unnamed_addr constant { i64, [1 x i8], [7 x i8] } { i64 2, [1 x i8] zeroinitializer, [7 x i8] undef }, align 8

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %tmp = alloca i32, align 4
  store i32 0, i32* %retval
  call void @foo()
  store i32 1, i32* %tmp, align 4
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

define internal void @foo() nounwind uwtable {
entry:
  %x = alloca %struct.anon, align 8
  %0 = bitcast %struct.anon* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ({ i64, [1 x i8], [7 x i8] }* @foo.x to i8*), i64 16, i32 8, i1 false)
  ret void
}

declare void @exit(i32) noreturn nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind
