; ModuleID = '/home/david/src/c-semantics/tests/unitTests/differentInits.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon.0 = type { [2 x i8], [3 x i8] }
%struct.anon.1 = type { [3 x i8] }
%struct.anon.2 = type { i8* }
%struct.anon.3 = type { i32, i32, [2 x i32], i32 }
%struct.anon.4 = type { i32, i32 }
%struct.anon.5 = type { i32, i32 }
%struct.anon = type { [2 x i8], [3 x i8] }

@main.x3 = private unnamed_addr constant [3 x i8] c"hi\00", align 1
@main.x4 = private unnamed_addr constant [2 x i8] c"hi", align 1
@main.x13 = private unnamed_addr constant [3 x i8] c"hi\00", align 1
@main.x14 = private unnamed_addr constant %struct.anon.0 { [2 x i8] c"hi", [3 x i8] c"hi\00" }, align 1
@main.x5 = private unnamed_addr constant [3 x i8] c"hi\00", align 1
@main.x6 = private unnamed_addr constant [3 x i8] c"hi\00", align 1
@main.x7 = private unnamed_addr constant [2 x i8] c"hi", align 1
@main.x11 = private unnamed_addr constant %struct.anon.1 { [3 x i8] c"hi\00" }, align 1
@.str = private unnamed_addr constant [6 x i8] c"%c%c\0A\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"hi\00", align 1
@main.x12 = private unnamed_addr constant %struct.anon.2 { i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0) }, align 8
@main.x8 = private unnamed_addr constant [3 x i8] c"\01\02\00", align 1
@main.x9 = private unnamed_addr constant [3 x i32] [i32 1, i32 2, i32 3], align 4
@main.x10 = private unnamed_addr constant [3 x i32] [i32 5, i32 6, i32 7], align 4
@main.x16 = private unnamed_addr constant [1 x i32] [i32 5], align 4
@main.x17 = private unnamed_addr constant %struct.anon.3 { i32 0, i32 2, [2 x i32] [i32 3, i32 4], i32 5 }, align 4
@main.x18 = private unnamed_addr constant [2 x %struct.anon.4] [%struct.anon.4 { i32 1, i32 2 }, %struct.anon.4 { i32 3, i32 0 }], align 16
@main.x19 = private unnamed_addr constant [2 x %struct.anon.5] [%struct.anon.5 { i32 1, i32 2 }, %struct.anon.5 { i32 3, i32 0 }], align 16

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x1 = alloca i32, align 4
  %x2 = alloca i32, align 4
  %x3 = alloca [3 x i8], align 1
  %x4 = alloca [2 x i8], align 1
  %x13 = alloca [3 x i8], align 1
  %x15 = alloca %struct.anon, align 1
  %x14 = alloca %struct.anon.0, align 1
  %x5 = alloca [3 x i8], align 1
  %x6 = alloca [3 x i8], align 1
  %x7 = alloca [2 x i8], align 1
  %x11 = alloca %struct.anon.1, align 1
  %x12 = alloca %struct.anon.2, align 8
  %x8 = alloca [3 x i8], align 1
  %x9 = alloca [3 x i32], align 4
  %x10 = alloca [3 x i32], align 4
  %x16 = alloca [1 x i32], align 4
  %x17 = alloca %struct.anon.3, align 4
  %x18 = alloca [2 x %struct.anon.4], align 16
  %x19 = alloca [2 x %struct.anon.5], align 16
  store i32 0, i32* %retval
  store i32 0, i32* %x1, align 4
  store i32 0, i32* %x2, align 4
  %0 = bitcast [3 x i8]* %x3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* getelementptr inbounds ([3 x i8]* @main.x3, i32 0, i32 0), i64 3, i32 1, i1 false)
  %1 = bitcast [2 x i8]* %x4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* getelementptr inbounds ([2 x i8]* @main.x4, i32 0, i32 0), i64 2, i32 1, i1 false)
  %2 = bitcast [3 x i8]* %x13 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* getelementptr inbounds ([3 x i8]* @main.x13, i32 0, i32 0), i64 3, i32 1, i1 false)
  %a = getelementptr inbounds %struct.anon* %x15, i32 0, i32 0
  %arrayidx = getelementptr inbounds [2 x i8]* %a, i32 0, i64 0
  store i8 104, i8* %arrayidx, align 1
  %a1 = getelementptr inbounds %struct.anon* %x15, i32 0, i32 0
  %arrayidx2 = getelementptr inbounds [2 x i8]* %a1, i32 0, i64 1
  store i8 105, i8* %arrayidx2, align 1
  %b = getelementptr inbounds %struct.anon* %x15, i32 0, i32 1
  %arrayidx3 = getelementptr inbounds [3 x i8]* %b, i32 0, i64 0
  store i8 104, i8* %arrayidx3, align 1
  %b4 = getelementptr inbounds %struct.anon* %x15, i32 0, i32 1
  %arrayidx5 = getelementptr inbounds [3 x i8]* %b4, i32 0, i64 1
  store i8 105, i8* %arrayidx5, align 1
  %b6 = getelementptr inbounds %struct.anon* %x15, i32 0, i32 1
  %arrayidx7 = getelementptr inbounds [3 x i8]* %b6, i32 0, i64 2
  store i8 0, i8* %arrayidx7, align 1
  %3 = bitcast %struct.anon.0* %x14 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* getelementptr inbounds (%struct.anon.0* @main.x14, i32 0, i32 0, i32 0), i64 5, i32 1, i1 false)
  %4 = bitcast [3 x i8]* %x5 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* getelementptr inbounds ([3 x i8]* @main.x5, i32 0, i32 0), i64 3, i32 1, i1 false)
  %5 = bitcast [3 x i8]* %x6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* getelementptr inbounds ([3 x i8]* @main.x6, i32 0, i32 0), i64 3, i32 1, i1 false)
  %6 = bitcast [2 x i8]* %x7 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* getelementptr inbounds ([2 x i8]* @main.x7, i32 0, i32 0), i64 2, i32 1, i1 false)
  %7 = bitcast %struct.anon.1* %x11 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %7, i8* getelementptr inbounds (%struct.anon.1* @main.x11, i32 0, i32 0, i32 0), i64 3, i32 1, i1 false)
  %a8 = getelementptr inbounds %struct.anon.1* %x11, i32 0, i32 0
  %arrayidx9 = getelementptr inbounds [3 x i8]* %a8, i32 0, i64 0
  %8 = load i8* %arrayidx9, align 1
  %conv = sext i8 %8 to i32
  %a10 = getelementptr inbounds %struct.anon.1* %x11, i32 0, i32 0
  %arrayidx11 = getelementptr inbounds [3 x i8]* %a10, i32 0, i64 1
  %9 = load i8* %arrayidx11, align 1
  %conv12 = sext i8 %9 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 %conv, i32 %conv12)
  %10 = bitcast %struct.anon.2* %x12 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %10, i8* bitcast (%struct.anon.2* @main.x12 to i8*), i64 8, i32 8, i1 false)
  %a13 = getelementptr inbounds %struct.anon.2* %x12, i32 0, i32 0
  %11 = load i8** %a13, align 8
  %arrayidx14 = getelementptr inbounds i8* %11, i64 0
  %12 = load i8* %arrayidx14, align 1
  %conv15 = sext i8 %12 to i32
  %a16 = getelementptr inbounds %struct.anon.1* %x11, i32 0, i32 0
  %arrayidx17 = getelementptr inbounds [3 x i8]* %a16, i32 0, i64 1
  %13 = load i8* %arrayidx17, align 1
  %conv18 = sext i8 %13 to i32
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 %conv15, i32 %conv18)
  %14 = bitcast [3 x i8]* %x8 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %14, i8* getelementptr inbounds ([3 x i8]* @main.x8, i32 0, i32 0), i64 3, i32 1, i1 false)
  %15 = bitcast [3 x i32]* %x9 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %15, i8* bitcast ([3 x i32]* @main.x9 to i8*), i64 12, i32 4, i1 false)
  %16 = bitcast [3 x i32]* %x10 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %16, i8* bitcast ([3 x i32]* @main.x10 to i8*), i64 12, i32 4, i1 false)
  %17 = bitcast [1 x i32]* %x16 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %17, i8* bitcast ([1 x i32]* @main.x16 to i8*), i64 4, i32 4, i1 false)
  %18 = bitcast %struct.anon.3* %x17 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %18, i8* bitcast (%struct.anon.3* @main.x17 to i8*), i64 20, i32 4, i1 false)
  %19 = bitcast [2 x %struct.anon.4]* %x18 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %19, i8* bitcast ([2 x %struct.anon.4]* @main.x18 to i8*), i64 16, i32 16, i1 false)
  %20 = bitcast [2 x %struct.anon.5]* %x19 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %20, i8* bitcast ([2 x %struct.anon.5]* @main.x19 to i8*), i64 16, i32 16, i1 false)
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @printf(i8*, ...)
