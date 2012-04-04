; ModuleID = '/home/david/src/c-semantics/tests/mustPass/j049c.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %a = alloca [4 x [5 x i32]], align 16
  %0 = bitcast [4 x [5 x i32]]* %a to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 80, i32 16, i1 false)
  %arraydecay = getelementptr inbounds [4 x [5 x i32]]* %a, i32 0, i32 0
  %arraydecay1 = getelementptr inbounds [5 x i32]* %arraydecay, i32 0, i32 0
  %add.ptr = getelementptr inbounds i32* %arraydecay1, i64 2
  %add.ptr2 = getelementptr inbounds i32* %add.ptr, i64 2
  %1 = load i32* %add.ptr2, align 4
  ret i32 0
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind
