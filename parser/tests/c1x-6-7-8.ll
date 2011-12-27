; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/c1x-6-7-8.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i32, [4 x i8] }
%1 = type { float, [4 x i8] }
%struct.anon = type { [3 x i32], i32 }
%struct.div_t = type { i32, i32 }
%union.anon = type { [2 x i32] }

@sec26.y1 = internal unnamed_addr constant [4 x [3 x i32]] [[3 x i32] [i32 1, i32 3, i32 5], [3 x i32] [i32 2, i32 4, i32 6], [3 x i32] [i32 3, i32 5, i32 7], [3 x i32] zeroinitializer], align 16
@sec26.y2 = internal unnamed_addr constant [4 x [3 x i32]] [[3 x i32] [i32 1, i32 3, i32 5], [3 x i32] [i32 2, i32 4, i32 6], [3 x i32] [i32 3, i32 5, i32 7], [3 x i32] zeroinitializer], align 16
@.str = private unnamed_addr constant [15 x i8] c"y1[%d][%d]=%d\0A\00", align 1
@.str1 = private unnamed_addr constant [15 x i8] c"z1[%d][%d]=%d\0A\00", align 1
@sec28.w1 = internal unnamed_addr constant [2 x %struct.anon] [%struct.anon { [3 x i32] [i32 1, i32 0, i32 0], i32 0 }, %struct.anon { [3 x i32] [i32 2, i32 0, i32 0], i32 0 }], align 16
@sec28.w2 = internal unnamed_addr constant [2 x %struct.anon] [%struct.anon { [3 x i32] [i32 1, i32 0, i32 0], i32 0 }, %struct.anon { [3 x i32] [i32 2, i32 0, i32 0], i32 0 }], align 16
@.str2 = private unnamed_addr constant [17 x i8] c"w1[%d].a[%d]=%d\0A\00", align 1
@.str3 = private unnamed_addr constant [19 x i8] c"q1[%d][%d][%d]=%d\0A\00", align 1
@sec31.a1 = internal unnamed_addr constant [2 x i32] [i32 1, i32 2], align 4
@sec31.b1 = internal unnamed_addr constant [3 x i32] [i32 3, i32 4, i32 5], align 4
@sec31.a2 = internal unnamed_addr constant [2 x i32] [i32 1, i32 2], align 4
@sec31.b2 = internal unnamed_addr constant [3 x i32] [i32 3, i32 4, i32 5], align 4
@.str4 = private unnamed_addr constant [11 x i8] c"a1[%d]=%d\0A\00", align 1
@.str5 = private unnamed_addr constant [11 x i8] c"b1[%d]=%d\0A\00", align 1
@sec32.s1 = internal unnamed_addr constant [4 x i8] c"abc\00", align 1
@sec32.t1 = internal unnamed_addr constant [3 x i8] c"abc", align 1
@sec32.s2 = internal unnamed_addr constant [4 x i8] c"abc\00", align 1
@sec32.t2 = internal unnamed_addr constant [3 x i8] c"abc", align 1
@.str6 = private unnamed_addr constant [4 x i8] c"abc\00", align 1
@.str7 = private unnamed_addr constant [11 x i8] c"s1[%d]=%d\0A\00", align 1
@.str8 = private unnamed_addr constant [11 x i8] c"t1[%d]=%d\0A\00", align 1
@.str9 = private unnamed_addr constant [11 x i8] c"member one\00", align 1
@.str10 = private unnamed_addr constant [11 x i8] c"member two\00", align 1
@sec33.nm = internal unnamed_addr constant [2 x i8*] [i8* getelementptr inbounds ([11 x i8]* @.str9, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str10, i32 0, i32 0)], align 16
@.str11 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@sec34.x1 = internal unnamed_addr constant %struct.div_t { i32 2, i32 -1 }, align 4
@sec34.x2 = internal unnamed_addr constant %struct.div_t { i32 2, i32 -1 }, align 4
@sec35.w1 = internal unnamed_addr constant [2 x %struct.anon] [%struct.anon { [3 x i32] [i32 1, i32 0, i32 0], i32 0 }, %struct.anon { [3 x i32] [i32 2, i32 0, i32 0], i32 0 }], align 16
@.str12 = private unnamed_addr constant [15 x i8] c"w1[%d][%d]=%d\0A\00", align 1
@sec36.a1 = internal unnamed_addr constant [20 x i32] [i32 1, i32 3, i32 5, i32 7, i32 9, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 8, i32 6, i32 4, i32 2, i32 0], align 16
@sec36.a2 = internal unnamed_addr constant [20 x i32] [i32 1, i32 3, i32 5, i32 7, i32 9, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 8, i32 6, i32 4, i32 2, i32 0], align 16
@sec38.u1 = internal unnamed_addr constant %union.anon { [2 x i32] [i32 1, i32 2] }, align 4
@sec38.u2 = internal unnamed_addr constant %0 { i32 3, [4 x i8] undef }, align 4
@sec38.u3 = internal unnamed_addr constant %1 { float 4.500000e+00, [4 x i8] undef }, align 4

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp, 8
  %and = and i64 %shr, 4095
  %tmp1 = load i64* %__dev.addr, align 8
  %shr2 = lshr i64 %tmp1, 32
  %conv = trunc i64 %shr2 to i32
  %and3 = and i32 %conv, -4096
  %conv4 = zext i32 %and3 to i64
  %or = or i64 %and, %conv4
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %and = and i64 %tmp, 255
  %tmp1 = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp1, 12
  %conv = trunc i64 %shr to i32
  %and2 = and i32 %conv, -256
  %conv3 = zext i32 %and2 to i64
  %or = or i64 %and, %conv3
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable inlinehint {
entry:
  %__major.addr = alloca i32, align 4
  %__minor.addr = alloca i32, align 4
  store i32 %__major, i32* %__major.addr, align 4
  store i32 %__minor, i32* %__minor.addr, align 4
  %tmp = load i32* %__minor.addr, align 4
  %and = and i32 %tmp, 255
  %tmp1 = load i32* %__major.addr, align 4
  %and2 = and i32 %tmp1, 4095
  %shl = shl i32 %and2, 8
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %tmp3 = load i32* %__minor.addr, align 4
  %and4 = and i32 %tmp3, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl i64 %conv5, 12
  %or7 = or i64 %conv, %shl6
  %tmp8 = load i32* %__major.addr, align 4
  %and9 = and i32 %tmp8, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl i64 %conv10, 32
  %or12 = or i64 %or7, %shl11
  ret i64 %or12
}

define i32 @sec26() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %y1 = alloca [4 x [3 x i32]], align 16
  %y2 = alloca [4 x [3 x i32]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %tmp = bitcast [4 x [3 x i32]]* %y1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast ([4 x [3 x i32]]* @sec26.y1 to i8*), i64 48, i32 16, i1 false)
  %tmp2 = bitcast [4 x [3 x i32]]* %y2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp2, i8* bitcast ([4 x [3 x i32]]* @sec26.y2 to i8*), i64 48, i32 16, i1 false)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc33, %entry
  %tmp4 = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp4, 4
  br i1 %cmp, label %for.body, label %for.end36

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc, %for.body
  %tmp7 = load i32* %j, align 4
  %cmp8 = icmp slt i32 %tmp7, 3
  br i1 %cmp8, label %for.body9, label %for.end

for.body9:                                        ; preds = %for.cond6
  %tmp10 = load i32* %i, align 4
  %tmp11 = load i32* %j, align 4
  %tmp12 = load i32* %j, align 4
  %idxprom = sext i32 %tmp12 to i64
  %tmp13 = load i32* %i, align 4
  %idxprom14 = sext i32 %tmp13 to i64
  %arrayidx = getelementptr inbounds [4 x [3 x i32]]* %y1, i32 0, i64 %idxprom14
  %arrayidx15 = getelementptr inbounds [3 x i32]* %arrayidx, i32 0, i64 %idxprom
  %tmp16 = load i32* %arrayidx15, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str, i32 0, i32 0), i32 %tmp10, i32 %tmp11, i32 %tmp16)
  %tmp17 = load i32* %j, align 4
  %idxprom18 = sext i32 %tmp17 to i64
  %tmp19 = load i32* %i, align 4
  %idxprom20 = sext i32 %tmp19 to i64
  %arrayidx21 = getelementptr inbounds [4 x [3 x i32]]* %y1, i32 0, i64 %idxprom20
  %arrayidx22 = getelementptr inbounds [3 x i32]* %arrayidx21, i32 0, i64 %idxprom18
  %tmp23 = load i32* %arrayidx22, align 4
  %tmp24 = load i32* %j, align 4
  %idxprom25 = sext i32 %tmp24 to i64
  %tmp26 = load i32* %i, align 4
  %idxprom27 = sext i32 %tmp26 to i64
  %arrayidx28 = getelementptr inbounds [4 x [3 x i32]]* %y2, i32 0, i64 %idxprom27
  %arrayidx29 = getelementptr inbounds [3 x i32]* %arrayidx28, i32 0, i64 %idxprom25
  %tmp30 = load i32* %arrayidx29, align 4
  %cmp31 = icmp ne i32 %tmp23, %tmp30
  br i1 %cmp31, label %if.then, label %if.end

if.then:                                          ; preds = %for.body9
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %for.body9
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp32 = load i32* %j, align 4
  %add = add nsw i32 %tmp32, 1
  store i32 %add, i32* %j, align 4
  br label %for.cond6

for.end:                                          ; preds = %for.cond6
  br label %for.inc33

for.inc33:                                        ; preds = %for.end
  %tmp34 = load i32* %i, align 4
  %add35 = add nsw i32 %tmp34, 1
  store i32 %add35, i32* %i, align 4
  br label %for.cond

for.end36:                                        ; preds = %for.cond
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %for.end36, %if.then
  %0 = load i32* %retval
  ret i32 %0
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
  %tmp = bitcast [4 x [3 x i32]]* %z1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %tmp, i8 0, i64 48, i32 16, i1 false)
  %0 = bitcast i8* %tmp to [4 x [3 x i32]]*
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
  %tmp2 = bitcast [4 x [3 x i32]]* %z2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %tmp2, i8 0, i64 48, i32 16, i1 false)
  %9 = bitcast i8* %tmp2 to [4 x [3 x i32]]*
  %10 = getelementptr [4 x [3 x i32]]* %9, i32 0, i32 0
  %11 = getelementptr [3 x i32]* %10, i32 0, i32 0
  store i32 1, i32* %11
  %12 = getelementptr [4 x [3 x i32]]* %9, i32 0, i32 1
  %13 = getelementptr [3 x i32]* %12, i32 0, i32 0
  store i32 2, i32* %13
  %14 = getelementptr [4 x [3 x i32]]* %9, i32 0, i32 2
  %15 = getelementptr [3 x i32]* %14, i32 0, i32 0
  store i32 3, i32* %15
  %16 = getelementptr [4 x [3 x i32]]* %9, i32 0, i32 3
  %17 = getelementptr [3 x i32]* %16, i32 0, i32 0
  store i32 4, i32* %17
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc33, %entry
  %tmp4 = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp4, 4
  br i1 %cmp, label %for.body, label %for.end36

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc, %for.body
  %tmp7 = load i32* %j, align 4
  %cmp8 = icmp slt i32 %tmp7, 3
  br i1 %cmp8, label %for.body9, label %for.end

for.body9:                                        ; preds = %for.cond6
  %tmp10 = load i32* %i, align 4
  %tmp11 = load i32* %j, align 4
  %tmp12 = load i32* %j, align 4
  %idxprom = sext i32 %tmp12 to i64
  %tmp13 = load i32* %i, align 4
  %idxprom14 = sext i32 %tmp13 to i64
  %arrayidx = getelementptr inbounds [4 x [3 x i32]]* %z1, i32 0, i64 %idxprom14
  %arrayidx15 = getelementptr inbounds [3 x i32]* %arrayidx, i32 0, i64 %idxprom
  %tmp16 = load i32* %arrayidx15, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str1, i32 0, i32 0), i32 %tmp10, i32 %tmp11, i32 %tmp16)
  %tmp17 = load i32* %j, align 4
  %idxprom18 = sext i32 %tmp17 to i64
  %tmp19 = load i32* %i, align 4
  %idxprom20 = sext i32 %tmp19 to i64
  %arrayidx21 = getelementptr inbounds [4 x [3 x i32]]* %z1, i32 0, i64 %idxprom20
  %arrayidx22 = getelementptr inbounds [3 x i32]* %arrayidx21, i32 0, i64 %idxprom18
  %tmp23 = load i32* %arrayidx22, align 4
  %tmp24 = load i32* %j, align 4
  %idxprom25 = sext i32 %tmp24 to i64
  %tmp26 = load i32* %i, align 4
  %idxprom27 = sext i32 %tmp26 to i64
  %arrayidx28 = getelementptr inbounds [4 x [3 x i32]]* %z2, i32 0, i64 %idxprom27
  %arrayidx29 = getelementptr inbounds [3 x i32]* %arrayidx28, i32 0, i64 %idxprom25
  %tmp30 = load i32* %arrayidx29, align 4
  %cmp31 = icmp ne i32 %tmp23, %tmp30
  br i1 %cmp31, label %if.then, label %if.end

if.then:                                          ; preds = %for.body9
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %for.body9
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp32 = load i32* %j, align 4
  %add = add nsw i32 %tmp32, 1
  store i32 %add, i32* %j, align 4
  br label %for.cond6

for.end:                                          ; preds = %for.cond6
  br label %for.inc33

for.inc33:                                        ; preds = %for.end
  %tmp34 = load i32* %i, align 4
  %add35 = add nsw i32 %tmp34, 1
  store i32 %add35, i32* %i, align 4
  br label %for.cond

for.end36:                                        ; preds = %for.cond
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %for.end36, %if.then
  %18 = load i32* %retval
  ret i32 %18
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define i32 @sec28() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %w1 = alloca [2 x %struct.anon], align 16
  %w2 = alloca [2 x %struct.anon], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %tmp = bitcast [2 x %struct.anon]* %w1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast ([2 x %struct.anon]* @sec28.w1 to i8*), i64 32, i32 16, i1 false)
  %tmp2 = bitcast [2 x %struct.anon]* %w2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp2, i8* bitcast ([2 x %struct.anon]* @sec28.w2 to i8*), i64 32, i32 16, i1 false)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc47, %entry
  %tmp4 = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp4, 2
  br i1 %cmp, label %for.body, label %for.end50

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc, %for.body
  %tmp7 = load i32* %j, align 4
  %cmp8 = icmp slt i32 %tmp7, 3
  br i1 %cmp8, label %for.body9, label %for.end

for.body9:                                        ; preds = %for.cond6
  %tmp10 = load i32* %i, align 4
  %tmp11 = load i32* %j, align 4
  %tmp12 = load i32* %j, align 4
  %idxprom = sext i32 %tmp12 to i64
  %tmp13 = load i32* %i, align 4
  %idxprom14 = sext i32 %tmp13 to i64
  %arrayidx = getelementptr inbounds [2 x %struct.anon]* %w1, i32 0, i64 %idxprom14
  %a = getelementptr inbounds %struct.anon* %arrayidx, i32 0, i32 0
  %arrayidx15 = getelementptr inbounds [3 x i32]* %a, i32 0, i64 %idxprom
  %tmp16 = load i32* %arrayidx15, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0), i32 %tmp10, i32 %tmp11, i32 %tmp16)
  %tmp17 = load i32* %j, align 4
  %idxprom18 = sext i32 %tmp17 to i64
  %tmp19 = load i32* %i, align 4
  %idxprom20 = sext i32 %tmp19 to i64
  %arrayidx21 = getelementptr inbounds [2 x %struct.anon]* %w1, i32 0, i64 %idxprom20
  %a22 = getelementptr inbounds %struct.anon* %arrayidx21, i32 0, i32 0
  %arrayidx23 = getelementptr inbounds [3 x i32]* %a22, i32 0, i64 %idxprom18
  %tmp24 = load i32* %arrayidx23, align 4
  %tmp25 = load i32* %j, align 4
  %idxprom26 = sext i32 %tmp25 to i64
  %tmp27 = load i32* %i, align 4
  %idxprom28 = sext i32 %tmp27 to i64
  %arrayidx29 = getelementptr inbounds [2 x %struct.anon]* %w2, i32 0, i64 %idxprom28
  %a30 = getelementptr inbounds %struct.anon* %arrayidx29, i32 0, i32 0
  %arrayidx31 = getelementptr inbounds [3 x i32]* %a30, i32 0, i64 %idxprom26
  %tmp32 = load i32* %arrayidx31, align 4
  %cmp33 = icmp ne i32 %tmp24, %tmp32
  br i1 %cmp33, label %if.then, label %if.end

if.then:                                          ; preds = %for.body9
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %for.body9
  %tmp34 = load i32* %i, align 4
  %idxprom35 = sext i32 %tmp34 to i64
  %arrayidx36 = getelementptr inbounds [2 x %struct.anon]* %w1, i32 0, i64 %idxprom35
  %b = getelementptr inbounds %struct.anon* %arrayidx36, i32 0, i32 1
  %tmp37 = load i32* %b, align 4
  %tmp38 = load i32* %i, align 4
  %idxprom39 = sext i32 %tmp38 to i64
  %arrayidx40 = getelementptr inbounds [2 x %struct.anon]* %w2, i32 0, i64 %idxprom39
  %b41 = getelementptr inbounds %struct.anon* %arrayidx40, i32 0, i32 1
  %tmp42 = load i32* %b41, align 4
  %cmp43 = icmp ne i32 %tmp37, %tmp42
  br i1 %cmp43, label %if.then44, label %if.end45

if.then44:                                        ; preds = %if.end
  store i32 1, i32* %retval
  br label %return

if.end45:                                         ; preds = %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end45
  %tmp46 = load i32* %j, align 4
  %add = add nsw i32 %tmp46, 1
  store i32 %add, i32* %j, align 4
  br label %for.cond6

for.end:                                          ; preds = %for.cond6
  br label %for.inc47

for.inc47:                                        ; preds = %for.end
  %tmp48 = load i32* %i, align 4
  %add49 = add nsw i32 %tmp48, 1
  store i32 %add49, i32* %i, align 4
  br label %for.cond

for.end50:                                        ; preds = %for.cond
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %for.end50, %if.then44, %if.then
  %0 = load i32* %retval
  ret i32 %0
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
  %tmp = bitcast [4 x [3 x [2 x i16]]]* %q1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %tmp, i8 0, i64 48, i32 16, i1 false)
  %0 = bitcast i8* %tmp to [4 x [3 x [2 x i16]]]*
  %1 = getelementptr [4 x [3 x [2 x i16]]]* %0, i32 0, i32 0
  %2 = getelementptr [3 x [2 x i16]]* %1, i32 0, i32 0
  %3 = getelementptr [2 x i16]* %2, i32 0, i32 0
  store i16 1, i16* %3
  %4 = getelementptr [4 x [3 x [2 x i16]]]* %0, i32 0, i32 1
  %5 = getelementptr [3 x [2 x i16]]* %4, i32 0, i32 0
  %6 = getelementptr [2 x i16]* %5, i32 0, i32 0
  store i16 2, i16* %6
  %7 = getelementptr [2 x i16]* %5, i32 0, i32 1
  store i16 3, i16* %7
  %8 = getelementptr [4 x [3 x [2 x i16]]]* %0, i32 0, i32 2
  %9 = getelementptr [3 x [2 x i16]]* %8, i32 0, i32 0
  %10 = getelementptr [2 x i16]* %9, i32 0, i32 0
  store i16 4, i16* %10
  %11 = getelementptr [2 x i16]* %9, i32 0, i32 1
  store i16 5, i16* %11
  %12 = getelementptr [3 x [2 x i16]]* %8, i32 0, i32 1
  %13 = getelementptr [2 x i16]* %12, i32 0, i32 0
  store i16 6, i16* %13
  %tmp2 = bitcast [4 x [3 x [2 x i16]]]* %q2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %tmp2, i8 0, i64 48, i32 16, i1 false)
  %14 = bitcast i8* %tmp2 to [4 x [3 x [2 x i16]]]*
  %15 = getelementptr [4 x [3 x [2 x i16]]]* %14, i32 0, i32 0
  %16 = getelementptr [3 x [2 x i16]]* %15, i32 0, i32 0
  %17 = getelementptr [2 x i16]* %16, i32 0, i32 0
  store i16 1, i16* %17
  %18 = getelementptr [4 x [3 x [2 x i16]]]* %14, i32 0, i32 1
  %19 = getelementptr [3 x [2 x i16]]* %18, i32 0, i32 0
  %20 = getelementptr [2 x i16]* %19, i32 0, i32 0
  store i16 2, i16* %20
  %21 = getelementptr [2 x i16]* %19, i32 0, i32 1
  store i16 3, i16* %21
  %22 = getelementptr [4 x [3 x [2 x i16]]]* %14, i32 0, i32 2
  %23 = getelementptr [3 x [2 x i16]]* %22, i32 0, i32 0
  %24 = getelementptr [2 x i16]* %23, i32 0, i32 0
  store i16 4, i16* %24
  %25 = getelementptr [2 x i16]* %23, i32 0, i32 1
  store i16 5, i16* %25
  %26 = getelementptr [3 x [2 x i16]]* %22, i32 0, i32 1
  %27 = getelementptr [2 x i16]* %26, i32 0, i32 0
  store i16 6, i16* %27
  %tmp4 = bitcast [4 x [3 x [2 x i16]]]* %q3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %tmp4, i8 0, i64 48, i32 16, i1 false)
  %28 = bitcast i8* %tmp4 to [4 x [3 x [2 x i16]]]*
  %29 = getelementptr [4 x [3 x [2 x i16]]]* %28, i32 0, i32 0
  %30 = getelementptr [3 x [2 x i16]]* %29, i32 0, i32 0
  %31 = getelementptr [2 x i16]* %30, i32 0, i32 0
  store i16 1, i16* %31
  %32 = getelementptr [4 x [3 x [2 x i16]]]* %28, i32 0, i32 1
  %33 = getelementptr [3 x [2 x i16]]* %32, i32 0, i32 0
  %34 = getelementptr [2 x i16]* %33, i32 0, i32 0
  store i16 2, i16* %34
  %35 = getelementptr [2 x i16]* %33, i32 0, i32 1
  store i16 3, i16* %35
  %36 = getelementptr [4 x [3 x [2 x i16]]]* %28, i32 0, i32 2
  %37 = getelementptr [3 x [2 x i16]]* %36, i32 0, i32 0
  %38 = getelementptr [2 x i16]* %37, i32 0, i32 0
  store i16 4, i16* %38
  %39 = getelementptr [2 x i16]* %37, i32 0, i32 1
  store i16 5, i16* %39
  %40 = getelementptr [3 x [2 x i16]]* %36, i32 0, i32 1
  %41 = getelementptr [2 x i16]* %40, i32 0, i32 0
  store i16 6, i16* %41
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc83, %entry
  %tmp6 = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp6, 4
  br i1 %cmp, label %for.body, label %for.end86

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc79, %for.body
  %tmp9 = load i32* %j, align 4
  %cmp10 = icmp slt i32 %tmp9, 3
  br i1 %cmp10, label %for.body11, label %for.end82

for.body11:                                       ; preds = %for.cond8
  store i32 0, i32* %k, align 4
  br label %for.cond13

for.cond13:                                       ; preds = %for.inc, %for.body11
  %tmp14 = load i32* %k, align 4
  %cmp15 = icmp slt i32 %tmp14, 2
  br i1 %cmp15, label %for.body16, label %for.end

for.body16:                                       ; preds = %for.cond13
  %tmp17 = load i32* %i, align 4
  %tmp18 = load i32* %j, align 4
  %tmp19 = load i32* %k, align 4
  %tmp20 = load i32* %k, align 4
  %idxprom = sext i32 %tmp20 to i64
  %tmp21 = load i32* %j, align 4
  %idxprom22 = sext i32 %tmp21 to i64
  %tmp23 = load i32* %i, align 4
  %idxprom24 = sext i32 %tmp23 to i64
  %arrayidx = getelementptr inbounds [4 x [3 x [2 x i16]]]* %q1, i32 0, i64 %idxprom24
  %arrayidx25 = getelementptr inbounds [3 x [2 x i16]]* %arrayidx, i32 0, i64 %idxprom22
  %arrayidx26 = getelementptr inbounds [2 x i16]* %arrayidx25, i32 0, i64 %idxprom
  %tmp27 = load i16* %arrayidx26, align 2
  %conv = sext i16 %tmp27 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str3, i32 0, i32 0), i32 %tmp17, i32 %tmp18, i32 %tmp19, i32 %conv)
  %tmp28 = load i32* %k, align 4
  %idxprom29 = sext i32 %tmp28 to i64
  %tmp30 = load i32* %j, align 4
  %idxprom31 = sext i32 %tmp30 to i64
  %tmp32 = load i32* %i, align 4
  %idxprom33 = sext i32 %tmp32 to i64
  %arrayidx34 = getelementptr inbounds [4 x [3 x [2 x i16]]]* %q1, i32 0, i64 %idxprom33
  %arrayidx35 = getelementptr inbounds [3 x [2 x i16]]* %arrayidx34, i32 0, i64 %idxprom31
  %arrayidx36 = getelementptr inbounds [2 x i16]* %arrayidx35, i32 0, i64 %idxprom29
  %tmp37 = load i16* %arrayidx36, align 2
  %conv38 = sext i16 %tmp37 to i32
  %tmp39 = load i32* %k, align 4
  %idxprom40 = sext i32 %tmp39 to i64
  %tmp41 = load i32* %j, align 4
  %idxprom42 = sext i32 %tmp41 to i64
  %tmp43 = load i32* %i, align 4
  %idxprom44 = sext i32 %tmp43 to i64
  %arrayidx45 = getelementptr inbounds [4 x [3 x [2 x i16]]]* %q2, i32 0, i64 %idxprom44
  %arrayidx46 = getelementptr inbounds [3 x [2 x i16]]* %arrayidx45, i32 0, i64 %idxprom42
  %arrayidx47 = getelementptr inbounds [2 x i16]* %arrayidx46, i32 0, i64 %idxprom40
  %tmp48 = load i16* %arrayidx47, align 2
  %conv49 = sext i16 %tmp48 to i32
  %cmp50 = icmp ne i32 %conv38, %conv49
  br i1 %cmp50, label %if.then, label %if.end

if.then:                                          ; preds = %for.body16
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %for.body16
  %tmp52 = load i32* %k, align 4
  %idxprom53 = sext i32 %tmp52 to i64
  %tmp54 = load i32* %j, align 4
  %idxprom55 = sext i32 %tmp54 to i64
  %tmp56 = load i32* %i, align 4
  %idxprom57 = sext i32 %tmp56 to i64
  %arrayidx58 = getelementptr inbounds [4 x [3 x [2 x i16]]]* %q2, i32 0, i64 %idxprom57
  %arrayidx59 = getelementptr inbounds [3 x [2 x i16]]* %arrayidx58, i32 0, i64 %idxprom55
  %arrayidx60 = getelementptr inbounds [2 x i16]* %arrayidx59, i32 0, i64 %idxprom53
  %tmp61 = load i16* %arrayidx60, align 2
  %conv62 = sext i16 %tmp61 to i32
  %tmp63 = load i32* %k, align 4
  %idxprom64 = sext i32 %tmp63 to i64
  %tmp65 = load i32* %j, align 4
  %idxprom66 = sext i32 %tmp65 to i64
  %tmp67 = load i32* %i, align 4
  %idxprom68 = sext i32 %tmp67 to i64
  %arrayidx69 = getelementptr inbounds [4 x [3 x [2 x i16]]]* %q3, i32 0, i64 %idxprom68
  %arrayidx70 = getelementptr inbounds [3 x [2 x i16]]* %arrayidx69, i32 0, i64 %idxprom66
  %arrayidx71 = getelementptr inbounds [2 x i16]* %arrayidx70, i32 0, i64 %idxprom64
  %tmp72 = load i16* %arrayidx71, align 2
  %conv73 = sext i16 %tmp72 to i32
  %cmp74 = icmp ne i32 %conv62, %conv73
  br i1 %cmp74, label %if.then76, label %if.end77

if.then76:                                        ; preds = %if.end
  store i32 1, i32* %retval
  br label %return

if.end77:                                         ; preds = %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end77
  %tmp78 = load i32* %k, align 4
  %add = add nsw i32 %tmp78, 1
  store i32 %add, i32* %k, align 4
  br label %for.cond13

for.end:                                          ; preds = %for.cond13
  br label %for.inc79

for.inc79:                                        ; preds = %for.end
  %tmp80 = load i32* %j, align 4
  %add81 = add nsw i32 %tmp80, 1
  store i32 %add81, i32* %j, align 4
  br label %for.cond8

for.end82:                                        ; preds = %for.cond8
  br label %for.inc83

for.inc83:                                        ; preds = %for.end82
  %tmp84 = load i32* %i, align 4
  %add85 = add nsw i32 %tmp84, 1
  store i32 %add85, i32* %i, align 4
  br label %for.cond

for.end86:                                        ; preds = %for.cond
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %for.end86, %if.then76, %if.then
  %42 = load i32* %retval
  ret i32 %42
}

define i32 @sec31() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a1 = alloca [2 x i32], align 4
  %b1 = alloca [3 x i32], align 4
  %a2 = alloca [2 x i32], align 4
  %b2 = alloca [3 x i32], align 4
  %i = alloca i32, align 4
  %i23 = alloca i32, align 4
  %tmp = bitcast [2 x i32]* %a1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast ([2 x i32]* @sec31.a1 to i8*), i64 8, i32 4, i1 false)
  %tmp2 = bitcast [3 x i32]* %b1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp2, i8* bitcast ([3 x i32]* @sec31.b1 to i8*), i64 12, i32 4, i1 false)
  %tmp4 = bitcast [2 x i32]* %a2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp4, i8* bitcast ([2 x i32]* @sec31.a2 to i8*), i64 8, i32 4, i1 false)
  %tmp6 = bitcast [3 x i32]* %b2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp6, i8* bitcast ([3 x i32]* @sec31.b2 to i8*), i64 12, i32 4, i1 false)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp8 = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp8, 2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp9 = load i32* %i, align 4
  %tmp10 = load i32* %i, align 4
  %idxprom = sext i32 %tmp10 to i64
  %arrayidx = getelementptr inbounds [2 x i32]* %a1, i32 0, i64 %idxprom
  %tmp11 = load i32* %arrayidx, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str4, i32 0, i32 0), i32 %tmp9, i32 %tmp11)
  %tmp12 = load i32* %i, align 4
  %idxprom13 = sext i32 %tmp12 to i64
  %arrayidx14 = getelementptr inbounds [2 x i32]* %a1, i32 0, i64 %idxprom13
  %tmp15 = load i32* %arrayidx14, align 4
  %tmp16 = load i32* %i, align 4
  %idxprom17 = sext i32 %tmp16 to i64
  %arrayidx18 = getelementptr inbounds [2 x i32]* %a2, i32 0, i64 %idxprom17
  %tmp19 = load i32* %arrayidx18, align 4
  %cmp20 = icmp ne i32 %tmp15, %tmp19
  br i1 %cmp20, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp21 = load i32* %i, align 4
  %add = add nsw i32 %tmp21, 1
  store i32 %add, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i23, align 4
  br label %for.cond24

for.cond24:                                       ; preds = %for.inc45, %for.end
  %tmp25 = load i32* %i23, align 4
  %cmp26 = icmp slt i32 %tmp25, 3
  br i1 %cmp26, label %for.body27, label %for.end48

for.body27:                                       ; preds = %for.cond24
  %tmp28 = load i32* %i23, align 4
  %tmp29 = load i32* %i23, align 4
  %idxprom30 = sext i32 %tmp29 to i64
  %arrayidx31 = getelementptr inbounds [3 x i32]* %b1, i32 0, i64 %idxprom30
  %tmp32 = load i32* %arrayidx31, align 4
  %call33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str5, i32 0, i32 0), i32 %tmp28, i32 %tmp32)
  %tmp34 = load i32* %i23, align 4
  %idxprom35 = sext i32 %tmp34 to i64
  %arrayidx36 = getelementptr inbounds [3 x i32]* %b1, i32 0, i64 %idxprom35
  %tmp37 = load i32* %arrayidx36, align 4
  %tmp38 = load i32* %i23, align 4
  %idxprom39 = sext i32 %tmp38 to i64
  %arrayidx40 = getelementptr inbounds [3 x i32]* %b2, i32 0, i64 %idxprom39
  %tmp41 = load i32* %arrayidx40, align 4
  %cmp42 = icmp ne i32 %tmp37, %tmp41
  br i1 %cmp42, label %if.then43, label %if.end44

if.then43:                                        ; preds = %for.body27
  store i32 1, i32* %retval
  br label %return

if.end44:                                         ; preds = %for.body27
  br label %for.inc45

for.inc45:                                        ; preds = %if.end44
  %tmp46 = load i32* %i23, align 4
  %add47 = add nsw i32 %tmp46, 1
  store i32 %add47, i32* %i23, align 4
  br label %for.cond24

for.end48:                                        ; preds = %for.cond24
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %for.end48, %if.then43, %if.then
  %0 = load i32* %retval
  ret i32 %0
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
  %i42 = alloca i32, align 4
  %tmp = bitcast [4 x i8]* %s1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* getelementptr inbounds ([4 x i8]* @sec32.s1, i32 0, i32 0), i64 4, i32 1, i1 false)
  %tmp2 = bitcast [3 x i8]* %t1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp2, i8* getelementptr inbounds ([3 x i8]* @sec32.t1, i32 0, i32 0), i64 3, i32 1, i1 false)
  %tmp4 = bitcast [4 x i8]* %s2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp4, i8* getelementptr inbounds ([4 x i8]* @sec32.s2, i32 0, i32 0), i64 4, i32 1, i1 false)
  %tmp6 = bitcast [3 x i8]* %t2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp6, i8* getelementptr inbounds ([3 x i8]* @sec32.t2, i32 0, i32 0), i64 3, i32 1, i1 false)
  store i8* getelementptr inbounds ([4 x i8]* @.str6, i32 0, i32 0), i8** %s3, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp9 = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp9, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp10 = load i32* %i, align 4
  %tmp11 = load i32* %i, align 4
  %idxprom = sext i32 %tmp11 to i64
  %arrayidx = getelementptr inbounds [4 x i8]* %s1, i32 0, i64 %idxprom
  %tmp12 = load i8* %arrayidx, align 1
  %conv = sext i8 %tmp12 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str7, i32 0, i32 0), i32 %tmp10, i32 %conv)
  %tmp13 = load i32* %i, align 4
  %idxprom14 = sext i32 %tmp13 to i64
  %arrayidx15 = getelementptr inbounds [4 x i8]* %s1, i32 0, i64 %idxprom14
  %tmp16 = load i8* %arrayidx15, align 1
  %conv17 = sext i8 %tmp16 to i32
  %tmp18 = load i32* %i, align 4
  %idxprom19 = sext i32 %tmp18 to i64
  %arrayidx20 = getelementptr inbounds [4 x i8]* %s2, i32 0, i64 %idxprom19
  %tmp21 = load i8* %arrayidx20, align 1
  %conv22 = sext i8 %tmp21 to i32
  %cmp23 = icmp ne i32 %conv17, %conv22
  br i1 %cmp23, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %for.body
  %tmp25 = load i32* %i, align 4
  %idxprom26 = sext i32 %tmp25 to i64
  %arrayidx27 = getelementptr inbounds [4 x i8]* %s2, i32 0, i64 %idxprom26
  %tmp28 = load i8* %arrayidx27, align 1
  %conv29 = sext i8 %tmp28 to i32
  %tmp30 = load i32* %i, align 4
  %idxprom31 = sext i32 %tmp30 to i64
  %tmp32 = load i8** %s3, align 8
  %arrayidx33 = getelementptr inbounds i8* %tmp32, i64 %idxprom31
  %tmp34 = load i8* %arrayidx33
  %conv35 = sext i8 %tmp34 to i32
  %cmp36 = icmp ne i32 %conv29, %conv35
  br i1 %cmp36, label %if.then38, label %if.end39

if.then38:                                        ; preds = %if.end
  store i32 1, i32* %retval
  br label %return

if.end39:                                         ; preds = %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end39
  %tmp40 = load i32* %i, align 4
  %add = add nsw i32 %tmp40, 1
  store i32 %add, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i42, align 4
  br label %for.cond43

for.cond43:                                       ; preds = %for.inc69, %for.end
  %tmp44 = load i32* %i42, align 4
  %cmp45 = icmp slt i32 %tmp44, 3
  br i1 %cmp45, label %for.body47, label %for.end72

for.body47:                                       ; preds = %for.cond43
  %tmp48 = load i32* %i42, align 4
  %tmp49 = load i32* %i42, align 4
  %idxprom50 = sext i32 %tmp49 to i64
  %arrayidx51 = getelementptr inbounds [3 x i8]* %t1, i32 0, i64 %idxprom50
  %tmp52 = load i8* %arrayidx51, align 1
  %conv53 = sext i8 %tmp52 to i32
  %call54 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str8, i32 0, i32 0), i32 %tmp48, i32 %conv53)
  %tmp55 = load i32* %i42, align 4
  %idxprom56 = sext i32 %tmp55 to i64
  %arrayidx57 = getelementptr inbounds [3 x i8]* %t1, i32 0, i64 %idxprom56
  %tmp58 = load i8* %arrayidx57, align 1
  %conv59 = sext i8 %tmp58 to i32
  %tmp60 = load i32* %i42, align 4
  %idxprom61 = sext i32 %tmp60 to i64
  %arrayidx62 = getelementptr inbounds [3 x i8]* %t2, i32 0, i64 %idxprom61
  %tmp63 = load i8* %arrayidx62, align 1
  %conv64 = sext i8 %tmp63 to i32
  %cmp65 = icmp ne i32 %conv59, %conv64
  br i1 %cmp65, label %if.then67, label %if.end68

if.then67:                                        ; preds = %for.body47
  store i32 1, i32* %retval
  br label %return

if.end68:                                         ; preds = %for.body47
  br label %for.inc69

for.inc69:                                        ; preds = %if.end68
  %tmp70 = load i32* %i42, align 4
  %add71 = add nsw i32 %tmp70, 1
  store i32 %add71, i32* %i42, align 4
  br label %for.cond43

for.end72:                                        ; preds = %for.cond43
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %for.end72, %if.then67, %if.then38, %if.then
  %0 = load i32* %retval
  ret i32 %0
}

define i32 @sec33() nounwind uwtable {
entry:
  %nm = alloca [2 x i8*], align 16
  %tmp = bitcast [2 x i8*]* %nm to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast ([2 x i8*]* @sec33.nm to i8*), i64 16, i32 16, i1 false)
  %arrayidx = getelementptr inbounds [2 x i8*]* %nm, i32 0, i64 0
  %tmp1 = load i8** %arrayidx, align 8
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str11, i32 0, i32 0), i8* %tmp1)
  %arrayidx2 = getelementptr inbounds [2 x i8*]* %nm, i32 0, i64 1
  %tmp3 = load i8** %arrayidx2, align 8
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str11, i32 0, i32 0), i8* %tmp3)
  ret i32 0
}

define i32 @sec34() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x1 = alloca %struct.div_t, align 4
  %x2 = alloca %struct.div_t, align 4
  %tmp = bitcast %struct.div_t* %x1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast (%struct.div_t* @sec34.x1 to i8*), i64 8, i32 4, i1 false)
  %tmp2 = bitcast %struct.div_t* %x2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp2, i8* bitcast (%struct.div_t* @sec34.x2 to i8*), i64 8, i32 4, i1 false)
  %quot = getelementptr inbounds %struct.div_t* %x1, i32 0, i32 0
  %tmp3 = load i32* %quot, align 4
  %quot4 = getelementptr inbounds %struct.div_t* %x2, i32 0, i32 0
  %tmp5 = load i32* %quot4, align 4
  %cmp = icmp ne i32 %tmp3, %tmp5
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %rem = getelementptr inbounds %struct.div_t* %x1, i32 0, i32 1
  %tmp6 = load i32* %rem, align 4
  %rem7 = getelementptr inbounds %struct.div_t* %x2, i32 0, i32 1
  %tmp8 = load i32* %rem7, align 4
  %cmp9 = icmp ne i32 %tmp6, %tmp8
  br i1 %cmp9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.end
  store i32 1, i32* %retval
  br label %return

if.end11:                                         ; preds = %if.end
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end11, %if.then10, %if.then
  %0 = load i32* %retval
  ret i32 %0
}

define i32 @sec35() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %w1 = alloca [2 x %struct.anon], align 16
  %w2 = alloca [2 x %struct.anon], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %tmp = bitcast [2 x %struct.anon]* %w1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast ([2 x %struct.anon]* @sec35.w1 to i8*), i64 32, i32 16, i1 false)
  %tmp2 = bitcast [2 x %struct.anon]* %w2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %tmp2, i8 0, i64 32, i32 16, i1 false)
  %arrayidx = getelementptr inbounds [2 x %struct.anon]* %w2, i32 0, i64 0
  %a = getelementptr inbounds %struct.anon* %arrayidx, i32 0, i32 0
  %arrayidx3 = getelementptr inbounds [3 x i32]* %a, i32 0, i64 0
  store i32 1, i32* %arrayidx3, align 4
  %arrayidx4 = getelementptr inbounds [2 x %struct.anon]* %w2, i32 0, i64 1
  %a5 = getelementptr inbounds %struct.anon* %arrayidx4, i32 0, i32 0
  %arrayidx6 = getelementptr inbounds [3 x i32]* %a5, i32 0, i64 0
  store i32 2, i32* %arrayidx6, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc41, %entry
  %tmp8 = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp8, 2
  br i1 %cmp, label %for.body, label %for.end44

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond10

for.cond10:                                       ; preds = %for.inc, %for.body
  %tmp11 = load i32* %j, align 4
  %cmp12 = icmp slt i32 %tmp11, 3
  br i1 %cmp12, label %for.body13, label %for.end

for.body13:                                       ; preds = %for.cond10
  %tmp14 = load i32* %i, align 4
  %tmp15 = load i32* %j, align 4
  %tmp16 = load i32* %j, align 4
  %idxprom = sext i32 %tmp16 to i64
  %tmp17 = load i32* %i, align 4
  %idxprom18 = sext i32 %tmp17 to i64
  %arrayidx19 = getelementptr inbounds [2 x %struct.anon]* %w1, i32 0, i64 %idxprom18
  %a20 = getelementptr inbounds %struct.anon* %arrayidx19, i32 0, i32 0
  %arrayidx21 = getelementptr inbounds [3 x i32]* %a20, i32 0, i64 %idxprom
  %tmp22 = load i32* %arrayidx21, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str12, i32 0, i32 0), i32 %tmp14, i32 %tmp15, i32 %tmp22)
  %tmp23 = load i32* %j, align 4
  %idxprom24 = sext i32 %tmp23 to i64
  %tmp25 = load i32* %i, align 4
  %idxprom26 = sext i32 %tmp25 to i64
  %arrayidx27 = getelementptr inbounds [2 x %struct.anon]* %w1, i32 0, i64 %idxprom26
  %a28 = getelementptr inbounds %struct.anon* %arrayidx27, i32 0, i32 0
  %arrayidx29 = getelementptr inbounds [3 x i32]* %a28, i32 0, i64 %idxprom24
  %tmp30 = load i32* %arrayidx29, align 4
  %tmp31 = load i32* %j, align 4
  %idxprom32 = sext i32 %tmp31 to i64
  %tmp33 = load i32* %i, align 4
  %idxprom34 = sext i32 %tmp33 to i64
  %arrayidx35 = getelementptr inbounds [2 x %struct.anon]* %w2, i32 0, i64 %idxprom34
  %a36 = getelementptr inbounds %struct.anon* %arrayidx35, i32 0, i32 0
  %arrayidx37 = getelementptr inbounds [3 x i32]* %a36, i32 0, i64 %idxprom32
  %tmp38 = load i32* %arrayidx37, align 4
  %cmp39 = icmp ne i32 %tmp30, %tmp38
  br i1 %cmp39, label %if.then, label %if.end

if.then:                                          ; preds = %for.body13
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %for.body13
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp40 = load i32* %j, align 4
  %add = add nsw i32 %tmp40, 1
  store i32 %add, i32* %j, align 4
  br label %for.cond10

for.end:                                          ; preds = %for.cond10
  br label %for.inc41

for.inc41:                                        ; preds = %for.end
  %tmp42 = load i32* %i, align 4
  %add43 = add nsw i32 %tmp42, 1
  store i32 %add43, i32* %i, align 4
  br label %for.cond

for.end44:                                        ; preds = %for.cond
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %for.end44, %if.then
  %0 = load i32* %retval
  ret i32 %0
}

define i32 @sec36() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a1 = alloca [20 x i32], align 16
  %a2 = alloca [20 x i32], align 16
  %i = alloca i32, align 4
  %tmp = bitcast [20 x i32]* %a1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast ([20 x i32]* @sec36.a1 to i8*), i64 80, i32 16, i1 false)
  %tmp2 = bitcast [20 x i32]* %a2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp2, i8* bitcast ([20 x i32]* @sec36.a2 to i8*), i64 80, i32 16, i1 false)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp4 = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp4, 20
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp5 = load i32* %i, align 4
  %tmp6 = load i32* %i, align 4
  %idxprom = sext i32 %tmp6 to i64
  %arrayidx = getelementptr inbounds [20 x i32]* %a1, i32 0, i64 %idxprom
  %tmp7 = load i32* %arrayidx, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str4, i32 0, i32 0), i32 %tmp5, i32 %tmp7)
  %tmp8 = load i32* %i, align 4
  %idxprom9 = sext i32 %tmp8 to i64
  %arrayidx10 = getelementptr inbounds [20 x i32]* %a1, i32 0, i64 %idxprom9
  %tmp11 = load i32* %arrayidx10, align 4
  %tmp12 = load i32* %i, align 4
  %idxprom13 = sext i32 %tmp12 to i64
  %arrayidx14 = getelementptr inbounds [20 x i32]* %a2, i32 0, i64 %idxprom13
  %tmp15 = load i32* %arrayidx14, align 4
  %cmp16 = icmp ne i32 %tmp11, %tmp15
  br i1 %cmp16, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp17 = load i32* %i, align 4
  %add = add nsw i32 %tmp17, 1
  store i32 %add, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %for.end, %if.then
  %0 = load i32* %retval
  ret i32 %0
}

define i32 @sec38() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %u1 = alloca %union.anon, align 4
  %u2 = alloca %union.anon, align 4
  %u3 = alloca %union.anon, align 4
  %tmp = bitcast %union.anon* %u1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast (%union.anon* @sec38.u1 to i8*), i64 8, i32 4, i1 false)
  %tmp2 = bitcast %union.anon* %u2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp2, i8* bitcast (%0* @sec38.u2 to i8*), i64 8, i32 4, i1 false)
  %tmp4 = bitcast %union.anon* %u3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp4, i8* bitcast (%1* @sec38.u3 to i8*), i64 8, i32 4, i1 false)
  %c = bitcast %union.anon* %u1 to [2 x i32]*
  %arrayidx = getelementptr inbounds [2 x i32]* %c, i32 0, i64 0
  %tmp5 = load i32* %arrayidx, align 4
  %cmp = icmp ne i32 %tmp5, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %c6 = bitcast %union.anon* %u1 to [2 x i32]*
  %arrayidx7 = getelementptr inbounds [2 x i32]* %c6, i32 0, i64 1
  %tmp8 = load i32* %arrayidx7, align 4
  %cmp9 = icmp ne i32 %tmp8, 2
  br i1 %cmp9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.end
  store i32 1, i32* %retval
  br label %return

if.end11:                                         ; preds = %if.end
  %a = bitcast %union.anon* %u2 to i32*
  %tmp12 = load i32* %a, align 4
  %cmp13 = icmp ne i32 %tmp12, 3
  br i1 %cmp13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.end11
  store i32 1, i32* %retval
  br label %return

if.end15:                                         ; preds = %if.end11
  %b = bitcast %union.anon* %u3 to float*
  %tmp16 = load float* %b, align 4
  %conv = fpext float %tmp16 to double
  %cmp17 = fcmp une double %conv, 4.500000e+00
  br i1 %cmp17, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.end15
  store i32 1, i32* %retval
  br label %return

if.end20:                                         ; preds = %if.end15
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end20, %if.then19, %if.then14, %if.then10, %if.then
  %0 = load i32* %retval
  ret i32 %0
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
