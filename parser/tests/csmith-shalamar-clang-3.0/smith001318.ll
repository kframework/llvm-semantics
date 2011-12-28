; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001318.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S1 = type { i32, i32, i64, i8 }

@func_1.l_2 = private unnamed_addr constant { i32, i32, i64, i8, [7 x i8] } { i32 7, i32 -1, i64 6592407467208655254, i8 0, [7 x i8] undef }, align 8
@__undefined = common global i64 0, align 8

define void @func_1(%struct.S1* noalias sret %agg.result) nounwind uwtable {
  %l_2 = alloca %struct.S1, align 8
  %1 = bitcast %struct.S1* %l_2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast ({ i32, i32, i64, i8, [7 x i8] }* @func_1.l_2 to i8*), i64 24, i32 8, i1 false)
  %2 = bitcast %struct.S1* %agg.result to i8*
  %3 = bitcast %struct.S1* %l_2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* %3, i64 24, i32 8, i1 false)
  ret void
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %4 = alloca %struct.S1, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  call void @func_1(%struct.S1* sret %4)
  %5 = load i32* %1
  ret i32 %5
}
