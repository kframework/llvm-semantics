; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001291.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable readnone {
for.end24:
  %l_2 = alloca [1 x [1 x [8 x i32]]], align 16
  %scevgep13 = bitcast [1 x [1 x [8 x i32]]]* %l_2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep13, i8 0, i64 32, i32 16, i1 false)
  %arrayidx27 = getelementptr inbounds [1 x [1 x [8 x i32]]]* %l_2, i64 0, i64 0, i64 0, i64 3
  %tmp28 = load i32* %arrayidx27, align 4
  %conv = trunc i32 %tmp28 to i16
  ret i16 %conv
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable readnone {
entry:
  ret i32 0
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind
