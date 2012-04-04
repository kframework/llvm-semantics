; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr33669.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.foo_t = type { i32, i32 }

define i64 @foo(%struct.foo_t* %pxp, i64 %offset, i32 %extent) nounwind uwtable {
entry:
  %retval = alloca i64, align 8
  %pxp.addr = alloca %struct.foo_t*, align 8
  %offset.addr = alloca i64, align 8
  %extent.addr = alloca i32, align 4
  %blkoffset = alloca i64, align 8
  %diff = alloca i32, align 4
  %blkextent = alloca i32, align 4
  store %struct.foo_t* %pxp, %struct.foo_t** %pxp.addr, align 8
  store i64 %offset, i64* %offset.addr, align 8
  store i32 %extent, i32* %extent.addr, align 4
  %0 = load i64* %offset.addr, align 8
  %1 = load i64* %offset.addr, align 8
  %2 = load %struct.foo_t** %pxp.addr, align 8
  %blksz = getelementptr inbounds %struct.foo_t* %2, i32 0, i32 0
  %3 = load i32* %blksz, align 4
  %conv = zext i32 %3 to i64
  %rem = srem i64 %1, %conv
  %sub = sub nsw i64 %0, %rem
  store i64 %sub, i64* %blkoffset, align 8
  %4 = load i64* %offset.addr, align 8
  %5 = load i64* %blkoffset, align 8
  %sub1 = sub nsw i64 %4, %5
  %conv2 = trunc i64 %sub1 to i32
  store i32 %conv2, i32* %diff, align 4
  %6 = load i32* %diff, align 4
  %7 = load i32* %extent.addr, align 4
  %add = add i32 %6, %7
  %8 = load %struct.foo_t** %pxp.addr, align 8
  %blksz3 = getelementptr inbounds %struct.foo_t* %8, i32 0, i32 0
  %9 = load i32* %blksz3, align 4
  %add4 = add i32 %add, %9
  %sub5 = sub i32 %add4, 1
  %10 = load %struct.foo_t** %pxp.addr, align 8
  %blksz6 = getelementptr inbounds %struct.foo_t* %10, i32 0, i32 0
  %11 = load i32* %blksz6, align 4
  %div = udiv i32 %sub5, %11
  %12 = load %struct.foo_t** %pxp.addr, align 8
  %blksz7 = getelementptr inbounds %struct.foo_t* %12, i32 0, i32 0
  %13 = load i32* %blksz7, align 4
  %mul = mul i32 %div, %13
  store i32 %mul, i32* %blkextent, align 4
  %14 = load %struct.foo_t** %pxp.addr, align 8
  %blksz8 = getelementptr inbounds %struct.foo_t* %14, i32 0, i32 0
  %15 = load i32* %blksz8, align 4
  %16 = load i32* %blkextent, align 4
  %cmp = icmp ult i32 %15, %16
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i64 -1, i64* %retval
  br label %return

if.end:                                           ; preds = %entry
  %17 = load %struct.foo_t** %pxp.addr, align 8
  %bf_cnt = getelementptr inbounds %struct.foo_t* %17, i32 0, i32 1
  %18 = load i32* %bf_cnt, align 4
  %19 = load %struct.foo_t** %pxp.addr, align 8
  %blksz10 = getelementptr inbounds %struct.foo_t* %19, i32 0, i32 0
  %20 = load i32* %blksz10, align 4
  %cmp11 = icmp ugt i32 %18, %20
  br i1 %cmp11, label %if.then13, label %if.end16

if.then13:                                        ; preds = %if.end
  %21 = load %struct.foo_t** %pxp.addr, align 8
  %blksz14 = getelementptr inbounds %struct.foo_t* %21, i32 0, i32 0
  %22 = load i32* %blksz14, align 4
  %23 = load %struct.foo_t** %pxp.addr, align 8
  %bf_cnt15 = getelementptr inbounds %struct.foo_t* %23, i32 0, i32 1
  store i32 %22, i32* %bf_cnt15, align 4
  br label %if.end16

if.end16:                                         ; preds = %if.then13, %if.end
  %24 = load i64* %blkoffset, align 8
  store i64 %24, i64* %retval
  br label %return

return:                                           ; preds = %if.end16, %if.then
  %25 = load i64* %retval
  ret i64 %25
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca %struct.foo_t, align 4
  %xx = alloca i64, align 8
  store i32 0, i32* %retval
  %blksz = getelementptr inbounds %struct.foo_t* %x, i32 0, i32 0
  store i32 8192, i32* %blksz, align 4
  %bf_cnt = getelementptr inbounds %struct.foo_t* %x, i32 0, i32 1
  store i32 0, i32* %bf_cnt, align 4
  %call = call i64 @foo(%struct.foo_t* %x, i64 0, i32 4096)
  store i64 %call, i64* %xx, align 8
  %0 = load i64* %xx, align 8
  %cmp = icmp ne i64 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
