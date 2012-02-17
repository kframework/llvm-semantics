; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000477.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S0 = type { i16, i32 }

@g_2 = global %struct.S0 { i16 1, i32 0 }, align 4
@.str = private unnamed_addr constant [22 x i8] c"checksum g_2.f0 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_2.f1 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
  %1 = alloca %struct.S0, align 4
  %2 = bitcast %struct.S0* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast (%struct.S0* @g_2 to i8*), i64 8, i32 4, i1 false)
  %3 = bitcast %struct.S0* %1 to i64*
  %4 = load i64* %3, align 1
  ret i64 %4
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %4 = alloca %struct.S0, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %5 = call i64 @func_1()
  %6 = bitcast %struct.S0* %4 to i64*
  store i64 %5, i64* %6
  %7 = load i16* getelementptr inbounds (%struct.S0* @g_2, i32 0, i32 0), align 2
  %8 = zext i16 %7 to i32
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %8)
  %10 = load i32* getelementptr inbounds (%struct.S0* @g_2, i32 0, i32 1), align 4
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %10)
  %12 = load i32* %1
  ret i32 %12
}

declare i32 @printf(i8*, ...)
