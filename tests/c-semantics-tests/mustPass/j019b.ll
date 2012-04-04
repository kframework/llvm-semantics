; ModuleID = '/home/david/src/c-semantics/tests/mustPass/j019b.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.a = private unnamed_addr constant [5 x i8] c"\01\02\03\04\05", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca [5 x i8], align 1
  store i32 0, i32* %retval
  %0 = bitcast [5 x i8]* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* getelementptr inbounds ([5 x i8]* @main.a, i32 0, i32 0), i64 5, i32 1, i1 false)
  %arrayidx = getelementptr inbounds [5 x i8]* %a, i32 0, i64 4
  %1 = load i8* %arrayidx, align 1
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind
