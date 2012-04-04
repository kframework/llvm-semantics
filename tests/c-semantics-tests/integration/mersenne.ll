; ModuleID = '/home/david/src/c-semantics/tests/integration/mersenne.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@mt = internal global [11 x i64] zeroinitializer, align 16
@mti = internal global i32 12, align 4
@genrand_int32.mag01 = internal global [2 x i64] [i64 0, i64 2567483615], align 16
@main.init = private unnamed_addr constant [4 x i64] [i64 291, i64 564, i64 837, i64 1110], align 16
@.str = private unnamed_addr constant [30 x i8] c"5 outputs of genrand_int32()\0A\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"%u \00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

define void @init_genrand(i64 %s) nounwind uwtable {
entry:
  %s.addr = alloca i64, align 8
  store i64 %s, i64* %s.addr, align 8
  %0 = load i64* %s.addr, align 8
  %and = and i64 %0, 4294967295
  store i64 %and, i64* getelementptr inbounds ([11 x i64]* @mt, i32 0, i64 0), align 8
  store i32 1, i32* @mti, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32* @mti, align 4
  %cmp = icmp slt i32 %1, 11
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32* @mti, align 4
  %sub = sub nsw i32 %2, 1
  %idxprom = sext i32 %sub to i64
  %arrayidx = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom
  %3 = load i64* %arrayidx, align 8
  %4 = load i32* @mti, align 4
  %sub1 = sub nsw i32 %4, 1
  %idxprom2 = sext i32 %sub1 to i64
  %arrayidx3 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom2
  %5 = load i64* %arrayidx3, align 8
  %shr = lshr i64 %5, 30
  %xor = xor i64 %3, %shr
  %mul = mul i64 1812433253, %xor
  %6 = load i32* @mti, align 4
  %conv = sext i32 %6 to i64
  %add = add i64 %mul, %conv
  %7 = load i32* @mti, align 4
  %idxprom4 = sext i32 %7 to i64
  %arrayidx5 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom4
  store i64 %add, i64* %arrayidx5, align 8
  %8 = load i32* @mti, align 4
  %idxprom6 = sext i32 %8 to i64
  %arrayidx7 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom6
  %9 = load i64* %arrayidx7, align 8
  %and8 = and i64 %9, 4294967295
  store i64 %and8, i64* %arrayidx7, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %10 = load i32* @mti, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* @mti, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

define void @init_by_array(i64* %init_key, i32 %key_length) nounwind uwtable {
entry:
  %init_key.addr = alloca i64*, align 8
  %key_length.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i64* %init_key, i64** %init_key.addr, align 8
  store i32 %key_length, i32* %key_length.addr, align 4
  call void @init_genrand(i64 19650218)
  store i32 1, i32* %i, align 4
  store i32 0, i32* %j, align 4
  %0 = load i32* %key_length.addr, align 4
  %cmp = icmp sgt i32 11, %0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  %1 = load i32* %key_length.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 11, %cond.true ], [ %1, %cond.false ]
  store i32 %cond, i32* %k, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %cond.end
  %2 = load i32* %k, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom
  %4 = load i64* %arrayidx, align 8
  %5 = load i32* %i, align 4
  %sub = sub nsw i32 %5, 1
  %idxprom1 = sext i32 %sub to i64
  %arrayidx2 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom1
  %6 = load i64* %arrayidx2, align 8
  %7 = load i32* %i, align 4
  %sub3 = sub nsw i32 %7, 1
  %idxprom4 = sext i32 %sub3 to i64
  %arrayidx5 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom4
  %8 = load i64* %arrayidx5, align 8
  %shr = lshr i64 %8, 30
  %xor = xor i64 %6, %shr
  %mul = mul i64 %xor, 1664525
  %xor6 = xor i64 %4, %mul
  %9 = load i32* %j, align 4
  %idxprom7 = sext i32 %9 to i64
  %10 = load i64** %init_key.addr, align 8
  %arrayidx8 = getelementptr inbounds i64* %10, i64 %idxprom7
  %11 = load i64* %arrayidx8, align 8
  %add = add i64 %xor6, %11
  %12 = load i32* %j, align 4
  %conv = sext i32 %12 to i64
  %add9 = add i64 %add, %conv
  %13 = load i32* %i, align 4
  %idxprom10 = sext i32 %13 to i64
  %arrayidx11 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom10
  store i64 %add9, i64* %arrayidx11, align 8
  %14 = load i32* %i, align 4
  %idxprom12 = sext i32 %14 to i64
  %arrayidx13 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom12
  %15 = load i64* %arrayidx13, align 8
  %and = and i64 %15, 4294967295
  store i64 %and, i64* %arrayidx13, align 8
  %16 = load i32* %i, align 4
  %inc = add nsw i32 %16, 1
  store i32 %inc, i32* %i, align 4
  %17 = load i32* %j, align 4
  %inc14 = add nsw i32 %17, 1
  store i32 %inc14, i32* %j, align 4
  %18 = load i32* %i, align 4
  %cmp15 = icmp sge i32 %18, 11
  br i1 %cmp15, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %19 = load i64* getelementptr inbounds ([11 x i64]* @mt, i32 0, i64 10), align 8
  store i64 %19, i64* getelementptr inbounds ([11 x i64]* @mt, i32 0, i64 0), align 8
  store i32 1, i32* %i, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %20 = load i32* %j, align 4
  %21 = load i32* %key_length.addr, align 4
  %cmp17 = icmp sge i32 %20, %21
  br i1 %cmp17, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.end
  store i32 0, i32* %j, align 4
  br label %if.end20

if.end20:                                         ; preds = %if.then19, %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end20
  %22 = load i32* %k, align 4
  %dec = add nsw i32 %22, -1
  store i32 %dec, i32* %k, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 10, i32* %k, align 4
  br label %for.cond21

for.cond21:                                       ; preds = %for.inc48, %for.end
  %23 = load i32* %k, align 4
  %tobool22 = icmp ne i32 %23, 0
  br i1 %tobool22, label %for.body23, label %for.end50

for.body23:                                       ; preds = %for.cond21
  %24 = load i32* %i, align 4
  %idxprom24 = sext i32 %24 to i64
  %arrayidx25 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom24
  %25 = load i64* %arrayidx25, align 8
  %26 = load i32* %i, align 4
  %sub26 = sub nsw i32 %26, 1
  %idxprom27 = sext i32 %sub26 to i64
  %arrayidx28 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom27
  %27 = load i64* %arrayidx28, align 8
  %28 = load i32* %i, align 4
  %sub29 = sub nsw i32 %28, 1
  %idxprom30 = sext i32 %sub29 to i64
  %arrayidx31 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom30
  %29 = load i64* %arrayidx31, align 8
  %shr32 = lshr i64 %29, 30
  %xor33 = xor i64 %27, %shr32
  %mul34 = mul i64 %xor33, 1566083941
  %xor35 = xor i64 %25, %mul34
  %30 = load i32* %i, align 4
  %conv36 = sext i32 %30 to i64
  %sub37 = sub i64 %xor35, %conv36
  %31 = load i32* %i, align 4
  %idxprom38 = sext i32 %31 to i64
  %arrayidx39 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom38
  store i64 %sub37, i64* %arrayidx39, align 8
  %32 = load i32* %i, align 4
  %idxprom40 = sext i32 %32 to i64
  %arrayidx41 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom40
  %33 = load i64* %arrayidx41, align 8
  %and42 = and i64 %33, 4294967295
  store i64 %and42, i64* %arrayidx41, align 8
  %34 = load i32* %i, align 4
  %inc43 = add nsw i32 %34, 1
  store i32 %inc43, i32* %i, align 4
  %35 = load i32* %i, align 4
  %cmp44 = icmp sge i32 %35, 11
  br i1 %cmp44, label %if.then46, label %if.end47

if.then46:                                        ; preds = %for.body23
  %36 = load i64* getelementptr inbounds ([11 x i64]* @mt, i32 0, i64 10), align 8
  store i64 %36, i64* getelementptr inbounds ([11 x i64]* @mt, i32 0, i64 0), align 8
  store i32 1, i32* %i, align 4
  br label %if.end47

if.end47:                                         ; preds = %if.then46, %for.body23
  br label %for.inc48

for.inc48:                                        ; preds = %if.end47
  %37 = load i32* %k, align 4
  %dec49 = add nsw i32 %37, -1
  store i32 %dec49, i32* %k, align 4
  br label %for.cond21

for.end50:                                        ; preds = %for.cond21
  store i64 2147483648, i64* getelementptr inbounds ([11 x i64]* @mt, i32 0, i64 0), align 8
  ret void
}

define i64 @genrand_int32() nounwind uwtable {
entry:
  %y = alloca i64, align 8
  %kk = alloca i32, align 4
  %0 = load i32* @mti, align 4
  %cmp = icmp sge i32 %0, 11
  br i1 %cmp, label %if.then, label %if.end47

if.then:                                          ; preds = %entry
  %1 = load i32* @mti, align 4
  %cmp1 = icmp eq i32 %1, 12
  br i1 %cmp1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  call void @init_genrand(i64 5489)
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  store i32 0, i32* %kk, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32* %kk, align 4
  %cmp3 = icmp slt i32 %2, 4
  br i1 %cmp3, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32* %kk, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom
  %4 = load i64* %arrayidx, align 8
  %and = and i64 %4, 2147483648
  %5 = load i32* %kk, align 4
  %add = add nsw i32 %5, 1
  %idxprom4 = sext i32 %add to i64
  %arrayidx5 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom4
  %6 = load i64* %arrayidx5, align 8
  %and6 = and i64 %6, 2147483647
  %or = or i64 %and, %and6
  store i64 %or, i64* %y, align 8
  %7 = load i32* %kk, align 4
  %add7 = add nsw i32 %7, 7
  %idxprom8 = sext i32 %add7 to i64
  %arrayidx9 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom8
  %8 = load i64* %arrayidx9, align 8
  %9 = load i64* %y, align 8
  %shr = lshr i64 %9, 1
  %xor = xor i64 %8, %shr
  %10 = load i64* %y, align 8
  %and10 = and i64 %10, 1
  %arrayidx11 = getelementptr inbounds [2 x i64]* @genrand_int32.mag01, i32 0, i64 %and10
  %11 = load i64* %arrayidx11, align 8
  %xor12 = xor i64 %xor, %11
  %12 = load i32* %kk, align 4
  %idxprom13 = sext i32 %12 to i64
  %arrayidx14 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom13
  store i64 %xor12, i64* %arrayidx14, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %13 = load i32* %kk, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %kk, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc36, %for.end
  %14 = load i32* %kk, align 4
  %cmp16 = icmp slt i32 %14, 10
  br i1 %cmp16, label %for.body17, label %for.end38

for.body17:                                       ; preds = %for.cond15
  %15 = load i32* %kk, align 4
  %idxprom18 = sext i32 %15 to i64
  %arrayidx19 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom18
  %16 = load i64* %arrayidx19, align 8
  %and20 = and i64 %16, 2147483648
  %17 = load i32* %kk, align 4
  %add21 = add nsw i32 %17, 1
  %idxprom22 = sext i32 %add21 to i64
  %arrayidx23 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom22
  %18 = load i64* %arrayidx23, align 8
  %and24 = and i64 %18, 2147483647
  %or25 = or i64 %and20, %and24
  store i64 %or25, i64* %y, align 8
  %19 = load i32* %kk, align 4
  %add26 = add nsw i32 %19, -4
  %idxprom27 = sext i32 %add26 to i64
  %arrayidx28 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom27
  %20 = load i64* %arrayidx28, align 8
  %21 = load i64* %y, align 8
  %shr29 = lshr i64 %21, 1
  %xor30 = xor i64 %20, %shr29
  %22 = load i64* %y, align 8
  %and31 = and i64 %22, 1
  %arrayidx32 = getelementptr inbounds [2 x i64]* @genrand_int32.mag01, i32 0, i64 %and31
  %23 = load i64* %arrayidx32, align 8
  %xor33 = xor i64 %xor30, %23
  %24 = load i32* %kk, align 4
  %idxprom34 = sext i32 %24 to i64
  %arrayidx35 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom34
  store i64 %xor33, i64* %arrayidx35, align 8
  br label %for.inc36

for.inc36:                                        ; preds = %for.body17
  %25 = load i32* %kk, align 4
  %inc37 = add nsw i32 %25, 1
  store i32 %inc37, i32* %kk, align 4
  br label %for.cond15

for.end38:                                        ; preds = %for.cond15
  %26 = load i64* getelementptr inbounds ([11 x i64]* @mt, i32 0, i64 10), align 8
  %and39 = and i64 %26, 2147483648
  %27 = load i64* getelementptr inbounds ([11 x i64]* @mt, i32 0, i64 0), align 8
  %and40 = and i64 %27, 2147483647
  %or41 = or i64 %and39, %and40
  store i64 %or41, i64* %y, align 8
  %28 = load i64* getelementptr inbounds ([11 x i64]* @mt, i32 0, i64 6), align 8
  %29 = load i64* %y, align 8
  %shr42 = lshr i64 %29, 1
  %xor43 = xor i64 %28, %shr42
  %30 = load i64* %y, align 8
  %and44 = and i64 %30, 1
  %arrayidx45 = getelementptr inbounds [2 x i64]* @genrand_int32.mag01, i32 0, i64 %and44
  %31 = load i64* %arrayidx45, align 8
  %xor46 = xor i64 %xor43, %31
  store i64 %xor46, i64* getelementptr inbounds ([11 x i64]* @mt, i32 0, i64 10), align 8
  store i32 0, i32* @mti, align 4
  br label %if.end47

if.end47:                                         ; preds = %for.end38, %entry
  %32 = load i32* @mti, align 4
  %inc48 = add nsw i32 %32, 1
  store i32 %inc48, i32* @mti, align 4
  %idxprom49 = sext i32 %32 to i64
  %arrayidx50 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom49
  %33 = load i64* %arrayidx50, align 8
  store i64 %33, i64* %y, align 8
  %34 = load i64* %y, align 8
  %shr51 = lshr i64 %34, 11
  %35 = load i64* %y, align 8
  %xor52 = xor i64 %35, %shr51
  store i64 %xor52, i64* %y, align 8
  %36 = load i64* %y, align 8
  %shl = shl i64 %36, 7
  %and53 = and i64 %shl, 2636928640
  %37 = load i64* %y, align 8
  %xor54 = xor i64 %37, %and53
  store i64 %xor54, i64* %y, align 8
  %38 = load i64* %y, align 8
  %shl55 = shl i64 %38, 15
  %and56 = and i64 %shl55, 4022730752
  %39 = load i64* %y, align 8
  %xor57 = xor i64 %39, %and56
  store i64 %xor57, i64* %y, align 8
  %40 = load i64* %y, align 8
  %shr58 = lshr i64 %40, 18
  %41 = load i64* %y, align 8
  %xor59 = xor i64 %41, %shr58
  store i64 %xor59, i64* %y, align 8
  %42 = load i64* %y, align 8
  ret i64 %42
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %init = alloca [4 x i64], align 16
  %length = alloca i64, align 8
  store i32 0, i32* %retval
  %0 = bitcast [4 x i64]* %init to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([4 x i64]* @main.init to i8*), i64 32, i32 16, i1 false)
  store i64 4, i64* %length, align 8
  %arraydecay = getelementptr inbounds [4 x i64]* %init, i32 0, i32 0
  %1 = load i64* %length, align 8
  %conv = trunc i64 %1 to i32
  call void @init_by_array(i64* %arraydecay, i32 %conv)
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str, i32 0, i32 0))
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32* %i, align 4
  %cmp = icmp slt i32 %2, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %call2 = call i64 @genrand_int32()
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i64 %call2)
  %3 = load i32* %i, align 4
  %rem = srem i32 %3, 5
  %cmp4 = icmp eq i32 %rem, 4
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %4 = load i32* %i, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @printf(i8*, ...)
