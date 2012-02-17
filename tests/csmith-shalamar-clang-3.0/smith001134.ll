; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001134.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S0 = type { i8, i32, i8, i16, i32, i32 }

@g_2 = global i32 -387616869, align 4
@g_5 = global %struct.S0 { i8 -97, i32 37671261, i8 7, i16 1, i32 0, i32 -804944457 }, align 4
@func_1.l_6 = private unnamed_addr constant %struct.S0 { i8 6, i32 -5, i8 78, i16 -7, i32 -1, i32 1415504527 }, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_5.f0 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_5.f1 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_5.f2 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_5.f3 = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_5.f4 = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_5.f5 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define void @func_1(%struct.S0* noalias sret %agg.result) nounwind uwtable {
  %l_6 = alloca %struct.S0, align 4
  %1 = bitcast %struct.S0* %l_6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* getelementptr inbounds (%struct.S0* @func_1.l_6, i32 0, i32 0), i64 20, i32 4, i1 false)
  store i32 0, i32* @g_2, align 4
  br label %2

; <label>:2                                       ; preds = %7, %0
  %3 = load i32* @g_2, align 4
  %4 = icmp sge i32 %3, 0
  br i1 %4, label %5, label %10

; <label>:5                                       ; preds = %2
  %6 = bitcast %struct.S0* %agg.result to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* getelementptr inbounds (%struct.S0* @g_5, i32 0, i32 0), i64 20, i32 4, i1 false)
  br label %13
                                                  ; No predecessors!
  %8 = load i32* @g_2, align 4
  %9 = call i32 @safe_sub_func_uint32_t_u_u(i32 %8, i32 1)
  store i32 %9, i32* @g_2, align 4
  br label %2

; <label>:10                                      ; preds = %2
  %11 = bitcast %struct.S0* %agg.result to i8*
  %12 = bitcast %struct.S0* %l_6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %11, i8* %12, i64 20, i32 4, i1 false)
  br label %13

; <label>:13                                      ; preds = %10, %5
  ret void
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define internal i32 @safe_sub_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %ui1, i32* %1, align 4
  store i32 %ui2, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = load i32* %2, align 4
  %5 = sub i32 %3, %4
  ret i32 %5
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %4 = alloca %struct.S0, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  call void @func_1(%struct.S0* sret %4)
  %5 = load i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i8* getelementptr inbounds (%struct.S0* @g_5, i32 0, i32 0), align 1
  %8 = zext i8 %7 to i32
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %8)
  %10 = load i32* getelementptr inbounds (%struct.S0* @g_5, i32 0, i32 1), align 4
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %10)
  %12 = load i8* getelementptr inbounds (%struct.S0* @g_5, i32 0, i32 2), align 1
  %13 = zext i8 %12 to i32
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %13)
  %15 = load i16* getelementptr inbounds (%struct.S0* @g_5, i32 0, i32 3), align 2
  %16 = sext i16 %15 to i32
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %16)
  %18 = load i32* getelementptr inbounds (%struct.S0* @g_5, i32 0, i32 4), align 4
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %18)
  %20 = load i32* getelementptr inbounds (%struct.S0* @g_5, i32 0, i32 5), align 4
  %21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i32 0, i32 0), i32 %20)
  %22 = load i32* %1
  ret i32 %22
}

declare i32 @printf(i8*, ...)
