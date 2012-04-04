; ModuleID = '/home/david/src/c-semantics/tests/unitTests/justArrays.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.y = private unnamed_addr constant [2 x [2 x i32]] [[2 x i32] [i32 1, i32 2], [2 x i32] [i32 0, i32 4]], align 16
@main.z = private unnamed_addr constant [2 x [2 x [2 x i32]]] [[2 x [2 x i32]] [[2 x i32] [i32 1, i32 2], [2 x i32] [i32 0, i32 4]], [2 x [2 x i32]] [[2 x i32] [i32 5, i32 6], [2 x i32] [i32 7, i32 8]]], align 16
@main.w = private unnamed_addr constant [2 x [2 x [2 x i32]]] [[2 x [2 x i32]] [[2 x i32] [i32 1, i32 2], [2 x i32] [i32 0, i32 4]], [2 x [2 x i32]] [[2 x i32] [i32 5, i32 6], [2 x i32] [i32 7, i32 8]]], align 16

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca [9 x i32], align 16
  %y = alloca [2 x [2 x i32]], align 16
  %z = alloca [2 x [2 x [2 x i32]]], align 16
  %w = alloca [2 x [2 x [2 x i32]]], align 16
  store i32 0, i32* %retval
  %0 = bitcast [9 x i32]* %x to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 36, i32 16, i1 false)
  %1 = bitcast i8* %0 to [9 x i32]*
  %2 = getelementptr [9 x i32]* %1, i32 0, i32 0
  %3 = getelementptr [9 x i32]* %1, i32 0, i32 1
  %4 = getelementptr [9 x i32]* %1, i32 0, i32 2
  %5 = getelementptr [9 x i32]* %1, i32 0, i32 3
  %6 = getelementptr [9 x i32]* %1, i32 0, i32 4
  store i32 10, i32* %6
  %7 = getelementptr [9 x i32]* %1, i32 0, i32 5
  store i32 11, i32* %7
  %8 = getelementptr [9 x i32]* %1, i32 0, i32 6
  store i32 12, i32* %8
  %9 = getelementptr [9 x i32]* %1, i32 0, i32 7
  %10 = getelementptr [9 x i32]* %1, i32 0, i32 8
  store i32 14, i32* %10
  %11 = bitcast [2 x [2 x i32]]* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %11, i8* bitcast ([2 x [2 x i32]]* @main.y to i8*), i64 16, i32 16, i1 false)
  %12 = bitcast [2 x [2 x [2 x i32]]]* %z to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* bitcast ([2 x [2 x [2 x i32]]]* @main.z to i8*), i64 32, i32 16, i1 false)
  %13 = bitcast [2 x [2 x [2 x i32]]]* %w to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* bitcast ([2 x [2 x [2 x i32]]]* @main.w to i8*), i64 32, i32 16, i1 false)
  %arrayidx = getelementptr inbounds [9 x i32]* %x, i32 0, i64 8
  %14 = load i32* %arrayidx, align 4
  %arrayidx1 = getelementptr inbounds [9 x i32]* %x, i32 0, i64 7
  store i32 %14, i32* %arrayidx1, align 4
  %arrayidx2 = getelementptr inbounds [2 x [2 x i32]]* %y, i32 0, i64 0
  %arrayidx3 = getelementptr inbounds [2 x i32]* %arrayidx2, i32 0, i64 1
  %15 = load i32* %arrayidx3, align 4
  %arrayidx4 = getelementptr inbounds [2 x [2 x i32]]* %y, i32 0, i64 1
  %arrayidx5 = getelementptr inbounds [2 x i32]* %arrayidx4, i32 0, i64 0
  store i32 %15, i32* %arrayidx5, align 4
  %arrayidx6 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %z, i32 0, i64 1
  %arrayidx7 = getelementptr inbounds [2 x [2 x i32]]* %arrayidx6, i32 0, i64 0
  %arrayidx8 = getelementptr inbounds [2 x i32]* %arrayidx7, i32 0, i64 1
  %16 = load i32* %arrayidx8, align 4
  %arrayidx9 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %z, i32 0, i64 0
  %arrayidx10 = getelementptr inbounds [2 x [2 x i32]]* %arrayidx9, i32 0, i64 1
  %arrayidx11 = getelementptr inbounds [2 x i32]* %arrayidx10, i32 0, i64 0
  store i32 %16, i32* %arrayidx11, align 4
  %arrayidx12 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %w, i32 0, i64 1
  %arrayidx13 = getelementptr inbounds [2 x [2 x i32]]* %arrayidx12, i32 0, i64 0
  %arrayidx14 = getelementptr inbounds [2 x i32]* %arrayidx13, i32 0, i64 1
  %17 = load i32* %arrayidx14, align 4
  %arrayidx15 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %w, i32 0, i64 0
  %arrayidx16 = getelementptr inbounds [2 x [2 x i32]]* %arrayidx15, i32 0, i64 1
  %arrayidx17 = getelementptr inbounds [2 x i32]* %arrayidx16, i32 0, i64 0
  store i32 %17, i32* %arrayidx17, align 4
  %arrayidx18 = getelementptr inbounds [9 x i32]* %x, i32 0, i64 7
  %18 = load i32* %arrayidx18, align 4
  %cmp = icmp ne i32 %18, 14
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %arrayidx19 = getelementptr inbounds [2 x [2 x i32]]* %y, i32 0, i64 1
  %arrayidx20 = getelementptr inbounds [2 x i32]* %arrayidx19, i32 0, i64 0
  %19 = load i32* %arrayidx20, align 4
  %cmp21 = icmp ne i32 %19, 2
  br i1 %cmp21, label %if.then22, label %if.end23

if.then22:                                        ; preds = %if.end
  store i32 2, i32* %retval
  br label %return

if.end23:                                         ; preds = %if.end
  %arrayidx24 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %z, i32 0, i64 0
  %arrayidx25 = getelementptr inbounds [2 x [2 x i32]]* %arrayidx24, i32 0, i64 1
  %arrayidx26 = getelementptr inbounds [2 x i32]* %arrayidx25, i32 0, i64 0
  %20 = load i32* %arrayidx26, align 4
  %cmp27 = icmp ne i32 %20, 6
  br i1 %cmp27, label %if.then28, label %if.end29

if.then28:                                        ; preds = %if.end23
  store i32 3, i32* %retval
  br label %return

if.end29:                                         ; preds = %if.end23
  %arrayidx30 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %w, i32 0, i64 0
  %arrayidx31 = getelementptr inbounds [2 x [2 x i32]]* %arrayidx30, i32 0, i64 1
  %arrayidx32 = getelementptr inbounds [2 x i32]* %arrayidx31, i32 0, i64 0
  %21 = load i32* %arrayidx32, align 4
  %cmp33 = icmp ne i32 %21, 6
  br i1 %cmp33, label %if.then34, label %if.end35

if.then34:                                        ; preds = %if.end29
  store i32 4, i32* %retval
  br label %return

if.end35:                                         ; preds = %if.end29
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end35, %if.then34, %if.then28, %if.then22, %if.then
  %22 = load i32* %retval
  ret i32 %22
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind
