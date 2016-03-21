; ModuleID = './differentInits.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

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
@.str.1 = private unnamed_addr constant [3 x i8] c"hi\00", align 1
@main.x12 = private unnamed_addr constant %struct.anon.2 { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0) }, align 8
@main.x8 = private unnamed_addr constant [3 x i8] c"\01\02\00", align 1
@main.x9 = private unnamed_addr constant [3 x i32] [i32 1, i32 2, i32 3], align 4
@main.x10 = private unnamed_addr constant [3 x i32] [i32 5, i32 6, i32 7], align 4
@main.x16 = private unnamed_addr constant [1 x i32] [i32 5], align 4
@main.x17 = private unnamed_addr constant %struct.anon.3 { i32 0, i32 2, [2 x i32] [i32 3, i32 4], i32 5 }, align 4
@main.x18 = private unnamed_addr constant [2 x %struct.anon.4] [%struct.anon.4 { i32 1, i32 2 }, %struct.anon.4 { i32 3, i32 0 }], align 16
@main.x19 = private unnamed_addr constant [2 x %struct.anon.5] [%struct.anon.5 { i32 1, i32 2 }, %struct.anon.5 { i32 3, i32 0 }], align 16

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
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
  store i32 0, i32* %1
  store i32 0, i32* %x1, align 4
  store i32 0, i32* %x2, align 4
  %2 = bitcast [3 x i8]* %x3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @main.x3, i32 0, i32 0), i64 3, i32 1, i1 false)
  %3 = bitcast [2 x i8]* %x4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @main.x4, i32 0, i32 0), i64 2, i32 1, i1 false)
  %4 = bitcast [3 x i8]* %x13 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @main.x13, i32 0, i32 0), i64 3, i32 1, i1 false)
  %5 = getelementptr inbounds %struct.anon, %struct.anon* %x15, i32 0, i32 0
  %6 = getelementptr inbounds [2 x i8], [2 x i8]* %5, i32 0, i64 0
  store i8 104, i8* %6, align 1
  %7 = getelementptr inbounds %struct.anon, %struct.anon* %x15, i32 0, i32 0
  %8 = getelementptr inbounds [2 x i8], [2 x i8]* %7, i32 0, i64 1
  store i8 105, i8* %8, align 1
  %9 = getelementptr inbounds %struct.anon, %struct.anon* %x15, i32 0, i32 1
  %10 = getelementptr inbounds [3 x i8], [3 x i8]* %9, i32 0, i64 0
  store i8 104, i8* %10, align 1
  %11 = getelementptr inbounds %struct.anon, %struct.anon* %x15, i32 0, i32 1
  %12 = getelementptr inbounds [3 x i8], [3 x i8]* %11, i32 0, i64 1
  store i8 105, i8* %12, align 1
  %13 = getelementptr inbounds %struct.anon, %struct.anon* %x15, i32 0, i32 1
  %14 = getelementptr inbounds [3 x i8], [3 x i8]* %13, i32 0, i64 2
  store i8 0, i8* %14, align 1
  %15 = bitcast %struct.anon.0* %x14 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %15, i8* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @main.x14, i32 0, i32 0, i32 0), i64 5, i32 1, i1 false)
  %16 = bitcast [3 x i8]* %x5 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %16, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @main.x5, i32 0, i32 0), i64 3, i32 1, i1 false)
  %17 = bitcast [3 x i8]* %x6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %17, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @main.x6, i32 0, i32 0), i64 3, i32 1, i1 false)
  %18 = bitcast [2 x i8]* %x7 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %18, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @main.x7, i32 0, i32 0), i64 2, i32 1, i1 false)
  %19 = bitcast %struct.anon.1* %x11 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %19, i8* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @main.x11, i32 0, i32 0, i32 0), i64 3, i32 1, i1 false)
  %20 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %x11, i32 0, i32 0
  %21 = getelementptr inbounds [3 x i8], [3 x i8]* %20, i32 0, i64 0
  %22 = load i8, i8* %21, align 1
  %23 = sext i8 %22 to i32
  %24 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %x11, i32 0, i32 0
  %25 = getelementptr inbounds [3 x i8], [3 x i8]* %24, i32 0, i64 1
  %26 = load i8, i8* %25, align 1
  %27 = sext i8 %26 to i32
  %28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i32 %23, i32 %27)
  %29 = bitcast %struct.anon.2* %x12 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %29, i8* bitcast (%struct.anon.2* @main.x12 to i8*), i64 8, i32 8, i1 false)
  %30 = getelementptr inbounds %struct.anon.2, %struct.anon.2* %x12, i32 0, i32 0
  %31 = load i8*, i8** %30, align 8
  %32 = getelementptr inbounds i8, i8* %31, i64 0
  %33 = load i8, i8* %32, align 1
  %34 = sext i8 %33 to i32
  %35 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %x11, i32 0, i32 0
  %36 = getelementptr inbounds [3 x i8], [3 x i8]* %35, i32 0, i64 1
  %37 = load i8, i8* %36, align 1
  %38 = sext i8 %37 to i32
  %39 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i32 %34, i32 %38)
  %40 = bitcast [3 x i8]* %x8 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %40, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @main.x8, i32 0, i32 0), i64 3, i32 1, i1 false)
  %41 = bitcast [3 x i32]* %x9 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %41, i8* bitcast ([3 x i32]* @main.x9 to i8*), i64 12, i32 4, i1 false)
  %42 = bitcast [3 x i32]* %x10 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %42, i8* bitcast ([3 x i32]* @main.x10 to i8*), i64 12, i32 4, i1 false)
  %43 = bitcast [1 x i32]* %x16 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %43, i8* bitcast ([1 x i32]* @main.x16 to i8*), i64 4, i32 4, i1 false)
  %44 = bitcast %struct.anon.3* %x17 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %44, i8* bitcast (%struct.anon.3* @main.x17 to i8*), i64 20, i32 4, i1 false)
  %45 = bitcast [2 x %struct.anon.4]* %x18 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %45, i8* bitcast ([2 x %struct.anon.4]* @main.x18 to i8*), i64 16, i32 16, i1 false)
  %46 = bitcast [2 x %struct.anon.5]* %x19 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %46, i8* bitcast ([2 x %struct.anon.5]* @main.x19 to i8*), i64 16, i32 16, i1 false)
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
