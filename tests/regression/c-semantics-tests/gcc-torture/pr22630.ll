; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr22630.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@j = common global i32 0, align 4

define void @bla(i32* %r) nounwind uwtable {
entry:
  %r.addr = alloca i32*, align 8
  %p = alloca i32*, align 8
  %q = alloca i32*, align 8
  store i32* %r, i32** %r.addr, align 8
  %0 = load i32** %r.addr, align 8
  store i32* %0, i32** %q, align 8
  store i32* %0, i32** %p, align 8
  %1 = load i32** %p, align 8
  %tobool = icmp ne i32* %1, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i32* @j, i32** %p, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32** %p, align 8
  %3 = load i32** %q, align 8
  %cmp = icmp ne i32* %2, %3
  br i1 %cmp, label %if.then1, label %if.end2

if.then1:                                         ; preds = %if.end
  store i32 1, i32* @j, align 4
  br label %if.end2

if.end2:                                          ; preds = %if.then1, %if.end
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @bla(i32* null)
  %0 = load i32* @j, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
