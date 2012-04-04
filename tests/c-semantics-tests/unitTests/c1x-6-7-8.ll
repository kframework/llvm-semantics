; ModuleID = '/home/david/src/c-semantics/tests/unitTests/c1x-6-7-8.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { [3 x i32], i32 }
%struct.anon.0 = type { [3 x i32], i32 }
%struct.div_t = type { i32, i32 }
%struct.anon.1 = type { [3 x i32], i32 }
%union.anon = type { [2 x i32] }
%struct.anon.2 = type { [3 x i32], i32 }
%union.anon.3 = type { [2 x i32] }
%union.anon.4 = type { [2 x i32] }

@sec26.y1 = private unnamed_addr constant [4 x [3 x i32]] [[3 x i32] [i32 1, i32 3, i32 5], [3 x i32] [i32 2, i32 4, i32 6], [3 x i32] [i32 3, i32 5, i32 7], [3 x i32] zeroinitializer], align 16
@sec26.y2 = private unnamed_addr constant [4 x [3 x i32]] [[3 x i32] [i32 1, i32 3, i32 5], [3 x i32] [i32 2, i32 4, i32 6], [3 x i32] [i32 3, i32 5, i32 7], [3 x i32] zeroinitializer], align 16
@.str = private unnamed_addr constant [15 x i8] c"y1[%d][%d]=%d\0A\00", align 1
@.str1 = private unnamed_addr constant [15 x i8] c"z1[%d][%d]=%d\0A\00", align 1
@sec28.w1 = private unnamed_addr constant [2 x %struct.anon] [%struct.anon { [3 x i32] [i32 1, i32 0, i32 0], i32 0 }, %struct.anon { [3 x i32] [i32 2, i32 0, i32 0], i32 0 }], align 16
@sec28.w2 = private unnamed_addr constant [2 x %struct.anon.0] [%struct.anon.0 { [3 x i32] [i32 1, i32 0, i32 0], i32 0 }, %struct.anon.0 { [3 x i32] [i32 2, i32 0, i32 0], i32 0 }], align 16
@.str2 = private unnamed_addr constant [17 x i8] c"w1[%d].a[%d]=%d\0A\00", align 1
@.str3 = private unnamed_addr constant [19 x i8] c"q1[%d][%d][%d]=%d\0A\00", align 1
@sec31.a1 = private unnamed_addr constant [2 x i32] [i32 1, i32 2], align 4
@sec31.b1 = private unnamed_addr constant [3 x i32] [i32 3, i32 4, i32 5], align 4
@sec31.a2 = private unnamed_addr constant [2 x i32] [i32 1, i32 2], align 4
@sec31.b2 = private unnamed_addr constant [3 x i32] [i32 3, i32 4, i32 5], align 4
@.str4 = private unnamed_addr constant [11 x i8] c"a1[%d]=%d\0A\00", align 1
@.str5 = private unnamed_addr constant [11 x i8] c"b1[%d]=%d\0A\00", align 1
@sec32.s1 = private unnamed_addr constant [4 x i8] c"abc\00", align 1
@sec32.t1 = private unnamed_addr constant [3 x i8] c"abc", align 1
@sec32.s2 = private unnamed_addr constant [4 x i8] c"abc\00", align 1
@sec32.t2 = private unnamed_addr constant [3 x i8] c"abc", align 1
@.str6 = private unnamed_addr constant [4 x i8] c"abc\00", align 1
@.str7 = private unnamed_addr constant [11 x i8] c"s1[%d]=%d\0A\00", align 1
@.str8 = private unnamed_addr constant [11 x i8] c"t1[%d]=%d\0A\00", align 1
@.str9 = private unnamed_addr constant [11 x i8] c"member one\00", align 1
@.str10 = private unnamed_addr constant [11 x i8] c"member two\00", align 1
@sec33.nm = private unnamed_addr constant [2 x i8*] [i8* getelementptr inbounds ([11 x i8]* @.str9, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str10, i32 0, i32 0)], align 16
@.str11 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@sec34.x1 = private unnamed_addr constant %struct.div_t { i32 2, i32 -1 }, align 4
@sec34.x2 = private unnamed_addr constant %struct.div_t { i32 2, i32 -1 }, align 4
@sec35.w1 = private unnamed_addr constant [2 x %struct.anon.1] [%struct.anon.1 { [3 x i32] [i32 1, i32 0, i32 0], i32 0 }, %struct.anon.1 { [3 x i32] [i32 2, i32 0, i32 0], i32 0 }], align 16
@.str12 = private unnamed_addr constant [15 x i8] c"w1[%d][%d]=%d\0A\00", align 1
@sec36.a1 = private unnamed_addr constant [20 x i32] [i32 1, i32 3, i32 5, i32 7, i32 9, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 8, i32 6, i32 4, i32 2, i32 0], align 16
@sec36.a2 = private unnamed_addr constant [20 x i32] [i32 1, i32 3, i32 5, i32 7, i32 9, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 8, i32 6, i32 4, i32 2, i32 0], align 16
@sec38.u1 = private unnamed_addr constant %union.anon { [2 x i32] [i32 1, i32 2] }, align 4
@sec38.u2 = private unnamed_addr constant { i32, [4 x i8] } { i32 3, [4 x i8] undef }, align 4
@sec38.u3 = private unnamed_addr constant { float, [4 x i8] } { float 4.500000e+00, [4 x i8] undef }, align 4

define i32 @sec26() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %y1 = alloca [4 x [3 x i32]], align 16
  %y2 = alloca [4 x [3 x i32]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %0 = bitcast [4 x [3 x i32]]* %y1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([4 x [3 x i32]]* @sec26.y1 to i8*), i64 48, i32 16, i1 false)
  %1 = bitcast [4 x [3 x i32]]* %y2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast ([4 x [3 x i32]]* @sec26.y2 to i8*), i64 48, i32 16, i1 false)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc15, %entry
  %2 = load i32* %i, align 4
  %cmp = icmp slt i32 %2, 4
  br i1 %cmp, label %for.body, label %for.end17

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %3 = load i32* %j, align 4
  %cmp2 = icmp slt i32 %3, 3
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %4 = load i32* %i, align 4
  %5 = load i32* %j, align 4
  %6 = load i32* %j, align 4
  %idxprom = sext i32 %6 to i64
  %7 = load i32* %i, align 4
  %idxprom4 = sext i32 %7 to i64
  %arrayidx = getelementptr inbounds [4 x [3 x i32]]* %y1, i32 0, i64 %idxprom4
  %arrayidx5 = getelementptr inbounds [3 x i32]* %arrayidx, i32 0, i64 %idxprom
  %8 = load i32* %arrayidx5, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str, i32 0, i32 0), i32 %4, i32 %5, i32 %8)
  %9 = load i32* %j, align 4
  %idxprom6 = sext i32 %9 to i64
  %10 = load i32* %i, align 4
  %idxprom7 = sext i32 %10 to i64
  %arrayidx8 = getelementptr inbounds [4 x [3 x i32]]* %y1, i32 0, i64 %idxprom7
  %arrayidx9 = getelementptr inbounds [3 x i32]* %arrayidx8, i32 0, i64 %idxprom6
  %11 = load i32* %arrayidx9, align 4
  %12 = load i32* %j, align 4
  %idxprom10 = sext i32 %12 to i64
  %13 = load i32* %i, align 4
  %idxprom11 = sext i32 %13 to i64
  %arrayidx12 = getelementptr inbounds [4 x [3 x i32]]* %y2, i32 0, i64 %idxprom11
  %arrayidx13 = getelementptr inbounds [3 x i32]* %arrayidx12, i32 0, i64 %idxprom10
  %14 = load i32* %arrayidx13, align 4
  %cmp14 = icmp ne i32 %11, %14
  br i1 %cmp14, label %if.then, label %if.end

if.then:                                          ; preds = %for.body3
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %for.body3
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %15 = load i32* %j, align 4
  %add = add nsw i32 %15, 1
  store i32 %add, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc15

for.inc15:                                        ; preds = %for.end
  %16 = load i32* %i, align 4
  %add16 = add nsw i32 %16, 1
  store i32 %add16, i32* %i, align 4
  br label %for.cond

for.end17:                                        ; preds = %for.cond
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %for.end17, %if.then
  %17 = load i32* %retval
  ret i32 %17
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @printf(i8*, ...)

define i32 @sec27() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %z1 = alloca [4 x [3 x i32]], align 16
  %z2 = alloca [4 x [3 x i32]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %0 = bitcast [4 x [3 x i32]]* %z1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 48, i32 16, i1 false)
  %1 = bitcast i8* %0 to [4 x [3 x i32]]*
  %2 = getelementptr [4 x [3 x i32]]* %1, i32 0, i32 0
  %3 = getelementptr [3 x i32]* %2, i32 0, i32 0
  store i32 1, i32* %3
  %4 = getelementptr [3 x i32]* %2, i32 0, i32 1
  %5 = getelementptr [3 x i32]* %2, i32 0, i32 2
  %6 = getelementptr [4 x [3 x i32]]* %1, i32 0, i32 1
  %7 = getelementptr [3 x i32]* %6, i32 0, i32 0
  store i32 2, i32* %7
  %8 = getelementptr [3 x i32]* %6, i32 0, i32 1
  %9 = getelementptr [3 x i32]* %6, i32 0, i32 2
  %10 = getelementptr [4 x [3 x i32]]* %1, i32 0, i32 2
  %11 = getelementptr [3 x i32]* %10, i32 0, i32 0
  store i32 3, i32* %11
  %12 = getelementptr [3 x i32]* %10, i32 0, i32 1
  %13 = getelementptr [3 x i32]* %10, i32 0, i32 2
  %14 = getelementptr [4 x [3 x i32]]* %1, i32 0, i32 3
  %15 = getelementptr [3 x i32]* %14, i32 0, i32 0
  store i32 4, i32* %15
  %16 = getelementptr [3 x i32]* %14, i32 0, i32 1
  %17 = getelementptr [3 x i32]* %14, i32 0, i32 2
  %18 = bitcast [4 x [3 x i32]]* %z2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %18, i8 0, i64 48, i32 16, i1 false)
  %19 = bitcast i8* %18 to [4 x [3 x i32]]*
  %20 = getelementptr [4 x [3 x i32]]* %19, i32 0, i32 0
  %21 = getelementptr [3 x i32]* %20, i32 0, i32 0
  store i32 1, i32* %21
  %22 = getelementptr [3 x i32]* %20, i32 0, i32 1
  %23 = getelementptr [3 x i32]* %20, i32 0, i32 2
  %24 = getelementptr [4 x [3 x i32]]* %19, i32 0, i32 1
  %25 = getelementptr [3 x i32]* %24, i32 0, i32 0
  store i32 2, i32* %25
  %26 = getelementptr [3 x i32]* %24, i32 0, i32 1
  %27 = getelementptr [3 x i32]* %24, i32 0, i32 2
  %28 = getelementptr [4 x [3 x i32]]* %19, i32 0, i32 2
  %29 = getelementptr [3 x i32]* %28, i32 0, i32 0
  store i32 3, i32* %29
  %30 = getelementptr [3 x i32]* %28, i32 0, i32 1
  %31 = getelementptr [3 x i32]* %28, i32 0, i32 2
  %32 = getelementptr [4 x [3 x i32]]* %19, i32 0, i32 3
  %33 = getelementptr [3 x i32]* %32, i32 0, i32 0
  store i32 4, i32* %33
  %34 = getelementptr [3 x i32]* %32, i32 0, i32 1
  %35 = getelementptr [3 x i32]* %32, i32 0, i32 2
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc15, %entry
  %36 = load i32* %i, align 4
  %cmp = icmp slt i32 %36, 4
  br i1 %cmp, label %for.body, label %for.end17

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %37 = load i32* %j, align 4
  %cmp2 = icmp slt i32 %37, 3
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %38 = load i32* %i, align 4
  %39 = load i32* %j, align 4
  %40 = load i32* %j, align 4
  %idxprom = sext i32 %40 to i64
  %41 = load i32* %i, align 4
  %idxprom4 = sext i32 %41 to i64
  %arrayidx = getelementptr inbounds [4 x [3 x i32]]* %z1, i32 0, i64 %idxprom4
  %arrayidx5 = getelementptr inbounds [3 x i32]* %arrayidx, i32 0, i64 %idxprom
  %42 = load i32* %arrayidx5, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str1, i32 0, i32 0), i32 %38, i32 %39, i32 %42)
  %43 = load i32* %j, align 4
  %idxprom6 = sext i32 %43 to i64
  %44 = load i32* %i, align 4
  %idxprom7 = sext i32 %44 to i64
  %arrayidx8 = getelementptr inbounds [4 x [3 x i32]]* %z1, i32 0, i64 %idxprom7
  %arrayidx9 = getelementptr inbounds [3 x i32]* %arrayidx8, i32 0, i64 %idxprom6
  %45 = load i32* %arrayidx9, align 4
  %46 = load i32* %j, align 4
  %idxprom10 = sext i32 %46 to i64
  %47 = load i32* %i, align 4
  %idxprom11 = sext i32 %47 to i64
  %arrayidx12 = getelementptr inbounds [4 x [3 x i32]]* %z2, i32 0, i64 %idxprom11
  %arrayidx13 = getelementptr inbounds [3 x i32]* %arrayidx12, i32 0, i64 %idxprom10
  %48 = load i32* %arrayidx13, align 4
  %cmp14 = icmp ne i32 %45, %48
  br i1 %cmp14, label %if.then, label %if.end

if.then:                                          ; preds = %for.body3
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %for.body3
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %49 = load i32* %j, align 4
  %add = add nsw i32 %49, 1
  store i32 %add, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc15

for.inc15:                                        ; preds = %for.end
  %50 = load i32* %i, align 4
  %add16 = add nsw i32 %50, 1
  store i32 %add16, i32* %i, align 4
  br label %for.cond

for.end17:                                        ; preds = %for.cond
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %for.end17, %if.then
  %51 = load i32* %retval
  ret i32 %51
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define i32 @sec28() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %w1 = alloca [2 x %struct.anon], align 16
  %w2 = alloca [2 x %struct.anon.0], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %0 = bitcast [2 x %struct.anon]* %w1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([2 x %struct.anon]* @sec28.w1 to i8*), i64 32, i32 16, i1 false)
  %1 = bitcast [2 x %struct.anon.0]* %w2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast ([2 x %struct.anon.0]* @sec28.w2 to i8*), i64 32, i32 16, i1 false)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc25, %entry
  %2 = load i32* %i, align 4
  %cmp = icmp slt i32 %2, 2
  br i1 %cmp, label %for.body, label %for.end27

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %3 = load i32* %j, align 4
  %cmp2 = icmp slt i32 %3, 3
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %4 = load i32* %i, align 4
  %5 = load i32* %j, align 4
  %6 = load i32* %j, align 4
  %idxprom = sext i32 %6 to i64
  %7 = load i32* %i, align 4
  %idxprom4 = sext i32 %7 to i64
  %arrayidx = getelementptr inbounds [2 x %struct.anon]* %w1, i32 0, i64 %idxprom4
  %a = getelementptr inbounds %struct.anon* %arrayidx, i32 0, i32 0
  %arrayidx5 = getelementptr inbounds [3 x i32]* %a, i32 0, i64 %idxprom
  %8 = load i32* %arrayidx5, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0), i32 %4, i32 %5, i32 %8)
  %9 = load i32* %j, align 4
  %idxprom6 = sext i32 %9 to i64
  %10 = load i32* %i, align 4
  %idxprom7 = sext i32 %10 to i64
  %arrayidx8 = getelementptr inbounds [2 x %struct.anon]* %w1, i32 0, i64 %idxprom7
  %a9 = getelementptr inbounds %struct.anon* %arrayidx8, i32 0, i32 0
  %arrayidx10 = getelementptr inbounds [3 x i32]* %a9, i32 0, i64 %idxprom6
  %11 = load i32* %arrayidx10, align 4
  %12 = load i32* %j, align 4
  %idxprom11 = sext i32 %12 to i64
  %13 = load i32* %i, align 4
  %idxprom12 = sext i32 %13 to i64
  %arrayidx13 = getelementptr inbounds [2 x %struct.anon.0]* %w2, i32 0, i64 %idxprom12
  %a14 = getelementptr inbounds %struct.anon.0* %arrayidx13, i32 0, i32 0
  %arrayidx15 = getelementptr inbounds [3 x i32]* %a14, i32 0, i64 %idxprom11
  %14 = load i32* %arrayidx15, align 4
  %cmp16 = icmp ne i32 %11, %14
  br i1 %cmp16, label %if.then, label %if.end

if.then:                                          ; preds = %for.body3
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %for.body3
  %15 = load i32* %i, align 4
  %idxprom17 = sext i32 %15 to i64
  %arrayidx18 = getelementptr inbounds [2 x %struct.anon]* %w1, i32 0, i64 %idxprom17
  %b = getelementptr inbounds %struct.anon* %arrayidx18, i32 0, i32 1
  %16 = load i32* %b, align 4
  %17 = load i32* %i, align 4
  %idxprom19 = sext i32 %17 to i64
  %arrayidx20 = getelementptr inbounds [2 x %struct.anon.0]* %w2, i32 0, i64 %idxprom19
  %b21 = getelementptr inbounds %struct.anon.0* %arrayidx20, i32 0, i32 1
  %18 = load i32* %b21, align 4
  %cmp22 = icmp ne i32 %16, %18
  br i1 %cmp22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end
  store i32 1, i32* %retval
  br label %return

if.end24:                                         ; preds = %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end24
  %19 = load i32* %j, align 4
  %add = add nsw i32 %19, 1
  store i32 %add, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc25

for.inc25:                                        ; preds = %for.end
  %20 = load i32* %i, align 4
  %add26 = add nsw i32 %20, 1
  store i32 %add26, i32* %i, align 4
  br label %for.cond

for.end27:                                        ; preds = %for.cond
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %for.end27, %if.then23, %if.then
  %21 = load i32* %retval
  ret i32 %21
}

define i32 @sec29() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %q1 = alloca [4 x [3 x [2 x i16]]], align 16
  %q2 = alloca [4 x [3 x [2 x i16]]], align 16
  %q3 = alloca [4 x [3 x [2 x i16]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %0 = bitcast [4 x [3 x [2 x i16]]]* %q1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 48, i32 16, i1 false)
  %1 = bitcast i8* %0 to [4 x [3 x [2 x i16]]]*
  %2 = getelementptr [4 x [3 x [2 x i16]]]* %1, i32 0, i32 0
  %3 = getelementptr [3 x [2 x i16]]* %2, i32 0, i32 0
  %4 = getelementptr [2 x i16]* %3, i32 0, i32 0
  store i16 1, i16* %4
  %5 = getelementptr [2 x i16]* %3, i32 0, i32 1
  %6 = getelementptr [3 x [2 x i16]]* %2, i32 0, i32 1
  %7 = getelementptr [3 x [2 x i16]]* %2, i32 0, i32 2
  %8 = getelementptr [4 x [3 x [2 x i16]]]* %1, i32 0, i32 1
  %9 = getelementptr [3 x [2 x i16]]* %8, i32 0, i32 0
  %10 = getelementptr [2 x i16]* %9, i32 0, i32 0
  store i16 2, i16* %10
  %11 = getelementptr [2 x i16]* %9, i32 0, i32 1
  store i16 3, i16* %11
  %12 = getelementptr [3 x [2 x i16]]* %8, i32 0, i32 1
  %13 = getelementptr [3 x [2 x i16]]* %8, i32 0, i32 2
  %14 = getelementptr [4 x [3 x [2 x i16]]]* %1, i32 0, i32 2
  %15 = getelementptr [3 x [2 x i16]]* %14, i32 0, i32 0
  %16 = getelementptr [2 x i16]* %15, i32 0, i32 0
  store i16 4, i16* %16
  %17 = getelementptr [2 x i16]* %15, i32 0, i32 1
  store i16 5, i16* %17
  %18 = getelementptr [3 x [2 x i16]]* %14, i32 0, i32 1
  %19 = getelementptr [2 x i16]* %18, i32 0, i32 0
  store i16 6, i16* %19
  %20 = getelementptr [2 x i16]* %18, i32 0, i32 1
  %21 = getelementptr [3 x [2 x i16]]* %14, i32 0, i32 2
  %22 = getelementptr [4 x [3 x [2 x i16]]]* %1, i32 0, i32 3
  %23 = bitcast [4 x [3 x [2 x i16]]]* %q2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %23, i8 0, i64 48, i32 16, i1 false)
  %24 = bitcast i8* %23 to [4 x [3 x [2 x i16]]]*
  %25 = getelementptr [4 x [3 x [2 x i16]]]* %24, i32 0, i32 0
  %26 = getelementptr [3 x [2 x i16]]* %25, i32 0, i32 0
  %27 = getelementptr [2 x i16]* %26, i32 0, i32 0
  store i16 1, i16* %27
  %28 = getelementptr [2 x i16]* %26, i32 0, i32 1
  %29 = getelementptr [3 x [2 x i16]]* %25, i32 0, i32 1
  %30 = getelementptr [3 x [2 x i16]]* %25, i32 0, i32 2
  %31 = getelementptr [4 x [3 x [2 x i16]]]* %24, i32 0, i32 1
  %32 = getelementptr [3 x [2 x i16]]* %31, i32 0, i32 0
  %33 = getelementptr [2 x i16]* %32, i32 0, i32 0
  store i16 2, i16* %33
  %34 = getelementptr [2 x i16]* %32, i32 0, i32 1
  store i16 3, i16* %34
  %35 = getelementptr [3 x [2 x i16]]* %31, i32 0, i32 1
  %36 = getelementptr [3 x [2 x i16]]* %31, i32 0, i32 2
  %37 = getelementptr [4 x [3 x [2 x i16]]]* %24, i32 0, i32 2
  %38 = getelementptr [3 x [2 x i16]]* %37, i32 0, i32 0
  %39 = getelementptr [2 x i16]* %38, i32 0, i32 0
  store i16 4, i16* %39
  %40 = getelementptr [2 x i16]* %38, i32 0, i32 1
  store i16 5, i16* %40
  %41 = getelementptr [3 x [2 x i16]]* %37, i32 0, i32 1
  %42 = getelementptr [2 x i16]* %41, i32 0, i32 0
  store i16 6, i16* %42
  %43 = getelementptr [2 x i16]* %41, i32 0, i32 1
  %44 = getelementptr [3 x [2 x i16]]* %37, i32 0, i32 2
  %45 = getelementptr [4 x [3 x [2 x i16]]]* %24, i32 0, i32 3
  %46 = bitcast [4 x [3 x [2 x i16]]]* %q3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %46, i8 0, i64 48, i32 16, i1 false)
  %47 = bitcast i8* %46 to [4 x [3 x [2 x i16]]]*
  %48 = getelementptr [4 x [3 x [2 x i16]]]* %47, i32 0, i32 0
  %49 = getelementptr [3 x [2 x i16]]* %48, i32 0, i32 0
  %50 = getelementptr [2 x i16]* %49, i32 0, i32 0
  store i16 1, i16* %50
  %51 = getelementptr [2 x i16]* %49, i32 0, i32 1
  %52 = getelementptr [3 x [2 x i16]]* %48, i32 0, i32 1
  %53 = getelementptr [3 x [2 x i16]]* %48, i32 0, i32 2
  %54 = getelementptr [4 x [3 x [2 x i16]]]* %47, i32 0, i32 1
  %55 = getelementptr [3 x [2 x i16]]* %54, i32 0, i32 0
  %56 = getelementptr [2 x i16]* %55, i32 0, i32 0
  store i16 2, i16* %56
  %57 = getelementptr [2 x i16]* %55, i32 0, i32 1
  store i16 3, i16* %57
  %58 = getelementptr [3 x [2 x i16]]* %54, i32 0, i32 1
  %59 = getelementptr [3 x [2 x i16]]* %54, i32 0, i32 2
  %60 = getelementptr [4 x [3 x [2 x i16]]]* %47, i32 0, i32 2
  %61 = getelementptr [3 x [2 x i16]]* %60, i32 0, i32 0
  %62 = getelementptr [2 x i16]* %61, i32 0, i32 0
  store i16 4, i16* %62
  %63 = getelementptr [2 x i16]* %61, i32 0, i32 1
  store i16 5, i16* %63
  %64 = getelementptr [3 x [2 x i16]]* %60, i32 0, i32 1
  %65 = getelementptr [2 x i16]* %64, i32 0, i32 0
  store i16 6, i16* %65
  %66 = getelementptr [2 x i16]* %64, i32 0, i32 1
  %67 = getelementptr [3 x [2 x i16]]* %60, i32 0, i32 2
  %68 = getelementptr [4 x [3 x [2 x i16]]]* %47, i32 0, i32 3
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc48, %entry
  %69 = load i32* %i, align 4
  %cmp = icmp slt i32 %69, 4
  br i1 %cmp, label %for.body, label %for.end50

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc45, %for.body
  %70 = load i32* %j, align 4
  %cmp2 = icmp slt i32 %70, 3
  br i1 %cmp2, label %for.body3, label %for.end47

for.body3:                                        ; preds = %for.cond1
  store i32 0, i32* %k, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc, %for.body3
  %71 = load i32* %k, align 4
  %cmp5 = icmp slt i32 %71, 2
  br i1 %cmp5, label %for.body6, label %for.end

for.body6:                                        ; preds = %for.cond4
  %72 = load i32* %i, align 4
  %73 = load i32* %j, align 4
  %74 = load i32* %k, align 4
  %75 = load i32* %k, align 4
  %idxprom = sext i32 %75 to i64
  %76 = load i32* %j, align 4
  %idxprom7 = sext i32 %76 to i64
  %77 = load i32* %i, align 4
  %idxprom8 = sext i32 %77 to i64
  %arrayidx = getelementptr inbounds [4 x [3 x [2 x i16]]]* %q1, i32 0, i64 %idxprom8
  %arrayidx9 = getelementptr inbounds [3 x [2 x i16]]* %arrayidx, i32 0, i64 %idxprom7
  %arrayidx10 = getelementptr inbounds [2 x i16]* %arrayidx9, i32 0, i64 %idxprom
  %78 = load i16* %arrayidx10, align 2
  %conv = sext i16 %78 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str3, i32 0, i32 0), i32 %72, i32 %73, i32 %74, i32 %conv)
  %79 = load i32* %k, align 4
  %idxprom11 = sext i32 %79 to i64
  %80 = load i32* %j, align 4
  %idxprom12 = sext i32 %80 to i64
  %81 = load i32* %i, align 4
  %idxprom13 = sext i32 %81 to i64
  %arrayidx14 = getelementptr inbounds [4 x [3 x [2 x i16]]]* %q1, i32 0, i64 %idxprom13
  %arrayidx15 = getelementptr inbounds [3 x [2 x i16]]* %arrayidx14, i32 0, i64 %idxprom12
  %arrayidx16 = getelementptr inbounds [2 x i16]* %arrayidx15, i32 0, i64 %idxprom11
  %82 = load i16* %arrayidx16, align 2
  %conv17 = sext i16 %82 to i32
  %83 = load i32* %k, align 4
  %idxprom18 = sext i32 %83 to i64
  %84 = load i32* %j, align 4
  %idxprom19 = sext i32 %84 to i64
  %85 = load i32* %i, align 4
  %idxprom20 = sext i32 %85 to i64
  %arrayidx21 = getelementptr inbounds [4 x [3 x [2 x i16]]]* %q2, i32 0, i64 %idxprom20
  %arrayidx22 = getelementptr inbounds [3 x [2 x i16]]* %arrayidx21, i32 0, i64 %idxprom19
  %arrayidx23 = getelementptr inbounds [2 x i16]* %arrayidx22, i32 0, i64 %idxprom18
  %86 = load i16* %arrayidx23, align 2
  %conv24 = sext i16 %86 to i32
  %cmp25 = icmp ne i32 %conv17, %conv24
  br i1 %cmp25, label %if.then, label %if.end

if.then:                                          ; preds = %for.body6
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %for.body6
  %87 = load i32* %k, align 4
  %idxprom27 = sext i32 %87 to i64
  %88 = load i32* %j, align 4
  %idxprom28 = sext i32 %88 to i64
  %89 = load i32* %i, align 4
  %idxprom29 = sext i32 %89 to i64
  %arrayidx30 = getelementptr inbounds [4 x [3 x [2 x i16]]]* %q2, i32 0, i64 %idxprom29
  %arrayidx31 = getelementptr inbounds [3 x [2 x i16]]* %arrayidx30, i32 0, i64 %idxprom28
  %arrayidx32 = getelementptr inbounds [2 x i16]* %arrayidx31, i32 0, i64 %idxprom27
  %90 = load i16* %arrayidx32, align 2
  %conv33 = sext i16 %90 to i32
  %91 = load i32* %k, align 4
  %idxprom34 = sext i32 %91 to i64
  %92 = load i32* %j, align 4
  %idxprom35 = sext i32 %92 to i64
  %93 = load i32* %i, align 4
  %idxprom36 = sext i32 %93 to i64
  %arrayidx37 = getelementptr inbounds [4 x [3 x [2 x i16]]]* %q3, i32 0, i64 %idxprom36
  %arrayidx38 = getelementptr inbounds [3 x [2 x i16]]* %arrayidx37, i32 0, i64 %idxprom35
  %arrayidx39 = getelementptr inbounds [2 x i16]* %arrayidx38, i32 0, i64 %idxprom34
  %94 = load i16* %arrayidx39, align 2
  %conv40 = sext i16 %94 to i32
  %cmp41 = icmp ne i32 %conv33, %conv40
  br i1 %cmp41, label %if.then43, label %if.end44

if.then43:                                        ; preds = %if.end
  store i32 1, i32* %retval
  br label %return

if.end44:                                         ; preds = %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end44
  %95 = load i32* %k, align 4
  %add = add nsw i32 %95, 1
  store i32 %add, i32* %k, align 4
  br label %for.cond4

for.end:                                          ; preds = %for.cond4
  br label %for.inc45

for.inc45:                                        ; preds = %for.end
  %96 = load i32* %j, align 4
  %add46 = add nsw i32 %96, 1
  store i32 %add46, i32* %j, align 4
  br label %for.cond1

for.end47:                                        ; preds = %for.cond1
  br label %for.inc48

for.inc48:                                        ; preds = %for.end47
  %97 = load i32* %i, align 4
  %add49 = add nsw i32 %97, 1
  store i32 %add49, i32* %i, align 4
  br label %for.cond

for.end50:                                        ; preds = %for.cond
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %for.end50, %if.then43, %if.then
  %98 = load i32* %retval
  ret i32 %98
}

define i32 @sec31() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a1 = alloca [2 x i32], align 4
  %b1 = alloca [3 x i32], align 4
  %a2 = alloca [2 x i32], align 4
  %b2 = alloca [3 x i32], align 4
  %i = alloca i32, align 4
  %i6 = alloca i32, align 4
  %0 = bitcast [2 x i32]* %a1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([2 x i32]* @sec31.a1 to i8*), i64 8, i32 4, i1 false)
  %1 = bitcast [3 x i32]* %b1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast ([3 x i32]* @sec31.b1 to i8*), i64 12, i32 4, i1 false)
  %2 = bitcast [2 x i32]* %a2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast ([2 x i32]* @sec31.a2 to i8*), i64 8, i32 4, i1 false)
  %3 = bitcast [3 x i32]* %b2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* bitcast ([3 x i32]* @sec31.b2 to i8*), i64 12, i32 4, i1 false)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32* %i, align 4
  %cmp = icmp slt i32 %4, 2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %5 = load i32* %i, align 4
  %6 = load i32* %i, align 4
  %idxprom = sext i32 %6 to i64
  %arrayidx = getelementptr inbounds [2 x i32]* %a1, i32 0, i64 %idxprom
  %7 = load i32* %arrayidx, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str4, i32 0, i32 0), i32 %5, i32 %7)
  %8 = load i32* %i, align 4
  %idxprom1 = sext i32 %8 to i64
  %arrayidx2 = getelementptr inbounds [2 x i32]* %a1, i32 0, i64 %idxprom1
  %9 = load i32* %arrayidx2, align 4
  %10 = load i32* %i, align 4
  %idxprom3 = sext i32 %10 to i64
  %arrayidx4 = getelementptr inbounds [2 x i32]* %a2, i32 0, i64 %idxprom3
  %11 = load i32* %arrayidx4, align 4
  %cmp5 = icmp ne i32 %9, %11
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %12 = load i32* %i, align 4
  %add = add nsw i32 %12, 1
  store i32 %add, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i6, align 4
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc20, %for.end
  %13 = load i32* %i6, align 4
  %cmp8 = icmp slt i32 %13, 3
  br i1 %cmp8, label %for.body9, label %for.end22

for.body9:                                        ; preds = %for.cond7
  %14 = load i32* %i6, align 4
  %15 = load i32* %i6, align 4
  %idxprom10 = sext i32 %15 to i64
  %arrayidx11 = getelementptr inbounds [3 x i32]* %b1, i32 0, i64 %idxprom10
  %16 = load i32* %arrayidx11, align 4
  %call12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str5, i32 0, i32 0), i32 %14, i32 %16)
  %17 = load i32* %i6, align 4
  %idxprom13 = sext i32 %17 to i64
  %arrayidx14 = getelementptr inbounds [3 x i32]* %b1, i32 0, i64 %idxprom13
  %18 = load i32* %arrayidx14, align 4
  %19 = load i32* %i6, align 4
  %idxprom15 = sext i32 %19 to i64
  %arrayidx16 = getelementptr inbounds [3 x i32]* %b2, i32 0, i64 %idxprom15
  %20 = load i32* %arrayidx16, align 4
  %cmp17 = icmp ne i32 %18, %20
  br i1 %cmp17, label %if.then18, label %if.end19

if.then18:                                        ; preds = %for.body9
  store i32 1, i32* %retval
  br label %return

if.end19:                                         ; preds = %for.body9
  br label %for.inc20

for.inc20:                                        ; preds = %if.end19
  %21 = load i32* %i6, align 4
  %add21 = add nsw i32 %21, 1
  store i32 %add21, i32* %i6, align 4
  br label %for.cond7

for.end22:                                        ; preds = %for.cond7
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %for.end22, %if.then18, %if.then
  %22 = load i32* %retval
  ret i32 %22
}

define i32 @sec32() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %s1 = alloca [4 x i8], align 1
  %t1 = alloca [3 x i8], align 1
  %s2 = alloca [4 x i8], align 1
  %t2 = alloca [3 x i8], align 1
  %s3 = alloca i8*, align 8
  %i = alloca i32, align 4
  %i19 = alloca i32, align 4
  %0 = bitcast [4 x i8]* %s1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* getelementptr inbounds ([4 x i8]* @sec32.s1, i32 0, i32 0), i64 4, i32 1, i1 false)
  %1 = bitcast [3 x i8]* %t1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* getelementptr inbounds ([3 x i8]* @sec32.t1, i32 0, i32 0), i64 3, i32 1, i1 false)
  %2 = bitcast [4 x i8]* %s2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* getelementptr inbounds ([4 x i8]* @sec32.s2, i32 0, i32 0), i64 4, i32 1, i1 false)
  %3 = bitcast [3 x i8]* %t2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* getelementptr inbounds ([3 x i8]* @sec32.t2, i32 0, i32 0), i64 3, i32 1, i1 false)
  store i8* getelementptr inbounds ([4 x i8]* @.str6, i32 0, i32 0), i8** %s3, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32* %i, align 4
  %cmp = icmp slt i32 %4, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %5 = load i32* %i, align 4
  %6 = load i32* %i, align 4
  %idxprom = sext i32 %6 to i64
  %arrayidx = getelementptr inbounds [4 x i8]* %s1, i32 0, i64 %idxprom
  %7 = load i8* %arrayidx, align 1
  %conv = sext i8 %7 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str7, i32 0, i32 0), i32 %5, i32 %conv)
  %8 = load i32* %i, align 4
  %idxprom1 = sext i32 %8 to i64
  %arrayidx2 = getelementptr inbounds [4 x i8]* %s1, i32 0, i64 %idxprom1
  %9 = load i8* %arrayidx2, align 1
  %conv3 = sext i8 %9 to i32
  %10 = load i32* %i, align 4
  %idxprom4 = sext i32 %10 to i64
  %arrayidx5 = getelementptr inbounds [4 x i8]* %s2, i32 0, i64 %idxprom4
  %11 = load i8* %arrayidx5, align 1
  %conv6 = sext i8 %11 to i32
  %cmp7 = icmp ne i32 %conv3, %conv6
  br i1 %cmp7, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %for.body
  %12 = load i32* %i, align 4
  %idxprom9 = sext i32 %12 to i64
  %arrayidx10 = getelementptr inbounds [4 x i8]* %s2, i32 0, i64 %idxprom9
  %13 = load i8* %arrayidx10, align 1
  %conv11 = sext i8 %13 to i32
  %14 = load i32* %i, align 4
  %idxprom12 = sext i32 %14 to i64
  %15 = load i8** %s3, align 8
  %arrayidx13 = getelementptr inbounds i8* %15, i64 %idxprom12
  %16 = load i8* %arrayidx13, align 1
  %conv14 = sext i8 %16 to i32
  %cmp15 = icmp ne i32 %conv11, %conv14
  br i1 %cmp15, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.end
  store i32 1, i32* %retval
  br label %return

if.end18:                                         ; preds = %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end18
  %17 = load i32* %i, align 4
  %add = add nsw i32 %17, 1
  store i32 %add, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i19, align 4
  br label %for.cond20

for.cond20:                                       ; preds = %for.inc38, %for.end
  %18 = load i32* %i19, align 4
  %cmp21 = icmp slt i32 %18, 3
  br i1 %cmp21, label %for.body23, label %for.end40

for.body23:                                       ; preds = %for.cond20
  %19 = load i32* %i19, align 4
  %20 = load i32* %i19, align 4
  %idxprom24 = sext i32 %20 to i64
  %arrayidx25 = getelementptr inbounds [3 x i8]* %t1, i32 0, i64 %idxprom24
  %21 = load i8* %arrayidx25, align 1
  %conv26 = sext i8 %21 to i32
  %call27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str8, i32 0, i32 0), i32 %19, i32 %conv26)
  %22 = load i32* %i19, align 4
  %idxprom28 = sext i32 %22 to i64
  %arrayidx29 = getelementptr inbounds [3 x i8]* %t1, i32 0, i64 %idxprom28
  %23 = load i8* %arrayidx29, align 1
  %conv30 = sext i8 %23 to i32
  %24 = load i32* %i19, align 4
  %idxprom31 = sext i32 %24 to i64
  %arrayidx32 = getelementptr inbounds [3 x i8]* %t2, i32 0, i64 %idxprom31
  %25 = load i8* %arrayidx32, align 1
  %conv33 = sext i8 %25 to i32
  %cmp34 = icmp ne i32 %conv30, %conv33
  br i1 %cmp34, label %if.then36, label %if.end37

if.then36:                                        ; preds = %for.body23
  store i32 1, i32* %retval
  br label %return

if.end37:                                         ; preds = %for.body23
  br label %for.inc38

for.inc38:                                        ; preds = %if.end37
  %26 = load i32* %i19, align 4
  %add39 = add nsw i32 %26, 1
  store i32 %add39, i32* %i19, align 4
  br label %for.cond20

for.end40:                                        ; preds = %for.cond20
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %for.end40, %if.then36, %if.then17, %if.then
  %27 = load i32* %retval
  ret i32 %27
}

define i32 @sec33() nounwind uwtable {
entry:
  %nm = alloca [2 x i8*], align 16
  %0 = bitcast [2 x i8*]* %nm to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([2 x i8*]* @sec33.nm to i8*), i64 16, i32 16, i1 false)
  %arrayidx = getelementptr inbounds [2 x i8*]* %nm, i32 0, i64 0
  %1 = load i8** %arrayidx, align 8
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str11, i32 0, i32 0), i8* %1)
  %arrayidx1 = getelementptr inbounds [2 x i8*]* %nm, i32 0, i64 1
  %2 = load i8** %arrayidx1, align 8
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str11, i32 0, i32 0), i8* %2)
  ret i32 0
}

define i32 @sec34() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x1 = alloca %struct.div_t, align 4
  %x2 = alloca %struct.div_t, align 4
  %0 = bitcast %struct.div_t* %x1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast (%struct.div_t* @sec34.x1 to i8*), i64 8, i32 4, i1 false)
  %1 = bitcast %struct.div_t* %x2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast (%struct.div_t* @sec34.x2 to i8*), i64 8, i32 4, i1 false)
  %quot = getelementptr inbounds %struct.div_t* %x1, i32 0, i32 0
  %2 = load i32* %quot, align 4
  %quot1 = getelementptr inbounds %struct.div_t* %x2, i32 0, i32 0
  %3 = load i32* %quot1, align 4
  %cmp = icmp ne i32 %2, %3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %rem = getelementptr inbounds %struct.div_t* %x1, i32 0, i32 1
  %4 = load i32* %rem, align 4
  %rem2 = getelementptr inbounds %struct.div_t* %x2, i32 0, i32 1
  %5 = load i32* %rem2, align 4
  %cmp3 = icmp ne i32 %4, %5
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  store i32 1, i32* %retval
  br label %return

if.end5:                                          ; preds = %if.end
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end5, %if.then4, %if.then
  %6 = load i32* %retval
  ret i32 %6
}

define i32 @sec35() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %w1 = alloca [2 x %struct.anon.1], align 16
  %w2 = alloca [2 x %struct.anon.2], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %0 = bitcast [2 x %struct.anon.1]* %w1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([2 x %struct.anon.1]* @sec35.w1 to i8*), i64 32, i32 16, i1 false)
  %1 = bitcast [2 x %struct.anon.2]* %w2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 32, i32 16, i1 false)
  %arrayidx = getelementptr inbounds [2 x %struct.anon.2]* %w2, i32 0, i64 0
  %a = getelementptr inbounds %struct.anon.2* %arrayidx, i32 0, i32 0
  %arrayidx1 = getelementptr inbounds [3 x i32]* %a, i32 0, i64 0
  store i32 1, i32* %arrayidx1, align 4
  %arrayidx2 = getelementptr inbounds [2 x %struct.anon.2]* %w2, i32 0, i64 1
  %a3 = getelementptr inbounds %struct.anon.2* %arrayidx2, i32 0, i32 0
  %arrayidx4 = getelementptr inbounds [3 x i32]* %a3, i32 0, i64 0
  store i32 2, i32* %arrayidx4, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc23, %entry
  %2 = load i32* %i, align 4
  %cmp = icmp slt i32 %2, 2
  br i1 %cmp, label %for.body, label %for.end25

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc, %for.body
  %3 = load i32* %j, align 4
  %cmp6 = icmp slt i32 %3, 3
  br i1 %cmp6, label %for.body7, label %for.end

for.body7:                                        ; preds = %for.cond5
  %4 = load i32* %i, align 4
  %5 = load i32* %j, align 4
  %6 = load i32* %j, align 4
  %idxprom = sext i32 %6 to i64
  %7 = load i32* %i, align 4
  %idxprom8 = sext i32 %7 to i64
  %arrayidx9 = getelementptr inbounds [2 x %struct.anon.1]* %w1, i32 0, i64 %idxprom8
  %a10 = getelementptr inbounds %struct.anon.1* %arrayidx9, i32 0, i32 0
  %arrayidx11 = getelementptr inbounds [3 x i32]* %a10, i32 0, i64 %idxprom
  %8 = load i32* %arrayidx11, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str12, i32 0, i32 0), i32 %4, i32 %5, i32 %8)
  %9 = load i32* %j, align 4
  %idxprom12 = sext i32 %9 to i64
  %10 = load i32* %i, align 4
  %idxprom13 = sext i32 %10 to i64
  %arrayidx14 = getelementptr inbounds [2 x %struct.anon.1]* %w1, i32 0, i64 %idxprom13
  %a15 = getelementptr inbounds %struct.anon.1* %arrayidx14, i32 0, i32 0
  %arrayidx16 = getelementptr inbounds [3 x i32]* %a15, i32 0, i64 %idxprom12
  %11 = load i32* %arrayidx16, align 4
  %12 = load i32* %j, align 4
  %idxprom17 = sext i32 %12 to i64
  %13 = load i32* %i, align 4
  %idxprom18 = sext i32 %13 to i64
  %arrayidx19 = getelementptr inbounds [2 x %struct.anon.2]* %w2, i32 0, i64 %idxprom18
  %a20 = getelementptr inbounds %struct.anon.2* %arrayidx19, i32 0, i32 0
  %arrayidx21 = getelementptr inbounds [3 x i32]* %a20, i32 0, i64 %idxprom17
  %14 = load i32* %arrayidx21, align 4
  %cmp22 = icmp ne i32 %11, %14
  br i1 %cmp22, label %if.then, label %if.end

if.then:                                          ; preds = %for.body7
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %for.body7
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %15 = load i32* %j, align 4
  %add = add nsw i32 %15, 1
  store i32 %add, i32* %j, align 4
  br label %for.cond5

for.end:                                          ; preds = %for.cond5
  br label %for.inc23

for.inc23:                                        ; preds = %for.end
  %16 = load i32* %i, align 4
  %add24 = add nsw i32 %16, 1
  store i32 %add24, i32* %i, align 4
  br label %for.cond

for.end25:                                        ; preds = %for.cond
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %for.end25, %if.then
  %17 = load i32* %retval
  ret i32 %17
}

define i32 @sec36() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a1 = alloca [20 x i32], align 16
  %a2 = alloca [20 x i32], align 16
  %i = alloca i32, align 4
  %0 = bitcast [20 x i32]* %a1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([20 x i32]* @sec36.a1 to i8*), i64 80, i32 16, i1 false)
  %1 = bitcast [20 x i32]* %a2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast ([20 x i32]* @sec36.a2 to i8*), i64 80, i32 16, i1 false)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32* %i, align 4
  %cmp = icmp slt i32 %2, 20
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32* %i, align 4
  %4 = load i32* %i, align 4
  %idxprom = sext i32 %4 to i64
  %arrayidx = getelementptr inbounds [20 x i32]* %a1, i32 0, i64 %idxprom
  %5 = load i32* %arrayidx, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str4, i32 0, i32 0), i32 %3, i32 %5)
  %6 = load i32* %i, align 4
  %idxprom1 = sext i32 %6 to i64
  %arrayidx2 = getelementptr inbounds [20 x i32]* %a1, i32 0, i64 %idxprom1
  %7 = load i32* %arrayidx2, align 4
  %8 = load i32* %i, align 4
  %idxprom3 = sext i32 %8 to i64
  %arrayidx4 = getelementptr inbounds [20 x i32]* %a2, i32 0, i64 %idxprom3
  %9 = load i32* %arrayidx4, align 4
  %cmp5 = icmp ne i32 %7, %9
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %10 = load i32* %i, align 4
  %add = add nsw i32 %10, 1
  store i32 %add, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %for.end, %if.then
  %11 = load i32* %retval
  ret i32 %11
}

define i32 @sec38() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %u1 = alloca %union.anon, align 4
  %u2 = alloca %union.anon.3, align 4
  %u3 = alloca %union.anon.4, align 4
  %0 = bitcast %union.anon* %u1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast (%union.anon* @sec38.u1 to i8*), i64 8, i32 4, i1 false)
  %1 = bitcast %union.anon.3* %u2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast ({ i32, [4 x i8] }* @sec38.u2 to i8*), i64 8, i32 4, i1 false)
  %2 = bitcast %union.anon.4* %u3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast ({ float, [4 x i8] }* @sec38.u3 to i8*), i64 8, i32 4, i1 false)
  %c = bitcast %union.anon* %u1 to [2 x i32]*
  %arrayidx = getelementptr inbounds [2 x i32]* %c, i32 0, i64 0
  %3 = load i32* %arrayidx, align 4
  %cmp = icmp ne i32 %3, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %c1 = bitcast %union.anon* %u1 to [2 x i32]*
  %arrayidx2 = getelementptr inbounds [2 x i32]* %c1, i32 0, i64 1
  %4 = load i32* %arrayidx2, align 4
  %cmp3 = icmp ne i32 %4, 2
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  store i32 1, i32* %retval
  br label %return

if.end5:                                          ; preds = %if.end
  %a = bitcast %union.anon.3* %u2 to i32*
  %5 = load i32* %a, align 4
  %cmp6 = icmp ne i32 %5, 3
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end5
  store i32 1, i32* %retval
  br label %return

if.end8:                                          ; preds = %if.end5
  %b = bitcast %union.anon.4* %u3 to float*
  %6 = load float* %b, align 4
  %conv = fpext float %6 to double
  %cmp9 = fcmp une double %conv, 4.500000e+00
  br i1 %cmp9, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end8
  store i32 1, i32* %retval
  br label %return

if.end12:                                         ; preds = %if.end8
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end12, %if.then11, %if.then7, %if.then4, %if.then
  %7 = load i32* %retval
  ret i32 %7
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @sec26()
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 26, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %call1 = call i32 @sec27()
  %tobool2 = icmp ne i32 %call1, 0
  br i1 %tobool2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  store i32 27, i32* %retval
  br label %return

if.end4:                                          ; preds = %if.end
  %call5 = call i32 @sec28()
  %tobool6 = icmp ne i32 %call5, 0
  br i1 %tobool6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end4
  store i32 28, i32* %retval
  br label %return

if.end8:                                          ; preds = %if.end4
  %call9 = call i32 @sec29()
  %tobool10 = icmp ne i32 %call9, 0
  br i1 %tobool10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end8
  store i32 29, i32* %retval
  br label %return

if.end12:                                         ; preds = %if.end8
  %call13 = call i32 @sec31()
  %tobool14 = icmp ne i32 %call13, 0
  br i1 %tobool14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end12
  store i32 31, i32* %retval
  br label %return

if.end16:                                         ; preds = %if.end12
  %call17 = call i32 @sec32()
  %tobool18 = icmp ne i32 %call17, 0
  br i1 %tobool18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.end16
  store i32 32, i32* %retval
  br label %return

if.end20:                                         ; preds = %if.end16
  %call21 = call i32 @sec33()
  %tobool22 = icmp ne i32 %call21, 0
  br i1 %tobool22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end20
  store i32 33, i32* %retval
  br label %return

if.end24:                                         ; preds = %if.end20
  %call25 = call i32 @sec34()
  %tobool26 = icmp ne i32 %call25, 0
  br i1 %tobool26, label %if.then27, label %if.end28

if.then27:                                        ; preds = %if.end24
  store i32 34, i32* %retval
  br label %return

if.end28:                                         ; preds = %if.end24
  %call29 = call i32 @sec35()
  %tobool30 = icmp ne i32 %call29, 0
  br i1 %tobool30, label %if.then31, label %if.end32

if.then31:                                        ; preds = %if.end28
  store i32 35, i32* %retval
  br label %return

if.end32:                                         ; preds = %if.end28
  %call33 = call i32 @sec36()
  %tobool34 = icmp ne i32 %call33, 0
  br i1 %tobool34, label %if.then35, label %if.end36

if.then35:                                        ; preds = %if.end32
  store i32 36, i32* %retval
  br label %return

if.end36:                                         ; preds = %if.end32
  %call37 = call i32 @sec38()
  %tobool38 = icmp ne i32 %call37, 0
  br i1 %tobool38, label %if.then39, label %if.end40

if.then39:                                        ; preds = %if.end36
  store i32 38, i32* %retval
  br label %return

if.end40:                                         ; preds = %if.end36
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end40, %if.then39, %if.then35, %if.then31, %if.then27, %if.then23, %if.then19, %if.then15, %if.then11, %if.then7, %if.then3, %if.then
  %0 = load i32* %retval
  ret i32 %0
}
