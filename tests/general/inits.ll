; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/inits.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@main.x = internal unnamed_addr constant [3 x i32] [i32 1, i32 3, i32 5], align 4
@main.y0 = internal unnamed_addr constant [12 x i32] [i32 1, i32 3, i32 5, i32 2, i32 4, i32 6, i32 3, i32 5, i32 7, i32 0, i32 0, i32 0], align 16
@main.y1 = internal unnamed_addr constant [4 x [3 x i32]] [[3 x i32] [i32 1, i32 3, i32 5], [3 x i32] [i32 2, i32 4, i32 6], [3 x i32] [i32 3, i32 5, i32 7], [3 x i32] zeroinitializer], align 16
@main.y2 = internal unnamed_addr constant [4 x [3 x i32]] [[3 x i32] [i32 1, i32 3, i32 5], [3 x i32] [i32 2, i32 4, i32 6], [3 x i32] [i32 3, i32 5, i32 7], [3 x i32] zeroinitializer], align 16
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
  %tmp = bitcast [3 x i32]* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast ([3 x i32]* @main.x to i8*), i64 12, i32 4, i1 false)
  %tmp2 = bitcast [12 x i32]* %y0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp2, i8* bitcast ([12 x i32]* @main.y0 to i8*), i64 48, i32 16, i1 false)
  %tmp4 = bitcast [4 x [3 x i32]]* %y1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp4, i8* bitcast ([4 x [3 x i32]]* @main.y1 to i8*), i64 48, i32 16, i1 false)
  %tmp6 = bitcast [4 x [3 x i32]]* %y2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp6, i8* bitcast ([4 x [3 x i32]]* @main.y2 to i8*), i64 48, i32 16, i1 false)
  %tmp8 = bitcast [4 x [3 x i32]]* %y3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %tmp8, i8 0, i64 48, i32 16, i1 false)
  %0 = bitcast i8* %tmp8 to [4 x [3 x i32]]*
  %1 = getelementptr [4 x [3 x i32]]* %0, i32 0, i32 0
  %2 = getelementptr [3 x i32]* %1, i32 0, i32 0
  store i32 1, i32* %2
  %3 = getelementptr [4 x [3 x i32]]* %0, i32 0, i32 1
  %4 = getelementptr [3 x i32]* %3, i32 0, i32 0
  store i32 2, i32* %4
  %5 = getelementptr [4 x [3 x i32]]* %0, i32 0, i32 2
  %6 = getelementptr [3 x i32]* %5, i32 0, i32 0
  store i32 3, i32* %6
  %7 = getelementptr [4 x [3 x i32]]* %0, i32 0, i32 3
  %8 = getelementptr [3 x i32]* %7, i32 0, i32 0
  store i32 4, i32* %8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc66, %entry
  %tmp10 = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp10, 4
  br i1 %cmp, label %for.body, label %for.end69

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond12

for.cond12:                                       ; preds = %for.inc, %for.body
  %tmp13 = load i32* %j, align 4
  %cmp14 = icmp slt i32 %tmp13, 3
  br i1 %cmp14, label %for.body15, label %for.end

for.body15:                                       ; preds = %for.cond12
  %tmp17 = load i32* %i, align 4
  %mul = mul nsw i32 3, %tmp17
  %tmp18 = load i32* %j, align 4
  %add = add nsw i32 %mul, %tmp18
  store i32 %add, i32* %k, align 4
  %tmp19 = load i32* %j, align 4
  %idxprom = sext i32 %tmp19 to i64
  %tmp20 = load i32* %i, align 4
  %idxprom21 = sext i32 %tmp20 to i64
  %arrayidx = getelementptr inbounds [4 x [3 x i32]]* %y1, i32 0, i64 %idxprom21
  %arrayidx22 = getelementptr inbounds [3 x i32]* %arrayidx, i32 0, i64 %idxprom
  %tmp23 = load i32* %arrayidx22, align 4
  %tmp24 = load i32* %j, align 4
  %idxprom25 = sext i32 %tmp24 to i64
  %tmp26 = load i32* %i, align 4
  %idxprom27 = sext i32 %tmp26 to i64
  %arrayidx28 = getelementptr inbounds [4 x [3 x i32]]* %y2, i32 0, i64 %idxprom27
  %arrayidx29 = getelementptr inbounds [3 x i32]* %arrayidx28, i32 0, i64 %idxprom25
  %tmp30 = load i32* %arrayidx29, align 4
  %cmp31 = icmp ne i32 %tmp23, %tmp30
  br i1 %cmp31, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body15
  %tmp32 = load i32* %j, align 4
  %idxprom33 = sext i32 %tmp32 to i64
  %tmp34 = load i32* %i, align 4
  %idxprom35 = sext i32 %tmp34 to i64
  %arrayidx36 = getelementptr inbounds [4 x [3 x i32]]* %y1, i32 0, i64 %idxprom35
  %arrayidx37 = getelementptr inbounds [3 x i32]* %arrayidx36, i32 0, i64 %idxprom33
  %tmp38 = load i32* %arrayidx37, align 4
  %tmp39 = load i32* %k, align 4
  %idxprom40 = sext i32 %tmp39 to i64
  %arrayidx41 = getelementptr inbounds [12 x i32]* %y0, i32 0, i64 %idxprom40
  %tmp42 = load i32* %arrayidx41, align 4
  %cmp43 = icmp ne i32 %tmp38, %tmp42
  br i1 %cmp43, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %for.body15
  %tmp44 = load i32* %i, align 4
  %tmp45 = load i32* %j, align 4
  %tmp46 = load i32* %k, align 4
  %tmp47 = load i32* %k, align 4
  %idxprom48 = sext i32 %tmp47 to i64
  %arrayidx49 = getelementptr inbounds [12 x i32]* %y0, i32 0, i64 %idxprom48
  %tmp50 = load i32* %arrayidx49, align 4
  %tmp51 = load i32* %j, align 4
  %idxprom52 = sext i32 %tmp51 to i64
  %tmp53 = load i32* %i, align 4
  %idxprom54 = sext i32 %tmp53 to i64
  %arrayidx55 = getelementptr inbounds [4 x [3 x i32]]* %y1, i32 0, i64 %idxprom54
  %arrayidx56 = getelementptr inbounds [3 x i32]* %arrayidx55, i32 0, i64 %idxprom52
  %tmp57 = load i32* %arrayidx56, align 4
  %tmp58 = load i32* %j, align 4
  %idxprom59 = sext i32 %tmp58 to i64
  %tmp60 = load i32* %i, align 4
  %idxprom61 = sext i32 %tmp60 to i64
  %arrayidx62 = getelementptr inbounds [4 x [3 x i32]]* %y2, i32 0, i64 %idxprom61
  %arrayidx63 = getelementptr inbounds [3 x i32]* %arrayidx62, i32 0, i64 %idxprom59
  %tmp64 = load i32* %arrayidx63, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str, i32 0, i32 0), i32 %tmp44, i32 %tmp45, i32 %tmp46, i32 %tmp50, i32 %tmp57, i32 %tmp64)
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp65 = load i32* %j, align 4
  %inc = add nsw i32 %tmp65, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond12

for.end:                                          ; preds = %for.cond12
  br label %for.inc66

for.inc66:                                        ; preds = %for.end
  %tmp67 = load i32* %i, align 4
  %inc68 = add nsw i32 %tmp67, 1
  store i32 %inc68, i32* %i, align 4
  br label %for.cond

for.end69:                                        ; preds = %for.cond
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare i32 @printf(i8*, ...)
