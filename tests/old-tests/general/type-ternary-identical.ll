; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/type-ternary-identical.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.s = type { i32, i32 }

@main.s0 = internal unnamed_addr constant %struct.s { i32 1, i32 2 }, align 4
@main.s1 = internal unnamed_addr constant %struct.s { i32 2, i32 3 }, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@main.a2 = internal unnamed_addr constant [5 x i32] [i32 2, i32 3, i32 0, i32 0, i32 0], align 16

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %s0 = alloca %struct.s, align 4
  %s1 = alloca %struct.s, align 4
  %x = alloca i32, align 4
  %a1 = alloca [5 x i32], align 16
  %a2 = alloca [5 x i32], align 16
  store i32 0, i32* %retval
  %tmp = bitcast %struct.s* %s0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast (%struct.s* @main.s0 to i8*), i64 8, i32 4, i1 false)
  %tmp2 = bitcast %struct.s* %s1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp2, i8* bitcast (%struct.s* @main.s1 to i8*), i64 8, i32 4, i1 false)
  store i32 8, i32* %x, align 4
  %tmp4 = load i32* %x, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp4)
  %tmp6 = bitcast [5 x i32]* %a1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %tmp6, i8 0, i64 20, i32 16, i1 false)
  %tmp8 = bitcast [5 x i32]* %a2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp8, i8* bitcast ([5 x i32]* @main.a2 to i8*), i64 20, i32 16, i1 false)
  store i32 8, i32* %x, align 4
  %tmp9 = load i32* %x, align 4
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp9)
  %0 = load i32* %retval
  ret i32 %0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @printf(i8*, ...)

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind
