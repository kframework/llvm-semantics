; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20031010-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i64 @foo(i64 %ct, i64 %cf, i1 zeroext %p1, i1 zeroext %p2, i1 zeroext %p3) nounwind uwtable noinline {
entry:
  %ct.addr = alloca i64, align 8
  %cf.addr = alloca i64, align 8
  %p1.addr = alloca i8, align 1
  %p2.addr = alloca i8, align 1
  %p3.addr = alloca i8, align 1
  %diff = alloca i64, align 8
  %tmp = alloca i64, align 8
  store i64 %ct, i64* %ct.addr, align 8
  store i64 %cf, i64* %cf.addr, align 8
  %frombool = zext i1 %p1 to i8
  store i8 %frombool, i8* %p1.addr, align 1
  %frombool1 = zext i1 %p2 to i8
  store i8 %frombool1, i8* %p2.addr, align 1
  %frombool2 = zext i1 %p3 to i8
  store i8 %frombool2, i8* %p3.addr, align 1
  %0 = load i64* %ct.addr, align 8
  %1 = load i64* %cf.addr, align 8
  %sub = sub nsw i64 %0, %1
  store i64 %sub, i64* %diff, align 8
  %2 = load i8* %p1.addr, align 1
  %tobool = trunc i8 %2 to i1
  br i1 %tobool, label %if.then, label %if.end9

if.then:                                          ; preds = %entry
  %3 = load i8* %p2.addr, align 1
  %tobool3 = trunc i8 %3 to i1
  br i1 %tobool3, label %if.then4, label %if.end8

if.then4:                                         ; preds = %if.then
  %4 = load i8* %p3.addr, align 1
  %tobool5 = trunc i8 %4 to i1
  br i1 %tobool5, label %if.then6, label %if.end

if.then6:                                         ; preds = %if.then4
  %5 = load i64* %ct.addr, align 8
  store i64 %5, i64* %tmp, align 8
  %6 = load i64* %cf.addr, align 8
  store i64 %6, i64* %ct.addr, align 8
  %7 = load i64* %tmp, align 8
  store i64 %7, i64* %cf.addr, align 8
  br label %if.end

if.end:                                           ; preds = %if.then6, %if.then4
  %8 = load i64* %ct.addr, align 8
  %9 = load i64* %cf.addr, align 8
  %sub7 = sub nsw i64 %8, %9
  store i64 %sub7, i64* %diff, align 8
  br label %if.end8

if.end8:                                          ; preds = %if.end, %if.then
  %10 = load i64* %diff, align 8
  ret i64 %10

if.end9:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i64 @foo(i64 2, i64 3, i1 zeroext true, i1 zeroext true, i1 zeroext true)
  %cmp = icmp eq i64 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}
