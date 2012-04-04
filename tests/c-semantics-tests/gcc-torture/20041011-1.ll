; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20041011-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@gvol = common global [32 x i32] zeroinitializer, align 16
@gull = common global i64 0, align 8

define i64 @t1(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %n.addr = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %x1 = alloca i32, align 4
  %x2 = alloca i32, align 4
  %x3 = alloca i32, align 4
  %x4 = alloca i32, align 4
  %x5 = alloca i32, align 4
  %x6 = alloca i32, align 4
  %x7 = alloca i32, align 4
  %x8 = alloca i32, align 4
  %x9 = alloca i32, align 4
  %x10 = alloca i32, align 4
  %x11 = alloca i32, align 4
  %x12 = alloca i32, align 4
  %x13 = alloca i32, align 4
  %x14 = alloca i32, align 4
  %x15 = alloca i32, align 4
  %x16 = alloca i32, align 4
  %x17 = alloca i32, align 4
  %x18 = alloca i32, align 4
  %x19 = alloca i32, align 4
  %x20 = alloca i32, align 4
  %x21 = alloca i32, align 4
  %x22 = alloca i32, align 4
  %x23 = alloca i32, align 4
  %x24 = alloca i32, align 4
  %x25 = alloca i32, align 4
  %x26 = alloca i32, align 4
  %x27 = alloca i32, align 4
  %x28 = alloca i32, align 4
  %x29 = alloca i32, align 4
  %x30 = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store i64 %x, i64* %x.addr, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32* %n.addr, align 4
  %dec = add nsw i32 %0, -1
  store i32 %dec, i32* %n.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  store i32 %1, i32* %x1, align 4
  %2 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  store i32 %2, i32* %x2, align 4
  %3 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  store i32 %3, i32* %x3, align 4
  %4 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  store i32 %4, i32* %x4, align 4
  %5 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  store i32 %5, i32* %x5, align 4
  %6 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  store i32 %6, i32* %x6, align 4
  %7 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  store i32 %7, i32* %x7, align 4
  %8 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  store i32 %8, i32* %x8, align 4
  %9 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  store i32 %9, i32* %x9, align 4
  %10 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  store i32 %10, i32* %x10, align 4
  %11 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  store i32 %11, i32* %x11, align 4
  %12 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  store i32 %12, i32* %x12, align 4
  %13 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  store i32 %13, i32* %x13, align 4
  %14 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  store i32 %14, i32* %x14, align 4
  %15 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  store i32 %15, i32* %x15, align 4
  %16 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  store i32 %16, i32* %x16, align 4
  %17 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  store i32 %17, i32* %x17, align 4
  %18 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  store i32 %18, i32* %x18, align 4
  %19 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  store i32 %19, i32* %x19, align 4
  %20 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  store i32 %20, i32* %x20, align 4
  %21 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  store i32 %21, i32* %x21, align 4
  %22 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  store i32 %22, i32* %x22, align 4
  %23 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  store i32 %23, i32* %x23, align 4
  %24 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  store i32 %24, i32* %x24, align 4
  %25 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  store i32 %25, i32* %x25, align 4
  %26 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  store i32 %26, i32* %x26, align 4
  %27 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  store i32 %27, i32* %x27, align 4
  %28 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  store i32 %28, i32* %x28, align 4
  %29 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  store i32 %29, i32* %x29, align 4
  %30 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  store i32 %30, i32* %x30, align 4
  %31 = load i32* %x1, align 4
  store volatile i32 %31, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  %32 = load i32* %x2, align 4
  store volatile i32 %32, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  %33 = load i32* %x3, align 4
  store volatile i32 %33, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  %34 = load i32* %x4, align 4
  store volatile i32 %34, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  %35 = load i32* %x5, align 4
  store volatile i32 %35, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  %36 = load i32* %x6, align 4
  store volatile i32 %36, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  %37 = load i32* %x7, align 4
  store volatile i32 %37, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  %38 = load i32* %x8, align 4
  store volatile i32 %38, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  %39 = load i32* %x9, align 4
  store volatile i32 %39, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  %40 = load i32* %x10, align 4
  store volatile i32 %40, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  %41 = load i32* %x11, align 4
  store volatile i32 %41, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  %42 = load i32* %x12, align 4
  store volatile i32 %42, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  %43 = load i32* %x13, align 4
  store volatile i32 %43, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  %44 = load i32* %x14, align 4
  store volatile i32 %44, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  %45 = load i32* %x15, align 4
  store volatile i32 %45, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  %46 = load i32* %x16, align 4
  store volatile i32 %46, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  %47 = load i32* %x17, align 4
  store volatile i32 %47, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  %48 = load i32* %x18, align 4
  store volatile i32 %48, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  %49 = load i32* %x19, align 4
  store volatile i32 %49, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  %50 = load i32* %x20, align 4
  store volatile i32 %50, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  %51 = load i32* %x21, align 4
  store volatile i32 %51, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  %52 = load i32* %x22, align 4
  store volatile i32 %52, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  %53 = load i32* %x23, align 4
  store volatile i32 %53, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  %54 = load i32* %x24, align 4
  store volatile i32 %54, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  %55 = load i32* %x25, align 4
  store volatile i32 %55, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  %56 = load i32* %x26, align 4
  store volatile i32 %56, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  %57 = load i32* %x27, align 4
  store volatile i32 %57, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  %58 = load i32* %x28, align 4
  store volatile i32 %58, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  %59 = load i32* %x29, align 4
  store volatile i32 %59, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  %60 = load i32* %x30, align 4
  store volatile i32 %60, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  %61 = load i64* %x.addr, align 8
  %add = add i64 %61, -2048
  store i64 %add, i64* %x.addr, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %62 = load i64* %x.addr, align 8
  ret i64 %62
}

define i64 @t2(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %n.addr = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %x1 = alloca i32, align 4
  %x2 = alloca i32, align 4
  %x3 = alloca i32, align 4
  %x4 = alloca i32, align 4
  %x5 = alloca i32, align 4
  %x6 = alloca i32, align 4
  %x7 = alloca i32, align 4
  %x8 = alloca i32, align 4
  %x9 = alloca i32, align 4
  %x10 = alloca i32, align 4
  %x11 = alloca i32, align 4
  %x12 = alloca i32, align 4
  %x13 = alloca i32, align 4
  %x14 = alloca i32, align 4
  %x15 = alloca i32, align 4
  %x16 = alloca i32, align 4
  %x17 = alloca i32, align 4
  %x18 = alloca i32, align 4
  %x19 = alloca i32, align 4
  %x20 = alloca i32, align 4
  %x21 = alloca i32, align 4
  %x22 = alloca i32, align 4
  %x23 = alloca i32, align 4
  %x24 = alloca i32, align 4
  %x25 = alloca i32, align 4
  %x26 = alloca i32, align 4
  %x27 = alloca i32, align 4
  %x28 = alloca i32, align 4
  %x29 = alloca i32, align 4
  %x30 = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store i64 %x, i64* %x.addr, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32* %n.addr, align 4
  %dec = add nsw i32 %0, -1
  store i32 %dec, i32* %n.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  store i32 %1, i32* %x1, align 4
  %2 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  store i32 %2, i32* %x2, align 4
  %3 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  store i32 %3, i32* %x3, align 4
  %4 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  store i32 %4, i32* %x4, align 4
  %5 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  store i32 %5, i32* %x5, align 4
  %6 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  store i32 %6, i32* %x6, align 4
  %7 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  store i32 %7, i32* %x7, align 4
  %8 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  store i32 %8, i32* %x8, align 4
  %9 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  store i32 %9, i32* %x9, align 4
  %10 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  store i32 %10, i32* %x10, align 4
  %11 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  store i32 %11, i32* %x11, align 4
  %12 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  store i32 %12, i32* %x12, align 4
  %13 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  store i32 %13, i32* %x13, align 4
  %14 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  store i32 %14, i32* %x14, align 4
  %15 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  store i32 %15, i32* %x15, align 4
  %16 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  store i32 %16, i32* %x16, align 4
  %17 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  store i32 %17, i32* %x17, align 4
  %18 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  store i32 %18, i32* %x18, align 4
  %19 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  store i32 %19, i32* %x19, align 4
  %20 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  store i32 %20, i32* %x20, align 4
  %21 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  store i32 %21, i32* %x21, align 4
  %22 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  store i32 %22, i32* %x22, align 4
  %23 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  store i32 %23, i32* %x23, align 4
  %24 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  store i32 %24, i32* %x24, align 4
  %25 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  store i32 %25, i32* %x25, align 4
  %26 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  store i32 %26, i32* %x26, align 4
  %27 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  store i32 %27, i32* %x27, align 4
  %28 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  store i32 %28, i32* %x28, align 4
  %29 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  store i32 %29, i32* %x29, align 4
  %30 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  store i32 %30, i32* %x30, align 4
  %31 = load i32* %x1, align 4
  store volatile i32 %31, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  %32 = load i32* %x2, align 4
  store volatile i32 %32, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  %33 = load i32* %x3, align 4
  store volatile i32 %33, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  %34 = load i32* %x4, align 4
  store volatile i32 %34, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  %35 = load i32* %x5, align 4
  store volatile i32 %35, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  %36 = load i32* %x6, align 4
  store volatile i32 %36, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  %37 = load i32* %x7, align 4
  store volatile i32 %37, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  %38 = load i32* %x8, align 4
  store volatile i32 %38, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  %39 = load i32* %x9, align 4
  store volatile i32 %39, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  %40 = load i32* %x10, align 4
  store volatile i32 %40, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  %41 = load i32* %x11, align 4
  store volatile i32 %41, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  %42 = load i32* %x12, align 4
  store volatile i32 %42, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  %43 = load i32* %x13, align 4
  store volatile i32 %43, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  %44 = load i32* %x14, align 4
  store volatile i32 %44, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  %45 = load i32* %x15, align 4
  store volatile i32 %45, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  %46 = load i32* %x16, align 4
  store volatile i32 %46, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  %47 = load i32* %x17, align 4
  store volatile i32 %47, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  %48 = load i32* %x18, align 4
  store volatile i32 %48, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  %49 = load i32* %x19, align 4
  store volatile i32 %49, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  %50 = load i32* %x20, align 4
  store volatile i32 %50, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  %51 = load i32* %x21, align 4
  store volatile i32 %51, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  %52 = load i32* %x22, align 4
  store volatile i32 %52, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  %53 = load i32* %x23, align 4
  store volatile i32 %53, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  %54 = load i32* %x24, align 4
  store volatile i32 %54, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  %55 = load i32* %x25, align 4
  store volatile i32 %55, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  %56 = load i32* %x26, align 4
  store volatile i32 %56, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  %57 = load i32* %x27, align 4
  store volatile i32 %57, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  %58 = load i32* %x28, align 4
  store volatile i32 %58, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  %59 = load i32* %x29, align 4
  store volatile i32 %59, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  %60 = load i32* %x30, align 4
  store volatile i32 %60, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  %61 = load i64* %x.addr, align 8
  %add = add i64 %61, -513
  store i64 %add, i64* %x.addr, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %62 = load i64* %x.addr, align 8
  ret i64 %62
}

define i64 @t3(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %n.addr = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %x1 = alloca i32, align 4
  %x2 = alloca i32, align 4
  %x3 = alloca i32, align 4
  %x4 = alloca i32, align 4
  %x5 = alloca i32, align 4
  %x6 = alloca i32, align 4
  %x7 = alloca i32, align 4
  %x8 = alloca i32, align 4
  %x9 = alloca i32, align 4
  %x10 = alloca i32, align 4
  %x11 = alloca i32, align 4
  %x12 = alloca i32, align 4
  %x13 = alloca i32, align 4
  %x14 = alloca i32, align 4
  %x15 = alloca i32, align 4
  %x16 = alloca i32, align 4
  %x17 = alloca i32, align 4
  %x18 = alloca i32, align 4
  %x19 = alloca i32, align 4
  %x20 = alloca i32, align 4
  %x21 = alloca i32, align 4
  %x22 = alloca i32, align 4
  %x23 = alloca i32, align 4
  %x24 = alloca i32, align 4
  %x25 = alloca i32, align 4
  %x26 = alloca i32, align 4
  %x27 = alloca i32, align 4
  %x28 = alloca i32, align 4
  %x29 = alloca i32, align 4
  %x30 = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store i64 %x, i64* %x.addr, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32* %n.addr, align 4
  %dec = add nsw i32 %0, -1
  store i32 %dec, i32* %n.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  store i32 %1, i32* %x1, align 4
  %2 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  store i32 %2, i32* %x2, align 4
  %3 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  store i32 %3, i32* %x3, align 4
  %4 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  store i32 %4, i32* %x4, align 4
  %5 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  store i32 %5, i32* %x5, align 4
  %6 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  store i32 %6, i32* %x6, align 4
  %7 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  store i32 %7, i32* %x7, align 4
  %8 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  store i32 %8, i32* %x8, align 4
  %9 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  store i32 %9, i32* %x9, align 4
  %10 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  store i32 %10, i32* %x10, align 4
  %11 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  store i32 %11, i32* %x11, align 4
  %12 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  store i32 %12, i32* %x12, align 4
  %13 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  store i32 %13, i32* %x13, align 4
  %14 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  store i32 %14, i32* %x14, align 4
  %15 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  store i32 %15, i32* %x15, align 4
  %16 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  store i32 %16, i32* %x16, align 4
  %17 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  store i32 %17, i32* %x17, align 4
  %18 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  store i32 %18, i32* %x18, align 4
  %19 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  store i32 %19, i32* %x19, align 4
  %20 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  store i32 %20, i32* %x20, align 4
  %21 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  store i32 %21, i32* %x21, align 4
  %22 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  store i32 %22, i32* %x22, align 4
  %23 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  store i32 %23, i32* %x23, align 4
  %24 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  store i32 %24, i32* %x24, align 4
  %25 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  store i32 %25, i32* %x25, align 4
  %26 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  store i32 %26, i32* %x26, align 4
  %27 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  store i32 %27, i32* %x27, align 4
  %28 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  store i32 %28, i32* %x28, align 4
  %29 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  store i32 %29, i32* %x29, align 4
  %30 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  store i32 %30, i32* %x30, align 4
  %31 = load i32* %x1, align 4
  store volatile i32 %31, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  %32 = load i32* %x2, align 4
  store volatile i32 %32, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  %33 = load i32* %x3, align 4
  store volatile i32 %33, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  %34 = load i32* %x4, align 4
  store volatile i32 %34, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  %35 = load i32* %x5, align 4
  store volatile i32 %35, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  %36 = load i32* %x6, align 4
  store volatile i32 %36, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  %37 = load i32* %x7, align 4
  store volatile i32 %37, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  %38 = load i32* %x8, align 4
  store volatile i32 %38, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  %39 = load i32* %x9, align 4
  store volatile i32 %39, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  %40 = load i32* %x10, align 4
  store volatile i32 %40, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  %41 = load i32* %x11, align 4
  store volatile i32 %41, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  %42 = load i32* %x12, align 4
  store volatile i32 %42, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  %43 = load i32* %x13, align 4
  store volatile i32 %43, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  %44 = load i32* %x14, align 4
  store volatile i32 %44, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  %45 = load i32* %x15, align 4
  store volatile i32 %45, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  %46 = load i32* %x16, align 4
  store volatile i32 %46, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  %47 = load i32* %x17, align 4
  store volatile i32 %47, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  %48 = load i32* %x18, align 4
  store volatile i32 %48, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  %49 = load i32* %x19, align 4
  store volatile i32 %49, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  %50 = load i32* %x20, align 4
  store volatile i32 %50, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  %51 = load i32* %x21, align 4
  store volatile i32 %51, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  %52 = load i32* %x22, align 4
  store volatile i32 %52, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  %53 = load i32* %x23, align 4
  store volatile i32 %53, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  %54 = load i32* %x24, align 4
  store volatile i32 %54, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  %55 = load i32* %x25, align 4
  store volatile i32 %55, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  %56 = load i32* %x26, align 4
  store volatile i32 %56, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  %57 = load i32* %x27, align 4
  store volatile i32 %57, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  %58 = load i32* %x28, align 4
  store volatile i32 %58, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  %59 = load i32* %x29, align 4
  store volatile i32 %59, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  %60 = load i32* %x30, align 4
  store volatile i32 %60, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  %61 = load i64* %x.addr, align 8
  %add = add i64 %61, -512
  store i64 %add, i64* %x.addr, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %62 = load i64* %x.addr, align 8
  ret i64 %62
}

define i64 @t4(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %n.addr = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %x1 = alloca i32, align 4
  %x2 = alloca i32, align 4
  %x3 = alloca i32, align 4
  %x4 = alloca i32, align 4
  %x5 = alloca i32, align 4
  %x6 = alloca i32, align 4
  %x7 = alloca i32, align 4
  %x8 = alloca i32, align 4
  %x9 = alloca i32, align 4
  %x10 = alloca i32, align 4
  %x11 = alloca i32, align 4
  %x12 = alloca i32, align 4
  %x13 = alloca i32, align 4
  %x14 = alloca i32, align 4
  %x15 = alloca i32, align 4
  %x16 = alloca i32, align 4
  %x17 = alloca i32, align 4
  %x18 = alloca i32, align 4
  %x19 = alloca i32, align 4
  %x20 = alloca i32, align 4
  %x21 = alloca i32, align 4
  %x22 = alloca i32, align 4
  %x23 = alloca i32, align 4
  %x24 = alloca i32, align 4
  %x25 = alloca i32, align 4
  %x26 = alloca i32, align 4
  %x27 = alloca i32, align 4
  %x28 = alloca i32, align 4
  %x29 = alloca i32, align 4
  %x30 = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store i64 %x, i64* %x.addr, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32* %n.addr, align 4
  %dec = add nsw i32 %0, -1
  store i32 %dec, i32* %n.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  store i32 %1, i32* %x1, align 4
  %2 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  store i32 %2, i32* %x2, align 4
  %3 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  store i32 %3, i32* %x3, align 4
  %4 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  store i32 %4, i32* %x4, align 4
  %5 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  store i32 %5, i32* %x5, align 4
  %6 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  store i32 %6, i32* %x6, align 4
  %7 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  store i32 %7, i32* %x7, align 4
  %8 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  store i32 %8, i32* %x8, align 4
  %9 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  store i32 %9, i32* %x9, align 4
  %10 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  store i32 %10, i32* %x10, align 4
  %11 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  store i32 %11, i32* %x11, align 4
  %12 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  store i32 %12, i32* %x12, align 4
  %13 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  store i32 %13, i32* %x13, align 4
  %14 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  store i32 %14, i32* %x14, align 4
  %15 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  store i32 %15, i32* %x15, align 4
  %16 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  store i32 %16, i32* %x16, align 4
  %17 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  store i32 %17, i32* %x17, align 4
  %18 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  store i32 %18, i32* %x18, align 4
  %19 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  store i32 %19, i32* %x19, align 4
  %20 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  store i32 %20, i32* %x20, align 4
  %21 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  store i32 %21, i32* %x21, align 4
  %22 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  store i32 %22, i32* %x22, align 4
  %23 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  store i32 %23, i32* %x23, align 4
  %24 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  store i32 %24, i32* %x24, align 4
  %25 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  store i32 %25, i32* %x25, align 4
  %26 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  store i32 %26, i32* %x26, align 4
  %27 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  store i32 %27, i32* %x27, align 4
  %28 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  store i32 %28, i32* %x28, align 4
  %29 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  store i32 %29, i32* %x29, align 4
  %30 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  store i32 %30, i32* %x30, align 4
  %31 = load i32* %x1, align 4
  store volatile i32 %31, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  %32 = load i32* %x2, align 4
  store volatile i32 %32, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  %33 = load i32* %x3, align 4
  store volatile i32 %33, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  %34 = load i32* %x4, align 4
  store volatile i32 %34, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  %35 = load i32* %x5, align 4
  store volatile i32 %35, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  %36 = load i32* %x6, align 4
  store volatile i32 %36, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  %37 = load i32* %x7, align 4
  store volatile i32 %37, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  %38 = load i32* %x8, align 4
  store volatile i32 %38, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  %39 = load i32* %x9, align 4
  store volatile i32 %39, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  %40 = load i32* %x10, align 4
  store volatile i32 %40, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  %41 = load i32* %x11, align 4
  store volatile i32 %41, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  %42 = load i32* %x12, align 4
  store volatile i32 %42, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  %43 = load i32* %x13, align 4
  store volatile i32 %43, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  %44 = load i32* %x14, align 4
  store volatile i32 %44, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  %45 = load i32* %x15, align 4
  store volatile i32 %45, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  %46 = load i32* %x16, align 4
  store volatile i32 %46, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  %47 = load i32* %x17, align 4
  store volatile i32 %47, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  %48 = load i32* %x18, align 4
  store volatile i32 %48, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  %49 = load i32* %x19, align 4
  store volatile i32 %49, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  %50 = load i32* %x20, align 4
  store volatile i32 %50, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  %51 = load i32* %x21, align 4
  store volatile i32 %51, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  %52 = load i32* %x22, align 4
  store volatile i32 %52, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  %53 = load i32* %x23, align 4
  store volatile i32 %53, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  %54 = load i32* %x24, align 4
  store volatile i32 %54, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  %55 = load i32* %x25, align 4
  store volatile i32 %55, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  %56 = load i32* %x26, align 4
  store volatile i32 %56, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  %57 = load i32* %x27, align 4
  store volatile i32 %57, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  %58 = load i32* %x28, align 4
  store volatile i32 %58, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  %59 = load i32* %x29, align 4
  store volatile i32 %59, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  %60 = load i32* %x30, align 4
  store volatile i32 %60, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  %61 = load i64* %x.addr, align 8
  %add = add i64 %61, -511
  store i64 %add, i64* %x.addr, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %62 = load i64* %x.addr, align 8
  ret i64 %62
}

define i64 @t5(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %n.addr = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %x1 = alloca i32, align 4
  %x2 = alloca i32, align 4
  %x3 = alloca i32, align 4
  %x4 = alloca i32, align 4
  %x5 = alloca i32, align 4
  %x6 = alloca i32, align 4
  %x7 = alloca i32, align 4
  %x8 = alloca i32, align 4
  %x9 = alloca i32, align 4
  %x10 = alloca i32, align 4
  %x11 = alloca i32, align 4
  %x12 = alloca i32, align 4
  %x13 = alloca i32, align 4
  %x14 = alloca i32, align 4
  %x15 = alloca i32, align 4
  %x16 = alloca i32, align 4
  %x17 = alloca i32, align 4
  %x18 = alloca i32, align 4
  %x19 = alloca i32, align 4
  %x20 = alloca i32, align 4
  %x21 = alloca i32, align 4
  %x22 = alloca i32, align 4
  %x23 = alloca i32, align 4
  %x24 = alloca i32, align 4
  %x25 = alloca i32, align 4
  %x26 = alloca i32, align 4
  %x27 = alloca i32, align 4
  %x28 = alloca i32, align 4
  %x29 = alloca i32, align 4
  %x30 = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store i64 %x, i64* %x.addr, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32* %n.addr, align 4
  %dec = add nsw i32 %0, -1
  store i32 %dec, i32* %n.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  store i32 %1, i32* %x1, align 4
  %2 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  store i32 %2, i32* %x2, align 4
  %3 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  store i32 %3, i32* %x3, align 4
  %4 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  store i32 %4, i32* %x4, align 4
  %5 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  store i32 %5, i32* %x5, align 4
  %6 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  store i32 %6, i32* %x6, align 4
  %7 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  store i32 %7, i32* %x7, align 4
  %8 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  store i32 %8, i32* %x8, align 4
  %9 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  store i32 %9, i32* %x9, align 4
  %10 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  store i32 %10, i32* %x10, align 4
  %11 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  store i32 %11, i32* %x11, align 4
  %12 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  store i32 %12, i32* %x12, align 4
  %13 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  store i32 %13, i32* %x13, align 4
  %14 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  store i32 %14, i32* %x14, align 4
  %15 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  store i32 %15, i32* %x15, align 4
  %16 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  store i32 %16, i32* %x16, align 4
  %17 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  store i32 %17, i32* %x17, align 4
  %18 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  store i32 %18, i32* %x18, align 4
  %19 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  store i32 %19, i32* %x19, align 4
  %20 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  store i32 %20, i32* %x20, align 4
  %21 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  store i32 %21, i32* %x21, align 4
  %22 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  store i32 %22, i32* %x22, align 4
  %23 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  store i32 %23, i32* %x23, align 4
  %24 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  store i32 %24, i32* %x24, align 4
  %25 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  store i32 %25, i32* %x25, align 4
  %26 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  store i32 %26, i32* %x26, align 4
  %27 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  store i32 %27, i32* %x27, align 4
  %28 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  store i32 %28, i32* %x28, align 4
  %29 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  store i32 %29, i32* %x29, align 4
  %30 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  store i32 %30, i32* %x30, align 4
  %31 = load i32* %x1, align 4
  store volatile i32 %31, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  %32 = load i32* %x2, align 4
  store volatile i32 %32, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  %33 = load i32* %x3, align 4
  store volatile i32 %33, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  %34 = load i32* %x4, align 4
  store volatile i32 %34, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  %35 = load i32* %x5, align 4
  store volatile i32 %35, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  %36 = load i32* %x6, align 4
  store volatile i32 %36, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  %37 = load i32* %x7, align 4
  store volatile i32 %37, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  %38 = load i32* %x8, align 4
  store volatile i32 %38, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  %39 = load i32* %x9, align 4
  store volatile i32 %39, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  %40 = load i32* %x10, align 4
  store volatile i32 %40, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  %41 = load i32* %x11, align 4
  store volatile i32 %41, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  %42 = load i32* %x12, align 4
  store volatile i32 %42, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  %43 = load i32* %x13, align 4
  store volatile i32 %43, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  %44 = load i32* %x14, align 4
  store volatile i32 %44, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  %45 = load i32* %x15, align 4
  store volatile i32 %45, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  %46 = load i32* %x16, align 4
  store volatile i32 %46, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  %47 = load i32* %x17, align 4
  store volatile i32 %47, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  %48 = load i32* %x18, align 4
  store volatile i32 %48, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  %49 = load i32* %x19, align 4
  store volatile i32 %49, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  %50 = load i32* %x20, align 4
  store volatile i32 %50, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  %51 = load i32* %x21, align 4
  store volatile i32 %51, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  %52 = load i32* %x22, align 4
  store volatile i32 %52, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  %53 = load i32* %x23, align 4
  store volatile i32 %53, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  %54 = load i32* %x24, align 4
  store volatile i32 %54, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  %55 = load i32* %x25, align 4
  store volatile i32 %55, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  %56 = load i32* %x26, align 4
  store volatile i32 %56, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  %57 = load i32* %x27, align 4
  store volatile i32 %57, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  %58 = load i32* %x28, align 4
  store volatile i32 %58, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  %59 = load i32* %x29, align 4
  store volatile i32 %59, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  %60 = load i32* %x30, align 4
  store volatile i32 %60, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  %61 = load i64* %x.addr, align 8
  %add = add i64 %61, -1
  store i64 %add, i64* %x.addr, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %62 = load i64* %x.addr, align 8
  ret i64 %62
}

define i64 @t6(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %n.addr = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %x1 = alloca i32, align 4
  %x2 = alloca i32, align 4
  %x3 = alloca i32, align 4
  %x4 = alloca i32, align 4
  %x5 = alloca i32, align 4
  %x6 = alloca i32, align 4
  %x7 = alloca i32, align 4
  %x8 = alloca i32, align 4
  %x9 = alloca i32, align 4
  %x10 = alloca i32, align 4
  %x11 = alloca i32, align 4
  %x12 = alloca i32, align 4
  %x13 = alloca i32, align 4
  %x14 = alloca i32, align 4
  %x15 = alloca i32, align 4
  %x16 = alloca i32, align 4
  %x17 = alloca i32, align 4
  %x18 = alloca i32, align 4
  %x19 = alloca i32, align 4
  %x20 = alloca i32, align 4
  %x21 = alloca i32, align 4
  %x22 = alloca i32, align 4
  %x23 = alloca i32, align 4
  %x24 = alloca i32, align 4
  %x25 = alloca i32, align 4
  %x26 = alloca i32, align 4
  %x27 = alloca i32, align 4
  %x28 = alloca i32, align 4
  %x29 = alloca i32, align 4
  %x30 = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store i64 %x, i64* %x.addr, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32* %n.addr, align 4
  %dec = add nsw i32 %0, -1
  store i32 %dec, i32* %n.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  store i32 %1, i32* %x1, align 4
  %2 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  store i32 %2, i32* %x2, align 4
  %3 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  store i32 %3, i32* %x3, align 4
  %4 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  store i32 %4, i32* %x4, align 4
  %5 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  store i32 %5, i32* %x5, align 4
  %6 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  store i32 %6, i32* %x6, align 4
  %7 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  store i32 %7, i32* %x7, align 4
  %8 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  store i32 %8, i32* %x8, align 4
  %9 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  store i32 %9, i32* %x9, align 4
  %10 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  store i32 %10, i32* %x10, align 4
  %11 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  store i32 %11, i32* %x11, align 4
  %12 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  store i32 %12, i32* %x12, align 4
  %13 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  store i32 %13, i32* %x13, align 4
  %14 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  store i32 %14, i32* %x14, align 4
  %15 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  store i32 %15, i32* %x15, align 4
  %16 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  store i32 %16, i32* %x16, align 4
  %17 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  store i32 %17, i32* %x17, align 4
  %18 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  store i32 %18, i32* %x18, align 4
  %19 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  store i32 %19, i32* %x19, align 4
  %20 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  store i32 %20, i32* %x20, align 4
  %21 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  store i32 %21, i32* %x21, align 4
  %22 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  store i32 %22, i32* %x22, align 4
  %23 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  store i32 %23, i32* %x23, align 4
  %24 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  store i32 %24, i32* %x24, align 4
  %25 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  store i32 %25, i32* %x25, align 4
  %26 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  store i32 %26, i32* %x26, align 4
  %27 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  store i32 %27, i32* %x27, align 4
  %28 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  store i32 %28, i32* %x28, align 4
  %29 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  store i32 %29, i32* %x29, align 4
  %30 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  store i32 %30, i32* %x30, align 4
  %31 = load i32* %x1, align 4
  store volatile i32 %31, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  %32 = load i32* %x2, align 4
  store volatile i32 %32, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  %33 = load i32* %x3, align 4
  store volatile i32 %33, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  %34 = load i32* %x4, align 4
  store volatile i32 %34, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  %35 = load i32* %x5, align 4
  store volatile i32 %35, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  %36 = load i32* %x6, align 4
  store volatile i32 %36, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  %37 = load i32* %x7, align 4
  store volatile i32 %37, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  %38 = load i32* %x8, align 4
  store volatile i32 %38, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  %39 = load i32* %x9, align 4
  store volatile i32 %39, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  %40 = load i32* %x10, align 4
  store volatile i32 %40, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  %41 = load i32* %x11, align 4
  store volatile i32 %41, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  %42 = load i32* %x12, align 4
  store volatile i32 %42, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  %43 = load i32* %x13, align 4
  store volatile i32 %43, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  %44 = load i32* %x14, align 4
  store volatile i32 %44, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  %45 = load i32* %x15, align 4
  store volatile i32 %45, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  %46 = load i32* %x16, align 4
  store volatile i32 %46, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  %47 = load i32* %x17, align 4
  store volatile i32 %47, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  %48 = load i32* %x18, align 4
  store volatile i32 %48, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  %49 = load i32* %x19, align 4
  store volatile i32 %49, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  %50 = load i32* %x20, align 4
  store volatile i32 %50, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  %51 = load i32* %x21, align 4
  store volatile i32 %51, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  %52 = load i32* %x22, align 4
  store volatile i32 %52, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  %53 = load i32* %x23, align 4
  store volatile i32 %53, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  %54 = load i32* %x24, align 4
  store volatile i32 %54, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  %55 = load i32* %x25, align 4
  store volatile i32 %55, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  %56 = load i32* %x26, align 4
  store volatile i32 %56, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  %57 = load i32* %x27, align 4
  store volatile i32 %57, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  %58 = load i32* %x28, align 4
  store volatile i32 %58, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  %59 = load i32* %x29, align 4
  store volatile i32 %59, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  %60 = load i32* %x30, align 4
  store volatile i32 %60, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  %61 = load i64* %x.addr, align 8
  %add = add i64 %61, 1
  store i64 %add, i64* %x.addr, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %62 = load i64* %x.addr, align 8
  ret i64 %62
}

