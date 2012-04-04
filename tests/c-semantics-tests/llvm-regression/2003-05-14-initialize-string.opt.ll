; ModuleID = '/home/david/src/c-semantics/tests/llvm-regression/2003-05-14-initialize-string.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.title = private unnamed_addr constant [15 x i8] c"foo and stuff\0A\00", align 1
@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %title = alloca [15 x i8], align 1
  %0 = getelementptr inbounds [15 x i8]* %title, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* getelementptr inbounds ([15 x i8]* @main.title, i64 0, i64 0), i64 15, i32 1, i1 false)
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str, i64 0, i64 0), i8* %0) nounwind
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind
