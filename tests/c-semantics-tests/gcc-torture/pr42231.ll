; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr42231.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@max = internal global i32 0, align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @CallFunction(i32 (i32)* @callback)
  %0 = load i32* @max, align 4
  %cmp = icmp ne i32 %0, 10
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

define internal i32 @CallFunction(i32 (i32)* %fun) nounwind uwtable {
entry:
  %fun.addr = alloca i32 (i32)*, align 8
  store i32 (i32)* %fun, i32 (i32)** %fun.addr, align 8
  %0 = load i32 (i32)** %fun.addr, align 8
  %call = call i32 @CallFunctionRec(i32 (i32)* %0, i32 1)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %1 = load i32 (i32)** %fun.addr, align 8
  %call1 = call i32 %1(i32 0)
  %tobool2 = icmp ne i32 %call1, 0
  %lnot = xor i1 %tobool2, true
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %2 = phi i1 [ false, %entry ], [ %lnot, %land.rhs ]
  %land.ext = zext i1 %2 to i32
  ret i32 %land.ext
}

define internal i32 @callback(i32 %depth) nounwind uwtable {
entry:
  %depth.addr = alloca i32, align 4
  store i32 %depth, i32* %depth.addr, align 4
  %0 = load i32* %depth.addr, align 4
  call void @storemax(i32 %0)
  %1 = load i32* %depth.addr, align 4
  %cmp = icmp ne i32 %1, 0
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

declare void @abort() noreturn nounwind

define internal void @storemax(i32 %i) nounwind uwtable noinline {
entry:
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  %0 = load i32* %i.addr, align 4
  %1 = load i32* @max, align 4
  %cmp = icmp sgt i32 %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i32* %i.addr, align 4
  store i32 %2, i32* @max, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

define internal i32 @CallFunctionRec(i32 (i32)* %fun, i32 %depth) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %fun.addr = alloca i32 (i32)*, align 8
  %depth.addr = alloca i32, align 4
  store i32 (i32)* %fun, i32 (i32)** %fun.addr, align 8
  store i32 %depth, i32* %depth.addr, align 4
  %0 = load i32 (i32)** %fun.addr, align 8
  %1 = load i32* %depth.addr, align 4
  %call = call i32 %0(i32 %1)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i32* %depth.addr, align 4
  %cmp = icmp slt i32 %2, 10
  br i1 %cmp, label %if.then1, label %if.end3

if.then1:                                         ; preds = %if.end
  %3 = load i32 (i32)** %fun.addr, align 8
  %4 = load i32* %depth.addr, align 4
  %add = add nsw i32 %4, 1
  %call2 = call i32 @CallFunctionRec(i32 (i32)* %3, i32 %add)
  br label %if.end3

if.end3:                                          ; preds = %if.then1, %if.end
  store i32 1, i32* %retval
  br label %return

return:                                           ; preds = %if.end3, %if.then
  %5 = load i32* %retval
  ret i32 %5
}
