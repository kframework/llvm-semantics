; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/990513-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define void @foo(i32* %BM_tab, i32 %j) nounwind uwtable {
while.body.lr.ph:
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %indvar = phi i64 [ 0, %while.body.lr.ph ], [ %indvar.next, %while.body ]
  %tmp = mul i64 %indvar, -4
  %tmp4 = add i64 %tmp, 255
  %incdec.ptr = getelementptr i32* %BM_tab, i64 %tmp4
  %tmp5 = add i64 %tmp, 254
  %incdec.ptr8 = getelementptr i32* %BM_tab, i64 %tmp5
  %tmp6 = add i64 %tmp, 253
  %incdec.ptr11 = getelementptr i32* %BM_tab, i64 %tmp6
  %tmp7 = add i64 %tmp, 252
  %incdec.ptr14 = getelementptr i32* %BM_tab, i64 %tmp7
  store i32 %j, i32* %incdec.ptr, align 4
  store i32 %j, i32* %incdec.ptr8, align 4
  store i32 %j, i32* %incdec.ptr11, align 4
  store i32 %j, i32* %incdec.ptr14, align 4
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, 64
  br i1 %exitcond, label %while.end, label %while.body

while.end:                                        ; preds = %while.body
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %BM_tab = alloca [256 x i32], align 16
  %0 = bitcast [256 x i32]* %BM_tab to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 1024, i32 16, i1 false)
  br label %while.body.i

while.body.i:                                     ; preds = %while.body.i, %entry
  %indvar.i = phi i64 [ 0, %entry ], [ %1, %while.body.i ]
  %tmp2 = mul i64 %indvar.i, -4
  %tmp3 = add i64 %tmp2, 252
  %incdec.ptr14.i = getelementptr [256 x i32]* %BM_tab, i64 0, i64 %tmp3
  %tmp4 = add i64 %tmp2, 253
  %incdec.ptr11.i = getelementptr [256 x i32]* %BM_tab, i64 0, i64 %tmp4
  %tmp5 = add i64 %tmp2, 254
  %incdec.ptr8.i = getelementptr [256 x i32]* %BM_tab, i64 0, i64 %tmp5
  %tmp6 = add i64 %tmp2, 255
  %incdec.ptr.i = getelementptr [256 x i32]* %BM_tab, i64 0, i64 %tmp6
  store i32 6, i32* %incdec.ptr.i, align 4
  store i32 6, i32* %incdec.ptr8.i, align 8
  store i32 6, i32* %incdec.ptr11.i, align 4
  store i32 6, i32* %incdec.ptr14.i, align 16
  %1 = add i64 %indvar.i, 1
  %exitcond = icmp eq i64 %1, 64
  br i1 %exitcond, label %foo.exit, label %while.body.i

foo.exit:                                         ; preds = %while.body.i
  %arraydecay1 = getelementptr inbounds [256 x i32]* %BM_tab, i64 0, i64 0
  %tmp = load i32* %arraydecay1, align 16
  %cmp = icmp eq i32 %tmp, 6
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %foo.exit
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %foo.exit
  ret i32 0
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @abort() noreturn
