; ModuleID = '/home/david/src/c-semantics/tests/unitTests/goodConsts.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
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
  %.compoundliteral6 = alloca [16 x i8], align 1
  %p = alloca i32*, align 8
  %q = alloca i32*, align 8
  %r = alloca i32*, align 8
  store i32 0, i32* %retval
  store i32 3, i32* %w, align 4
  store i32 5, i32* %x, align 4
  store i32 6, i32* %y, align 4
  %arrayinit.begin = getelementptr inbounds [7 x float]* %.compoundliteral, i64 0, i64 0
  store float 1.000000e+00, float* %arrayinit.begin
  %arrayinit.element = getelementptr inbounds float* %arrayinit.begin, i64 1
  store float 1.000000e+01, float* %arrayinit.element
  %arrayinit.element1 = getelementptr inbounds float* %arrayinit.element, i64 1
  store float 1.000000e+02, float* %arrayinit.element1
  %arrayinit.element2 = getelementptr inbounds float* %arrayinit.element1, i64 1
  store float 1.000000e+03, float* %arrayinit.element2
  %arrayinit.element3 = getelementptr inbounds float* %arrayinit.element2, i64 1
  store float 1.000000e+04, float* %arrayinit.element3
  %arrayinit.element4 = getelementptr inbounds float* %arrayinit.element3, i64 1
  store float 1.000000e+05, float* %arrayinit.element4
  %arrayinit.element5 = getelementptr inbounds float* %arrayinit.element4, i64 1
  store float 1.000000e+06, float* %arrayinit.element5
  %arrayidx = getelementptr inbounds [7 x float]* %.compoundliteral, i32 0, i64 3
  %0 = load float* %arrayidx, align 4
  %1 = bitcast [16 x i8]* %.compoundliteral6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i64 16, i32 1, i1 false)
  %arraydecay = getelementptr inbounds [16 x i8]* %.compoundliteral6, i32 0, i32 0
  store i32* %x, i32** %p, align 8
  store i32* %y, i32** %p, align 8
  store i32* %w, i32** %q, align 8
  %2 = load i32** %q, align 8
  store i32 8, i32* %2, align 4
  store i32* getelementptr inbounds ([2 x i32]* @main.a, i32 0, i64 0), i32** %r, align 8
  %3 = load i32* getelementptr inbounds ([2 x i32]* @main.a, i32 0, i64 1), align 4
  %add = add nsw i32 11, %3
  %4 = load i32** %p, align 8
  %5 = load i32* %4, align 4
  %add7 = add nsw i32 %add, %5
  %6 = load i32** %q, align 8
  %7 = load i32* %6, align 4
  %add8 = add nsw i32 %add7, %7
  %8 = load i32** %r, align 8
  %9 = load i32* %8, align 4
  %add9 = add nsw i32 %add8, %9
  ret i32 %add9
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind
