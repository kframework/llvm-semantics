; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/980506-3.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@lookup_table = common global [257 x i8] zeroinitializer, align 16

define i32 @main(i32 %argc, i8** nocapture %argv) noreturn nounwind uwtable {
entry:
  tail call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([257 x i8]* @lookup_table, i64 0, i64 0), i8 4, i64 257, i32 16, i1 false) nounwind
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind
