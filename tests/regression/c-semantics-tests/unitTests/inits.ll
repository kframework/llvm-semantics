; ModuleID = '/home/david/src/c-semantics/tests/unitTests/inits.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.x = private unnamed_addr constant [3 x i32] [i32 1, i32 3, i32 5], align 4
@main.y0 = private unnamed_addr constant [12 x i32] [i32 1, i32 3, i32 5, i32 2, i32 4, i32 6, i32 3, i32 5, i32 7, i32 0, i32 0, i32 0], align 16
@main.y1 = private unnamed_addr constant [4 x [3 x i32]] [[3 x i32] [i32 1, i32 3, i32 5], [3 x i32] [i32 2, i32 4, i32 6], [3 x i32] [i32 3, i32 5, i32 7], [3 x i32] zeroinitializer], align 16
@main.y2 = private unnamed_addr constant [4 x [3 x i32]] [[3 x i32] [i32 1, i32 3, i32 5], [3 x i32] [i32 2, i32 4, i32 6], [3 x i32] [i32 3, i32 5, i32 7], [3 x i32] zeroinitializer], align 16
@.str = private unnamed_addr constant [54 x i8] c"i=%d, j=%d, k=%d; y0[k]=%d, y1[i][j]=%d, y2[i][j]=%d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca [3 x i32], align 4
  %y0 = alloca [12 x i32], align 16
  %y1 = alloca [4 x [3 x i32]], align 16
  %y2 = alloca [4 x [3 x i32]], align 16
  %y3 = alloca [4 x [3 x i32]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = bitcast [3 x i32]* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([3 x i32]* @main.x to i8*), i64 12, i32 4, i1 false)
  %1 = bitcast [12 x i32]* %y0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast ([12 x i32]* @main.y0 to i8*), i64 48, i32 16, i1 false)
  %2 = bitcast [4 x [3 x i32]]* %y1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast ([4 x [3 x i32]]* @main.y1 to i8*), i64 48, i32 16, i1 false)
  %3 = bitcast [4 x [3 x i32]]* %y2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* bitcast ([4 x [3 x i32]]* @main.y2 to i8*), i64 48, i32 16, i1 false)
  %4 = bitcast [4 x [3 x i32]]* %y3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 48, i32 16, i1 false)
  %5 = bitcast i8* %4 to [4 x [3 x i32]]*
  %6 = getelementptr [4 x [3 x i32]]* %5, i32 0, i32 0
  %7 = getelementptr [3 x i32]* %6, i32 0, i32 0
  store i32 1, i32* %7
  %8 = getelementptr [3 x i32]* %6, i32 0, i32 1
  %9 = getelementptr [3 x i32]* %6, i32 0, i32 2
  %10 = getelementptr [4 x [3 x i32]]* %5, i32 0, i32 1
  %11 = getelementptr [3 x i32]* %10, i32 0, i32 0
  store i32 2, i32* %11
  %12 = getelementptr [3 x i32]* %10, i32 0, i32 1
  %13 = getelementptr [3 x i32]* %10, i32 0, i32 2
  %14 = getelementptr [4 x [3 x i32]]* %5, i32 0, i32 2
  %15 = getelementptr [3 x i32]* %14, i32 0, i32 0
  store i32 3, i32* %15
  %16 = getelementptr [3 x i32]* %14, i32 0, i32 1
  %17 = getelementptr [3 x i32]* %14, i32 0, i32 2
  %18 = getelementptr [4 x [3 x i32]]* %5, i32 0, i32 3
  %19 = getelementptr [3 x i32]* %18, i32 0, i32 0
  store i32 4, i32* %19
  %20 = getelementptr [3 x i32]* %18, i32 0, i32 1
  %21 = getelementptr [3 x i32]* %18, i32 0, i32 2
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc28, %entry
  %22 = load i32* %i, align 4
  %cmp = icmp slt i32 %22, 4
  br i1 %cmp, label %for.body, label %for.end30

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %23 = load i32* %j, align 4
  %cmp2 = icmp slt i32 %23, 3
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %24 = load i32* %i, align 4
  %mul = mul nsw i32 3, %24
  %25 = load i32* %j, align 4
  %add = add nsw i32 %mul, %25
  store i32 %add, i32* %k, align 4
  %26 = load i32* %j, align 4
  %idxprom = sext i32 %26 to i64
  %27 = load i32* %i, align 4
  %idxprom4 = sext i32 %27 to i64
  %arrayidx = getelementptr inbounds [4 x [3 x i32]]* %y1, i32 0, i64 %idxprom4
  %arrayidx5 = getelementptr inbounds [3 x i32]* %arrayidx, i32 0, i64 %idxprom
  %28 = load i32* %arrayidx5, align 4
  %29 = load i32* %j, align 4
  %idxprom6 = sext i32 %29 to i64
  %30 = load i32* %i, align 4
  %idxprom7 = sext i32 %30 to i64
  %arrayidx8 = getelementptr inbounds [4 x [3 x i32]]* %y2, i32 0, i64 %idxprom7
  %arrayidx9 = getelementptr inbounds [3 x i32]* %arrayidx8, i32 0, i64 %idxprom6
  %31 = load i32* %arrayidx9, align 4
  %cmp10 = icmp ne i32 %28, %31
  br i1 %cmp10, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body3
  %32 = load i32* %j, align 4
  %idxprom11 = sext i32 %32 to i64
  %33 = load i32* %i, align 4
  %idxprom12 = sext i32 %33 to i64
  %arrayidx13 = getelementptr inbounds [4 x [3 x i32]]* %y1, i32 0, i64 %idxprom12
  %arrayidx14 = getelementptr inbounds [3 x i32]* %arrayidx13, i32 0, i64 %idxprom11
  %34 = load i32* %arrayidx14, align 4
  %35 = load i32* %k, align 4
  %idxprom15 = sext i32 %35 to i64
  %arrayidx16 = getelementptr inbounds [12 x i32]* %y0, i32 0, i64 %idxprom15
  %36 = load i32* %arrayidx16, align 4
  %cmp17 = icmp ne i32 %34, %36
  br i1 %cmp17, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %for.body3
  %37 = load i32* %i, align 4
  %38 = load i32* %j, align 4
  %39 = load i32* %k, align 4
  %40 = load i32* %k, align 4
  %idxprom18 = sext i32 %40 to i64
  %arrayidx19 = getelementptr inbounds [12 x i32]* %y0, i32 0, i64 %idxprom18
  %41 = load i32* %arrayidx19, align 4
  %42 = load i32* %j, align 4
  %idxprom20 = sext i32 %42 to i64
  %43 = load i32* %i, align 4
  %idxprom21 = sext i32 %43 to i64
  %arrayidx22 = getelementptr inbounds [4 x [3 x i32]]* %y1, i32 0, i64 %idxprom21
  %arrayidx23 = getelementptr inbounds [3 x i32]* %arrayidx22, i32 0, i64 %idxprom20
  %44 = load i32* %arrayidx23, align 4
  %45 = load i32* %j, align 4
  %idxprom24 = sext i32 %45 to i64
  %46 = load i32* %i, align 4
  %idxprom25 = sext i32 %46 to i64
  %arrayidx26 = getelementptr inbounds [4 x [3 x i32]]* %y2, i32 0, i64 %idxprom25
  %arrayidx27 = getelementptr inbounds [3 x i32]* %arrayidx26, i32 0, i64 %idxprom24
  %47 = load i32* %arrayidx27, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str, i32 0, i32 0), i32 %37, i32 %38, i32 %39, i32 %41, i32 %44, i32 %47)
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %48 = load i32* %j, align 4
  %inc = add nsw i32 %48, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc28

for.inc28:                                        ; preds = %for.end
  %49 = load i32* %i, align 4
  %inc29 = add nsw i32 %49, 1
  store i32 %inc29, i32* %i, align 4
  br label %for.cond

for.end30:                                        ; preds = %for.cond
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare i32 @printf(i8*, ...)
