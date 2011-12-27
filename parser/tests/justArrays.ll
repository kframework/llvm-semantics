; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/justArrays.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@main.y = internal unnamed_addr constant [2 x [2 x i32]] [[2 x i32] [i32 1, i32 2], [2 x i32] [i32 0, i32 4]], align 16
@main.z = internal unnamed_addr constant [2 x [2 x [2 x i32]]] [[2 x [2 x i32]] [[2 x i32] [i32 1, i32 2], [2 x i32] [i32 0, i32 4]], [2 x [2 x i32]] [[2 x i32] [i32 5, i32 6], [2 x i32] [i32 7, i32 8]]], align 16
@main.w = internal unnamed_addr constant [2 x [2 x [2 x i32]]] [[2 x [2 x i32]] [[2 x i32] [i32 1, i32 2], [2 x i32] [i32 0, i32 4]], [2 x [2 x i32]] [[2 x i32] [i32 5, i32 6], [2 x i32] [i32 7, i32 8]]], align 16

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca [9 x i32], align 16
  %y = alloca [2 x [2 x i32]], align 16
  %z = alloca [2 x [2 x [2 x i32]]], align 16
  %w = alloca [2 x [2 x [2 x i32]]], align 16
  store i32 0, i32* %retval
  %tmp = bitcast [9 x i32]* %x to i8*
  call void @llvm.memset.p0i8.i64(i8* %tmp, i8 0, i64 36, i32 16, i1 false)
  %0 = bitcast i8* %tmp to [9 x i32]*
  %1 = getelementptr [9 x i32]* %0, i32 0, i32 4
  store i32 10, i32* %1
  %2 = getelementptr [9 x i32]* %0, i32 0, i32 5
  store i32 11, i32* %2
  %3 = getelementptr [9 x i32]* %0, i32 0, i32 6
  store i32 12, i32* %3
  %4 = getelementptr [9 x i32]* %0, i32 0, i32 8
  store i32 14, i32* %4
  %tmp2 = bitcast [2 x [2 x i32]]* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp2, i8* bitcast ([2 x [2 x i32]]* @main.y to i8*), i64 16, i32 16, i1 false)
  %tmp4 = bitcast [2 x [2 x [2 x i32]]]* %z to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp4, i8* bitcast ([2 x [2 x [2 x i32]]]* @main.z to i8*), i64 32, i32 16, i1 false)
  %tmp6 = bitcast [2 x [2 x [2 x i32]]]* %w to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp6, i8* bitcast ([2 x [2 x [2 x i32]]]* @main.w to i8*), i64 32, i32 16, i1 false)
  %arrayidx = getelementptr inbounds [9 x i32]* %x, i32 0, i64 8
  %tmp7 = load i32* %arrayidx, align 4
  %arrayidx8 = getelementptr inbounds [9 x i32]* %x, i32 0, i64 7
  store i32 %tmp7, i32* %arrayidx8, align 4
  %arrayidx9 = getelementptr inbounds [2 x [2 x i32]]* %y, i32 0, i64 0
  %arrayidx10 = getelementptr inbounds [2 x i32]* %arrayidx9, i32 0, i64 1
  %tmp11 = load i32* %arrayidx10, align 4
  %arrayidx12 = getelementptr inbounds [2 x [2 x i32]]* %y, i32 0, i64 1
  %arrayidx13 = getelementptr inbounds [2 x i32]* %arrayidx12, i32 0, i64 0
  store i32 %tmp11, i32* %arrayidx13, align 4
  %arrayidx14 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %z, i32 0, i64 1
  %arrayidx15 = getelementptr inbounds [2 x [2 x i32]]* %arrayidx14, i32 0, i64 0
  %arrayidx16 = getelementptr inbounds [2 x i32]* %arrayidx15, i32 0, i64 1
  %tmp17 = load i32* %arrayidx16, align 4
  %arrayidx18 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %z, i32 0, i64 0
  %arrayidx19 = getelementptr inbounds [2 x [2 x i32]]* %arrayidx18, i32 0, i64 1
  %arrayidx20 = getelementptr inbounds [2 x i32]* %arrayidx19, i32 0, i64 0
  store i32 %tmp17, i32* %arrayidx20, align 4
  %arrayidx21 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %w, i32 0, i64 1
  %arrayidx22 = getelementptr inbounds [2 x [2 x i32]]* %arrayidx21, i32 0, i64 0
  %arrayidx23 = getelementptr inbounds [2 x i32]* %arrayidx22, i32 0, i64 1
  %tmp24 = load i32* %arrayidx23, align 4
  %arrayidx25 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %w, i32 0, i64 0
  %arrayidx26 = getelementptr inbounds [2 x [2 x i32]]* %arrayidx25, i32 0, i64 1
  %arrayidx27 = getelementptr inbounds [2 x i32]* %arrayidx26, i32 0, i64 0
  store i32 %tmp24, i32* %arrayidx27, align 4
  %arrayidx28 = getelementptr inbounds [9 x i32]* %x, i32 0, i64 7
  %tmp29 = load i32* %arrayidx28, align 4
  %cmp = icmp ne i32 %tmp29, 14
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %arrayidx30 = getelementptr inbounds [2 x [2 x i32]]* %y, i32 0, i64 1
  %arrayidx31 = getelementptr inbounds [2 x i32]* %arrayidx30, i32 0, i64 0
  %tmp32 = load i32* %arrayidx31, align 4
  %cmp33 = icmp ne i32 %tmp32, 2
  br i1 %cmp33, label %if.then34, label %if.end35

if.then34:                                        ; preds = %if.end
  store i32 2, i32* %retval
  br label %return

if.end35:                                         ; preds = %if.end
  %arrayidx36 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %z, i32 0, i64 0
  %arrayidx37 = getelementptr inbounds [2 x [2 x i32]]* %arrayidx36, i32 0, i64 1
  %arrayidx38 = getelementptr inbounds [2 x i32]* %arrayidx37, i32 0, i64 0
  %tmp39 = load i32* %arrayidx38, align 4
  %cmp40 = icmp ne i32 %tmp39, 6
  br i1 %cmp40, label %if.then41, label %if.end42

if.then41:                                        ; preds = %if.end35
  store i32 3, i32* %retval
  br label %return

if.end42:                                         ; preds = %if.end35
  %arrayidx43 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %w, i32 0, i64 0
  %arrayidx44 = getelementptr inbounds [2 x [2 x i32]]* %arrayidx43, i32 0, i64 1
  %arrayidx45 = getelementptr inbounds [2 x i32]* %arrayidx44, i32 0, i64 0
  %tmp46 = load i32* %arrayidx45, align 4
  %cmp47 = icmp ne i32 %tmp46, 6
  br i1 %cmp47, label %if.then48, label %if.end49

if.then48:                                        ; preds = %if.end42
  store i32 4, i32* %retval
  br label %return

if.end49:                                         ; preds = %if.end42
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end49, %if.then48, %if.then41, %if.then34, %if.then
  %5 = load i32* %retval
  ret i32 %5
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind
