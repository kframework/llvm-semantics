; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001318.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i32, i32, i64, i8, [7 x i8] }
%struct.S1 = type { i32, i32, i64, i8 }

@func_1.l_2 = internal unnamed_addr constant %0 { i32 7, i32 -1, i64 6592407467208655254, i8 0, [7 x i8] undef }, align 8
@__undefined = common global i64 0, align 8

define void @func_1(%struct.S1* nocapture sret %agg.result) nounwind uwtable {
entry:
  %tmp1 = bitcast %struct.S1* %agg.result to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp1, i8* bitcast (%0* @func_1.l_2 to i8*), i64 24, i32 8, i1 false)
  ret void
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable readnone {
entry:
  ret i32 0
}