define i64 @t7(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %n.addr = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %x1 = alloca i32, align 4
  %x2 = alloca i32, align 4
  %x3 = alloca i32, align 4
  %x4 = alloca i32, align 4
  %x5 = alloca i32, align 4
  %x6 = alloca i32, align 4
  %x7 = alloca i32, align 4
  %x8 = alloca i32, align 4
  %x9 = alloca i32, align 4
  %x10 = alloca i32, align 4
  %x11 = alloca i32, align 4
  %x12 = alloca i32, align 4
  %x13 = alloca i32, align 4
  %x14 = alloca i32, align 4
  %x15 = alloca i32, align 4
  %x16 = alloca i32, align 4
  %x17 = alloca i32, align 4
  %x18 = alloca i32, align 4
  %x19 = alloca i32, align 4
  %x20 = alloca i32, align 4
  %x21 = alloca i32, align 4
  %x22 = alloca i32, align 4
  %x23 = alloca i32, align 4
  %x24 = alloca i32, align 4
  %x25 = alloca i32, align 4
  %x26 = alloca i32, align 4
  %x27 = alloca i32, align 4
  %x28 = alloca i32, align 4
  %x29 = alloca i32, align 4
  %x30 = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store i64 %x, i64* %x.addr, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32* %n.addr, align 4
  %dec = add nsw i32 %0, -1
  store i32 %dec, i32* %n.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  store i32 %1, i32* %x1, align 4
  %2 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  store i32 %2, i32* %x2, align 4
  %3 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  store i32 %3, i32* %x3, align 4
  %4 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  store i32 %4, i32* %x4, align 4
  %5 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  store i32 %5, i32* %x5, align 4
  %6 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  store i32 %6, i32* %x6, align 4
  %7 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  store i32 %7, i32* %x7, align 4
  %8 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  store i32 %8, i32* %x8, align 4
  %9 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  store i32 %9, i32* %x9, align 4
  %10 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  store i32 %10, i32* %x10, align 4
  %11 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  store i32 %11, i32* %x11, align 4
  %12 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  store i32 %12, i32* %x12, align 4
  %13 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  store i32 %13, i32* %x13, align 4
  %14 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  store i32 %14, i32* %x14, align 4
  %15 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  store i32 %15, i32* %x15, align 4
  %16 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  store i32 %16, i32* %x16, align 4
  %17 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  store i32 %17, i32* %x17, align 4
  %18 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  store i32 %18, i32* %x18, align 4
  %19 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  store i32 %19, i32* %x19, align 4
  %20 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  store i32 %20, i32* %x20, align 4
  %21 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  store i32 %21, i32* %x21, align 4
  %22 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  store i32 %22, i32* %x22, align 4
  %23 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  store i32 %23, i32* %x23, align 4
  %24 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  store i32 %24, i32* %x24, align 4
  %25 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  store i32 %25, i32* %x25, align 4
  %26 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  store i32 %26, i32* %x26, align 4
  %27 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  store i32 %27, i32* %x27, align 4
  %28 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  store i32 %28, i32* %x28, align 4
  %29 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  store i32 %29, i32* %x29, align 4
  %30 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  store i32 %30, i32* %x30, align 4
  %31 = load i32* %x1, align 4
  store volatile i32 %31, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  %32 = load i32* %x2, align 4
  store volatile i32 %32, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  %33 = load i32* %x3, align 4
  store volatile i32 %33, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  %34 = load i32* %x4, align 4
  store volatile i32 %34, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  %35 = load i32* %x5, align 4
  store volatile i32 %35, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  %36 = load i32* %x6, align 4
  store volatile i32 %36, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  %37 = load i32* %x7, align 4
  store volatile i32 %37, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  %38 = load i32* %x8, align 4
  store volatile i32 %38, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  %39 = load i32* %x9, align 4
  store volatile i32 %39, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  %40 = load i32* %x10, align 4
  store volatile i32 %40, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  %41 = load i32* %x11, align 4
  store volatile i32 %41, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  %42 = load i32* %x12, align 4
  store volatile i32 %42, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  %43 = load i32* %x13, align 4
  store volatile i32 %43, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  %44 = load i32* %x14, align 4
  store volatile i32 %44, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  %45 = load i32* %x15, align 4
  store volatile i32 %45, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  %46 = load i32* %x16, align 4
  store volatile i32 %46, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  %47 = load i32* %x17, align 4
  store volatile i32 %47, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  %48 = load i32* %x18, align 4
  store volatile i32 %48, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  %49 = load i32* %x19, align 4
  store volatile i32 %49, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  %50 = load i32* %x20, align 4
  store volatile i32 %50, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  %51 = load i32* %x21, align 4
  store volatile i32 %51, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  %52 = load i32* %x22, align 4
  store volatile i32 %52, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  %53 = load i32* %x23, align 4
  store volatile i32 %53, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  %54 = load i32* %x24, align 4
  store volatile i32 %54, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  %55 = load i32* %x25, align 4
  store volatile i32 %55, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  %56 = load i32* %x26, align 4
  store volatile i32 %56, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  %57 = load i32* %x27, align 4
  store volatile i32 %57, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  %58 = load i32* %x28, align 4
  store volatile i32 %58, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  %59 = load i32* %x29, align 4
  store volatile i32 %59, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  %60 = load i32* %x30, align 4
  store volatile i32 %60, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  %61 = load i64* %x.addr, align 8
  %add = add i64 %61, 511
  store i64 %add, i64* %x.addr, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %62 = load i64* %x.addr, align 8
  ret i64 %62
}

define i64 @t8(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %n.addr = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %x1 = alloca i32, align 4
  %x2 = alloca i32, align 4
  %x3 = alloca i32, align 4
  %x4 = alloca i32, align 4
  %x5 = alloca i32, align 4
  %x6 = alloca i32, align 4
  %x7 = alloca i32, align 4
  %x8 = alloca i32, align 4
  %x9 = alloca i32, align 4
  %x10 = alloca i32, align 4
  %x11 = alloca i32, align 4
  %x12 = alloca i32, align 4
  %x13 = alloca i32, align 4
  %x14 = alloca i32, align 4
  %x15 = alloca i32, align 4
  %x16 = alloca i32, align 4
  %x17 = alloca i32, align 4
  %x18 = alloca i32, align 4
  %x19 = alloca i32, align 4
  %x20 = alloca i32, align 4
  %x21 = alloca i32, align 4
  %x22 = alloca i32, align 4
  %x23 = alloca i32, align 4
  %x24 = alloca i32, align 4
  %x25 = alloca i32, align 4
  %x26 = alloca i32, align 4
  %x27 = alloca i32, align 4
  %x28 = alloca i32, align 4
  %x29 = alloca i32, align 4
  %x30 = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store i64 %x, i64* %x.addr, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32* %n.addr, align 4
  %dec = add nsw i32 %0, -1
  store i32 %dec, i32* %n.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  store i32 %1, i32* %x1, align 4
  %2 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  store i32 %2, i32* %x2, align 4
  %3 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  store i32 %3, i32* %x3, align 4
  %4 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  store i32 %4, i32* %x4, align 4
  %5 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  store i32 %5, i32* %x5, align 4
  %6 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  store i32 %6, i32* %x6, align 4
  %7 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  store i32 %7, i32* %x7, align 4
  %8 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  store i32 %8, i32* %x8, align 4
  %9 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  store i32 %9, i32* %x9, align 4
  %10 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  store i32 %10, i32* %x10, align 4
  %11 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  store i32 %11, i32* %x11, align 4
  %12 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  store i32 %12, i32* %x12, align 4
  %13 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  store i32 %13, i32* %x13, align 4
  %14 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  store i32 %14, i32* %x14, align 4
  %15 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  store i32 %15, i32* %x15, align 4
  %16 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  store i32 %16, i32* %x16, align 4
  %17 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  store i32 %17, i32* %x17, align 4
  %18 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  store i32 %18, i32* %x18, align 4
  %19 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  store i32 %19, i32* %x19, align 4
  %20 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  store i32 %20, i32* %x20, align 4
  %21 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  store i32 %21, i32* %x21, align 4
  %22 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  store i32 %22, i32* %x22, align 4
  %23 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  store i32 %23, i32* %x23, align 4
  %24 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  store i32 %24, i32* %x24, align 4
  %25 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  store i32 %25, i32* %x25, align 4
  %26 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  store i32 %26, i32* %x26, align 4
  %27 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  store i32 %27, i32* %x27, align 4
  %28 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  store i32 %28, i32* %x28, align 4
  %29 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  store i32 %29, i32* %x29, align 4
  %30 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  store i32 %30, i32* %x30, align 4
  %31 = load i32* %x1, align 4
  store volatile i32 %31, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  %32 = load i32* %x2, align 4
  store volatile i32 %32, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  %33 = load i32* %x3, align 4
  store volatile i32 %33, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  %34 = load i32* %x4, align 4
  store volatile i32 %34, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  %35 = load i32* %x5, align 4
  store volatile i32 %35, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  %36 = load i32* %x6, align 4
  store volatile i32 %36, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  %37 = load i32* %x7, align 4
  store volatile i32 %37, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  %38 = load i32* %x8, align 4
  store volatile i32 %38, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  %39 = load i32* %x9, align 4
  store volatile i32 %39, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  %40 = load i32* %x10, align 4
  store volatile i32 %40, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  %41 = load i32* %x11, align 4
  store volatile i32 %41, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  %42 = load i32* %x12, align 4
  store volatile i32 %42, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  %43 = load i32* %x13, align 4
  store volatile i32 %43, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  %44 = load i32* %x14, align 4
  store volatile i32 %44, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  %45 = load i32* %x15, align 4
  store volatile i32 %45, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  %46 = load i32* %x16, align 4
  store volatile i32 %46, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  %47 = load i32* %x17, align 4
  store volatile i32 %47, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  %48 = load i32* %x18, align 4
  store volatile i32 %48, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  %49 = load i32* %x19, align 4
  store volatile i32 %49, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  %50 = load i32* %x20, align 4
  store volatile i32 %50, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  %51 = load i32* %x21, align 4
  store volatile i32 %51, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  %52 = load i32* %x22, align 4
  store volatile i32 %52, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  %53 = load i32* %x23, align 4
  store volatile i32 %53, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  %54 = load i32* %x24, align 4
  store volatile i32 %54, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  %55 = load i32* %x25, align 4
  store volatile i32 %55, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  %56 = load i32* %x26, align 4
  store volatile i32 %56, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  %57 = load i32* %x27, align 4
  store volatile i32 %57, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  %58 = load i32* %x28, align 4
  store volatile i32 %58, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  %59 = load i32* %x29, align 4
  store volatile i32 %59, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  %60 = load i32* %x30, align 4
  store volatile i32 %60, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  %61 = load i64* %x.addr, align 8
  %add = add i64 %61, 512
  store i64 %add, i64* %x.addr, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %62 = load i64* %x.addr, align 8
  ret i64 %62
}

define i64 @t9(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %n.addr = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %x1 = alloca i32, align 4
  %x2 = alloca i32, align 4
  %x3 = alloca i32, align 4
  %x4 = alloca i32, align 4
  %x5 = alloca i32, align 4
  %x6 = alloca i32, align 4
  %x7 = alloca i32, align 4
  %x8 = alloca i32, align 4
  %x9 = alloca i32, align 4
  %x10 = alloca i32, align 4
  %x11 = alloca i32, align 4
  %x12 = alloca i32, align 4
  %x13 = alloca i32, align 4
  %x14 = alloca i32, align 4
  %x15 = alloca i32, align 4
  %x16 = alloca i32, align 4
  %x17 = alloca i32, align 4
  %x18 = alloca i32, align 4
  %x19 = alloca i32, align 4
  %x20 = alloca i32, align 4
  %x21 = alloca i32, align 4
  %x22 = alloca i32, align 4
  %x23 = alloca i32, align 4
  %x24 = alloca i32, align 4
  %x25 = alloca i32, align 4
  %x26 = alloca i32, align 4
  %x27 = alloca i32, align 4
  %x28 = alloca i32, align 4
  %x29 = alloca i32, align 4
  %x30 = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store i64 %x, i64* %x.addr, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32* %n.addr, align 4
  %dec = add nsw i32 %0, -1
  store i32 %dec, i32* %n.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  store i32 %1, i32* %x1, align 4
  %2 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  store i32 %2, i32* %x2, align 4
  %3 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  store i32 %3, i32* %x3, align 4
  %4 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  store i32 %4, i32* %x4, align 4
  %5 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  store i32 %5, i32* %x5, align 4
  %6 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  store i32 %6, i32* %x6, align 4
  %7 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  store i32 %7, i32* %x7, align 4
  %8 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  store i32 %8, i32* %x8, align 4
  %9 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  store i32 %9, i32* %x9, align 4
  %10 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  store i32 %10, i32* %x10, align 4
  %11 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  store i32 %11, i32* %x11, align 4
  %12 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  store i32 %12, i32* %x12, align 4
  %13 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  store i32 %13, i32* %x13, align 4
  %14 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  store i32 %14, i32* %x14, align 4
  %15 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  store i32 %15, i32* %x15, align 4
  %16 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  store i32 %16, i32* %x16, align 4
  %17 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  store i32 %17, i32* %x17, align 4
  %18 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  store i32 %18, i32* %x18, align 4
  %19 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  store i32 %19, i32* %x19, align 4
  %20 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  store i32 %20, i32* %x20, align 4
  %21 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  store i32 %21, i32* %x21, align 4
  %22 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  store i32 %22, i32* %x22, align 4
  %23 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  store i32 %23, i32* %x23, align 4
  %24 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  store i32 %24, i32* %x24, align 4
  %25 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  store i32 %25, i32* %x25, align 4
  %26 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  store i32 %26, i32* %x26, align 4
  %27 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  store i32 %27, i32* %x27, align 4
  %28 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  store i32 %28, i32* %x28, align 4
  %29 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  store i32 %29, i32* %x29, align 4
  %30 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  store i32 %30, i32* %x30, align 4
  %31 = load i32* %x1, align 4
  store volatile i32 %31, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  %32 = load i32* %x2, align 4
  store volatile i32 %32, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  %33 = load i32* %x3, align 4
  store volatile i32 %33, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  %34 = load i32* %x4, align 4
  store volatile i32 %34, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  %35 = load i32* %x5, align 4
  store volatile i32 %35, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  %36 = load i32* %x6, align 4
  store volatile i32 %36, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  %37 = load i32* %x7, align 4
  store volatile i32 %37, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  %38 = load i32* %x8, align 4
  store volatile i32 %38, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  %39 = load i32* %x9, align 4
  store volatile i32 %39, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  %40 = load i32* %x10, align 4
  store volatile i32 %40, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  %41 = load i32* %x11, align 4
  store volatile i32 %41, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  %42 = load i32* %x12, align 4
  store volatile i32 %42, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  %43 = load i32* %x13, align 4
  store volatile i32 %43, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  %44 = load i32* %x14, align 4
  store volatile i32 %44, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  %45 = load i32* %x15, align 4
  store volatile i32 %45, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  %46 = load i32* %x16, align 4
  store volatile i32 %46, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  %47 = load i32* %x17, align 4
  store volatile i32 %47, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  %48 = load i32* %x18, align 4
  store volatile i32 %48, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  %49 = load i32* %x19, align 4
  store volatile i32 %49, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  %50 = load i32* %x20, align 4
  store volatile i32 %50, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  %51 = load i32* %x21, align 4
  store volatile i32 %51, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  %52 = load i32* %x22, align 4
  store volatile i32 %52, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  %53 = load i32* %x23, align 4
  store volatile i32 %53, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  %54 = load i32* %x24, align 4
  store volatile i32 %54, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  %55 = load i32* %x25, align 4
  store volatile i32 %55, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  %56 = load i32* %x26, align 4
  store volatile i32 %56, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  %57 = load i32* %x27, align 4
  store volatile i32 %57, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  %58 = load i32* %x28, align 4
  store volatile i32 %58, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  %59 = load i32* %x29, align 4
  store volatile i32 %59, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  %60 = load i32* %x30, align 4
  store volatile i32 %60, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  %61 = load i64* %x.addr, align 8
  %add = add i64 %61, 513
  store i64 %add, i64* %x.addr, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %62 = load i64* %x.addr, align 8
  ret i64 %62
}

define i64 @t10(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %n.addr = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %x1 = alloca i32, align 4
  %x2 = alloca i32, align 4
  %x3 = alloca i32, align 4
  %x4 = alloca i32, align 4
  %x5 = alloca i32, align 4
  %x6 = alloca i32, align 4
  %x7 = alloca i32, align 4
  %x8 = alloca i32, align 4
  %x9 = alloca i32, align 4
  %x10 = alloca i32, align 4
  %x11 = alloca i32, align 4
  %x12 = alloca i32, align 4
  %x13 = alloca i32, align 4
  %x14 = alloca i32, align 4
  %x15 = alloca i32, align 4
  %x16 = alloca i32, align 4
  %x17 = alloca i32, align 4
  %x18 = alloca i32, align 4
  %x19 = alloca i32, align 4
  %x20 = alloca i32, align 4
  %x21 = alloca i32, align 4
  %x22 = alloca i32, align 4
  %x23 = alloca i32, align 4
  %x24 = alloca i32, align 4
  %x25 = alloca i32, align 4
  %x26 = alloca i32, align 4
  %x27 = alloca i32, align 4
  %x28 = alloca i32, align 4
  %x29 = alloca i32, align 4
  %x30 = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store i64 %x, i64* %x.addr, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32* %n.addr, align 4
  %dec = add nsw i32 %0, -1
  store i32 %dec, i32* %n.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  store i32 %1, i32* %x1, align 4
  %2 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  store i32 %2, i32* %x2, align 4
  %3 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  store i32 %3, i32* %x3, align 4
  %4 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  store i32 %4, i32* %x4, align 4
  %5 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  store i32 %5, i32* %x5, align 4
  %6 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  store i32 %6, i32* %x6, align 4
  %7 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  store i32 %7, i32* %x7, align 4
  %8 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  store i32 %8, i32* %x8, align 4
  %9 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  store i32 %9, i32* %x9, align 4
  %10 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  store i32 %10, i32* %x10, align 4
  %11 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  store i32 %11, i32* %x11, align 4
  %12 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  store i32 %12, i32* %x12, align 4
  %13 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  store i32 %13, i32* %x13, align 4
  %14 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  store i32 %14, i32* %x14, align 4
  %15 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  store i32 %15, i32* %x15, align 4
  %16 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  store i32 %16, i32* %x16, align 4
  %17 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  store i32 %17, i32* %x17, align 4
  %18 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  store i32 %18, i32* %x18, align 4
  %19 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  store i32 %19, i32* %x19, align 4
  %20 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  store i32 %20, i32* %x20, align 4
  %21 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  store i32 %21, i32* %x21, align 4
  %22 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  store i32 %22, i32* %x22, align 4
  %23 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  store i32 %23, i32* %x23, align 4
  %24 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  store i32 %24, i32* %x24, align 4
  %25 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  store i32 %25, i32* %x25, align 4
  %26 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  store i32 %26, i32* %x26, align 4
  %27 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  store i32 %27, i32* %x27, align 4
  %28 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  store i32 %28, i32* %x28, align 4
  %29 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  store i32 %29, i32* %x29, align 4
  %30 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  store i32 %30, i32* %x30, align 4
  %31 = load i32* %x1, align 4
  store volatile i32 %31, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  %32 = load i32* %x2, align 4
  store volatile i32 %32, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  %33 = load i32* %x3, align 4
  store volatile i32 %33, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  %34 = load i32* %x4, align 4
  store volatile i32 %34, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  %35 = load i32* %x5, align 4
  store volatile i32 %35, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  %36 = load i32* %x6, align 4
  store volatile i32 %36, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  %37 = load i32* %x7, align 4
  store volatile i32 %37, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  %38 = load i32* %x8, align 4
  store volatile i32 %38, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  %39 = load i32* %x9, align 4
  store volatile i32 %39, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  %40 = load i32* %x10, align 4
  store volatile i32 %40, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  %41 = load i32* %x11, align 4
  store volatile i32 %41, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  %42 = load i32* %x12, align 4
  store volatile i32 %42, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  %43 = load i32* %x13, align 4
  store volatile i32 %43, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  %44 = load i32* %x14, align 4
  store volatile i32 %44, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  %45 = load i32* %x15, align 4
  store volatile i32 %45, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  %46 = load i32* %x16, align 4
  store volatile i32 %46, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  %47 = load i32* %x17, align 4
  store volatile i32 %47, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  %48 = load i32* %x18, align 4
  store volatile i32 %48, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  %49 = load i32* %x19, align 4
  store volatile i32 %49, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  %50 = load i32* %x20, align 4
  store volatile i32 %50, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  %51 = load i32* %x21, align 4
  store volatile i32 %51, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  %52 = load i32* %x22, align 4
  store volatile i32 %52, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  %53 = load i32* %x23, align 4
  store volatile i32 %53, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  %54 = load i32* %x24, align 4
  store volatile i32 %54, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  %55 = load i32* %x25, align 4
  store volatile i32 %55, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  %56 = load i32* %x26, align 4
  store volatile i32 %56, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  %57 = load i32* %x27, align 4
  store volatile i32 %57, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  %58 = load i32* %x28, align 4
  store volatile i32 %58, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  %59 = load i32* %x29, align 4
  store volatile i32 %59, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  %60 = load i32* %x30, align 4
  store volatile i32 %60, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  %61 = load i64* @gull, align 8
  %62 = load i64* %x.addr, align 8
  %add = add i64 %62, %61
  store i64 %add, i64* %x.addr, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %63 = load i64* %x.addr, align 8
  ret i64 %63
}

define i64 @t11(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %n.addr = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %x1 = alloca i32, align 4
  %x2 = alloca i32, align 4
  %x3 = alloca i32, align 4
  %x4 = alloca i32, align 4
  %x5 = alloca i32, align 4
  %x6 = alloca i32, align 4
  %x7 = alloca i32, align 4
  %x8 = alloca i32, align 4
  %x9 = alloca i32, align 4
  %x10 = alloca i32, align 4
  %x11 = alloca i32, align 4
  %x12 = alloca i32, align 4
  %x13 = alloca i32, align 4
  %x14 = alloca i32, align 4
  %x15 = alloca i32, align 4
  %x16 = alloca i32, align 4
  %x17 = alloca i32, align 4
  %x18 = alloca i32, align 4
  %x19 = alloca i32, align 4
  %x20 = alloca i32, align 4
  %x21 = alloca i32, align 4
  %x22 = alloca i32, align 4
  %x23 = alloca i32, align 4
  %x24 = alloca i32, align 4
  %x25 = alloca i32, align 4
  %x26 = alloca i32, align 4
  %x27 = alloca i32, align 4
  %x28 = alloca i32, align 4
  %x29 = alloca i32, align 4
  %x30 = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store i64 %x, i64* %x.addr, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32* %n.addr, align 4
  %dec = add nsw i32 %0, -1
  store i32 %dec, i32* %n.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  store i32 %1, i32* %x1, align 4
  %2 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  store i32 %2, i32* %x2, align 4
  %3 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  store i32 %3, i32* %x3, align 4
  %4 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  store i32 %4, i32* %x4, align 4
  %5 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  store i32 %5, i32* %x5, align 4
  %6 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  store i32 %6, i32* %x6, align 4
  %7 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  store i32 %7, i32* %x7, align 4
  %8 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  store i32 %8, i32* %x8, align 4
  %9 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  store i32 %9, i32* %x9, align 4
  %10 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  store i32 %10, i32* %x10, align 4
  %11 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  store i32 %11, i32* %x11, align 4
  %12 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  store i32 %12, i32* %x12, align 4
  %13 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  store i32 %13, i32* %x13, align 4
  %14 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  store i32 %14, i32* %x14, align 4
  %15 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  store i32 %15, i32* %x15, align 4
  %16 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  store i32 %16, i32* %x16, align 4
  %17 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  store i32 %17, i32* %x17, align 4
  %18 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  store i32 %18, i32* %x18, align 4
  %19 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  store i32 %19, i32* %x19, align 4
  %20 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  store i32 %20, i32* %x20, align 4
  %21 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  store i32 %21, i32* %x21, align 4
  %22 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  store i32 %22, i32* %x22, align 4
  %23 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  store i32 %23, i32* %x23, align 4
  %24 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  store i32 %24, i32* %x24, align 4
  %25 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  store i32 %25, i32* %x25, align 4
  %26 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  store i32 %26, i32* %x26, align 4
  %27 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  store i32 %27, i32* %x27, align 4
  %28 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  store i32 %28, i32* %x28, align 4
  %29 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  store i32 %29, i32* %x29, align 4
  %30 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  store i32 %30, i32* %x30, align 4
  %31 = load i32* %x1, align 4
  store volatile i32 %31, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  %32 = load i32* %x2, align 4
  store volatile i32 %32, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  %33 = load i32* %x3, align 4
  store volatile i32 %33, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  %34 = load i32* %x4, align 4
  store volatile i32 %34, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  %35 = load i32* %x5, align 4
  store volatile i32 %35, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  %36 = load i32* %x6, align 4
  store volatile i32 %36, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  %37 = load i32* %x7, align 4
  store volatile i32 %37, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  %38 = load i32* %x8, align 4
  store volatile i32 %38, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  %39 = load i32* %x9, align 4
  store volatile i32 %39, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  %40 = load i32* %x10, align 4
  store volatile i32 %40, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  %41 = load i32* %x11, align 4
  store volatile i32 %41, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  %42 = load i32* %x12, align 4
  store volatile i32 %42, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  %43 = load i32* %x13, align 4
  store volatile i32 %43, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  %44 = load i32* %x14, align 4
  store volatile i32 %44, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  %45 = load i32* %x15, align 4
  store volatile i32 %45, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  %46 = load i32* %x16, align 4
  store volatile i32 %46, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  %47 = load i32* %x17, align 4
  store volatile i32 %47, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  %48 = load i32* %x18, align 4
  store volatile i32 %48, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  %49 = load i32* %x19, align 4
  store volatile i32 %49, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  %50 = load i32* %x20, align 4
  store volatile i32 %50, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  %51 = load i32* %x21, align 4
  store volatile i32 %51, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  %52 = load i32* %x22, align 4
  store volatile i32 %52, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  %53 = load i32* %x23, align 4
  store volatile i32 %53, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  %54 = load i32* %x24, align 4
  store volatile i32 %54, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  %55 = load i32* %x25, align 4
  store volatile i32 %55, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  %56 = load i32* %x26, align 4
  store volatile i32 %56, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  %57 = load i32* %x27, align 4
  store volatile i32 %57, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  %58 = load i32* %x28, align 4
  store volatile i32 %58, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  %59 = load i32* %x29, align 4
  store volatile i32 %59, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  %60 = load i32* %x30, align 4
  store volatile i32 %60, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  %61 = load i64* @gull, align 8
  %sub = sub i64 0, %61
  %62 = load i64* %x.addr, align 8
  %add = add i64 %62, %sub
  store i64 %add, i64* %x.addr, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %63 = load i64* %x.addr, align 8
  ret i64 %63
}

