; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pta-field-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Foo = type { i32*, i32* }

define void @bar(i32** %x) nounwind uwtable noinline {
entry:
  %x.addr = alloca i32**, align 8
  %f = alloca %struct.Foo*, align 8
  store i32** %x, i32*** %x.addr, align 8
  %0 = load i32*** %x.addr, align 8
  %1 = bitcast i32** %0 to %struct.Foo*
  store %struct.Foo* %1, %struct.Foo** %f, align 8
  %2 = load %struct.Foo** %f, align 8
  %q = getelementptr inbounds %struct.Foo* %2, i32 0, i32 1
  %3 = load i32** %q, align 8
  store i32 0, i32* %3, align 4
  ret void
}

define i32 @foo() nounwind uwtable {
entry:
  %f = alloca %struct.Foo, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 1, i32* %i, align 4
  store i32 2, i32* %j, align 4
  %p = getelementptr inbounds %struct.Foo* %f, i32 0, i32 0
  store i32* %i, i32** %p, align 8
  %q = getelementptr inbounds %struct.Foo* %f, i32 0, i32 1
  store i32* %j, i32** %q, align 8
  %p1 = getelementptr inbounds %struct.Foo* %f, i32 0, i32 0
  call void @bar(i32** %p1)
  %0 = load i32* %j, align 4
  ret i32 %0
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @foo()
  %cmp = icmp ne i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
