; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/differentInits.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { [3 x i8] }
%1 = type { i8* }
%2 = type { i32, i32, [2 x i32], i32 }
%3 = type { i32, i32 }
%struct.anon = type { [2 x i8], [3 x i8] }

@main.x3 = internal unnamed_addr constant [3 x i8] c"hi\00", align 1
@main.x4 = internal unnamed_addr constant [2 x i8] c"hi", align 1
@main.x13 = internal unnamed_addr constant [3 x i8] c"hi\00", align 1
@main.x14 = internal unnamed_addr constant %struct.anon { [2 x i8] c"hi", [3 x i8] c"hi\00" }, align 1
@main.x5 = internal unnamed_addr constant [3 x i8] c"hi\00", align 1
@main.x6 = internal unnamed_addr constant [3 x i8] c"hi\00", align 1
@main.x7 = internal unnamed_addr constant [2 x i8] c"hi", align 1
@main.x11 = internal unnamed_addr constant %0 { [3 x i8] c"hi\00" }, align 1
@.str = private unnamed_addr constant [6 x i8] c"%c%c\0A\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"hi\00", align 1
@main.x12 = internal unnamed_addr constant %1 { i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0) }, align 8
@main.x8 = internal unnamed_addr constant [3 x i8] c"\01\02\00", align 1
@main.x9 = internal unnamed_addr constant [3 x i32] [i32 1, i32 2, i32 3], align 4
@main.x10 = internal unnamed_addr constant [3 x i32] [i32 5, i32 6, i32 7], align 4
@main.x16 = internal unnamed_addr constant [1 x i32] [i32 5], align 4
@main.x17 = internal unnamed_addr constant %2 { i32 0, i32 2, [2 x i32] [i32 3, i32 4], i32 5 }, align 4
@main.x18 = internal unnamed_addr constant [2 x %3] [%3 { i32 1, i32 2 }, %3 { i32 3, i32 0 }], align 16
@main.x19 = internal unnamed_addr constant [2 x %3] [%3 { i32 1, i32 2 }, %3 { i32 3, i32 0 }], align 16

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x1 = alloca i32, align 4
  %x2 = alloca i32, align 4
  %x3 = alloca [3 x i8], align 1
  %x4 = alloca [2 x i8], align 1
  %x13 = alloca [3 x i8], align 1
  %x15 = alloca %struct.anon, align 1
  %x14 = alloca %struct.anon, align 1
  %x5 = alloca [3 x i8], align 1
  %x6 = alloca [3 x i8], align 1
  %x7 = alloca [2 x i8], align 1
  %x11 = alloca %0, align 1
  %x12 = alloca %1, align 8
  %x8 = alloca [3 x i8], align 1
  %x9 = alloca [3 x i32], align 4
  %x10 = alloca [3 x i32], align 4
  %x16 = alloca [1 x i32], align 4
  %x17 = alloca %2, align 4
  %x18 = alloca [2 x %3], align 16
  %x19 = alloca [2 x %3], align 16
  store i32 0, i32* %retval
  store i32 0, i32* %x1, align 4
  store i32 0, i32* %x2, align 4
  %tmp = bitcast [3 x i8]* %x3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* getelementptr inbounds ([3 x i8]* @main.x3, i32 0, i32 0), i64 3, i32 1, i1 false)
  %tmp2 = bitcast [2 x i8]* %x4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp2, i8* getelementptr inbounds ([2 x i8]* @main.x4, i32 0, i32 0), i64 2, i32 1, i1 false)
  %tmp4 = bitcast [3 x i8]* %x13 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp4, i8* getelementptr inbounds ([3 x i8]* @main.x13, i32 0, i32 0), i64 3, i32 1, i1 false)
  %a = getelementptr inbounds %struct.anon* %x15, i32 0, i32 0
  %arrayidx = getelementptr inbounds [2 x i8]* %a, i32 0, i64 0
  store i8 104, i8* %arrayidx, align 1
  %a6 = getelementptr inbounds %struct.anon* %x15, i32 0, i32 0
  %arrayidx7 = getelementptr inbounds [2 x i8]* %a6, i32 0, i64 1
  store i8 105, i8* %arrayidx7, align 1
  %b = getelementptr inbounds %struct.anon* %x15, i32 0, i32 1
  %arrayidx8 = getelementptr inbounds [3 x i8]* %b, i32 0, i64 0
  store i8 104, i8* %arrayidx8, align 1
  %b9 = getelementptr inbounds %struct.anon* %x15, i32 0, i32 1
  %arrayidx10 = getelementptr inbounds [3 x i8]* %b9, i32 0, i64 1
  store i8 105, i8* %arrayidx10, align 1
  %b11 = getelementptr inbounds %struct.anon* %x15, i32 0, i32 1
  %arrayidx12 = getelementptr inbounds [3 x i8]* %b11, i32 0, i64 2
  store i8 0, i8* %arrayidx12, align 1
  %tmp14 = bitcast %struct.anon* %x14 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp14, i8* getelementptr inbounds (%struct.anon* @main.x14, i32 0, i32 0, i32 0), i64 5, i32 1, i1 false)
  %tmp16 = bitcast [3 x i8]* %x5 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp16, i8* getelementptr inbounds ([3 x i8]* @main.x5, i32 0, i32 0), i64 3, i32 1, i1 false)
  %tmp18 = bitcast [3 x i8]* %x6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp18, i8* getelementptr inbounds ([3 x i8]* @main.x6, i32 0, i32 0), i64 3, i32 1, i1 false)
  %tmp20 = bitcast [2 x i8]* %x7 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp20, i8* getelementptr inbounds ([2 x i8]* @main.x7, i32 0, i32 0), i64 2, i32 1, i1 false)
  %tmp22 = bitcast %0* %x11 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp22, i8* getelementptr inbounds (%0* @main.x11, i32 0, i32 0, i32 0), i64 3, i32 1, i1 false)
  %a23 = getelementptr inbounds %0* %x11, i32 0, i32 0
  %arrayidx24 = getelementptr inbounds [3 x i8]* %a23, i32 0, i64 0
  %tmp25 = load i8* %arrayidx24, align 1
  %conv = sext i8 %tmp25 to i32
  %a26 = getelementptr inbounds %0* %x11, i32 0, i32 0
  %arrayidx27 = getelementptr inbounds [3 x i8]* %a26, i32 0, i64 1
  %tmp28 = load i8* %arrayidx27, align 1
  %conv29 = sext i8 %tmp28 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 %conv, i32 %conv29)
  %tmp31 = bitcast %1* %x12 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp31, i8* bitcast (%1* @main.x12 to i8*), i64 8, i32 8, i1 false)
  %a32 = getelementptr inbounds %1* %x12, i32 0, i32 0
  %tmp33 = load i8** %a32, align 8
  %arrayidx34 = getelementptr inbounds i8* %tmp33, i64 0
  %tmp35 = load i8* %arrayidx34
  %conv36 = sext i8 %tmp35 to i32
  %a37 = getelementptr inbounds %0* %x11, i32 0, i32 0
  %arrayidx38 = getelementptr inbounds [3 x i8]* %a37, i32 0, i64 1
  %tmp39 = load i8* %arrayidx38, align 1
  %conv40 = sext i8 %tmp39 to i32
  %call41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 %conv36, i32 %conv40)
  %tmp43 = bitcast [3 x i8]* %x8 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp43, i8* getelementptr inbounds ([3 x i8]* @main.x8, i32 0, i32 0), i64 3, i32 1, i1 false)
  %tmp45 = bitcast [3 x i32]* %x9 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp45, i8* bitcast ([3 x i32]* @main.x9 to i8*), i64 12, i32 4, i1 false)
  %tmp47 = bitcast [3 x i32]* %x10 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp47, i8* bitcast ([3 x i32]* @main.x10 to i8*), i64 12, i32 4, i1 false)
  %tmp49 = bitcast [1 x i32]* %x16 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp49, i8* bitcast ([1 x i32]* @main.x16 to i8*), i64 4, i32 4, i1 false)
  %tmp51 = bitcast %2* %x17 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp51, i8* bitcast (%2* @main.x17 to i8*), i64 20, i32 4, i1 false)
  %tmp53 = bitcast [2 x %3]* %x18 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp53, i8* bitcast ([2 x %3]* @main.x18 to i8*), i64 16, i32 16, i1 false)
  %tmp55 = bitcast [2 x %3]* %x19 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp55, i8* bitcast ([2 x %3]* @main.x19 to i8*), i64 16, i32 16, i1 false)
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @printf(i8*, ...)
