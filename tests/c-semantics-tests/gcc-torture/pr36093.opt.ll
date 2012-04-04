; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr36093.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Foo = type { [4 x %struct.Bar], [124 x i8] }
%struct.Bar = type { [129 x i8] }

@foo = common global [4 x %struct.Foo] zeroinitializer, align 128

define i32 @main() nounwind uwtable {
if.end:
  call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([4 x %struct.Foo]* @foo, i64 0, i64 0, i32 0, i64 0, i32 0, i64 0), i8 97, i64 129, i32 128, i1 false)
  call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([4 x %struct.Foo]* @foo, i64 0, i64 0, i32 0, i64 1, i32 0, i64 0), i8 98, i64 129, i32 1, i1 false)
  call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([4 x %struct.Foo]* @foo, i64 0, i64 0, i32 0, i64 2, i32 0, i64 0), i8 99, i64 129, i32 2, i1 false)
  call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([4 x %struct.Foo]* @foo, i64 0, i64 0, i32 0, i64 3, i32 0, i64 0), i8 100, i64 129, i32 1, i1 false)
  ret i32 0
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind
