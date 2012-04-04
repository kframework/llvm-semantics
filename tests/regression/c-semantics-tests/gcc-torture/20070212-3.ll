; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20070212-3.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.foo = type { i32, i32 }

define i32 @bar(%struct.foo* %k, i32 %k2, i32 %f, i32 %f2) nounwind uwtable {
entry:
  %k.addr = alloca %struct.foo*, align 8
  %k2.addr = alloca i32, align 4
  %f.addr = alloca i32, align 4
  %f2.addr = alloca i32, align 4
  %p = alloca i32*, align 8
  %q = alloca i32*, align 8
  %res = alloca i32, align 4
  store %struct.foo* %k, %struct.foo** %k.addr, align 8
  store i32 %k2, i32* %k2.addr, align 4
  store i32 %f, i32* %f.addr, align 4
  store i32 %f2, i32* %f2.addr, align 4
  %0 = load i32* %f.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load %struct.foo** %k.addr, align 8
  %i = getelementptr inbounds %struct.foo* %1, i32 0, i32 0
  store i32* %i, i32** %p, align 8
  br label %if.end

if.else:                                          ; preds = %entry
  %2 = load %struct.foo** %k.addr, align 8
  %j = getelementptr inbounds %struct.foo* %2, i32 0, i32 1
  store i32* %j, i32** %p, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32** %p, align 8
  %4 = load i32* %3, align 4
  store i32 %4, i32* %res, align 4
  %5 = load %struct.foo** %k.addr, align 8
  %i1 = getelementptr inbounds %struct.foo* %5, i32 0, i32 0
  store i32 1, i32* %i1, align 4
  %6 = load i32* %f2.addr, align 4
  %tobool2 = icmp ne i32 %6, 0
  br i1 %tobool2, label %if.then3, label %if.else4

if.then3:                                         ; preds = %if.end
  %7 = load i32** %p, align 8
  store i32* %7, i32** %q, align 8
  br label %if.end5

if.else4:                                         ; preds = %if.end
  store i32* %k2.addr, i32** %q, align 8
  br label %if.end5

if.end5:                                          ; preds = %if.else4, %if.then3
  %8 = load i32* %res, align 4
  %9 = load i32** %q, align 8
  %10 = load i32* %9, align 4
  %add = add nsw i32 %8, %10
  ret i32 %add
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %k = alloca %struct.foo, align 4
  store i32 0, i32* %retval
  %i = getelementptr inbounds %struct.foo* %k, i32 0, i32 0
  store i32 0, i32* %i, align 4
  %j = getelementptr inbounds %struct.foo* %k, i32 0, i32 1
  store i32 1, i32* %j, align 4
  %call = call i32 @bar(%struct.foo* %k, i32 1, i32 1, i32 1)
  %cmp = icmp ne i32 %call, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
