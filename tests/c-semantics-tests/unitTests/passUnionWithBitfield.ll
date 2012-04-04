; ModuleID = '/home/david/src/c-semantics/tests/unitTests/passUnionWithBitfield.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.U1 = type { [2 x i8], [2 x i8] }
%union.U2 = type { [2 x i8], [2 x i8] }
%union.U3 = type { i32 }

@u1 = global { i8, i8, [2 x i8] } { i8 123, i8 0, [2 x i8] undef }, align 4
@u2 = global { i8, i8, [2 x i8] } { i8 123, i8 0, [2 x i8] undef }, align 4
@u3 = global { i8, i8, [2 x i8] } { i8 123, i8 0, [2 x i8] undef }, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @f1(i32 %u.coerce) nounwind uwtable {
entry:
  %retval = alloca %union.U1, align 4
  %u = alloca %union.U1, align 4
  %0 = bitcast %union.U1* %u to i32*
  store i32 %u.coerce, i32* %0, align 1
  %1 = bitcast %union.U1* %retval to i8*
  %2 = bitcast %union.U1* %u to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* %2, i64 4, i32 4, i1 false)
  %3 = bitcast %union.U1* %retval to i32*
  %4 = load i32* %3, align 1
  ret i32 %4
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @f2(i32 %u.coerce) nounwind uwtable {
entry:
  %retval = alloca %union.U2, align 4
  %u = alloca %union.U2, align 4
  %0 = bitcast %union.U2* %u to i32*
  store i32 %u.coerce, i32* %0, align 1
  %1 = bitcast %union.U2* %retval to i8*
  %2 = bitcast %union.U2* %u to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* %2, i64 4, i32 4, i1 false)
  %3 = bitcast %union.U2* %retval to i32*
  %4 = load i32* %3, align 1
  ret i32 %4
}

define i32 @f3(i32 %u.coerce) nounwind uwtable {
entry:
  %retval = alloca %union.U3, align 4
  %u = alloca %union.U3, align 4
  %coerce.dive = getelementptr %union.U3* %u, i32 0, i32 0
  store i32 %u.coerce, i32* %coerce.dive
  %0 = bitcast %union.U3* %retval to i8*
  %1 = bitcast %union.U3* %u to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* %1, i64 4, i32 4, i1 false)
  %coerce.dive1 = getelementptr %union.U3* %retval, i32 0, i32 0
  %2 = load i32* %coerce.dive1
  ret i32 %2
}

define i32 @main() nounwind uwtable {
entry:
  %coerce = alloca %union.U1, align 4
  %coerce3 = alloca %union.U2, align 4
  %coerce8 = alloca %union.U3, align 4
  %0 = load i32* bitcast ({ i8, i8, [2 x i8] }* @u1 to i32*), align 1
  %call = call i32 @f1(i32 %0)
  %1 = bitcast %union.U1* %coerce to i32*
  store i32 %call, i32* %1, align 1
  %2 = bitcast %union.U1* %coerce to i32*
  %3 = load i32* %2, align 4
  %bf.clear = and i32 %3, 8191
  %4 = shl i32 %bf.clear, 19
  %bf.val.sext = ashr i32 %4, 19
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %bf.val.sext)
  %5 = load i32* bitcast ({ i8, i8, [2 x i8] }* @u2 to i32*), align 1
  %call2 = call i32 @f2(i32 %5)
  %6 = bitcast %union.U2* %coerce3 to i32*
  store i32 %call2, i32* %6, align 1
  %7 = bitcast %union.U2* %coerce3 to i32*
  %8 = load i32* %7, align 4
  %bf.clear4 = and i32 %8, 8191
  %9 = shl i32 %bf.clear4, 19
  %bf.val.sext5 = ashr i32 %9, 19
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %bf.val.sext5)
  %10 = load i32* getelementptr (%union.U3* bitcast ({ i8, i8, [2 x i8] }* @u3 to %union.U3*), i32 0, i32 0)
  %call7 = call i32 @f3(i32 %10)
  %coerce.dive = getelementptr %union.U3* %coerce8, i32 0, i32 0
  store i32 %call7, i32* %coerce.dive
  %11 = bitcast %union.U3* %coerce8 to i32*
  %12 = load i32* %11, align 4
  %bf.clear9 = and i32 %12, 8191
  %13 = shl i32 %bf.clear9, 19
  %bf.val.sext10 = ashr i32 %13, 19
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %bf.val.sext10)
  ret i32 0
}

declare i32 @printf(i8*, ...)
