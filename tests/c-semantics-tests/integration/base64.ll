; ModuleID = '/home/david/src/c-semantics/tests/integration/base64.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@b64 = global [65 x i8] c"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/\00", align 16
@nbytes = global [4 x i32] [i32 3, i32 1, i32 1, i32 2], align 16
@.str = private unnamed_addr constant [25 x i8] c"TGl0ZXJhdGVQcm9ncmFtcw==\00", align 1

define void @xlate(i8* %in, i32 %phase) nounwind uwtable {
entry:
  %in.addr = alloca i8*, align 8
  %phase.addr = alloca i32, align 4
  %out = alloca [3 x i8], align 1
  %i = alloca i32, align 4
  store i8* %in, i8** %in.addr, align 8
  store i32 %phase, i32* %phase.addr, align 4
  %0 = load i8** %in.addr, align 8
  %arrayidx = getelementptr inbounds i8* %0, i64 0
  %1 = load i8* %arrayidx, align 1
  %conv = zext i8 %1 to i32
  %shl = shl i32 %conv, 2
  %2 = load i8** %in.addr, align 8
  %arrayidx1 = getelementptr inbounds i8* %2, i64 1
  %3 = load i8* %arrayidx1, align 1
  %conv2 = zext i8 %3 to i32
  %shr = ashr i32 %conv2, 4
  %or = or i32 %shl, %shr
  %conv3 = trunc i32 %or to i8
  %arrayidx4 = getelementptr inbounds [3 x i8]* %out, i32 0, i64 0
  store i8 %conv3, i8* %arrayidx4, align 1
  %4 = load i8** %in.addr, align 8
  %arrayidx5 = getelementptr inbounds i8* %4, i64 1
  %5 = load i8* %arrayidx5, align 1
  %conv6 = zext i8 %5 to i32
  %shl7 = shl i32 %conv6, 4
  %6 = load i8** %in.addr, align 8
  %arrayidx8 = getelementptr inbounds i8* %6, i64 2
  %7 = load i8* %arrayidx8, align 1
  %conv9 = zext i8 %7 to i32
  %shr10 = ashr i32 %conv9, 2
  %or11 = or i32 %shl7, %shr10
  %conv12 = trunc i32 %or11 to i8
  %arrayidx13 = getelementptr inbounds [3 x i8]* %out, i32 0, i64 1
  store i8 %conv12, i8* %arrayidx13, align 1
  %8 = load i8** %in.addr, align 8
  %arrayidx14 = getelementptr inbounds i8* %8, i64 2
  %9 = load i8* %arrayidx14, align 1
  %conv15 = zext i8 %9 to i32
  %shl16 = shl i32 %conv15, 6
  %10 = load i8** %in.addr, align 8
  %arrayidx17 = getelementptr inbounds i8* %10, i64 3
  %11 = load i8* %arrayidx17, align 1
  %conv18 = zext i8 %11 to i32
  %shr19 = ashr i32 %conv18, 0
  %or20 = or i32 %shl16, %shr19
  %conv21 = trunc i32 %or20 to i8
  %arrayidx22 = getelementptr inbounds [3 x i8]* %out, i32 0, i64 2
  store i8 %conv21, i8* %arrayidx22, align 1
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %12 = load i32* %i, align 4
  %13 = load i32* %phase.addr, align 4
  %idxprom = sext i32 %13 to i64
  %arrayidx23 = getelementptr inbounds [4 x i32]* @nbytes, i32 0, i64 %idxprom
  %14 = load i32* %arrayidx23, align 4
  %cmp = icmp slt i32 %12, %14
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %15 = load i32* %i, align 4
  %idxprom25 = sext i32 %15 to i64
  %arrayidx26 = getelementptr inbounds [3 x i8]* %out, i32 0, i64 %idxprom25
  %16 = load i8* %arrayidx26, align 1
  %conv27 = zext i8 %16 to i32
  %call = call i32 @putchar(i32 %conv27)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %17 = load i32* %i, align 4
  %inc = add nsw i32 %17, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

declare i32 @putchar(i32)

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %c = alloca i32, align 4
  %phase = alloca i32, align 4
  %in = alloca [4 x i8], align 1
  %p = alloca i8*, align 8
  %input = alloca i8*, align 8
  store i32 0, i32* %retval
  store i32 0, i32* %phase, align 4
  store i8* getelementptr inbounds ([25 x i8]* @.str, i32 0, i32 0), i8** %input, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end15, %entry
  %0 = load i8** %input, align 8
  %incdec.ptr = getelementptr inbounds i8* %0, i32 1
  store i8* %incdec.ptr, i8** %input, align 8
  %1 = load i8* %0, align 1
  %conv = sext i8 %1 to i32
  store i32 %conv, i32* %c, align 4
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load i32* %c, align 4
  %cmp2 = icmp eq i32 %2, 61
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  %arraydecay = getelementptr inbounds [4 x i8]* %in, i32 0, i32 0
  %3 = load i32* %phase, align 4
  call void @xlate(i8* %arraydecay, i32 %3)
  br label %while.end

if.end:                                           ; preds = %while.body
  %4 = load i32* %c, align 4
  %call = call i8* @strchr(i8* getelementptr inbounds ([65 x i8]* @b64, i32 0, i32 0), i32 %4) nounwind readonly
  store i8* %call, i8** %p, align 8
  %5 = load i8** %p, align 8
  %tobool = icmp ne i8* %5, null
  br i1 %tobool, label %if.then4, label %if.end15

if.then4:                                         ; preds = %if.end
  %6 = load i8** %p, align 8
  %sub.ptr.lhs.cast = ptrtoint i8* %6 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, ptrtoint ([65 x i8]* @b64 to i64)
  %conv5 = trunc i64 %sub.ptr.sub to i8
  %7 = load i32* %phase, align 4
  %idxprom = sext i32 %7 to i64
  %arrayidx = getelementptr inbounds [4 x i8]* %in, i32 0, i64 %idxprom
  store i8 %conv5, i8* %arrayidx, align 1
  %8 = load i32* %phase, align 4
  %add = add nsw i32 %8, 1
  %rem = srem i32 %add, 4
  store i32 %rem, i32* %phase, align 4
  %9 = load i32* %phase, align 4
  %cmp6 = icmp eq i32 %9, 0
  br i1 %cmp6, label %if.then8, label %if.end14

if.then8:                                         ; preds = %if.then4
  %arraydecay9 = getelementptr inbounds [4 x i8]* %in, i32 0, i32 0
  %10 = load i32* %phase, align 4
  call void @xlate(i8* %arraydecay9, i32 %10)
  %arrayidx10 = getelementptr inbounds [4 x i8]* %in, i32 0, i64 3
  store i8 0, i8* %arrayidx10, align 1
  %arrayidx11 = getelementptr inbounds [4 x i8]* %in, i32 0, i64 2
  store i8 0, i8* %arrayidx11, align 1
  %arrayidx12 = getelementptr inbounds [4 x i8]* %in, i32 0, i64 1
  store i8 0, i8* %arrayidx12, align 1
  %arrayidx13 = getelementptr inbounds [4 x i8]* %in, i32 0, i64 0
  store i8 0, i8* %arrayidx13, align 1
  br label %if.end14

if.end14:                                         ; preds = %if.then8, %if.then4
  br label %if.end15

if.end15:                                         ; preds = %if.end14, %if.end
  br label %while.cond

while.end:                                        ; preds = %if.then, %while.cond
  ret i32 0
}

declare i8* @strchr(i8*, i32) nounwind readonly
