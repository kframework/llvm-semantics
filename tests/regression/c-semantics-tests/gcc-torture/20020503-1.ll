; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020503-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %buf = alloca [128 x i8], align 16
  %p = alloca i8*, align 8
  store i32 0, i32* %retval
  %arraydecay = getelementptr inbounds [128 x i8]* %buf, i32 0, i32 0
  %call = call i8* @inttostr(i64 -1, i8* %arraydecay)
  store i8* %call, i8** %p, align 8
  %0 = load i8** %p, align 8
  %1 = load i8* %0, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp ne i32 %conv, 45
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

define internal i8* @inttostr(i64 %i, i8* %buf) nounwind uwtable {
entry:
  %i.addr = alloca i64, align 8
  %buf.addr = alloca i8*, align 8
  %ui = alloca i64, align 8
  %p = alloca i8*, align 8
  store i64 %i, i64* %i.addr, align 8
  store i8* %buf, i8** %buf.addr, align 8
  %0 = load i64* %i.addr, align 8
  store i64 %0, i64* %ui, align 8
  %1 = load i8** %buf.addr, align 8
  %add.ptr = getelementptr inbounds i8* %1, i64 127
  store i8* %add.ptr, i8** %p, align 8
  %2 = load i8** %p, align 8
  store i8 0, i8* %2, align 1
  %3 = load i64* %i.addr, align 8
  %cmp = icmp slt i64 %3, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load i64* %ui, align 8
  %sub = sub i64 0, %4
  store i64 %sub, i64* %ui, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.end
  %5 = load i64* %ui, align 8
  %rem = urem i64 %5, 10
  %add = add i64 48, %rem
  %conv = trunc i64 %add to i8
  %6 = load i8** %p, align 8
  %incdec.ptr = getelementptr inbounds i8* %6, i32 -1
  store i8* %incdec.ptr, i8** %p, align 8
  store i8 %conv, i8* %incdec.ptr, align 1
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %7 = load i64* %ui, align 8
  %div = udiv i64 %7, 10
  store i64 %div, i64* %ui, align 8
  %cmp1 = icmp ne i64 %div, 0
  br i1 %cmp1, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  %8 = load i64* %i.addr, align 8
  %cmp3 = icmp slt i64 %8, 0
  br i1 %cmp3, label %if.then5, label %if.end7

if.then5:                                         ; preds = %do.end
  %9 = load i8** %p, align 8
  %incdec.ptr6 = getelementptr inbounds i8* %9, i32 -1
  store i8* %incdec.ptr6, i8** %p, align 8
  store i8 45, i8* %incdec.ptr6, align 1
  br label %if.end7

if.end7:                                          ; preds = %if.then5, %do.end
  %10 = load i8** %p, align 8
  ret i8* %10
}

declare void @abort() noreturn nounwind
