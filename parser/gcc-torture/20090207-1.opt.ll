; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20090207-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo(i32 %i) nounwind uwtable readnone {
entry:
  %a = alloca [32 x i32], align 16
  %arrayidx = getelementptr inbounds [32 x i32]* %a, i64 0, i64 1
  store i32 3, i32* %arrayidx, align 4
  %arrayidx1 = getelementptr inbounds [32 x i32]* %a, i64 0, i64 0
  store i32 1, i32* %arrayidx1, align 16
  %idxprom = sext i32 %i to i64
  %arrayidx2 = getelementptr inbounds [32 x i32]* %a, i64 0, i64 %idxprom
  store i32 2, i32* %arrayidx2, align 4
  %tmp4 = load i32* %arrayidx1, align 16
  ret i32 %tmp4
}

define i32 @main() nounwind uwtable {
if.end:
  %a.i = alloca [32 x i32], align 16
  %0 = bitcast [32 x i32]* %a.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  %arrayidx.i = getelementptr inbounds [32 x i32]* %a.i, i64 0, i64 1
  store i32 3, i32* %arrayidx.i, align 4
  %arrayidx1.i = getelementptr inbounds [32 x i32]* %a.i, i64 0, i64 0
  store i32 2, i32* %arrayidx1.i, align 16
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  store i32 1, i32* %arrayidx1.i, align 16
  store i32 2, i32* %arrayidx.i, align 4
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  ret i32 0
}

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
