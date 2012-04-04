; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20070212-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.f = type { i32 }

define i32 @g(i32 %i, i32 %c, %struct.f* %ff, i32* %p) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %ff.addr = alloca %struct.f*, align 8
  %p.addr = alloca i32*, align 8
  %t = alloca i32*, align 8
  store i32 %i, i32* %i.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  store %struct.f* %ff, %struct.f** %ff.addr, align 8
  store i32* %p, i32** %p.addr, align 8
  %0 = load i32* %c.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32* %i.addr, i32** %t, align 8
  br label %if.end

if.else:                                          ; preds = %entry
  %1 = load %struct.f** %ff.addr, align 8
  %i1 = getelementptr inbounds %struct.f* %1, i32 0, i32 0
  store i32* %i1, i32** %t, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load i32** %p.addr, align 8
  store i32 0, i32* %2, align 4
  %3 = load i32** %t, align 8
  %4 = load i32* %3, align 4
  ret i32 %4
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %f = alloca %struct.f, align 4
  store i32 0, i32* %retval
  %i = getelementptr inbounds %struct.f* %f, i32 0, i32 0
  store i32 1, i32* %i, align 4
  %i1 = getelementptr inbounds %struct.f* %f, i32 0, i32 0
  %call = call i32 @g(i32 5, i32 0, %struct.f* %f, i32* %i1)
  %cmp = icmp ne i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