define i64 @neg(i64 %x) nounwind uwtable {
entry:
  %x.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  %0 = load i64* %x.addr, align 8
  %sub = sub i64 0, %0
  ret i64 %sub
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i64 100, i64* @gull, align 8
  %call = call i64 @t1(i32 3, i64 -1)
  %cmp = icmp ne i64 %call, -6145
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  %call1 = call i64 @t1(i32 3, i64 4294967295)
  %cmp2 = icmp ne i64 %call1, 4294961151
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn
  unreachable

if.end4:                                          ; preds = %if.end
  %call5 = call i64 @t2(i32 3, i64 -1)
  %cmp6 = icmp ne i64 %call5, -1540
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end4
  call void @abort() noreturn
  unreachable

if.end8:                                          ; preds = %if.end4
  %call9 = call i64 @t2(i32 3, i64 4294967295)
  %cmp10 = icmp ne i64 %call9, 4294965756
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end8
  call void @abort() noreturn
  unreachable

if.end12:                                         ; preds = %if.end8
  %call13 = call i64 @t3(i32 3, i64 -1)
  %cmp14 = icmp ne i64 %call13, -1537
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end12
  call void @abort() noreturn
  unreachable

if.end16:                                         ; preds = %if.end12
  %call17 = call i64 @t3(i32 3, i64 4294967295)
  %cmp18 = icmp ne i64 %call17, 4294965759
  br i1 %cmp18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.end16
  call void @abort() noreturn
  unreachable

if.end20:                                         ; preds = %if.end16
  %call21 = call i64 @t4(i32 3, i64 -1)
  %cmp22 = icmp ne i64 %call21, -1534
  br i1 %cmp22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end20
  call void @abort() noreturn
  unreachable

if.end24:                                         ; preds = %if.end20
  %call25 = call i64 @t4(i32 3, i64 4294967295)
  %cmp26 = icmp ne i64 %call25, 4294965762
  br i1 %cmp26, label %if.then27, label %if.end28

if.then27:                                        ; preds = %if.end24
  call void @abort() noreturn
  unreachable

if.end28:                                         ; preds = %if.end24
  %call29 = call i64 @t5(i32 3, i64 -1)
  %cmp30 = icmp ne i64 %call29, -4
  br i1 %cmp30, label %if.then31, label %if.end32

if.then31:                                        ; preds = %if.end28
  call void @abort() noreturn
  unreachable

if.end32:                                         ; preds = %if.end28
  %call33 = call i64 @t5(i32 3, i64 4294967295)
  %cmp34 = icmp ne i64 %call33, 4294967292
  br i1 %cmp34, label %if.then35, label %if.end36

if.then35:                                        ; preds = %if.end32
  call void @abort() noreturn
  unreachable

if.end36:                                         ; preds = %if.end32
  %call37 = call i64 @t6(i32 3, i64 -1)
  %cmp38 = icmp ne i64 %call37, 2
  br i1 %cmp38, label %if.then39, label %if.end40

if.then39:                                        ; preds = %if.end36
  call void @abort() noreturn
  unreachable

if.end40:                                         ; preds = %if.end36
  %call41 = call i64 @t6(i32 3, i64 4294967295)
  %cmp42 = icmp ne i64 %call41, 4294967298
  br i1 %cmp42, label %if.then43, label %if.end44

if.then43:                                        ; preds = %if.end40
  call void @abort() noreturn
  unreachable

if.end44:                                         ; preds = %if.end40
  %call45 = call i64 @t7(i32 3, i64 -1)
  %cmp46 = icmp ne i64 %call45, 1532
  br i1 %cmp46, label %if.then47, label %if.end48

if.then47:                                        ; preds = %if.end44
  call void @abort() noreturn
  unreachable

if.end48:                                         ; preds = %if.end44
  %call49 = call i64 @t7(i32 3, i64 4294967295)
  %cmp50 = icmp ne i64 %call49, 4294968828
  br i1 %cmp50, label %if.then51, label %if.end52

if.then51:                                        ; preds = %if.end48
  call void @abort() noreturn
  unreachable

if.end52:                                         ; preds = %if.end48
  %call53 = call i64 @t8(i32 3, i64 -1)
  %cmp54 = icmp ne i64 %call53, 1535
  br i1 %cmp54, label %if.then55, label %if.end56

if.then55:                                        ; preds = %if.end52
  call void @abort() noreturn
  unreachable

if.end56:                                         ; preds = %if.end52
  %call57 = call i64 @t8(i32 3, i64 4294967295)
  %cmp58 = icmp ne i64 %call57, 4294968831
  br i1 %cmp58, label %if.then59, label %if.end60

if.then59:                                        ; preds = %if.end56
  call void @abort() noreturn
  unreachable

if.end60:                                         ; preds = %if.end56
  %call61 = call i64 @t9(i32 3, i64 -1)
  %cmp62 = icmp ne i64 %call61, 1538
  br i1 %cmp62, label %if.then63, label %if.end64

if.then63:                                        ; preds = %if.end60
  call void @abort() noreturn
  unreachable

if.end64:                                         ; preds = %if.end60
  %call65 = call i64 @t9(i32 3, i64 4294967295)
  %cmp66 = icmp ne i64 %call65, 4294968834
  br i1 %cmp66, label %if.then67, label %if.end68

if.then67:                                        ; preds = %if.end64
  call void @abort() noreturn
  unreachable

if.end68:                                         ; preds = %if.end64
  %call69 = call i64 @t10(i32 3, i64 -1)
  %0 = load i64* @gull, align 8
  %mul = mul i64 %0, 3
  %sub = sub i64 %mul, 1
  %cmp70 = icmp ne i64 %call69, %sub
  br i1 %cmp70, label %if.then71, label %if.end72

if.then71:                                        ; preds = %if.end68
  call void @abort() noreturn
  unreachable

if.end72:                                         ; preds = %if.end68
  %call73 = call i64 @t10(i32 3, i64 4294967295)
  %1 = load i64* @gull, align 8
  %mul74 = mul i64 %1, 3
  %add = add i64 %mul74, 4294967295
  %cmp75 = icmp ne i64 %call73, %add
  br i1 %cmp75, label %if.then76, label %if.end77

if.then76:                                        ; preds = %if.end72
  call void @abort() noreturn
  unreachable

if.end77:                                         ; preds = %if.end72
  %call78 = call i64 @t11(i32 3, i64 -1)
  %2 = load i64* @gull, align 8
  %sub79 = sub i64 0, %2
  %mul80 = mul i64 %sub79, 3
  %sub81 = sub i64 %mul80, 1
  %cmp82 = icmp ne i64 %call78, %sub81
  br i1 %cmp82, label %if.then83, label %if.end84

if.then83:                                        ; preds = %if.end77
  call void @abort() noreturn
  unreachable

if.end84:                                         ; preds = %if.end77
  %call85 = call i64 @t11(i32 3, i64 4294967295)
  %3 = load i64* @gull, align 8
  %sub86 = sub i64 0, %3
  %mul87 = mul i64 %sub86, 3
  %add88 = add i64 %mul87, 4294967295
  %cmp89 = icmp ne i64 %call85, %add88
  br i1 %cmp89, label %if.then90, label %if.end91

if.then90:                                        ; preds = %if.end84
  call void @abort() noreturn
  unreachable

if.end91:                                         ; preds = %if.end84
  %4 = load i64* @gull, align 8
  %call92 = call i64 @neg(i64 %4)
  %cmp93 = icmp ne i64 %call92, -100
  br i1 %cmp93, label %if.then94, label %if.end95

if.then94:                                        ; preds = %if.end91
  call void @abort() noreturn
  unreachable

if.end95:                                         ; preds = %if.end91
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %5 = load i32* %retval
  ret i32 %5
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
