; ModuleID = '/home/david/src/c-semantics/tests/integration/duffsDevice.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [21 x i8] c"%d: src=%d, dest=%d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %count = alloca i32, align 4
  %src = alloca i32*, align 8
  %dest = alloca i32*, align 8
  %origSrc = alloca i32*, align 8
  %origDest = alloca i32*, align 8
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  %i33 = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 101, i32* %count, align 4
  %0 = load i32* %count, align 4
  %conv = sext i32 %0 to i64
  %mul = mul i64 %conv, 4
  %call = call noalias i8* @malloc(i64 %mul) nounwind
  %1 = bitcast i8* %call to i32*
  store i32* %1, i32** %src, align 8
  %2 = load i32* %count, align 4
  %conv1 = sext i32 %2 to i64
  %mul2 = mul i64 %conv1, 4
  %call3 = call noalias i8* @malloc(i64 %mul2) nounwind
  %3 = bitcast i8* %call3 to i32*
  store i32* %3, i32** %dest, align 8
  %4 = load i32** %src, align 8
  store i32* %4, i32** %origSrc, align 8
  %5 = load i32** %dest, align 8
  store i32* %5, i32** %origDest, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i32* %i, align 4
  %7 = load i32* %count, align 4
  %cmp = icmp slt i32 %6, %7
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %8 = load i32* %i, align 4
  %mul5 = mul nsw i32 %8, 2
  %add = add nsw i32 %mul5, 1
  %9 = load i32* %i, align 4
  %idxprom = sext i32 %9 to i64
  %10 = load i32** %src, align 8
  %arrayidx = getelementptr inbounds i32* %10, i64 %idxprom
  store i32 %add, i32* %arrayidx, align 4
  %11 = load i32* %i, align 4
  %idxprom6 = sext i32 %11 to i64
  %12 = load i32** %dest, align 8
  %arrayidx7 = getelementptr inbounds i32* %12, i64 %idxprom6
  store i32 0, i32* %arrayidx7, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %13 = load i32* %i, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %14 = load i32* %count, align 4
  %add8 = add nsw i32 %14, 7
  %div = sdiv i32 %add8, 8
  store i32 %div, i32* %n, align 4
  %15 = load i32* %count, align 4
  %rem = srem i32 %15, 8
  switch i32 %rem, label %sw.epilog [
    i32 0, label %sw.bb
    i32 7, label %sw.bb10
    i32 6, label %sw.bb13
    i32 5, label %sw.bb16
    i32 4, label %sw.bb19
    i32 3, label %sw.bb22
    i32 2, label %sw.bb25
    i32 1, label %sw.bb28
  ]

sw.bb:                                            ; preds = %for.end
  br label %do.body

do.body:                                          ; preds = %do.cond, %sw.bb
  %16 = load i32** %src, align 8
  %incdec.ptr = getelementptr inbounds i32* %16, i32 1
  store i32* %incdec.ptr, i32** %src, align 8
  %17 = load i32* %16, align 4
  %18 = load i32** %dest, align 8
  %incdec.ptr9 = getelementptr inbounds i32* %18, i32 1
  store i32* %incdec.ptr9, i32** %dest, align 8
  store i32 %17, i32* %18, align 4
  br label %sw.bb10

sw.bb10:                                          ; preds = %for.end, %do.body
  %19 = load i32** %src, align 8
  %incdec.ptr11 = getelementptr inbounds i32* %19, i32 1
  store i32* %incdec.ptr11, i32** %src, align 8
  %20 = load i32* %19, align 4
  %21 = load i32** %dest, align 8
  %incdec.ptr12 = getelementptr inbounds i32* %21, i32 1
  store i32* %incdec.ptr12, i32** %dest, align 8
  store i32 %20, i32* %21, align 4
  br label %sw.bb13

sw.bb13:                                          ; preds = %for.end, %sw.bb10
  %22 = load i32** %src, align 8
  %incdec.ptr14 = getelementptr inbounds i32* %22, i32 1
  store i32* %incdec.ptr14, i32** %src, align 8
  %23 = load i32* %22, align 4
  %24 = load i32** %dest, align 8
  %incdec.ptr15 = getelementptr inbounds i32* %24, i32 1
  store i32* %incdec.ptr15, i32** %dest, align 8
  store i32 %23, i32* %24, align 4
  br label %sw.bb16

sw.bb16:                                          ; preds = %for.end, %sw.bb13
  %25 = load i32** %src, align 8
  %incdec.ptr17 = getelementptr inbounds i32* %25, i32 1
  store i32* %incdec.ptr17, i32** %src, align 8
  %26 = load i32* %25, align 4
  %27 = load i32** %dest, align 8
  %incdec.ptr18 = getelementptr inbounds i32* %27, i32 1
  store i32* %incdec.ptr18, i32** %dest, align 8
  store i32 %26, i32* %27, align 4
  br label %sw.bb19

sw.bb19:                                          ; preds = %for.end, %sw.bb16
  %28 = load i32** %src, align 8
  %incdec.ptr20 = getelementptr inbounds i32* %28, i32 1
  store i32* %incdec.ptr20, i32** %src, align 8
  %29 = load i32* %28, align 4
  %30 = load i32** %dest, align 8
  %incdec.ptr21 = getelementptr inbounds i32* %30, i32 1
  store i32* %incdec.ptr21, i32** %dest, align 8
  store i32 %29, i32* %30, align 4
  br label %sw.bb22

sw.bb22:                                          ; preds = %for.end, %sw.bb19
  %31 = load i32** %src, align 8
  %incdec.ptr23 = getelementptr inbounds i32* %31, i32 1
  store i32* %incdec.ptr23, i32** %src, align 8
  %32 = load i32* %31, align 4
  %33 = load i32** %dest, align 8
  %incdec.ptr24 = getelementptr inbounds i32* %33, i32 1
  store i32* %incdec.ptr24, i32** %dest, align 8
  store i32 %32, i32* %33, align 4
  br label %sw.bb25

sw.bb25:                                          ; preds = %for.end, %sw.bb22
  %34 = load i32** %src, align 8
  %incdec.ptr26 = getelementptr inbounds i32* %34, i32 1
  store i32* %incdec.ptr26, i32** %src, align 8
  %35 = load i32* %34, align 4
  %36 = load i32** %dest, align 8
  %incdec.ptr27 = getelementptr inbounds i32* %36, i32 1
  store i32* %incdec.ptr27, i32** %dest, align 8
  store i32 %35, i32* %36, align 4
  br label %sw.bb28

sw.bb28:                                          ; preds = %for.end, %sw.bb25
  %37 = load i32** %src, align 8
  %incdec.ptr29 = getelementptr inbounds i32* %37, i32 1
  store i32* %incdec.ptr29, i32** %src, align 8
  %38 = load i32* %37, align 4
  %39 = load i32** %dest, align 8
  %incdec.ptr30 = getelementptr inbounds i32* %39, i32 1
  store i32* %incdec.ptr30, i32** %dest, align 8
  store i32 %38, i32* %39, align 4
  br label %do.cond

do.cond:                                          ; preds = %sw.bb28
  %40 = load i32* %n, align 4
  %dec = add nsw i32 %40, -1
  store i32 %dec, i32* %n, align 4
  %cmp31 = icmp sgt i32 %dec, 0
  br i1 %cmp31, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  br label %sw.epilog

sw.epilog:                                        ; preds = %do.end, %for.end
  store i32 0, i32* %i33, align 4
  br label %for.cond34

for.cond34:                                       ; preds = %for.inc43, %sw.epilog
  %41 = load i32* %i33, align 4
  %42 = load i32* %count, align 4
  %cmp35 = icmp slt i32 %41, %42
  br i1 %cmp35, label %for.body37, label %for.end45

for.body37:                                       ; preds = %for.cond34
  %43 = load i32* %i33, align 4
  %44 = load i32* %i33, align 4
  %idxprom38 = sext i32 %44 to i64
  %45 = load i32** %origSrc, align 8
  %arrayidx39 = getelementptr inbounds i32* %45, i64 %idxprom38
  %46 = load i32* %arrayidx39, align 4
  %47 = load i32* %i33, align 4
  %idxprom40 = sext i32 %47 to i64
  %48 = load i32** %origDest, align 8
  %arrayidx41 = getelementptr inbounds i32* %48, i64 %idxprom40
  %49 = load i32* %arrayidx41, align 4
  %call42 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str, i32 0, i32 0), i32 %43, i32 %46, i32 %49)
  br label %for.inc43

for.inc43:                                        ; preds = %for.body37
  %50 = load i32* %i33, align 4
  %inc44 = add nsw i32 %50, 1
  store i32 %inc44, i32* %i33, align 4
  br label %for.cond34

for.end45:                                        ; preds = %for.cond34
  ret i32 0
}

declare noalias i8* @malloc(i64) nounwind

declare i32 @printf(i8*, ...)
