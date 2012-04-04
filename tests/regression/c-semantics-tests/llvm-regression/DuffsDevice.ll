; ModuleID = '/home/david/src/c-semantics/tests/llvm-regression/DuffsDevice.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [11 x i8] c"Sum is %d\0A\00", align 1

define void @sum(i16* %to, i16* %from, i32 %count) nounwind uwtable {
entry:
  %to.addr = alloca i16*, align 8
  %from.addr = alloca i16*, align 8
  %count.addr = alloca i32, align 4
  %n = alloca i32, align 4
  store i16* %to, i16** %to.addr, align 8
  store i16* %from, i16** %from.addr, align 8
  store i32 %count, i32* %count.addr, align 4
  %0 = load i32* %count.addr, align 4
  %add = add nsw i32 %0, 7
  %div = sdiv i32 %add, 8
  store i32 %div, i32* %n, align 4
  %1 = load i32* %count.addr, align 4
  %rem = srem i32 %1, 8
  switch i32 %rem, label %sw.epilog [
    i32 0, label %sw.bb
    i32 7, label %sw.bb4
    i32 6, label %sw.bb10
    i32 5, label %sw.bb16
    i32 4, label %sw.bb22
    i32 3, label %sw.bb28
    i32 2, label %sw.bb34
    i32 1, label %sw.bb40
  ]

sw.bb:                                            ; preds = %entry
  br label %do.body

do.body:                                          ; preds = %do.cond, %sw.bb
  %2 = load i16** %from.addr, align 8
  %incdec.ptr = getelementptr inbounds i16* %2, i32 1
  store i16* %incdec.ptr, i16** %from.addr, align 8
  %3 = load i16* %2, align 2
  %conv = sext i16 %3 to i32
  %4 = load i16** %to.addr, align 8
  %5 = load i16* %4, align 2
  %conv1 = sext i16 %5 to i32
  %add2 = add nsw i32 %conv1, %conv
  %conv3 = trunc i32 %add2 to i16
  store i16 %conv3, i16* %4, align 2
  br label %sw.bb4

sw.bb4:                                           ; preds = %entry, %do.body
  %6 = load i16** %from.addr, align 8
  %incdec.ptr5 = getelementptr inbounds i16* %6, i32 1
  store i16* %incdec.ptr5, i16** %from.addr, align 8
  %7 = load i16* %6, align 2
  %conv6 = sext i16 %7 to i32
  %8 = load i16** %to.addr, align 8
  %9 = load i16* %8, align 2
  %conv7 = sext i16 %9 to i32
  %add8 = add nsw i32 %conv7, %conv6
  %conv9 = trunc i32 %add8 to i16
  store i16 %conv9, i16* %8, align 2
  br label %sw.bb10

sw.bb10:                                          ; preds = %entry, %sw.bb4
  %10 = load i16** %from.addr, align 8
  %incdec.ptr11 = getelementptr inbounds i16* %10, i32 1
  store i16* %incdec.ptr11, i16** %from.addr, align 8
  %11 = load i16* %10, align 2
  %conv12 = sext i16 %11 to i32
  %12 = load i16** %to.addr, align 8
  %13 = load i16* %12, align 2
  %conv13 = sext i16 %13 to i32
  %add14 = add nsw i32 %conv13, %conv12
  %conv15 = trunc i32 %add14 to i16
  store i16 %conv15, i16* %12, align 2
  br label %sw.bb16

sw.bb16:                                          ; preds = %entry, %sw.bb10
  %14 = load i16** %from.addr, align 8
  %incdec.ptr17 = getelementptr inbounds i16* %14, i32 1
  store i16* %incdec.ptr17, i16** %from.addr, align 8
  %15 = load i16* %14, align 2
  %conv18 = sext i16 %15 to i32
  %16 = load i16** %to.addr, align 8
  %17 = load i16* %16, align 2
  %conv19 = sext i16 %17 to i32
  %add20 = add nsw i32 %conv19, %conv18
  %conv21 = trunc i32 %add20 to i16
  store i16 %conv21, i16* %16, align 2
  br label %sw.bb22

sw.bb22:                                          ; preds = %entry, %sw.bb16
  %18 = load i16** %from.addr, align 8
  %incdec.ptr23 = getelementptr inbounds i16* %18, i32 1
  store i16* %incdec.ptr23, i16** %from.addr, align 8
  %19 = load i16* %18, align 2
  %conv24 = sext i16 %19 to i32
  %20 = load i16** %to.addr, align 8
  %21 = load i16* %20, align 2
  %conv25 = sext i16 %21 to i32
  %add26 = add nsw i32 %conv25, %conv24
  %conv27 = trunc i32 %add26 to i16
  store i16 %conv27, i16* %20, align 2
  br label %sw.bb28

sw.bb28:                                          ; preds = %entry, %sw.bb22
  %22 = load i16** %from.addr, align 8
  %incdec.ptr29 = getelementptr inbounds i16* %22, i32 1
  store i16* %incdec.ptr29, i16** %from.addr, align 8
  %23 = load i16* %22, align 2
  %conv30 = sext i16 %23 to i32
  %24 = load i16** %to.addr, align 8
  %25 = load i16* %24, align 2
  %conv31 = sext i16 %25 to i32
  %add32 = add nsw i32 %conv31, %conv30
  %conv33 = trunc i32 %add32 to i16
  store i16 %conv33, i16* %24, align 2
  br label %sw.bb34

sw.bb34:                                          ; preds = %entry, %sw.bb28
  %26 = load i16** %from.addr, align 8
  %incdec.ptr35 = getelementptr inbounds i16* %26, i32 1
  store i16* %incdec.ptr35, i16** %from.addr, align 8
  %27 = load i16* %26, align 2
  %conv36 = sext i16 %27 to i32
  %28 = load i16** %to.addr, align 8
  %29 = load i16* %28, align 2
  %conv37 = sext i16 %29 to i32
  %add38 = add nsw i32 %conv37, %conv36
  %conv39 = trunc i32 %add38 to i16
  store i16 %conv39, i16* %28, align 2
  br label %sw.bb40

sw.bb40:                                          ; preds = %entry, %sw.bb34
  %30 = load i16** %from.addr, align 8
  %incdec.ptr41 = getelementptr inbounds i16* %30, i32 1
  store i16* %incdec.ptr41, i16** %from.addr, align 8
  %31 = load i16* %30, align 2
  %conv42 = sext i16 %31 to i32
  %32 = load i16** %to.addr, align 8
  %33 = load i16* %32, align 2
  %conv43 = sext i16 %33 to i32
  %add44 = add nsw i32 %conv43, %conv42
  %conv45 = trunc i32 %add44 to i16
  store i16 %conv45, i16* %32, align 2
  br label %do.cond

do.cond:                                          ; preds = %sw.bb40
  %34 = load i32* %n, align 4
  %dec = add nsw i32 %34, -1
  store i32 %dec, i32* %n, align 4
  %cmp = icmp sgt i32 %dec, 0
  br i1 %cmp, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  br label %sw.epilog

sw.epilog:                                        ; preds = %do.end, %entry
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %Array = alloca [100 x i16], align 16
  %Sum = alloca i16, align 2
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i16 0, i16* %Sum, align 2
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp ne i32 %0, 100
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %conv = trunc i32 %1 to i16
  %2 = load i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds [100 x i16]* %Array, i32 0, i64 %idxprom
  store i16 %conv, i16* %arrayidx, align 2
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load i32* %i, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x i16]* %Array, i32 0, i32 0
  call void (...)* bitcast (void (i16*, i16*, i32)* @sum to void (...)*)(i16* %Sum, i16* %arraydecay, i32 100)
  %4 = load i16* %Sum, align 2
  %conv1 = sext i16 %4 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0), i32 %conv1)
  ret i32 0
}

declare i32 @printf(i8*, ...)
