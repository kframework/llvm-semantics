; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000477.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.S0 = type { i16, i32 }

@g_2 = global %struct.S0 { i16 1, i32 0 }, align 4
@.str = private unnamed_addr constant [22 x i8] c"checksum g_2.f0 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_2.f1 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %retval = alloca %struct.S0, align 4
  %tmp = bitcast %struct.S0* %retval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast (%struct.S0* @g_2 to i8*), i64 8, i32 4, i1 false)
  %0 = bitcast %struct.S0* %retval to i64*
  %1 = load i64* %0, align 1
  ret i64 %1
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %coerce = alloca %struct.S0, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i64 @func_1()
  %0 = bitcast %struct.S0* %coerce to i64*
  store i64 %call, i64* %0
  %tmp = load i16* getelementptr inbounds (%struct.S0* @g_2, i32 0, i32 0), align 2
  %conv = zext i16 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %tmp2 = load i32* getelementptr inbounds (%struct.S0* @g_2, i32 0, i32 1), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %1 = load i32* %retval
  ret i32 %1
}

declare i32 @printf(i8*, ...)
