; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20011128-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.blah = private unnamed_addr constant [33 x i8] c"01234567890123456789\00\00\00\00\00\00\00\00\00\00\00\00\00", align 16

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %blah = alloca [33 x i8], align 16
  store i32 0, i32* %retval
  %0 = bitcast [33 x i8]* %blah to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* getelementptr inbounds ([33 x i8]* @main.blah, i32 0, i32 0), i64 33, i32 16, i1 false)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %1 = load i32* %retval
  ret i32 %1
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @exit(i32) noreturn nounwind
