; ModuleID = '/home/david/src/c-semantics/tests/unitTests/declarations.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.s1 = type { [2 x %struct.point], [2 x %struct.s3] }
%struct.point = type { i32, i32 }
%struct.s3 = type { [3 x %struct.s4] }
%struct.s4 = type { i32, i32 }
%struct.s2 = type { %struct.s1, %struct.s1 }
%struct.that = type { %struct.str }
%struct.str = type { [2 x i32 ()*], [2 x [2 x i32 ()*]] }

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %retval1 = alloca i32, align 4
  %w = alloca i32, align 4
  %x = alloca i32*, align 8
  %y = alloca i32**, align 8
  %z = alloca i32, align 4
  %d1 = alloca [2 x i32], align 4
  %d2 = alloca [2 x [2 x i32]], align 16
  %d3 = alloca [2 x [2 x [2 x i32]]], align 16
  %funcpt = alloca i32 ()*, align 8
  %funcArr = alloca [2 x i32 ()*], align 16
  %funcArr2D = alloca [2 x [2 x i32 ()*]], align 16
  %funArrofArr = alloca [2 x i32* (i32*)*], align 16
  %mys1 = alloca %struct.s1, align 4
  %mys2 = alloca %struct.s2, align 4
  %t = alloca %struct.that, align 8
  store i32 0, i32* %retval
  store i32 0, i32* %retval1, align 4
  store i32* %w, i32** %x, align 8
  %0 = load i32** %x, align 8
  store i32 5, i32* %0, align 4
  store i32** %x, i32*** %y, align 8
  %1 = load i32*** %y, align 8
  %2 = load i32** %1, align 8
  %3 = load i32* %2, align 4
  store i32 %3, i32* %z, align 4
  store i32 ()* @main, i32 ()** %funcpt, align 8
  %arrayidx = getelementptr inbounds [2 x i32]* %d1, i32 0, i64 0
  store i32 5, i32* %arrayidx, align 4
  %arrayidx2 = getelementptr inbounds [2 x [2 x i32]]* %d2, i32 0, i64 0
  %arrayidx3 = getelementptr inbounds [2 x i32]* %arrayidx2, i32 0, i64 0
  store i32 5, i32* %arrayidx3, align 4
  %arrayidx4 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %d3, i32 0, i64 0
  %arrayidx5 = getelementptr inbounds [2 x [2 x i32]]* %arrayidx4, i32 0, i64 0
  %arrayidx6 = getelementptr inbounds [2 x i32]* %arrayidx5, i32 0, i64 0
  store i32 5, i32* %arrayidx6, align 4
  %arrayidx7 = getelementptr inbounds [2 x i32 ()*]* %funcArr, i32 0, i64 0
  store i32 ()* @main, i32 ()** %arrayidx7, align 8
  %arrayidx8 = getelementptr inbounds [2 x [2 x i32 ()*]]* %funcArr2D, i32 0, i64 0
  %arrayidx9 = getelementptr inbounds [2 x i32 ()*]* %arrayidx8, i32 0, i64 0
  store i32 ()* @main, i32 ()** %arrayidx9, align 8
  %arrayidx10 = getelementptr inbounds [2 x i32* (i32*)*]* %funArrofArr, i32 0, i64 0
  store i32* (i32*)* @f, i32* (i32*)** %arrayidx10, align 8
  %a = getelementptr inbounds %struct.s1* %mys1, i32 0, i32 0
  %arrayidx11 = getelementptr inbounds [2 x %struct.point]* %a, i32 0, i64 0
  %x12 = getelementptr inbounds %struct.point* %arrayidx11, i32 0, i32 0
  store i32 5, i32* %x12, align 4
  %a13 = getelementptr inbounds %struct.s1* %mys1, i32 0, i32 0
  %arrayidx14 = getelementptr inbounds [2 x %struct.point]* %a13, i32 0, i64 0
  %y15 = getelementptr inbounds %struct.point* %arrayidx14, i32 0, i32 1
  store i32 -5, i32* %y15, align 4
  %a16 = getelementptr inbounds %struct.s1* %mys1, i32 0, i32 0
  %arrayidx17 = getelementptr inbounds [2 x %struct.point]* %a16, i32 0, i64 1
  %x18 = getelementptr inbounds %struct.point* %arrayidx17, i32 0, i32 0
  store i32 10, i32* %x18, align 4
  %a19 = getelementptr inbounds %struct.s1* %mys1, i32 0, i32 0
  %arrayidx20 = getelementptr inbounds [2 x %struct.point]* %a19, i32 0, i64 1
  %y21 = getelementptr inbounds %struct.point* %arrayidx20, i32 0, i32 1
  store i32 -10, i32* %y21, align 4
  %a22 = getelementptr inbounds %struct.s2* %mys2, i32 0, i32 0
  %4 = bitcast %struct.s1* %a22 to i8*
  %5 = bitcast %struct.s1* %mys1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* %5, i64 64, i32 4, i1 false)
  %b = getelementptr inbounds %struct.s2* %mys2, i32 0, i32 1
  %6 = bitcast %struct.s1* %b to i8*
  %7 = bitcast %struct.s1* %mys1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* %7, i64 64, i32 4, i1 false)
  %a23 = getelementptr inbounds %struct.s1* %mys1, i32 0, i32 0
  %arrayidx24 = getelementptr inbounds [2 x %struct.point]* %a23, i32 0, i64 0
  %x25 = getelementptr inbounds %struct.point* %arrayidx24, i32 0, i32 0
  store i32 30, i32* %x25, align 4
  %a26 = getelementptr inbounds %struct.s1* %mys1, i32 0, i32 0
  %arrayidx27 = getelementptr inbounds [2 x %struct.point]* %a26, i32 0, i64 1
  %y28 = getelementptr inbounds %struct.point* %arrayidx27, i32 0, i32 1
  store i32 30, i32* %y28, align 4
  %a29 = getelementptr inbounds %struct.s2* %mys2, i32 0, i32 0
  %a30 = getelementptr inbounds %struct.s1* %a29, i32 0, i32 0
  %arrayidx31 = getelementptr inbounds [2 x %struct.point]* %a30, i32 0, i64 0
  %x32 = getelementptr inbounds %struct.point* %arrayidx31, i32 0, i32 0
  %8 = load i32* %x32, align 4
  %a33 = getelementptr inbounds %struct.s2* %mys2, i32 0, i32 0
  %a34 = getelementptr inbounds %struct.s1* %a33, i32 0, i32 0
  %arrayidx35 = getelementptr inbounds [2 x %struct.point]* %a34, i32 0, i64 1
  %y36 = getelementptr inbounds %struct.point* %arrayidx35, i32 0, i32 1
  %9 = load i32* %y36, align 4
  %add = add nsw i32 %8, %9
  %10 = load i32* %retval1, align 4
  %add37 = add nsw i32 %10, %add
  store i32 %add37, i32* %retval1, align 4
  %arrayidx38 = getelementptr inbounds [2 x i32 ()*]* %funcArr, i32 0, i64 0
  %11 = load i32 ()** %arrayidx38, align 8
  %this = getelementptr inbounds %struct.that* %t, i32 0, i32 0
  %funcArr39 = getelementptr inbounds %struct.str* %this, i32 0, i32 0
  %arrayidx40 = getelementptr inbounds [2 x i32 ()*]* %funcArr39, i32 0, i64 0
  store i32 ()* %11, i32 ()** %arrayidx40, align 8
  %12 = load i32* %retval1, align 4
  ret i32 %12
}

define i32* @f(i32* %x) nounwind uwtable {
entry:
  %x.addr = alloca i32*, align 8
  store i32* %x, i32** %x.addr, align 8
  ret i32* null
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind
