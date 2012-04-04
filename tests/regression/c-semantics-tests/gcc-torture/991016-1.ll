; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/991016-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @doit(i32 %sel, i32 %n, i8* %p) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %sel.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %p.addr = alloca i8*, align 8
  %p0 = alloca i32*, align 8
  %p1 = alloca i64*, align 8
  %p2 = alloca i64*, align 8
  store i32 %sel, i32* %sel.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %p, i8** %p.addr, align 8
  %0 = load i8** %p.addr, align 8
  %1 = bitcast i8* %0 to i32*
  store i32* %1, i32** %p0, align 8
  %2 = load i8** %p.addr, align 8
  %3 = bitcast i8* %2 to i64*
  store i64* %3, i64** %p1, align 8
  %4 = load i8** %p.addr, align 8
  %5 = bitcast i8* %4 to i64*
  store i64* %5, i64** %p2, align 8
  %6 = load i32* %sel.addr, align 4
  switch i32 %6, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb1
    i32 2, label %sw.bb10
  ]

sw.bb:                                            ; preds = %entry
  br label %do.body

do.body:                                          ; preds = %do.cond, %sw.bb
  %7 = load i32** %p0, align 8
  %8 = load i32* %7, align 4
  %9 = load i32** %p0, align 8
  %10 = load i32* %9, align 4
  %add = add nsw i32 %10, %8
  store i32 %add, i32* %9, align 4
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %11 = load i32* %n.addr, align 4
  %dec = add nsw i32 %11, -1
  store i32 %dec, i32* %n.addr, align 4
  %tobool = icmp ne i32 %dec, 0
  br i1 %tobool, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  %12 = load i32** %p0, align 8
  %13 = load i32* %12, align 4
  %cmp = icmp eq i32 %13, 0
  %conv = zext i1 %cmp to i32
  store i32 %conv, i32* %retval
  br label %return

sw.bb1:                                           ; preds = %entry
  br label %do.body2

do.body2:                                         ; preds = %do.cond4, %sw.bb1
  %14 = load i64** %p1, align 8
  %15 = load i64* %14, align 8
  %16 = load i64** %p1, align 8
  %17 = load i64* %16, align 8
  %add3 = add nsw i64 %17, %15
  store i64 %add3, i64* %16, align 8
  br label %do.cond4

do.cond4:                                         ; preds = %do.body2
  %18 = load i32* %n.addr, align 4
  %dec5 = add nsw i32 %18, -1
  store i32 %dec5, i32* %n.addr, align 4
  %tobool6 = icmp ne i32 %dec5, 0
  br i1 %tobool6, label %do.body2, label %do.end7

do.end7:                                          ; preds = %do.cond4
  %19 = load i64** %p1, align 8
  %20 = load i64* %19, align 8
  %cmp8 = icmp eq i64 %20, 0
  %conv9 = zext i1 %cmp8 to i32
  store i32 %conv9, i32* %retval
  br label %return

sw.bb10:                                          ; preds = %entry
  br label %do.body11

do.body11:                                        ; preds = %do.cond13, %sw.bb10
  %21 = load i64** %p2, align 8
  %22 = load i64* %21, align 8
  %23 = load i64** %p2, align 8
  %24 = load i64* %23, align 8
  %add12 = add nsw i64 %24, %22
  store i64 %add12, i64* %23, align 8
  br label %do.cond13

do.cond13:                                        ; preds = %do.body11
  %25 = load i32* %n.addr, align 4
  %dec14 = add nsw i32 %25, -1
  store i32 %dec14, i32* %n.addr, align 4
  %tobool15 = icmp ne i32 %dec14, 0
  br i1 %tobool15, label %do.body11, label %do.end16

do.end16:                                         ; preds = %do.cond13
  %26 = load i64** %p2, align 8
  %27 = load i64* %26, align 8
  %cmp17 = icmp eq i64 %27, 0
  %conv18 = zext i1 %cmp17 to i32
  store i32 %conv18, i32* %retval
  br label %return

sw.default:                                       ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

return:                                           ; preds = %do.end16, %do.end7, %do.end
  %28 = load i32* %retval
  ret i32 %28
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %v0 = alloca i32, align 4
  %v1 = alloca i64, align 8
  %v2 = alloca i64, align 8
  store i32 0, i32* %retval
  store i32 1, i32* %v0, align 4
  %0 = bitcast i32* %v0 to i8*
  %call = call i32 @doit(i32 0, i32 5, i8* %0)
  store i64 1, i64* %v1, align 8
  %1 = bitcast i64* %v1 to i8*
  %call1 = call i32 @doit(i32 1, i32 5, i8* %1)
  store i64 1, i64* %v2, align 8
  %2 = bitcast i64* %v2 to i8*
  %call2 = call i32 @doit(i32 2, i32 5, i8* %2)
  %3 = load i32* %v0, align 4
  %cmp = icmp ne i32 %3, 32
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %4 = load i64* %v1, align 8
  %cmp3 = icmp ne i64 %4, 32
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end5:                                          ; preds = %if.end
  %5 = load i64* %v2, align 8
  %cmp6 = icmp ne i64 %5, 32
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end5
  call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.end5
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %6 = load i32* %retval
  ret i32 %6
}

declare void @exit(i32) noreturn nounwind
