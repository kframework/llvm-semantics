; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20010114-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.array1 = private unnamed_addr constant [1 x i32] [i32 1], align 4
@main.array2 = private unnamed_addr constant [2 x [1 x i32]] [[1 x i32] [i32 1], [1 x i32] zeroinitializer], align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %array1 = alloca [1 x i32], align 4
  %array2 = alloca [2 x [1 x i32]], align 4
  store i32 0, i32* %retval
  %0 = bitcast [1 x i32]* %array1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([1 x i32]* @main.array1 to i8*), i64 4, i32 4, i1 false)
  %1 = bitcast [2 x [1 x i32]]* %array2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast ([2 x [1 x i32]]* @main.array2 to i8*), i64 8, i32 4, i1 false)
  %arrayidx = getelementptr inbounds [1 x i32]* %array1, i32 0, i64 0
  %2 = load i32* %arrayidx, align 4
  %cmp = icmp ne i32 %2, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %3 = load i32* %retval
  ret i32 %3
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn

declare void @exit(i32) noreturn
