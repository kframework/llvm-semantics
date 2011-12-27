; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/goodConsts.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@main.a = internal constant [2 x i32] [i32 7, i32 1], align 4
@.str = private unnamed_addr constant [16 x i8] c"/tmp/fileXXXXXX\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %w = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %.compoundliteral = alloca [7 x float], align 4
  %.compoundliteral7 = alloca [16 x i8], align 1
  %p = alloca i32*, align 8
  %q = alloca i32*, align 8
  %r = alloca i32*, align 8
  store i32 0, i32* %retval
  store i32 3, i32* %w, align 4
  store i32 5, i32* %x, align 4
  store i32 6, i32* %y, align 4
  %.array = getelementptr inbounds [7 x float]* %.compoundliteral, i32 0, i32 0
  store float 1.000000e+00, float* %.array
  %.array1 = getelementptr inbounds [7 x float]* %.compoundliteral, i32 0, i32 1
  store float 1.000000e+01, float* %.array1
  %.array2 = getelementptr inbounds [7 x float]* %.compoundliteral, i32 0, i32 2
  store float 1.000000e+02, float* %.array2
  %.array3 = getelementptr inbounds [7 x float]* %.compoundliteral, i32 0, i32 3
  store float 1.000000e+03, float* %.array3
  %.array4 = getelementptr inbounds [7 x float]* %.compoundliteral, i32 0, i32 4
  store float 1.000000e+04, float* %.array4
  %.array5 = getelementptr inbounds [7 x float]* %.compoundliteral, i32 0, i32 5
  store float 1.000000e+05, float* %.array5
  %.array6 = getelementptr inbounds [7 x float]* %.compoundliteral, i32 0, i32 6
  store float 1.000000e+06, float* %.array6
  %arrayidx = getelementptr inbounds [7 x float]* %.compoundliteral, i32 0, i64 3
  %tmp = load float* %arrayidx
  %tmp8 = bitcast [16 x i8]* %.compoundliteral7 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp8, i8* getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i64 16, i32 1, i1 false)
  %arraydecay = getelementptr inbounds [16 x i8]* %.compoundliteral7, i32 0, i32 0
  store i32* %x, i32** %p, align 8
  store i32* %y, i32** %p, align 8
  store i32* %w, i32** %q, align 8
  %tmp11 = load i32** %q, align 8
  store i32 8, i32* %tmp11
  store i32* getelementptr inbounds ([2 x i32]* @main.a, i32 0, i64 0), i32** %r, align 8
  %tmp13 = load i32* getelementptr inbounds ([2 x i32]* @main.a, i32 0, i64 1), align 4
  %add = add nsw i32 11, %tmp13
  %tmp14 = load i32** %p, align 8
  %tmp15 = load i32* %tmp14
  %add16 = add nsw i32 %add, %tmp15
  %tmp17 = load i32** %q, align 8
  %tmp18 = load i32* %tmp17
  %add19 = add nsw i32 %add16, %tmp18
  %tmp20 = load i32** %r, align 8
  %tmp21 = load i32* %tmp20
  %add22 = add nsw i32 %add19, %tmp21
  ret i32 %add22
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind
