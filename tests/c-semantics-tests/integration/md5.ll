; ModuleID = '/home/david/src/c-semantics/tests/integration/md5.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.MD5_CTX = type { [2 x i32], [4 x i32], [64 x i8], [16 x i8] }

@PADDING = internal global [64 x i8] c"\80\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 16
@.str = private unnamed_addr constant [26 x i8] c"MD5 test suite results:\0A\0A\00", align 1
@.str1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str2 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str3 = private unnamed_addr constant [4 x i8] c"abc\00", align 1
@.str4 = private unnamed_addr constant [15 x i8] c"message digest\00", align 1
@.str5 = private unnamed_addr constant [27 x i8] c"abcdefghijklmnopqrstuvwxyz\00", align 1
@.str6 = private unnamed_addr constant [63 x i8] c"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789\00", align 1
@.str7 = private unnamed_addr constant [81 x i8] c"12345678901234567890123456789012345678901234567890123456789012345678901234567890\00", align 1
@.str8 = private unnamed_addr constant [8 x i8] c" \22%s\22\0A\0A\00", align 1
@.str9 = private unnamed_addr constant [3 x i8] c"%x\00", align 1

define void @MD5Init(%struct.MD5_CTX* %mdContext) nounwind uwtable {
entry:
  %mdContext.addr = alloca %struct.MD5_CTX*, align 8
  store %struct.MD5_CTX* %mdContext, %struct.MD5_CTX** %mdContext.addr, align 8
  %0 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %i = getelementptr inbounds %struct.MD5_CTX* %0, i32 0, i32 0
  %arrayidx = getelementptr inbounds [2 x i32]* %i, i32 0, i64 1
  store i32 0, i32* %arrayidx, align 4
  %1 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %i1 = getelementptr inbounds %struct.MD5_CTX* %1, i32 0, i32 0
  %arrayidx2 = getelementptr inbounds [2 x i32]* %i1, i32 0, i64 0
  store i32 0, i32* %arrayidx2, align 4
  %2 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %buf = getelementptr inbounds %struct.MD5_CTX* %2, i32 0, i32 1
  %arrayidx3 = getelementptr inbounds [4 x i32]* %buf, i32 0, i64 0
  store i32 1732584193, i32* %arrayidx3, align 4
  %3 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %buf4 = getelementptr inbounds %struct.MD5_CTX* %3, i32 0, i32 1
  %arrayidx5 = getelementptr inbounds [4 x i32]* %buf4, i32 0, i64 1
  store i32 -271733879, i32* %arrayidx5, align 4
  %4 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %buf6 = getelementptr inbounds %struct.MD5_CTX* %4, i32 0, i32 1
  %arrayidx7 = getelementptr inbounds [4 x i32]* %buf6, i32 0, i64 2
  store i32 -1732584194, i32* %arrayidx7, align 4
  %5 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %buf8 = getelementptr inbounds %struct.MD5_CTX* %5, i32 0, i32 1
  %arrayidx9 = getelementptr inbounds [4 x i32]* %buf8, i32 0, i64 3
  store i32 271733878, i32* %arrayidx9, align 4
  ret void
}

define void @MD5Update(%struct.MD5_CTX* %mdContext, i8* %inBuf, i32 %inLen) nounwind uwtable {
entry:
  %mdContext.addr = alloca %struct.MD5_CTX*, align 8
  %inBuf.addr = alloca i8*, align 8
  %inLen.addr = alloca i32, align 4
  %in = alloca [16 x i32], align 16
  %mdi = alloca i32, align 4
  %i = alloca i32, align 4
  %ii = alloca i32, align 4
  store %struct.MD5_CTX* %mdContext, %struct.MD5_CTX** %mdContext.addr, align 8
  store i8* %inBuf, i8** %inBuf.addr, align 8
  store i32 %inLen, i32* %inLen.addr, align 4
  %0 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %i1 = getelementptr inbounds %struct.MD5_CTX* %0, i32 0, i32 0
  %arrayidx = getelementptr inbounds [2 x i32]* %i1, i32 0, i64 0
  %1 = load i32* %arrayidx, align 4
  %shr = lshr i32 %1, 3
  %and = and i32 %shr, 63
  store i32 %and, i32* %mdi, align 4
  %2 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %i2 = getelementptr inbounds %struct.MD5_CTX* %2, i32 0, i32 0
  %arrayidx3 = getelementptr inbounds [2 x i32]* %i2, i32 0, i64 0
  %3 = load i32* %arrayidx3, align 4
  %4 = load i32* %inLen.addr, align 4
  %shl = shl i32 %4, 3
  %add = add i32 %3, %shl
  %5 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %i4 = getelementptr inbounds %struct.MD5_CTX* %5, i32 0, i32 0
  %arrayidx5 = getelementptr inbounds [2 x i32]* %i4, i32 0, i64 0
  %6 = load i32* %arrayidx5, align 4
  %cmp = icmp ult i32 %add, %6
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %7 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %i6 = getelementptr inbounds %struct.MD5_CTX* %7, i32 0, i32 0
  %arrayidx7 = getelementptr inbounds [2 x i32]* %i6, i32 0, i64 1
  %8 = load i32* %arrayidx7, align 4
  %inc = add i32 %8, 1
  store i32 %inc, i32* %arrayidx7, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %9 = load i32* %inLen.addr, align 4
  %shl8 = shl i32 %9, 3
  %10 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %i9 = getelementptr inbounds %struct.MD5_CTX* %10, i32 0, i32 0
  %arrayidx10 = getelementptr inbounds [2 x i32]* %i9, i32 0, i64 0
  %11 = load i32* %arrayidx10, align 4
  %add11 = add i32 %11, %shl8
  store i32 %add11, i32* %arrayidx10, align 4
  %12 = load i32* %inLen.addr, align 4
  %shr12 = lshr i32 %12, 29
  %13 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %i13 = getelementptr inbounds %struct.MD5_CTX* %13, i32 0, i32 0
  %arrayidx14 = getelementptr inbounds [2 x i32]* %i13, i32 0, i64 1
  %14 = load i32* %arrayidx14, align 4
  %add15 = add i32 %14, %shr12
  store i32 %add15, i32* %arrayidx14, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end50, %if.end
  %15 = load i32* %inLen.addr, align 4
  %dec = add i32 %15, -1
  store i32 %dec, i32* %inLen.addr, align 4
  %tobool = icmp ne i32 %15, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %16 = load i8** %inBuf.addr, align 8
  %incdec.ptr = getelementptr inbounds i8* %16, i32 1
  store i8* %incdec.ptr, i8** %inBuf.addr, align 8
  %17 = load i8* %16, align 1
  %18 = load i32* %mdi, align 4
  %inc16 = add nsw i32 %18, 1
  store i32 %inc16, i32* %mdi, align 4
  %idxprom = sext i32 %18 to i64
  %19 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %in17 = getelementptr inbounds %struct.MD5_CTX* %19, i32 0, i32 2
  %arrayidx18 = getelementptr inbounds [64 x i8]* %in17, i32 0, i64 %idxprom
  store i8 %17, i8* %arrayidx18, align 1
  %20 = load i32* %mdi, align 4
  %cmp19 = icmp eq i32 %20, 64
  br i1 %cmp19, label %if.then20, label %if.end50

if.then20:                                        ; preds = %while.body
  store i32 0, i32* %i, align 4
  store i32 0, i32* %ii, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then20
  %21 = load i32* %i, align 4
  %cmp21 = icmp ult i32 %21, 16
  br i1 %cmp21, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %22 = load i32* %ii, align 4
  %add22 = add i32 %22, 3
  %idxprom23 = zext i32 %add22 to i64
  %23 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %in24 = getelementptr inbounds %struct.MD5_CTX* %23, i32 0, i32 2
  %arrayidx25 = getelementptr inbounds [64 x i8]* %in24, i32 0, i64 %idxprom23
  %24 = load i8* %arrayidx25, align 1
  %conv = zext i8 %24 to i32
  %shl26 = shl i32 %conv, 24
  %25 = load i32* %ii, align 4
  %add27 = add i32 %25, 2
  %idxprom28 = zext i32 %add27 to i64
  %26 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %in29 = getelementptr inbounds %struct.MD5_CTX* %26, i32 0, i32 2
  %arrayidx30 = getelementptr inbounds [64 x i8]* %in29, i32 0, i64 %idxprom28
  %27 = load i8* %arrayidx30, align 1
  %conv31 = zext i8 %27 to i32
  %shl32 = shl i32 %conv31, 16
  %or = or i32 %shl26, %shl32
  %28 = load i32* %ii, align 4
  %add33 = add i32 %28, 1
  %idxprom34 = zext i32 %add33 to i64
  %29 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %in35 = getelementptr inbounds %struct.MD5_CTX* %29, i32 0, i32 2
  %arrayidx36 = getelementptr inbounds [64 x i8]* %in35, i32 0, i64 %idxprom34
  %30 = load i8* %arrayidx36, align 1
  %conv37 = zext i8 %30 to i32
  %shl38 = shl i32 %conv37, 8
  %or39 = or i32 %or, %shl38
  %31 = load i32* %ii, align 4
  %idxprom40 = zext i32 %31 to i64
  %32 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %in41 = getelementptr inbounds %struct.MD5_CTX* %32, i32 0, i32 2
  %arrayidx42 = getelementptr inbounds [64 x i8]* %in41, i32 0, i64 %idxprom40
  %33 = load i8* %arrayidx42, align 1
  %conv43 = zext i8 %33 to i32
  %or44 = or i32 %or39, %conv43
  %34 = load i32* %i, align 4
  %idxprom45 = zext i32 %34 to i64
  %arrayidx46 = getelementptr inbounds [16 x i32]* %in, i32 0, i64 %idxprom45
  store i32 %or44, i32* %arrayidx46, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %35 = load i32* %i, align 4
  %inc47 = add i32 %35, 1
  store i32 %inc47, i32* %i, align 4
  %36 = load i32* %ii, align 4
  %add48 = add i32 %36, 4
  store i32 %add48, i32* %ii, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %37 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %buf = getelementptr inbounds %struct.MD5_CTX* %37, i32 0, i32 1
  %arraydecay = getelementptr inbounds [4 x i32]* %buf, i32 0, i32 0
  %arraydecay49 = getelementptr inbounds [16 x i32]* %in, i32 0, i32 0
  call void (...)* bitcast (void (i32*, i32*)* @Transform to void (...)*)(i32* %arraydecay, i32* %arraydecay49)
  store i32 0, i32* %mdi, align 4
  br label %if.end50

if.end50:                                         ; preds = %for.end, %while.body
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret void
}

define void @MD5Final(%struct.MD5_CTX* %mdContext) nounwind uwtable {
entry:
  %mdContext.addr = alloca %struct.MD5_CTX*, align 8
  %in = alloca [16 x i32], align 16
  %mdi = alloca i32, align 4
  %i = alloca i32, align 4
  %ii = alloca i32, align 4
  %padLen = alloca i32, align 4
  store %struct.MD5_CTX* %mdContext, %struct.MD5_CTX** %mdContext.addr, align 8
  %0 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %i1 = getelementptr inbounds %struct.MD5_CTX* %0, i32 0, i32 0
  %arrayidx = getelementptr inbounds [2 x i32]* %i1, i32 0, i64 0
  %1 = load i32* %arrayidx, align 4
  %arrayidx2 = getelementptr inbounds [16 x i32]* %in, i32 0, i64 14
  store i32 %1, i32* %arrayidx2, align 4
  %2 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %i3 = getelementptr inbounds %struct.MD5_CTX* %2, i32 0, i32 0
  %arrayidx4 = getelementptr inbounds [2 x i32]* %i3, i32 0, i64 1
  %3 = load i32* %arrayidx4, align 4
  %arrayidx5 = getelementptr inbounds [16 x i32]* %in, i32 0, i64 15
  store i32 %3, i32* %arrayidx5, align 4
  %4 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %i6 = getelementptr inbounds %struct.MD5_CTX* %4, i32 0, i32 0
  %arrayidx7 = getelementptr inbounds [2 x i32]* %i6, i32 0, i64 0
  %5 = load i32* %arrayidx7, align 4
  %shr = lshr i32 %5, 3
  %and = and i32 %shr, 63
  store i32 %and, i32* %mdi, align 4
  %6 = load i32* %mdi, align 4
  %cmp = icmp slt i32 %6, 56
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %7 = load i32* %mdi, align 4
  %sub = sub nsw i32 56, %7
  br label %cond.end

cond.false:                                       ; preds = %entry
  %8 = load i32* %mdi, align 4
  %sub8 = sub nsw i32 120, %8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub, %cond.true ], [ %sub8, %cond.false ]
  store i32 %cond, i32* %padLen, align 4
  %9 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %10 = load i32* %padLen, align 4
  call void (...)* bitcast (void (%struct.MD5_CTX*, i8*, i32)* @MD5Update to void (...)*)(%struct.MD5_CTX* %9, i8* getelementptr inbounds ([64 x i8]* @PADDING, i32 0, i32 0), i32 %10)
  store i32 0, i32* %i, align 4
  store i32 0, i32* %ii, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %cond.end
  %11 = load i32* %i, align 4
  %cmp9 = icmp ult i32 %11, 14
  br i1 %cmp9, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %12 = load i32* %ii, align 4
  %add = add i32 %12, 3
  %idxprom = zext i32 %add to i64
  %13 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %in10 = getelementptr inbounds %struct.MD5_CTX* %13, i32 0, i32 2
  %arrayidx11 = getelementptr inbounds [64 x i8]* %in10, i32 0, i64 %idxprom
  %14 = load i8* %arrayidx11, align 1
  %conv = zext i8 %14 to i32
  %shl = shl i32 %conv, 24
  %15 = load i32* %ii, align 4
  %add12 = add i32 %15, 2
  %idxprom13 = zext i32 %add12 to i64
  %16 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %in14 = getelementptr inbounds %struct.MD5_CTX* %16, i32 0, i32 2
  %arrayidx15 = getelementptr inbounds [64 x i8]* %in14, i32 0, i64 %idxprom13
  %17 = load i8* %arrayidx15, align 1
  %conv16 = zext i8 %17 to i32
  %shl17 = shl i32 %conv16, 16
  %or = or i32 %shl, %shl17
  %18 = load i32* %ii, align 4
  %add18 = add i32 %18, 1
  %idxprom19 = zext i32 %add18 to i64
  %19 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %in20 = getelementptr inbounds %struct.MD5_CTX* %19, i32 0, i32 2
  %arrayidx21 = getelementptr inbounds [64 x i8]* %in20, i32 0, i64 %idxprom19
  %20 = load i8* %arrayidx21, align 1
  %conv22 = zext i8 %20 to i32
  %shl23 = shl i32 %conv22, 8
  %or24 = or i32 %or, %shl23
  %21 = load i32* %ii, align 4
  %idxprom25 = zext i32 %21 to i64
  %22 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %in26 = getelementptr inbounds %struct.MD5_CTX* %22, i32 0, i32 2
  %arrayidx27 = getelementptr inbounds [64 x i8]* %in26, i32 0, i64 %idxprom25
  %23 = load i8* %arrayidx27, align 1
  %conv28 = zext i8 %23 to i32
  %or29 = or i32 %or24, %conv28
  %24 = load i32* %i, align 4
  %idxprom30 = zext i32 %24 to i64
  %arrayidx31 = getelementptr inbounds [16 x i32]* %in, i32 0, i64 %idxprom30
  store i32 %or29, i32* %arrayidx31, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %25 = load i32* %i, align 4
  %inc = add i32 %25, 1
  store i32 %inc, i32* %i, align 4
  %26 = load i32* %ii, align 4
  %add32 = add i32 %26, 4
  store i32 %add32, i32* %ii, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %27 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %buf = getelementptr inbounds %struct.MD5_CTX* %27, i32 0, i32 1
  %arraydecay = getelementptr inbounds [4 x i32]* %buf, i32 0, i32 0
  %arraydecay33 = getelementptr inbounds [16 x i32]* %in, i32 0, i32 0
  call void (...)* bitcast (void (i32*, i32*)* @Transform to void (...)*)(i32* %arraydecay, i32* %arraydecay33)
  store i32 0, i32* %i, align 4
  store i32 0, i32* %ii, align 4
  br label %for.cond34

for.cond34:                                       ; preds = %for.inc75, %for.end
  %28 = load i32* %i, align 4
  %cmp35 = icmp ult i32 %28, 4
  br i1 %cmp35, label %for.body37, label %for.end78

for.body37:                                       ; preds = %for.cond34
  %29 = load i32* %i, align 4
  %idxprom38 = zext i32 %29 to i64
  %30 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %buf39 = getelementptr inbounds %struct.MD5_CTX* %30, i32 0, i32 1
  %arrayidx40 = getelementptr inbounds [4 x i32]* %buf39, i32 0, i64 %idxprom38
  %31 = load i32* %arrayidx40, align 4
  %and41 = and i32 %31, 255
  %conv42 = trunc i32 %and41 to i8
  %32 = load i32* %ii, align 4
  %idxprom43 = zext i32 %32 to i64
  %33 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %digest = getelementptr inbounds %struct.MD5_CTX* %33, i32 0, i32 3
  %arrayidx44 = getelementptr inbounds [16 x i8]* %digest, i32 0, i64 %idxprom43
  store i8 %conv42, i8* %arrayidx44, align 1
  %34 = load i32* %i, align 4
  %idxprom45 = zext i32 %34 to i64
  %35 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %buf46 = getelementptr inbounds %struct.MD5_CTX* %35, i32 0, i32 1
  %arrayidx47 = getelementptr inbounds [4 x i32]* %buf46, i32 0, i64 %idxprom45
  %36 = load i32* %arrayidx47, align 4
  %shr48 = lshr i32 %36, 8
  %and49 = and i32 %shr48, 255
  %conv50 = trunc i32 %and49 to i8
  %37 = load i32* %ii, align 4
  %add51 = add i32 %37, 1
  %idxprom52 = zext i32 %add51 to i64
  %38 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %digest53 = getelementptr inbounds %struct.MD5_CTX* %38, i32 0, i32 3
  %arrayidx54 = getelementptr inbounds [16 x i8]* %digest53, i32 0, i64 %idxprom52
  store i8 %conv50, i8* %arrayidx54, align 1
  %39 = load i32* %i, align 4
  %idxprom55 = zext i32 %39 to i64
  %40 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %buf56 = getelementptr inbounds %struct.MD5_CTX* %40, i32 0, i32 1
  %arrayidx57 = getelementptr inbounds [4 x i32]* %buf56, i32 0, i64 %idxprom55
  %41 = load i32* %arrayidx57, align 4
  %shr58 = lshr i32 %41, 16
  %and59 = and i32 %shr58, 255
  %conv60 = trunc i32 %and59 to i8
  %42 = load i32* %ii, align 4
  %add61 = add i32 %42, 2
  %idxprom62 = zext i32 %add61 to i64
  %43 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %digest63 = getelementptr inbounds %struct.MD5_CTX* %43, i32 0, i32 3
  %arrayidx64 = getelementptr inbounds [16 x i8]* %digest63, i32 0, i64 %idxprom62
  store i8 %conv60, i8* %arrayidx64, align 1
  %44 = load i32* %i, align 4
  %idxprom65 = zext i32 %44 to i64
  %45 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %buf66 = getelementptr inbounds %struct.MD5_CTX* %45, i32 0, i32 1
  %arrayidx67 = getelementptr inbounds [4 x i32]* %buf66, i32 0, i64 %idxprom65
  %46 = load i32* %arrayidx67, align 4
  %shr68 = lshr i32 %46, 24
  %and69 = and i32 %shr68, 255
  %conv70 = trunc i32 %and69 to i8
  %47 = load i32* %ii, align 4
  %add71 = add i32 %47, 3
  %idxprom72 = zext i32 %add71 to i64
  %48 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %digest73 = getelementptr inbounds %struct.MD5_CTX* %48, i32 0, i32 3
  %arrayidx74 = getelementptr inbounds [16 x i8]* %digest73, i32 0, i64 %idxprom72
  store i8 %conv70, i8* %arrayidx74, align 1
  br label %for.inc75

for.inc75:                                        ; preds = %for.body37
  %49 = load i32* %i, align 4
  %inc76 = add i32 %49, 1
  store i32 %inc76, i32* %i, align 4
  %50 = load i32* %ii, align 4
  %add77 = add i32 %50, 4
  store i32 %add77, i32* %ii, align 4
  br label %for.cond34

for.end78:                                        ; preds = %for.cond34
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  call void @MDTestSuite()
  ret i32 0
}

define internal void @MDTestSuite() nounwind uwtable {
entry:
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str, i32 0, i32 0))
  call void (...)* bitcast (void (i8*)* @MDString to void (...)*)(i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0))
  call void (...)* bitcast (void (i8*)* @MDString to void (...)*)(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0))
  call void (...)* bitcast (void (i8*)* @MDString to void (...)*)(i8* getelementptr inbounds ([4 x i8]* @.str3, i32 0, i32 0))
  call void (...)* bitcast (void (i8*)* @MDString to void (...)*)(i8* getelementptr inbounds ([15 x i8]* @.str4, i32 0, i32 0))
  call void (...)* bitcast (void (i8*)* @MDString to void (...)*)(i8* getelementptr inbounds ([27 x i8]* @.str5, i32 0, i32 0))
  call void (...)* bitcast (void (i8*)* @MDString to void (...)*)(i8* getelementptr inbounds ([63 x i8]* @.str6, i32 0, i32 0))
  call void (...)* bitcast (void (i8*)* @MDString to void (...)*)(i8* getelementptr inbounds ([81 x i8]* @.str7, i32 0, i32 0))
  ret void
}

declare i32 @printf(i8*, ...)

define internal void @MDString(i8* %inString) nounwind uwtable {
entry:
  %inString.addr = alloca i8*, align 8
  %mdContext = alloca %struct.MD5_CTX, align 4
  %len = alloca i32, align 4
  store i8* %inString, i8** %inString.addr, align 8
  %0 = load i8** %inString.addr, align 8
  %call = call i64 @strlen(i8* %0) nounwind readonly
  %conv = trunc i64 %call to i32
  store i32 %conv, i32* %len, align 4
  call void (...)* bitcast (void (%struct.MD5_CTX*)* @MD5Init to void (...)*)(%struct.MD5_CTX* %mdContext)
  %1 = load i8** %inString.addr, align 8
  %2 = load i32* %len, align 4
  call void (...)* bitcast (void (%struct.MD5_CTX*, i8*, i32)* @MD5Update to void (...)*)(%struct.MD5_CTX* %mdContext, i8* %1, i32 %2)
  call void (...)* bitcast (void (%struct.MD5_CTX*)* @MD5Final to void (...)*)(%struct.MD5_CTX* %mdContext)
  call void (...)* bitcast (void (%struct.MD5_CTX*)* @MDPrint to void (...)*)(%struct.MD5_CTX* %mdContext)
  %3 = load i8** %inString.addr, align 8
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str8, i32 0, i32 0), i8* %3)
  ret void
}

declare i64 @strlen(i8*) nounwind readonly

define internal void @MDPrint(%struct.MD5_CTX* %mdContext) nounwind uwtable {
entry:
  %mdContext.addr = alloca %struct.MD5_CTX*, align 8
  %i = alloca i32, align 4
  store %struct.MD5_CTX* %mdContext, %struct.MD5_CTX** %mdContext.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 16
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %idxprom = sext i32 %1 to i64
  %2 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %digest = getelementptr inbounds %struct.MD5_CTX* %2, i32 0, i32 3
  %arrayidx = getelementptr inbounds [16 x i8]* %digest, i32 0, i64 %idxprom
  %3 = load i8* %arrayidx, align 1
  %conv = zext i8 %3 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str9, i32 0, i32 0), i32 %conv)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %4 = load i32* %i, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

define internal void @Transform(i32* %buf, i32* %in) nounwind uwtable {
entry:
  %buf.addr = alloca i32*, align 8
  %in.addr = alloca i32*, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  store i32* %buf, i32** %buf.addr, align 8
  store i32* %in, i32** %in.addr, align 8
  %0 = load i32** %buf.addr, align 8
  %arrayidx = getelementptr inbounds i32* %0, i64 0
  %1 = load i32* %arrayidx, align 4
  store i32 %1, i32* %a, align 4
  %2 = load i32** %buf.addr, align 8
  %arrayidx1 = getelementptr inbounds i32* %2, i64 1
  %3 = load i32* %arrayidx1, align 4
  store i32 %3, i32* %b, align 4
  %4 = load i32** %buf.addr, align 8
  %arrayidx2 = getelementptr inbounds i32* %4, i64 2
  %5 = load i32* %arrayidx2, align 4
  store i32 %5, i32* %c, align 4
  %6 = load i32** %buf.addr, align 8
  %arrayidx3 = getelementptr inbounds i32* %6, i64 3
  %7 = load i32* %arrayidx3, align 4
  store i32 %7, i32* %d, align 4
  %8 = load i32* %b, align 4
  %9 = load i32* %c, align 4
  %and = and i32 %8, %9
  %10 = load i32* %b, align 4
  %neg = xor i32 %10, -1
  %11 = load i32* %d, align 4
  %and4 = and i32 %neg, %11
  %or = or i32 %and, %and4
  %12 = load i32** %in.addr, align 8
  %arrayidx5 = getelementptr inbounds i32* %12, i64 0
  %13 = load i32* %arrayidx5, align 4
  %add = add i32 %or, %13
  %add6 = add i32 %add, -680876936
  %14 = load i32* %a, align 4
  %add7 = add i32 %14, %add6
  store i32 %add7, i32* %a, align 4
  %15 = load i32* %a, align 4
  %shl = shl i32 %15, 7
  %16 = load i32* %a, align 4
  %shr = lshr i32 %16, 25
  %or8 = or i32 %shl, %shr
  store i32 %or8, i32* %a, align 4
  %17 = load i32* %b, align 4
  %18 = load i32* %a, align 4
  %add9 = add i32 %18, %17
  store i32 %add9, i32* %a, align 4
  %19 = load i32* %a, align 4
  %20 = load i32* %b, align 4
  %and10 = and i32 %19, %20
  %21 = load i32* %a, align 4
  %neg11 = xor i32 %21, -1
  %22 = load i32* %c, align 4
  %and12 = and i32 %neg11, %22
  %or13 = or i32 %and10, %and12
  %23 = load i32** %in.addr, align 8
  %arrayidx14 = getelementptr inbounds i32* %23, i64 1
  %24 = load i32* %arrayidx14, align 4
  %add15 = add i32 %or13, %24
  %add16 = add i32 %add15, -389564586
  %25 = load i32* %d, align 4
  %add17 = add i32 %25, %add16
  store i32 %add17, i32* %d, align 4
  %26 = load i32* %d, align 4
  %shl18 = shl i32 %26, 12
  %27 = load i32* %d, align 4
  %shr19 = lshr i32 %27, 20
  %or20 = or i32 %shl18, %shr19
  store i32 %or20, i32* %d, align 4
  %28 = load i32* %a, align 4
  %29 = load i32* %d, align 4
  %add21 = add i32 %29, %28
  store i32 %add21, i32* %d, align 4
  %30 = load i32* %d, align 4
  %31 = load i32* %a, align 4
  %and22 = and i32 %30, %31
  %32 = load i32* %d, align 4
  %neg23 = xor i32 %32, -1
  %33 = load i32* %b, align 4
  %and24 = and i32 %neg23, %33
  %or25 = or i32 %and22, %and24
  %34 = load i32** %in.addr, align 8
  %arrayidx26 = getelementptr inbounds i32* %34, i64 2
  %35 = load i32* %arrayidx26, align 4
  %add27 = add i32 %or25, %35
  %add28 = add i32 %add27, 606105819
  %36 = load i32* %c, align 4
  %add29 = add i32 %36, %add28
  store i32 %add29, i32* %c, align 4
  %37 = load i32* %c, align 4
  %shl30 = shl i32 %37, 17
  %38 = load i32* %c, align 4
  %shr31 = lshr i32 %38, 15
  %or32 = or i32 %shl30, %shr31
  store i32 %or32, i32* %c, align 4
  %39 = load i32* %d, align 4
  %40 = load i32* %c, align 4
  %add33 = add i32 %40, %39
  store i32 %add33, i32* %c, align 4
  %41 = load i32* %c, align 4
  %42 = load i32* %d, align 4
  %and34 = and i32 %41, %42
  %43 = load i32* %c, align 4
  %neg35 = xor i32 %43, -1
  %44 = load i32* %a, align 4
  %and36 = and i32 %neg35, %44
  %or37 = or i32 %and34, %and36
  %45 = load i32** %in.addr, align 8
  %arrayidx38 = getelementptr inbounds i32* %45, i64 3
  %46 = load i32* %arrayidx38, align 4
  %add39 = add i32 %or37, %46
  %add40 = add i32 %add39, -1044525330
  %47 = load i32* %b, align 4
  %add41 = add i32 %47, %add40
  store i32 %add41, i32* %b, align 4
  %48 = load i32* %b, align 4
  %shl42 = shl i32 %48, 22
  %49 = load i32* %b, align 4
  %shr43 = lshr i32 %49, 10
  %or44 = or i32 %shl42, %shr43
  store i32 %or44, i32* %b, align 4
  %50 = load i32* %c, align 4
  %51 = load i32* %b, align 4
  %add45 = add i32 %51, %50
  store i32 %add45, i32* %b, align 4
  %52 = load i32* %b, align 4
  %53 = load i32* %c, align 4
  %and46 = and i32 %52, %53
  %54 = load i32* %b, align 4
  %neg47 = xor i32 %54, -1
  %55 = load i32* %d, align 4
  %and48 = and i32 %neg47, %55
  %or49 = or i32 %and46, %and48
  %56 = load i32** %in.addr, align 8
  %arrayidx50 = getelementptr inbounds i32* %56, i64 4
  %57 = load i32* %arrayidx50, align 4
  %add51 = add i32 %or49, %57
  %add52 = add i32 %add51, -176418897
  %58 = load i32* %a, align 4
  %add53 = add i32 %58, %add52
  store i32 %add53, i32* %a, align 4
  %59 = load i32* %a, align 4
  %shl54 = shl i32 %59, 7
  %60 = load i32* %a, align 4
  %shr55 = lshr i32 %60, 25
  %or56 = or i32 %shl54, %shr55
  store i32 %or56, i32* %a, align 4
  %61 = load i32* %b, align 4
  %62 = load i32* %a, align 4
  %add57 = add i32 %62, %61
  store i32 %add57, i32* %a, align 4
  %63 = load i32* %a, align 4
  %64 = load i32* %b, align 4
  %and58 = and i32 %63, %64
  %65 = load i32* %a, align 4
  %neg59 = xor i32 %65, -1
  %66 = load i32* %c, align 4
  %and60 = and i32 %neg59, %66
  %or61 = or i32 %and58, %and60
  %67 = load i32** %in.addr, align 8
  %arrayidx62 = getelementptr inbounds i32* %67, i64 5
  %68 = load i32* %arrayidx62, align 4
  %add63 = add i32 %or61, %68
  %add64 = add i32 %add63, 1200080426
  %69 = load i32* %d, align 4
  %add65 = add i32 %69, %add64
  store i32 %add65, i32* %d, align 4
  %70 = load i32* %d, align 4
  %shl66 = shl i32 %70, 12
  %71 = load i32* %d, align 4
  %shr67 = lshr i32 %71, 20
  %or68 = or i32 %shl66, %shr67
  store i32 %or68, i32* %d, align 4
  %72 = load i32* %a, align 4
  %73 = load i32* %d, align 4
  %add69 = add i32 %73, %72
  store i32 %add69, i32* %d, align 4
  %74 = load i32* %d, align 4
  %75 = load i32* %a, align 4
  %and70 = and i32 %74, %75
  %76 = load i32* %d, align 4
  %neg71 = xor i32 %76, -1
  %77 = load i32* %b, align 4
  %and72 = and i32 %neg71, %77
  %or73 = or i32 %and70, %and72
  %78 = load i32** %in.addr, align 8
  %arrayidx74 = getelementptr inbounds i32* %78, i64 6
  %79 = load i32* %arrayidx74, align 4
  %add75 = add i32 %or73, %79
  %add76 = add i32 %add75, -1473231341
  %80 = load i32* %c, align 4
  %add77 = add i32 %80, %add76
  store i32 %add77, i32* %c, align 4
  %81 = load i32* %c, align 4
  %shl78 = shl i32 %81, 17
  %82 = load i32* %c, align 4
  %shr79 = lshr i32 %82, 15
  %or80 = or i32 %shl78, %shr79
  store i32 %or80, i32* %c, align 4
  %83 = load i32* %d, align 4
  %84 = load i32* %c, align 4
  %add81 = add i32 %84, %83
  store i32 %add81, i32* %c, align 4
  %85 = load i32* %c, align 4
  %86 = load i32* %d, align 4
  %and82 = and i32 %85, %86
  %87 = load i32* %c, align 4
  %neg83 = xor i32 %87, -1
  %88 = load i32* %a, align 4
  %and84 = and i32 %neg83, %88
  %or85 = or i32 %and82, %and84
  %89 = load i32** %in.addr, align 8
  %arrayidx86 = getelementptr inbounds i32* %89, i64 7
  %90 = load i32* %arrayidx86, align 4
  %add87 = add i32 %or85, %90
  %add88 = add i32 %add87, -45705983
  %91 = load i32* %b, align 4
  %add89 = add i32 %91, %add88
  store i32 %add89, i32* %b, align 4
  %92 = load i32* %b, align 4
  %shl90 = shl i32 %92, 22
  %93 = load i32* %b, align 4
  %shr91 = lshr i32 %93, 10
  %or92 = or i32 %shl90, %shr91
  store i32 %or92, i32* %b, align 4
  %94 = load i32* %c, align 4
  %95 = load i32* %b, align 4
  %add93 = add i32 %95, %94
  store i32 %add93, i32* %b, align 4
  %96 = load i32* %b, align 4
  %97 = load i32* %c, align 4
  %and94 = and i32 %96, %97
  %98 = load i32* %b, align 4
  %neg95 = xor i32 %98, -1
  %99 = load i32* %d, align 4
  %and96 = and i32 %neg95, %99
  %or97 = or i32 %and94, %and96
  %100 = load i32** %in.addr, align 8
  %arrayidx98 = getelementptr inbounds i32* %100, i64 8
  %101 = load i32* %arrayidx98, align 4
  %add99 = add i32 %or97, %101
  %add100 = add i32 %add99, 1770035416
  %102 = load i32* %a, align 4
  %add101 = add i32 %102, %add100
  store i32 %add101, i32* %a, align 4
  %103 = load i32* %a, align 4
  %shl102 = shl i32 %103, 7
  %104 = load i32* %a, align 4
  %shr103 = lshr i32 %104, 25
  %or104 = or i32 %shl102, %shr103
  store i32 %or104, i32* %a, align 4
  %105 = load i32* %b, align 4
  %106 = load i32* %a, align 4
  %add105 = add i32 %106, %105
  store i32 %add105, i32* %a, align 4
  %107 = load i32* %a, align 4
  %108 = load i32* %b, align 4
  %and106 = and i32 %107, %108
  %109 = load i32* %a, align 4
  %neg107 = xor i32 %109, -1
  %110 = load i32* %c, align 4
  %and108 = and i32 %neg107, %110
  %or109 = or i32 %and106, %and108
  %111 = load i32** %in.addr, align 8
  %arrayidx110 = getelementptr inbounds i32* %111, i64 9
  %112 = load i32* %arrayidx110, align 4
  %add111 = add i32 %or109, %112
  %add112 = add i32 %add111, -1958414417
  %113 = load i32* %d, align 4
  %add113 = add i32 %113, %add112
  store i32 %add113, i32* %d, align 4
  %114 = load i32* %d, align 4
  %shl114 = shl i32 %114, 12
  %115 = load i32* %d, align 4
  %shr115 = lshr i32 %115, 20
  %or116 = or i32 %shl114, %shr115
  store i32 %or116, i32* %d, align 4
  %116 = load i32* %a, align 4
  %117 = load i32* %d, align 4
  %add117 = add i32 %117, %116
  store i32 %add117, i32* %d, align 4
  %118 = load i32* %d, align 4
  %119 = load i32* %a, align 4
  %and118 = and i32 %118, %119
  %120 = load i32* %d, align 4
  %neg119 = xor i32 %120, -1
  %121 = load i32* %b, align 4
  %and120 = and i32 %neg119, %121
  %or121 = or i32 %and118, %and120
  %122 = load i32** %in.addr, align 8
  %arrayidx122 = getelementptr inbounds i32* %122, i64 10
  %123 = load i32* %arrayidx122, align 4
  %add123 = add i32 %or121, %123
  %add124 = add i32 %add123, -42063
  %124 = load i32* %c, align 4
  %add125 = add i32 %124, %add124
  store i32 %add125, i32* %c, align 4
  %125 = load i32* %c, align 4
  %shl126 = shl i32 %125, 17
  %126 = load i32* %c, align 4
  %shr127 = lshr i32 %126, 15
  %or128 = or i32 %shl126, %shr127
  store i32 %or128, i32* %c, align 4
  %127 = load i32* %d, align 4
  %128 = load i32* %c, align 4
  %add129 = add i32 %128, %127
  store i32 %add129, i32* %c, align 4
  %129 = load i32* %c, align 4
  %130 = load i32* %d, align 4
  %and130 = and i32 %129, %130
  %131 = load i32* %c, align 4
  %neg131 = xor i32 %131, -1
  %132 = load i32* %a, align 4
  %and132 = and i32 %neg131, %132
  %or133 = or i32 %and130, %and132
  %133 = load i32** %in.addr, align 8
  %arrayidx134 = getelementptr inbounds i32* %133, i64 11
  %134 = load i32* %arrayidx134, align 4
  %add135 = add i32 %or133, %134
  %add136 = add i32 %add135, -1990404162
  %135 = load i32* %b, align 4
  %add137 = add i32 %135, %add136
  store i32 %add137, i32* %b, align 4
  %136 = load i32* %b, align 4
  %shl138 = shl i32 %136, 22
  %137 = load i32* %b, align 4
  %shr139 = lshr i32 %137, 10
  %or140 = or i32 %shl138, %shr139
  store i32 %or140, i32* %b, align 4
  %138 = load i32* %c, align 4
  %139 = load i32* %b, align 4
  %add141 = add i32 %139, %138
  store i32 %add141, i32* %b, align 4
  %140 = load i32* %b, align 4
  %141 = load i32* %c, align 4
  %and142 = and i32 %140, %141
  %142 = load i32* %b, align 4
  %neg143 = xor i32 %142, -1
  %143 = load i32* %d, align 4
  %and144 = and i32 %neg143, %143
  %or145 = or i32 %and142, %and144
  %144 = load i32** %in.addr, align 8
  %arrayidx146 = getelementptr inbounds i32* %144, i64 12
  %145 = load i32* %arrayidx146, align 4
  %add147 = add i32 %or145, %145
  %add148 = add i32 %add147, 1804603682
  %146 = load i32* %a, align 4
  %add149 = add i32 %146, %add148
  store i32 %add149, i32* %a, align 4
  %147 = load i32* %a, align 4
  %shl150 = shl i32 %147, 7
  %148 = load i32* %a, align 4
  %shr151 = lshr i32 %148, 25
  %or152 = or i32 %shl150, %shr151
  store i32 %or152, i32* %a, align 4
  %149 = load i32* %b, align 4
  %150 = load i32* %a, align 4
  %add153 = add i32 %150, %149
  store i32 %add153, i32* %a, align 4
  %151 = load i32* %a, align 4
  %152 = load i32* %b, align 4
  %and154 = and i32 %151, %152
  %153 = load i32* %a, align 4
  %neg155 = xor i32 %153, -1
  %154 = load i32* %c, align 4
  %and156 = and i32 %neg155, %154
  %or157 = or i32 %and154, %and156
  %155 = load i32** %in.addr, align 8
  %arrayidx158 = getelementptr inbounds i32* %155, i64 13
  %156 = load i32* %arrayidx158, align 4
  %add159 = add i32 %or157, %156
  %add160 = add i32 %add159, -40341101
  %157 = load i32* %d, align 4
  %add161 = add i32 %157, %add160
  store i32 %add161, i32* %d, align 4
  %158 = load i32* %d, align 4
  %shl162 = shl i32 %158, 12
  %159 = load i32* %d, align 4
  %shr163 = lshr i32 %159, 20
  %or164 = or i32 %shl162, %shr163
  store i32 %or164, i32* %d, align 4
  %160 = load i32* %a, align 4
  %161 = load i32* %d, align 4
  %add165 = add i32 %161, %160
  store i32 %add165, i32* %d, align 4
  %162 = load i32* %d, align 4
  %163 = load i32* %a, align 4
  %and166 = and i32 %162, %163
  %164 = load i32* %d, align 4
  %neg167 = xor i32 %164, -1
  %165 = load i32* %b, align 4
  %and168 = and i32 %neg167, %165
  %or169 = or i32 %and166, %and168
  %166 = load i32** %in.addr, align 8
  %arrayidx170 = getelementptr inbounds i32* %166, i64 14
  %167 = load i32* %arrayidx170, align 4
  %add171 = add i32 %or169, %167
  %add172 = add i32 %add171, -1502002290
  %168 = load i32* %c, align 4
  %add173 = add i32 %168, %add172
  store i32 %add173, i32* %c, align 4
  %169 = load i32* %c, align 4
  %shl174 = shl i32 %169, 17
  %170 = load i32* %c, align 4
  %shr175 = lshr i32 %170, 15
  %or176 = or i32 %shl174, %shr175
  store i32 %or176, i32* %c, align 4
  %171 = load i32* %d, align 4
  %172 = load i32* %c, align 4
  %add177 = add i32 %172, %171
  store i32 %add177, i32* %c, align 4
  %173 = load i32* %c, align 4
  %174 = load i32* %d, align 4
  %and178 = and i32 %173, %174
  %175 = load i32* %c, align 4
  %neg179 = xor i32 %175, -1
  %176 = load i32* %a, align 4
  %and180 = and i32 %neg179, %176
  %or181 = or i32 %and178, %and180
  %177 = load i32** %in.addr, align 8
  %arrayidx182 = getelementptr inbounds i32* %177, i64 15
  %178 = load i32* %arrayidx182, align 4
  %add183 = add i32 %or181, %178
  %add184 = add i32 %add183, 1236535329
  %179 = load i32* %b, align 4
  %add185 = add i32 %179, %add184
  store i32 %add185, i32* %b, align 4
  %180 = load i32* %b, align 4
  %shl186 = shl i32 %180, 22
  %181 = load i32* %b, align 4
  %shr187 = lshr i32 %181, 10
  %or188 = or i32 %shl186, %shr187
  store i32 %or188, i32* %b, align 4
  %182 = load i32* %c, align 4
  %183 = load i32* %b, align 4
  %add189 = add i32 %183, %182
  store i32 %add189, i32* %b, align 4
  %184 = load i32* %b, align 4
  %185 = load i32* %d, align 4
  %and190 = and i32 %184, %185
  %186 = load i32* %c, align 4
  %187 = load i32* %d, align 4
  %neg191 = xor i32 %187, -1
  %and192 = and i32 %186, %neg191
  %or193 = or i32 %and190, %and192
  %188 = load i32** %in.addr, align 8
  %arrayidx194 = getelementptr inbounds i32* %188, i64 1
  %189 = load i32* %arrayidx194, align 4
  %add195 = add i32 %or193, %189
  %add196 = add i32 %add195, -165796510
  %190 = load i32* %a, align 4
  %add197 = add i32 %190, %add196
  store i32 %add197, i32* %a, align 4
  %191 = load i32* %a, align 4
  %shl198 = shl i32 %191, 5
  %192 = load i32* %a, align 4
  %shr199 = lshr i32 %192, 27
  %or200 = or i32 %shl198, %shr199
  store i32 %or200, i32* %a, align 4
  %193 = load i32* %b, align 4
  %194 = load i32* %a, align 4
  %add201 = add i32 %194, %193
  store i32 %add201, i32* %a, align 4
  %195 = load i32* %a, align 4
  %196 = load i32* %c, align 4
  %and202 = and i32 %195, %196
  %197 = load i32* %b, align 4
  %198 = load i32* %c, align 4
  %neg203 = xor i32 %198, -1
  %and204 = and i32 %197, %neg203
  %or205 = or i32 %and202, %and204
  %199 = load i32** %in.addr, align 8
  %arrayidx206 = getelementptr inbounds i32* %199, i64 6
  %200 = load i32* %arrayidx206, align 4
  %add207 = add i32 %or205, %200
  %add208 = add i32 %add207, -1069501632
  %201 = load i32* %d, align 4
  %add209 = add i32 %201, %add208
  store i32 %add209, i32* %d, align 4
  %202 = load i32* %d, align 4
  %shl210 = shl i32 %202, 9
  %203 = load i32* %d, align 4
  %shr211 = lshr i32 %203, 23
  %or212 = or i32 %shl210, %shr211
  store i32 %or212, i32* %d, align 4
  %204 = load i32* %a, align 4
  %205 = load i32* %d, align 4
  %add213 = add i32 %205, %204
  store i32 %add213, i32* %d, align 4
  %206 = load i32* %d, align 4
  %207 = load i32* %b, align 4
  %and214 = and i32 %206, %207
  %208 = load i32* %a, align 4
  %209 = load i32* %b, align 4
  %neg215 = xor i32 %209, -1
  %and216 = and i32 %208, %neg215
  %or217 = or i32 %and214, %and216
  %210 = load i32** %in.addr, align 8
  %arrayidx218 = getelementptr inbounds i32* %210, i64 11
  %211 = load i32* %arrayidx218, align 4
  %add219 = add i32 %or217, %211
  %add220 = add i32 %add219, 643717713
  %212 = load i32* %c, align 4
  %add221 = add i32 %212, %add220
  store i32 %add221, i32* %c, align 4
  %213 = load i32* %c, align 4
  %shl222 = shl i32 %213, 14
  %214 = load i32* %c, align 4
  %shr223 = lshr i32 %214, 18
  %or224 = or i32 %shl222, %shr223
  store i32 %or224, i32* %c, align 4
  %215 = load i32* %d, align 4
  %216 = load i32* %c, align 4
  %add225 = add i32 %216, %215
  store i32 %add225, i32* %c, align 4
  %217 = load i32* %c, align 4
  %218 = load i32* %a, align 4
  %and226 = and i32 %217, %218
  %219 = load i32* %d, align 4
  %220 = load i32* %a, align 4
  %neg227 = xor i32 %220, -1
  %and228 = and i32 %219, %neg227
  %or229 = or i32 %and226, %and228
  %221 = load i32** %in.addr, align 8
  %arrayidx230 = getelementptr inbounds i32* %221, i64 0
  %222 = load i32* %arrayidx230, align 4
  %add231 = add i32 %or229, %222
  %add232 = add i32 %add231, -373897302
  %223 = load i32* %b, align 4
  %add233 = add i32 %223, %add232
  store i32 %add233, i32* %b, align 4
  %224 = load i32* %b, align 4
  %shl234 = shl i32 %224, 20
  %225 = load i32* %b, align 4
  %shr235 = lshr i32 %225, 12
  %or236 = or i32 %shl234, %shr235
  store i32 %or236, i32* %b, align 4
  %226 = load i32* %c, align 4
  %227 = load i32* %b, align 4
  %add237 = add i32 %227, %226
  store i32 %add237, i32* %b, align 4
  %228 = load i32* %b, align 4
  %229 = load i32* %d, align 4
  %and238 = and i32 %228, %229
  %230 = load i32* %c, align 4
  %231 = load i32* %d, align 4
  %neg239 = xor i32 %231, -1
  %and240 = and i32 %230, %neg239
  %or241 = or i32 %and238, %and240
  %232 = load i32** %in.addr, align 8
  %arrayidx242 = getelementptr inbounds i32* %232, i64 5
  %233 = load i32* %arrayidx242, align 4
  %add243 = add i32 %or241, %233
  %add244 = add i32 %add243, -701558691
  %234 = load i32* %a, align 4
  %add245 = add i32 %234, %add244
  store i32 %add245, i32* %a, align 4
  %235 = load i32* %a, align 4
  %shl246 = shl i32 %235, 5
  %236 = load i32* %a, align 4
  %shr247 = lshr i32 %236, 27
  %or248 = or i32 %shl246, %shr247
  store i32 %or248, i32* %a, align 4
  %237 = load i32* %b, align 4
  %238 = load i32* %a, align 4
  %add249 = add i32 %238, %237
  store i32 %add249, i32* %a, align 4
  %239 = load i32* %a, align 4
  %240 = load i32* %c, align 4
  %and250 = and i32 %239, %240
  %241 = load i32* %b, align 4
  %242 = load i32* %c, align 4
  %neg251 = xor i32 %242, -1
  %and252 = and i32 %241, %neg251
  %or253 = or i32 %and250, %and252
  %243 = load i32** %in.addr, align 8
  %arrayidx254 = getelementptr inbounds i32* %243, i64 10
  %244 = load i32* %arrayidx254, align 4
  %add255 = add i32 %or253, %244
  %add256 = add i32 %add255, 38016083
  %245 = load i32* %d, align 4
  %add257 = add i32 %245, %add256
  store i32 %add257, i32* %d, align 4
  %246 = load i32* %d, align 4
  %shl258 = shl i32 %246, 9
  %247 = load i32* %d, align 4
  %shr259 = lshr i32 %247, 23
  %or260 = or i32 %shl258, %shr259
  store i32 %or260, i32* %d, align 4
  %248 = load i32* %a, align 4
  %249 = load i32* %d, align 4
  %add261 = add i32 %249, %248
  store i32 %add261, i32* %d, align 4
  %250 = load i32* %d, align 4
  %251 = load i32* %b, align 4
  %and262 = and i32 %250, %251
  %252 = load i32* %a, align 4
  %253 = load i32* %b, align 4
  %neg263 = xor i32 %253, -1
  %and264 = and i32 %252, %neg263
  %or265 = or i32 %and262, %and264
  %254 = load i32** %in.addr, align 8
  %arrayidx266 = getelementptr inbounds i32* %254, i64 15
  %255 = load i32* %arrayidx266, align 4
  %add267 = add i32 %or265, %255
  %add268 = add i32 %add267, -660478335
  %256 = load i32* %c, align 4
  %add269 = add i32 %256, %add268
  store i32 %add269, i32* %c, align 4
  %257 = load i32* %c, align 4
  %shl270 = shl i32 %257, 14
  %258 = load i32* %c, align 4
  %shr271 = lshr i32 %258, 18
  %or272 = or i32 %shl270, %shr271
  store i32 %or272, i32* %c, align 4
  %259 = load i32* %d, align 4
  %260 = load i32* %c, align 4
  %add273 = add i32 %260, %259
  store i32 %add273, i32* %c, align 4
  %261 = load i32* %c, align 4
  %262 = load i32* %a, align 4
  %and274 = and i32 %261, %262
  %263 = load i32* %d, align 4
  %264 = load i32* %a, align 4
  %neg275 = xor i32 %264, -1
  %and276 = and i32 %263, %neg275
  %or277 = or i32 %and274, %and276
  %265 = load i32** %in.addr, align 8
  %arrayidx278 = getelementptr inbounds i32* %265, i64 4
  %266 = load i32* %arrayidx278, align 4
  %add279 = add i32 %or277, %266
  %add280 = add i32 %add279, -405537848
  %267 = load i32* %b, align 4
  %add281 = add i32 %267, %add280
  store i32 %add281, i32* %b, align 4
  %268 = load i32* %b, align 4
  %shl282 = shl i32 %268, 20
  %269 = load i32* %b, align 4
  %shr283 = lshr i32 %269, 12
  %or284 = or i32 %shl282, %shr283
  store i32 %or284, i32* %b, align 4
  %270 = load i32* %c, align 4
  %271 = load i32* %b, align 4
  %add285 = add i32 %271, %270
  store i32 %add285, i32* %b, align 4
  %272 = load i32* %b, align 4
  %273 = load i32* %d, align 4
  %and286 = and i32 %272, %273
  %274 = load i32* %c, align 4
  %275 = load i32* %d, align 4
  %neg287 = xor i32 %275, -1
  %and288 = and i32 %274, %neg287
  %or289 = or i32 %and286, %and288
  %276 = load i32** %in.addr, align 8
  %arrayidx290 = getelementptr inbounds i32* %276, i64 9
  %277 = load i32* %arrayidx290, align 4
  %add291 = add i32 %or289, %277
  %add292 = add i32 %add291, 568446438
  %278 = load i32* %a, align 4
  %add293 = add i32 %278, %add292
  store i32 %add293, i32* %a, align 4
  %279 = load i32* %a, align 4
  %shl294 = shl i32 %279, 5
  %280 = load i32* %a, align 4
  %shr295 = lshr i32 %280, 27
  %or296 = or i32 %shl294, %shr295
  store i32 %or296, i32* %a, align 4
  %281 = load i32* %b, align 4
  %282 = load i32* %a, align 4
  %add297 = add i32 %282, %281
  store i32 %add297, i32* %a, align 4
  %283 = load i32* %a, align 4
  %284 = load i32* %c, align 4
  %and298 = and i32 %283, %284
  %285 = load i32* %b, align 4
  %286 = load i32* %c, align 4
  %neg299 = xor i32 %286, -1
  %and300 = and i32 %285, %neg299
  %or301 = or i32 %and298, %and300
  %287 = load i32** %in.addr, align 8
  %arrayidx302 = getelementptr inbounds i32* %287, i64 14
  %288 = load i32* %arrayidx302, align 4
  %add303 = add i32 %or301, %288
  %add304 = add i32 %add303, -1019803690
  %289 = load i32* %d, align 4
  %add305 = add i32 %289, %add304
  store i32 %add305, i32* %d, align 4
  %290 = load i32* %d, align 4
  %shl306 = shl i32 %290, 9
  %291 = load i32* %d, align 4
  %shr307 = lshr i32 %291, 23
  %or308 = or i32 %shl306, %shr307
  store i32 %or308, i32* %d, align 4
  %292 = load i32* %a, align 4
  %293 = load i32* %d, align 4
  %add309 = add i32 %293, %292
  store i32 %add309, i32* %d, align 4
  %294 = load i32* %d, align 4
  %295 = load i32* %b, align 4
  %and310 = and i32 %294, %295
  %296 = load i32* %a, align 4
  %297 = load i32* %b, align 4
  %neg311 = xor i32 %297, -1
  %and312 = and i32 %296, %neg311
  %or313 = or i32 %and310, %and312
  %298 = load i32** %in.addr, align 8
  %arrayidx314 = getelementptr inbounds i32* %298, i64 3
  %299 = load i32* %arrayidx314, align 4
  %add315 = add i32 %or313, %299
  %add316 = add i32 %add315, -187363961
  %300 = load i32* %c, align 4
  %add317 = add i32 %300, %add316
  store i32 %add317, i32* %c, align 4
  %301 = load i32* %c, align 4
  %shl318 = shl i32 %301, 14
  %302 = load i32* %c, align 4
  %shr319 = lshr i32 %302, 18
  %or320 = or i32 %shl318, %shr319
  store i32 %or320, i32* %c, align 4
  %303 = load i32* %d, align 4
  %304 = load i32* %c, align 4
  %add321 = add i32 %304, %303
  store i32 %add321, i32* %c, align 4
  %305 = load i32* %c, align 4
  %306 = load i32* %a, align 4
  %and322 = and i32 %305, %306
  %307 = load i32* %d, align 4
  %308 = load i32* %a, align 4
  %neg323 = xor i32 %308, -1
  %and324 = and i32 %307, %neg323
  %or325 = or i32 %and322, %and324
  %309 = load i32** %in.addr, align 8
  %arrayidx326 = getelementptr inbounds i32* %309, i64 8
  %310 = load i32* %arrayidx326, align 4
  %add327 = add i32 %or325, %310
  %add328 = add i32 %add327, 1163531501
  %311 = load i32* %b, align 4
  %add329 = add i32 %311, %add328
  store i32 %add329, i32* %b, align 4
  %312 = load i32* %b, align 4
  %shl330 = shl i32 %312, 20
  %313 = load i32* %b, align 4
  %shr331 = lshr i32 %313, 12
  %or332 = or i32 %shl330, %shr331
  store i32 %or332, i32* %b, align 4
  %314 = load i32* %c, align 4
  %315 = load i32* %b, align 4
  %add333 = add i32 %315, %314
  store i32 %add333, i32* %b, align 4
  %316 = load i32* %b, align 4
  %317 = load i32* %d, align 4
  %and334 = and i32 %316, %317
  %318 = load i32* %c, align 4
  %319 = load i32* %d, align 4
  %neg335 = xor i32 %319, -1
  %and336 = and i32 %318, %neg335
  %or337 = or i32 %and334, %and336
  %320 = load i32** %in.addr, align 8
  %arrayidx338 = getelementptr inbounds i32* %320, i64 13
  %321 = load i32* %arrayidx338, align 4
  %add339 = add i32 %or337, %321
  %add340 = add i32 %add339, -1444681467
  %322 = load i32* %a, align 4
  %add341 = add i32 %322, %add340
  store i32 %add341, i32* %a, align 4
  %323 = load i32* %a, align 4
  %shl342 = shl i32 %323, 5
  %324 = load i32* %a, align 4
  %shr343 = lshr i32 %324, 27
  %or344 = or i32 %shl342, %shr343
  store i32 %or344, i32* %a, align 4
  %325 = load i32* %b, align 4
  %326 = load i32* %a, align 4
  %add345 = add i32 %326, %325
  store i32 %add345, i32* %a, align 4
  %327 = load i32* %a, align 4
  %328 = load i32* %c, align 4
  %and346 = and i32 %327, %328
  %329 = load i32* %b, align 4
  %330 = load i32* %c, align 4
  %neg347 = xor i32 %330, -1
  %and348 = and i32 %329, %neg347
  %or349 = or i32 %and346, %and348
  %331 = load i32** %in.addr, align 8
  %arrayidx350 = getelementptr inbounds i32* %331, i64 2
  %332 = load i32* %arrayidx350, align 4
  %add351 = add i32 %or349, %332
  %add352 = add i32 %add351, -51403784
  %333 = load i32* %d, align 4
  %add353 = add i32 %333, %add352
  store i32 %add353, i32* %d, align 4
  %334 = load i32* %d, align 4
  %shl354 = shl i32 %334, 9
  %335 = load i32* %d, align 4
  %shr355 = lshr i32 %335, 23
  %or356 = or i32 %shl354, %shr355
  store i32 %or356, i32* %d, align 4
  %336 = load i32* %a, align 4
  %337 = load i32* %d, align 4
  %add357 = add i32 %337, %336
  store i32 %add357, i32* %d, align 4
  %338 = load i32* %d, align 4
  %339 = load i32* %b, align 4
  %and358 = and i32 %338, %339
  %340 = load i32* %a, align 4
  %341 = load i32* %b, align 4
  %neg359 = xor i32 %341, -1
  %and360 = and i32 %340, %neg359
  %or361 = or i32 %and358, %and360
  %342 = load i32** %in.addr, align 8
  %arrayidx362 = getelementptr inbounds i32* %342, i64 7
  %343 = load i32* %arrayidx362, align 4
  %add363 = add i32 %or361, %343
  %add364 = add i32 %add363, 1735328473
  %344 = load i32* %c, align 4
  %add365 = add i32 %344, %add364
  store i32 %add365, i32* %c, align 4
  %345 = load i32* %c, align 4
  %shl366 = shl i32 %345, 14
  %346 = load i32* %c, align 4
  %shr367 = lshr i32 %346, 18
  %or368 = or i32 %shl366, %shr367
  store i32 %or368, i32* %c, align 4
  %347 = load i32* %d, align 4
  %348 = load i32* %c, align 4
  %add369 = add i32 %348, %347
  store i32 %add369, i32* %c, align 4
  %349 = load i32* %c, align 4
  %350 = load i32* %a, align 4
  %and370 = and i32 %349, %350
  %351 = load i32* %d, align 4
  %352 = load i32* %a, align 4
  %neg371 = xor i32 %352, -1
  %and372 = and i32 %351, %neg371
  %or373 = or i32 %and370, %and372
  %353 = load i32** %in.addr, align 8
  %arrayidx374 = getelementptr inbounds i32* %353, i64 12
  %354 = load i32* %arrayidx374, align 4
  %add375 = add i32 %or373, %354
  %add376 = add i32 %add375, -1926607734
  %355 = load i32* %b, align 4
  %add377 = add i32 %355, %add376
  store i32 %add377, i32* %b, align 4
  %356 = load i32* %b, align 4
  %shl378 = shl i32 %356, 20
  %357 = load i32* %b, align 4
  %shr379 = lshr i32 %357, 12
  %or380 = or i32 %shl378, %shr379
  store i32 %or380, i32* %b, align 4
  %358 = load i32* %c, align 4
  %359 = load i32* %b, align 4
  %add381 = add i32 %359, %358
  store i32 %add381, i32* %b, align 4
  %360 = load i32* %b, align 4
  %361 = load i32* %c, align 4
  %xor = xor i32 %360, %361
  %362 = load i32* %d, align 4
  %xor382 = xor i32 %xor, %362
  %363 = load i32** %in.addr, align 8
  %arrayidx383 = getelementptr inbounds i32* %363, i64 5
  %364 = load i32* %arrayidx383, align 4
  %add384 = add i32 %xor382, %364
  %add385 = add i32 %add384, -378558
  %365 = load i32* %a, align 4
  %add386 = add i32 %365, %add385
  store i32 %add386, i32* %a, align 4
  %366 = load i32* %a, align 4
  %shl387 = shl i32 %366, 4
  %367 = load i32* %a, align 4
  %shr388 = lshr i32 %367, 28
  %or389 = or i32 %shl387, %shr388
  store i32 %or389, i32* %a, align 4
  %368 = load i32* %b, align 4
  %369 = load i32* %a, align 4
  %add390 = add i32 %369, %368
  store i32 %add390, i32* %a, align 4
  %370 = load i32* %a, align 4
  %371 = load i32* %b, align 4
  %xor391 = xor i32 %370, %371
  %372 = load i32* %c, align 4
  %xor392 = xor i32 %xor391, %372
  %373 = load i32** %in.addr, align 8
  %arrayidx393 = getelementptr inbounds i32* %373, i64 8
  %374 = load i32* %arrayidx393, align 4
  %add394 = add i32 %xor392, %374
  %add395 = add i32 %add394, -2022574463
  %375 = load i32* %d, align 4
  %add396 = add i32 %375, %add395
  store i32 %add396, i32* %d, align 4
  %376 = load i32* %d, align 4
  %shl397 = shl i32 %376, 11
  %377 = load i32* %d, align 4
  %shr398 = lshr i32 %377, 21
  %or399 = or i32 %shl397, %shr398
  store i32 %or399, i32* %d, align 4
  %378 = load i32* %a, align 4
  %379 = load i32* %d, align 4
  %add400 = add i32 %379, %378
  store i32 %add400, i32* %d, align 4
  %380 = load i32* %d, align 4
  %381 = load i32* %a, align 4
  %xor401 = xor i32 %380, %381
  %382 = load i32* %b, align 4
  %xor402 = xor i32 %xor401, %382
  %383 = load i32** %in.addr, align 8
  %arrayidx403 = getelementptr inbounds i32* %383, i64 11
  %384 = load i32* %arrayidx403, align 4
  %add404 = add i32 %xor402, %384
  %add405 = add i32 %add404, 1839030562
  %385 = load i32* %c, align 4
  %add406 = add i32 %385, %add405
  store i32 %add406, i32* %c, align 4
  %386 = load i32* %c, align 4
  %shl407 = shl i32 %386, 16
  %387 = load i32* %c, align 4
  %shr408 = lshr i32 %387, 16
  %or409 = or i32 %shl407, %shr408
  store i32 %or409, i32* %c, align 4
  %388 = load i32* %d, align 4
  %389 = load i32* %c, align 4
  %add410 = add i32 %389, %388
  store i32 %add410, i32* %c, align 4
  %390 = load i32* %c, align 4
  %391 = load i32* %d, align 4
  %xor411 = xor i32 %390, %391
  %392 = load i32* %a, align 4
  %xor412 = xor i32 %xor411, %392
  %393 = load i32** %in.addr, align 8
  %arrayidx413 = getelementptr inbounds i32* %393, i64 14
  %394 = load i32* %arrayidx413, align 4
  %add414 = add i32 %xor412, %394
  %add415 = add i32 %add414, -35309556
  %395 = load i32* %b, align 4
  %add416 = add i32 %395, %add415
  store i32 %add416, i32* %b, align 4
  %396 = load i32* %b, align 4
  %shl417 = shl i32 %396, 23
  %397 = load i32* %b, align 4
  %shr418 = lshr i32 %397, 9
  %or419 = or i32 %shl417, %shr418
  store i32 %or419, i32* %b, align 4
  %398 = load i32* %c, align 4
  %399 = load i32* %b, align 4
  %add420 = add i32 %399, %398
  store i32 %add420, i32* %b, align 4
  %400 = load i32* %b, align 4
  %401 = load i32* %c, align 4
  %xor421 = xor i32 %400, %401
  %402 = load i32* %d, align 4
  %xor422 = xor i32 %xor421, %402
  %403 = load i32** %in.addr, align 8
  %arrayidx423 = getelementptr inbounds i32* %403, i64 1
  %404 = load i32* %arrayidx423, align 4
  %add424 = add i32 %xor422, %404
  %add425 = add i32 %add424, -1530992060
  %405 = load i32* %a, align 4
  %add426 = add i32 %405, %add425
  store i32 %add426, i32* %a, align 4
  %406 = load i32* %a, align 4
  %shl427 = shl i32 %406, 4
  %407 = load i32* %a, align 4
  %shr428 = lshr i32 %407, 28
  %or429 = or i32 %shl427, %shr428
  store i32 %or429, i32* %a, align 4
  %408 = load i32* %b, align 4
  %409 = load i32* %a, align 4
  %add430 = add i32 %409, %408
  store i32 %add430, i32* %a, align 4
  %410 = load i32* %a, align 4
  %411 = load i32* %b, align 4
  %xor431 = xor i32 %410, %411
  %412 = load i32* %c, align 4
  %xor432 = xor i32 %xor431, %412
  %413 = load i32** %in.addr, align 8
  %arrayidx433 = getelementptr inbounds i32* %413, i64 4
  %414 = load i32* %arrayidx433, align 4
  %add434 = add i32 %xor432, %414
  %add435 = add i32 %add434, 1272893353
  %415 = load i32* %d, align 4
  %add436 = add i32 %415, %add435
  store i32 %add436, i32* %d, align 4
  %416 = load i32* %d, align 4
  %shl437 = shl i32 %416, 11
  %417 = load i32* %d, align 4
  %shr438 = lshr i32 %417, 21
  %or439 = or i32 %shl437, %shr438
  store i32 %or439, i32* %d, align 4
  %418 = load i32* %a, align 4
  %419 = load i32* %d, align 4
  %add440 = add i32 %419, %418
  store i32 %add440, i32* %d, align 4
  %420 = load i32* %d, align 4
  %421 = load i32* %a, align 4
  %xor441 = xor i32 %420, %421
  %422 = load i32* %b, align 4
  %xor442 = xor i32 %xor441, %422
  %423 = load i32** %in.addr, align 8
  %arrayidx443 = getelementptr inbounds i32* %423, i64 7
  %424 = load i32* %arrayidx443, align 4
  %add444 = add i32 %xor442, %424
  %add445 = add i32 %add444, -155497632
  %425 = load i32* %c, align 4
  %add446 = add i32 %425, %add445
  store i32 %add446, i32* %c, align 4
  %426 = load i32* %c, align 4
  %shl447 = shl i32 %426, 16
  %427 = load i32* %c, align 4
  %shr448 = lshr i32 %427, 16
  %or449 = or i32 %shl447, %shr448
  store i32 %or449, i32* %c, align 4
  %428 = load i32* %d, align 4
  %429 = load i32* %c, align 4
  %add450 = add i32 %429, %428
  store i32 %add450, i32* %c, align 4
  %430 = load i32* %c, align 4
  %431 = load i32* %d, align 4
  %xor451 = xor i32 %430, %431
  %432 = load i32* %a, align 4
  %xor452 = xor i32 %xor451, %432
  %433 = load i32** %in.addr, align 8
  %arrayidx453 = getelementptr inbounds i32* %433, i64 10
  %434 = load i32* %arrayidx453, align 4
  %add454 = add i32 %xor452, %434
  %add455 = add i32 %add454, -1094730640
  %435 = load i32* %b, align 4
  %add456 = add i32 %435, %add455
  store i32 %add456, i32* %b, align 4
  %436 = load i32* %b, align 4
  %shl457 = shl i32 %436, 23
  %437 = load i32* %b, align 4
  %shr458 = lshr i32 %437, 9
  %or459 = or i32 %shl457, %shr458
  store i32 %or459, i32* %b, align 4
  %438 = load i32* %c, align 4
  %439 = load i32* %b, align 4
  %add460 = add i32 %439, %438
  store i32 %add460, i32* %b, align 4
  %440 = load i32* %b, align 4
  %441 = load i32* %c, align 4
  %xor461 = xor i32 %440, %441
  %442 = load i32* %d, align 4
  %xor462 = xor i32 %xor461, %442
  %443 = load i32** %in.addr, align 8
  %arrayidx463 = getelementptr inbounds i32* %443, i64 13
  %444 = load i32* %arrayidx463, align 4
  %add464 = add i32 %xor462, %444
  %add465 = add i32 %add464, 681279174
  %445 = load i32* %a, align 4
  %add466 = add i32 %445, %add465
  store i32 %add466, i32* %a, align 4
  %446 = load i32* %a, align 4
  %shl467 = shl i32 %446, 4
  %447 = load i32* %a, align 4
  %shr468 = lshr i32 %447, 28
  %or469 = or i32 %shl467, %shr468
  store i32 %or469, i32* %a, align 4
  %448 = load i32* %b, align 4
  %449 = load i32* %a, align 4
  %add470 = add i32 %449, %448
  store i32 %add470, i32* %a, align 4
  %450 = load i32* %a, align 4
  %451 = load i32* %b, align 4
  %xor471 = xor i32 %450, %451
  %452 = load i32* %c, align 4
  %xor472 = xor i32 %xor471, %452
  %453 = load i32** %in.addr, align 8
  %arrayidx473 = getelementptr inbounds i32* %453, i64 0
  %454 = load i32* %arrayidx473, align 4
  %add474 = add i32 %xor472, %454
  %add475 = add i32 %add474, -358537222
  %455 = load i32* %d, align 4
  %add476 = add i32 %455, %add475
  store i32 %add476, i32* %d, align 4
  %456 = load i32* %d, align 4
  %shl477 = shl i32 %456, 11
  %457 = load i32* %d, align 4
  %shr478 = lshr i32 %457, 21
  %or479 = or i32 %shl477, %shr478
  store i32 %or479, i32* %d, align 4
  %458 = load i32* %a, align 4
  %459 = load i32* %d, align 4
  %add480 = add i32 %459, %458
  store i32 %add480, i32* %d, align 4
  %460 = load i32* %d, align 4
  %461 = load i32* %a, align 4
  %xor481 = xor i32 %460, %461
  %462 = load i32* %b, align 4
  %xor482 = xor i32 %xor481, %462
  %463 = load i32** %in.addr, align 8
  %arrayidx483 = getelementptr inbounds i32* %463, i64 3
  %464 = load i32* %arrayidx483, align 4
  %add484 = add i32 %xor482, %464
  %add485 = add i32 %add484, -722521979
  %465 = load i32* %c, align 4
  %add486 = add i32 %465, %add485
  store i32 %add486, i32* %c, align 4
  %466 = load i32* %c, align 4
  %shl487 = shl i32 %466, 16
  %467 = load i32* %c, align 4
  %shr488 = lshr i32 %467, 16
  %or489 = or i32 %shl487, %shr488
  store i32 %or489, i32* %c, align 4
  %468 = load i32* %d, align 4
  %469 = load i32* %c, align 4
  %add490 = add i32 %469, %468
  store i32 %add490, i32* %c, align 4
  %470 = load i32* %c, align 4
  %471 = load i32* %d, align 4
  %xor491 = xor i32 %470, %471
  %472 = load i32* %a, align 4
  %xor492 = xor i32 %xor491, %472
  %473 = load i32** %in.addr, align 8
  %arrayidx493 = getelementptr inbounds i32* %473, i64 6
  %474 = load i32* %arrayidx493, align 4
  %add494 = add i32 %xor492, %474
  %add495 = add i32 %add494, 76029189
  %475 = load i32* %b, align 4
  %add496 = add i32 %475, %add495
  store i32 %add496, i32* %b, align 4
  %476 = load i32* %b, align 4
  %shl497 = shl i32 %476, 23
  %477 = load i32* %b, align 4
  %shr498 = lshr i32 %477, 9
  %or499 = or i32 %shl497, %shr498
  store i32 %or499, i32* %b, align 4
  %478 = load i32* %c, align 4
  %479 = load i32* %b, align 4
  %add500 = add i32 %479, %478
  store i32 %add500, i32* %b, align 4
  %480 = load i32* %b, align 4
  %481 = load i32* %c, align 4
  %xor501 = xor i32 %480, %481
  %482 = load i32* %d, align 4
  %xor502 = xor i32 %xor501, %482
  %483 = load i32** %in.addr, align 8
  %arrayidx503 = getelementptr inbounds i32* %483, i64 9
  %484 = load i32* %arrayidx503, align 4
  %add504 = add i32 %xor502, %484
  %add505 = add i32 %add504, -640364487
  %485 = load i32* %a, align 4
  %add506 = add i32 %485, %add505
  store i32 %add506, i32* %a, align 4
  %486 = load i32* %a, align 4
  %shl507 = shl i32 %486, 4
  %487 = load i32* %a, align 4
  %shr508 = lshr i32 %487, 28
  %or509 = or i32 %shl507, %shr508
  store i32 %or509, i32* %a, align 4
  %488 = load i32* %b, align 4
  %489 = load i32* %a, align 4
  %add510 = add i32 %489, %488
  store i32 %add510, i32* %a, align 4
  %490 = load i32* %a, align 4
  %491 = load i32* %b, align 4
  %xor511 = xor i32 %490, %491
  %492 = load i32* %c, align 4
  %xor512 = xor i32 %xor511, %492
  %493 = load i32** %in.addr, align 8
  %arrayidx513 = getelementptr inbounds i32* %493, i64 12
  %494 = load i32* %arrayidx513, align 4
  %add514 = add i32 %xor512, %494
  %add515 = add i32 %add514, -421815835
  %495 = load i32* %d, align 4
  %add516 = add i32 %495, %add515
  store i32 %add516, i32* %d, align 4
  %496 = load i32* %d, align 4
  %shl517 = shl i32 %496, 11
  %497 = load i32* %d, align 4
  %shr518 = lshr i32 %497, 21
  %or519 = or i32 %shl517, %shr518
  store i32 %or519, i32* %d, align 4
  %498 = load i32* %a, align 4
  %499 = load i32* %d, align 4
  %add520 = add i32 %499, %498
  store i32 %add520, i32* %d, align 4
  %500 = load i32* %d, align 4
  %501 = load i32* %a, align 4
  %xor521 = xor i32 %500, %501
  %502 = load i32* %b, align 4
  %xor522 = xor i32 %xor521, %502
  %503 = load i32** %in.addr, align 8
  %arrayidx523 = getelementptr inbounds i32* %503, i64 15
  %504 = load i32* %arrayidx523, align 4
  %add524 = add i32 %xor522, %504
  %add525 = add i32 %add524, 530742520
  %505 = load i32* %c, align 4
  %add526 = add i32 %505, %add525
  store i32 %add526, i32* %c, align 4
  %506 = load i32* %c, align 4
  %shl527 = shl i32 %506, 16
  %507 = load i32* %c, align 4
  %shr528 = lshr i32 %507, 16
  %or529 = or i32 %shl527, %shr528
  store i32 %or529, i32* %c, align 4
  %508 = load i32* %d, align 4
  %509 = load i32* %c, align 4
  %add530 = add i32 %509, %508
  store i32 %add530, i32* %c, align 4
  %510 = load i32* %c, align 4
  %511 = load i32* %d, align 4
  %xor531 = xor i32 %510, %511
  %512 = load i32* %a, align 4
  %xor532 = xor i32 %xor531, %512
  %513 = load i32** %in.addr, align 8
  %arrayidx533 = getelementptr inbounds i32* %513, i64 2
  %514 = load i32* %arrayidx533, align 4
  %add534 = add i32 %xor532, %514
  %add535 = add i32 %add534, -995338651
  %515 = load i32* %b, align 4
  %add536 = add i32 %515, %add535
  store i32 %add536, i32* %b, align 4
  %516 = load i32* %b, align 4
  %shl537 = shl i32 %516, 23
  %517 = load i32* %b, align 4
  %shr538 = lshr i32 %517, 9
  %or539 = or i32 %shl537, %shr538
  store i32 %or539, i32* %b, align 4
  %518 = load i32* %c, align 4
  %519 = load i32* %b, align 4
  %add540 = add i32 %519, %518
  store i32 %add540, i32* %b, align 4
  %520 = load i32* %c, align 4
  %521 = load i32* %b, align 4
  %522 = load i32* %d, align 4
  %neg541 = xor i32 %522, -1
  %or542 = or i32 %521, %neg541
  %xor543 = xor i32 %520, %or542
  %523 = load i32** %in.addr, align 8
  %arrayidx544 = getelementptr inbounds i32* %523, i64 0
  %524 = load i32* %arrayidx544, align 4
  %add545 = add i32 %xor543, %524
  %add546 = add i32 %add545, -198630844
  %525 = load i32* %a, align 4
  %add547 = add i32 %525, %add546
  store i32 %add547, i32* %a, align 4
  %526 = load i32* %a, align 4
  %shl548 = shl i32 %526, 6
  %527 = load i32* %a, align 4
  %shr549 = lshr i32 %527, 26
  %or550 = or i32 %shl548, %shr549
  store i32 %or550, i32* %a, align 4
  %528 = load i32* %b, align 4
  %529 = load i32* %a, align 4
  %add551 = add i32 %529, %528
  store i32 %add551, i32* %a, align 4
  %530 = load i32* %b, align 4
  %531 = load i32* %a, align 4
  %532 = load i32* %c, align 4
  %neg552 = xor i32 %532, -1
  %or553 = or i32 %531, %neg552
  %xor554 = xor i32 %530, %or553
  %533 = load i32** %in.addr, align 8
  %arrayidx555 = getelementptr inbounds i32* %533, i64 7
  %534 = load i32* %arrayidx555, align 4
  %add556 = add i32 %xor554, %534
  %add557 = add i32 %add556, 1126891415
  %535 = load i32* %d, align 4
  %add558 = add i32 %535, %add557
  store i32 %add558, i32* %d, align 4
  %536 = load i32* %d, align 4
  %shl559 = shl i32 %536, 10
  %537 = load i32* %d, align 4
  %shr560 = lshr i32 %537, 22
  %or561 = or i32 %shl559, %shr560
  store i32 %or561, i32* %d, align 4
  %538 = load i32* %a, align 4
  %539 = load i32* %d, align 4
  %add562 = add i32 %539, %538
  store i32 %add562, i32* %d, align 4
  %540 = load i32* %a, align 4
  %541 = load i32* %d, align 4
  %542 = load i32* %b, align 4
  %neg563 = xor i32 %542, -1
  %or564 = or i32 %541, %neg563
  %xor565 = xor i32 %540, %or564
  %543 = load i32** %in.addr, align 8
  %arrayidx566 = getelementptr inbounds i32* %543, i64 14
  %544 = load i32* %arrayidx566, align 4
  %add567 = add i32 %xor565, %544
  %add568 = add i32 %add567, -1416354905
  %545 = load i32* %c, align 4
  %add569 = add i32 %545, %add568
  store i32 %add569, i32* %c, align 4
  %546 = load i32* %c, align 4
  %shl570 = shl i32 %546, 15
  %547 = load i32* %c, align 4
  %shr571 = lshr i32 %547, 17
  %or572 = or i32 %shl570, %shr571
  store i32 %or572, i32* %c, align 4
  %548 = load i32* %d, align 4
  %549 = load i32* %c, align 4
  %add573 = add i32 %549, %548
  store i32 %add573, i32* %c, align 4
  %550 = load i32* %d, align 4
  %551 = load i32* %c, align 4
  %552 = load i32* %a, align 4
  %neg574 = xor i32 %552, -1
  %or575 = or i32 %551, %neg574
  %xor576 = xor i32 %550, %or575
  %553 = load i32** %in.addr, align 8
  %arrayidx577 = getelementptr inbounds i32* %553, i64 5
  %554 = load i32* %arrayidx577, align 4
  %add578 = add i32 %xor576, %554
  %add579 = add i32 %add578, -57434055
  %555 = load i32* %b, align 4
  %add580 = add i32 %555, %add579
  store i32 %add580, i32* %b, align 4
  %556 = load i32* %b, align 4
  %shl581 = shl i32 %556, 21
  %557 = load i32* %b, align 4
  %shr582 = lshr i32 %557, 11
  %or583 = or i32 %shl581, %shr582
  store i32 %or583, i32* %b, align 4
  %558 = load i32* %c, align 4
  %559 = load i32* %b, align 4
  %add584 = add i32 %559, %558
  store i32 %add584, i32* %b, align 4
  %560 = load i32* %c, align 4
  %561 = load i32* %b, align 4
  %562 = load i32* %d, align 4
  %neg585 = xor i32 %562, -1
  %or586 = or i32 %561, %neg585
  %xor587 = xor i32 %560, %or586
  %563 = load i32** %in.addr, align 8
  %arrayidx588 = getelementptr inbounds i32* %563, i64 12
  %564 = load i32* %arrayidx588, align 4
  %add589 = add i32 %xor587, %564
  %add590 = add i32 %add589, 1700485571
  %565 = load i32* %a, align 4
  %add591 = add i32 %565, %add590
  store i32 %add591, i32* %a, align 4
  %566 = load i32* %a, align 4
  %shl592 = shl i32 %566, 6
  %567 = load i32* %a, align 4
  %shr593 = lshr i32 %567, 26
  %or594 = or i32 %shl592, %shr593
  store i32 %or594, i32* %a, align 4
  %568 = load i32* %b, align 4
  %569 = load i32* %a, align 4
  %add595 = add i32 %569, %568
  store i32 %add595, i32* %a, align 4
  %570 = load i32* %b, align 4
  %571 = load i32* %a, align 4
  %572 = load i32* %c, align 4
  %neg596 = xor i32 %572, -1
  %or597 = or i32 %571, %neg596
  %xor598 = xor i32 %570, %or597
  %573 = load i32** %in.addr, align 8
  %arrayidx599 = getelementptr inbounds i32* %573, i64 3
  %574 = load i32* %arrayidx599, align 4
  %add600 = add i32 %xor598, %574
  %add601 = add i32 %add600, -1894986606
  %575 = load i32* %d, align 4
  %add602 = add i32 %575, %add601
  store i32 %add602, i32* %d, align 4
  %576 = load i32* %d, align 4
  %shl603 = shl i32 %576, 10
  %577 = load i32* %d, align 4
  %shr604 = lshr i32 %577, 22
  %or605 = or i32 %shl603, %shr604
  store i32 %or605, i32* %d, align 4
  %578 = load i32* %a, align 4
  %579 = load i32* %d, align 4
  %add606 = add i32 %579, %578
  store i32 %add606, i32* %d, align 4
  %580 = load i32* %a, align 4
  %581 = load i32* %d, align 4
  %582 = load i32* %b, align 4
  %neg607 = xor i32 %582, -1
  %or608 = or i32 %581, %neg607
  %xor609 = xor i32 %580, %or608
  %583 = load i32** %in.addr, align 8
  %arrayidx610 = getelementptr inbounds i32* %583, i64 10
  %584 = load i32* %arrayidx610, align 4
  %add611 = add i32 %xor609, %584
  %add612 = add i32 %add611, -1051523
  %585 = load i32* %c, align 4
  %add613 = add i32 %585, %add612
  store i32 %add613, i32* %c, align 4
  %586 = load i32* %c, align 4
  %shl614 = shl i32 %586, 15
  %587 = load i32* %c, align 4
  %shr615 = lshr i32 %587, 17
  %or616 = or i32 %shl614, %shr615
  store i32 %or616, i32* %c, align 4
  %588 = load i32* %d, align 4
  %589 = load i32* %c, align 4
  %add617 = add i32 %589, %588
  store i32 %add617, i32* %c, align 4
  %590 = load i32* %d, align 4
  %591 = load i32* %c, align 4
  %592 = load i32* %a, align 4
  %neg618 = xor i32 %592, -1
  %or619 = or i32 %591, %neg618
  %xor620 = xor i32 %590, %or619
  %593 = load i32** %in.addr, align 8
  %arrayidx621 = getelementptr inbounds i32* %593, i64 1
  %594 = load i32* %arrayidx621, align 4
  %add622 = add i32 %xor620, %594
  %add623 = add i32 %add622, -2054922799
  %595 = load i32* %b, align 4
  %add624 = add i32 %595, %add623
  store i32 %add624, i32* %b, align 4
  %596 = load i32* %b, align 4
  %shl625 = shl i32 %596, 21
  %597 = load i32* %b, align 4
  %shr626 = lshr i32 %597, 11
  %or627 = or i32 %shl625, %shr626
  store i32 %or627, i32* %b, align 4
  %598 = load i32* %c, align 4
  %599 = load i32* %b, align 4
  %add628 = add i32 %599, %598
  store i32 %add628, i32* %b, align 4
  %600 = load i32* %c, align 4
  %601 = load i32* %b, align 4
  %602 = load i32* %d, align 4
  %neg629 = xor i32 %602, -1
  %or630 = or i32 %601, %neg629
  %xor631 = xor i32 %600, %or630
  %603 = load i32** %in.addr, align 8
  %arrayidx632 = getelementptr inbounds i32* %603, i64 8
  %604 = load i32* %arrayidx632, align 4
  %add633 = add i32 %xor631, %604
  %add634 = add i32 %add633, 1873313359
  %605 = load i32* %a, align 4
  %add635 = add i32 %605, %add634
  store i32 %add635, i32* %a, align 4
  %606 = load i32* %a, align 4
  %shl636 = shl i32 %606, 6
  %607 = load i32* %a, align 4
  %shr637 = lshr i32 %607, 26
  %or638 = or i32 %shl636, %shr637
  store i32 %or638, i32* %a, align 4
  %608 = load i32* %b, align 4
  %609 = load i32* %a, align 4
  %add639 = add i32 %609, %608
  store i32 %add639, i32* %a, align 4
  %610 = load i32* %b, align 4
  %611 = load i32* %a, align 4
  %612 = load i32* %c, align 4
  %neg640 = xor i32 %612, -1
  %or641 = or i32 %611, %neg640
  %xor642 = xor i32 %610, %or641
  %613 = load i32** %in.addr, align 8
  %arrayidx643 = getelementptr inbounds i32* %613, i64 15
  %614 = load i32* %arrayidx643, align 4
  %add644 = add i32 %xor642, %614
  %add645 = add i32 %add644, -30611744
  %615 = load i32* %d, align 4
  %add646 = add i32 %615, %add645
  store i32 %add646, i32* %d, align 4
  %616 = load i32* %d, align 4
  %shl647 = shl i32 %616, 10
  %617 = load i32* %d, align 4
  %shr648 = lshr i32 %617, 22
  %or649 = or i32 %shl647, %shr648
  store i32 %or649, i32* %d, align 4
  %618 = load i32* %a, align 4
  %619 = load i32* %d, align 4
  %add650 = add i32 %619, %618
  store i32 %add650, i32* %d, align 4
  %620 = load i32* %a, align 4
  %621 = load i32* %d, align 4
  %622 = load i32* %b, align 4
  %neg651 = xor i32 %622, -1
  %or652 = or i32 %621, %neg651
  %xor653 = xor i32 %620, %or652
  %623 = load i32** %in.addr, align 8
  %arrayidx654 = getelementptr inbounds i32* %623, i64 6
  %624 = load i32* %arrayidx654, align 4
  %add655 = add i32 %xor653, %624
  %add656 = add i32 %add655, -1560198380
  %625 = load i32* %c, align 4
  %add657 = add i32 %625, %add656
  store i32 %add657, i32* %c, align 4
  %626 = load i32* %c, align 4
  %shl658 = shl i32 %626, 15
  %627 = load i32* %c, align 4
  %shr659 = lshr i32 %627, 17
  %or660 = or i32 %shl658, %shr659
  store i32 %or660, i32* %c, align 4
  %628 = load i32* %d, align 4
  %629 = load i32* %c, align 4
  %add661 = add i32 %629, %628
  store i32 %add661, i32* %c, align 4
  %630 = load i32* %d, align 4
  %631 = load i32* %c, align 4
  %632 = load i32* %a, align 4
  %neg662 = xor i32 %632, -1
  %or663 = or i32 %631, %neg662
  %xor664 = xor i32 %630, %or663
  %633 = load i32** %in.addr, align 8
  %arrayidx665 = getelementptr inbounds i32* %633, i64 13
  %634 = load i32* %arrayidx665, align 4
  %add666 = add i32 %xor664, %634
  %add667 = add i32 %add666, 1309151649
  %635 = load i32* %b, align 4
  %add668 = add i32 %635, %add667
  store i32 %add668, i32* %b, align 4
  %636 = load i32* %b, align 4
  %shl669 = shl i32 %636, 21
  %637 = load i32* %b, align 4
  %shr670 = lshr i32 %637, 11
  %or671 = or i32 %shl669, %shr670
  store i32 %or671, i32* %b, align 4
  %638 = load i32* %c, align 4
  %639 = load i32* %b, align 4
  %add672 = add i32 %639, %638
  store i32 %add672, i32* %b, align 4
  %640 = load i32* %c, align 4
  %641 = load i32* %b, align 4
  %642 = load i32* %d, align 4
  %neg673 = xor i32 %642, -1
  %or674 = or i32 %641, %neg673
  %xor675 = xor i32 %640, %or674
  %643 = load i32** %in.addr, align 8
  %arrayidx676 = getelementptr inbounds i32* %643, i64 4
  %644 = load i32* %arrayidx676, align 4
  %add677 = add i32 %xor675, %644
  %add678 = add i32 %add677, -145523070
  %645 = load i32* %a, align 4
  %add679 = add i32 %645, %add678
  store i32 %add679, i32* %a, align 4
  %646 = load i32* %a, align 4
  %shl680 = shl i32 %646, 6
  %647 = load i32* %a, align 4
  %shr681 = lshr i32 %647, 26
  %or682 = or i32 %shl680, %shr681
  store i32 %or682, i32* %a, align 4
  %648 = load i32* %b, align 4
  %649 = load i32* %a, align 4
  %add683 = add i32 %649, %648
  store i32 %add683, i32* %a, align 4
  %650 = load i32* %b, align 4
  %651 = load i32* %a, align 4
  %652 = load i32* %c, align 4
  %neg684 = xor i32 %652, -1
  %or685 = or i32 %651, %neg684
  %xor686 = xor i32 %650, %or685
  %653 = load i32** %in.addr, align 8
  %arrayidx687 = getelementptr inbounds i32* %653, i64 11
  %654 = load i32* %arrayidx687, align 4
  %add688 = add i32 %xor686, %654
  %add689 = add i32 %add688, -1120210379
  %655 = load i32* %d, align 4
  %add690 = add i32 %655, %add689
  store i32 %add690, i32* %d, align 4
  %656 = load i32* %d, align 4
  %shl691 = shl i32 %656, 10
  %657 = load i32* %d, align 4
  %shr692 = lshr i32 %657, 22
  %or693 = or i32 %shl691, %shr692
  store i32 %or693, i32* %d, align 4
  %658 = load i32* %a, align 4
  %659 = load i32* %d, align 4
  %add694 = add i32 %659, %658
  store i32 %add694, i32* %d, align 4
  %660 = load i32* %a, align 4
  %661 = load i32* %d, align 4
  %662 = load i32* %b, align 4
  %neg695 = xor i32 %662, -1
  %or696 = or i32 %661, %neg695
  %xor697 = xor i32 %660, %or696
  %663 = load i32** %in.addr, align 8
  %arrayidx698 = getelementptr inbounds i32* %663, i64 2
  %664 = load i32* %arrayidx698, align 4
  %add699 = add i32 %xor697, %664
  %add700 = add i32 %add699, 718787259
  %665 = load i32* %c, align 4
  %add701 = add i32 %665, %add700
  store i32 %add701, i32* %c, align 4
  %666 = load i32* %c, align 4
  %shl702 = shl i32 %666, 15
  %667 = load i32* %c, align 4
  %shr703 = lshr i32 %667, 17
  %or704 = or i32 %shl702, %shr703
  store i32 %or704, i32* %c, align 4
  %668 = load i32* %d, align 4
  %669 = load i32* %c, align 4
  %add705 = add i32 %669, %668
  store i32 %add705, i32* %c, align 4
  %670 = load i32* %d, align 4
  %671 = load i32* %c, align 4
  %672 = load i32* %a, align 4
  %neg706 = xor i32 %672, -1
  %or707 = or i32 %671, %neg706
  %xor708 = xor i32 %670, %or707
  %673 = load i32** %in.addr, align 8
  %arrayidx709 = getelementptr inbounds i32* %673, i64 9
  %674 = load i32* %arrayidx709, align 4
  %add710 = add i32 %xor708, %674
  %add711 = add i32 %add710, -343485551
  %675 = load i32* %b, align 4
  %add712 = add i32 %675, %add711
  store i32 %add712, i32* %b, align 4
  %676 = load i32* %b, align 4
  %shl713 = shl i32 %676, 21
  %677 = load i32* %b, align 4
  %shr714 = lshr i32 %677, 11
  %or715 = or i32 %shl713, %shr714
  store i32 %or715, i32* %b, align 4
  %678 = load i32* %c, align 4
  %679 = load i32* %b, align 4
  %add716 = add i32 %679, %678
  store i32 %add716, i32* %b, align 4
  %680 = load i32* %a, align 4
  %681 = load i32** %buf.addr, align 8
  %arrayidx717 = getelementptr inbounds i32* %681, i64 0
  %682 = load i32* %arrayidx717, align 4
  %add718 = add i32 %682, %680
  store i32 %add718, i32* %arrayidx717, align 4
  %683 = load i32* %b, align 4
  %684 = load i32** %buf.addr, align 8
  %arrayidx719 = getelementptr inbounds i32* %684, i64 1
  %685 = load i32* %arrayidx719, align 4
  %add720 = add i32 %685, %683
  store i32 %add720, i32* %arrayidx719, align 4
  %686 = load i32* %c, align 4
  %687 = load i32** %buf.addr, align 8
  %arrayidx721 = getelementptr inbounds i32* %687, i64 2
  %688 = load i32* %arrayidx721, align 4
  %add722 = add i32 %688, %686
  store i32 %add722, i32* %arrayidx721, align 4
  %689 = load i32* %d, align 4
  %690 = load i32** %buf.addr, align 8
  %arrayidx723 = getelementptr inbounds i32* %690, i64 3
  %691 = load i32* %arrayidx723, align 4
  %add724 = add i32 %691, %689
  store i32 %add724, i32* %arrayidx723, align 4
  ret void
}
